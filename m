Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4B6C982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 12:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 570D340B48;
	Sun, 20 Sep 2026 12:30:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ztSa4fSPsiEz; Sun, 20 Sep 2026 12:30:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 927B1407D4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789907416;
	b=G8nE6csIhTFBdGoArwzndDu4VJZnBlKSKGfDEDegr1POfFqKi3oRJw3/XIVYHfHCqJoe
	 AhRmnnxZW98wrN9Le5/kxagdhticJC5Zi0ZwROh3PwMlLwdY1Yh6KAZJLb4w1Xe2TZ1S+
	 m5Y348QWjA02aWl1ugDa4FCVMi5ZfHK8Bjby73XP+ay0ZcfMGym73qyWywkboTKdVtKee
	 p0bFiS3g8zqFcqmDxeXd22tUe8Zd5zw9xFP8maHD/tCbUSsB3VbpD2eBkomSP8OZGKXpI
	 90TNNCcmLRLRftRmMS/cLknd9Tq2b5xVY4ybDxUGvqzLo3ipzlFeeEJiGm1ys9JEcCQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789907416;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=u/Rdl/RVYayiy/PScn/mp9+McAfV80V8j2GhqsBiydc=;
	b=UsOhhs3Ca7VCA24DblaaQXUcQqjKimyrE8X4GpLf0/CsBZd5SZamGs3K21f2nECmwzmW
	 lhzbMz4Wk4mQhOsnfnLoQew/HuCC4FvJlKHycacINqhsvatg8Zp1c7mIBCV7Kyo8c5Pt1
	 5mDjSGifTJ/o+zwuBpN4l/ZfDdm2NMci5aWZpdEGX2tqJH/HLy0UkEa1XqyVqIWahMA5o
	 PmlgQkYDmX2slroYMqLdjwx/wt9iT7dxNP1bOeeAKiUJZpJfjE07nyuPLPpgvmPOKbTM6
	 4g5OwksNH9/kxYGgwHIWQ1K4fPlDzsw6wauIfS7XjAz3ceoC1XVWCaVNJi97IPfT8pQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789907416;
	bh=u/Rdl/RVYayiy/PScn/mp9+McAfV80V8j2GhqsBiydc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U1iNHBg3J6nJYSlWkqPYwxBhylTpMqmWw0B9EqstYP456Nnt8C+0PdYjtw+F6PTQT
	 bThgYItkKlPkMawRuVNxUzKnagVt+Q98QmbxafVM52qAWzzd9cMaSn6LHD1DFsLh8B
	 2zBTNsgIDidHoO3grWB+Kd0ceKYF9Dn5HnehraJpbdajzjuhlIYBy1DR7X4hdqtUcz
	 Y+UVnu+r0kugO+BuYwrpBH7qmo/Bdf16b1YXH2Gum1XKXiXs6bvyxhLjn4Bp/0ttUt
	 FyP3OYv/p14HpYBhLDd5G3v0ZSnQSXl9Ij5wUvKwMvcfdwuYxW+ZzT1rileqDMhmUs
	 SFEpvNMYtJJFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 927B1407D4;
	Sun, 20 Sep 2026 12:30:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F51D371
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74E3680F15
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:30:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D8Jozk7iibfp for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 12:30:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CF2FC80F10
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789907414;
 b=a3fwGfSK1y9jzxac7FtE6CwXJpy3ldT+i/BRNXdir3Shu0nTEsUN+775MB/2XIx2vkcV
 k1CgRd0ge1SIJN2hIY72FYIauL8VMpsqM6wC0BhfsLY07I+PmTk7bB1UdHJCpcUPnWjE5
 lCNUXdXH8kHilBE3u5pmJTDe/EhjiRamd5PWJz3/loWKYvKQDoLLXLn04JS9z8t4v7loe
 1EHBbC3uOT0RJ8vTZsoMp6EgCmJ2aGg5hoIlKCFA0JMSbTQ6fez+t0HUEvOQYhZIUzUCi
 RT3jJJKAQAGRIXGpDZFlVN2TTKLRWkNMxZZMsJvbh5EuSEWwP6EJitTuz/abFC0X2ag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789907414;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=sRvybur7XEHy/RBpqlL98DJ30JkE3WmnQ2cMEYrrbNQ=;
 b=N7BejomwcFeUpFOEFbN55SnO+irMvLn1obGAGYTCagj7XaJgY2pERaZYIZgnoyi0p0Zy
 ZfayuCRFdFWNcf/X490lzRbB5Al5+y6pKcDdf8u8psb2Kfk41fqlEvyWKfI8mnuy6PYcG
 S4fUZaqKKx6YGcSg7WuzQRin7K58h0xIf5QUrurIf0QzuICGZI3z1WpYSdxn9W14jrHHa
 2h9llbNtqEnGnNVofmku6+ZDDhlC2X7/REQhsy3ui6wpelyY3KhVNYBbxrFHDpL5QHBlr
 3g2hPgmt0bpfng0MyWquxg1DAl9Te6ERCaKuKmCOwVXYlw0Xr5h2yrxBMXWCN6ib7dg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF2FC80F10
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:30:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 743EE8D764; Sun, 20 Sep 2026 12:29:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 14:27:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 69d99305e53560a4375eb93d089e042bcb435148
X-Git-Newrev: c6a2765091cc585d84464a420ce2e05cf3218bf3
X-Patchwork-Hint: ignore
Message-Id: <20260920122906.743EE8D764@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/visionfive2: add rootwait to kernel
 command line
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c6a2765091cc585d84464a420ce2e05cf3218bf3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

MMC cards are detected asynchronously, so the root device may not be
available when the kernel tries to mount the root filesystem.

Add rootwait to wait for the root device and avoid a kernel panic.

Fixes: 4567c35d066e ("configs/visionfive2: bump OpenSBI to 1.6, Linux to 6.12.24 and U-Boot to 2025.04")
Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/visionfive2/overlay/boot/extlinux/extlinux.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/visionfive2/overlay/boot/extlinux/extlinux.conf b/board/visionfive2/overlay/boot/extlinux/extlinux.conf
index fd772f3675..48d267f725 100644
--- a/board/visionfive2/overlay/boot/extlinux/extlinux.conf
+++ b/board/visionfive2/overlay/boot/extlinux/extlinux.conf
@@ -1,4 +1,4 @@
 label linux
   kernel /boot/Image
   devicetree /boot/jh7110-starfive-visionfive-2-v1.3b.dtb
-  append console=ttyS0,115200 root=/dev/mmcblk1p3
+  append console=ttyS0,115200 root=/dev/mmcblk1p3 rootwait
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
