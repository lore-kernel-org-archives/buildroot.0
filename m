Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33449C88E56
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 07:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFA23406AF;
	Sun, 13 Sep 2026 07:44:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iCsCtHLGd15i; Sun, 13 Sep 2026 07:44:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D095C40680
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789285439;
	b=nt1t+9QGL2Aum++kj2kXjWmgdWKN6MqdV4rOPJ6Xoc+pTgIBokyPxO7hkrGXrNG61BvA
	 mtEwPwQqVyBrLk2Ja2rqMYA1l9ANMZvesE4el076SnRFKA51jubUZ2XtFIaGXKUzIid8P
	 kkbiP3EU22h+9au0WG+x7WP+EGwQX/A9SKThce+WhDfXTyuXIoqGQQvB97dMh5C4gs4I1
	 RM9fa5+C0rXNos8UA8zvq1cGG5zWipos5cDb0z2BXMOyqTraHIQyWJzDIIqaVF3aGSpIe
	 RPFm9LTg2lNx/1G5m99R4prjWSf3Oa9IHHIAKyqC/m8Amj2fHg3lBfn7zfEIo+M85Ow==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789285439;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=JP7oWenZ53RWQiOV5dy9C+s7YN8p8u3Du++xH5yeXos=;
	b=tfzcWQE2UfjpC65TcOgnbMWfLmVc/elsm0N3KoIZw6tKyLJMgjpxHcCtUyQaLPJJePKo
	 j3Ch7J8DH4/1O/sktSbd5xfK42K/OGvQx7Qg47MEtBBF6tzN4l3ckEnZkruPqplqxwBqx
	 J9cECej9gr+cX1WNFPQSWw5e7Rfjv0+4IJIapV5Lifmlo+6LR2FsXqTLfJh7/CToTB9G/
	 0tOKqCcBFccpi46F0sAMhpcDlLYm5P4ErEDqF34XrAyCuPGngkRy30jgh8XWulXE8pk7D
	 S22UUxF61/C4HRIvmtRWEpZfNaDWS9XQKiPCwl+qFpqQIcSPDC4gBsrWMW4Eghwvevw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789285439;
	bh=JP7oWenZ53RWQiOV5dy9C+s7YN8p8u3Du++xH5yeXos=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=h6OzrJxEaIdCioLIu5/aOpXQ+wUsLqXZywoCZ4mRiuFJGCnYYMcvUgUC1aXL7GpvS
	 pi3/GO4coSWZoXXGRfc5RpxLyk7MxL4+jD5XkwcG7gbNVZ+88JTes5W3Qvxc94PXMx
	 mHmLxmYyKWCxz4T2iIO7nLolFMOCkPld5eN2T9Od5a7wUOzRNbYhuRChVvO0sLQGFD
	 mNGe48B/fBhRwrTOoXoXNEmY5nemxjVK16wJ63Z6/6vw9jHt0Ux0gG/1u39lN9lKEa
	 LeLxO0ekvu2tbZ8AVREansbexFCwLsqow1lqwLj598e929hy+9tB1Q6L3j19WIq3Pc
	 8Mi73InO3+4TQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D095C40680;
	Sun, 13 Sep 2026 07:43:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CD86832F
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 07:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B41CD80E16
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 07:43:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 77DY8LGRjrW6 for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 07:43:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B3EAE80E10
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789285436;
 b=cxfr4VTUeX4ZnjRCeNWGd24bDKZJr2Q5SEHLURVWivgx5ZZkO/JmQBILJwWjJm6/VGFG
 1rcvdLMLhnhkhKnJT3jDVXf+7ljOyPeqjnZelI4o+X5l1ktdY3mAZ92ckt21wDUE+cFA1
 agpnGRbeULmm6qHPg5qEpFqUZIttB9Q4fN0eyriXN8PvIr5EoDy472FUqAozEvmLflzko
 +4Bqd5i2ZqLrRBc64BGYbjQc9sSk3rxq839e75HyA9do0q4XGJiDcMZO4DO3kqSIfTYwq
 NuAf8Zey5c6N+f/xp3NOL6XNL7MOYOWl6edWRAOH7ksr0epyt2ldJ0HIW4Bj/xphBRA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789285436;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=h/4JPsV8N14bYOWqAeRrmYE9/H132hM7gsoo1VctdCk=;
 b=GKykQpOD9GSmMZfU0x5CbQDhvfJzCZO5ckVs/B0WE9nG61V5i6DQNveEC99xh2IUsQUY
 HUs1vpmU/rGbKpeKH++OvGP0OGA+Uq2bdMKOS+5kDV3O3ERZFhldqAlQI+fyBczXUL392
 EkZckgXSZ/ggVMNemVkfc/ylxl6EO3fl0DM+oBx2aFuDsP7z7Bq1atmiPWJXp592Wsgt1
 wfp7Ve0G0Md5sm/lUfraRwu1CZ0VfX2PojcXSvBqQM3h02fwWkYi90XG1bnz6k6r5dgI1
 /PwfsmkDk57xeRZDJ4Iq6ckp0bv/67G0T9GYDuXmDKoxxf/AY/0YF0X9A3h7J9VUabg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3EAE80E10
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 07:43:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE11695571; Sun, 13 Sep 2026 07:42:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 09:31:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf7cd535dae5e7c3b31e57e322f08f8fb3ccb37d
X-Git-Newrev: 36b2b3f561541da00f62b6714985ccb34ae9e20b
X-Patchwork-Hint: ignore
Message-Id: <20260913074251.DE11695571@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openscap: propagate dependencies
 of libxmlsec1 after bump
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3757089662915183075=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3757089662915183075==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/36b2b3f561541da00f62b6714985ccb34ae9e20b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

In commit
fef9cad1fe84b4366e705adb03470e12199ffd25 ("package/libxmlsec1: bump
version to 1.3.12"), libxmlsec1 was bumped, and alongside some
additional "depends on" were added.

However, these new "depends on" were not propagated to reverse
dependencies of libxmlsec1, i.e. openscap, causing Kconfig warnings:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_LIBXMLSEC1
  Depends on [n]: BR2_TOOLCHAIN_GCC_AT_LEAST_7 [=n] && BR2_TOOLCHAIN_HAS_ATOMIC [=n]
  Selected by [y]:
  - BR2_PACKAGE_OPENSCAP [=y] && BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS [=y] && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_HAS_THREADS_NPTL [=y]

and potentially some build issues, even though we didn't check in the
autobuilders for potential failures.

This commit fixes that by properly propagating the new dependencies.

Cc: Alexis Lothoré <alexis.lothore@bootlin.com>
Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/openscap/Config.in | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/openscap/Config.in b/package/openscap/Config.in
index 01c628194c..b6deae0a5f 100644
--- a/package/openscap/Config.in
+++ b/package/openscap/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_OPENSCAP
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS  # libgcrypt
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libxmlsec1
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # libxmlsec1
 	select BR2_PACKAGE_LIBCURL
 	# In theory should build without crypto, but in practice it
 	# doesn't: https://github.com/OpenSCAP/openscap/issues/2310
@@ -19,6 +21,8 @@ config BR2_PACKAGE_OPENSCAP
 	  https://www.open-scap.org/
 	  https://github.com/OpenSCAP/openscap
 
-comment "openscap needs a toolchain w/ dynamic library, NPTL"
+comment "openscap needs a toolchain w/ dynamic library, NPTL, gcc >= 7"
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7

--===============3757089662915183075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3757089662915183075==--
