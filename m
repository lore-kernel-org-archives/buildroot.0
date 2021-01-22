From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 22 Jan 2021 23:37:23 +0100
Subject: [Buildroot] [PATCH 2/2] package/zeromq: add websocket option
In-Reply-To: <20210122223723.3178834-1-fontaine.fabrice@gmail.com>
References: <20210122223723.3178834-1-fontaine.fabrice@gmail.com>
Message-ID: <20210122223723.3178834-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

websocket support is available since version 4.3.3 and
https://github.com/zeromq/libzmq/commit/9be833493877258af3bc6acdc65565db6674768d
It is enabled if --enable-drafts is passed by the user.

websocket can use libnss or gnutls instead of its builtin SHA1 since
https://github.com/zeromq/libzmq/commit/7296fb5b151920a4a8d272da69196df8ca155aa1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zeromq/Config.in |  5 +++++
 package/zeromq/zeromq.mk | 20 ++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
index aeedff17b8..cf5c644c39 100644
--- a/package/zeromq/Config.in
+++ b/package/zeromq/Config.in
@@ -59,4 +59,9 @@ config BR2_PACKAGE_ZEROMQ_DRAFTS
 
 	  https://pyzmq.readthedocs.io/en/latest/draft.html
 
+config BR2_PACKAGE_ZEROMQ_WEBSOCKET
+	bool "WebSocket support"
+	help
+	  Enable WebSocket transport
+
 endif
diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index 4eb6931f1d..fa72a41f23 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -53,6 +53,19 @@ else
 ZEROMQ_CONF_OPTS += --disable-drafts
 endif
 
+ifeq ($(BR2_PACKAGE_ZEROMQ_WEBSOCKET),y)
+ZEROMQ_CONF_OPTS += --enable-ws
+else
+ZEROMQ_CONF_OPTS += --disable-ws
+endif
+
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+ZEROMQ_DEPENDENCIES += host-pkgconf gnutls
+ZEROMQ_CONF_OPTS += --with-tls
+else
+ZEROMQ_CONF_OPTS += --without-tls
+endif
+
 ifeq ($(BR2_PACKAGE_LIBBSD),y)
 ZEROMQ_DEPENDENCIES += host-pkgconf libbsd
 ZEROMQ_CONF_OPTS += --enable-libbsd
@@ -60,6 +73,13 @@ else
 ZEROMQ_CONF_OPTS += --disable-libbsd
 endif
 
+ifeq ($(BR2_PACKAGE_LIBNSS),y)
+ZEROMQ_DEPENDENCIES += host-pkgconf libnss
+ZEROMQ_CONF_OPTS += --with-nss
+else
+ZEROMQ_CONF_OPTS += --without-nss
+endif
+
 # ZeroMQ uses libsodium if it's available.
 ifeq ($(BR2_PACKAGE_LIBSODIUM),y)
 ZEROMQ_DEPENDENCIES += libsodium
-- 
2.29.2
