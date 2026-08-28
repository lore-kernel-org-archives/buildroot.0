Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47F1C61DF0
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7801580F80;
	Fri, 28 Aug 2026 19:38:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gmQ_RNX6OKUd; Fri, 28 Aug 2026 19:38:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787945901;
	bh=RaHTjNWoMjjjl2oV1MKC4rr101HD3U+2l+RIX9kK2t8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=L2z9pNT7B0XzokssWfsdPuwMxHnw8M59T96aD4g1atC4BrRTjNd8CL/MvdXrAG4B6
	 svxCmQZU8xah5zQqnjJrSNPyJSIQ5Pc6it6lrcDa7yjN8EiY0vifh4PU+pc8Iv46V/
	 X6PlkiSC2mJ9XRPcK1i/sOa3zhnIpRjybfSzt+lT2iyB4mFJMGrMmNOXqBp8pFzpAZ
	 qQQfnxBaHzRf20NaKWYJBtRxxS47KJne5UWh9l10HWwIDogpfEUxDyyHARSxda00df
	 j9CuFvLUl96Ii5Eftk1Xvi+3andywAW1UfY89HOiV27WXG2clcnxpeffSPbeHltnmA
	 XAJTpAEcowjvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D39980F7D;
	Fri, 28 Aug 2026 19:38:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EF49B23E
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 19:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E14254081C
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 19:38:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jBfGpJWjmIN0 for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 19:38:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C810C4081A
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 19:38:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D43574E41407
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 19:38:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AB32760537;
 Fri, 28 Aug 2026 19:38:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7049211C78176; 
 Fri, 28 Aug 2026 21:38:12 +0200 (CEST)
To: Buildroot List <buildroot@buildroot.org>
Cc: Andreas Ziegler <br025@umbiko.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Aug 2026 21:38:00 +0200
Message-ID: <20260828193802.2404390-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828193802.2404390-1-thomas.petazzoni@bootlin.com>
References: <20260828193802.2404390-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH v2 1/2] package/libnfs: fix gnutls support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In Buildroot commit a035a0f99fa3bbeca776d741bbdeb6c04b3b35c8, libnfs
was bumped from 5.0.3 to 6.0.2, and 6.0.2 brought optional gnutls
support.

Unfortunately, the gnutls support was a bit buggy, as the libnfs
library ends up using gnutls symbols without being linked to
libgnutls, causing build failures down the road when other packages
try to link against libnfs.

We backport 3 commits from upstream 6.0.2..7.0.0 to address this
issue.

Fixes:

  https://autobuild.buildroot.net/results/b070248b2bceaceaaed8e826b1247ccfba1ba9fb
  https://autobuild.buildroot.net/results/e1461b76121addd8f04f08819b2e3e453a12c679
  https://autobuild.buildroot.net/results/87c79193d2ea86f47e36232fe514837ad99c5f30

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...t-gnutls-into-main-library-as-it-is-.patch | 26 ++++++++++++
 ...t-gnutls-into-main-library-as-it-is-.patch | 29 +++++++++++++
 ...defined-reference-if-libnfs-was-buil.patch | 41 +++++++++++++++++++
 3 files changed, 96 insertions(+)
 create mode 100644 package/libnfs/0004-move-link-against-gnutls-into-main-library-as-it-is-.patch
 create mode 100644 package/libnfs/0005-move-link-against-gnutls-into-main-library-as-it-is-.patch
 create mode 100644 package/libnfs/0006-autotools-fix-undefined-reference-if-libnfs-was-buil.patch

