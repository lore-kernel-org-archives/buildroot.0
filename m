From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Thu,  1 May 2014 14:59:11 +0200
Subject: [Buildroot] [PATCH 1/1] qlibc : new package
Message-ID: <1398949151-18546-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


qlibc Features:
	General Containers.
	===================
 	List ? Doubly Linked List.
	List Table ? KEY/VALUE paired table implemented on linked-list.
 	Hash Table ? Hash based KEY/VALUE paired table.
 	Static Hash Table ? Static(array/mmapped/shared) memory
		based KEY/VALUE paired table.
 	Vector ? implements a growable array of elements.
	Queue ? FIFO(First In First Out) implementation.
	Stack ? LIFO(Last In First Out) implementation.

	General utilities.
	==================
	String
	I/O
	File
	IPC(Semaphore, Shared-memory)
	En/decoders
	Hashes
	System
	Time
	and more...
	
	Extensions.
	===========
	INI-style Configuration File Parser.
	Apache-style Configuration File Parser.
	Rotating File Logger.
	HTTP client.
	Database(MySQL) interface.
	
qlibc is well documented and maintained.

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/Config.in                                  |  1 +
 package/qlibc/Config.in                            | 10 ++++++++
 .../qlibc-0001-remove-absolute-host-paths.patch    | 30 ++++++++++++++++++++++
 .../qlibc-0002-set-include-and-lib-dirs.patch      | 28 ++++++++++++++++++++
 package/qlibc/qlibc.mk                             | 22 ++++++++++++++++
 5 files changed, 91 insertions(+)
 create mode 100644 package/qlibc/Config.in
 create mode 100644 package/qlibc/qlibc-0001-remove-absolute-host-paths.patch
 create mode 100644 package/qlibc/qlibc-0002-set-include-and-lib-dirs.patch
 create mode 100644 package/qlibc/qlibc.mk

diff --git a/package/Config.in b/package/Config.in
index 998f990..ce48a89 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -835,6 +835,7 @@ source "package/poco/Config.in"
 source "package/protobuf/Config.in"
 source "package/protobuf-c/Config.in"
 source "package/qhull/Config.in"
+source "package/qlibc/Config.in"
 source "package/schifra/Config.in"
 source "package/startup-notification/Config.in"
 source "package/tz/Config.in"
diff --git a/package/qlibc/Config.in b/package/qlibc/Config.in
new file mode 100644
index 0000000..5efda60
--- /dev/null
+++ b/package/qlibc/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_QLIBC
+	bool "qlibc"
+	help
+	  qLibc is currently one of the most functionally
+	  complete public licensed C/C++ libraries.
+	  The C/C++ library which includes all kinds of containers
+	  and general library routines.It provides ready-made set
+	  of common container APIs with consistant API look.
+	  
+	  http://www.qdecoder.org/wiki/qlibc
diff --git a/package/qlibc/qlibc-0001-remove-absolute-host-paths.patch b/package/qlibc/qlibc-0001-remove-absolute-host-paths.patch
new file mode 100644
index 0000000..7b54a42
--- /dev/null
+++ b/package/qlibc/qlibc-0001-remove-absolute-host-paths.patch
@@ -0,0 +1,30 @@
+From 865acb3b204abfb6385e052e830f36143d157dbf Mon Sep 17 00:00:00 2001
+From: Sagaert Johan <sagaert.johan@skynet.be>
+Date: Wed, 30 Apr 2014 23:57:42 +0200
+Subject: [PATCH 1/1] remove absolute host paths
+
+Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index ed5e78e..3b4267d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -85,10 +85,10 @@ AC_SUBST(DEPLIBS, [""])
+ 
+ ## Set path
+ PATH="$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin"
+-CPPFLAGS="$CPPFLAGS -I/usr/include -I/usr/local/include"
++CPPFLAGS="$CPPFLAGS"
+ CPPFLAGS="$CPPFLAGS -D_GNU_SOURCE"
+ CPPFLAGS="$CPPFLAGS -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
+-LDFLAGS="$LDFLAGS -L/usr/lib -L/usr/local/lib"
++LDFLAGS="$LDFLAGS"
+ 
+ ## Set autoconf setting
+ #AC_CANONICAL_TARGET
+-- 
+1.9.2
+
diff --git a/package/qlibc/qlibc-0002-set-include-and-lib-dirs.patch b/package/qlibc/qlibc-0002-set-include-and-lib-dirs.patch
new file mode 100644
index 0000000..432d609
--- /dev/null
+++ b/package/qlibc/qlibc-0002-set-include-and-lib-dirs.patch
@@ -0,0 +1,28 @@
+From 8222df56530994be1fc2015f7c435910e7d386a2 Mon Sep 17 00:00:00 2001
+From: Sagaert Johan <sagaert.johan@skynet.be>
+Date: Thu, 1 May 2014 12:58:11 +0200
+Subject: [PATCH 1/1] set include and lib dirs
+
+Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
+---
+ src/Makefile.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/Makefile.in b/src/Makefile.in
+index 1a82f9f..78d03c4 100644
+--- a/src/Makefile.in
++++ b/src/Makefile.in
+@@ -42,8 +42,8 @@ RANLIB		= @RANLIB@
+ RM		= @RM@
+ 
+ ## Install directories
+-INST_INCDIR	= @includedir@
+-INST_LIBDIR	= @libdir@
++INST_INCDIR	= $(STAGING_DIR)/usr/include
++INST_LIBDIR	= $(STAGING_DIR)/usr/lib
+ 
+ ## Custom definitions
+ BUILD_TARGETS	= @BUILD_TARGETS@
+-- 
+1.9.2
+
diff --git a/package/qlibc/qlibc.mk b/package/qlibc/qlibc.mk
new file mode 100644
index 0000000..86f5031
--- /dev/null
+++ b/package/qlibc/qlibc.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# qlibc
+#
+################################################################################
+
+QLIBC_VERSION = v2.1.6
+QLIBC_SITE = $(call github,wolkykim,qlibc,$(QLIBC_VERSION))
+QLIBC_LICENSE = BSD-2
+QLIBC_LICENSE_FILES = COPYING
+QLIBC_AUTORECONF = YES
+QLIBC_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_MYSQL),y)
+	QLIBC_CONF_OPT += --with-mysql
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+	QLIBC_CONF_OPT += --with-openssl
+endif
+
+$(eval $(autotools-package))
-- 
1.9.2
