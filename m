From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 25 Jan 2021 23:34:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/sslh: systemd needs libconfig
Message-ID: <20210125223420.1357779-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

systemd-sslh-generator unconditionally uses libconfig

Fixes:
 - http://autobuild.buildroot.org/results/d46581842906f7780f4a3a1ae21963e78e7f5276

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sslh/sslh.mk | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/sslh/sslh.mk b/package/sslh/sslh.mk
index 4bde143cd8..c98f1a6675 100644
--- a/package/sslh/sslh.mk
+++ b/package/sslh/sslh.mk
@@ -29,8 +29,17 @@ endif
 ifeq ($(BR2_PACKAGE_LIBCONFIG),y)
 SSLH_DEPENDENCIES += libconfig
 SSLH_MAKE_OPTS += USELIBCONFIG=1
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+SSLH_DEPENDENCIES += systemd
+SSLH_MAKE_OPTS += USESYSTEMD=1
+else
+SSLH_MAKE_OPTS += USESYSTEMD=
+endif
 else
-SSLH_MAKE_OPTS += USELIBCONFIG=
+SSLH_MAKE_OPTS += \
+	USELIBCONFIG= \
+	USESYSTEMD=
 endif
 
 ifeq ($(BR2_PACKAGE_PCRE),y)
@@ -40,13 +49,6 @@ else
 SSLH_MAKE_OPTS += USELIBPCRE=
 endif
 
-ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-SSLH_DEPENDENCIES += systemd
-SSLH_MAKE_OPTS += USESYSTEMD=1
-else
-SSLH_MAKE_OPTS += USESYSTEMD=
-endif
-
 define SSLH_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(SSLH_MAKE_OPTS) -C $(@D)
 endef
-- 
2.29.2
