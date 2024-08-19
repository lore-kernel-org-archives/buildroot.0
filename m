Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02BEAC5320E
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 09:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21CF54047E;
	Mon, 19 Aug 2024 09:45:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id viYbKdVuDRSi; Mon, 19 Aug 2024 09:45:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D94740448
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D94740448;
	Mon, 19 Aug 2024 09:45:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A3C041BF3D4
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 09:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91595402A7
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 09:45:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NxbfCVl7uoFJ for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 09:45:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C1555401F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1555401F6
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C1555401F6
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 09:45:00 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id E62873536301; Mon, 19 Aug 2024 11:44:56 +0200 (CEST)
Date: Mon, 19 Aug 2024 11:44:56 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZsMUGMbnR2mwtwj6@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724060696; bh=Xa1E3kqwbPbMq4MX4SEor7mV8+GjgfHIDW7/Uj7EPXc=;
 h=Date:From:To:Subject:From;
 b=opU9jWn2w45K5rUUYkS1O/WU6xlJtLmXdHa4fUovYMfE/YCbYnWgTuNz5kTtBxt+T
 TGvUhhmGkvGBs7Nxh2QWn+0DIMyXrZUl98vcAWefLzHs11dL3JG5F+YDpv02RitBo9
 GU9TayK2fHWiiO7BQlgmau09sgeEKplPCNzG2sCbIevid+uY70GYC9lSEmbJRjyy4T
 fp5iMf0BwtuO61KnKsm+Vd44i1ZAqDElk2kEHQyO33j/UV+yDCLMK6a9BIAARNfCQm
 GA8KNtjjFXyGpDZdJJcRj31+H4SDtbEV25lJbU6evZfwAqAxqZQ7+B4YIsTn+4jcm5
 Mpeeh1tkYOiVA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=opU9jWn2
Subject: [Buildroot] [PATCH] package/botan: needs thread support
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

Botan commit 313e439c786d68bcf374b2cb0edfe3ffd891db94 added a
dependency to pthread.h. Add a dependency to thread support.

Fixes:
 - http://autobuild.buildroot.org/results/205/205d7505803990508bbd545393902789063ababd

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/botan/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/botan/Config.in b/package/botan/Config.in
index c74128bb9d..c61b368801 100644
--- a/package/botan/Config.in
+++ b/package/botan/Config.in
@@ -16,6 +16,7 @@ config BR2_PACKAGE_BOTAN
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_BOOST_FILESYSTEM if BR2_PACKAGE_BOOST && BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	select BR2_PACKAGE_BOOST_SYSTEM if BR2_PACKAGE_BOOST && BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	help
@@ -23,7 +24,8 @@ config BR2_PACKAGE_BOTAN
 
 	  http://botan.randombit.net
 
-comment "botan needs a toolchain w/ C++, gcc >= 10"
+comment "botan needs a toolchain w/ threads, C++, gcc >= 10"
 	depends on !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_10
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_10 \
+		|| !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
