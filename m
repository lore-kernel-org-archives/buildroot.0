From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 12 Aug 2016 22:49:54 +0200
Subject: [Buildroot] [PATCH 1/8] package/netbsd-compat-headers: provide
	compatibility headers not in musl
In-Reply-To: <cover.1471033837.git.yann.morin.1998@free.fr>
References: <cover.1471033837.git.yann.morin.1998@free.fr>
Message-ID: <1d561e7440fd9f14063d006fc3dca596c9c849c7.1471033837.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

musl provides neither sys/queue.h nor sys/cdefs.h. Those two headers are
however quite widely used in a lot of packages (though they should at
least not use cdefs,h which is only full of mostly-legacy macros, and
which is mostly an internal header of glibc and was never really meant to
be exposed to, and used by packages).

But we don;t live in an ideal world, so a lot of packages break when
those two headers are missing.

We already took care of sys/queue.h with the netbsd-queue package. But
the need for cdefs.h is getting more and more pressing.

We rename the netbsd-queue package into musl-compat-headers, and we
make it install sys/queue.h (from NetBSD) and sys/cdefs.h (a minimalist
one we bundle in Buildroot). We can't use the cdefs.h from NetBSD
because it includes machine-dependent headers; instead we bundle a very
minimalistic one, that covers only what we need.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |  2 +-
 package/musl-compat-headers/Config.in              |  2 ++
 package/musl-compat-headers/cdefs.h                | 40 ++++++++++++++++++++++
 .../musl-compat-headers.hash}                      |  0
 package/musl-compat-headers/musl-compat-headers.mk | 29 ++++++++++++++++
 package/musl/Config.in                             |  3 +-
 package/musl/musl.mk                               | 10 +++---
 package/netbsd-queue/Config.in                     |  2 --
 package/netbsd-queue/netbsd-queue.mk               | 24 -------------
 toolchain/toolchain-external/Config.in             |  3 +-
 toolchain/toolchain-external/toolchain-external.mk | 10 +++---
 11 files changed, 88 insertions(+), 37 deletions(-)
 create mode 100644 package/musl-compat-headers/Config.in
 create mode 100644 package/musl-compat-headers/cdefs.h
 rename package/{netbsd-queue/netbsd-queue.hash => musl-compat-headers/musl-compat-headers.hash} (100%)
 create mode 100644 package/musl-compat-headers/musl-compat-headers.mk
 delete mode 100644 package/netbsd-queue/Config.in
 delete mode 100644 package/netbsd-queue/netbsd-queue.mk

diff --git a/package/Config.in b/package/Config.in
index 645fa29..1e51a45 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1324,7 +1324,7 @@ endif
 	source "package/mpfr/Config.in"
 	source "package/msgpack/Config.in"
 	source "package/mtdev2tuio/Config.in"
-	source "package/netbsd-queue/Config.in"
+	source "package/musl-compat-headers/Config.in"
 	source "package/openblas/Config.in"
 	source "package/orc/Config.in"
 	source "package/p11-kit/Config.in"
diff --git a/package/musl-compat-headers/Config.in b/package/musl-compat-headers/Config.in
new file mode 100644
index 0000000..c672f9c
--- /dev/null
+++ b/package/musl-compat-headers/Config.in
@@ -0,0 +1,2 @@
+config BR2_PACKAGE_MUSL_COMPAT_HEADERS
+	bool
diff --git a/package/musl-compat-headers/cdefs.h b/package/musl-compat-headers/cdefs.h
new file mode 100644
index 0000000..0a78b8f
--- /dev/null
+++ b/package/musl-compat-headers/cdefs.h
@@ -0,0 +1,40 @@
+/* Copyright (C) 2016 Yann E. MORI <yann.morin.1998@free.fr>
+ *
+ * This file is in the Public Domain.
+ *
+ * For jurisdictions in which the Public Domain does not exist
+ * or it is not otherwise applicable, this file is licensed CC0
+ * (Creative Commons Zero).
+ */
+
+/* This file contains definitions for non-standard macros defined by
+ * glibc, but quite commonly used in packages.
+ *
+ * Because they are non-standard, musl does not define those macros.
+ * It does not provide cdefs.h either.
+ *
+ * This file is a compatibility header written from scratch, to be
+ * installed when the C library is musl.
+ *
+ * Not all macros from the glibc's cdefs.h are available, only the
+ * most commonly used ones.
+ *
+ * Please refer to the glibc documentation and source code for
+ * explanations about those macros.
+ */
+
+#ifndef BUILDROOT_SYS_CDEFS_H
+#define BUILDROOT_SYS_CDEFS_H
+
+#undef __P
+#define __P(arg) arg
+
+#ifdef __cplusplus
+#define __BEGIN_DECLS extern "C" {
+#define __END_DECLS   }
+#else
+#define __BEGIN_DECLS
+#define __END_DECLS
+#endif
+
+#endif /* ifndef BUILDROOT_SYS_CDEFS_H */
diff --git a/package/netbsd-queue/netbsd-queue.hash b/package/musl-compat-headers/musl-compat-headers.hash
similarity index 100%
rename from package/netbsd-queue/netbsd-queue.hash
rename to package/musl-compat-headers/musl-compat-headers.hash
diff --git a/package/musl-compat-headers/musl-compat-headers.mk b/package/musl-compat-headers/musl-compat-headers.mk
new file mode 100644
index 0000000..0758021
--- /dev/null
+++ b/package/musl-compat-headers/musl-compat-headers.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# musl-compat-headers
+#
+################################################################################
+
+MUSL_COMPAT_HEADERS_SITE = http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/sys
+MUSL_COMPAT_HEADERS_VERSION = 1.70
+MUSL_COMPAT_HEADERS_SOURCE = queue.h?rev=$(MUSL_COMPAT_HEADERS_VERSION)
+MUSL_COMPAT_HEADERS_LICENSE = BSD-3c, Public Domain or CC0
+
+MUSL_COMPAT_HEADERS_ADD_TOOLCHAIN_DEPENDENCY = NO
+
+# Only installs headers
+MUSL_COMPAT_HEADERS_INSTALL_TARGET = NO
+MUSL_COMPAT_HEADERS_INSTALL_STAGING = YES
+
+define MUSL_COMPAT_HEADERS_EXTRACT_CMDS
+	cp $(DL_DIR)/$(MUSL_COMPAT_HEADERS_SOURCE) $(@D)/queue.h
+endef
+
+define MUSL_COMPAT_HEADERS_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/queue.h \
+		$(STAGING_DIR)/usr/include/sys/queue.h
+	$(INSTALL) -D -m 0644 $(MUSL_COMPAT_HEADERS_PKGDIR)/cdefs.h \
+		$(STAGING_DIR)/usr/include/sys/cdefs.h
+endef
+
+$(eval $(generic-package))
diff --git a/package/musl/Config.in b/package/musl/Config.in
index c263006..18ae69d 100644
--- a/package/musl/Config.in
+++ b/package/musl/Config.in
@@ -3,5 +3,6 @@ config BR2_PACKAGE_MUSL
 	depends on BR2_TOOLCHAIN_USES_MUSL
 	default y
 	select BR2_PACKAGE_LINUX_HEADERS
