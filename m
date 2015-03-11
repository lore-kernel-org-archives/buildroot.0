From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Mar 2015 23:30:19 +0100
Subject: [Buildroot] [PATCH 4/7] packages: introduce a generated kconfig
	snippet in the menuconfig
In-Reply-To: <cover.1426112628.git.yann.morin.1998@free.fr>
References: <cover.1426112628.git.yann.morin.1998@free.fr>
Message-ID: <e592ec9ed105b6dc4e820c9683404b4f73e90281.1426112628.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the infrastructure for adding one (and only one) generated kconfig
snippet in the "Target packages" sub-menu.

This kconfig snippet will ultimately be generated, to contain the list
of services enabled packages will install, so the user may decide to
enable or disable each service.

The new file is a PHONY target, sicne we do want to regenrate it on
every run (in case the list of services a package defines changes). We
can not have it depend on all the .mk files, because we do not have this
list.

For now, the kconfig snippet is generated empty, the recipe for filling
it in will be introduced in sub-sequent patches.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Config.in         | 4 ++++
 Makefile          | 6 +++++-
 package/Config.in | 2 ++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index 2b39d6a..8d9bd45 100644
--- a/Config.in
+++ b/Config.in
@@ -18,6 +18,10 @@ config BR2_EXTERNAL
 	string
 	option env="BR2_EXTERNAL"
 
+config BR2_BASE_DIR
+	string
+	option env="BASE_DIR"
+
 # Hidden boolean selected by packages in need of Java in order to build
 # (example: xbmc)
 config BR2_NEEDS_HOST_JAVA
diff --git a/Makefile b/Makefile
index 7dde8da..b53fcf5 100644
--- a/Makefile
+++ b/Makefile
@@ -693,7 +693,7 @@ endif # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 HOSTCFLAGS = $(CFLAGS_FOR_BUILD)
 export HOSTCFLAGS
 
-prepare-kconfig: outputmakefile
+prepare-kconfig: outputmakefile $(BASE_DIR)/build/.services.in
 
 $(BUILD_DIR)/buildroot-config/%onf:
 	mkdir -p $(@D)/lxdialog
@@ -827,6 +827,10 @@ ifeq ($(NEED_WRAPPER),y)
 	$(Q)$(TOPDIR)/support/scripts/mkmakefile $(TOPDIR) $(O)
 endif
 
+.PHONY: $(BASE_DIR)/build/.services.in
+$(BASE_DIR)/build/.services.in:
+	@touch $(@)
+
 # printvars prints all the variables currently defined in our Makefiles
 printvars:
 	@$(foreach V, \
diff --git a/package/Config.in b/package/Config.in
index a37e519..08261d7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1359,4 +1359,6 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 endif
 endmenu
 
+source "$BR2_BASE_DIR/build/.services.in"
+
 endmenu
-- 
1.9.1
