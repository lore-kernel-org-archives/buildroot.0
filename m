Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B28DD33992
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 17:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFA7D84AC2;
	Fri,  5 Dec 2025 17:08:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z6cUI4REvHpU; Fri,  5 Dec 2025 17:08:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBC07849E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764954486;
	bh=1dCaryxavP/JND2CRWUwER2ehLaaq/sl8I/id5DoQzc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ChSrxFscob6bTgzJHvR+/Mv4LDoWS7baBnPz6mzWrdPqDBVibhZgSibvo1a+VcOTw
	 vgys25EvekQrLGtd2LwujOGKQPDyeKWvsryAbydSXyu3w9lKHYwLC73XoJ545xgXGR
	 2gVsuA53QbAUT5qJ/EgBtLjs5p9mBtkXBOdAAM/MiiTrBMfE0t7d3LgCK5F0FdWZqZ
	 xtLUC4XvCbaNmnsqcXZ3iqd9vk8wKhhvATKj22cFdAENU+bgbSNxZ6oLIPyZDq3DgE
	 nWVZQc6jb4TWCSJfyVoQwaB62NfzuTX1OIhLOcb1McxfRqOWWOSbz5Lk8ei+lyF2ay
	 SgemjWXEGg7kQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBC07849E5;
	Fri,  5 Dec 2025 17:08:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BE35E7
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 17:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E19140AAA
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 17:08:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8QnTxxfn9K6T for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 17:08:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6427740AA8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6427740AA8
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6427740AA8
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 17:08:03 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4775895d69cso12268485e9.0
 for <buildroot@buildroot.org>; Fri, 05 Dec 2025 09:08:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764954481; x=1765559281;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SJUcAIF+5fBK0mANOVIISlVgh2kiPm11GXO/kQfCX2A=;
 b=YVt1b1HgCNcFuIPYUwbfvNibTn+I84tkH5hYjcRzS6R80jRoy+0WFlwD/YMsMSXN6y
 4SJvUng8WccX73UBFaDZGBL9g/tlEnWV6CMZ2H58rHFXaTSbRl+sX05t4rP8k4R5j8kt
 AQYsYDgmFo4qLMWEMwEUWdQlRJoFjzCJITRlPLHpw1ixD8Yp3ALbPra1Xs6ooB9LuIoL
 hZ6XxoSiKCzCPyC9wgAMuHo7dccXgGjgwAefqKmRMUnhz+Cj9SfC3w+7XLngVib5ScNU
 z5a2Vwor1i8Nl/I5sqikmRk+B/N2Fy4iUZWG1T1/IIDv4UmWFDbQ2l2mgHjlX8HflYJv
 r2pg==
X-Gm-Message-State: AOJu0YwNx/7SypWytvPP1FMwi3Jat46UE21X5svYlpUywbFWMdGVR6MT
 jwRVrKwnc5F72RJxWl/wHlDgQYbFkZkX6arJcjmFoaadiEV7WdOueJneCV/B/w==
X-Gm-Gg: ASbGncvwkLZfCGngrR83+qOzIrfw79ZTHSjv0Far8biVa5psxDCcBJX6UHOlSLVJldI
 DJKMvz0PvwZduI21+pTOWU2X4junmtlUvIEo3TWyCmpzX+M7YaXABrz6jH/N5x3etygFIniLZHf
 y0WDSHpPVXitcJdFbxwOuSp/SoEu3FGxsNgU2AYYVm+/eIGFeNi9LRiF7nvnNA8Rq0/ebp3eqkI
 BeJjccDA7womeTqp9u5NBcAxAHD8txMdMCVYbhyHWmU6/Wn0w2TOiiYnlExLDNHyGZfPdtJXg3M
 nGkxxXdsS89OYVKTG/F0ydINKFluJUYvaUDuTFTH0i3Uy1Z0YjDgE8RWlqUKZUf5N/XqBe1Q7bB
 vJzF8y+gnBFWUmgvYMjSscOp6l3hRU5E1dhIY78vZfB9uDkqvv6xTWcpkk8P32IBGgVJ7nbbqs4
 PA
X-Google-Smtp-Source: AGHT+IHUyDVT8HcRqgGYVK8A0LWezFWZ7hJ/nGqHxxZiO4/9vTbLzX6j+0XBdUng0cga0w+s25zffA==
X-Received: by 2002:a05:600c:1986:b0:477:79f8:da9d with SMTP id
 5b1f17b1804b1-4792f39517dmr78080395e9.24.1764954481156; 
 Fri, 05 Dec 2025 09:08:01 -0800 (PST)
Received: from LinkMed ([2a02:8070:2483:7e00::daa5])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7cbe9032sm9057042f8f.1.2025.12.05.09.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 09:08:00 -0800 (PST)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Fri,  5 Dec 2025 18:04:54 +0000
Message-ID: <20251205180454.555029-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764954481; x=1765559281; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SJUcAIF+5fBK0mANOVIISlVgh2kiPm11GXO/kQfCX2A=;
 b=UHj4wKGmxmkd/6xj18IzoRAs6Qf5qpuEoiV4E9GBbZTucyTGaRr2yzPrbHG8CuMpBV
 ymUAlUztV+nw9LO7axE8YJq/oz1Rmfruyi8PC1iElRPexR4xDFa1QL6bMtBTjNF1xa5x
 /wiviq7NgeBsPeK5ZFIhnKoVmqIaOkP6mo6Kk2nXwaB3EtsMQtF8Y2kRD8Hgk/i6NpiU
 gL4OwEPvY41XxqoEMaN/8mQ34ThG45cWstC8lWmO6EmSwP51dUIXSAMtBwJ2K50vZbcs
 oIpf94s3DbaJy/eB63tVkpVRnEMxyX2iuo1GTg5W42HxVg5YpsC/X/D1jDs3STRmC6rB
 DLqg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UHj4wKGm
Subject: [Buildroot] [PATCH v1 1/1] package/podman: security bump to version
 5.7.0
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

Changelog:
https://github.com/containers/podman/releases/tag/v5.7.0

This commit fixes the CVE-2025-52881 security vulnerability. See:
https://github.com/advisories/GHSA-cgrx-mc8f-2prm

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/podman/podman.hash | 2 +-
 package/podman/podman.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/podman/podman.hash b/package/podman/podman.hash
index e52a353aa7..ff6600ac8f 100644
--- a/package/podman/podman.hash
+++ b/package/podman/podman.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1a35d0030bb8dff31cf45d16d98cddfbf9ceeb2835c82d95b4eacd5a26e482af  podman-v5.6.2-git4-go2.tar.gz
+sha256  60de04a48c0ecf5006fb8e26543e2275126833aeaf2b5ea02ba492965d96173f  podman-v5.7.0-git4-go2.tar.gz
 sha256  62fb8a3a9621dc2388174caaabe9c2317b694bb9a1d46c98bcf5655b68f51be3  LICENSE
diff --git a/package/podman/podman.mk b/package/podman/podman.mk
index 71eb26b496..31cc9ba349 100644
--- a/package/podman/podman.mk
+++ b/package/podman/podman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PODMAN_VERSION = v5.6.2
+PODMAN_VERSION = v5.7.0
 PODMAN_SITE = https://github.com/containers/podman
 PODMAN_SITE_METHOD = git
 
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
