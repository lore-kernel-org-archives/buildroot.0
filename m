Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E0D3C433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 21:03:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F2D661167
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 21:03:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6F2D661167
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0913F40201;
	Sun, 14 Nov 2021 21:03:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6W7ZWE7GWNWN; Sun, 14 Nov 2021 21:03:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65342401FF;
	Sun, 14 Nov 2021 21:03:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C4CF81BF3C1
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 21:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B002D606B3
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 21:03:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eB_J2s4BWT3Z for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 21:03:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BADA760684
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 21:03:21 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id q64so3993418qkd.5
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 13:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MMSPZgoysJ1oO/ZVJes/6/xKsvqPRFQyvXs52XAleLo=;
 b=HGtxjf+VHJx7jXsumDsEn2yuLIDO72rkbN/5onRpKPqyp8YkHfrDgyi1BID6ichMa8
 DJvPCsqmzUTLo9mrySOTDA8mAP+zoRfauJbe6Xj3O7H4gdlZ433GV9i2nP8LYn4kxl1N
 zrYnMwVUnlb/a+MeXHsy6bgo6AVi75bSRSvmbX0Ro9WmFukER6raQIlVBJwyCcFbNu5J
 M5TAM1smgIjSiqp9yWAmZ52FXN7EN1dNPnyr2osEB3A+0QqHmyrwIlR0NT3PeDrzZtny
 PlVorHSWPHdcH/qW7RbqSD7vNi5dEYdl+5NmQDG0goE21iLstCZTULkMWFl/mukXQrjE
 t4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MMSPZgoysJ1oO/ZVJes/6/xKsvqPRFQyvXs52XAleLo=;
 b=c3fpEi9MFdPByxLloUAwd5QBhoJnssrjZLy3UUFQEobvJw/IdBcjUqp+9P2+i+vZAp
 s/j2SyWaaFtx3fUAHnpKBUSRrpm1cHP/NXV6Q6LApTdhOA1yoYEHsisTMpts+369I5Wb
 uZmzQ3ahpUTg1lP9ujILhFU2/J1jnmpGjYqLc5+0TRWwBq+HZaFS3B7OhagtqcV1+4Cc
 aT5ydZcE/HbJZmq/Db8MdsXeVZlNLUwndr8TtA0BmN0i+V20uwG404CB0sEsO50nAVBN
 8/vvGixNIys7ASfZ3TUZFei8FTK8+5q/1wCVhlCXgV3ztaRrP/A6QAJTL2r2qIlYTCfR
 xerg==
X-Gm-Message-State: AOAM5309re5f9wddF9rha12TcrqnGwOnZcJw4rcRNYZZ4kDXHl8G/5Rr
 V6F2R1LXoMEvi2vDLZ6xaNt2YKjpbzI=
X-Google-Smtp-Source: ABdhPJyjRyjCG4JbYsA7YInFIfmumXnshn6uVcLis59iKY6HctUoTDIj/A4QVz5n6qczbdzdV94iTw==
X-Received: by 2002:a37:7c8:: with SMTP id 191mr26403769qkh.54.1636923800433; 
 Sun, 14 Nov 2021 13:03:20 -0800 (PST)
Received: from casantos.remote.csb ([177.18.150.243])
 by smtp.gmail.com with ESMTPSA id n19sm175765qta.78.2021.11.14.13.03.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 13:03:19 -0800 (PST)
From: unixmania@gmail.com
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 18:03:16 -0300
Message-Id: <20211114210316.1403514-1-unixmania@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/mksh: use plain HTTP in download and
 license links
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
Cc: Carlos Santos <unixmania@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Carlos Santos <unixmania@gmail.com>

The server does not support TLS v1.2, causing dowloads to fall back to
sources.buildroot.net. Mail sent to the project owner bounces, so it
looks like this issue will not be solved anytime soon. Switch to HTTP
and rely on the hashes to verify the integrity and authenticity of the
download.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/mksh/mksh.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mksh/mksh.mk b/package/mksh/mksh.mk
index 386b1bd016..c4818e8692 100644
--- a/package/mksh/mksh.mk
+++ b/package/mksh/mksh.mk
@@ -6,8 +6,8 @@
 
 MKSH_VERSION = 59c
 MKSH_SOURCE = mksh-R$(MKSH_VERSION).tgz
-MKSH_SITE = https://www.mirbsd.org/MirOS/dist/mir/mksh
-# For MirOS License see https://www.mirbsd.org/TaC-mksh.txt
+MKSH_SITE = http://www.mirbsd.org/MirOS/dist/mir/mksh
+# For MirOS License see http://www.mirbsd.org/TaC-mksh.txt
 MKSH_LICENSE = MirOS, ISC
 MKSH_LICENSE_FILES = mksh.1
 
-- 
2.27.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
