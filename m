Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD45CE7716E
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 02:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D372407D3;
	Fri,  6 Dec 2024 02:57:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZUJ2GWwSXz7Y; Fri,  6 Dec 2024 02:57:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50FD8407D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50FD8407D5;
	Fri,  6 Dec 2024 02:57:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CF74AE8
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 02:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07CC080AE9
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 02:57:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id saNSR75KDN9Z for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 02:57:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 450D580C34
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 450D580C34
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 450D580C34
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 02:57:19 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-2ee709715d9so1159623a91.3
 for <buildroot@buildroot.org>; Thu, 05 Dec 2024 18:57:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733453838; x=1734058638;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0k4H6HE5PpjgG1wmPfPCYD/zXcLUSCSlK4wOO7uAm6g=;
 b=mY7HMvIJw9N/Z3fZezh3704AE7lg+auKjZWDRhHgfoPqveAlyn9ZxAkViJtO8CfVHy
 HFRkQ8lLzuz31olpkN+KhhQHUf2OuaRtbna2DzXubq0jiWNVIvwjiCtuniQl372S87C5
 0EUMxhyeeXWSomLREwmX9srNL97Vf5hw6ObH7159T6hoR0jbbOSWkbfcZzcCmKRtbeV+
 fnJY5du0gb0RHirdVf49yVFAckHX1gTA7djyqm2/E3TZVxEHRJ/E8zOVs2/5upTloYL+
 kwqvTezIcJfCJ2+cweyz5AWehYyqryIwb+qJb0b6fGplW3X3Yf3DvHGByGARJIWHBbzF
 kZpQ==
X-Gm-Message-State: AOJu0YxFcpDoNLMkZk4/DtkAjuv4SZHayHPGSG0FkK2TbrACphKAolIy
 1WUJ+BcXeYX8t50s7lqE1hM6cd4JOfolIVX/O7WhWD2jeTM7c+wYuk9GJA==
X-Gm-Gg: ASbGncsMkXEC5kXrYrLMru78A4UntwrD5ImM8+RZHubNdV+YSJ7ynXSmref8keAnzkz
 2LtF/EJak4/Ps5UEMzOPuneukDPgHjVHY6cqV6BXou/wsNLFvDjXRqir0aCRdRtI8yzWuilEVnD
 QV6l/qLz8aDAuc3lNqGvIWUtmO8YSTXzSZlhXFA376VY34DRSvUoulumZ5q9qN0qOF7DiES3DbB
 c61UeldE8x0FtZbVQxxQf0M4aT0ZOKMJAuDa4c/y4gnC8A=
X-Google-Smtp-Source: AGHT+IE1qkflq26aMHWb7YQLah7RMHpcLlJynZFBPHwq6osdAqAFPCSlF3PUV9Z0AA0Hsda83px1EA==
X-Received: by 2002:a17:90b:5403:b0:2ee:863e:9ff6 with SMTP id
 98e67ed59e1d1-2ef69e15572mr2721233a91.16.1733453837630; 
 Thu, 05 Dec 2024 18:57:17 -0800 (PST)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ef26ff83f5sm4004179a91.2.2024.12.05.18.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 18:57:17 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
 Gero Schwaericke <gero.schwaericke@posteo.de>
Date: Fri,  6 Dec 2024 10:56:49 +0800
Message-ID: <20241206025708.235064-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733453838; x=1734058638; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0k4H6HE5PpjgG1wmPfPCYD/zXcLUSCSlK4wOO7uAm6g=;
 b=T6z7YpsI3EoN4iF1A3E14Z0sduCWHG9UlYO0iFUJ7mFoV8uIWVpOJ+NjITcddhVSxY
 rFUVSd21BKA/5jiohcFHnfHzXtYuwQZCrOsiZRRWHd/+90c0zkYy6QLbkGYXHB96WPe9
 rvPquIdXI7GkVFxSvZ1PzEdFiaq1pXyh7/8R4TB1gXZW9rDGT07AsLzH8pYsWUVCYw21
 TWdem5/kOgQaF60+hUSd7WDl4nQVpaROvpC65u5nk5Xv+YCm4nYLjQ5TvUAzbq8aqSOt
 +j14SFt/NTrmZCmoYb754NanMI3B2jYTo9YrWO5YPFC0D1910Eik+1xohPM6CJpJSwON
 sXwA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=T6z7YpsI
Subject: [Buildroot] [PATCH v2 1/2] board/cubietech/cubieboard1: use
 lowercase keywords in extlinux.conf file
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit also updates the label name, and the unnecessary "default"
entry is also removed.

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 .../rootfs_overlay/boot/extlinux/extlinux.conf           | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/board/cubietech/cubieboard1/rootfs_overlay/boot/extlinux/extlinux.conf b/board/cubietech/cubieboard1/rootfs_overlay/boot/extlinux/extlinux.conf
index 2fde683f38..5b071dce84 100644
--- a/board/cubietech/cubieboard1/rootfs_overlay/boot/extlinux/extlinux.conf
+++ b/board/cubietech/cubieboard1/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -1,5 +1,4 @@
-DEFAULT linux
-LABEL linux
-  KERNEL /boot/zImage
-  DEVICETREE /boot/sun4i-a10-cubieboard.dtb
-  APPEND console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p1 rootwait
+label cubieboard-buildroot
+  kernel /boot/zImage
+  devicetree /boot/sun4i-a10-cubieboard.dtb
+  append console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p1 rootwait
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
