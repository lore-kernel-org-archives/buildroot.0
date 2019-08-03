From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Sat,  3 Aug 2019 11:38:56 +0200
Subject: [Buildroot] [PATCH 1/3] package/mosquitto: allow to build as static
 lib
In-Reply-To: <20190803093858.144555-1-titouan.christophe@railnova.eu>
References: <20190803093858.144555-1-titouan.christophe@railnova.eu>
Message-ID: <20190803093858.144555-2-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since version 1.5, it is possible to build mosquitto as a static lib.

However, the broker still needs a toolchain with support for shared libraries,
because it contains code to dynamically load modules at runtime. This
code makes use of dlfcn.h, which is only available for dylib enabled
systems.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 package/mosquitto/Config.in    |  9 +++------
 package/mosquitto/mosquitto.mk | 12 ++++++++++++
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index c7373d9a84..8f2561c2d8 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_MOSQUITTO
 	bool "mosquitto"
-	depends on !BR2_STATIC_LIBS # builds .so
 	help
 	  Mosquitto is an open source message broker that implements
 	  the MQ Telemetry Transport protocol versions 3.1 and
@@ -16,12 +15,10 @@ config BR2_PACKAGE_MOSQUITTO_BROKER
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
-	depends on BR2_STATIC_LIBS
+comment "mosquitto broker needs a system with MMU; toolchain w/ dynamic library"
+	depends on BR2_PACKAGE_MOSQUITTO && (!BR2_USE_MMU || BR2_STATIC_LIBS)
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
-- 
2.21.0
