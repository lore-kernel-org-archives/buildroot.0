From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 Dec 2009 20:11:32 +0100
Subject: [Buildroot] [git commit master] Bump bind to 9.5.2-P1
Message-ID: <20091206191145.BD66F777F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b5867d93ae9c2264b4cd9bce07623eb45f53c668
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #773.

Unspecified vulnerability in ISC BIND 9.4 before 9.4.3-P4, 9.5 before
9.5.2-P1, 9.6 before 9.6.1-P2, 9.7 beta before 9.7.0b3, and 9.0.x through
9.3.x with DNSSEC validation enabled and checking disabled (CD), allows
remote attackers to conduct DNS cache poisoning attacks via additional
sections in a response sent for resolution of a recursive client query,
which is not properly handled when the response is processed "at the same
time as requesting DNSSEC records (DO)."

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                              |    4 +++-
 package/bind/bind-susv3-legacy.patch |   19 ++++---------------
 package/bind/bind.mk                 |    4 ++--
 3 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/CHANGES b/CHANGES
index 904bb48..a40fd39 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,6 +1,7 @@
 2010.02, Not yet released:
 
-	Updated/fixed packages: autoconf, binutils, busybox, lighttpd, pcre
+	Updated/fixed packages: autoconf, bind, binutils, busybox, iw,
+	lighttpd, pcre, usbutils
 
 	Issues resolved (http://bugs.uclibc.org):
 
@@ -11,6 +12,7 @@
 	#763: [SECURITY] Update pcre to 7.9
 	#765: Add buildroot branding to gcc
 	#767: Bump iw package to 0.9.18
+	#773: [SECURITY] Update bind to 9.5.2-P1
 
 2009.11, Released December 1st, 2009:
 
diff --git a/package/bind/bind-susv3-legacy.patch b/package/bind/bind-susv3-legacy.patch
index 01a38b2..99be15c 100644
--- a/package/bind/bind-susv3-legacy.patch
+++ b/package/bind/bind-susv3-legacy.patch
@@ -1,23 +1,12 @@
-diff -Nura bind-9.5.1-P1/lib/isc/unix/ifiter_ioctl.c bind-9.5.1-P1.nosusv3/lib/isc/unix/ifiter_ioctl.c
---- bind-9.5.1-P1/lib/isc/unix/ifiter_ioctl.c	2007-08-30 03:02:28.000000000 -0300
-+++ bind-9.5.1-P1.nosusv3/lib/isc/unix/ifiter_ioctl.c	2009-03-04 16:31:20.000000000 -0200
+diff -Nura bind-9.5.2-P1/lib/isc/unix/ifiter_ioctl.c bind-9.5.2-P1.nosusv3/lib/isc/unix/ifiter_ioctl.c
+--- bind-9.5.2-P1/lib/isc/unix/ifiter_ioctl.c	2009-02-15 22:53:58.000000000 -0200
++++ bind-9.5.2-P1.nosusv3/lib/isc/unix/ifiter_ioctl.c	2009-12-03 13:12:56.000000000 -0300
 @@ -17,6 +17,8 @@
  
- /* $Id: ifiter_ioctl.c,v 1.58 2007/08/30 06:02:28 marka Exp $ */
+ /* $Id: ifiter_ioctl.c,v 1.58.90.3 2009/02/16 00:53:58 marka Exp $ */
  
 +#include <string.h>
 +
  /*! \file
   * \brief
   * Obtain the list of network interfaces using the SIOCGLIFCONF ioctl.
-@@ -479,8 +481,8 @@
- 	for (i = 0; i < 16; i++) {
- 		unsigned char byte;
- 		static const char hex[] = "0123456789abcdef";
--		byte = ((index(hex, address[i * 2]) - hex) << 4) |
--		       (index(hex, address[i * 2 + 1]) - hex);
-+		byte = ((strchr(hex, address[i * 2]) - hex) << 4) |
-+			(strchr(hex, address[i * 2 + 1]) - hex);
- 		addr6.s6_addr[i] = byte;
- 	}
- 	iter->current.af = AF_INET6;
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index a7fca8f..4661eeb 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -3,8 +3,8 @@
 # bind
 #
 #############################################################
-BIND_VERSION = 9.5.1-P3
-BIND_SOURCE = bind-$(BIND_VERSION).tar.gz
+
+BIND_VERSION = 9.5.2-P1
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_LIBTOOL_PATCH = NO
 BIND_INSTALL_STAGING = NO
-- 
1.6.3.3
