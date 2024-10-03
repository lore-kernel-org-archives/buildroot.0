Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309B9CF34B0
	for <buildroot@archiver.kernel.org>; Thu,  3 Oct 2024 15:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D432060658;
	Thu,  3 Oct 2024 15:25:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DGTEoG7xWIka; Thu,  3 Oct 2024 15:25:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE3B160690
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE3B160690;
	Thu,  3 Oct 2024 15:25:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 510201BF5A4
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 15:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40B3383A63
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 15:25:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9rt52EA_kiF3 for <buildroot@lists.busybox.net>;
 Thu,  3 Oct 2024 15:25:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=nunes.erico@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 67A1782032
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67A1782032
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67A1782032
 for <buildroot@buildroot.org>; Thu,  3 Oct 2024 15:25:31 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-42ca5447142so1431895e9.2
 for <buildroot@buildroot.org>; Thu, 03 Oct 2024 08:25:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727969129; x=1728573929;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Pk/EFF06PDVFQuTnADP3ao+gcmN39tB5XJRUEhUGEkw=;
 b=qBq8TeM33r5WgF+7bPz16kG11eeodbap4wYfCyjQOumN3W855Z6e2pXXcre8cdJYCO
 DMCr72I5qag+PRpsyhsb1HlWC5l/0jDb/ETTsndO/Tx6g2HEj5bVvpseC8B8zvjk6r+h
 Oz327YPMDkxPBMzOSFVORvTZLOC2Xvk/G2uf/bEzEgrVs7KUVb4G47aW2MwybIm6Y89I
 kHJapsD6pVH+JoIbGdkyWcZRRi7nakbNlAQhpOMST24ejjhBOjv2jdvcbAevVPYkjF5g
 hfOmUcno/vcbVPm/C7PYl8XwXgAVt3TowM9xqULK8sJU/pJ5L1T1+JV7uQshznPTjH1q
 8jfQ==
X-Gm-Message-State: AOJu0YywXV9hVZupr7m+tXTvCU5kG065l2DbwpjNIgAdymA4gUpHIEHp
 UgQxoteWs84brfoDzoQiGxEaQ+iHmBM+HaDLALJHnc9Jf88CLmOZ1IBbdw==
X-Google-Smtp-Source: AGHT+IE6nZ7Rtr0475wayuI31QfF4fs1PDji1qLU7Ax8b2i+81GGfHag0HeqX8N+iHFGD0JVjTS9tA==
X-Received: by 2002:a05:600c:1884:b0:42c:aeee:80b with SMTP id
 5b1f17b1804b1-42f7795199fmr27267755e9.8.1727969129191; 
 Thu, 03 Oct 2024 08:25:29 -0700 (PDT)
Received: from mosaic.enunes.eu.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f79ed3e3fsm47227295e9.23.2024.10.03.08.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 08:25:28 -0700 (PDT)
From: Erico Nunes <nunes.erico@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Oct 2024 17:25:23 +0200
Message-ID: <20241003152523.1131434-1-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727969129; x=1728573929; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Pk/EFF06PDVFQuTnADP3ao+gcmN39tB5XJRUEhUGEkw=;
 b=hsi2VC/XvhjB2nFDtgvIqmHgTwiNZfYwettjgIU0FTI9405Ef7VO33vRJxXPBzi8XB
 2e2kPyArpb9jdI0W6XOLag1Vfp3KcMyIWEFMJS6BTMS6vmbMns5q6g7PmnsKa72Ds+Z5
 QbLu7VCRB7dd//N29qFtNmI7D2jU/yKTo2hy0vBzrMd9HqNll68gsroo4lrkuUqL+c2i
 jjBN2syt+3g9Gxutgmz2zcyRIam/wA0vlPF9JK3vtk6YidC5FyxocYIlqV+nw3y4pgo/
 NTKCBg6ypf+1DXYX1WIJ7uLSZ0LzY3o7eUkSegqHp8um6c5fL2mN4YQvWvoD9g60/l8T
 ktXw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hsi2VC/X
Subject: [Buildroot] [PATCH] DEVELOPERS: drop my packages
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I still follow Buildroot development and use it for some personal
projects, but no longer have the time to be an active contributor.
Some of these are important defconfigs and packages to have up-to-date
in Buildroot, and mostly other developers have been doing that work, so
I am dropping them so that someone from the active contributors can be
the maintainer contact for them.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 DEVELOPERS | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 44b1947487..174bc5e664 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -930,18 +930,6 @@ N:	Eric Limpens <limpens@gmail.com>
 F:	package/pifmrds/
 F:	package/ympd/
 
-N:	Erico Nunes <nunes.erico@gmail.com>
-F:	board/aarch64-efi/
-F:	configs/aarch64_efi_defconfig
-F:	package/acpica/
-F:	package/acpitool/
-F:	package/efibootmgr/
-F:	package/efivar/
-F:	package/fwts/
-F:	package/spi-tools/
-F:	package/xdotool/
-F:	configs/pc_x86_64_*
-
 N:	Erik Larsson <karl.erik.larsson@gmail.com>
 F:	package/imx-mkimage/
 
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
