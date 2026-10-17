Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB2CCCF2C4
	for <buildroot@archiver.kernel.org>; Sat, 17 Oct 2026 19:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94DA060604;
	Sat, 17 Oct 2026 19:44:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E_IWU8BbuOwx; Sat, 17 Oct 2026 19:44:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B6EEA60619
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792266253;
	b=PYf5tWt6tAbe51GFBUtx+v2m0aeyZnlV+01mFqIkErHeFLsbDCHStw/NobOQnDNZBcog
	 4AOb79qg5hqx6StCoO4Dr6W3CRySL2vwXvaG/b4jkjXWyyuWXhv85y4BJOTHt7E5MPMTS
	 9W5jvWLa8IhM/YTYxxlmZn9Xe6OjEafdrvip/V2vxrJYgJ2vi4XCdG06S4DArZE6rQUgt
	 acR7ODL/2JEdpBa3MQTfmF/pea2wkau2dIe2R05d5avUgp5CwdSgXoIBWJEgqF4WH79Nf
	 KOEXPaKJ7J89MS/ov8XkwMVLKA9yQsiVL39D4bjAMEG6aj79TKlgpZcdT4hivVpIwyg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792266253;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=P82Tl5WsMnuallSANyoO7/K5DQIwK0WA+PEEaWTkjRs=;
	b=iXVoXl103MItQ8oOth+UYtkGI1vcNZYn+zUzr6V0EsQQP91Tel1Hx67BQGbk4K1KWyO0
	 lMCHKs5P10pCUZCmTcyX65A9OEDzL8aN4YNsbSywZkJqcjoCgmYGN+yA5za1oc+RrHEnY
	 rKwFUVKt9/SLrGOtTuxVSqIi5wZbqOSDfB6CeYvu3Rfzxqh2Gjj+Ob4VTF2UUKREjS7Nw
	 gHw8gORWxSvz7RyBjifDpuwBW3oExq1U9TFtOMh6sUQ/QeCOfAexCEa4SLk5yJxYbbYdt
	 YKFyopcmxBRX1RDSTuOrxrh/qiYdt9bc2QFWjp34jyzYXEryjcdlPLqiclQkrrCgfuQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792266253;
	bh=P82Tl5WsMnuallSANyoO7/K5DQIwK0WA+PEEaWTkjRs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=A3dwWckCVs4+CUN/ctzO8Mz/zYLjYryV3j39ZXdOMvB5yPA+iZneXC6V8MUWvv03t
	 yCCM1P0pu7Bfy7zPpmwBDD+wkf1mE5k0qTRGL+pxkBN6YSsQV55APwoUHXOW/8Bwkh
	 xwEM9Pi22oWZqTGgrJngiAiQMhAuTqTYwgga4I1l+7poObKtYynMh8e1bWefTpa29D
	 B3D4DLF+ezwC1EUqQk6+jd5ziLLoUH8CVf1T/PACgfSd1uIZjocxHQ2sedFkdzCGkA
	 1aWFVagV05JmTRVu30RgCb4ETxbJI+imoE+pVzk/7rYK0Al8lN9COtJYe+kudHlpaC
	 ijR/C04TSDKGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6EEA60619;
	Sat, 17 Oct 2026 19:44:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 103E21AB
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 19:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DA878110D
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 19:44:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ja5ZjCo5T5FA for <buildroot@buildroot.org>;
 Sat, 17 Oct 2026 19:44:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C4AAA810ED
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792266247;
 b=DmeA9oEngUlnkrA37N+PeSUNBHDkEkY92FZYIME+I9vTFXnliqpQp6fuCOW5DPt+0U7M
 /3Iga4dEg1tggZLcw9c+Edbv+zy4iyfRDcHPLmk5HVwtRuZKf+5ecwo/rknrwDNOVFiy/
 cJGPFNJ7gpVZAO0bpAIDPhJRQNMJ6JMjUJ5xAaAXcfK/j9HhEcRVtZ1mseq37QOIH64Ko
 Jd2D5FXCb9EoivLoZqLPKzSCrGD6z0qFHy/Yiwe2kB5xuiyz/3pkfcdZ3SR5XE+8C/adC
 Ink6vwcKujs+MvIbU92wAs4ujLz3bV9IDRmv96Gwgs7DdYOJ50EN7k5KhVZtl9c1QGQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792266247;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=VpZcD5czST5+ROJOjTRdzYNxBS/fcbuQ8Eu4YG4YtbA=;
 b=OHCK+0VutVEEMYiWBzEyuRSueD0PJkkFDoTRUw9Jrfhv5TW4aKDl3oNut0DCo0RaQJHf
 GGjmZsncKptNhtWbiTK3WH4fIvzNC7zS4WiIXgZxXyqjOas8cPrz25EJKKoS1DMl/6mfQ
 Grv+7RyDjD+1zlkf2T4XesgdW9re6bZQBZRAbGvMvB8Y1wO2r/hbDj7DYa+9ep0d/jcm5
 jpG7u5ljGv7yHIX7v8rwurkKYPXDDge8j+TxQXggcq78EGFk2VxrVJ6PyUmz8+POKIQrt
 F6D0VNOtzy52wC5uTxil2AQQ/PsoHYyRSim2NZHLtLBEvZWsSayml2Grm5D+nSXksJA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4AAA810ED
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 19:44:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E0FF9599D; Sat, 17 Oct 2026 19:42:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 17 Oct 2026 21:19:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b2ac4d9356c3772c2be6c0b91e98390d3a4e3d7
X-Git-Newrev: 437e7be84309782f322526a636526caa962ca784
X-Patchwork-Hint: ignore
Message-Id: <20261017194246.0E0FF9599D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/lafrite_defconfig: switch to
 Bootlin glibc toolchain
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/437e7be84309782f322526a636526caa962ca784
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

As recommended since:
https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 configs/lafrite_defconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/configs/lafrite_defconfig b/configs/lafrite_defconfig
index 5f70706fa0..2454d2b7ff 100644
--- a/configs/lafrite_defconfig
+++ b/configs/lafrite_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/librecomputer/lafrite/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
