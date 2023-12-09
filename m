Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312FAC4167B
	for <buildroot@archiver.kernel.org>; Sat,  9 Dec 2023 14:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9BD260B77;
	Sat,  9 Dec 2023 14:54:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9BD260B77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0OSIkzLG7tkx; Sat,  9 Dec 2023 14:54:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0863B60F5E;
	Sat,  9 Dec 2023 14:54:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0863B60F5E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2B17A1BF860
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 14:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 054F041749
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 14:54:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 054F041749
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v9MPpAONGRjG for <buildroot@lists.busybox.net>;
 Sat,  9 Dec 2023 14:54:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E23F41746
 for <buildroot@buildroot.org>; Sat,  9 Dec 2023 14:54:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E23F41746
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1CC108749D; Sat,  9 Dec 2023 14:54:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Dec 2023 15:53:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3b6399225faa753f187425834787800cf91724b5
X-Git-Newrev: 82c025309069ae3f87ef192df19ad67fc1a1271f
X-Patchwork-Hint: ignore
Message-Id: <20231209145414.1CC108749D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erlang: fix build without DES
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

commit: https://git.buildroot.net/buildroot/commit/?id=82c025309069ae3f87ef192df19ad67fc1a1271f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without DES raised since bump to version
26.0.2 in commit 2cfa86a54882f2831b36a78a0ca642aa3a4bd0a4:

cipher.c:51:42: error: 'EVP_des_ede3_cbc' undeclared here (not in a function); did you mean 'SN_des_ede3_cbc'?
   51 |     {{"des_ede3_cbc"}, "des-ede3-cbc", {&EVP_des_ede3_cbc}, 0, 0},
      |                                          ^~~~~~~~~~~~~~~~
      |                                          SN_des_ede3_cbc

Fixes:
 - http://autobuild.buildroot.org/results/1aace0ee738f8ec4aa2c9a739fc7535c3b6bf884

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...c_src-openssl_config.h-fix-build-without-.patch | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/erlang/0001-lib-crypto-c_src-openssl_config.h-fix-build-without-.patch b/package/erlang/0001-lib-crypto-c_src-openssl_config.h-fix-build-without-.patch
new file mode 100644
index 0000000000..a17a43a95d
--- /dev/null
+++ b/package/erlang/0001-lib-crypto-c_src-openssl_config.h-fix-build-without-.patch
@@ -0,0 +1,46 @@
+From 8c7d62662cf51902d759be0e8d3bfd96a3524b3c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 8 Dec 2023 09:00:17 +0100
+Subject: [PATCH] lib/crypto/c_src/openssl_config.h: fix build without DES
+
+Fix the following build failure without DES raised since version 24.2
+and
+https://github.com/erlang/otp/commit/abf7f84c2f77bb07dbdbb8a29b9d41f1f24c5f14:
+
+cipher.c:51:42: error: 'EVP_des_ede3_cbc' undeclared here (not in a function); did you mean 'SN_des_ede3_cbc'?
+   51 |     {{"des_ede3_cbc"}, "des-ede3-cbc", {&EVP_des_ede3_cbc}, 0, 0},
+      |                                          ^~~~~~~~~~~~~~~~
+      |                                          SN_des_ede3_cbc
+
+Fixes:
+ - http://autobuild.buildroot.org/results/1aace0ee738f8ec4aa2c9a739fc7535c3b6bf884
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/erlang/otp/pull/7937
+---
+ lib/crypto/c_src/openssl_config.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/crypto/c_src/openssl_config.h b/lib/crypto/c_src/openssl_config.h
+index cb63f28369..f3904986c9 100644
+--- a/lib/crypto/c_src/openssl_config.h
++++ b/lib/crypto/c_src/openssl_config.h
+@@ -218,7 +218,6 @@
+ 
+ #ifndef OPENSSL_NO_DES
+ # define HAVE_DES
+-#endif
+ 
+ #if OPENSSL_VERSION_NUMBER >= PACKED_OPENSSL_VERSION(0,9,7,'e')
+ # define HAVE_DES_ede3_cfb
+@@ -227,6 +226,7 @@
+ #if OPENSSL_VERSION_NUMBER >= PACKED_OPENSSL_VERSION(0,9,7,'e')
+ # define HAVE_DES_ede3_cbc
+ #endif
++#endif
+ 
+ #ifndef OPENSSL_NO_DH
+ # define HAVE_DH
+-- 
+2.42.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
