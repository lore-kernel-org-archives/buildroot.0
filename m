Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC67EF43682
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 09:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E117405C4;
	Fri, 17 Apr 2026 09:00:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pDTVBV3PS-hO; Fri, 17 Apr 2026 09:00:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B218540645
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776416406;
	bh=59QazkAHqECAWOH3F/VYaRXkAxQSYCI6keVc832Vzd4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MMpAkEHbiJteNfhC1+ivFDa3D4TZqHmK0c/isCkTyK488Z6sfqcYseGBk8KsHjhh5
	 aU/+ULSMo+KLINjZHyynkLzO2GPAzVYpDYPUKsOJ7DCfkehMb47kc5f+tio94buK/9
	 VzhWFPAWmw7Fg6/Qd2k4/W/tvGgHBZcfukKnIGFPDt1PFVwyoyK0PU5u3k/yghr8zI
	 IUdY8Soh+FBVSJwjxGMaGVF6XRKiB/cyEiBd7/lBG6bO6oFc5bqZUAOkj0dtQbWDIc
	 aX14g9r983LPEWUcbx9Aekm6no9HVYrIjtqJm38g3EvaAXQGVEVfvfu2heUMo1uuKf
	 ze3iQd2GYsAPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B218540645;
	Fri, 17 Apr 2026 09:00:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 37BA5259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 254C74048B
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id puIXKMqBidLz for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 08:59:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0EF77400DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EF77400DD
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0EF77400DD
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:54 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-488b150559bso3662325e9.1
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 01:59:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776416393; x=1777021193;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cgAQbQkk3gPh5QmGvMb6tn/G99Ec00KLKE+mkitXu0s=;
 b=MtUh87mD1EGzUH4o6VYNoQZzGQlGDaudwjWAoccqt86RdDx+ILjJ8B4PPyhxfskiwM
 OeBJ4vt5QRvd5MqrBAwxKLUW4uMggQagiJvs8EnWqZGCJ7PanvLrrvvU2XBwz/fR5OJx
 lBc13wKUt6i5IGtWzfoGAteROV6d0Ua/7x1LTH2WtRe7+GrIjxw3tzaj76AmhBUqWN1i
 pWPpl33JTxLBpu+uDWOlUccvd3i5A51JUKMAeE+ezcJTq71FWlfK3Q3z7s0y6mbWcizJ
 26YkC3HXUPKZaH7V6AQPCOa3fdaywlXEJbQi9C24cJ4wojJLjxybD5C/eueDHU0vQM0u
 yQdw==
X-Gm-Message-State: AOJu0Yy2UnaX14eA4oDHT8kTS208B0gMp/WMRZcDC4vk+wYiF9GTORnY
 6xHitRO9St2KADwxlEGWjn1F1RNqOLb3afVT1QiAJ09sDiCKYg1WKzK5TshtM3F6vdNJy21P6BB
 T0Tv09mY=
X-Gm-Gg: AeBDiet5iyXBrNYkXsEi0PnISQeOZoIo87NDQbEc4iiCigFASjFhFt933+o5YT/69dL
 BSUmygDaL12oHVAMDMxJ4qW0+WTYGRW4o/QufDaY8coJoJdXkcYl9jgU9mmHP1eQgl+zxOGVf7J
 Pc6rfYkltxNR4A96kd8jZl6thkfH1l3E+yNqFNr7XrY/X8kyMD203g+yqBIUDKR+JvOtqI6dppS
 lZCReM28YtL5mOL5J/AwIdGBqpJcCBlN/RtFNVA7+J+srT2NVRGwWGZB7HsH7Jp0uEDHdjt4hY6
 Wowddmue8b/SRp6967Bt2QAzdP75b2PxR5XcSU5rp9yLSjNBnSZ9BC4GGL8purqy8PkJ5S0jMA5
 q9ymCfVHDwaIbnK5cstTIpU1qxuKjJsERa4XV+Io5oE8iLFReN8Gz9eEixjJk7vDpE1o0A6NbBC
 Ot7FxMHczpcYMGZ4Ese73we5KjY2tjgzTdSogNz/pYasN1tqGwvBUYjL4QU79KKdCnbBw/Z9DcX
 Zc2ySwp9D2sLyVwlRAgtlp4SixNI0s=
X-Received: by 2002:a05:600c:6089:b0:488:e192:6fb5 with SMTP id
 5b1f17b1804b1-488fb7887camr25982635e9.24.1776416392658; 
 Fri, 17 Apr 2026 01:59:52 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb7a0745sm15077795e9.9.2026.04.17.01.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 01:59:52 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Fri, 17 Apr 2026 10:59:31 +0200
Message-ID: <20260417085936.200528-17-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417085936.200528-1-dowan.gullient@smile.fr>
References: <20260417085936.200528-1-dowan.gullient@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1776416393; x=1777021193; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cgAQbQkk3gPh5QmGvMb6tn/G99Ec00KLKE+mkitXu0s=;
 b=AC2X5oeLZ8gvcRGwT0/baIGKr1kMmoWlWGbsopGH8G20rBLeCsc67IlIFUwNHO5nk1
 iZIzUjzAkkf1OzKUSftJ+SYxt95A6Pa7zzAjYqrZmYl9ub9SiBCliBdDp9wz/nf0XMlI
 EGK/RpECuEJtKsq1wD3bxTu4E0JzVVPg6c4ac=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=AC2X5oeL
Subject: [Buildroot] [PATCH v1 16/21] support/testing : test_systemd : Bump
 kernel version to last LTS (6.18)
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
From: Dowan Gullient via buildroot <buildroot@buildroot.org>
Reply-To: Dowan Gullient <dowan.gullient@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update the Device Tree name for the vexpress platform to match the
    new directory structure introduced in Linux 6.5.

    Since kernel 6.5, the 'arch/arm/boot/dts/' directory was restructured
    to avoid having thousands of files in a single folder. Device Trees
    for ARM (32-bit) are now organized into subdirectories. For the
    Versatile Express platform, the DTS file moved to the 'arm/'
    subdirectory.

    The build was failing with:
    make[3]: *** No rule to make target 'arch/arm/boot/dts/vexpress-v2p-ca9.dtb'. Stop.

    Adjust BR2_LINUX_KERNEL_INTREE_DTS_NAME from "vexpress-v2p-ca9" to
    "arm/vexpress-v2p-ca9".

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
---
 support/testing/tests/init/test_systemd.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index 41545cbeed..893cc17408 100644
--- a/support/testing/tests/init/test_systemd.py
+++ b/support/testing/tests/init/test_systemd.py
@@ -306,11 +306,11 @@ class InitSystemSystemdBaseOverlayfs():
         BR2_ROOTFS_OVERLAY="{}"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.202"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
         BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
         BR2_LINUX_KERNEL_DTS_SUPPORT=y
-        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+        BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/vexpress-v2p-ca9"
         """.format(infra.filepath("tests/init/systemd-factory"),
                    infra.filepath("conf/overlayfs-kernel-fragment.config"))
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
