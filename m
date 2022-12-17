Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E573CC3DA78
	for <buildroot@archiver.kernel.org>; Sat, 17 Dec 2022 15:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7859960DCA;
	Sat, 17 Dec 2022 15:38:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7859960DCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9v8h5_w_Iw69; Sat, 17 Dec 2022 15:38:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0E1960DB2;
	Sat, 17 Dec 2022 15:38:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0E1960DB2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 022EA1BF2FC
 for <buildroot@lists.busybox.net>; Sat, 17 Dec 2022 15:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD24460D95
 for <buildroot@lists.busybox.net>; Sat, 17 Dec 2022 15:37:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD24460D95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WbEx3Cq1nSKe for <buildroot@lists.busybox.net>;
 Sat, 17 Dec 2022 15:37:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BB9960DC2
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1BB9960DC2
 for <buildroot@buildroot.org>; Sat, 17 Dec 2022 15:37:38 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id o15so3708426wmr.4
 for <buildroot@buildroot.org>; Sat, 17 Dec 2022 07:37:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BYplv5TtosMp+AAwi1KnGNc5O2+G7a/MVAX2+JplT98=;
 b=yvT0UTUiJlekJdLIPaYjoQ21CPX9nB2ZlKdwR++A8Ws44QIdbaufGM/xkpLADYYeiG
 IdccoKP8qmv5Oz05lPlJNFwoSwILXuxz1rBN5oAoIBHPRmYiGK+gqQi3mrXSUSFaeLhZ
 mDZtrwRp7dRXPHmeMa4Ynw2W+Bn0/O4eykq9JrCGVAQmyrLNO1XU1lEmlYalCIfRXPhS
 0wvRjWoo+3JkO+LV1JiMMdkKYQEiTzM17rAO+PVCDARYXJPBSv1Y/FlE00YH2mPBjO64
 +r6gk+6o9fJ7l16N7oqeJ8xNjhkVIQBWHsS/4HO0Jo3eN/5srZHfPgu94zXrZf7b/+GP
 bqFQ==
X-Gm-Message-State: ANoB5pnTwgltaBV2GD65UjEdLojYSkRtU154c3IrkgX2dc3rPEhWEhAv
 F60pOoO3hEM/aiSEGYqQoDZrs14RkCE=
X-Google-Smtp-Source: AA0mqf4Ymc9vCRyUsMun/ezpZuQwFq4ez9Mlw0Mb7g+2VrQMTVBPWqUTLTi6u+qvH/hCAczwEjhBdQ==
X-Received: by 2002:a05:600c:4f05:b0:3cf:85af:6a4a with SMTP id
 l5-20020a05600c4f0500b003cf85af6a4amr38945399wmq.25.1671291456137; 
 Sat, 17 Dec 2022 07:37:36 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 1-20020a05600c228100b003d23928b654sm12933957wmf.11.2022.12.17.07.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Dec 2022 07:37:35 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 17 Dec 2022 16:37:28 +0100
Message-Id: <20221217153729.545952-3-romain.naour@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221217153729.545952-1-romain.naour@gmail.com>
References: <20221217153729.545952-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BYplv5TtosMp+AAwi1KnGNc5O2+G7a/MVAX2+JplT98=;
 b=JYzuVIXg3dUhuPo5WtIdTZQ8GEkKEF2t/KV+ifMXium9VuJLtfaFMYMiScl6PnvcoC
 rHpG3E6RQ5klCA9Km+ALe9kwUdJ+aAnD1k7M1BYaY9WBS9GujhepYp6FyMBVPXtfhNU+
 nrpY8lvZzyAdBq/U8mMoaIIzywCg1NTqOXWLc0oCK+HPhgqr5QUjdp6ie1roLiEHbvNh
 oLTPrMkbuLJVrUw/8Q4jDaiyx/YWp7ibhqoVS+HcxQtkEDumoBEXeJ5lD08V+3V0szoG
 JNHEaoQHVe3tSCDKU7sGhd/gRsewAbw7ifrYH+tCeLx52oNL9aYf59SxSMhJFAzs9YSq
 Eawg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JYzuVIXg
Subject: [Buildroot] [PATCH 3/4] package/qemu: reorder dependencies
 alphabetically
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/qemu/qemu.mk | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index e800f31e7e..d42a16ec3e 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -22,10 +22,10 @@ QEMU_CPE_ID_VENDOR = qemu
 # Target-qemu
 QEMU_DEPENDENCIES = host-meson \
 	host-pkgconf \
+	host-python3 \
 	libglib2 \
-	zlib \
 	pixman \
-	host-python3
+	zlib
 
 # Need the LIBS variable because librt and libm are
 # not automatically pulled. :-(
@@ -251,12 +251,12 @@ $(eval $(generic-package))
 #-------------------------------------------------------------
 # Host-qemu
 
-HOST_QEMU_DEPENDENCIES = host-meson \
-	host-pkgconf \
-	host-zlib \
-	host-libglib2 \
+HOST_QEMU_DEPENDENCIES = host-libglib2 \
+	host-meson \
 	host-pixman \
-	host-python3
+	host-pkgconf \
+	host-python3 \
+	host-zlib
 
 #       BR ARCH         qemu
 #       -------         ----
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
