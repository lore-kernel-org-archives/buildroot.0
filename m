From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 24 Feb 2012 14:11:16 +0100
Subject: [Buildroot] [git commit] dropbear: bump version, fixes CVE-2012-0920
Message-ID: <20120224132029.6304F90B59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=086bdfd378a0eeb85fc18fa7c05fdff64d1a3bea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From the release notes:

Security: Fix use-after-free bug that could be triggered if command="..."
authorized_keys restrictions are used.  Could allow arbitrary code
execution or bypass of the command="..." restriction to an authenticated
user.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dropbear/dropbear-2011.54-no-ipv6.patch |   18 ------------------
 package/dropbear/dropbear.mk                    |    2 +-
 2 files changed, 1 insertions(+), 19 deletions(-)

diff --git a/package/dropbear/dropbear-2011.54-no-ipv6.patch b/package/dropbear/dropbear-2011.54-no-ipv6.patch
deleted file mode 100644
index 4ee9aaa..0000000
--- a/package/dropbear/dropbear-2011.54-no-ipv6.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Check for IPV6_TCLASS instead of IPPROTO_IPV6 since
-it's present on non-IPv6 enabled toolchains too.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
-
-diff -Nura dropbear-2011.54.orig/dbutil.c dropbear-2011.54/dbutil.c
---- dropbear-2011.54.orig/dbutil.c	2011-11-08 09:48:15.000000000 -0300
-+++ dropbear-2011.54/dbutil.c	2011-11-09 12:14:59.430074138 -0300
-@@ -164,7 +164,7 @@
- 	/* set the TOS bit for either ipv4 or ipv6 */
- #ifdef IPTOS_LOWDELAY
- 	val = IPTOS_LOWDELAY;
--#ifdef IPPROTO_IPV6
-+#ifdef IPV6_TCLASS
- 	setsockopt(sock, IPPROTO_IPV6, IPV6_TCLASS, (void*)&val, sizeof(val));
- #endif
- 	setsockopt(sock, IPPROTO_IP, IP_TOS, (void*)&val, sizeof(val));
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 5fa50ba..fea96d6 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-DROPBEAR_VERSION = 2011.54
+DROPBEAR_VERSION = 2012.55
 DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_TARGET_BINS = dbclient dropbearkey dropbearconvert scp ssh
 DROPBEAR_MAKE =	$(MAKE) MULTI=1 SCPPROGRESS=1 \
