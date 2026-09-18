Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77581C982DD
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 19:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08B5C81322;
	Fri, 18 Sep 2026 19:35:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X0oeUKexmfbU; Fri, 18 Sep 2026 19:35:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2976581324
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789760134;
	b=WqXyEkpD9HBuJrqKUWDafSiMytin+SSNKov47nePpvPbx2M+ytDcwTB/fb5bgWkVI3M8
	 NugFrimJfolvDTdFMYN2HqwawuoxoaSa3z64gzxkbjx+QaWesrVs3jrgq4Y5NieRcZZhh
	 0r6i2/TDGZ5sXUgT19QqgjOaIfZmtQJATEBp9CV7ewJS56cN5jfYbX7r9vKpJBctq9KJN
	 sDAG/NFi1d8Myiv59XFNRZmVdDsVvgr0FqTG5uZpZxg526y/veYhv85KptJZb9nzZ7Awk
	 xj1T7F1XUaSsocxmjrWdtsdW88chzJ462gTWAkz4WqxtNH70VAZm8Qp70unL+a2l4Ng==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789760134;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=U+ehRVOpESoF12uDTPUUFs7gVbayEJYdj+4wjidsErg=;
	b=p5udgF9cnQqrO1j3ILF2wIXiLa20rUpyRiD9XDC3UbTrkjPNsyrOiaVm8EfQ2GNrepgw
	 fu+bi1lOa2aQ1Jmqpp2XAaRrf9lwM52UJWG0puegNVqeXFkEuHe3lmE3p6JVKOBrwxpxr
	 85v8s26z9aEpdF9tIq/6H+zh3K/Fb3KwSACfWExbb607FcSiZV/YByAQi3Tpfd0jsPKbX
	 c4897r5u3TjVZcIuaulkz1ectB5N50VR4FUx+GyqdHvcnjM8aeZWZ4AXC7RUqIMTfdY7L
	 5I8Snx/Z+gOqweg7x9yaBtV2cx/2RaIuq5eN8Oe7o4sf+1Igv7orc4XmfXejeqcknXA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789760134;
	bh=U+ehRVOpESoF12uDTPUUFs7gVbayEJYdj+4wjidsErg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QCBpfO8+h9ees6J5Tekf83r8jbn+NuYHfSlR1zGeElptTRl1Ayd8MeOA1VfGGKN70
	 A1qQ4NV7S6mFN/fsicZQN02rTIN9P/lB1E5eMmVjgE9fc+m8bNm9Q+n/7t6IQUuuTp
	 icUAlMZjJbpLaZc4nlFcot4iKu5+RBlpEH25vRU+e4fyoBZC5rc16VJqgw5ZZlfqmz
	 EBjwOolmG5OE0Hf4KPpkg4w4SU72NZC76C/JXKm3+AGXcPoIUcZIadMMmQ7CDEtTxH
	 i+bbSRupVH0iQXIawmntwLpojYu7ROX5aujcjDoZveCzDrKmUTvKHscwadoCASiIni
	 ANNMXcZad/Mqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2976581324;
	Fri, 18 Sep 2026 19:35:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 52F4C25B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4460E40D0D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:35:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PMZpfsc2OaUl for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 19:35:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AAFBC40D07
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789760132;
 b=scFHFtiI8s90XO5HtbHNCbkMD4lLMGfd9RTWhyxGd9r4Qe1DRha37q/ho/AGE1QHHDO0
 OpBNbSm4hLVTJiloIlhgSMnPNd/cwrQ7OLmN12cmdmK2W0FCAAsxkVqOnID5smosxbkIV
 oDA9HnJ7L4dI33hi6BNKYnmLY5Wu4L4OFd5Q+x9/Yoyq2qm7+X2W6Ra+1UvmZWmY1+HpC
 MOgGuKRXQwuVz8A1ORHJJfWxz2cJaf470AZtCVLL3RXO13uHpvlqQzL/kpHzKxxruVgBA
 hIZTqd5W6V4V7K4mniPlUOQThqp6UpXyYk9W9D4MkcVbbjGLy5f9DzSlyVmLdO4XGrw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789760132;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Vhy6vonOyC4vfM5jzkhx3xugifxNt3p0ApiCbZjvmPk=;
 b=dnaM4anYT3djVIU2rL2d4xrCifhrQ3v9IfYvaRdzRc3ZTC31Ao3zkyRp9u8YxmY985Vj
 O5eWt4m0T9tVc+ek/JqTFKQRoMi/j73IiIBAPQBIHdzrxVwszHYE+215jpCpSOo7DtpNo
 8T9G6XX3vimJpuc7iyhqUbSp56xK4SmpMy/a/73WDTalOdjod2iEdXHic2dMjJKDuP9Ro
 w3hbENDcrcHQ9AQ1Ysxrlz9Qi9Tjxr4A/uXHhG7EPzIuEXZunt4ZXNwqEEGMzFUX5QcUY
 s2/UnRiaBsC9dfs9zjs2c2A6Yw6929b6whwneeQQgGNR741qjiIla8YldvP1CaaASCA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AAFBC40D07
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:35:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 25066976A9; Fri, 18 Sep 2026 19:34:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 21:25:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 56cdcb8206f266fb944f327830db881ce1f7bee2
X-Git-Newrev: 0fbbe6b681281d1c2dbc300d336a79a5c69406c1
X-Patchwork-Hint: ignore
Message-Id: <20260918193425.25066976A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpi-rgb-led-matrix: propagate
 ffmpeg dependency
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0fbbe6b681281d1c2dbc300d336a79a5c69406c1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

BR2_PACKAGE_RPI_RGB_LED_MATRIX_VIDEO_VIEWER selects
BR2_PACKAGE_FFMPEG, but without propagating its depends on, and most
notably BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS.

Fixes: e821078031e14df69e5142f23e9cb7b5a1ea0e77 ("package/rpi-rgb-led-matrix: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rpi-rgb-led-matrix/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rpi-rgb-led-matrix/Config.in b/package/rpi-rgb-led-matrix/Config.in
index 5088af3bf1..8bf9a81908 100644
--- a/package/rpi-rgb-led-matrix/Config.in
+++ b/package/rpi-rgb-led-matrix/Config.in
@@ -29,6 +29,7 @@ config BR2_PACKAGE_RPI_RGB_LED_MATRIX_TEXT_SCROLLER
 
 config BR2_PACKAGE_RPI_RGB_LED_MATRIX_VIDEO_VIEWER
 	bool "Build video-viewer"
+	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
