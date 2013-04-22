From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 21 Apr 2013 22:12:10 -0300
Subject: [Buildroot] [PATCH 2/2] dropbear: bump to version 2013.58
In-Reply-To: <1366593130-18331-1-git-send-email-gustavo@zacarias.com.ar>
References: <1366593130-18331-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1366593130-18331-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dropbear/dropbear-fix-no-zlib.patch | 32 -----------------------------
 package/dropbear/dropbear.mk                |  2 +-
 2 files changed, 1 insertion(+), 33 deletions(-)
 delete mode 100644 package/dropbear/dropbear-fix-no-zlib.patch

diff --git a/package/dropbear/dropbear-fix-no-zlib.patch b/package/dropbear/dropbear-fix-no-zlib.patch
deleted file mode 100644
index ecf3f09..0000000
--- a/package/dropbear/dropbear-fix-no-zlib.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-
-# HG changeset patch
-# User Matt Johnston <matt@ucc.asn.au>
-# Date 1366121792 -28800
-# Node ID f110d321fe7abb8864a1ab3268984f7cb02ac285
-# Parent  029e769c33c697f9255c40d6552f0aa81466eeed
-Fix build when zlib is disabled, from
-http://freetz.org/browser/trunk/make/dropbear/patches/350-no_zlib_fix.patch
-
-diff -r 029e769c33c6 -r f110d321fe7a common-kex.c
---- a/common-kex.c	Mon Apr 15 22:11:11 2013 +0800
-+++ b/common-kex.c	Tue Apr 16 22:16:32 2013 +0800
-@@ -171,14 +171,18 @@
- 	}
- 	if (ses.kexstate.recvnewkeys && ses.newkeys->recv.valid) {
- 		TRACE(("switch_keys recv"))
-+#ifndef DISABLE_ZLIB
- 		gen_new_zstream_recv();
-+#endif
- 		ses.keys->recv = ses.newkeys->recv;
- 		m_burn(&ses.newkeys->recv, sizeof(ses.newkeys->recv));
- 		ses.newkeys->recv.valid = 0;
- 	}
- 	if (ses.kexstate.sentnewkeys && ses.newkeys->trans.valid) {
- 		TRACE(("switch_keys trans"))
-+#ifndef DISABLE_ZLIB
- 		gen_new_zstream_trans();
-+#endif
- 		ses.keys->trans = ses.newkeys->trans;
- 		m_burn(&ses.newkeys->trans, sizeof(ses.newkeys->trans));
- 		ses.newkeys->trans.valid = 0;
-
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 0715555..d5dfe6d 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-DROPBEAR_VERSION = 2013.57
+DROPBEAR_VERSION = 2013.58
 DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_TARGET_BINS = dbclient dropbearkey dropbearconvert scp ssh
-- 
1.8.1.5
