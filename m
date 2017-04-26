From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Apr 2017 09:20:15 +0200
Subject: [Buildroot] [git commit] package/aircrack-ng: bump version to
	1.2-rc4
Message-ID: <20170426072113.73E1680648@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cddb22ac2b627b9af7c52b724d5648d90c343e8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patches applied upstream:

0001-Makefile-use-pkg-config-to-find-libpcre-it-s-more-cros.patch
http://trac.aircrack-ng.org/changeset/2445

0002-Optionally-use-LIBPCAP-for-required-libpcap-libraries.patch
http://trac.aircrack-ng.org/changeset/2446

0003-Wesside-ng-Use-termios-instead-of-sys-termios.patch
http://trac.aircrack-ng.org/changeset/2533

Added option to disable stack-protector support auto-detection in gcc.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...pkg-config-to-find-libpcre-it-s-more-cros.patch | 39 ---------------
 package/aircrack-ng/0001-stack-protector.patch     | 58 ++++++++++++++++++++++
 ...se-LIBPCAP-for-required-libpcap-libraries.patch | 33 ------------
 ...ide-ng-Use-termios-instead-of-sys-termios.patch | 27 ----------
 package/aircrack-ng/aircrack-ng.hash               |  4 +-
 package/aircrack-ng/aircrack-ng.mk                 |  8 ++-
 6 files changed, 67 insertions(+), 102 deletions(-)

diff --git a/package/aircrack-ng/0001-Makefile-use-pkg-config-to-find-libpcre-it-s-more-cros.patch b/package/aircrack-ng/0001-Makefile-use-pkg-config-to-find-libpcre-it-s-more-cros.patch
deleted file mode 100644
index 733e0c0..0000000
--- a/package/aircrack-ng/0001-Makefile-use-pkg-config-to-find-libpcre-it-s-more-cros.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 98149c7664e99cc8ce9c9b1abf2fa90d9cd68e0d Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Wed, 5 Nov 2014 09:38:12 -0300
-Subject: [PATCH] Makefile: use pkg-config to find libpcre, it's more
- cross-compile friendly
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
-Status: Upstream http://trac.aircrack-ng.org/ticket/1526
-
-diff --git a/common.mak b/common.mak
-index 6e5694b..d875708 100644
---- a/common.mak
-+++ b/common.mak
-@@ -39,7 +39,7 @@ PCRE            = true
- endif
- 
- ifeq ($(PCRE), true)
--COMMON_CFLAGS += $(shell pcre-config --cflags) -DHAVE_PCRE
-+COMMON_CFLAGS += $(shell $(PKG_CONFIG) --cflags libpcre) -DHAVE_PCRE
- endif
- 
- ifeq ($(OSNAME), cygwin)
-diff --git a/src/Makefile b/src/Makefile
-index f9217f9..14350b6 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -16,7 +16,7 @@ BINFILES        = aircrack-ng$(EXE) airdecap-ng$(EXE) packetforge-ng$(EXE) \
- 
- LIBPCRE		=
- ifeq ($(PCRE), true)
--	LIBPCRE	= $(shell pcre-config --libs)
-+	LIBPCRE = $(shell $(PKG_CONFIG) --libs libpcre)
- endif
- 
- ifneq ($(OSNAME), cygwin) #There is yet no libpcap support for windows, so we skip the crawler
--- 
-2.0.4
-
diff --git a/package/aircrack-ng/0001-stack-protector.patch b/package/aircrack-ng/0001-stack-protector.patch
new file mode 100644
index 0000000..5f2bd1b
--- /dev/null
+++ b/package/aircrack-ng/0001-stack-protector.patch
@@ -0,0 +1,58 @@
+Added option to disable stack-protector support auto-detection in gcc.
+
+Downloaded from upstream commit:
+http://trac.aircrack-ng.org/changeset/2889/
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+Index: /trunk/INSTALLING
+===================================================================
+--- trunk/INSTALLING	(revision 2888)
++++ trunk/INSTALLING	(revision 2889)
+@@ -83,4 +83,6 @@
+ * macport:  Set this flag to true to compile on OS X with macports.
+ 
++* stackprotector: Allows to enable/disable auto-detection of stack-protector support in gcc
++
+ Example:
+ 
+Index: /trunk/common.mak
+===================================================================
+--- trunk/common.mak	(revision 2888)
++++ trunk/common.mak	(revision 2889)
+@@ -64,4 +64,13 @@
+ ifeq ($(PCRE), true)
+ COMMON_CFLAGS += $(shell $(PKG_CONFIG) --cflags libpcre) -DHAVE_PCRE
++endif
++
++STACK_PROTECTOR	= true
++ifeq ($(stackprotector), false)
++	STACK_PROTECTOR	= false
++endif
++
++ifeq ($(STACKPROTECTOR), false)
++	STACK_PROTECTOR	= false
+ endif
+ 
+@@ -235,12 +244,14 @@
+ endif
+ 
+-ifeq ($(GCC_OVER49), 0)
+-	ifeq ($(GCC_OVER41), 1)
+-		COMMON_CFLAGS += -fstack-protector
++ifeq ($(STACK_PROTECTOR), true)
++	ifeq ($(GCC_OVER49), 0)
++		ifeq ($(GCC_OVER41), 1)
++			COMMON_CFLAGS += -fstack-protector
++		endif
+ 	endif
+-endif
+-
+-ifeq ($(GCC_OVER49), 1)
+-	COMMON_CFLAGS += -fstack-protector-strong
++
++	ifeq ($(GCC_OVER49), 1)
++		COMMON_CFLAGS += -fstack-protector-strong
++	endif
+ endif
+ 
diff --git a/package/aircrack-ng/0002-Optionally-use-LIBPCAP-for-required-libpcap-libraries.patch b/package/aircrack-ng/0002-Optionally-use-LIBPCAP-for-required-libpcap-libraries.patch
deleted file mode 100644
index c92bb8d..0000000
--- a/package/aircrack-ng/0002-Optionally-use-LIBPCAP-for-required-libpcap-libraries.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 1abf7a6aad3d7931de2c01b578f62986b75de2f5 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Tue, 11 Nov 2014 16:23:42 -0300
-Subject: [PATCH] Optionally use LIBPCAP for required libpcap libraries
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
-Status: Reported http://trac.aircrack-ng.org/ticket/1528
-
-diff --git a/src/Makefile b/src/Makefile
-index 14350b6..7bd4271 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -23,6 +23,7 @@ ifneq ($(OSNAME), cygwin) #There is yet no libpcap support for windows, so we sk
- 	HAVE_PCAP	= $(shell ld -lpcap 2> /dev/null && echo yes)
- 	ifeq ($(HAVE_PCAP), yes) #cannot link with -lpcap, skip crawler
- 		BINFILES	+= besside-ng-crawler$(EXE)
-+		LIBPCAP		= -lpcap
- 	endif
- endif
- 
-@@ -168,7 +169,7 @@ besside-ng$(EXE): $(OBJS_BS) $(LIBOSD)
- 	$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS_BS) -o $(@) $(LIBS) $(LIBSSL) -lz $(LIBPCRE)
- 
- besside-ng-crawler$(EXE): $(OBJS_BC)
--	$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS_BC) -o $(@) -lpcap
-+	$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS_BC) -o $(@) $(LIBPCAP)
- 
- makeivs-ng$(EXE): $(OBJS_MI)
- 	$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS_MI) -o $(@) $(LDFLAGS)
--- 
-2.0.4
-
diff --git a/package/aircrack-ng/0003-Wesside-ng-Use-termios-instead-of-sys-termios.patch b/package/aircrack-ng/0003-Wesside-ng-Use-termios-instead-of-sys-termios.patch
deleted file mode 100644
index a10ee45..0000000
--- a/package/aircrack-ng/0003-Wesside-ng-Use-termios-instead-of-sys-termios.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 42de9f800056601443ac12edbba7bd5802740db2 Mon Sep 17 00:00:00 2001
-From: Thomas d'Otreppe <tdotreppe@aircrack-ng.org>
-Date: Wed, 8 Apr 2015 01:25:07 +0000
-Subject: [PATCH] Wesside-ng: Use termios instead of sys/termios.
-
-git-svn-id: http://svn.aircrack-ng.org/trunk at 2533 28c6078b-6c39-48e3-add9-af49d547ecab
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- src/wesside-ng.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/wesside-ng.c b/src/wesside-ng.c
-index 711d8b7..f44438a 100644
---- a/src/wesside-ng.c
-+++ b/src/wesside-ng.c
-@@ -33,7 +33,7 @@
- 
- #include <sys/types.h>
- #include <sys/socket.h>
--#include <sys/termios.h>
-+#include <termios.h>
- #include <sys/ioctl.h>
- #include <sys/stat.h>
- #include <sys/wait.h>
--- 
-2.4.3
-
diff --git a/package/aircrack-ng/aircrack-ng.hash b/package/aircrack-ng/aircrack-ng.hash
index 1ed27fc..e210ad2 100644
--- a/package/aircrack-ng/aircrack-ng.hash
+++ b/package/aircrack-ng/aircrack-ng.hash
@@ -1,3 +1,3 @@
 # From http://www.aircrack-ng.org/downloads.html
