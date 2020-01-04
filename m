From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  4 Jan 2020 23:06:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/mosquitto: drop patch
Message-ID: <20200104220625.2463815-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop patch (refused by upstream) and use CLIENT_STATIC_LDADD that has
been added in version 1.6.8 with
https://github.com/eclipse/mosquitto/commit/6bde2097992f7d672e4c2c36168bfb5c73579bc3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...nfig.mk-add-WITH_TLS_STATIC_LIB_DEPS.patch | 41 -------------------
 package/mosquitto/mosquitto.mk                |  2 +-
 2 files changed, 1 insertion(+), 42 deletions(-)
 delete mode 100644 package/mosquitto/0001-config.mk-add-WITH_TLS_STATIC_LIB_DEPS.patch

diff --git a/package/mosquitto/0001-config.mk-add-WITH_TLS_STATIC_LIB_DEPS.patch b/package/mosquitto/0001-config.mk-add-WITH_TLS_STATIC_LIB_DEPS.patch
deleted file mode 100644
index fcc169aaca..0000000000
--- a/package/mosquitto/0001-config.mk-add-WITH_TLS_STATIC_LIB_DEPS.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 9a1ea149d3451d4edf32c5f0f0d1b4fecfbff4a2 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 6 Aug 2019 22:11:57 +0200
-Subject: [PATCH] config.mk: add WITH_TLS_STATIC_LIB_DEPS
-
-Add WITH_TLS_STATIC_LIB_DEPS to allow the user to give openssl static
-libraries dependencies such as -lz or -latomic
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/eclipse/mosquitto/pull/1371]
----
- config.mk | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/config.mk b/config.mk
-index 6c23bef..c9e2daf 100644
---- a/config.mk
-+++ b/config.mk
-@@ -23,6 +23,10 @@
- # password authentication at all.
- WITH_TLS:=yes
- 
-+# Use this variable to give openssl static libraries dependencies (such as -lz
-+# or -latomic) that can be retrieved for example by pkg-config
-+WITH_TLS_STATIC_LIB_DEPS:=
-+
- # Comment out to disable TLS/PSK support in the broker and client. Requires
- # WITH_TLS=yes.
- # This must be disabled if using openssl < 1.0.
-@@ -202,7 +206,7 @@ ifeq ($(WITH_TLS),yes)
- 	LIB_CPPFLAGS:=$(LIB_CPPFLAGS) -DWITH_TLS
- 	PASSWD_LDADD:=$(PASSWD_LDADD) -lcrypto
- 	CLIENT_CPPFLAGS:=$(CLIENT_CPPFLAGS) -DWITH_TLS
--	STATIC_LIB_DEPS:=$(STATIC_LIB_DEPS) -lssl -lcrypto
-+	STATIC_LIB_DEPS:=$(STATIC_LIB_DEPS) -lssl -lcrypto $(WITH_TLS_STATIC_LIB_DEPS)
- 
- 	ifeq ($(WITH_TLS_PSK),yes)
- 		BROKER_CPPFLAGS:=$(BROKER_CPPFLAGS) -DWITH_TLS_PSK
--- 
-2.20.1
-
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 2c3bd18d5e..aab193c14d 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -51,7 +51,7 @@ ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 MOSQUITTO_DEPENDENCIES += host-pkgconf libopenssl
 MOSQUITTO_MAKE_OPTS += \
 	WITH_TLS=yes \
-	WITH_TLS_STATIC_LIB_DEPS="`$(PKG_CONFIG_HOST_BINARY) --libs openssl`"
+	CLIENT_STATIC_LDADD="`$(PKG_CONFIG_HOST_BINARY) --libs openssl`"
 else
 MOSQUITTO_MAKE_OPTS += WITH_TLS=no
 endif
-- 
2.24.1
