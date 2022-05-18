Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E3F0C433F5
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 19:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA02D40198;
	Wed, 18 May 2022 19:22:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B2FwxtNn8Bzv; Wed, 18 May 2022 19:22:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD1574021C;
	Wed, 18 May 2022 19:22:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4C0C51BF427
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D2E640579
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:21:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hACapssIYUDq for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 19:20:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29253405CF
 for <buildroot@buildroot.org>; Wed, 18 May 2022 19:20:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C83C186069; Wed, 18 May 2022 19:09:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 18 May 2022 21:07:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cfd974c340e704a167e3940d4b79d44ae1ac90eb
X-Git-Newrev: ea967940ef37d3d0d195facf03779fc46b0dde69
X-Patchwork-Hint: ignore
Message-Id: <20220518190952.C83C186069@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/i2pd: fix build with libressl >=
 3.5.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ea967940ef37d3d0d195facf03779fc46b0dde69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with libressl raised since bump to
version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

In file included from /nvmedata/autobuild/instance-27/output-1/build/i2pd-2.40.0/build/../libi2pd/Signature.h:18,
                 from /nvmedata/autobuild/instance-27/output-1/build/i2pd-2.40.0/build/../libi2pd/Identity.h:20,
                 from /nvmedata/autobuild/instance-27/output-1/build/i2pd-2.40.0/build/../libi2pd/Destination.h:21,
                 from /nvmedata/autobuild/instance-27/output-1/build/i2pd-2.40.0/build/../libi2pd_client/ClientContext.h:16,
                 from /nvmedata/autobuild/instance-27/output-1/build/i2pd-2.40.0/i18n/I18N.h:12,
                 from /nvmedata/autobuild/instance-27/output-1/build/i2pd-2.40.0/i18n/Afrikaans.cpp:13:
/nvmedata/autobuild/instance-27/output-1/build/i2pd-2.40.0/build/../libi2pd/Crypto.h: In function 'int DSA_set0_pqg(DSA*, BIGNUM*, BIGNUM*, BIGNUM*)':
/nvmedata/autobuild/instance-27/output-1/build/i2pd-2.40.0/build/../libi2pd/Crypto.h:338:22: error: invalid use of incomplete type 'DSA' {aka 'struct dsa_st'}
  338 |                 if (d->p) BN_free (d->p);
      |                      ^~

Fixes:
 - http://autobuild.buildroot.org/results/8da524dda4a548de9b006ae156fdc582b0cffd47

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...libi2pd-Fix-the-build-with-LibreSSL-3-5-2.patch | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/i2pd/0001-libi2pd-Fix-the-build-with-LibreSSL-3-5-2.patch b/package/i2pd/0001-libi2pd-Fix-the-build-with-LibreSSL-3-5-2.patch
new file mode 100644
index 0000000000..e9f905b7ee
--- /dev/null
+++ b/package/i2pd/0001-libi2pd-Fix-the-build-with-LibreSSL-3-5-2.patch
@@ -0,0 +1,27 @@
+From 0a1e302e8a242bbd1d39556e5ef05aced1b3b504 Mon Sep 17 00:00:00 2001
+From: orbea <orbea@riseup.net>
+Date: Sun, 8 May 2022 22:50:44 -0700
+Subject: [PATCH] libi2pd: Fix the build with LibreSSL 3.5.2
+
+[Retrieved from:
+https://github.com/PurpleI2P/i2pd/commit/0a1e302e8a242bbd1d39556e5ef05aced1b3b504]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ libi2pd/Crypto.h | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/libi2pd/Crypto.h b/libi2pd/Crypto.h
+index b02778141..726bd0a1e 100644
+--- a/libi2pd/Crypto.h
++++ b/libi2pd/Crypto.h
+@@ -29,7 +29,9 @@
+ #include "CPU.h"
+ 
+ // recognize openssl version and features
+-#if ((OPENSSL_VERSION_NUMBER < 0x010100000) || defined(LIBRESSL_VERSION_NUMBER)) // 1.0.2 and below or LibreSSL
++#if (defined(LIBRESSL_VERSION_NUMBER) && (LIBRESSL_VERSION_NUMBER >= 0x3050200fL)) // LibreSSL 3.5.2 and above
++#   define LEGACY_OPENSSL 0
++#elif ((OPENSSL_VERSION_NUMBER < 0x010100000) || defined(LIBRESSL_VERSION_NUMBER)) // 1.0.2 and below or LibreSSL
+ #   define LEGACY_OPENSSL 1
+ #   define X509_getm_notBefore X509_get_notBefore
+ #   define X509_getm_notAfter X509_get_notAfter
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
