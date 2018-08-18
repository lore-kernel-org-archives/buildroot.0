From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Aug 2018 01:32:02 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/alljoyn: use builtin crypto
Message-ID: <20180818233202.29140-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support for OpenSSL 1.1 is broken, use builtin crypto for now like
Debian does:

https://salsa.debian.org/debian-iot-team/alljoyn/alljoyn-core-1504/commit/09d9f916ecb3e0256c5b24ef46af28cdceb4ed1b#8756c63497c8dc39f7773438edf53b220c773f67_27_26

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/alljoyn/Config.in  | 1 -
 package/alljoyn/alljoyn.mk | 6 ++----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/alljoyn/Config.in b/package/alljoyn/Config.in
index 6eb417daf8..781d91bbe9 100644
--- a/package/alljoyn/Config.in
+++ b/package/alljoyn/Config.in
@@ -7,7 +7,6 @@ config BR2_PACKAGE_ALLJOYN
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBCAP
-	select BR2_PACKAGE_OPENSSL
 	help
 	  The AllJoyn framework defines a common way for devices and
 	  apps to communicate with one another regardless of brands,
diff --git a/package/alljoyn/alljoyn.mk b/package/alljoyn/alljoyn.mk
index 69d5dedc41..1281674e38 100644
--- a/package/alljoyn/alljoyn.mk
+++ b/package/alljoyn/alljoyn.mk
@@ -11,11 +11,9 @@ ALLJOYN_SITE = https://mirrors.kernel.org/allseenalliance/alljoyn/$(ALLJOYN_REV)
 # See https://allseenalliance.org/alliance/ip-policy
 ALLJOYN_LICENSE = ISC
 
-ALLJOYN_DEPENDENCIES = host-scons libcap openssl
+ALLJOYN_DEPENDENCIES = host-scons libcap
 ALLJOYN_INSTALL_STAGING = YES
 
-ALLJOYN_CRYPTO = openssl
-
 # AllJoyn can be compiled in debug or release mode. By default, AllJoyn is built
 # in debug mode.
 ALLJOYN_VARIANT = release
@@ -39,7 +37,7 @@ ALLJOYN_SCONS_OPTS = \
 	CPU=$(ALLJOYN_CPU) \
 	VARIANT=$(ALLJOYN_VARIANT) \
 	BR=off \
-	CRYPTO=$(ALLJOYN_CRYPTO) \
+	CRYPTO=builtin \
 	BINDINGS=$(ALLJOYN_BINDINGS) \
 	TARGET_CFLAGS="$(TARGET_CFLAGS)" \
 	TARGET_CPPFLAGS="$(TARGET_CPPFLAGS)" \
-- 
2.18.0
