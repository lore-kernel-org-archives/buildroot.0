From: Markus Mayer <mmayer@broadcom.com>
Date: Thu, 15 Feb 2018 16:56:11 -0800
Subject: [Buildroot] [RFC 5/6] bzip2: introduce make variable $(LIBDIR)
In-Reply-To: <20180216005612.69593-1-mmayer@broadcom.com>
References: <20180216005612.69593-1-mmayer@broadcom.com>
Message-ID: <20180216005612.69593-6-mmayer@broadcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to allow us to install libz2 into a location other than
/usr/lib, we introduce a variable called $(LIBDIR) that can be set by
the build system to an alternate location.

$(LIBDIR) defaults to /usr/lib, so the behaviour doesn't change if
$(LIBDIR) is never set.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 package/bzip2/0003-add-libdir-to-makefile.patch    | 36 ++++++++++++++++++++++
 .../bzip2/0004-add-libdir-to-makefile-libbz2.patch | 31 +++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 package/bzip2/0003-add-libdir-to-makefile.patch
 create mode 100644 package/bzip2/0004-add-libdir-to-makefile-libbz2.patch

diff --git a/package/bzip2/0003-add-libdir-to-makefile.patch b/package/bzip2/0003-add-libdir-to-makefile.patch
new file mode 100644
index 000000000000..8a724484bd1e
--- /dev/null
+++ b/package/bzip2/0003-add-libdir-to-makefile.patch
@@ -0,0 +1,36 @@
+Introduce $(LIBDIR) to Makefile
+
+The variable $(LIBDIR) allows us to override where libbz2 is installed.
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
index 000000000000..9b2f6b114fc6
--- /dev/null
+++ b/package/bzip2/0004-add-libdir-to-makefile-libbz2.patch
@@ -0,0 +1,31 @@
+Introduce $(LIBDIR) to Makefile-libbz2_so
+
+The variable $(LIBDIR) allows us to override where libbz2 is installed.
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
