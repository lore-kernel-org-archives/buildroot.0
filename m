Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74A0C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 12:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4152D415FB;
	Mon,  5 Dec 2022 12:54:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4152D415FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fiR-XbV_xWXH; Mon,  5 Dec 2022 12:54:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AD86415FE;
	Mon,  5 Dec 2022 12:54:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AD86415FE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 785361BF4E2
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 12:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EABB818C0
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 12:54:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EABB818C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dR7nkEjeoYoO for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 12:54:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E145381D2D
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E145381D2D
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 12:54:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0FF451814B9; Mon,  5 Dec 2022 13:54:30 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon,  5 Dec 2022 13:54:22 +0100
Message-Id: <20221205125423.13983-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1670244871; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=d8aOo/vQ1jw2kD0TyCyVctcAOgEji5Cf+tireDxitz0=;
 b=O5s71O3Cj//tRfGNy+Pjg9dxqJaE0i4wqFevgzqT8Z4JzgXVTyMtzvkOFYjp7g2RYWwl3K
 Iw7WU+JSo7IAq83X6lni6gSJ1rvftQt3CGTKBgGP85OMa7odPxqc6SIuID6EsEsj9C4SI6
 IH8qmY/kZhPWZDhYWoQYakT7EKpGJv4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=O5s71O3C
Subject: [Buildroot] [PATCH] [RFC] package/boost: Boost.Atomic needs atomic
 intrinsics
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

From: Michael <buildroot@heine.tech>

similar to previous problems with nios2 and not-available atomic ints
the build for Boost.Atomics also fails for ARC Targets which don't
have the ATOMICS_EXT flag set.

according to [0] "Boost.Atomic has a hard requirement of the native
atomic operations on bytes". The same tests mentioned there fail for
ARC.

so introduce a dependency on BR2_ARC_ATOMIC_EXT for BR2_arc.

Fixes:
  http://autobuild.buildroot.net/results/4ca54a85672d7b9328b1909b457e548c6032a493

[0] https://github.com/boostorg/atomic/issues/42#issuecomment-734130348

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

---

I'm not 100% sure if BR2_ARC_ATOMIC_EXT is the correct
flag to use. I'm open to suggestions for better ways and what to
propagate to dependent packages.
---
 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index b99b01f22e..e012f5050f 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -19,6 +19,7 @@ if BR2_PACKAGE_BOOST
 config BR2_PACKAGE_BOOST_ATOMIC
 	bool "boost-atomic"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT)
 	help
 	  C++11-style atomic<>.
 
-- 
2.37.1 (Apple Git-137.1)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
