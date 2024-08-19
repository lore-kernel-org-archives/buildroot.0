Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0839C52D7C
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 20:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F702605FC;
	Mon, 19 Aug 2024 20:53:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kcU2LV_FBY8t; Mon, 19 Aug 2024 20:53:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BF3760600
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BF3760600;
	Mon, 19 Aug 2024 20:53:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF3841BF3C9
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 20:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C65C60600
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 20:53:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 51FsAX_FxYlV for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 20:53:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EC80A605FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC80A605FC
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC80A605FC
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 20:53:46 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 3E361353663E; Mon, 19 Aug 2024 22:53:44 +0200 (CEST)
Date: Mon, 19 Aug 2024 22:53:44 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZsOw2IzdkaSTp+Ot@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724100824; bh=kfjbwbU7Vl/YyzVS6DpkPmWCu8Xdh1ghGzMHxFUni8Y=;
 h=Date:From:To:Subject:From;
 b=t9f3iUeEe+a7k5sz1UEyr2mzoVof829c7gl9MN3O9jDrX2kk2TZv1GMkYol3bO+so
 8QKah7E72n8S2W4rk8IFpS36h2EqpBntsrcZPyQvqAXWTnVhcTW1O4Tcon3/PejEXO
 uXSW8HJsSLNdd/8D2ExGK8yy2wSS1cxUFLxcbiqYabvYXun4C65HQatEiBT9p0sIt8
 vMQ5ZSdAiaBt6qP93/C5JiJnYE0/t1j71cp4o20Ic0uneaUG6psEYBHv2st7qpAoWh
 p1LZoQ54FQkUKXwixRnYDkqx45I9e77qmpgnig1rL0Q/syZjpccpapYeefkWli7ks6
 mcFg1z3R2A8gQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=t9f3iUeE
Subject: [Buildroot] [PATCH] package/botan: avoid compile error with gcc 10.x
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

The "using enum" was added in gcc 11.x, see here for a info about it:
https://stackoverflow.com/questions/75018634/how-to-use-the-using-keyword-in-gcc-10-4

Compile successfully tested with internal Buildroot toolchain for
sparc with gcc 12.x as gcc 11.x is not available anymore.

The autobuild failure will be avoided now and fixed with newer external
bootlin toolchains.

Fixes:
 - http://autobuild.buildroot.org/results/ab8/ab83b920156f5a1e51ef960e4007769b5c27d0a1

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/botan/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/botan/Config.in b/package/botan/Config.in
index c61b368801..305cc2fe8c 100644
--- a/package/botan/Config.in
+++ b/package/botan/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
 config BR2_PACKAGE_BOTAN
 	bool "botan"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11 # C++20
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_BOOST_FILESYSTEM if BR2_PACKAGE_BOOST && BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
@@ -24,8 +24,8 @@ config BR2_PACKAGE_BOTAN
 
 	  http://botan.randombit.net
 
-comment "botan needs a toolchain w/ threads, C++, gcc >= 10"
+comment "botan needs a toolchain w/ threads, C++, gcc >= 11"
 	depends on !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_10 \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_11 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
