From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  6 Oct 2017 22:28:28 +0200
Subject: [Buildroot] [PATCH v4 2/3] package/freeswitch-mod-bcg729: new
	package
In-Reply-To: <20171006202829.431-1-bernd.kuhls@t-online.de>
References: <20171006202829.431-1-bernd.kuhls@t-online.de>
Message-ID: <20171006202829.431-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package is based on the bcg729 library from Belledonne Communica-
tions which is wrapped into a freeswitch module to provide a native
G729.A codec.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v4: added dependency to !BR2_STATIC_LIBS (Arnout), added license hash
v3: bumped to latest version
v2: renamed package from freeswitch_mod_bcg729 to freeswitch-mod-bcg729
    (Thomas)

 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/freeswitch-mod-bcg729/Config.in            | 10 ++++++++
 .../freeswitch-mod-bcg729.hash                     |  3 +++
 .../freeswitch-mod-bcg729/freeswitch-mod-bcg729.mk | 30 ++++++++++++++++++++++
 5 files changed, 45 insertions(+)
 create mode 100644 package/freeswitch-mod-bcg729/Config.in
 create mode 100644 package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.hash
 create mode 100644 package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a031f31ec9..69fa2e56bf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -207,6 +207,7 @@ F:	package/eudev/
 F:	package/exim/
 F:	package/fetchmail/
 F:	package/freeswitch/
+F:	package/freeswitch-mod-bcg729/
 F:	package/ffmpeg/
 F:	package/ghostscript/
 F:	package/giflib/
diff --git a/package/Config.in b/package/Config.in
index 0a3675a566..5f7768e37b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1638,6 +1638,7 @@ menu "Networking applications"
 	source "package/fmc/Config.in"
 	source "package/fping/Config.in"
 	source "package/freeswitch/Config.in"
+	source "package/freeswitch-mod-bcg729/Config.in"
 	source "package/gesftpserver/Config.in"
 	source "package/gupnp-tools/Config.in"
 	source "package/gutenprint/Config.in"
diff --git a/package/freeswitch-mod-bcg729/Config.in b/package/freeswitch-mod-bcg729/Config.in
new file mode 100644
index 0000000000..e75e2acbc0
--- /dev/null
+++ b/package/freeswitch-mod-bcg729/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_FREESWITCH_MOD_BCG729
+	bool "freeswitch-mod-bcg729"
+	depends on BR2_PACKAGE_FREESWITCH
+	depends on !BR2_STATIC_LIBS # freeswitch
+	select BR2_PACKAGE_BCG729
+	help
+	  FreeSWITCH G.729A module using the opensource bcg729
+	  implementation by Belledonne Communications.
+
+	  https://github.com/xadhoom/mod_bcg729
diff --git a/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.hash b/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.hash
new file mode 100644
index 0000000000..67804883bc
--- /dev/null
+++ b/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 135f545ad0eef49d1228f8d66a4e66f1ff5f1f8fdf115e88c1df3df8df49fdcb  freeswitch-mod-bcg729-c504eea91f225014380ae17c00b35e7173e316ad.tar.gz
+sha256 bb4680b13c3190429464a8308a07d7d891e6454349fb7be856e02405b25b1195  LICENSE
diff --git a/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.mk b/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.mk
new file mode 100644
index 0000000000..15f9375f2b
--- /dev/null
+++ b/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# freeswitch-mod-bcg729
+#
+################################################################################
+
+FREESWITCH_MOD_BCG729_VERSION = c504eea91f225014380ae17c00b35e7173e316ad
+FREESWITCH_MOD_BCG729_SITE = $(call github,xadhoom,mod_bcg729,$(FREESWITCH_MOD_BCG729_VERSION))
+FREESWITCH_MOD_BCG729_LICENSE = MPL-1.1
+FREESWITCH_MOD_BCG729_LICENSE_FILES = LICENSE
+FREESWITCH_MOD_BCG729_DEPENDENCIES = freeswitch bcg729
+
+# instead of patching the not cross-compile friendly Makefile from
+# upstream we issue the necessary build commands ourselves
+define FREESWITCH_MOD_BCG729_BUILD_CMDS
+	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
+		-I$(STAGING_DIR)/usr/include/freeswitch \
+		-fPIC -fomit-frame-pointer -fno-exceptions \
+		-c $(@D)/mod_bcg729.c -o $(@D)/mod_bcg729.o
+	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
+		-fPIC -fomit-frame-pointer -fno-exceptions \
+		-shared -Xlinker -x -lm -lbcg729 -Wl,-Bdynamic \
+		-o $(@D)/mod_bcg729.so $(@D)/mod_bcg729.o
+endef
+
+define FREESWITCH_MOD_BCG729_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 $(@D)/mod_bcg729.so $(TARGET_DIR)/usr/lib/freeswitch/mod/mod_bcg729.so
+endef
+
+$(eval $(generic-package))
-- 
2.11.0
