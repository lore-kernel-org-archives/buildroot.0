From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 31 Jul 2017 08:08:15 -0400
Subject: [Buildroot] [PATCH v3 15/15] janus-gateway: support libressl
In-Reply-To: <20170731120815.5315-1-aduskett@gmail.com>
References: <20170731120815.5315-1-aduskett@gmail.com>
Message-ID: <20170731120815.5315-15-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - Fixed malformed 0003-support-libressl.patch.

Changes v2 -> v3:
  - Removed 0003-support-libressl.patch as the patch was approved
    upstream.

 package/janus-gateway/Config.in        | 2 +-
 package/janus-gateway/janus-gateway.mk | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 5bd4e9586..4062c6eca 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -8,7 +8,7 @@ menuconfig BR2_PACKAGE_JANUS_GATEWAY
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBNICE
 	select BR2_PACKAGE_LIBSRTP
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBRESSL
 	help
 	  Janus is an open source, general purpose, WebRTC gateway
 	  designed and developed by Meetecho.
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 767b4d54a..13f47d3de 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -11,7 +11,14 @@ JANUS_GATEWAY_LICENSE_FILES = COPYING
 
 # ding-libs provides the ini_config library
 JANUS_GATEWAY_DEPENDENCIES = host-pkgconf jansson libnice \
-	libsrtp host-gengetopt libglib2 openssl
+	libsrtp host-gengetopt libglib2
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+JANUS_GATEWAY_DEPENDENCIES += openssl
+endif
+ifeq ($(BR2_PACKAGE_LIBRESSL),y)
+JANUS_GATEWAY_DEPENDENCIES += libressl
+endif
 
 # Straight out of the repository, no ./configure, and we also patch
 # configure.ac.
-- 
2.13.3
