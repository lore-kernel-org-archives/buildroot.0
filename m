Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04C4C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 16:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CE3483459;
	Tue, 14 Jun 2022 16:59:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D2JkbYd3Pfsp; Tue, 14 Jun 2022 16:59:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B07FE8331B;
	Tue, 14 Jun 2022 16:59:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 050571BF9B5
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 235B083312
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:58:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f90isrpXIhAr for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 16:58:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C83E833CA
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 16:58:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 79AEC8705E; Tue, 14 Jun 2022 16:45:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Jun 2022 17:59:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c95e3492e11c033a03cc5845dd9e359ed28497d
X-Git-Newrev: 19f7a19d6b8672838f73892478e7abfc8e0d8821
X-Patchwork-Hint: ignore
Message-Id: <20220614164552.79AEC8705E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ruby: fix build with libressl >=
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

commit: https://git.buildroot.net/buildroot/commit/?id=19f7a19d6b8672838f73892478e7abfc8e0d8821
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
