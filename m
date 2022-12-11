Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862FAC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 22:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01B3E60BE2;
	Sun, 11 Dec 2022 22:20:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01B3E60BE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pi51CThnB4BG; Sun, 11 Dec 2022 22:20:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4233460BDB;
	Sun, 11 Dec 2022 22:20:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4233460BDB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C58AD1BF3C6
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 22:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC97440159
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 22:20:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC97440159
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RY_VbR6fZGNg for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 22:20:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C128840138
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C128840138
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 22:20:00 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id cf42so15688525lfb.1
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 14:20:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2yBSX8pRFUGfjfSMHJ/TeSc6heMSdHCQUUKBPeaocTk=;
 b=Ie/K4Tc+BMOOrMSV0y3NGQg+qmnpayBIsgTLx5jpWxcuDgz45o3dsOTXQK3AdyHm58
 nUfLN4IyGGmQ02Cy2UQ/xPkfWT1/bZ9AshVXtUjH+WKt5+w1q1mK/NxhFCaxNYU/0VCN
 0V5JtefHgqPkJ4izQghYB5NeLjBtVRM0tu7GCojcPz+gQ942ricbqcAkSwFWMS4kp7Yj
 WHWvabL3sCdnZUqh45bxUz3AXtovrV4YrEu1H2g0CkEotMpDubeOmz9OFZ76mW+Px2Oi
 d3ULUFatCd5SiLDU15RlMD0gLrviaf74ALjJKzof/0cfHM5PZv6LBlxeWTd5zcJaKcNV
 6Drg==
X-Gm-Message-State: ANoB5pmdw/Cm+6nThai6xMa5QshJDGA+13UODwTyXSXAqQqdOH4itdcy
 3S4qPc5YX9JR7iNkQabpiSuZribuI0w=
X-Google-Smtp-Source: AA0mqf421YTt5N0jfi0JWmm1LCE+iMlD9Z1nb817R4niipY2HaxW9OMgYIUQ6V9cKvYjIkmnrndJCA==
X-Received: by 2002:a05:6512:2353:b0:4b4:bca5:5bd with SMTP id
 p19-20020a056512235300b004b4bca505bdmr4309658lfu.46.1670797198585; 
 Sun, 11 Dec 2022 14:19:58 -0800 (PST)
Received: from stuudio.localdomain (94.246.253.165.cable.starman.ee.
 [94.246.253.165]) by smtp.gmail.com with ESMTPSA id
 b23-20020a056512071700b004972b0bb426sm1355001lfs.257.2022.12.11.14.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 14:19:58 -0800 (PST)
Received: by stuudio.localdomain (Postfix, from userid 1000)
 id 053982A24A5; Sun, 11 Dec 2022 22:17:11 +0200 (EET)
From: Indrek Kruusa <indrek.kruusa@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 22:17:02 +0200
Message-Id: <20221211201704.25858-3-indrek.kruusa@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221211201704.25858-1-indrek.kruusa@gmail.com>
References: <20221211201704.25858-1-indrek.kruusa@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2yBSX8pRFUGfjfSMHJ/TeSc6heMSdHCQUUKBPeaocTk=;
 b=c1DFz1BUVmm+TP/yWLmQ/x8tKSrKM98255avXWuKRwBL+zRAhxw4no9ypB+hihiwyl
 k7UAsv1aGGkB1e/ZszR0XV1hV8VrHE0JudlS1dfIy4uQ8CK/HGo7tik6vx5Aaq6VBgPz
 HB1leRUVyjGuFLuJPA7peSZMIp+wfnE/Qw0KgEWb6nJ0fAWbVHbv1ZeEg1ZAjo32EUT3
 5HbNPemVDvfBXT/4z2B12TFBZXrK1uQsmBU8Nch5OxrQO4QG8tdgwAGpPJl3yBaS0bjK
 pxJNizKki0PbKNr+KCZAl89uIdVDtyN1AxcjT+NyFHkgdw90VVSEbAnVw6o3TWvGOR8P
 mgBQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=c1DFz1BU
Subject: [Buildroot] [PATCH 3/5]
 board/nezha/overlay/boot/extlinux/extlinux.conf: activate framebuffer
 console on HDMI
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

Replace serial console with the framebuffer console on HDMI.
Limit resolution to 1280x800 as the framebuffer is really slow.

Signed-off-by: Indrek Kruusa <indrek.kruusa@gmail.com>
---
 board/nezha/overlay/boot/extlinux/extlinux.conf | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/board/nezha/overlay/boot/extlinux/extlinux.conf b/board/nezha/overlay/boot/extlinux/extlinux.conf
index 91b2298628..4bf66ee8c4 100644
--- a/board/nezha/overlay/boot/extlinux/extlinux.conf
+++ b/board/nezha/overlay/boot/extlinux/extlinux.conf
@@ -1,4 +1,3 @@
 label linux
   kernel /boot/Image
-  # use devicetree from u-boot
-  append console=ttyS0,115200 root=/dev/mmcblk0p1 ro rootwait
+  append console=tty0 video=HDMI-A-1:1280x800 root=/dev/mmcblk0p1 ro rootwait
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
