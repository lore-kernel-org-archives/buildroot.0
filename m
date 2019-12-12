From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Thu, 12 Dec 2019 13:41:42 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/avro-c: new package
In-Reply-To: <20191212124143.220947-1-titouan.christophe@railnova.eu>
References: <20191212124143.220947-1-titouan.christophe@railnova.eu>
Message-ID: <20191212124143.220947-2-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 DEVELOPERS                                |  1 +
 package/Config.in                         |  1 +
 package/avro-c/0001-Compile-on-musl.patch | 39 +++++++++++++++++++++++
 package/avro-c/Config.in                  | 20 ++++++++++++
 package/avro-c/avro-c.hash                |  6 ++++
 package/avro-c/avro-c.mk                  | 14 ++++++++
 6 files changed, 81 insertions(+)
 create mode 100644 package/avro-c/0001-Compile-on-musl.patch
 create mode 100644 package/avro-c/Config.in
 create mode 100644 package/avro-c/avro-c.hash
 create mode 100644 package/avro-c/avro-c.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 66964d035d..639bd21904 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2399,6 +2399,7 @@ N:	Timo Ketola <timo.ketola@exertus.fi>
 F:	package/fbgrab/
 
 N:	Titouan Christophe <titouan.christophe@railnova.eu>
+F:	package/avro-c/
 F:	package/mosquitto/
 F:	package/redis/
 
diff --git a/package/Config.in b/package/Config.in
index 405732bc7a..29eaf043cd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1708,6 +1708,7 @@ menu "Other"
 	source "package/argp-standalone/Config.in"
 	source "package/armadillo/Config.in"
 	source "package/atf/Config.in"
+	source "package/avro-c/Config.in"
 	source "package/bctoolbox/Config.in"
 	source "package/bdwgc/Config.in"
 	source "package/boost/Config.in"
diff --git a/package/avro-c/0001-Compile-on-musl.patch b/package/avro-c/0001-Compile-on-musl.patch
new file mode 100644
index 0000000000..2f1b0f62db
--- /dev/null
+++ b/package/avro-c/0001-Compile-on-musl.patch
@@ -0,0 +1,39 @@
+From 55a5ad94c77896eb25e2c7ed024d78a0a2c09007 Mon Sep 17 00:00:00 2001
+From: Titouan Christophe <titouan.christophe@railnova.eu>
+Date: Sun, 8 Dec 2019 01:55:59 +0100
+Subject: [PATCH 1/1] Allow avro C to be built on musl based systems.
+
+The type `ssize_t` is defined in sys/types.h, and nowhere else
+in the musl standard C library, so it should be included for the
+compilation to succeed.
+
+This fixes several errors like:
+
+    In file included from src/generic.c:29:0:
+    src/generic.c: In function 'avro_generic_value_new':
+    src/avro_generic_internal.h:63:39:
+        error: 'ssize_t' undeclared (first use in this function);
+               did you mean 'size_t'?
+
+Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
+[Upstream status: https://github.com/apache/avro/pull/740]
+---
+ src/avro_generic_internal.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/avro_generic_internal.h b/src/avro_generic_internal.h
+index 709403c0..9843ed65 100644
+--- a/src/avro_generic_internal.h
++++ b/src/avro_generic_internal.h
+@@ -24,6 +24,8 @@ extern "C" {
+ #define CLOSE_EXTERN
+ #endif
+ 
++#include <sys/types.h>
++
+ #include "avro/generic.h"
+ #include "avro/schema.h"
+ #include "avro/value.h"
+-- 
+2.21.0
+
diff --git a/package/avro-c/Config.in b/package/avro-c/Config.in
new file mode 100644
index 0000000000..a21446186a
--- /dev/null
+++ b/package/avro-c/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_AVRO_C
+	bool "avro"
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_JANSSON
+	help
+	  Select this option to install the Avro C language bindings,
+	  and the command line tools avroappend, avrocat, avromod and
+	  avropipe.
+
+	  Apache Avro is a data serialization system.
+	  Avro provides:
+	  - Rich data structures.
+	  - A compact, fast, binary data format.
+	  - A container file, to store persistent data.
+	  - Remote procedure call (RPC).
+	  - Simple integration with dynamic languages.
+	  - Code generation is not required to read or write data
+	    files nor to use or implement RPC protocols.
+	  - Code generation as an optional optimization,
+	    only worth implementing for statically typed languages.
diff --git a/package/avro-c/avro-c.hash b/package/avro-c/avro-c.hash
new file mode 100644
index 0000000000..239cb36f57
--- /dev/null
+++ b/package/avro-c/avro-c.hash
@@ -0,0 +1,6 @@
+# From https://www-eu.apache.org/dist/avro/avro-1.9.1/c/avro-c-1.9.1.tar.gz.sha512
+sha512 68b1f44f870c9b6f0b2380da9e34d91148ff4398cb300f4bdd4e3e1ad00820acd9084b73232b00d4cd4935fb992b41dc65afdafcbea14a3d87259608688df904  avro-c-1.9.1.tar.gz
+
+# License files
+sha256 d62488d6ba17132e92c23c03c80bfedc848267f96ab36489fec860f76cf6819a  LICENSE
+sha256 92f7a23b4d6f91c27f5dc089fa2f30c9b4b13ac5b7cf872b351752463e7f9d4d  NOTICE
diff --git a/package/avro-c/avro-c.mk b/package/avro-c/avro-c.mk
new file mode 100644
index 0000000000..2ca01ecef5
--- /dev/null
+++ b/package/avro-c/avro-c.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# avro-c
+#
+################################################################################
+
+AVRO_C_VERSION = 1.9.1
+AVRO_C_SITE = https://www-eu.apache.org/dist/avro/avro-$(AVRO_C_VERSION)/c
+AVRO_C_LICENSE = Apache-2.0
+AVRO_C_LICENSE_FILES = LICENSE NOTICE
+AVRO_C_INSTALL_STAGING = YES
+AVRO_C_DEPENDENCIES = jansson
+
+$(eval $(cmake-package))
-- 
2.23.0
