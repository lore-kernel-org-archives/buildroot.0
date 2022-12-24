Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCDAC4332F
	for <buildroot@archiver.kernel.org>; Sat, 24 Dec 2022 09:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A8ED4016F;
	Sat, 24 Dec 2022 09:18:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A8ED4016F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ttjPl16rD5Q; Sat, 24 Dec 2022 09:18:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CB2740588;
	Sat, 24 Dec 2022 09:18:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CB2740588
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E747C1BF296
 for <buildroot@lists.busybox.net>; Sat, 24 Dec 2022 09:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6535A607C7
 for <buildroot@lists.busybox.net>; Sat, 24 Dec 2022 09:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6535A607C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wtBUWBd1PiNw for <buildroot@lists.busybox.net>;
 Sat, 24 Dec 2022 09:18:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EEB360AF4
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0EEB360AF4
 for <buildroot@buildroot.org>; Sat, 24 Dec 2022 09:18:16 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id l26so3402718wme.5
 for <buildroot@buildroot.org>; Sat, 24 Dec 2022 01:18:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1nGDDRvTiLIBAr/ecgdm7TI3PGONFNalTPZGfzB7ZoI=;
 b=TS3RmYBd9c1zX5wu0JMkJP6651nlsyNICgvpRYDA79BRXxdyAs7hW3kOuNbfMr2nXw
 8NqLf7tu92mzmvN6kmF7DH5judlx9Cdx35symFSThVdqRkJCjfDn65+KMMUoUfXOgo0H
 ujz2ip8AI8Cr78zw5NWD1VBrX7kv2pCZy17y0hCfoSwAL8LqaVSf4ojj/gJ2JHIBspIw
 qqldIkAj4fq59YhwxOo58LlnO4G49uhvunb3KeKdVdx1VgkCHtcIUyYjD6/qwesM5cj4
 kbSAvT5qGHRByfpGQrr9oZh2PGA9bPSV+ZsHKz2ekwQhGl1zJkwkoU7CF7Brpf5o7hPP
 IQ5w==
X-Gm-Message-State: AFqh2kp9WFcG/QaX2f+5q/D2k/v3fI8OYTxIzrQHVfujEQYnktFZgqK5
 o56zwBDwBZAi69xXiDf94x4MNh0MVGg=
X-Google-Smtp-Source: AMrXdXuyCkJYU/BQ+/J6f5AO2rfgyo9L8z4NoGxBqJGh1BUOVXINZryZqcDuzadYKmjlhxRsEAUtRg==
X-Received: by 2002:a05:600c:348b:b0:3d1:fcb4:4074 with SMTP id
 a11-20020a05600c348b00b003d1fcb44074mr10385464wmq.22.1671873495320; 
 Sat, 24 Dec 2022 01:18:15 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:9ce0:1380:e1bd:a6d1])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a05600c35c900b003d6b71c0c92sm16526202wmq.45.2022.12.24.01.18.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 01:18:15 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 24 Dec 2022 10:18:13 +0100
Message-Id: <9b491a410b4067fb2107567b79329ec541f8b241.1671873478.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671873478.git.yann.morin.1998@free.fr>
References: <cover.1671873478.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1nGDDRvTiLIBAr/ecgdm7TI3PGONFNalTPZGfzB7ZoI=;
 b=FkD0ZKgTufR+TOMWXDfLYa0NCapWDxG3nV8+YCvSKyu0wmLzBoEJRivtNPjYkG4xLa
 OAf6W0zh6Anxznfp9AmhIISzTHhWuSjqBUJnKJinhuDZrBK/LzdUGZfC2HrQTTvrn+4T
 lnerkE5ZG3n6X4yqIyaYsN+mibsP9g4adNjcVgtgo3SPdPX+1VQMwGzqZ84UIxUNBP5l
 ZxRbdr8s8lrzbR70+Z2/TN/8cVoMcJupTyxCbxXiopuAY1wc2Cf90akWuOA98x4dKukv
 fUSqiozQDOAeAM5zkKylJjXMF2rCWYAYaZXVYeN+zu0JbVF3LRmLvp3ocabOvUhOPS8S
 SlJQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FkD0ZKgT
Subject: [Buildroot] [PATCH 3/3] support/tests: enable PPD, and thus TLPB,
 for systemd tests
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/init/test_systemd.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index 06c42736ae..ddc32b0838 100644
--- a/support/testing/tests/init/test_systemd.py
+++ b/support/testing/tests/init/test_systemd.py
@@ -13,6 +13,7 @@ class InitSystemSystemdBase(InitSystemBase):
         BR2_INIT_SYSTEMD=y
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_PER_PACKAGE_DIRECTORIES=y
         """
 
     def check_systemd(self, fs):
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
