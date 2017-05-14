From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 14 May 2017 13:21:55 -0400
Subject: [Buildroot] [PATCH v2 1/3] refpolicy: new package
In-Reply-To: <20170514172157.1780-1-Adamduskett@outlook.com>
References: <20170514172157.1780-1-Adamduskett@outlook.com>
Message-ID: <20170514172157.1780-2-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch is for adding selinux reference policy (refpolicy).
It is a complete SELinux policy that can be used as the system policy
for a variety of systems and used as the basis for creating other policies.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
Changes v1 -> v2:
  - Added cover letter explaining the new patch set. 
  - Added 0001-fc_sort-use-CFLAGS_FOR_BUILD.patch from previous patch set.
  - Readded dependencies from  Bryce Ferguson's patch set.
  - Readded comment in refpolicy.mk explaining why git submodules is needed.
  
 package/Config.in                                  |  1 +
 .../0001-fc_sort-use-CFLAGS_FOR_BUILD.patch        | 30 +++++++++++++
 package/refpolicy/Config.in                        | 37 ++++++++++++++++
 package/refpolicy/refpolicy.hash                   |  2 +
 package/refpolicy/refpolicy.mk                     | 49 ++++++++++++++++++++++
 5 files changed, 119 insertions(+)
 create mode 100644 package/refpolicy/0001-fc_sort-use-CFLAGS_FOR_BUILD.patch
 create mode 100644 package/refpolicy/Config.in
 create mode 100644 package/refpolicy/refpolicy.hash
 create mode 100644 package/refpolicy/refpolicy.mk

diff --git a/package/Config.in b/package/Config.in
index d57813c..6aa6885 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1754,6 +1754,7 @@ endmenu
 menu "Security"
 	source "package/checkpolicy/Config.in"
 	source "package/policycoreutils/Config.in"
+	source "package/refpolicy/Config.in"
 	source "package/sepolgen/Config.in"
 	source "package/setools/Config.in"
 endmenu
diff --git a/package/refpolicy/0001-fc_sort-use-CFLAGS_FOR_BUILD.patch b/package/refpolicy/0001-fc_sort-use-CFLAGS_FOR_BUILD.patch
new file mode 100644
index 0000000..e854e41
--- /dev/null
+++ b/package/refpolicy/0001-fc_sort-use-CFLAGS_FOR_BUILD.patch
@@ -0,0 +1,30 @@
+From da468bd4f312cc7ad76836e1a21020ae423f9bf5 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Adamduskett@outlook.com>
+Date: Sun, 14 May 2017 12:02:28 -0400
+Subject: [PATCH] fc_sort-use-CFLAGS_FOR_BUILD
+
+Updates the one C based tool to use the CC_FOR_BUILD and respective flags
+variable as a full host build isn't required.
+
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 154beb5..cfff20f 100644
+--- a/Makefile
++++ b/Makefile
+@@ -403,7 +403,7 @@ conf.intermediate: $(polxml)
+ # Generate the fc_sort program
+ #
+ $(fcsort) : $(support)/fc_sort.c
+-	$(verbose) $(CC) $(CFLAGS) $^ -o $@
++	$(verbose) $(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) $^ -o $@
+ 
+ ########################################
+ #
+-- 
+2.9.3
+
diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
new file mode 100644
index 0000000..a937055
--- /dev/null
+++ b/package/refpolicy/Config.in
@@ -0,0 +1,37 @@
+config BR2_PACKAGE_REFPOLICY
+	bool "refpolicy"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # policycoreutils
+	depends on BR2_TOOLCHAIN_USES_GLIBC # policycoreutils
+	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS # libsemanage
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libsemanage
+	depends on BR2_TOOLCHAIN_USES_GLIBC # libsemanage
+	depends on !BR2_STATIC_LIBS #libsemanage
+	depends on !BR2_arc # libsemanage
+	select BR2_PACKAGE_POLICYCOREUTILS
+	select BR2_PACKAGE_BUSYBOX_SELINUX if BR2_PACKAGE_BUSYBOX
+	help
+	  The SELinux Reference Policy project (refpolicy) is a
+	  complete SELinux policy that can be used as the system
+	  policy for a variety of systems and used as the basis
+	  for creating other policies. Reference Policy was originally
+	  based on the NSA example policy, but aims to accomplish
+	  many additional goals.
+
+	  The current refpolicy does not fully support Buildroot
+	  and needs modifications to work with the default system
+	  file layout. These changes should be added as patches to
+	  the refpolicy that modify a single SELinux policy.
+
+	  The refpolicy works for the most part in permissive mode. Only
+	  the basic set of utilities are enabled in the example policy
+	  config and some of the pathing in the policies is not correct.
+	  Individual policies would need to be tweaked to get everything
+	  functioning properly.
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
index 0000000..d565cbd
--- /dev/null
+++ b/package/refpolicy/refpolicy.mk
@@ -0,0 +1,49 @@
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
+REFPOLICY_LICENSE = GPLv2
+REFPOLICY_LICENSE_FILES = COPYING
+REFPOLICY_INSTALL_STAGING = YES
+REFPOLICY_DEPENDENCIES += \
+	host-m4 \
+	host-checkpolicy \
+	host-policycoreutils \
+	host-setools \
+	host-gawk \
+	host-python \
+	policycoreutils
+
+REFPOLICY_PYINC = -I$(HOST_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)/site-packages
+
+# Cannot use multiple threads to build the reference policy
+REFPOLICY_MAKE = PYTHON="$(HOST_DIR)/usr/bin/python2" $(TARGET_MAKE_ENV) $(MAKE1)
+
+define REFPOLICY_CONFIGURE_CMDS
+	$(SED) "/OUTPUT_POLICY/c\OUTPUT_POLICY = 30" $(@D)/build.conf
+	$(SED) "/MONOLITHIC/c\MONOLITHIC = y" $(@D)/build.conf
+	$(SED) "/NAME/c\NAME = targeted" $(@D)/build.conf
+endef
+
+define REFPOLICY_BUILD_CMDS
+	$(REFPOLICY_MAKE) -C $(@D) bare conf DESTDIR=$(STAGING_DIR)
+endef
+
+define REFPOLICY_INSTALL_STAGING_CMDS
+	$(REFPOLICY_MAKE) -C $(@D) install-src install-headers \
+	DESTDIR=$(STAGING_DIR)
+endef
+
+define REFPOLICY_INSTALL_TARGET_CMDS
+	$(REFPOLICY_MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR)
+endef
+
+$(eval $(generic-package))
-- 
2.9.3
