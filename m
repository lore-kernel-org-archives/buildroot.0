From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Date: Mon,  9 Nov 2020 14:41:31 -0300
Subject: [Buildroot] [PATCH 1/1] package/wqy-zenhei: new package
Message-ID: <20201109174131.7321-1-klaus@linux.vnet.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
---
 DEVELOPERS                         |  3 +++
 package/Config.in                  |  1 +
 package/wqy-zenhei/Config.in       | 13 +++++++++++++
 package/wqy-zenhei/wqy-zenhei.hash |  3 +++
 package/wqy-zenhei/wqy-zenhei.mk   | 28 ++++++++++++++++++++++++++++
 5 files changed, 48 insertions(+)
 create mode 100644 package/wqy-zenhei/Config.in
 create mode 100644 package/wqy-zenhei/wqy-zenhei.hash
 create mode 100644 package/wqy-zenhei/wqy-zenhei.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 43cc1b55ae..5a874708c4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1461,6 +1461,9 @@ F:	package/ramsmp/
 N:	Kieran Bingham <kieran.bingham@ideasonboard.com>
 F:	package/libcamera/
 
+N:	Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
+F:	package/wqy-zenhei/
+
 N:	Koen Martens <gmc@sonologic.nl>
 F:	package/capnproto/
 F:	package/linuxconsoletools/
diff --git a/package/Config.in b/package/Config.in
index 016a99ed1a..43bcd80ad4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -240,6 +240,7 @@ comment "Fonts"
 	source "package/ghostscript-fonts/Config.in"
 	source "package/inconsolata/Config.in"
 	source "package/liberation/Config.in"
+	source "package/wqy-zenhei/Config.in"
 
 comment "Icons"
 	source "package/adwaita-icon-theme/Config.in"
diff --git a/package/wqy-zenhei/Config.in b/package/wqy-zenhei/Config.in
new file mode 100644
index 0000000000..26fd1e8a93
--- /dev/null
+++ b/package/wqy-zenhei/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_WQY_ZENHEI
+	bool "wqy-zenhei (Free Chinese-capable fonts)"
+	help
+	  "WenQuanYi Zen Hei" is a Hei-Ti Style (sans-serif) Chinese
+	  font capable of text formatting and on-screen display of both
+	  simplified and traditional forms of Chinese Hanzi glyphs
+	  (among many other languages). Both the proportional
+	  "WenQuanYi Zen Hei", as well as the monospaced typeface
+	  "WenQuanYi Zen Hei Mono" provides over 35,000 glyphs,
+	  including over 21,000 Chinese Hanzi. This font provides full
+	  coverage of GBK (CP936) charset, CJK Unified Ideographs, as
+	  well as the code-points needed for zh_CN, zh_SG, zh_TW, zh_HK,
+	  zh_MO, ja (Japanese) and ko (Korean) locales for fontconfig.
diff --git a/package/wqy-zenhei/wqy-zenhei.hash b/package/wqy-zenhei/wqy-zenhei.hash
new file mode 100644
index 0000000000..86ae38da4f
--- /dev/null
+++ b/package/wqy-zenhei/wqy-zenhei.hash
@@ -0,0 +1,3 @@
+# locally computed sha256 from:
+# https://downloads.sourceforge.net/project/wqy/wqy-zenhei/0.9.45%20%28Fighting-state%20RC1%29/wqy-zenhei-0.9.45.tar.gz
+sha256 e4b7e306475bf9427d1757578f0e4528930c84c44eaa3f167d4c42f110ee75d6  wqy-zenhei-0.9.45.tar.gz
diff --git a/package/wqy-zenhei/wqy-zenhei.mk b/package/wqy-zenhei/wqy-zenhei.mk
new file mode 100644
index 0000000000..ae0915add4
--- /dev/null
+++ b/package/wqy-zenhei/wqy-zenhei.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# wqy-zenhei
+#
+################################################################################
+
+WQY_ZENHEI_VERSION = 0.9.45
+WQY_ZENHEI_SITE = https://downloads.sourceforge.net/project/wqy/wqy-zenhei/$(WQY_ZENHEI_VERSION)%20%28Fighting-state%20RC1%29
+WQY_ZENHEI_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/wqy-zenhei
+WQY_ZENHEI_LICENSE =  GPL-v2
+WQY_ZENHEI_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
+define WQY_ZENHEI_FONTCONFIG_CONF_INSTALL_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/43-wqy-zenhei-sharp.conf \
+	    $(TARGET_DIR)/usr/share/fontconfig/conf.avail/43-wqy-zenhei-sharp.conf
+	$(INSTALL) -D -m 0644 $(@D)/44-wqy-zenhei.conf \
+	    $(TARGET_DIR)/usr/share/fontconfig/conf.avail/44-wqy-zenhei.conf
+endef
+endif
+
+define WQY_ZENHEI_INSTALL_TARGET_CMDS
+	mkdir -p $(WQY_ZENHEI_TARGET_DIR)
+	$(INSTALL) -m 644 $(@D)/wqy-zenhei.ttc $(WQY_ZENHEI_TARGET_DIR)
+	$(WQY_ZENHEI_FONTCONFIG_CONF_INSTALL_CMDS)
+endef
+
+$(eval $(generic-package))
-- 
2.17.1
