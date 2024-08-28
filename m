Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9718C5474A
	for <buildroot@archiver.kernel.org>; Wed, 28 Aug 2024 07:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25DBC40AEF;
	Wed, 28 Aug 2024 07:25:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R_cmM6IoihVr; Wed, 28 Aug 2024 07:25:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9400940568
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9400940568;
	Wed, 28 Aug 2024 07:25:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C0F31BF2C8
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 07:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 194E48116F
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 07:25:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1as21lql_VTQ for <buildroot@lists.busybox.net>;
 Wed, 28 Aug 2024 07:25:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EA38481164
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA38481164
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA38481164
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 07:25:41 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 0C8DB3535C3E; Wed, 28 Aug 2024 09:25:39 +0200 (CEST)
Date: Wed, 28 Aug 2024 09:25:39 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zs7Q89h62j3hCq5x@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724829940; bh=IN02ovV5A1hoQ/Clz876Do4+MirCVyeMfQtC2N5uhb0=;
 h=Date:From:To:Subject:From;
 b=ckeASl/CqfA0UZE2gE7QCgPaXcvND25CYep/HP2Mk0xs1ldI53RDebdyYfEiRZqnu
 T44gY6a5v047npyrWMqfOKSR92xswUwki69xrp1HHxuKHYw+1BNHpGNc7ekljX0oMl
 ZyMhFMsQ4/OuoZaj6id3I6zLcW8wHSNfwDslXuhN1SJIcqP4MOOG5fAAKGy3QlD+ER
 b3iJ1ADcSOjfaZxuxPokMr9PXL6U7yE8t93/ihN6vKA53/i/EuRH+RrzMi9iUsznOb
 UFENsgATVgjb+40pCTdg89qNxFFIX7M6ZNEPSyzRYw9weiD0HDhePt6xlufBfJwVte
 x6aO/RbbFUTYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=ckeASl/C
Subject: [Buildroot] [PATCH v2] package/file: fix musl compile issue
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

It is not totally clear which update is responsible for the
breakage. The breakage has been occurring for as long as Jan 2022.
Therefore it should be backported to older supported buildroot releases.

Add a patch from Gentoo people, also reported Upstream to fix the
issue.

Fixes:

 http://autobuild.buildroot.org/results/abf/abfe66cec3680d396c5774ba492f34599e513edc/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1->v2:
 - rework commit message suggested by Thomas Petazzoni
---
 .../0001-file-seccomp-fstatat64-musl.patch    | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/file/0001-file-seccomp-fstatat64-musl.patch

diff --git a/package/file/0001-file-seccomp-fstatat64-musl.patch b/package/file/0001-file-seccomp-fstatat64-musl.patch
new file mode 100644
index 0000000000..ecb12fe44e
--- /dev/null
+++ b/package/file/0001-file-seccomp-fstatat64-musl.patch
@@ -0,0 +1,32 @@
+From 8c13923a8e17a02be0989649b2edc20124816729 Mon Sep 17 00:00:00 2001
+From: Mike Gilbert <floppym@gentoo.org>
+Date: Tue, 15 Jun 2021 16:08:22 -0400
+Subject: [PATCH] seccomp: undef fstatat64 to avoid build failure on musl
+
+sys/stat.h in musl does this:
+
+  #define fstatat64 fstatat
+
+Counteract this with an #undef.
+
+Bug: https://bugs.gentoo.org/789336
+Bug: https://bugs.astron.com/view.php?id=473
+Signed-off-by: Mike Gilbert <floppym@gentoo.org>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: N/A under discussion
+---
+ src/seccomp.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/seccomp.c b/src/seccomp.c
+index 5a39ee45..d2a1139a 100644
+--- a/src/seccomp.c
++++ b/src/seccomp.c
+@@ -205,6 +205,7 @@ enable_sandbox_full(void)
+ #endif
+  	ALLOW_RULE(fstat64);
+ #ifdef __NR_fstatat64
++#undef fstatat64
+ 	ALLOW_RULE(fstatat64);
+ #endif
+ 	ALLOW_RULE(futex);
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