diff --git a/package/libnfs/0004-move-link-against-gnutls-into-main-library-as-it-is-.patch b/package/libnfs/0004-move-link-against-gnutls-into-main-library-as-it-is-.patch
new file mode 100644
index 0000000000..b61f162670
--- /dev/null
+++ b/package/libnfs/0004-move-link-against-gnutls-into-main-library-as-it-is-.patch
@@ -0,0 +1,26 @@
+From f054ce197a286fdd2fcb33ec1d9c236c5976adfb Mon Sep 17 00:00:00 2001
+From: fundawang <fundawang@yeah.net>
+Date: Sun, 26 Jan 2025 16:39:03 +0800
+Subject: [PATCH] move link against gnutls into main library, as it is
+ referenced by tls/libtls.la
+
+Upstream: d205297a10bf8d7f8846bf42f0ed618543a561a9
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ lib/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/Makefile.am b/lib/Makefile.am
+index 82376cb..33be5e4 100644
+--- a/lib/Makefile.am
++++ b/lib/Makefile.am
+@@ -48,5 +48,5 @@ libnfs_la_LIBADD = \
+ 
+ if HAVE_TLS
+ libnfs_la_CPPFLAGS += -I$(abs_top_srcdir)/tls
+-libnfs_la_LIBADD += ../tls/libtls.la
++libnfs_la_LIBADD += ../tls/libtls.la -lgnutls
+ endif
+-- 
+2.55.0
+
diff --git a/package/libnfs/0005-move-link-against-gnutls-into-main-library-as-it-is-.patch b/package/libnfs/0005-move-link-against-gnutls-into-main-library-as-it-is-.patch
new file mode 100644
index 0000000000..b4446115d4
--- /dev/null
+++ b/package/libnfs/0005-move-link-against-gnutls-into-main-library-as-it-is-.patch
@@ -0,0 +1,29 @@
+From 74437cb4e9d47daeeb3f851c5b14eb0d207ceb17 Mon Sep 17 00:00:00 2001
+From: fundawang <fundawang@yeah.net>
+Date: Sun, 26 Jan 2025 16:39:59 +0800
+Subject: [PATCH] move link against gnutls into main library, as it is
+ referenced by tls/libtls.la
+
+Upstream: 546c9ed8624403078ef993138b56dce4c3558523
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ utils/Makefile.am | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/utils/Makefile.am b/utils/Makefile.am
+index bd584b8..2ae7636 100644
+--- a/utils/Makefile.am
++++ b/utils/Makefile.am
+@@ -16,9 +16,6 @@ AM_CPPFLAGS = \
+ 	"-D_U_=__attribute__((unused))"
+ 
+ COMMON_LIBS = ../lib/libnfs.la $(LIBSOCKET)
+-if HAVE_TLS
+-COMMON_LIBS += -lgnutls
+-endif
+ 
+ nfs_cat_LDADD = $(COMMON_LIBS)
+ nfs_ls_LDADD = $(COMMON_LIBS)
+-- 
+2.55.0
+
diff --git a/package/libnfs/0006-autotools-fix-undefined-reference-if-libnfs-was-buil.patch b/package/libnfs/0006-autotools-fix-undefined-reference-if-libnfs-was-buil.patch
new file mode 100644
index 0000000000..e8080a60b8
--- /dev/null
+++ b/package/libnfs/0006-autotools-fix-undefined-reference-if-libnfs-was-buil.patch
@@ -0,0 +1,41 @@
+From 8c6bf2f173fdca0a954ed206b3a386e33b5de47b Mon Sep 17 00:00:00 2001
+From: Andreas Ziegler <15275159+aeolio@users.noreply.github.com>
+Date: Sun, 28 Jun 2026 06:20:48 +0000
+Subject: [PATCH] autotools: fix 'undefined reference' if libnfs was built with
+ gnutls support (#587)
+
+Signed-off-by: Andreas Ziegler <15275159+aeolio@users.noreply.github.com>
+Upstream: a3e86449217fe5429c38e2b06c4f7e6b3cd3be32
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ configure.ac | 2 ++
+ libnfs.pc.in | 2 +-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index a012004..6e5100f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -284,6 +284,8 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
+ [[const char *v = GNUTLS_VERSION;]])],[libnfs_cv_HAVE_TLS=yes],[libnfs_cv_HAVE_TLS=no])])
+ if test x"$libnfs_cv_HAVE_TLS" = x"yes"; then
+     AC_DEFINE(HAVE_TLS,1,[Whether we have linux tls support])
++    # tell pkg-config that gnutls needs to be linked also
++    AC_SUBST(tls_library,"-lgnutls")
+ fi
+ AM_CONDITIONAL([HAVE_TLS], [test $libnfs_cv_HAVE_TLS = yes])
+ 
+diff --git a/libnfs.pc.in b/libnfs.pc.in
+index fdc012c..42be7b2 100644
+--- a/libnfs.pc.in
++++ b/libnfs.pc.in
+@@ -10,5 +10,5 @@ Description: libnfs is a client library for accessing NFS shares over a network.
+ Version: @VERSION@
+ Requires:
+ Conflicts:
+-Libs: -L${libdir} -lnfs
++Libs: -L${libdir} -lnfs @tls_library@
+ Cflags: -I${includedir}
+-- 
+2.55.0
+
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
