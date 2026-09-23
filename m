Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E8C5C9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24BBD411CE;
	Thu, 24 Sep 2026 18:59:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rGHGMj1NG0YN; Thu, 24 Sep 2026 18:59:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 15156411BC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276377;
	b=jJdjuRtQz3tbcjehntZGkhIEEzZ9ZyBFEtSOSPJNu5Bf/Tkk1NdsOc6QezpuIxY7/dDu
	 sCRdurNriJYWlYeNo6dOha6WCZ5k4LDwpMfa0pjORve7PA5Fz2f6wNZHBtD1KT6YhxqoP
	 8Z2IzYWB7lbv6PxoyRb0bggqwcfxc0s/Dzki9e0nMbPian8zKi86ib3tGuGNGx36ZROcY
	 A0XD0NThAH5MzReREvmPi6UTlGRKOFbRUf/DZT9oOqlqMLuMM6a6PxJZQ+sd4SSepYDAD
	 F59Wr95m+UjX6rfg6MK/avn+501uD7xixuouzb4CD+/L6qv35lT2M2Uo6mzfA2+pmpQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276377;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=5I6UsMqL06hmikdf7kzjlP/jW80FAD6fiIrEXgQjYoE=;
	b=rkXJFJmXnq72Bkctt14gC4+fO1rig6utZGhi9owauJY0bv7lpNOwhMiNuwHssuYfWii7
	 uCABoocX5qo556AcxU+WHJ2wGsohJ6zLm/BGc6LpONQOGshm7SLUMfzwc4ShWusx1lYai
	 JISPv0b71encIgsFHQ3N9pEuykBKTKADUxP0OFOXIpIYZvw+2MgWecCe1hk5us72b9jTP
	 Z9dBCrw8lDPKd4UtBTMHFUwhBcfrI0lUdxmMoFgHQ4IVjLSrz0zGB87NpclFNvW7UPqoG
	 tfpKmCR8yGYvpnHxhR+bQ0dbtqnee47Axgqvs0JfFCg1UjE68q8M0TOZi7n5fHqzG0A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276377;
	bh=5I6UsMqL06hmikdf7kzjlP/jW80FAD6fiIrEXgQjYoE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bA8mOMtW1ke96fjRjPtV2PyWWgm4LY4T56lWXFyov2Tzui9p9Xr0rZ1fjXxkRQQaN
	 e8Hg6sF7PCdHJ7QiEPFohC1O/pZaJRhAwKR55aAeYso5J9ulH6DxzuOefnJwe9xmd7
	 kBy8YV5xCe7FxM2AC/4iuuDAL9Km38EMUvyRrwub5XY4MLUcBxOhUPlQrQVRcIg0E1
	 lW0Vc/IbtgyBHf8uWDbyu9epMnFbV86HohnpapNdunys6FdJevC85tBtLZgj2LLjGP
	 nESn4e6UBUGFxRcehTX6D6gHwkwCo/i2UdQiaA3Ii/7DLrBc9XoFRO43fjooQSmd+W
	 KDj3/1WAc6Osw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15156411BC;
	Thu, 24 Sep 2026 18:59:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F9B5328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 553D9404D2
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LGhQKJZiTsev for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 93059404D3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276213;
 b=EFb73vE+f7qs49vU4Fuxcq0g92TNza1cZRnQsSrz0MFPFTf3IXhWaDNpBUkf7pYZ7wP1
 ZomonZLOL5UYM6IbfTrGYUJK0zCX71xz8fm/oAjFc8aSLtyWQHtS6Piuv4FyyhdMouiW0
 vsBkOUu9sSUJzKy2PmWdDyjruL72seRZ5mXF0NbIDgOLabNS9fp1assETIdQAe+olSIgs
 M99dU8itOW5M+F8kutxk5ycegmO0wOjmzkTfsBnoFeQhLBAX7WVFSZiyOw5f1TCg8J5Ie
 RfbX3Yn0/x72mybdO2En6k7d1PzbmYwXbeua8fmOAiEQ6hMOdm+qk0LSQUfcjg4JDOA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276213;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=vZI05s5AuFfzGlxqxDUd1r52aoxlZGK59xt7hOY4QwA=;
 b=YigkobNYEG1yPa2H46uvRn+y0fdQTweh4L1uy42+zBMgMMi8KrYwmc6vLzgl3mLkS62/
 SX90R2Kgv3j6bVIfSYyQ60CDCucO5/pixs49Gp2G9+r2dykTmeUhCACfPOAxyOyKc95Lh
 cTTWpM+oR5O9MasOQu/LwSL/C0h6NPwURktHOUCOAxf/k/0sLH8nte/6Ev828QhUsLyw4
 +z6/czrnQNosdHI49Q3UUsJy+Lb4md4VZYVH4tjitIiqG9lP6+DI32c9cx4Mw57EcUGRN
 Xe6LbHkjQQhRa7kOTOGM7ewmcKGmxP9P9CsvI0n4TUTign8n/p97PShtHYuD4z5H6nQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93059404D3
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 370F5982D9; Thu, 24 Sep 2026 18:55:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:24:24 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 26942706905513359bba75d3a94f8c7cc3056297
X-Git-Newrev: 1caa3a3c2288603e8c968be03ab31998e5b6878c
X-Patchwork-Hint: ignore
Message-Id: <20260924185543.370F5982D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 package/rpi-rgb-led-matrix: propagate ffmpeg dependency
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
Content-Type: multipart/mixed; boundary="===============1377797078451555043=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1377797078451555043==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1caa3a3c2288603e8c968be03ab31998e5b6878c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

BR2_PACKAGE_RPI_RGB_LED_MATRIX_VIDEO_VIEWER selects
BR2_PACKAGE_FFMPEG, but without propagating its depends on, and most
notably BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS.

Fixes: e821078031e14df69e5142f23e9cb7b5a1ea0e77 ("package/rpi-rgb-led-matrix: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0fbbe6b681281d1c2dbc300d336a79a5c69406c1)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
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

--===============1377797078451555043==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1377797078451555043==--
