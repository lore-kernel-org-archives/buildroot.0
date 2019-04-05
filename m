From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  5 Apr 2019 23:16:35 +0200
Subject: [Buildroot] [PATCH 1/2] package/sslh: add optional pcre dependency
Message-ID: <20190405211636.17616-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pcre dependency has been added in version 1.18 and
https://github.com/yrutschle/sslh/commit/ab3324be477b2663196e0cc73d96aa38d59da65a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sslh/sslh.mk | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/sslh/sslh.mk b/package/sslh/sslh.mk
index 3a9223b23a..5c868dfe2f 100644
--- a/package/sslh/sslh.mk
+++ b/package/sslh/sslh.mk
@@ -11,12 +11,22 @@ SSLH_LICENSE_FILES = COPYING
 
 SSLH_DEPENDENCIES = libconfig
 
+SSLH_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)
+
+ifeq ($(BR2_PACKAGE_PCRE),y)
+SSLH_DEPENDENCIES += pcre
+SSLH_MAKE_OPTS += USELIBPCRE=1
+else
+SSLH_MAKE_OPTS += USELIBPCRE=
+endif
+
 define SSLH_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE1) $(SSLH_MAKE_OPTS) -C $(@D)
 endef
 
 define SSLH_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) $(SSLH_MAKE_OPTS) -C $(@D) \
+		DESTDIR=$(TARGET_DIR) install
 endef
 
 define SSLH_INSTALL_INIT_SYSV
-- 
2.20.1
