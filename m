From: Yair Ben Avraham <yairba@tkos.co.il>
Date: Wed, 29 Aug 2018 11:47:37 +0300
Subject: [Buildroot] [PATCH 1/1] encfs: new package
In-Reply-To: <87efehya1l.fsf@tkos.co.il>
References: <1535517151-26179-1-git-send-email-yairba@tkos.co.il>
 <87efehya1l.fsf@tkos.co.il>
Message-ID: <1535532457.29191.12.camel@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

I will post a second version of the patch. Two questions below,

On Wed, 2018-08-29 at 09:13 +0300, Baruch Siach wrote:
> Yair Ben Avraham writes:
> > 
> > EncFS: an Encrypted Filesystem for FUSE.
> > Signed-off-by: Yair Ben Avraham <yairba@tkos.co.il>
> You should add an empty line before the sign-off line.
> 
> > 
> > ---
> > ?package/Config.in??????????????????????????????????|??1 +
> > ?...Remove-make-j2-unittests-test-integration.patch | 33
> > +++++++++++++++++++++
> > ?package/encfs/Config.in????????????????????????????| 24
> > +++++++++++++++
> > ?package/encfs/encfs.hash???????????????????????????|??7 +++++
> > ?package/encfs/encfs.mk?????????????????????????????| 34
> > ++++++++++++++++++++++
> > ?5 files changed, 99 insertions(+)
> > ?create mode 100644 package/encfs/0001-Remove-make-j2-unittests-
> > test-integration.patch
> > ?create mode 100644 package/encfs/Config.in
> > ?create mode 100644 package/encfs/encfs.hash
> > ?create mode 100644 package/encfs/encfs.mk
> > 
> > diff --git a/package/Config.in b/package/Config.in
> > index f5a1749..768d182 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -181,6 +181,7 @@ menu "Filesystem and flash utilities"
> > ?	source "package/e2fsprogs/Config.in"
> > ?	source "package/e2tools/Config.in"
> > ?	source "package/ecryptfs-utils/Config.in"
> > +	source "package/encfs/Config.in"
> > ?	source "package/exfat/Config.in"
> > ?	source "package/exfat-utils/Config.in"
> > ?	source "package/f2fs-tools/Config.in"
> > diff --git a/package/encfs/0001-Remove-make-j2-unittests-test-
> > integration.patch b/package/encfs/0001-Remove-make-j2-unittests-
> > test-integration.patch
> > new file mode 100644
> > index 0000000..c6730d8
> > --- /dev/null
> > +++ b/package/encfs/0001-Remove-make-j2-unittests-test-
> > integration.patch
> > @@ -0,0 +1,33 @@
> > +From b0b6cb0bfd61fd947d3d6e69708688b753849102 Mon Sep 17 00:00:00
> > 2001
> > +From: Yair Ben Avraham <yairba@tkos.co.il>
> > +Date: Tue, 28 Aug 2018 21:30:56 +0300
> > +Subject: [PATCH 1/1] Remove make {-j2, unittests, test,
> > integration}
> > +
> > +Signed-off-by: Yair Ben Avraham <yairba@tkos.co.il>
> > +---
> > + build.sh | 11 +----------
> > + 1 file changed, 1 insertion(+), 10 deletions(-)
> > +
> > +diff --git a/build.sh b/build.sh
> > +index b10107c..74925a3 100755
> > +--- a/build.sh
> > ++++ b/build.sh
> > +@@ -22,14 +22,5 @@ fi
> > +
> > + cd build
> > + ${CMAKE} .. ${CFG}
> > +-make -j2
> > +-make unittests
> > +-make test
> > +-if [[ "$INTEGRATION" == "true" ]]; then
> > +-??make integration
> > +-fi
> > +-
> > + cd ..
> > +-
> > +-echo
> > +-echo 'Everything looks good, you can install via "make install -C
> > build".'
> > ++make
> > +--
> > +2.7.4
> > +
> > diff --git a/package/encfs/Config.in b/package/encfs/Config.in
> > new file mode 100644
> > index 0000000..a56ef48
> > --- /dev/null
> > +++ b/package/encfs/Config.in
> > @@ -0,0 +1,24 @@
> > +config BR2_PACKAGE_ENCFS
> > +	bool "encfs"
> > +	depends on BR2_USE_WCHAR
> > +	depends on BR2_TOOLCHAIN_HAS_THREADS
> > +	depends on BR2_USE_MMU
> > +	depends on !BR2_STATIC_LIBS
> > +	depends on BR2_PACKAGE_HOST_CMAKE
> Should not be needed. The cmake package infrastructure automatically
> builds host-cmake if there is no suitable host installed cmake.
> 
> > 
> > +	depends on BR2_TOOLCHAIN_BUILDROOT_CXX
> This is only enabled for the internal toolchain. Use the
> BR2_INSTALL_LIBSTDCPP dependency instead to cover both internal and
> external toolchains.
> 
> > 
> > +	select BR2_PACKAGE_OPENSSL
> > +	select BR2_PACKAGE_LIBFUSE
> > +	select BR2_PACKAGE_LIBGLIB2
> You do not add libglib2 to the package _DEPENDENCIES. Is that
> intended?
> If so, please explain in a comment.
> 
> > 
> > +	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
> Same here.
> 
> > 
> > +	help
> > +	??EncFS is an Encrypted Filesystem for FUSE. EncFS
> > provides an encrypted
> > +	??filesystem in user-space. It runs in userspace, using
> > the FUSE library
> > +	??for the filesystem interface.
> The first sentence looks redundant to me.
> 
> > 
> > +
> > +	??https://github.com/vgough/encfs
> > +
> > +comment "encfs needs a toolchain w/ wchar, threads, dynamic
> > library"
> You need to mention C++ as well...
> 
> > 
> > +	depends on BR2_USE_MMU
> > +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS ||
> > BR2_STATIC_LIBS
> ... and add !BR2_INSTALL_LIBSTDCPP here.
> 
> > 
> > +	depends on BR2_PACKAGE_HOST_CMAKE
> > +	depends on BR2_TOOLCHAIN_BUILDROOT_CXX
> These dependencies should not be needed. They effectively hide the
> comment that we want to show.
> 
> > 
> > diff --git a/package/encfs/encfs.hash b/package/encfs/encfs.hash
> > new file mode 100644
> > index 0000000..73aa4c3
> > --- /dev/null
> > +++ b/package/encfs/encfs.hash
> > @@ -0,0 +1,7 @@
> > +# Locally calculated after checking pgp signature
> > +sha256	3cc9d8fb3592319d7c50ae968e7e2a7c4b4463e1e5421c6c6d5e
> > f9a1ac27a2a2	encfs-1.9.5.zip
> Which signature have you checked? I could not find a signature for
> the
> zip archive.
> 
> If you use the tarball (see below), please add a reference to the
> signature URL in the comment.
> 
> > 
> > +# Hash for license files:
> > +sha256	fdba14f0ecddd3e6d31a76177045d99df90070e6377967fdbfbc
> > 616166e0dcce	COPYING
> > +sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7
> > c545eb65b903	COPYING.GPL
> > +sha256	da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b03
> > 7520b4464768	COPYING.LGPL
> > diff --git a/package/encfs/encfs.mk b/package/encfs/encfs.mk
> > new file mode 100644
> > index 0000000..8147188
> > --- /dev/null
> > +++ b/package/encfs/encfs.mk
> > @@ -0,0 +1,34 @@
> > +##################################################################
> > ##############
> > +#
> > +# encfs
> > +#
> > +##################################################################
> > ##############
> > +
> > +ENCFS_VERSION = 1.9.5
> > +ENCFS_SOURCE = encfs-$(ENCFS_VERSION).zip
> > +ENCFS_SITE = $(call github,vgough,encfs,v$(ENCFS_VERSION))
> Upstream provides a proper tarball:
> 
> ? https://github.com/vgough/encfs/releases/download/v1.9.5/encfs-1.9.
> 5.tar.gz
> 
> Please use that instead of the github helper.

