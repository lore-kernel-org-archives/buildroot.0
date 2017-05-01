From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  1 May 2017 06:48:01 +0200
Subject: [Buildroot] [PATCH v2 3/4] package/freeswitch-mod-bcg729: new
	package
In-Reply-To: <20170501044802.10394-1-bernd.kuhls@t-online.de>
References: <20170501044802.10394-1-bernd.kuhls@t-online.de>
Message-ID: <20170501044802.10394-3-bernd.kuhls@t-online.de>
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
v2 renamed package from freeswitch_mod_bcg729 to freeswitch-mod-bcg729
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
index 28c8bf5da..94fee1295 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -167,6 +167,7 @@ F:	package/eudev/
 F:	package/exim/
 F:	package/fetchmail/
 F:	package/freeswitch/
+F:	package/freeswitch-mod-bcg729/
 F:	package/ffmpeg/
 F:	package/ghostscript/
 F:	package/giflib/
diff --git a/package/Config.in b/package/Config.in
index 3f88582b0..c777c6027 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1550,6 +1550,7 @@ menu "Networking applications"
 	source "package/fmc/Config.in"
 	source "package/fping/Config.in"
 	source "package/freeswitch/Config.in"
+	source "package/freeswitch-mod-bcg729/Config.in"
 	source "package/gesftpserver/Config.in"
 	source "package/gupnp-tools/Config.in"
 	source "package/gutenprint/Config.in"
diff --git a/package/freeswitch-mod-bcg729/Config.in b/package/freeswitch-mod-bcg729/Config.in
new file mode 100644
index 000000000..848d4ee67
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
index 000000000..34e15f828
--- /dev/null
+++ b/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 0fda28ad72a1cd6a675f2ec231fb8fd1f01fc095b3ea45a4eca6d06ecdf5ca9c  freeswitch-mod-bcg729-803858c78e6f9ab7de42fdb452061d00255150c6.tar.gz
diff --git a/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.mk b/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.mk
new file mode 100644
index 000000000..b48904129
--- /dev/null
+++ b/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# freeswitch-mod-bcg729
+#
+################################################################################
+
+FREESWITCH_MOD_BCG729_VERSION = 803858c78e6f9ab7de42fdb452061d00255150c6
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
