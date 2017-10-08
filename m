From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Oct 2017 23:12:13 +0200
Subject: [Buildroot] [git commit] package/freeswitch-mod-bcg729: new package
Message-ID: <20171008210553.30E1281109@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c81810de50e19de77cf79b4eb0dc2808751bc389
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package is based on the bcg729 library from Belledonne Communica-
tions which is wrapped into a freeswitch module to provide a native
G729.A codec.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/freeswitch-mod-bcg729/Config.in            | 10 ++++++++
 .../freeswitch-mod-bcg729.hash                     |  3 +++
 .../freeswitch-mod-bcg729/freeswitch-mod-bcg729.mk | 30 ++++++++++++++++++++++
 5 files changed, 45 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1e1ed37..f35d6f3 100644
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
index a6c8f2d..6f85643 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1636,6 +1636,7 @@ menu "Networking applications"
 	source "package/fmc/Config.in"
 	source "package/fping/Config.in"
 	source "package/freeswitch/Config.in"
+	source "package/freeswitch-mod-bcg729/Config.in"
 	source "package/gesftpserver/Config.in"
 	source "package/gupnp-tools/Config.in"
 	source "package/gutenprint/Config.in"
diff --git a/package/freeswitch-mod-bcg729/Config.in b/package/freeswitch-mod-bcg729/Config.in
new file mode 100644
index 0000000..e75e2ac
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
index 0000000..6780488
--- /dev/null
+++ b/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 135f545ad0eef49d1228f8d66a4e66f1ff5f1f8fdf115e88c1df3df8df49fdcb  freeswitch-mod-bcg729-c504eea91f225014380ae17c00b35e7173e316ad.tar.gz
+sha256 bb4680b13c3190429464a8308a07d7d891e6454349fb7be856e02405b25b1195  LICENSE
diff --git a/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.mk b/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.mk
new file mode 100644
index 0000000..15f9375
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
