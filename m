From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Apr 2017 15:30:02 +0200
Subject: [Buildroot] [git commit] checkpolicy: allow compiling for target
Message-ID: <20170409134130.263EA81E65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b06110621d5b3e936cec5eb433736db50ac36fd1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

checkpolicy is currently a host-only package, however it is a
dependency of audit2allow. This patch allows for checkpolicy to be
compiled for the target.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
[Thomas:
 - remove LIBSELINUX_INSTALL_STAGING = YES, doing it in
   checkpolicy.mk is wrong, and libselinux is already installed to
   staging
 - add "select BR2_PACKAGE_LIBSELINUX" in Config.in, and propagate the
   necessary dependencies
 - add host-flex in dependencies, since it is also needed (in addition
   to target flex).]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                  |  1 +
 package/checkpolicy/Config.in      | 21 +++++++++++++++++++++
 package/checkpolicy/checkpolicy.mk | 21 +++++++++++++++++++++
 3 files changed, 43 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 7c10bc4..9d6a54e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1738,6 +1738,7 @@ menu "Real-Time"
 endmenu
 
 menu "Security"
+	source "package/checkpolicy/Config.in"
 	source "package/policycoreutils/Config.in"
 	source "package/sepolgen/Config.in"
 	source "package/setools/Config.in"
diff --git a/package/checkpolicy/Config.in b/package/checkpolicy/Config.in
new file mode 100644
index 0000000..99754ce
--- /dev/null
+++ b/package/checkpolicy/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_CHECKPOLICY
+	bool "checkpolicy"
+	select BR2_PACKAGE_LIBSELINUX
+	select BR2_PACKAGE_FLEX
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libselinux
+	depends on !BR2_STATIC_LIBS # libselinux
+	depends on BR2_TOOLCHAIN_USES_GLIBC # libselinux
+	depends on !BR2_arc # libselinux
+	help
+	  checkpolicy is the SELinux policy compiler. It uses libsepol
+	  to generate the binary policy. checkpolicy uses the static
+	  libsepol since it deals with low level details of the policy
+	  that have not been encapsulated/abstracted by a proper
+	  shared library interface.
+
+	  http://selinuxproject.org/page/Main_Page
+
+comment "checkpolicy needs a glibc toolchain w/ threads, dynamic library"
+	depends on !BR2_arc
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/checkpolicy/checkpolicy.mk b/package/checkpolicy/checkpolicy.mk
index 774d006..7b98b74 100644
--- a/package/checkpolicy/checkpolicy.mk
+++ b/package/checkpolicy/checkpolicy.mk
@@ -9,6 +9,26 @@ CHECKPOLICY_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux
 CHECKPOLICY_LICENSE = GPL-2.0
 CHECKPOLICY_LICENSE_FILES = COPYING
 
+CHECKPOLICY_DEPENDENCIES = libselinux flex host-flex host-bison
+
+TARGET_CHECKPOLICY_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) \
+	LEX="$(HOST_DIR)/usr/bin/flex" \
+	YACC="$(HOST_DIR)/usr/bin/bison -y"
+
+# DESTDIR is used at build time to find libselinux
+define CHECKPOLICY_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CHECKPOLICY_MAKE_OPTS) DESTDIR=$(STAGING_DIR)
+endef
+
+define CHECKPOLICY_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CHECKPOLICY_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
+
+endef
+
+define CHECKPOLICY_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CHECKPOLICY_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
+endef
+
 HOST_CHECKPOLICY_DEPENDENCIES = host-libselinux host-flex host-bison
 
 HOST_CHECKPOLICY_MAKE_OPTS = $(HOST_CONFIGURE_OPTS) \
@@ -24,4 +44,5 @@ define HOST_CHECKPOLICY_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_CHECKPOLICY_MAKE_OPTS) DESTDIR=$(HOST_DIR) install
 endef
 
+$(eval $(generic-package))
 $(eval $(host-generic-package))
