Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82954C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 21:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AB31607C0;
	Thu, 11 Jul 2024 21:04:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Ad8pbQfnVwk; Thu, 11 Jul 2024 21:04:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4ACD26082E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4ACD26082E;
	Thu, 11 Jul 2024 21:04:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 175B71BF476
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 21:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1133C414D6
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 21:04:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EmHbQ-vmGNe8 for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 21:04:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 562BF414B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 562BF414B6
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 562BF414B6
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 21:04:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 824BF1814B9; Thu, 11 Jul 2024 23:04:35 +0200 (CEST)
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 23:03:41 +0200
Message-Id: <20240711210342.250810-1-buildroot@heine.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1720731876; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=uZLfxANQ5fl98OMEQ+sw9uOwSG06+w3utvorKcy50UU=;
 b=KKd1Uy1ebDqTnX2owD22kjDfYqcHI9nia3MnK8gXkDn800aJR3drsECdNF8UP+AweAOUg6
 B/Js++AsOMtsohV0KgXJeGqpP/GVVK5zVR9+j5pkq4UX9jK7vQRG2mJuUW2ZDQWkvfjQ/v
 mIsohIfKxj2g+lR6ORfxOm1Fp+cExHg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=KKd1Uy1e
Subject: [Buildroot] [PATCH] package/boost: cleanup boost-context/fiber/math
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

boost-context
- requires C++11 (gcc 4.8) since 1.61 see [0]
- dropped the dependency on (boost) thread in 1.77 see [1]
boost-fiber
- needed C++11 since it's creation in 1.61 [2]
boost-math
- add comment for gcc version

[0] https://www.boost.org/doc/libs/1_82_0/libs/context/doc/html/context/requirements.html
[1] https://github.com/boostorg/context/commit/8425e830eab0ad550db937027392c4b4a54df695
[2] https://www.boost.org/doc/libs/1_62_0/libs/fiber/doc/html/fiber/overview.html

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/boost/Config.in | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 60cc0a11a2..908a53fea0 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -50,13 +50,14 @@ config BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
 config BR2_PACKAGE_BOOST_CONTEXT
 	bool "boost-context"
 	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS \
-		|| BR2_TOOLCHAIN_GCC_AT_LEAST_6 # boost-thread
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-	select BR2_PACKAGE_BOOST_THREAD if !BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	help
 	  C++11 context switching library.
 
+comment "boost-context needs a toolchain w/ C++11, gcc>=4.8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 config BR2_PACKAGE_BOOST_CONTRACT
 	bool "boost-contract"
 	# pthread_condattr_setclock
@@ -72,16 +73,20 @@ config BR2_PACKAGE_BOOST_COROUTINE
 	bool "boost-coroutine"
 	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # boost-context
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context, boost-thread
 	select BR2_PACKAGE_BOOST_CHRONO
 	select BR2_PACKAGE_BOOST_CONTEXT
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
 	help
-	  deprecated coroutine library, the non-depricated coroutine2
+	  deprecated coroutine library, the non-deprecated coroutine2
 	  library is a header-only library and does not need to be
 	  selected.
 
+comment "boost-coroutine needs a toolchain w/ C++11, gcc>=4.8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 comment "boost-coroutine needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
@@ -109,21 +114,20 @@ config BR2_PACKAGE_BOOST_FIBER
 	depends on !BR2_MIPS_CPU_MIPS32 && !BR2_MIPS_CPU_MIPS64
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	select BR2_PACKAGE_BOOST_CONTEXT
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_SYSTEM
 	help
 	  C++11 userland threads library.
 
-comment "boost-fiber needs a toolchain w/ NPTL"
+comment "boost-fiber needs a toolchain w/ NPTL, C++11, gcc>=4.8"
 	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 comment "boost-fiber needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS \
-		|| BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
 config BR2_PACKAGE_BOOST_FILESYSTEM
@@ -242,6 +246,9 @@ config BR2_PACKAGE_BOOST_MATH
 	  Octonions, like quaternions, are a relative of complex
 	  numbers.
 
+comment "boost-math needs a toolchain w/ C++14, gcc>=5.0"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5
+
 config BR2_PACKAGE_BOOST_MPI
 	bool "boost-mpi"
 	help
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
