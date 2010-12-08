From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 8 Dec 2010 23:37:48 +0100
Subject: [Buildroot] [git commit master 1/1] whetstone: new benchmark package
Message-ID: <20101208223824.C18E58D570@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=beb56ca618da3c2bcffb806c6d7fae725e56162e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                        |    2 +-
 package/Config.in              |    1 +
 package/whetstone/Config.in    |    6 ++++++
 package/whetstone/whetstone.mk |   33 +++++++++++++++++++++++++++++++++
 4 files changed, 41 insertions(+), 1 deletions(-)
 create mode 100644 package/whetstone/Config.in
 create mode 100644 package/whetstone/whetstone.mk

diff --git a/CHANGES b/CHANGES
index 47ba38d..bf9a0a9 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,7 +5,7 @@
 
 	Updated/fixed packages: cloop, m4, openssh, qt, xz
 
-	New packages: lsuio, rsh-redone
+	New packages: lsuio, rsh-redone, whetstone
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/Config.in b/package/Config.in
index 7c550cd..42d7517 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -27,6 +27,7 @@ source "package/memstat/Config.in"
 source "package/netperf/Config.in"
 source "package/oprofile/Config.in"
 source "package/strace/Config.in"
+source "package/whetstone/Config.in"
 source "package/valgrind/Config.in"
 endmenu
 
diff --git a/package/whetstone/Config.in b/package/whetstone/Config.in
new file mode 100644
index 0000000..7a68160
--- /dev/null
+++ b/package/whetstone/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_WHETSTONE
+	bool "whetstone"
+	help
+	  C Converted Whetstone Double Precision Benchmark
+
+	  http://www.netlib.org/benchmark/
diff --git a/package/whetstone/whetstone.mk b/package/whetstone/whetstone.mk
new file mode 100644
index 0000000..d47fbcd
--- /dev/null
+++ b/package/whetstone/whetstone.mk
@@ -0,0 +1,33 @@
+#############################################################
+#
+# whetstone
+#
+#############################################################
+
+WHETSTONE_VERSION = 1.2
+WHETSTONE_SOURCE = whetstone.c
+WHETSTONE_SITE = http://www.netlib.org/benchmark/
+
+define WHETSTONE_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) LDLIBS="-lm" -C $(@D) whetstone
+endef
+
+define WHETSTONE_CLEAN_CMDS
+	rm -f $(@D)/whetstone
+endef
+
+define WHETSTONE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D $(@D)/whetstone $(TARGET_DIR)/usr/bin/whetstone
+endef
+
+define WHETSTONE_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/bin/whetstone
+endef
+
+$(eval $(call GENTARGETS,package,whetstone))
+
+$(BUILD_DIR)/whetstone-$(WHETSTONE_VERSION)/.stamp_extracted:
+	@$(call MESSAGE,"Extracting")
+	$(Q)mkdir -p $(@D)
+	$(Q)cp $(DL_DIR)/$($(PKG)_SOURCE) $(@D)/
+	$(Q)touch $@
-- 
1.7.2.2
