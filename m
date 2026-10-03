Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6317DCA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 06:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E767760628;
	Sat,  3 Oct 2026 06:53:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LzZzv6rescLj; Sat,  3 Oct 2026 06:53:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 13E996061C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791010411;
	b=juhsbKDpa34Qjx+yhLsmXMDYvUG47Y1WRtkCDeb5VxyJ5Kl5C/As8TZuSVE/Ge/XUo6U
	 qfM/Q6Suhv9rKtnwriuqmPs74qVB6UEpGN0ZVvh1sIPb5HLDEIdrvLO/efUrb6zRJVSez
	 kCTo65lP1T0CQnw8mqcoL683652sdDNvAjmQPOhaUeAsNsoby65RED8zyd3oxmljWR/N9
	 gtit59ss6ZLhWYOPltM8LDHWT2mhGD1flLTz77ue1+m7b/lBrz2cLpz8PFSqyQCPPZ7pn
	 Llllm02haFslT8BsRcGymHxToOnaiDEcKtYWiTD9v1eCZ97lsMWFF/LuSbYbRFFrPMQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791010411;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=80rBgCWV2w3/AfKS6yPtFt52kREIIOEVKhH2/3ZbcK0=;
	b=pFkyBeUGmiRpP2EOARoUCMoWeYZw1EcNNWtPTxR/d+jZqhB+/n3xfVjc0bSaSYy7gppT
	 pJCFBQyCiPLfUICWkj7RERZzQpiuMUKj2sipoNvmFIvIjdU+V98dah6fw4hlegmqgQCkN
	 GsQjDvfS2muZxqloLTJmJKs2dw79NXr2cLn9+R6TGph2oG4YvvZd5cTYWxikVlmKKU6lf
	 xLSmVsPaFpYCl0t8wc2mggby2H/Z8UefaK4AwPOTCphTIOABYXEVBYf3bcPhVHy+XFMIr
	 ncjxtFvkjgCXiPEP7OyQwzg7MOeRcOpt3WlOxOT4vI2jgiHztus3VNAXj/Y+yINQEvw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791010411;
	bh=80rBgCWV2w3/AfKS6yPtFt52kREIIOEVKhH2/3ZbcK0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lHy9VS2yIixwX+8rsaWph60u+J/T66ncey4HG8x8VBuUxo3+73/VAVbOSXJQV2v5a
	 AGfOZzKhkng13v7UVcZ9k/w7ZnL+9rZkm39p9Cc5PvKLemuYsjABCF7y3tVd/X1qJg
	 tcoLpK0VLb7oseyI1SsGGUBBt4mxZcMCyHnmknCLzp9iHykUTJ+gAC67Ho0G2z2Dsk
	 v5H89Km5ebXEENyixR00orqTmP14NzvSr8D+8IbNvV3aRIcaRPp1klhBOnwTLmGwds
	 b1dF7GTSfWHreZaEEi44qjnZhaTtneFg7y3STpJveBAw9LIYNpptzjnL7gy+KicEju
	 UqIq/3zTLG8aQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13E996061C;
	Sat,  3 Oct 2026 06:53:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C24EB2E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 06:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A81FA40059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 06:53:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PDigGDwtZl_8 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 06:53:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 124BA40050
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791010409;
 b=Z87hE2qt3k8BMJrtSfuZQtF/Kt41fgJP6OTh646O+0WXVRniBh3Sbt6y1Z6PAd/wR6q3
 V4DLytMJ4LWk/ghepcUyC8IDdOBvi5x4FSLUWotxmPb26W8LV1/E0IjkUZ4l/UXqwfc3Q
 uMVvIsDDa+6Dj+wXppjT+d4ehRUFdkofG59NqoDWT1mJ9PLbC3kZCAEE5888Re7i9s3Tb
 ZjGTK0B9yCohDYVAotyU0evoOKn5AjcwNYJTevfxmh69gvkOj7fyH71KppKWCauIo39AZ
 rBAUKHCEjd2GVyMSLuioYj8iHn+gCKONvWUkzQGkSfiiVMirb3Sy5+TLbiAdoTWFmhA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791010409;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=szJMrgfhjO9aq/xCVAqbbxr4UgDcTitUTaQHVH7KyAk=;
 b=A112LA3kuDeUNXyB6uYDh3uQl+cwfjBqQi29yx0/S01ph7HiZIkhbowBv7gTxZMLKZyi
 z5Zy60puakU6j8IM0xiq2hqtJEdPqpQh5WPDSkcJ6Fwfu4nz5j3MYUR6LKIUZV8TiDCmn
 75igRgf4kwSS3z9xZNgCumk1WIrpT+PVY61QbZWYZOdYE38Dy5TgdDlp0QNZp0bDJHKKC
 s+X2AY0w9LUpclHCp8eXHEc1V7yCO3PfKZ9JVMw2JlI1oJxUuNT8pHvM0GXy3Ezui/tEb
 gaPm7J2SaofGTMmMDbsCnMkaySvkQv7KB50sC3Kj7hGohKYcEokP35Z51xZWamVY1NQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 124BA40050
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 06:53:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 578B388752; Sat,  3 Oct 2026 06:52:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 08:53:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 97e7c6d82fadd52e88ea9db8f19f714a627cd942
X-Git-Newrev: 60b07db9cf00fbd5ce036d8b85e8526b65d8d4c5
X-Patchwork-Hint: ignore
Message-Id: <20261003065214.578B388752@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tailscale: don't overwrite
 tailscaled when using merged bin
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/60b07db9cf00fbd5ce036d8b85e8526b65d8d4c5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

When merged bin was added in Buildroot commit
428ac6fcc4c286dd013ada411bf1ab5c0ad11614 the tailscaled package
started overwriting the tailscaled binary with a broken symlink when
BR2_ROOTFS_MERGED_BIN=y as it assumed /usr/bin and /usr/sbin were not
merged.

To ensure this doesn't happen only apply the symlink when
BR2_ROOTFS_MERGED_BIN is not selected.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Tested-by: TIAN Yuanhao <tianyuanhao3@163.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tailscale/tailscale.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
index 86039fd4b1..f231022476 100644
--- a/package/tailscale/tailscale.mk
+++ b/package/tailscale/tailscale.mk
@@ -22,10 +22,12 @@ define TAILSCALE_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/systemd/system/tailscaled.service
 endef
 
+ifeq ($(BR2_ROOTFS_MERGED_BIN),)
 define TAILSCALE_INSTALL_SYMLINK
 	ln -f -s ../bin/tailscaled $(TARGET_DIR)/usr/sbin/tailscaled
 endef
 TAILSCALE_POST_INSTALL_TARGET_HOOKS += TAILSCALE_INSTALL_SYMLINK
+endif
 
 define TAILSCALE_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IPV6)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
