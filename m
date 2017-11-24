From: Markus Mayer <code@mmayer.net>
Date: Fri, 24 Nov 2017 14:05:54 -0800
Subject: [Buildroot] [RFC] bzip2: introduce make variable LIBDIR
Message-ID: <20171124220554.24261-1-code@mmayer.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markus Mayer <mmayer@broadcom.com>

In order to allow us to install libz2 into a location other than
/usr/lib, we introduce a variable called LIBDIR that can be set by
the build system to an alternate location.

LIBDIR defaults to /usr/lib, so the behaviour doesn't change if
LIBDIR is never set.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---

Most package in buildroot seem to offer the flexibility to install
libraries into directories specified by the user (build system) rather
than hard-coding the destination in the way bzip2 does.

I am looking for some feedback regarding this change.

Since the changes touch the makefiles that are part of the bzip2
distribution, the changes have to be applied in the form of a patch.
Also, patches 3 & 4 somewhat relate to the already existing patch 2.

My question is whether patches 2-4 should be combined into a single
patch or if it is preferable to keep them separate.

 package/bzip2/0003-add-libdir-to-makefile.patch    | 36 ++++++++++++++++++++++
 .../bzip2/0004-add-libdir-to-makefile-libbz2.patch | 31 +++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 package/bzip2/0003-add-libdir-to-makefile.patch
 create mode 100644 package/bzip2/0004-add-libdir-to-makefile-libbz2.patch

diff --git a/package/bzip2/0003-add-libdir-to-makefile.patch b/package/bzip2/0003-add-libdir-to-makefile.patch
new file mode 100644
index 0000000..3172a3a
--- /dev/null
+++ b/package/bzip2/0003-add-libdir-to-makefile.patch
@@ -0,0 +1,36 @@
+Introduce LIBDIR to Makefile
+
+The variable LIBDIR allows us to override where libbz2 is installed.
+
+Index: bzip2-1.0.6/Makefile
+===================================================================
+--- bzip2-1.0.6.orig/Makefile	2010-09-10 15:46:02.000000000 -0700
++++ bzip2-1.0.6/Makefile	2017-11-23 12:51:53.318896836 -0800
+@@ -19,6 +19,7 @@
+ AR=ar
+ RANLIB=ranlib
+ LDFLAGS=
++LIBDIR ?= lib
+ 
+ override CFLAGS += -Wall
+ 
+@@ -71,7 +73,7 @@
+ 
+ install: bzip2 bzip2recover
+ 	if ( test ! -d $(PREFIX)/bin ) ; then mkdir -p $(PREFIX)/bin ; fi
+-	if ( test ! -d $(PREFIX)/lib ) ; then mkdir -p $(PREFIX)/lib ; fi
++	if ( test ! -d $(PREFIX)/$(LIBDIR) ) ; then mkdir -p $(PREFIX)/$(LIBDIR) ; fi
+ 	if ( test ! -d $(PREFIX)/man ) ; then mkdir -p $(PREFIX)/man ; fi
+ 	if ( test ! -d $(PREFIX)/man/man1 ) ; then mkdir -p $(PREFIX)/man/man1 ; fi
+ 	if ( test ! -d $(PREFIX)/include ) ; then mkdir -p $(PREFIX)/include ; fi
+@@ -87,8 +89,8 @@
+ 	chmod a+r $(PREFIX)/man/man1/bzip2.1
+ 	cp -f bzlib.h $(PREFIX)/include
+ 	chmod a+r $(PREFIX)/include/bzlib.h
+-	cp -f libbz2.a $(PREFIX)/lib
+-	chmod a+r $(PREFIX)/lib/libbz2.a
++	cp -f libbz2.a $(PREFIX)/$(LIBDIR)
++	chmod a+r $(PREFIX)/$(LIBDIR)/libbz2.a
+ 	cp -f bzgrep $(PREFIX)/bin/bzgrep
+ 	ln -s -f $(PREFIX)/bin/bzgrep $(PREFIX)/bin/bzegrep
+ 	ln -s -f $(PREFIX)/bin/bzgrep $(PREFIX)/bin/bzfgrep
diff --git a/package/bzip2/0004-add-libdir-to-makefile-libbz2.patch b/package/bzip2/0004-add-libdir-to-makefile-libbz2.patch
new file mode 100644
index 0000000..22390d6
--- /dev/null
+++ b/package/bzip2/0004-add-libdir-to-makefile-libbz2.patch
@@ -0,0 +1,31 @@
+Introduce LIBDIR to Makefile-libbz2_so
+
+The variable LIBDIR allows us to override where libbz2 is installed.
+
+Index: bzip2-1.0.6/Makefile
+===================================================================
+--- bzip2-1.0.6/Makefile-libbz2_so.orig	2017-11-23 11:08:33.067637637 -0800
++++ bzip2-1.0.6/Makefile-libbz2_so	2017-11-23 12:51:38.694728036 -0800
+@@ -23,6 +23,9 @@
+ 
+ SHELL=/bin/sh
+ CC=gcc
++
++LIBDIR ?= lib
++
+ override CFLAGS += -fpic -fPIC -Wall
+ 
+ OBJS= blocksort.sho  \
+@@ -38,9 +41,9 @@
+ 	$(CC) $(CFLAGS) -o bzip2-shared bzip2.c libbz2.so.1.0.6
+ 
+ install:
+-	install -m 0755 -D libbz2.so.1.0.6 $(PREFIX)/lib/libbz2.so.1.0.6
+-	ln -sf libbz2.so.1.0.6 $(PREFIX)/lib/libbz2.so
+-	ln -sf libbz2.so.1.0.6 $(PREFIX)/lib/libbz2.so.1.0
++	install -m 0755 -D libbz2.so.1.0.6 $(PREFIX)/$(LIBDIR)/libbz2.so.1.0.6
++	ln -sf libbz2.so.1.0.6 $(PREFIX)/$(LIBDIR)/libbz2.so
++	ln -sf libbz2.so.1.0.6 $(PREFIX)/$(LIBDIR)/libbz2.so.1.0
+ 
+ clean: 
+ 	rm -f $(OBJS) bzip2.o libbz2.so.1.0.6 libbz2.so.1.0 bzip2-shared
-- 
2.7.4
