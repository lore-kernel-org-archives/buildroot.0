Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A40CFD3B7E5
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 09:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 677774076A;
	Mon, 29 Dec 2025 09:07:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3C2vSPFQIFKV; Mon, 29 Dec 2025 09:07:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A85D4076D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766999250;
	bh=yFan+DmObZbvblCK8tZhnf9MqDyaKhc91K0HWXVYrOc=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=JDttrqMXWBz7c4DvwgIw0fCHv87pcFIGU6EtrPXyFgtbtJLY4U586MDylfBrLl9Uj
	 poUXvpTvfOqhIkNsTxBZOS4gUef4NJEgkTDPmLuFkbw96wdPRTM2zue6eTtzX8j0Nw
	 2gWnS6O8ecYe3TX4q2/26zeDO8UuhzInmea4KcCcMu+kSJlVsbWodYB5HD/IeIC7nb
	 Ok5cXF3vYzB7ShVuwMNLQDuLseRnN6ps2o1MEAmXKl2we5L4+wEM/3bIWbq+hEmfBj
	 a/knIITYi6ZezynpeqwrvHa027nHzcCCZ97U1oQRSpO3ToveuRFdSSrposJnDIvMHN
	 Dzet2VxIURTNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A85D4076D;
	Mon, 29 Dec 2025 09:07:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B1C9B9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 113E560AD0
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fq8IOSREZJXl for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 09:07:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1DB8D60AC9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DB8D60AC9
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1DB8D60AC9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:26 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-477a219dbcaso71744445e9.3
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 01:07:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766999245; x=1767604045;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mXnxWRaY10XjV+s0NbgPO6Cq8Adqe2CZR4hvHZfFX4c=;
 b=soKwO1IMSfX26ex2Om5I3pNxCd2y6l/K+dIJ++d67ncBIgl6qy3+SGzZdD6nyFg/Hx
 eARAL6ZLp+AntrIoYacsBfnXKeSjhLYxlkFXze9TX1BHwi7N9IYD8XKW6S8XARXFc5/X
 /65dbv2e3qHYWvd+SgCGv8lQC2UZnMOcotZ2NncCXZkxY9Z7/CC1Ze5jzY9d0VP2biy4
 xWig9A7UxRA/a5hFyMqjksxmI4RWyrDpCiH6YOKL/08DzLi62MvluEdDYxCMwCC9J56W
 vaYV5wG75DwW69GimLG/VuhdwOQwopURmY6aTCdrSSS5ZiYOS0P+h6iFwiwrFXLWjHlv
 VpVQ==
X-Gm-Message-State: AOJu0YwoBa4ucQQvllB0ANzf7jc5EjI+AN9i1tC/gL3qF0AZFy5UFaev
 NyEFoy40MKpncsw3fni/WXeLqwMtFlgpfNSxsr8cfHpIILDqYrx3DuFkLEeaC2Zo4pZx/tgBZ8x
 4sqJMtc4=
X-Gm-Gg: AY/fxX6ztlBz4Qs5exRcMEkOI1jzSGfmd2miV13IcPzV0BLyUGM7RFpg2Z71cx497q2
 UnK3IQ2peuhvig9etiFRO1aC1dgAG+Bh/szzkLiyhGunTh0fEN0O+XrVOTl+WZyucOUxwLYXe2/
 Q47WvpjWrz7/gf/I8sBjONa9yqpGjGIrs0/Vc1Dh6riZgQ99Fczsr72JDl7oWSyMTL21hpzKQ1x
 j3OdAqR7wOo9BNEm93fS88S5/vbHC92jfBaW6Q1VNGS9jjWHsjSQDpr4QWZIguOOjEGfETP0mU3
 s/GAhPiQ3OhGnpOOxqDrYW4MQzZt96qtQ18XELgha99Y/Hc7eztGOpbStvrY5kYJO37Zp6KGfoV
 KXSrRYp6m53sL8KkzZoMCaIuhsvC4V0bqGGv8VKi2FQDMGJyXvrB2cb53PeLSCY7D9efcIOIuvG
 +DalNeYqe9M6LZVi/XBFU2HCZcjNnAKgCjyNXQlZQXO0oWV0MLCcb+E7UFK2pIrJfx96oQMKB2M
 TZ4fu4HjGWI
X-Google-Smtp-Source: AGHT+IEmCpvKAnBBK3Pn4iAiunCLQXbCj/YeA6NF3YeBcpUnSd9monNdCRVTIskrXce3gsU7O+k7Gw==
X-Received: by 2002:a05:600c:8208:b0:47b:d949:9ba9 with SMTP id
 5b1f17b1804b1-47d19566f0dmr342228595e9.13.1766999244104; 
 Mon, 29 Dec 2025 01:07:24 -0800 (PST)
Received: from mindpad (2a01cb0c0115730072a6ccfffe7dafc3.ipv6.abo.wanadoo.fr.
 [2a01:cb0c:115:7300:72a6:ccff:fe7d:afc3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193d4f09sm538910175e9.12.2025.12.29.01.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 01:07:23 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 10:07:07 +0100
Message-ID: <20251229090719.13291-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229090719.13291-1-thomas.perale@mind.be>
References: <20251229090719.13291-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1766999245; x=1767604045; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mXnxWRaY10XjV+s0NbgPO6Cq8Adqe2CZR4hvHZfFX4c=;
 b=hlNDcpQR6r1hy9Wc42C0VpXG/jvlt+3Ymn3BgZc8L/O614MINlrv6rSDjIV5mOl/aq
 VqXERI/u412EdYPl5pUpl+n99MJ9QkGwgTGj11D+sl259x5aqJPbHM2oce29urT0wOaU
 OF5WVe7tphpSK9U7xmB8md8Y2ll2oPattJYYCMHsfZzmq/S8vXB8tWNx/i4SJcRmAnhr
 3K9PCOCA6rAMB1mx/dOg84MxuDw1kel0ipI+PJIU+clAO7gr7kEYT0PxTANwBBb/K10n
 /rNnS8W04phucFNes6lOubIyk8HDMJoIuVa+TZICtpsZIxp/oCN/vQAW8wIot0pIFDlv
 GJpA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hlNDcpQR
Subject: [Buildroot] [PATCH 02/14] package/x11vnc: add CVE trailer in patch
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Bernd Kuhls <bernd@kuhls.net>, Gilles Talis <gilles.talis@gmail.com>,
 Martin Kepplinger <martink@posteo.de>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Joachim Wiberg <troglobit@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...02-scan-limit-access-to-shared-memory-segments-to-curre.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-curre.patch b/package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-curre.patch
index 05977375d8..015a8c4c41 100644
--- a/package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-curre.patch
+++ b/package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-curre.patch
@@ -3,6 +3,7 @@ From: =?UTF-8?q?Gu=C3=A9nal=20DAVALAN?= <guenal.davalan@uca.fr>
 Date: Wed, 18 Nov 2020 08:40:45 +0100
 Subject: [PATCH] scan: limit access to shared memory segments to current user
 
+CVE: CVE-2020-29074
 Upstream: https://github.com/LibVNC/x11vnc/commit/69eeb9f7baa14ca03b16c9de821f9876def7a36a
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
