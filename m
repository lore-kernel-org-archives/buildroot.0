From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Mar 2021 19:36:19 +0100
Subject: [Buildroot] [git commit] package/opkg-utils: add opkg-utils as
 target pkg
Message-ID: <20210314181537.7172787C79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b9bf1c6535cbe8236bc348fe3ea1b20acbf996f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Supports a use case of building container rootfs images where a matching
target version of the tools is required for repackaging of a installer
archive.

binutils binaries are needed for 'ar'; binutils does not work on nios2,
but busybox does, and so we can have 'ar' on nios2 with busybox.

A few other compressors can be used besides gzip, but the default in the
scripts is gzip, so we only ensure this one is enabled. Users who want
other compressors will have to enable them in their configurations.

Note: the order of 'select' is not strictly alphabetical: all packages
provided by busybox applets have been grouped together at the top, with
packages never provided by busybox applets together at the end.

Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
[yann.morin.1998 at free.fr:
  - only select full-blown packages if busybox is not enabled
  - select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS, instead of 'depends on'
  - allow on nios2 when busybox is enabled
  - add binutils binaries on target (for 'ar')
  - drop _DEPENDENCIES: they all are only runtime-dpeendencies
  - add comment when python(2) is enabled
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in                |  1 +
 package/opkg-utils/Config.in     | 34 ++++++++++++++++++++++++++++++++++
 package/opkg-utils/opkg-utils.mk |  6 ++++++
 3 files changed, 41 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 9a2596e729..7e2e8430fb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2339,6 +2339,7 @@ comment "See the manual:                                        "
 comment "http://buildroot.org/manual.html#faq-no-binary-packages"
 comment "-------------------------------------------------------"
 	source "package/opkg/Config.in"
+	source "package/opkg-utils/Config.in"
 	source "package/rpm/Config.in"
 endmenu
 
diff --git a/package/opkg-utils/Config.in b/package/opkg-utils/Config.in
new file mode 100644
index 0000000000..3c5a3ee347
--- /dev/null
+++ b/package/opkg-utils/Config.in
@@ -0,0 +1,34 @@
+config BR2_PACKAGE_OPKG_UTILS
+	bool "opkg-utils"
+	depends on !BR2_nios2 || BR2_PACKAGE_BUSYBOX # binutils
+	depends on BR2_USE_MMU # bash, python3
+	depends on BR2_USE_WCHAR # python3
+	depends on BR2_TOOLCHAIN_HAS_THREADS # python3 <- libffi
+	depends on !BR2_STATIC_LIBS # python3
+	depends on !BR2_PACKAGE_PYTHON # python3
+	select BR2_PACKAGE_BINUTILS if !BR2_PACKAGE_BUSYBOX # runtime
+	select BR2_PACKAGE_BINUTILS_TARGET if !BR2_PACKAGE_BUSYBOX # runtime
+	select BR2_PACKAGE_COREUTILS if !BR2_PACKAGE_BUSYBOX # runtime
+	select BR2_PACKAGE_DIFFUTILS if !BR2_PACKAGE_BUSYBOX # runtime
+	select BR2_PACKAGE_FINDUTILS if !BR2_PACKAGE_BUSYBOX # runtime
+	select BR2_PACKAGE_GREP if !BR2_PACKAGE_BUSYBOX # runtime
+	select BR2_PACKAGE_GZIP if !BR2_PACKAGE_BUSYBOX # runtime
+	select BR2_PACKAGE_SED if !BR2_PACKAGE_BUSYBOX # runtime
+	select BR2_PACKAGE_TAR if !BR2_PACKAGE_BUSYBOX # runtime
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
+	select BR2_PACKAGE_BASH # runtime
+	select BR2_PACKAGE_PYTHON3 # runtime
+	help
+	  Helper scripts for use with the opkg package manager.
+
+	  https://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/
+
+comment "opkg-utils needs a toolchain w/ wchar, threads, dynamic library"
+	depends on !BR2_nios2 || BR2_PACKAGE_BUSYBOX
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+
+comment "opkg-utils needs python3"
+	depends on !BR2_nios2 || BR2_PACKAGE_BUSYBOX
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_PYTHON
diff --git a/package/opkg-utils/opkg-utils.mk b/package/opkg-utils/opkg-utils.mk
index 19dfb26f7a..cdffd6f1c4 100644
--- a/package/opkg-utils/opkg-utils.mk
+++ b/package/opkg-utils/opkg-utils.mk
@@ -16,9 +16,15 @@ HOST_OPKG_UTILS_DEPENDENCIES = \
 	host-lz4 \
 	host-xz
 
+# Nothing to build; only scripts to install.
+define OPKG_UTILS_INSTALL_CMDS
+	$(MAKE) -C $(@D) PREFIX=$(TARGET_DIR) install-utils
+endef
+
 # Nothing to build; only scripts to install.
 define HOST_OPKG_UTILS_INSTALL_CMDS
 	$(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install-utils
 endef
 
+$(eval $(generic-package))
 $(eval $(host-generic-package))
