From: Martin Bark <martin@barkynet.com>
Date: Tue, 18 Jul 2017 12:45:41 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/nodejs: use shared c-ares
Message-ID: <1500378343-22978-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

nodejs requires c-ares and by default will use an internal copy
bundled with the release.  Change to using a shared c-ares library.

Signed-off-by: Martin Bark <martin@barkynet.com>

---
Changes v1 -> v2:
 - always use shared c-ares (Thomas Petazzoni)
---
 package/nodejs/Config.in | 1 +
 package/nodejs/nodejs.mk | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 3022f9c..37d63d0 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -25,6 +25,7 @@ config BR2_PACKAGE_NODEJS
 	# linking, but that's too much of a corner case to support it.
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_C_ARES
 	help
 	  Event-driven I/O server-side JavaScript environment based on V8.
 
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 43c5ff3..68cc904 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -8,6 +8,7 @@ NODEJS_VERSION = 8.1.4
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs zlib \
+	c-ares \
 	$(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
 HOST_NODEJS_DEPENDENCIES = host-python host-zlib
 NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
@@ -16,6 +17,7 @@ NODEJS_LICENSE_FILES = LICENSE
 NODEJS_CONF_OPTS = \
 	--without-snapshot \
 	--shared-zlib \
+	--shared-cares \
 	--without-dtrace \
 	--without-etw \
 	--dest-os=linux
-- 
2.7.4
