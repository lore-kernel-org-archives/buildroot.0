From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  4 Oct 2017 23:02:23 +0200
Subject: [Buildroot] [PATCH v3 3/4] package/freeswitch-mod-bcg729: new
	package
In-Reply-To: <20171004210224.12763-1-bernd.kuhls@t-online.de>
References: <20171004210224.12763-1-bernd.kuhls@t-online.de>
Message-ID: <20171004210224.12763-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package is based on the bcg729 library from Belledonne
Communications which is wrapped into a freeswitch module to provide a
native G729.A codec.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: bumped to latest version
v2: renamed package from freeswitch_mod_bcg729 to freeswitch-mod-bcg729
    (Thomas)

 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/freeswitch-mod-bcg729/Config.in            |  9 +++++++
 .../freeswitch-mod-bcg729.hash                     |  2 ++
 .../freeswitch-mod-bcg729/freeswitch-mod-bcg729.mk | 30 ++++++++++++++++++++++
 5 files changed, 43 insertions(+)
 create mode 100644 package/freeswitch-mod-bcg729/Config.in
 create mode 100644 package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.hash
 create mode 100644 package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 46daf6295c..fe0dd01331 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -206,6 +206,7 @@ F:	package/eudev/
 F:	package/exim/
 F:	package/fetchmail/
 F:	package/freeswitch/
+F:	package/freeswitch-mod-bcg729/
 F:	package/ffmpeg/
 F:	package/ghostscript/
 F:	package/giflib/
diff --git a/package/Config.in b/package/Config.in
index 7b99a6a510..6146de2781 100644
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
index 0000000000..848d4ee67e
--- /dev/null
+++ b/package/freeswitch-mod-bcg729/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_FREESWITCH_MOD_BCG729
+	bool "freeswitch-mod-bcg729"
+	depends on BR2_PACKAGE_FREESWITCH
+	select BR2_PACKAGE_LIBBCG729
+	help
+	  FreeSWITCH G.729A module using the opensource bcg729
+	  implementation by Belledonne Communications.
+
+	  https://github.com/xadhoom/mod_bcg729
diff --git a/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.hash b/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.hash
new file mode 100644
index 0000000000..35a228179c
--- /dev/null
+++ b/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 135f545ad0eef49d1228f8d66a4e66f1ff5f1f8fdf115e88c1df3df8df49fdcb  freeswitch-mod-bcg729-c504eea91f225014380ae17c00b35e7173e316ad.tar.gz
diff --git a/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.mk b/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.mk
new file mode 100644
index 0000000000..c83fc50446
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
+FREESWITCH_MOD_BCG729_DEPENDENCIES = freeswitch libbcg729
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
