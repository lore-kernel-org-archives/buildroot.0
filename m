From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 17 Apr 2013 21:43:46 +0200
Subject: [Buildroot] [git commit] dropbear: bump to version 2013.57
Message-ID: <20130417195408.041089B71F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=af2522c07b95bd3fca1ac887ed45acf52d390297
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dropbear/dropbear-fix-no-zlib.patch     |   32 +++++++++++++++++++++++
 package/dropbear/dropbear-fix-vfork-logic.patch |   21 ---------------
 package/dropbear/dropbear.mk                    |    2 +-
 3 files changed, 33 insertions(+), 22 deletions(-)

diff --git a/package/dropbear/dropbear-fix-no-zlib.patch b/package/dropbear/dropbear-fix-no-zlib.patch
new file mode 100644
index 0000000..ecf3f09
--- /dev/null
+++ b/package/dropbear/dropbear-fix-no-zlib.patch
@@ -0,0 +1,32 @@
+
+# HG changeset patch
+# User Matt Johnston <matt@ucc.asn.au>
+# Date 1366121792 -28800
+# Node ID f110d321fe7abb8864a1ab3268984f7cb02ac285
+# Parent  029e769c33c697f9255c40d6552f0aa81466eeed
+Fix build when zlib is disabled, from
+http://freetz.org/browser/trunk/make/dropbear/patches/350-no_zlib_fix.patch
+
+diff -r 029e769c33c6 -r f110d321fe7a common-kex.c
+--- a/common-kex.c	Mon Apr 15 22:11:11 2013 +0800
++++ b/common-kex.c	Tue Apr 16 22:16:32 2013 +0800
+@@ -171,14 +171,18 @@
+ 	}
+ 	if (ses.kexstate.recvnewkeys && ses.newkeys->recv.valid) {
+ 		TRACE(("switch_keys recv"))
++#ifndef DISABLE_ZLIB
+ 		gen_new_zstream_recv();
++#endif
+ 		ses.keys->recv = ses.newkeys->recv;
+ 		m_burn(&ses.newkeys->recv, sizeof(ses.newkeys->recv));
+ 		ses.newkeys->recv.valid = 0;
+ 	}
+ 	if (ses.kexstate.sentnewkeys && ses.newkeys->trans.valid) {
+ 		TRACE(("switch_keys trans"))
++#ifndef DISABLE_ZLIB
+ 		gen_new_zstream_trans();
++#endif
+ 		ses.keys->trans = ses.newkeys->trans;
+ 		m_burn(&ses.newkeys->trans, sizeof(ses.newkeys->trans));
+ 		ses.newkeys->trans.valid = 0;
+
diff --git a/package/dropbear/dropbear-fix-vfork-logic.patch b/package/dropbear/dropbear-fix-vfork-logic.patch
deleted file mode 100644
index 2706bc8..0000000
--- a/package/dropbear/dropbear-fix-vfork-logic.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-
-# HG changeset patch
-# User Matt Johnston <matt@ucc.asn.au>
-# Date 1364743743 -28800
-# Node ID fedfb8ede1fdebad5d19df7bd4d452c3264d9545
-# Parent  f27058078d61a8c3a057530d3ddcd19bd5062569
-Fix incorrect logic for USE_VFORK and calling arg_setup()
-
-diff -r f27058078d61 -r fedfb8ede1fd scp.c
---- a/scp.c	Sun Mar 31 23:15:35 2013 +0800
-+++ b/scp.c	Sun Mar 31 23:29:03 2013 +0800
-@@ -230,7 +230,7 @@
- 		close(pin[0]);
- 		close(pout[1]);
- 
--#ifdef USE_VFORK
-+#ifndef USE_VFORK
- 		arg_setup(host, remuser, cmd);
- #endif
- 
-
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index cec57db..0715555 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-DROPBEAR_VERSION = 2013.56
+DROPBEAR_VERSION = 2013.57
 DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_TARGET_BINS = dbclient dropbearkey dropbearconvert scp ssh
