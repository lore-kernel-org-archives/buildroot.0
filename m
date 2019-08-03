From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Aug 2019 13:14:48 +0200
Subject: [Buildroot] [git commit] package/mosquitto: allow to build as
 static lib
Message-ID: <20190803111211.BBEE0839CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a95bdd964761ec69a23174f5213dd54b77d0971b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 1.5, it is possible to build mosquitto as a static lib.

However, the broker still needs a toolchain with support for shared libraries,
because it contains code to dynamically load modules at runtime. This
code makes use of dlfcn.h, which is only available for dylib enabled
systems.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
[Peter: adjust broker comment]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/Config.in    |  9 ++++-----
 package/mosquitto/mosquitto.mk | 12 ++++++++++++
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index c7373d9a84..1b3d1070f8 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_MOSQUITTO
 	bool "mosquitto"
-	depends on !BR2_STATIC_LIBS # builds .so
 	help
 	  Mosquitto is an open source message broker that implements
 	  the MQ Telemetry Transport protocol versions 3.1 and
@@ -16,12 +15,12 @@ config BR2_PACKAGE_MOSQUITTO_BROKER
 	bool "install the mosquitto broker"
 	default y
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS # include <dlfcn.h>
 	depends on BR2_PACKAGE_MOSQUITTO
 	help
 	  Build and install the mosquitto broker onto target.
 
-comment "mosquitto broker needs a system with MMU"
-	depends on BR2_PACKAGE_MOSQUITTO && !BR2_USE_MMU
-
-comment "mosquitto needs a toolchain w/ dynamic library"
+comment "mosquitto broker needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS
+	depends on BR2_PACKAGE_MOSQUITTO
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index a172afcc53..eb39f0af6e 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -17,6 +17,18 @@ MOSQUITTO_MAKE_OPTS = \
 	WITH_WRAP=no \
 	WITH_DOCS=no
 
+ifeq ($(BR2_SHARED_LIBS),y)
+MOSQUITTO_MAKE_OPTS += WITH_STATIC_LIBRARIES=no
+else
+MOSQUITTO_MAKE_OPTS += WITH_STATIC_LIBRARIES=yes
+endif
+
+ifeq ($(BR2_STATIC_LIBS),y)
+MOSQUITTO_MAKE_OPTS += WITH_SHARED_LIBRARIES=no
+else
+MOSQUITTO_MAKE_OPTS += WITH_SHARED_LIBRARIES=yes
+endif
+
 # adns uses getaddrinfo_a
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
 MOSQUITTO_MAKE_OPTS += WITH_ADNS=yes
