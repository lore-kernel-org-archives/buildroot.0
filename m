From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 20 May 2010 23:13:34 +0200
Subject: [Buildroot] [git commit master] ntp: fix build without ipv6 support
Message-ID: <20100520211429.B1FB78D4E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=484d15dea6f3175eb5b999592a7f4bb9d101c68a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1693

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                             |    6 +++++-
 package/ntp/ntp-optional-ipv6.patch |   24 ++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 1 deletions(-)
 create mode 100644 package/ntp/ntp-optional-ipv6.patch

diff --git a/CHANGES b/CHANGES
index c69debc..8c6d645 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,7 +2,11 @@
 
 	Fixes all over the tree.
 
-	Updated/fixed packages: aumix, avahi, busybox, mtd-utils
+	Updated/fixed packages: aumix, avahi, busybox, mtd-utils, ntp
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#1693: NTP trys IPV6 even if not configured error: 'IPV6_MULTICAST...
 
 2010.05-rc2, Released May 11th, 2010:
 
diff --git a/package/ntp/ntp-optional-ipv6.patch b/package/ntp/ntp-optional-ipv6.patch
new file mode 100644
index 0000000..20d6edf
--- /dev/null
+++ b/package/ntp/ntp-optional-ipv6.patch
@@ -0,0 +1,24 @@
+[PATCH] ntpd: fix build without ipv6 support
+
+ntp_io.c was checkin the non-existing DISABLE_IPV6 define rather
+than WANT_IPV6 as defined in config.h, breaking the build if
+the toolchain doesn't have ipv6 support.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ ntpd/ntp_io.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: ntp-4.2.4p5/ntpd/ntp_io.c
+===================================================================
+--- ntp-4.2.4p5.orig/ntpd/ntp_io.c
++++ ntp-4.2.4p5/ntpd/ntp_io.c
+@@ -55,7 +55,7 @@
+  * Set up some macros to look for IPv6 and IPv6 multicast
+  */
+ 
+-#if defined(ISC_PLATFORM_HAVEIPV6) && !defined(DISABLE_IPV6)
++#if defined(ISC_PLATFORM_HAVEIPV6) && defined(WANT_IPV6)
+ 
+ #define INCLUDE_IPV6_SUPPORT
+ 
-- 
1.6.3.3
