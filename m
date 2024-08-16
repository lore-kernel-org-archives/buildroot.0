Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2E7C531DC
	for <buildroot@archiver.kernel.org>; Fri, 16 Aug 2024 16:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1393E80E00;
	Fri, 16 Aug 2024 16:55:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uf85Wa6luI_l; Fri, 16 Aug 2024 16:55:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16F8D840F9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16F8D840F9;
	Fri, 16 Aug 2024 16:55:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AE3D71BF5A7
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 16:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B9B340438
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 16:55:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nrmNjiLH6yto for <buildroot@lists.busybox.net>;
 Fri, 16 Aug 2024 16:55:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 075634024D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 075634024D
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 075634024D
 for <buildroot@buildroot.org>; Fri, 16 Aug 2024 16:55:53 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 5F0053521185; Fri, 16 Aug 2024 18:55:50 +0200 (CEST)
Date: Fri, 16 Aug 2024 18:55:50 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zr+Eli3+h4ys5Clf@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723827350; bh=mTOW9x7A/VN+ucWxkJHY3TSKuePSG0j4imzLLKPunY8=;
 h=Date:From:To:Subject:From;
 b=lIMeu1c7aCmnAUOFYKnqkt33mp2ullVDVLWRB1vvd+AahwDYUgy5oGSpE6TM7z5jv
 mrO4uef8qix5+7A+Js3NgCQPs9gBWfpj23U7nzXHJxP2FpN73j/7cT/X3JgeDtdzp6
 o5w8w3GeBjGSdCbtgdHLO5c65y2QAJFoSgohHrqA5dh1uLW7MkvQDrQNDEn6vzm9K8
 taQGKxn2ajcDVq5WYfrIK0Ss7KfWEQ4VESfoOWyHwhVhwRjqe7JB9R6qbu4xSDpBMJ
 /SLwns69YCg2peKZR2fnbGMlgykhi6xU+KILROYDq7r3j8s/9HWcESpB7XzmRey8Xe
 kH6IO8/mXgjvw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=lIMeu1c7
Subject: [Buildroot] [PATCH] package/uclibc: disable time64 for mips64 n32
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
We need to wait until Dmitry is back, if he knows a real fix.
---
 ...r-n32-ABI-breaks-a-lot-of-tests-disa.patch | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/uclibc/0001-mips64-time64-for-n32-ABI-breaks-a-lot-of-tests-disa.patch

diff --git a/package/uclibc/0001-mips64-time64-for-n32-ABI-breaks-a-lot-of-tests-disa.patch b/package/uclibc/0001-mips64-time64-for-n32-ABI-breaks-a-lot-of-tests-disa.patch
new file mode 100644
index 0000000000..5a12231b42
--- /dev/null
+++ b/package/uclibc/0001-mips64-time64-for-n32-ABI-breaks-a-lot-of-tests-disa.patch
@@ -0,0 +1,28 @@
+From dd01754e21da71706af07f3e56eade66fc9164fb Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Fri, 16 Aug 2024 16:59:28 +0200
+Subject: [PATCH] mips64: time64 for n32 ABI breaks a lot of tests, disable it
+ for now
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=dd01754e21da71706af07f3e56eade66fc9164fb
+---
+ extra/Configs/Config.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/extra/Configs/Config.in b/extra/Configs/Config.in
+index 454b6ddb8..86bd20d76 100644
+--- a/extra/Configs/Config.in
++++ b/extra/Configs/Config.in
+@@ -1032,7 +1032,7 @@ config UCLIBC_USE_TIME64
+ 		   TARGET_i386                           || \
+ 		   TARGET_m68k                           || \
+ 		   TARGET_microblaze                     || \
+-		   (TARGET_mips && !CONFIG_MIPS_N64_ABI) || \
++		   (TARGET_mips && !(CONFIG_MIPS_N64_ABI || CONFIG_MIPS_N32_ABI)) || \
+ 		   TARGET_or1k                           || \
+ 		   TARGET_powerpc                        || \
+ 		   TARGET_riscv32                        || \
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