-sha1	b5ff7d0fffb72095311bbe8824ab98aaac62db8f	aircrack-ng-1.2-rc1.tar.gz
-md5	c2f8648c92f7e46051c86c618d4fb0d5	aircrack-ng-1.2-rc1.tar.gz
+sha1 2b2fbe50fedb606b3bd96a34d49f07760e8e618a aircrack-ng-1.2-rc4.tar.gz
+md5 3bbc7d5035a98ec01e78774d05c3fcce aircrack-ng-1.2-rc4.tar.gz
diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
index 8cf1f47..b728624 100644
--- a/package/aircrack-ng/aircrack-ng.mk
+++ b/package/aircrack-ng/aircrack-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AIRCRACK_NG_VERSION = 1.2-rc1
+AIRCRACK_NG_VERSION = 1.2-rc4
 AIRCRACK_NG_SITE = http://download.aircrack-ng.org
 AIRCRACK_NG_LICENSE = GPL-2.0+
 AIRCRACK_NG_LICENSE_FILES = LICENSE
@@ -24,6 +24,12 @@ AIRCRACK_NG_MAKE_OPTS += libnl=true
 AIRCRACK_NG_DEPENDENCIES += libnl
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_SSP),y)
+AIRCRACK_NG_MAKE_OPTS += STACK_PROTECTOR=true
+else
+AIRCRACK_NG_MAKE_OPTS += STACK_PROTECTOR=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPCAP),y)
 AIRCRACK_NG_DEPENDENCIES += libpcap
 AIRCRACK_NG_MAKE_OPTS += HAVE_PCAP=yes \