-	select BR2_PACKAGE_NETBSD_QUEUE
 	select BR2_TOOLCHAIN_HAS_SSP
+	# Compatibility headers: cdefs.h, queue.h
+	select BR2_PACKAGE_MUSL_COMPAT_HEADERS
diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 920bbbf..f8ea377 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -13,10 +13,12 @@ MUSL_LICENSE_FILES = COPYRIGHT
 # cross-compiler and the kernel headers
 MUSL_DEPENDENCIES = host-gcc-initial linux-headers
 
-# musl does not provide a sys/queue.h implementation, so add the
-# netbsd-queue package that will install a sys/queue.h file in the
-# staging directory based on the NetBSD implementation.
-MUSL_DEPENDENCIES += netbsd-queue
+# musl does not provide an implementation for sys/queue.h or sys/cdefs.h. So,
+# add the netbsd-compat-headers package that will install those files, into
+# the staging directory:
+#   sys/queue.h:  header from NetBSD
+#   sys/cdefs.h:  minimalist header bundled in Buildroot
+MUSL_DEPENDENCIES += musl-compat-headers
 
 # musl is part of the toolchain so disable the toolchain dependency
 MUSL_ADD_TOOLCHAIN_DEPENDENCY = NO
diff --git a/package/netbsd-queue/Config.in b/package/netbsd-queue/Config.in
deleted file mode 100644
index 7837f4c..0000000
--- a/package/netbsd-queue/Config.in
+++ /dev/null
@@ -1,2 +0,0 @@
-config BR2_PACKAGE_NETBSD_QUEUE
-	bool
diff --git a/package/netbsd-queue/netbsd-queue.mk b/package/netbsd-queue/netbsd-queue.mk
deleted file mode 100644
index 5fd926b..0000000
--- a/package/netbsd-queue/netbsd-queue.mk
+++ /dev/null
@@ -1,24 +0,0 @@
-################################################################################
-#
-# netbsd-queue
-#
-################################################################################
-
-NETBSD_QUEUE_VERSION = 1.70
-NETBSD_QUEUE_SITE = http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/sys
-NETBSD_QUEUE_SOURCE = queue.h?rev=$(NETBSD_QUEUE_VERSION)
-NETBSD_QUEUE_LICENSE = BSD-3c
-
-NETBSD_QUEUE_ADD_TOOLCHAIN_DEPENDENCY = NO
-NETBSD_QUEUE_INSTALL_STAGING = YES
-
-define NETBSD_QUEUE_EXTRACT_CMDS
-	cp $(DL_DIR)/$(NETBSD_QUEUE_SOURCE) $(@D)/queue.h
-endef
-
-define NETBSD_QUEUE_INSTALL_STAGING_CMDS
-	$(INSTALL) -D -m 0644 $(@D)/queue.h \
-		$(STAGING_DIR)/usr/include/sys/queue.h
-endef
-
-$(eval $(generic-package))
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index f54fbee..63b7712 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -727,7 +727,8 @@ config BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 config BR2_TOOLCHAIN_EXTERNAL_MUSL
 	bool
 	select BR2_TOOLCHAIN_USES_MUSL
-	select BR2_PACKAGE_NETBSD_QUEUE
+	# Compatibility headers: cdefs.h, queue.h
+	select BR2_PACKAGE_MUSL_COMPAT_HEADERS
 
 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 29c1f36..967f022 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -246,11 +246,13 @@ TOOLCHAIN_EXTERNAL_CFLAGS += -msoft-float
 TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_SOFTFLOAT=1
 endif
 
-# musl does not provide a sys/queue.h implementation, so add the
-# netbsd-queue package that will install a sys/queue.h file in the
-# staging directory based on the NetBSD implementation.
+# musl does not provide an implementation for sys/queue.h or sys/cdefs.h. So,
+# add the netbsd-compat-headers package that will install those files, into
+# the staging directory:
+#   sys/queue.h:  header from NetBSD
+#   sys/cdefs.h:  minimalist header bundled in Buildroot
 ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
-TOOLCHAIN_EXTERNAL_DEPENDENCIES += netbsd-queue
+TOOLCHAIN_EXTERNAL_DEPENDENCIES += musl-compat-headers
 endif
 
 # The Linaro toolchain expects the libraries in
-- 
2.7.4
