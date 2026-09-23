Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828E2C9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36EBF40FDF;
	Thu, 24 Sep 2026 18:58:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nAIJ6farK_IX; Thu, 24 Sep 2026 18:58:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2B94F40FC3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276319;
	b=VRdJEg6/jzvzjwHl+ZLaAHwZ6N8+CaXC1WGpQYGuduiIpa6X+yODIoxsIOB+sZWZsVDg
	 g0zXZoAg+MpVSixAM2ZWTuQf8l9DZ2AunrrBMBirjpYbmdotiGe6vzPZmRfVZvzC2KwIP
	 wBSmCWHnFwLSWrdCxqICdFNdvwl5UpoqSZ5whPy8dMMc1IBpznAIN3upKWthuBqXTUPgu
	 DB9tVpxmVtZ4Cv08u1dqgHD1NPL435+Dtc6L0WmZsarsmJaVg4lhxfu5bcY7Sr7S1h+aY
	 SckLdSd4mc1PdzpqUas73ljsfzBCr2T65vLwghc6dJ5fLbItmEnjvx5POzaU6o2KR6g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276319;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=kjOrhj5RUwPQk6eWkx9a5/J6xKTo3RPDcqGxq42T/2Y=;
	b=BnYm5seJtaeMZmsTlfNVa9NFscPMPWZ072lJ65PHxuov5NP6psKGxyoKK/24IW6V7Imd
	 HgrvXUQw09qEXtlN/YRaRYFO8dJ2lJFIihkLCvXAfSkAc0cankZDaal9B77iTcJI75wH5
	 4roJ9sE81CGmd96AJ4i+UQtjIrs773SiexNKShYiqFf3xxw1LaHcGERYuPQL9pogWtnM5
	 Q3rdeibBf+KPWsVF1RQDmttwlSkzAGINUXlWkWAlrbRXIkFlqQO4UK2qsIQmG/wnkflrx
	 Q639Mj0B8lO3i9vday2RQDuJfDiweRtDCXlbr/W6uiJnnYK2OgRTrdld1rM7OCp62uQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276319;
	bh=kjOrhj5RUwPQk6eWkx9a5/J6xKTo3RPDcqGxq42T/2Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HOqp2nhDUf5+JiOS0Ae2vq3j+0JIl8C3j2atta7RrOEHD1fcjyRfAdFkdcjHuF4fs
	 2Fy00atMG/VRyx9L5IM6R83/1bxywwMOnkfR1E0QBJG5b+UemG+EcDZbervHlkXmEg
	 f026hdCHnZmkv/dxGFyEKzhI4NTGJuiYvq0o0pY/i8OD3Lrkgr+KMloByeQkVQDdKV
	 D5snmf7jVwvURIibONi8z3AhHOyL/utnJLQrYx8f/k9Z4p+IPLEAcoozIL1dSsRSgu
	 Gi4jbgCfOwmY6MnHHwJ7CnhvyUeBScpgcX2r7vAiM0nQCD6NeGztYy1Q5ewYtqMk7c
	 jXyx3355icWfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B94F40FC3;
	Thu, 24 Sep 2026 18:58:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A4C3E3B7
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A194581232
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ITG6aMYi2EFx for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org AD5348122C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276210;
 b=QNf6e8dQt6uZGej4X7d1vsDPslFZojazty8OUslnKOhTIHNRKm5UcHJjH7uRRaOkjQvq
 yFfOWiW1ETuFzTr/qcrafQ+tnNnQmYDLxZIlL3r/paCwNVkU89ENT0p2sNvgZy7w/Q+zB
 Pd8IYvhgXxJXXqpM4vlu145gjAAMQgiYMQidFYYwoU0OLf+83ZxQqlmhe7CoRzdZI8Axg
 /JBzxyM0t4lrrWX4ZPIcKCtTJU3SKFEGMARvV8M+OvHbVmiwOCOzVDakWgKO4p2HlDM0G
 oR15Ooohz4iYtjW0wqD0lPMOcn0qpRCeGZa+s4ZY6JQd1pdQ2rJHzoaT3LAk/UKeHvw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276210;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Y+xYzQ37JZ7pPMf5fpXBKaqz2z1mtT+XY9bdFb2KRvU=;
 b=IxA5+SOgpqQyMD8mid5DyvZhUEf024VhTl5J2orIbG/X3nMWIEEkcRMkiRunQVElBEHY
 Q5PT1AsJ1IAMryTf7UBOYS/Bbdhlxpyl955swG2CwPJvniOzZnfBymw2pbGSevloEXDGR
 6gIyNy90ecBJR35Svv/kTjgP6ZY1grmVarQSh6Q/Cl1HK48qTe4Rwnstn0idNiQ+hIKUC
 68tKJnBet1PaY0exBZqUMsQfQqL3qLOeP5Kz2RFR9ICULpCr5mJq8Kg/T7TFGdTMc+Vvc
 NGKPiXIxm9sg5S5WQ7W47wjzxJKiwI/cg3DyEA4dvNrHzEoxYZ/a/xunqWi8UHsJv9w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD5348122C
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 50F2D98383; Thu, 24 Sep 2026 18:55:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 17:46:54 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 9f273c5a79d819beb4122d13348edd496c659fd2
X-Git-Newrev: ffe6be087681687d0aef3fcf453694a444041616
X-Patchwork-Hint: ignore
Message-Id: <20260924185540.50F2D98383@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 package/rpi-rgb-led-matrix: propagate BR2_PACKAGE_GRAPHICSMAGICK dependency
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3384147431957110523=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3384147431957110523==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ffe6be087681687d0aef3fcf453694a444041616
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

BR2_PACKAGE_RPI_RGB_LED_MATRIX_IMAGE_VIEWER selects
BR2_PACKAGE_GRAPHICSMAGICK, but did not propagate its BR2_USE_MMU
dependency. This issue exists since the package was introduced in
commit e821078031e14df69e5142f23e9cb7b5a1ea0e77.

It fixes the following Kconfig warning:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_GRAPHICSMAGICK
  Depends on [n]: BR2_USE_MMU [=n] && BR2_TOOLCHAIN_HAS_THREADS [=y]
  Selected by [y]:
  - BR2_PACKAGE_RPI_RGB_LED_MATRIX_IMAGE_VIEWER [=y] && BR2_PACKAGE_RPI_RGB_LED_MATRIX [=y]

which occurs when you configure an ARM noMMU FDPIC toolchain (because
we have noMMU, but shared libraries, so rpi-rgb-led-matrix can be
enabled).

Fixes: e821078031e14df69e5142f23e9cb7b5a1ea0e77 ("package/rpi-rgb-led-matrix: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e67b301f53ebe6838c92203856792e6953a19f1f)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/rpi-rgb-led-matrix/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rpi-rgb-led-matrix/Config.in b/package/rpi-rgb-led-matrix/Config.in
index ca945a92af..5088af3bf1 100644
--- a/package/rpi-rgb-led-matrix/Config.in
+++ b/package/rpi-rgb-led-matrix/Config.in
@@ -16,6 +16,7 @@ if BR2_PACKAGE_RPI_RGB_LED_MATRIX
 
 config BR2_PACKAGE_RPI_RGB_LED_MATRIX_IMAGE_VIEWER
 	bool "Build led-image-viewer"
+	depends on BR2_USE_MMU
 	select BR2_PACKAGE_GRAPHICSMAGICK
 	help
 	  The image viewer reads all kinds of image formats,

--===============3384147431957110523==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3384147431957110523==--
