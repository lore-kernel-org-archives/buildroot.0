Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53EEC3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 07:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28F864034B;
	Fri,  5 Jan 2024 07:30:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28F864034B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fw9ZzvZwyZjg; Fri,  5 Jan 2024 07:30:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C82B94363A;
	Fri,  5 Jan 2024 07:30:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C82B94363A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B3D571BF40F
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 07:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99B6283D26
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 07:30:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99B6283D26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P2c4H8DV6Fir for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 07:30:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA88D8220C
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 07:30:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA88D8220C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B772B84291; Fri,  5 Jan 2024 07:30:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Jan 2024 13:04:55 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 678146f2ada0477c745494b4d28392d50ccc9a9e
X-Git-Newrev: cf19090b83a7cb1fa867e9fb69a69faf5de922e6
X-Patchwork-Hint: ignore
Message-Id: <20240105073029.B772B84291@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/erlang: fix build
 without DES
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf19090b83a7cb1fa867e9fb69a69faf5de922e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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
(cherry picked from commit 82c025309069ae3f87ef192df19ad67fc1a1271f)
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
