From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Dec 2019 19:04:27 +0100
Subject: [Buildroot] [git commit] package/avro-c: new package
Message-ID: <20191229175716.AA93E8E6C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c2488f96377cd5a1cf84a87677b55aa10a095e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
[yann.morin.1998 at free.fr:
  - backport the patch from upstream now it'sapplied
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...-avro-C-to-be-built-on-musl-based-systems.patch | 45 ++++++++++++++++++++++
 package/avro-c/Config.in                           | 25 ++++++++++++
 package/avro-c/avro-c.hash                         |  5 +++
 package/avro-c/avro-c.mk                           | 26 +++++++++++++
 6 files changed, 103 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7171052243..ef11bdaaa0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2423,6 +2423,7 @@ N:	Timo Ketola <timo.ketola@exertus.fi>
 F:	package/fbgrab/
 
 N:	Titouan Christophe <titouan.christophe@railnova.eu>
+F:	package/avro-c/
 F:	package/mosquitto/
 F:	package/redis/
 
diff --git a/package/Config.in b/package/Config.in
index 01bf385178..c438669c3d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1726,6 +1726,7 @@ menu "Other"
 	source "package/argp-standalone/Config.in"
 	source "package/armadillo/Config.in"
 	source "package/atf/Config.in"
+	source "package/avro-c/Config.in"
 	source "package/bctoolbox/Config.in"
 	source "package/bdwgc/Config.in"
 	source "package/boost/Config.in"
diff --git a/package/avro-c/0001-Allow-avro-C-to-be-built-on-musl-based-systems.patch b/package/avro-c/0001-Allow-avro-C-to-be-built-on-musl-based-systems.patch
new file mode 100644
index 0000000000..bfa7e8a60e
--- /dev/null
+++ b/package/avro-c/0001-Allow-avro-C-to-be-built-on-musl-based-systems.patch
@@ -0,0 +1,45 @@
+From 9b39a985bcd6cd34f0820f3680f145d46c0e56bd Mon Sep 17 00:00:00 2001
+From: Titouan Christophe <titouan.christophe@railnova.eu>
+Date: Sun, 8 Dec 2019 01:55:59 +0100
+Subject: [PATCH] Allow avro C to be built on musl based systems.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The type `ssize_t` is defined in sys/types.h, and nowhere else
+in the musl standard C library, so it should be included for the
+compilation to succeed.
+
+This fixes several errors like:
+
+    In file included from src/generic.c:29:0:
+    src/generic.c: In function ???avro_generic_value_new???:
+    src/avro_generic_internal.h:63:39:
+        error: ???ssize_t??? undeclared (first use in this function);
+               did you mean ???size_t????
+
+Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
+[yann.morin.1998 at free.fr:
+  - backported from upstream 9b39a98, adapted to the release tarball
+]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
+2.20.1
+
diff --git a/package/avro-c/Config.in b/package/avro-c/Config.in
new file mode 100644
index 0000000000..fe962e1e3c
--- /dev/null
+++ b/package/avro-c/Config.in
@@ -0,0 +1,25 @@
+comment "avro-c needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
+config BR2_PACKAGE_AVRO_C
+	bool "avro-c"
+	depends on !BR2_STATIC_LIBS  # Avro unconditionally compiles shared libs
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
+
+	  http://avro.apache.org/
diff --git a/package/avro-c/avro-c.hash b/package/avro-c/avro-c.hash
new file mode 100644
index 0000000000..da74f3c052
--- /dev/null
+++ b/package/avro-c/avro-c.hash
@@ -0,0 +1,5 @@
+# From https://www-eu.apache.org/dist/avro/avro-1.9.1/c/avro-c-1.9.1.tar.gz.sha512
+sha512 68b1f44f870c9b6f0b2380da9e34d91148ff4398cb300f4bdd4e3e1ad00820acd9084b73232b00d4cd4935fb992b41dc65afdafcbea14a3d87259608688df904  avro-c-1.9.1.tar.gz
+
+# License files
+sha256 d62488d6ba17132e92c23c03c80bfedc848267f96ab36489fec860f76cf6819a  LICENSE
diff --git a/package/avro-c/avro-c.mk b/package/avro-c/avro-c.mk
new file mode 100644
index 0000000000..a1b1931bf0
--- /dev/null
+++ b/package/avro-c/avro-c.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# avro-c
+#
+################################################################################
+
+AVRO_C_VERSION = 1.9.1
+AVRO_C_SITE = https://www-eu.apache.org/dist/avro/avro-$(AVRO_C_VERSION)/c
+AVRO_C_LICENSE = Apache-2.0
+AVRO_C_LICENSE_FILES = LICENSE
+AVRO_C_INSTALL_STAGING = YES
+AVRO_C_DEPENDENCIES = host-pkgconf jansson
+
+ifeq ($(BR2_PACKAGE_SNAPPY),y)
+AVRO_C_DEPENDENCIES += snappy
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+AVRO_C_DEPENDENCIES += zlib
+endif
+
+ifeq ($(BR2_PACKAGE_XZ),y)
+AVRO_C_DEPENDENCIES += xz
+endif
+
+$(eval $(cmake-package))
