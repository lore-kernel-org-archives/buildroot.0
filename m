From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 01 Dec 2011 08:58:31 -0000
Subject: [Buildroot] [git commit] dropbear: bump to version 2011.54
Message-ID: <20111201085828.CEE7D8F626@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8b56bfe8385826c6417dbc8dc731ad535b0de3b5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../dropbear-0.53.1-static_build_fix.patch         |   26 --------------------
 package/dropbear/dropbear-2011.54-no-ipv6.patch    |   18 +++++++++++++
 package/dropbear/dropbear.mk                       |    3 +-
 3 files changed, 19 insertions(+), 28 deletions(-)

diff --git a/package/dropbear/dropbear-0.53.1-static_build_fix.patch b/package/dropbear/dropbear-0.53.1-static_build_fix.patch
deleted file mode 100644
index 0e0a91a..0000000
--- a/package/dropbear/dropbear-0.53.1-static_build_fix.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-dropbear: fix static build
-
-the -lcrypt is missing during the link
-
-svr-authpasswd.o: In function `svr_auth_password':
-svr-authpasswd.c:(.text+0xfc): undefined reference to `crypt'
-collect2: ld returned 1 exit status
-
-Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
----
- Makefile.in |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: b/Makefile.in
-===================================================================
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -77,7 +77,7 @@ STRIP=@STRIP@
- INSTALL=@INSTALL@
- CPPFLAGS=@CPPFLAGS@
- CFLAGS+=-I. -I$(srcdir) $(CPPFLAGS) @CFLAGS@
--LIBS+=@LIBS@
-+LIBS+=@CRYPTLIB@ @LIBS@
- LDFLAGS=@LDFLAGS@
- 
- EXEEXT=@EXEEXT@
diff --git a/package/dropbear/dropbear-2011.54-no-ipv6.patch b/package/dropbear/dropbear-2011.54-no-ipv6.patch
new file mode 100644
index 0000000..4ee9aaa
--- /dev/null
+++ b/package/dropbear/dropbear-2011.54-no-ipv6.patch
@@ -0,0 +1,18 @@
+Check for IPV6_TCLASS instead of IPPROTO_IPV6 since
+it's present on non-IPv6 enabled toolchains too.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+
+diff -Nura dropbear-2011.54.orig/dbutil.c dropbear-2011.54/dbutil.c
+--- dropbear-2011.54.orig/dbutil.c	2011-11-08 09:48:15.000000000 -0300
++++ dropbear-2011.54/dbutil.c	2011-11-09 12:14:59.430074138 -0300
+@@ -164,7 +164,7 @@
+ 	/* set the TOS bit for either ipv4 or ipv6 */
+ #ifdef IPTOS_LOWDELAY
+ 	val = IPTOS_LOWDELAY;
+-#ifdef IPPROTO_IPV6
++#ifdef IPV6_TCLASS
+ 	setsockopt(sock, IPPROTO_IPV6, IPV6_TCLASS, (void*)&val, sizeof(val));
+ #endif
+ 	setsockopt(sock, IPPROTO_IP, IP_TOS, (void*)&val, sizeof(val));
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index bced0ef..5fa50ba 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,8 +4,7 @@
 #
 #############################################################
 
-DROPBEAR_VERSION = 0.53.1
-DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.gz
+DROPBEAR_VERSION = 2011.54
 DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_TARGET_BINS = dbclient dropbearkey dropbearconvert scp ssh
 DROPBEAR_MAKE =	$(MAKE) MULTI=1 SCPPROGRESS=1 \