tarball is prior to zip archive with github helper?

> > +ENCFS_LICENSE = LGPL (libencfs), GPL, MIT (easylogging++), Zlib
> > (tinyxml2)
> Please use the Buildroot tinyxml2 package. You can set the
> USE_INTERNAL_TINYXML cmake variable to OFF.
> 
> > 
> > +ENCFS_LICENSE_FILES = COPYING COPYING.GPL COPYING.LGPL
> > +ENCFS_DEPENDENCIES = \
> > +	libfuse openssl
> > +
> > +define ENCFS_EXTRACT_CMDS
> > +????????$(UNZIP) -d $(BUILD_DIR) $(ENCFS_DL_DIR)/$(ENCFS_SOURCE)
> > +endef
> Not needed if you use the tarball.
> 
> > 
> > +
> > +define ENCFS_BUILD_CMDS
> > +????????(cd $(@D) && $(TARGET_MAKE_ENV) ./build.sh)
> > +endef
> > +
> > +define ENCFS_INSTALL_CMDS
> > +????????(cd $(@D) && make install)
> > +endef
> Why cant use use the default cmake build and install rules? Please
> explain in a comment and in the commit log. In case these special
> rules
> are not needed, you can drop the build.sh patch as well.
> 
> > 
> > +ENCFS_CONF_OPTS += \
> > +????????-DFUSE_INCLUDE_DIR=$(BUILD_DIR)/libfuse* \
> You should point to the Buildroot staging directory.
> 
> > 
> > +????????-DCMAKE_CROSSCOMPILING=1 \
> Why is this needed?
> 
> > 
> > +????????-DRUNTIME_OUTPUT_DIRECTORY=$(BUILD_DIR) \
> > +????????-DCMAKE_RUNTIME_OUTPUT_DIRECTORY=$(BUILD_DIR)/usr/bin \
> These are only used for the bundled libxml2. If you use the Buildroot
> package, this would not be needed.

If not using the above *RUNTIME_OUTPUT_DIRECTORY variables, I'm getting
during linking the CXX executables:
arm-buildroot-linux-uclibcgnueabihf/bin/ld: cannot open output file
encfs: Is a directory

Yair
> > +????????-DBUILD_UNIT_TESTS=0
> > +
> > +$(eval $(cmake-package))
> baruch
> 
> --
> ?????http://baruch.siach.name/blog/??????????????????~. .~???Tk Open
> Systems
> =}------------------------------------------------ooO--U--Ooo------
> ------{=
> ???- baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il
>  -
-- 
Yair Ben-Avraham
Tk Open Systems Ltd.
052-343-2297
yairba at tkos.co.il
