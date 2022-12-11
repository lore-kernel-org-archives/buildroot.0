Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D6EC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 20:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4607181391;
	Sun, 11 Dec 2022 20:44:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4607181391
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jIlXqa_-y5KH; Sun, 11 Dec 2022 20:44:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93EFC81388;
	Sun, 11 Dec 2022 20:44:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93EFC81388
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6DDC51BF2B1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F3E74019C
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:44:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F3E74019C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NgBCC7glkp33 for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 20:44:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4CAF4015E
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C4CAF4015E
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 20:44:46 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id q6so5303391lfm.10
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 12:44:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QpGfmhMnF0jAGu3soTUTASoTrzQgShXIjuxhXlkkiH0=;
 b=c8IQjw/hw9/2mHrBDnc7y6A6jEPI3GTW+Z2XIAWL+5Yox5ljLngVM7LUJJFsNCwM+j
 4qVacNRXHTb7LzzF66y5Qs2GcFiQOUHoLocaCVqOSyKe8M6NysFCZJz5BQqZ41f3Htac
 D0TLgoC2Q0eG35DEGbtn7Lvi4+ZlWsjL2wAnUh70XPPZO7yRgRnpa+ydqZV8qllBbLIS
 Tgi6wNHF8t2j0nHYXFGHfyZKVhx3f43vgALyjtGIo93pdhfrYc2xiNxO7J/y/gDEdpdf
 i7IOL9UedykUhc6M8R8k1EszRTRInIvsQc+wO2DXmGQUTHvzAa7BBL7bE+Kx4bZoAaPt
 +azQ==
X-Gm-Message-State: ANoB5pmD7LZ46AY24fVrRvjjOibiXFpk5+vEpOIhhpNkWjUhJt1oMrRS
 QAAkgOpIuMlXWJY8zeeJ5f/1qrF0gAw=
X-Google-Smtp-Source: AA0mqf4Fon53Ue7fvxMRPX6d/CWerbACOlV2IDqczU65AM86tSk0mP5+j7fcVPWKZBiN3pnc64nFrA==
X-Received: by 2002:ac2:4a87:0:b0:4b6:e8ac:8499 with SMTP id
 l7-20020ac24a87000000b004b6e8ac8499mr655394lfp.20.1670791484378; 
 Sun, 11 Dec 2022 12:44:44 -0800 (PST)
Received: from stuudio.localdomain (94.246.253.165.cable.starman.ee.
 [94.246.253.165]) by smtp.gmail.com with ESMTPSA id
 y2-20020a196402000000b004b4823f02b0sm1322619lfb.152.2022.12.11.12.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 12:44:44 -0800 (PST)
Received: by stuudio.localdomain (Postfix, from userid 1000)
 id 204562A24A0; Sun, 11 Dec 2022 22:17:11 +0200 (EET)
From: Indrek Kruusa <indrek.kruusa@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 22:17:01 +0200
Message-Id: <20221211201704.25858-2-indrek.kruusa@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221211201704.25858-1-indrek.kruusa@gmail.com>
References: <20221211201704.25858-1-indrek.kruusa@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QpGfmhMnF0jAGu3soTUTASoTrzQgShXIjuxhXlkkiH0=;
 b=airROnleWLtsF2UuPG0Lg4hR9Kfl+q6kEJVlTyP32iw7Fp7Fr1DQEut5G1+daz8Wm2
 bYOFqTGmBHOGm3rgeX53AgRfsowvRjKBDgl0RPvQsJZYpPRD+S+ItHGQQv+dMW0T2WwU
 kBoWK6lYkydvD8VDdqKqwyi4J2CMZqDqy+q6slHh+ITrl1BMEfuND0L53H1quzis20HZ
 upL8pNEKqHX2YeDcAEss0DHjFbLSAihBNPqiLKbpqB0CZKGJae9v9UEUeTyZ49Wrozbq
 YE0BtZjf6D0bgObILjql9dLARjlapNoANNurRna89ooewkR0J8fImZHKSvChowohoCRo
 IWNw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=airROnle
Subject: [Buildroot] [PATCH 2/5] board/nezha/genimage.cfg: remove boot0 from
 genimage.cfg
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
Cc: Indrek Kruusa <indrek.kruusa@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Indrek Kruusa <indrek.kruusa@gmail.com>
---
 board/nezha/genimage.cfg | 25 +++----------------------
 1 file changed, 3 insertions(+), 22 deletions(-)

diff --git a/board/nezha/genimage.cfg b/board/nezha/genimage.cfg
index 783391fb99..5763b40cd4 100644
--- a/board/nezha/genimage.cfg
+++ b/board/nezha/genimage.cfg
@@ -4,34 +4,15 @@ image sdcard.img {
 	hdimage {
 	}
 
-	partition boot0-1 {
-		in-partition-table = "no"
-		image = "boot0_sdcard_sun20iw1p1.bin"
-		offset = 8K
-	}
-
-	partition boot0-2 {
-		in-partition-table = "no"
-		image = "boot0_sdcard_sun20iw1p1.bin"
-		offset = 128K
-	}
-
 	partition u-boot-1 {
 		in-partition-table = "no"
-		image = "u-boot.toc1"
-		offset = 12M
-	}
-
-	partition u-boot-2 {
-		in-partition-table = "no"
-		image = "u-boot.toc1"
-		offset = 16400K
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 128K
 	}
-
 	partition rootfs {
 		partition-type = 0x83
 		image = "rootfs.ext4"
 		bootable = "true"
-		offset = 18M
+		offset = 2M
 	}
 }
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
