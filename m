Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FC6C433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Jul 2022 09:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E423361516;
	Wed, 13 Jul 2022 09:05:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E423361516
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xduI7-Y2TzRS; Wed, 13 Jul 2022 09:05:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F63A61504;
	Wed, 13 Jul 2022 09:05:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F63A61504
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 109BE1BF391
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 09:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED48F84665
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 09:05:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED48F84665
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nb3x_7nokPJw for <buildroot@lists.busybox.net>;
 Wed, 13 Jul 2022 09:05:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C23F8422C
 for <buildroot@buildroot.org>; Wed, 13 Jul 2022 09:05:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C23F8422C
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6E5778385A; Wed, 13 Jul 2022 08:52:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Jul 2022 11:05:31 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 453ee1af2d0bc721459d54bff6e7bcfdc9274a47
X-Git-Newrev: cd1a4443b3968daacd6cbb597399dc886965788a
X-Patchwork-Hint: ignore
Message-Id: <20220713085224.6E5778385A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/ruby: fix build
 with libressl >= 3.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd1a4443b3968daacd6cbb597399dc886965788a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Fix the following build failure with libressl raised since bump to
version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

ossl_pkey.c: In function 'ossl_pkey_export_traditional':
ossl_pkey.c:681:62: error: invalid use of incomplete typedef 'EVP_PKEY' {aka 'struct evp_pkey_st'}
  681 |  EVP_PKEY_asn1_get0_info(NULL, NULL, NULL, NULL, &aname, pkey->ameth);
      |                                                              ^~

Fixes:
 - http://autobuild.buildroot.org/results/9b2622fbc4c2c2b787578ee83fc6a23795a84415

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 19f7a19d6b8672838f73892478e7abfc8e0d8821)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../ruby/0001-Fix-build-with-LibreSSL-3-5.patch    | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/package/ruby/0001-Fix-build-with-LibreSSL-3-5.patch b/package/ruby/0001-Fix-build-with-LibreSSL-3-5.patch
new file mode 100644
index 0000000000..039a6466d6
--- /dev/null
+++ b/package/ruby/0001-Fix-build-with-LibreSSL-3-5.patch
@@ -0,0 +1,25 @@
+From e25fb0d0d86da5a9398ebdc9216b2ea89f80fa3d Mon Sep 17 00:00:00 2001
+From: Jeremy Evans <code@jeremyevans.net>
+Date: Fri, 25 Mar 2022 13:11:31 -0700
+Subject: [PATCH] Fix build with LibreSSL 3.5
+
+[Retrieved from:
+https://github.com/ruby/openssl/commit/e25fb0d0d86da5a9398ebdc9216b2ea89f80fa3d]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ ext/openssl/ossl_pkey.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ext/openssl/ossl_pkey.c b/ext/openssl/ossl_pkey.c
+index 2a4835a2..24d0da46 100644
+--- a/ext/openssl/ossl_pkey.c
++++ b/ext/openssl/ossl_pkey.c
+@@ -670,7 +670,7 @@ ossl_pkey_export_traditional(int argc, VALUE *argv, VALUE self, int to_der)
+ 	}
+     }
+     else {
+-#if OPENSSL_VERSION_NUMBER >= 0x10100000 && !defined(LIBRESSL_VERSION_NUMBER)
++#if OSSL_OPENSSL_PREREQ(1, 1, 0) || OSSL_LIBRESSL_PREREQ(3, 5, 0)
+ 	if (!PEM_write_bio_PrivateKey_traditional(bio, pkey, enc, NULL, 0,
+ 						  ossl_pem_passwd_cb,
+ 						  (void *)pass)) {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
