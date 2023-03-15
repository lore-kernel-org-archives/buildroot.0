Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D46C6FD1D
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 09:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3324741758;
	Wed, 15 Mar 2023 09:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3324741758
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xmQsj0ybh235; Wed, 15 Mar 2023 09:18:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C32BF41769;
	Wed, 15 Mar 2023 09:18:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C32BF41769
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 92ED11BF2C1
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 09:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C0F1410C5
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 09:18:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C0F1410C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cn2LjkEN7FlM for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 09:18:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5890E40240
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5890E40240
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 09:18:03 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 p13-20020a17090a284d00b0023d2e945aebso3046501pjf.0
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 02:18:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678871882;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zXhPtqiVZfm3JQJeTpuCMo4yCvkoavbah4YwSqH3C1Y=;
 b=Gx8ZResm50KpdK4SK+lkLpdtffA8XIHWvzQP75q1n3NQbb5n48aHaOeCcduX/4L8Uy
 mAxKc5iy5PjEsnshtn9TgNex9TH7zM5n2wKQqgVAuLTJHq6Kf8rlO2eBqKM+zH+MD0d0
 b/a5PNDtFs7iF9bDESzPJXcndDAOmYFnE1EziByCXo5BKYPVnVYnBfKF6QATbyq6dKb8
 LSW2JK3uaunLpfksqbbm89lTCeOQP5o3MnTt30XjzkAluljskQuE0rjaI+ARCZ533cet
 VjGj7yUUDkvCGVH5IvJsScAuQeQQOWXsQKoFl9WyK+90DI5JyZtSt6inOUzjvMY2pJlS
 h1uw==
X-Gm-Message-State: AO0yUKU8yIDi9vxcUnseQjmfBmCq0L8LQCVrNhGUc32g3vHArjpGzUxs
 Z9WSHaFgmp4IhEaTt9lGgdKw3/kH+yoAE4MDo1g=
X-Google-Smtp-Source: AK7set/yDADdVBvuJC7Wxo2AgSxYxP6sy6PhFGOpDDDq9aMHO2+WggmxwpaREZNYHWqLsQdiFpw1Ig==
X-Received: by 2002:a05:6a20:4415:b0:d5:f6b7:e1dc with SMTP id
 ce21-20020a056a20441500b000d5f6b7e1dcmr3153317pzb.37.1678871882246; 
 Wed, 15 Mar 2023 02:18:02 -0700 (PDT)
Received: from localhost.localdomain ([193.37.32.210])
 by smtp.gmail.com with ESMTPSA id
 h35-20020a631223000000b0050301521335sm2872100pgl.11.2023.03.15.02.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 02:18:01 -0700 (PDT)
From: Javad Rahimi <javad321javad@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Mar 2023 12:47:28 +0330
Message-Id: <20230315091729.1771792-2-javad321javad@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230315091729.1771792-1-javad321javad@gmail.com>
References: <20230315091729.1771792-1-javad321javad@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678871882;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zXhPtqiVZfm3JQJeTpuCMo4yCvkoavbah4YwSqH3C1Y=;
 b=TRyT7C4FKKWw7It/ZpmDzROX2VE5VnKtEpUvOYlNHAtesgMpvPxMZPjHyBoJAucN11
 SaQQ/OsIC9R/2Pv5NQ7LfTDQmI7nkcVx5n/RV5y4kvMQQaKa3KVWfvdJvqlBr+5j5AfJ
 uTS4KmfEsW/GBxX6YsTWhMtkoSXdU8L/gkPkQJNBAMT3D1tUYC+i6sWEween3J16DxFX
 5puwgsZCz/qujYoAOvEcwtM7+XrWxm1yh0m19aAmLoAv+0/rcROWkL0Ul7Eqhun5IUOq
 9bbCB9bV36P1hNtkYrWSYbXtgExup1C8t+kWdJClwiz74qsdC90QsyAQsRkfG/tEbBZZ
 IBLw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TRyT7C4F
Subject: [Buildroot] [PATCH 2/3] board/orangepi/orangepi-pc2: add readme.txt
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
Cc: Javad Rahimi <javad321javad@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add readme.txt for the OrangePi PC2 board.

Signed-off-by: Javad Rahimi <javad321javad@gmail.com>
---
 board/orangepi/orangepi-pc2/readme.txt | 37 ++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 board/orangepi/orangepi-pc2/readme.txt

diff --git a/board/orangepi/orangepi-pc2/readme.txt b/board/orangepi/orangepi-pc2/readme.txt
new file mode 100644
index 0000000000..6c699244ce
--- /dev/null
+++ b/board/orangepi/orangepi-pc2/readme.txt
@@ -0,0 +1,37 @@
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the Orangepi PC2. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+Orangepi PC2 link:
+http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-PC-2.html
+
+Sunxi Wiki link:
+https://linux-sunxi.org/Xunlong_Orange_Pi_PC_2
+
+This configuration uses U-Boot mainline and kernel mainline.
+
+How to build
+============
+
+    $ make orangepi_pc2_defconfig
+    $ make
+
+Note: you will need access to the internet to download the required
+sources.
+
+How to write the SD card
+========================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+  $ sudo sync
+
+Insert the micro SDcard in your Orangepi PC2 and power it up. The console
+is on the serial line, 115200 8N1.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
