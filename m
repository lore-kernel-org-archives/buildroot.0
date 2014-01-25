From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 25 Jan 2014 16:26:48 +0100
Subject: [Buildroot] [PATCH] rtmpdump: fix build with selected crypto
Message-ID: <1390663608-1481-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After the patch 42ed108013082c6836673aabe8d6258f9e7a490f, the defaut
crypto engine became GNUTLS, this made the build failed as the CFLAGS
variable where not correctly passed to the Makefile.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc:"Yann E. MORIN" <yann.morin.1998@free.fr>
---
 ...p-0001-Fix-override-of-CFLAGS-and-LDFLAGS.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/rtmpdump/rtmpdump-0001-Fix-override-of-CFLAGS-and-LDFLAGS.patch

diff --git a/package/rtmpdump/rtmpdump-0001-Fix-override-of-CFLAGS-and-LDFLAGS.patch b/package/rtmpdump/rtmpdump-0001-Fix-override-of-CFLAGS-and-LDFLAGS.patch
new file mode 100644
index 0000000..7d5d584
--- /dev/null
+++ b/package/rtmpdump/rtmpdump-0001-Fix-override-of-CFLAGS-and-LDFLAGS.patch
@@ -0,0 +1,43 @@
+From 3c44f11aefe70f4ed1660a614441bbdd5220e332 Mon Sep 17 00:00:00 2001
+From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
+Date: Sat, 25 Jan 2014 16:14:35 +0100
+Subject: [PATCH] Fix override of CFLAGS and LDFLAGS
+
+Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
+---
+ Makefile         | 4 ++--
+ librtmp/Makefile | 3 +--
+ 2 files changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index a1595a8..3c1eaba 100644
+--- a/Makefile
++++ b/Makefile
+@@ -21,8 +21,8 @@ CRYPTO_DEF=$(DEF_$(CRYPTO))
+ 
+ DEF=-DRTMPDUMP_VERSION=\"$(VERSION)\" $(CRYPTO_DEF) $(XDEF)
+ OPT=-O2
+-CFLAGS=-Wall $(XCFLAGS) $(INC) $(DEF) $(OPT)
+-LDFLAGS=-Wall $(XLDFLAGS)
++override CFLAGS +=-Wall $(INC) $(DEF) $(OPT)
++override LDFLAGS +=-Wall
+ 
+ bindir=$(prefix)/bin
+ sbindir=$(prefix)/sbin
+diff --git a/librtmp/Makefile b/librtmp/Makefile
+index 74ee3b5..a1f2bbc 100644
+--- a/librtmp/Makefile
++++ b/librtmp/Makefile
+@@ -72,8 +72,7 @@ SO_INST=$(SOINST_$(SHARED))
+ 
+ DEF=-DRTMPDUMP_VERSION=\"$(VERSION)\" $(CRYPTO_DEF) $(XDEF)
+ OPT=-O2
+-CFLAGS=-Wall $(XCFLAGS) $(INC) $(DEF) $(OPT) $(SO_DEF)
+-LDFLAGS=$(XLDFLAGS)
++override CFLAGS +=-Wall $(INC) $(DEF) $(OPT) $(SO_DEF)
+ 
+ 
+ OBJS=rtmp.o log.o amf.o hashswf.o parseurl.o
+-- 
+1.8.5.2
+
-- 
1.8.5.2
