From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Jan 2021 18:39:21 +0100
Subject: [Buildroot] [git commit] package/wqy-zenhei: new package
Message-ID: <20210102172149.43B8D813F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a2387015fe3730291df1381a59acb13af356c543
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                         |  3 +++
 package/Config.in                  |  1 +
 package/wqy-zenhei/Config.in       | 16 ++++++++++++++++
 package/wqy-zenhei/wqy-zenhei.hash |  6 ++++++
 package/wqy-zenhei/wqy-zenhei.mk   | 27 +++++++++++++++++++++++++++
 5 files changed, 53 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b19a12be5a..28f7d9e3ca 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1467,6 +1467,9 @@ F:	package/ramsmp/
 N:	Kieran Bingham <kieran.bingham@ideasonboard.com>
 F:	package/libcamera/
 
+N:	Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
+F:	package/wqy-zenhei/
+
 N:	Koen Martens <gmc@sonologic.nl>
 F:	package/capnproto/
 F:	package/linuxconsoletools/
diff --git a/package/Config.in b/package/Config.in
index 2a516df4c6..219dba1c9d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -241,6 +241,7 @@ comment "Fonts"
 	source "package/ghostscript-fonts/Config.in"
 	source "package/inconsolata/Config.in"
 	source "package/liberation/Config.in"
+	source "package/wqy-zenhei/Config.in"
 
 comment "Icons"
 	source "package/adwaita-icon-theme/Config.in"
diff --git a/package/wqy-zenhei/Config.in b/package/wqy-zenhei/Config.in
new file mode 100644
index 0000000000..f9135e01a1
--- /dev/null
+++ b/package/wqy-zenhei/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_WQY_ZENHEI
+	bool "wqy-zenhei"
+	help
+	  "WenQuanYi Zen Hei" is a Hei-Ti Style (sans-serif) Chinese
+	  font capable of text formatting and on-screen display of
+	  both simplified and traditional forms of Chinese Hanzi
+	  glyphs (among many other languages). Both the proportional
+	  "WenQuanYi Zen Hei", as well as the monospaced typeface
+	  "WenQuanYi Zen Hei Mono" provides over 35,000 glyphs,
+	  including over 21,000 Chinese Hanzi. This font provides full
+	  coverage of GBK (CP936) charset, CJK Unified Ideographs, as
+	  well as the code-points needed for zh_CN, zh_SG, zh_TW,
+	  zh_HK, zh_MO, ja (Japanese) and ko (Korean) locales for
+	  fontconfig.
+
+	  https://sourceforge.net/projects/wqy/
diff --git a/package/wqy-zenhei/wqy-zenhei.hash b/package/wqy-zenhei/wqy-zenhei.hash
new file mode 100644
index 0000000000..386f16eb6f
--- /dev/null
+++ b/package/wqy-zenhei/wqy-zenhei.hash
@@ -0,0 +1,6 @@
+# from https://sourceforge.net/projects/wqy/files/wqy-zenhei/0.9.45%20%28Fighting-state%20RC1%29/
+md5  4c6c3f4e902dd5ee0a121e8c41d040bd  wqy-zenhei-0.9.45.tar.gz
+sha1  b86b65d3048ade868fcc89229cfac6baf80a3e54  wqy-zenhei-0.9.45.tar.gz
+# locally calculated
+sha256  e4b7e306475bf9427d1757578f0e4528930c84c44eaa3f167d4c42f110ee75d6  wqy-zenhei-0.9.45.tar.gz
+sha256  871c2a85e6bbf7bec65043820b706a265ed95d4e58c577fbb2c9f60c39c26ca7  COPYING
diff --git a/package/wqy-zenhei/wqy-zenhei.mk b/package/wqy-zenhei/wqy-zenhei.mk
new file mode 100644
index 0000000000..88e60f3e56
--- /dev/null
+++ b/package/wqy-zenhei/wqy-zenhei.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# wqy-zenhei
+#
+################################################################################
+
+WQY_ZENHEI_VERSION = 0.9.45
+WQY_ZENHEI_SITE = https://downloads.sourceforge.net/project/wqy/wqy-zenhei/$(WQY_ZENHEI_VERSION)%20%28Fighting-state%20RC1%29
+WQY_ZENHEI_LICENSE =  GPL-2.0-with-font-exception
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
+	$(INSTALL) -D -m 0644 $(@D)/wqy-zenhei.ttc \
+		$(TARGET_DIR)/usr/share/fonts/wqy-zenhei/wqy-zenhei.ttc
+	$(WQY_ZENHEI_FONTCONFIG_CONF_INSTALL_CMDS)
+endef
+
+$(eval $(generic-package))
