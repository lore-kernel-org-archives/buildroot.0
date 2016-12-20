From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue, 20 Dec 2016 14:46:17 +0100
Subject: [Buildroot] [PATCH v5 00/19] Reproducible builds
Message-ID: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series try to continue work initiated by Gilles Chanteperdrix:
  http://lists.busybox.net/pipermail/buildroot/2016-April/thread.html#160064
  http://lists.busybox.net/pipermail/buildroot/2016-June/thread.html#163905

I dropped some patchs from original series because either:
  - I handled things differently (timestamps in images, support SOURCE_DATE_EPOCH
    in gcc, ...)
  - I didn't had time to test them them (sysroot, cpio, cdrkit, iso9660,...)
  - They doesn't seems necessary anymore (libtool, libgcrypt, libgpg-error, ...)

There are many changes since previous version. While earlier versions focus on
timestamps, v5 allows to make reproducible build even using different build
path. In particular it remove rpaths from ELF generated with libtool.

This series is divided in two parts:
  - patches 1 to 8 only concern timestamps
  - patches 9 to 19 only concern build path

Mainly cosmetics changes has been made on patches imported from v4.  I
respinned v4 on top of master. Commit log has been improved for patches 5 to 7.

I added patch 8 where I now detect common patterns that break reproducibility
(`uname -n`, `uname -r`, etc...).

I temporary dropped patch that disable build-id for kernel. When build paths are
identical, build-id are also identical. When build paths are different, build-id
are sometime different, but I did not yet identified exact origin (maybe
-fdebug-prefix-map= would be sufficient to solve problem).

In add, for other packages I noticed that symbol table contains absolute path
to some objects:

    $ arm-linux-objdump -t col | grep crt
    00000000 l    df *ABS*  00000000     /[...]/host/usr/arm-buildroot-linux-gnueabi/sysroot/lib/crti.o
    00000000 l    df *ABS*  00000000     /[...]/host/usr/arm-buildroot-linux-gnueabi/sysroot/lib/crtn.o

Symbol tables are not a problem them self, but they imply unreproducible
build-id. I think I could pass "-Wl,-x" to compiler to remove these
occurrences, but I have not yet evaluated all impacts of this solution. So,
I just postpone this problem.


Patches 11 to 19 are nearly a series in the series. Until now, most of binaries
installed by libtool was configured with RPATH pointingto their build
directory. Indeed, libtool add this path during compilation in order to be able
to execute them directly from build directory. This path should normally
removed during install, but Buildroot disable this behavior (patch 15). Simply
re-enabling this behavior does not work. Indeed, during relink, libtool try to
use .la that are not yet patched and fail to find libraries. On another side,
libtool support usage of a sysroot since v1.5. To enable this support, we have
to keep original values from .la file (patch 12 and 13) and inform libtool we
are using a sysroot (patch 11).

Patch 14 fix a small incompatibility with unsafe path detection.

Since libtool is now correctly used, it is not more necessary to disable
install directory sanity check (patch 17).

From libtool point of view, sysroot is not reachable from $(TARGET_DIR). So,
during installation to $(TARGET_DIR), it add an entry in RPATH that point to
$(STAGING_DIR). To fix this problem, we just have to inform libtool that
$(STAGING_DIR) is reachable (patch 16).

Finally, I also clean up libtool infra from modification that seems useless now
(patches 18 and 19).

I tested this series using internal toolchain and Linaro toolchain with these
packages:

    BR2_INIT_SYSTEMD=y       (install public libraries in /usr/lib/systemd)
    BR2_PACKAGE_LIBCDAUDIO=y (libtool 1.5)
    BR2_PACKAGE_LIBLO=y      (libtool 2.2)
    BR2_PACKAGE_MADPLAY=y    (unpatched libtool)
    BR2_PACKAGE_ALSA_LIB=y   (optional dependency to Madplay)
    BR2_PACKAGE_PYTHON=y
    BR2_PACKAGE_PYTHON_PY_PYC=y
    BR2_PACKAGE_GNUPG2=y

Except patches 12 and 13, I think whole series is bisectable.

Known issues that break reproducibility:
  - Use of lzop (it unconditionally include timestamps in result)
  - Since we build our own toolchain and toolchain include BR2_FULL_VERSION,
    ccache is incompatible with reproducible
  - Some external toolchains (Linaro for exemple) enable build-id by default.
  - Build path appears in symbol tables. So TARGET_DIR must be striped even if
    it was not built with debug infos.
  - Linux kernel shouldn't be built with CONFIG_DEBUG_INFO, else build-id will
    differ.
  - sysconfigdata.py provided by Python contains build path
  - Some libraries (libassuan, ksba, libxml2, libxslt, ...) install
    configurations scripts (that contain build path) on target.


J?r?me Pouiller (19):
  reproducible: fix DATE/TIME macros in toolchain-wrapper
  fakedate: new package
  core: do not reset DEPENDENCIES_HOST_PREREQ in dependencies.mk
  reproducible: enable fakedate
  pycompile: allow to force compilation
  python2: generate reproducible .pyc
  python3: generate reproducible .pyc
  reproducible: try to detect most common errors
  python2: remove full path from .pyc
  python3: remove full path from .pyc
  infra-libtool: pass sysroot information to libtool
  infra-libtool: no longer prepend STAGING_DIR to libdir
  infra-libtool: correctly prefix $libdir with $STAGING_DIR
  infra-libtool: drop original $libdir (i.e. /usr/lib) from library
    paths
  infra-libtool: relink binaries on install
  infra-libtool: inform libtool that STAGING_DIR is reachable at runtime
  infra-libtool: no longer disable install directory sanity check
  infra-libtool: remove workaround for calls without `--tag'
  infra-libtool: no longer force sys_lib_search_path

 Makefile                                       |  6 ++
 package/Makefile.in                            |  2 +-
 package/fakedate/fakedate                      | 59 +++++++++++++++++
 package/fakedate/fakedate.mk                   | 15 +++++
 package/pkg-autotools.mk                       |  1 +
 package/pkg-generic.mk                         | 11 ----
 package/python/python.mk                       | 15 ++++-
 package/python3/python3.mk                     | 15 ++++-
 support/dependencies/dependencies.mk           |  2 -
 support/libtool/buildroot-libtool-v1.5.patch   | 85 ++++++-------------------
 support/libtool/buildroot-libtool-v2.2.patch   | 88 +++++++-------------------
 support/libtool/buildroot-libtool-v2.4.4.patch | 63 ++++--------------
 support/libtool/buildroot-libtool-v2.4.patch   | 62 ++++--------------
 support/scripts/pycompile.py                   | 11 +++-
 toolchain/toolchain-wrapper.c                  | 74 +++++++++++++++++++++-
 15 files changed, 255 insertions(+), 254 deletions(-)
 create mode 100755 package/fakedate/fakedate
 create mode 100644 package/fakedate/fakedate.mk

-- 
1.9.1
