From: Markus Mayer <mmayer@broadcom.com>
Date: Fri,  9 Mar 2018 14:41:49 -0800
Subject: [Buildroot] [PATCH v2] package: dropbear: make PATH configurable
Message-ID: <20180309224149.20225-1-mmayer@broadcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make the default PATH dropbear is using configurable.

If not specified, it will continue to default to dropbear's
DEFAULT_PATH.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---

Changes since v1:
- Made regex safer
  + allow multiple spaces after #define
  + make sure there are spaces or tabs after DEFAULT_PATH

 package/dropbear/Config.in   | 6 ++++++
 package/dropbear/dropbear.mk | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
index 6700778161ba..0cc68d737d2c 100644
--- a/package/dropbear/Config.in
+++ b/package/dropbear/Config.in
@@ -55,4 +55,10 @@ config BR2_PACKAGE_DROPBEAR_LASTLOG
 	  Enable logging of dropbear access to lastlog. Notice that
 	  Buildroot does not generate lastlog by default.
 
+config BR2_PACKAGE_DROPBEAR_PATH
+	string "dropbear default path"
+	help
+	  Use the path specified here as dropbear's default path.
+	  If not specified, dropbear will use "/usr/bin:/bin".
+
 endif
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 01a1a07b7696..9da340670a70 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -51,6 +51,14 @@ define DROPBEAR_DISABLE_STANDALONE
 	$(SED) 's:\(#define NON_INETD_MODE\):/*\1 */:' $(@D)/options.h
 endef
 
+ifneq ($(BR2_PACKAGE_DROPBEAR_PATH),"")
+define DROPBEAR_CUSTOM_PATH
+	$(SED) 's|^\(#define \+DEFAULT_PATH\)[	 ]\+.*|\1 $(BR2_PACKAGE_DROPBEAR_PATH)|' $(@D)/options.h
+endef
+
+DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_CUSTOM_PATH
+endif
+
 define DROPBEAR_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/dropbear/dropbear.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/dropbear.service
-- 
2.7.4
