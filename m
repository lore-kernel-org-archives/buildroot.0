Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B61E8FDCD
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 15:15:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57EC14068F;
	Sat, 27 Dec 2025 15:15:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z0t9IxelNy92; Sat, 27 Dec 2025 15:15:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6273640665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766848527;
	bh=WGcptunH9qFkHZ97z3u/2pmNmxxJgL+tw2PnEUHZ+ck=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KFVaL8YFRwYJd/YYD25CgOfkEWTmzwRkHwgolPJqlIU39HO2GwGqRf7duvswWn46u
	 Xh0p+GjU24ojqj/Ih/s3/KW2Ez6AqPSlkh9hJV0Sm7MdaRHcU7KjMKyD1oaZ5eFDW2
	 0WVQoGUm8U2TqrDDqWwJk4hPlKf359HrDbyaxmu0Ww9so2FTOfOJ1kwxifUmJS5/l0
	 0pdM5rEmZDZUgi+kP+6cWF3UgmCG+k0A0XuUhn/q8Ku1bXn7YeCzjJXZXSledpfb5C
	 fh9Tm72qdjgKf7CVs72JFq/dLpZ5eg2HaxEoyoNAXHhRGRxPWhWhSyF8PcHFFjsz8e
	 gSGiBpMede1eg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6273640665;
	Sat, 27 Dec 2025 15:15:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D6778119
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4140606DF
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:15:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7-oJGkla4v-N for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 15:15:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F22E06067B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F22E06067B
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:15:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E1CA886A2C; Sat, 27 Dec 2025 15:15:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 16:14:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0e5eef911c9b313fddd9912128bf09d605b5f6ae
X-Git-Newrev: d297569eb405d2db729dadf8dd86ac2d1070b742
X-Patchwork-Hint: ignore
Message-Id: <20251227151524.E1CA886A2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pixman: really enable NEON support
 on AArch64
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3419686282309248878=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3419686282309248878==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d297569eb405d2db729dadf8dd86ac2d1070b742
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test to enable NEON on AArch64 is as following:

ifeq ($(BR2_aarch64)$(BR2_ARM_CPU_HAS_NEON),yy)

It cannot be to true as $(BR2_aarch64) and $(BR2_ARM_CPU_HAS_NEON) are
mutually exclusive. NEON is compulsory on AArch64 so remove
$(BR2_ARM_CPU_HAS_NEON) from the test.

Fixes: ba2fb599cd002b57fa70e978d91884c98d8aad05 ("package/pixman: bump to version 0.44.2")
Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pixman/pixman.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 1b66b41719..87d973230f 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -68,7 +68,7 @@ else
 PIXMAN_CONF_OPTS += -Dneon=disabled
 endif
 
-ifeq ($(BR2_aarch64)$(BR2_ARM_CPU_HAS_NEON),yy)
+ifeq ($(BR2_aarch64),y)
 PIXMAN_CONF_OPTS += -Da64-neon=enabled
 else
 PIXMAN_CONF_OPTS += -Da64-neon=disabled

--===============3419686282309248878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3419686282309248878==--
