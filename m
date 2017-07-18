From: Martin Bark <martin@barkynet.com>
Date: Tue, 18 Jul 2017 12:45:42 +0100
Subject: [Buildroot] [PATCH v2 2/3] package/nodejs: use shared libhttpparser
In-Reply-To: <1500378343-22978-1-git-send-email-martin@barkynet.com>
References: <1500378343-22978-1-git-send-email-martin@barkynet.com>
Message-ID: <1500378343-22978-2-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

nodejs requires libhttpparser and by default will use an internal copy
bundled with the release.  Change to using a shared libhttpparser library.

Signed-off-by: Martin Bark <martin@barkynet.com>

---
Changes v1 -> v2:
 - always use shared libhttpparser (Thomas Petazzoni)
---
 package/nodejs/Config.in | 1 +
 package/nodejs/nodejs.mk | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 37d63d0..f02b9a7 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -26,6 +26,7 @@ config BR2_PACKAGE_NODEJS
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_C_ARES
+	select BR2_PACKAGE_LIBHTTPPARSER
 	help
 	  Event-driven I/O server-side JavaScript environment based on V8.
 
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 68cc904..c97b793 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -8,7 +8,7 @@ NODEJS_VERSION = 8.1.4
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs zlib \
-	c-ares \
+	c-ares libhttpparser \
 	$(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
 HOST_NODEJS_DEPENDENCIES = host-python host-zlib
 NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
@@ -18,6 +18,7 @@ NODEJS_CONF_OPTS = \
 	--without-snapshot \
 	--shared-zlib \
 	--shared-cares \
+	--shared-http-parser \
 	--without-dtrace \
 	--without-etw \
 	--dest-os=linux
-- 
2.7.4
