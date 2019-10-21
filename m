From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 21 Oct 2019 13:04:33 -0700
Subject: [Buildroot] [PATCH v14 0/5] gobject-introspection: New package
Message-ID: <20191021200438.97453-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Included in version 14 of the gobject-introspection patch series.
The patch series is almost identical with V13 except for one 
significant change:

With permission from Arnout I have included the patch:
package/pkg-meson.mk: set Python sysconfigdata
However; the patch has one big flaw I would like to discuss:

The patch breaks libglib2 if a target-python is not selected or is not yet
built and installed before building target libglib2. Indeed, it would be
because we would pass _PYTHON_SYSCONFIGDATA_NAME="" as an environment
variable, which leads to the following error during libglib2-configure:
meson.build:1978:0: ERROR: <ExternalProgram 'python3' -> ['output/host/bin/python3']> is not a valid python or it is missing setuptools

However, I do believe the patch is a better direction to go than the previous
patch: package/meson: prevent python include path manipulation for two
significant reasons:

1) Meson does not have to be patched.
2) It fixes the suffix of built python applications that use meson
   (such as newer versions of python-gobject.) With the old patch, the suffix
   of the python libraries is -x86-64 even though the binaries themselves would
   be the target architecture, which causes import errors on the target. With
   this patch, the suffix is correct.
   
I propose keeping the patch but modifying it to work correctly if the
target-python isn't selected or isn't yet built. I need help however with this
as I am not great with makefile syntax this complex.

Thanks!

Adam


Adam Duskett (5):
  package/libiberty: new package
  package/prelink-cross: new package
  package/gdb: depend on libiberty
  package/pkg-meson.mk: set Python sysconfigdata
  package/gobject-introspection: new package

 DEVELOPERS                                    |   3 +
 package/Config.in                             |   1 +
 package/gdb/gdb.mk                            |   4 +-
 ...lete-upstream-attempt-at-cross-compi.patch |  33 ++++
 ...d-cross-compilation-support-to-meson.patch | 163 ++++++++++++++++++
 ...d-disable-tests-when-cross-compiling.patch |  27 +++
 ...canner-add-use-binary-wrapper-option.patch |  52 ++++++
 ...scanner-add-a-use-ldd-wrapper-option.patch |  48 ++++++
 ...scanner-add-a-lib-dirs-envvar-option.patch |  73 ++++++++
 .../0007-Add-rpath-links-to-ccompiler.patch   |  29 ++++
 ...-error-return-codes-from-ldd-wrapper.patch |  28 +++
 package/gobject-introspection/Config.in       |  26 +++
 .../gobject-introspection/g-ir-compiler.in    |   2 +
 .../g-ir-scanner-lddwrapper.in                |   2 +
 .../g-ir-scanner-qemuwrapper.in               |  17 ++
 package/gobject-introspection/g-ir-scanner.in |   7 +
 .../gobject-introspection.hash                |   4 +
 .../gobject-introspection.mk                  | 103 +++++++++++
 package/libiberty/libiberty.hash              |   2 +
 package/libiberty/libiberty.mk                |  27 +++
 package/pkg-meson.mk                          |   3 +
 package/prelink-cross/prelink-cross.hash      |   3 +
 package/prelink-cross/prelink-cross.mk        |  16 ++
 23 files changed, 672 insertions(+), 1 deletion(-)
 create mode 100644 package/gobject-introspection/0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch
 create mode 100644 package/gobject-introspection/0002-add-cross-compilation-support-to-meson.patch
 create mode 100644 package/gobject-introspection/0003-meson.build-disable-tests-when-cross-compiling.patch
 create mode 100644 package/gobject-introspection/0004-giscanner-add-use-binary-wrapper-option.patch
 create mode 100644 package/gobject-introspection/0005-giscanner-add-a-use-ldd-wrapper-option.patch
 create mode 100644 package/gobject-introspection/0006-giscanner-add-a-lib-dirs-envvar-option.patch
 create mode 100644 package/gobject-introspection/0007-Add-rpath-links-to-ccompiler.patch
 create mode 100644 package/gobject-introspection/0008-ignore-error-return-codes-from-ldd-wrapper.patch
 create mode 100644 package/gobject-introspection/Config.in
 create mode 100644 package/gobject-introspection/g-ir-compiler.in
 create mode 100644 package/gobject-introspection/g-ir-scanner-lddwrapper.in
 create mode 100644 package/gobject-introspection/g-ir-scanner-qemuwrapper.in
 create mode 100644 package/gobject-introspection/g-ir-scanner.in
 create mode 100644 package/gobject-introspection/gobject-introspection.hash
 create mode 100644 package/gobject-introspection/gobject-introspection.mk
 create mode 100644 package/libiberty/libiberty.hash
 create mode 100644 package/libiberty/libiberty.mk
 create mode 100644 package/prelink-cross/prelink-cross.hash
 create mode 100644 package/prelink-cross/prelink-cross.mk

-- 
2.21.0
