From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jun 2017 23:22:03 +0200
Subject: [Buildroot] [git commit] refpolicy: new package
Message-ID: <20170606212224.069E2822C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb442abdf18d6a4673ffa1f19e2a62f36c5d3038
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch is for adding selinux reference policy (refpolicy).
It is a complete SELinux policy that can be used as the system policy
for a variety of systems and used as the basis for creating other policies.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Tested-by: Matt Weber  <matthew.weber@rockwellcollins.com>
Acked-by: Matt Weber  <matthew.weber@rockwellcollins.com>
[Thomas:
 - add entry to DEVELOPERS file
 - remove redundant dependencies
 - drop unused REFPOLICY_PYINC option
 - use SPDX tag for license
 - minor formatting fixes.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/refpolicy/Config.in      | 35 +++++++++++++++++++++++++++
 package/refpolicy/refpolicy.hash |  2 ++
 package/refpolicy/refpolicy.mk   | 51 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 90 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 048789c..1e87d3a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -39,6 +39,7 @@ F:	package/libsepol/
 F:	package/nginx-naxsi/
 F:	package/policycoreutils/
 F:	package/python-mutagen/
+F:	package/refpolicy/
 F:	package/sepolgen/
 F:	package/setools/
 F:	package/sngrep/
diff --git a/package/Config.in b/package/Config.in
index c464618..e00b162 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1765,6 +1765,7 @@ endmenu
 menu "Security"
 	source "package/checkpolicy/Config.in"
 	source "package/policycoreutils/Config.in"
+	source "package/refpolicy/Config.in"
 	source "package/sepolgen/Config.in"
 	source "package/setools/Config.in"
 endmenu
diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
new file mode 100644
index 0000000..bcc74d4
--- /dev/null
+++ b/package/refpolicy/Config.in
@@ -0,0 +1,35 @@
+config BR2_PACKAGE_REFPOLICY
+	bool "refpolicy"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # policycoreutils
+	depends on BR2_TOOLCHAIN_USES_GLIBC # policycoreutils
+	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS # policycoreutils
+	depends on !BR2_STATIC_LIBS # policycoreutils
+	depends on !BR2_arc # policycoreutils
+	select BR2_PACKAGE_POLICYCOREUTILS
+	select BR2_PACKAGE_BUSYBOX_SELINUX if BR2_PACKAGE_BUSYBOX
+	help
+	  The SELinux Reference Policy project (refpolicy) is a
+	  complete SELinux policy that can be used as the system
+	  policy for a variety of systems and used as the basis for
+	  creating other policies. Reference Policy was originally
+	  based on the NSA example policy, but aims to accomplish many
+	  additional goals.
+
+	  The current refpolicy does not fully support Buildroot and
+	  needs modifications to work with the default system file
+	  layout. These changes should be added as patches to the
+	  refpolicy that modify a single SELinux policy.
+
+	  The refpolicy works for the most part in permissive
+	  mode. Only the basic set of utilities are enabled in the
+	  example policy config and some of the pathing in the
+	  policies is not correct.  Individual policies would need to
+	  be tweaked to get everything functioning properly.
+
+	  https://github.com/TresysTechnology/refpolicy
+
+comment "refpolicy needs a glibc toolchain w/ threads, dynamic library"
+	depends on !BR2_arc
+	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/refpolicy/refpolicy.hash b/package/refpolicy/refpolicy.hash
new file mode 100644
index 0000000..7aeac41
--- /dev/null
+++ b/package/refpolicy/refpolicy.hash
@@ -0,0 +1,2 @@
+#From https://github.com/TresysTechnology/refpolicy/wiki/DownloadRelease
+sha256 08f9e2afc5e4939c23e56deeec7c47da029d7b85d82fb4ded01a36eb5da0651e  refpolicy-RELEASE_2_20170204.tar.gz
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
new file mode 100644
index 0000000..9a1d6da
--- /dev/null
+++ b/package/refpolicy/refpolicy.mk
@@ -0,0 +1,51 @@
+################################################################################
+#
+# refpolicy
+#
+################################################################################
+
+REFPOLICY_VERSION = RELEASE_2_20170204
+
+# Do not use GitHub helper as git submodules are needed for refpolicy-contrib
+REFPOLICY_SITE = https://github.com/TresysTechnology/refpolicy.git
+REFPOLICY_SITE_METHOD = git
+REFPOLICY_GIT_SUBMODULES = y # Required for refpolicy-contrib
+REFPOLICY_LICENSE = GPL-2.0
+REFPOLICY_LICENSE_FILES = COPYING
+REFPOLICY_INSTALL_STAGING = YES
+REFPOLICY_DEPENDENCIES = \
+	host-m4 \
+	host-checkpolicy \
+	host-policycoreutils \
+	host-setools \
+	host-gawk \
+	host-python \
+	policycoreutils
+
+# Cannot use multiple threads to build the reference policy
+REFPOLICY_MAKE = \
+	TEST_TOOLCHAIN=$(HOST_DIR) \
+	PYTHON="$(HOST_DIR)/usr/bin/python2" \
+	$(TARGET_MAKE_ENV) \
+	$(MAKE1)
+
+define REFPOLICY_CONFIGURE_CMDS
+	$(SED) "/OUTPUT_POLICY/c\OUTPUT_POLICY = 30" $(@D)/build.conf
+	$(SED) "/MONOLITHIC/c\MONOLITHIC = y" $(@D)/build.conf
+	$(SED) "/NAME/c\NAME = targeted" $(@D)/build.conf
+endef
+
+define REFPOLICY_BUILD_CMDS
+	$(REFPOLICY_MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) bare conf
+endef
+
+define REFPOLICY_INSTALL_STAGING_CMDS
+	$(REFPOLICY_MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) \
+		install-src install-headers
+endef
+
+define REFPOLICY_INSTALL_TARGET_CMDS
+	$(REFPOLICY_MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
