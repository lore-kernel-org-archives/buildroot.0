Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A838CE7A9D
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 20:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 144CA400AE;
	Thu,  5 Sep 2024 20:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pXwS8b9I67sj; Thu,  5 Sep 2024 20:52:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDEF9400E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDEF9400E4;
	Thu,  5 Sep 2024 20:52:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B7A01BF41B
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 20:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE8D581E54
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 20:52:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ltRF2710Uryw for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 20:52:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=mattianarducci1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E062081E53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E062081E53
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E062081E53
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 20:52:22 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3780c8d689aso737306f8f.0
 for <buildroot@buildroot.org>; Thu, 05 Sep 2024 13:52:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725569541; x=1726174341;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CnaSkIEBtzge3C3VL8TDsVFNpBSsHOHSIC2oghX9uI8=;
 b=KwnH2R0oI/sTrSAv8hmAu+TrS7xwjeM9ScryX0UjfoZ/oNnrrqZ/48mshIREhoJ5C6
 MAOkBRDup0tSJsFNaQylFFcZHhWEHAMJFkVifGI+tucm4Y14nnLVmEZu/pcxiJUFwyZj
 Oz476X7rJqfe3zypICjYh3rTWvrQl0PuBps8UTpMc0rHxDYiEacdPqrusGHltQx7BLyK
 4DwQKsN4x/FJy0UcsEzqm518szBebMSvl+NbfjI5Ae8BEGZFIp9cS6XBQgJdGhaSGc8I
 X1iQREo82EUg6jQwM/Ui1tILfDdo7zR3YUeEiINL/4RwKdO5v1uncvpmpTZMFoWMQ3m8
 K6gA==
X-Gm-Message-State: AOJu0YxXNIxpz/LUt5WaT/NApeg+fcddWUFwF6DuB3PqtPNoX6DCQnqV
 jI4S4LWA9hBwceKGNwEdApcjSUGbedaPcuIAppNgGQ5oV2dUzW677X3zOmth
X-Google-Smtp-Source: AGHT+IGbzTUzo6nU1qW1lcbrhLfNzEThCr7pekE8NASV9ebYuyIL69baLCNt4qrFQzQiPo4zhmszBg==
X-Received: by 2002:a5d:5452:0:b0:374:c0cc:a1fb with SMTP id
 ffacd0b85a97d-378896573fbmr200955f8f.39.1725569540247; 
 Thu, 05 Sep 2024 13:52:20 -0700 (PDT)
Received: from localhost ([37.162.189.178]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42c790a32d8sm183573315e9.20.2024.09.05.13.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 13:52:19 -0700 (PDT)
From: Mattia Narducci <mattianarducci1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 05 Sep 2024 22:52:18 +0200
Message-ID: <3276979.mvXUDI8C0e@localhost>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725569541; x=1726174341; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=CnaSkIEBtzge3C3VL8TDsVFNpBSsHOHSIC2oghX9uI8=;
 b=LxRAo8s/E1wDa+Rc/eJLnkx+ebL3EEychARw3LQgIWI2ImWvUZO/qYr5WwmPRlpEtP
 yQEqavXPuW9OaGUR4HV7drCpgum3zefuZjkCq2OpHo5hRLTB2y2tYp+PMwl4k7HSPkk9
 8KwML5gEyVo9C+m/WaLeJyIhuwe+V8u1OfEWjyEZEMilWLDK1I+W8ekCYGuHa9YMvbVg
 B2Nkt+0Zb6AD08TeF8KCCG3y3357NFyilgToJGQrTaYcWKX8w7zZLHuFhXIz2q3K1dw4
 FqNykQ8wSzAKd/EptCFZodSfTRy1UZhzWNvrG2idIfr9bSRRNJyJKJGB2h6xCVl96gtH
 qQew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LxRAo8s/
Subject: [Buildroot] [PATCH 1/1] board/pine64/pine64: use offset to specify
 boot partition alignment
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
Cc: Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the 'offset' property in genimage.cfg to align the boot partition on
1 MiB boundary. It is clearer than fixing the size of the previous
u-boot partition.

Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
---
 board/pine64/pine64/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/pine64/pine64/genimage.cfg b/board/pine64/pine64/genimage.cfg
index 3555869036..bd026c33c6 100644
--- a/board/pine64/pine64/genimage.cfg
+++ b/board/pine64/pine64/genimage.cfg
@@ -18,13 +18,13 @@ image sdcard.img {
 		in-partition-table = "no"
 		image = "u-boot-sunxi-with-spl.bin"
 		offset = 8K
-		size = 1016K # 1MB - 8KB
 	}
 
 	partition boot {
 		partition-type = 0xC
 		bootable = "true"
 		image = "boot.vfat"
+		offset = 1M
 	}
 
 	partition rootfs {
-- 
2.45.2




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
