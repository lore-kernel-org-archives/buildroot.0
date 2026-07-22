Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6334C44539
	for <buildroot@archiver.kernel.org>; Wed, 22 Jul 2026 12:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C38880C9F;
	Wed, 22 Jul 2026 12:45:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TDwyVwkLulaf; Wed, 22 Jul 2026 12:45:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B81680CA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784724334;
	bh=/wdYwJS7kWiiJjml7YOMo6e2t8GCApqQqsLmA5aH2PM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L4Xjcqh4jJEafK2eeN9IBru55DQu7Bl3pWDV5cHLO5Ss5ySMRTFY5lNlIkr3YyFTd
	 Z30Eqh/xFW6KNOu7fbwdRmC7L+j7BKjDqhnj0bhXGwTqfqaB0ZsBpLhYA3u+tkyuEr
	 YJxFQshofL9MKwrw2b4OHmilfQoLGoE3pV/XQPJDuM5/ohiHxkqqq6JjIwR8cT0F0q
	 luZ9e50XJdTcMDwfmo6PVs8q+gXSNguG3XYsujL+0TEAN4/mOBauNIO4Rbs7euhamx
	 y1s48/FYJWz/CNyHxuluzp2prp3DXRjXkcz2oNlQGx/z0vsfo82mlMiTiT4KTGs8zJ
	 U00s+95y1PVyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B81680CA8;
	Wed, 22 Jul 2026 12:45:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D868E1093
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 12:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C21F760737
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 12:45:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uZzPq8vIUFQb for <buildroot@buildroot.org>;
 Wed, 22 Jul 2026 12:45:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A61296071B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A61296071B
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A61296071B
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 12:45:31 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4954a2e73a9so34349635e9.3
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 05:45:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784724329; x=1785329129;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xFCDZxeC7IppKFn8mfzESCCUCDzwQIYgOlYQjP9oilo=;
 b=gXMDQu/NlsN5GY9Pqo6Y/+7nJ94yawKjIhItv9rCPkdgPK4Z37c9gSuMhtD8gk6Exb
 XnGZzc8rWf67VFWwlPSIX2kNksRR38WunPfTLbp5J97B6wEXID6N6sxHWejgP/xZ4CT7
 5gfxeNJEB32MSoJzysyhKNDp+A1SiQB0kLOLNpDRf7IjTVV/29XFse62uLzaipas1DHA
 MZ16xGvfq+q4lYozFUZ8b0FjROv2fopTP3/l0QtJ08KR+xtJ3FlbMfclYLACCWh9yJuE
 KCuQK0zDbuo6Q9woMpNooeo1STkSR/xsJutLX8BgHBttdskApCxg2H7OGOEsE/HQzSlw
 rUAA==
X-Gm-Message-State: AOJu0Yyf5tsVRa9COH1xpe0L6eAzSCazLMXKdU6tKYGpY2KDoWKt3D3U
 9P+eqVCOTTB9s3/SAOIuDQn/eq1UfH0aSOzUZRFlbsK2uDmAk5uazjnGuziUAQ==
X-Gm-Gg: AR+sD11UgLqWADGcZnt3+Rc/U2rRE6GS9p1WFHdsLz594N5mab8brQvEzKLVAYkuZhK
 J1213pEC+++pIouh9c5dZhHIDa/1haHwIxNTbGgKhk6LAgtloFV0MrIAxwSta6DWuc8oqzOM2UC
 rSp4hZmr+tnPuPyWYhIfTYqvmHvQRbbHPmnZcFoP8OcQDv2krr3Ets/Cv5FnA9osdDVbcZZcPMC
 s38bE3OmWCe9SmGOVJUhOa6S7cLeaCMNV2tW1/xetqfgRkhqs1++Sw2PoKR4dCiVfsuR+e/10nG
 yG4qymAB0x5ARCHOy6vgxKiJWLrMiO4iq2mtIudLnFzhQ0Nn6laHwUPwFO1hud0obyHCqG+78W3
 71hIzPLMriJlFZ0Q7PAeKdBkQ5fcBGld3Ox1gLV24Ee73fijNujZFxTW6hWSo5DXJcvATdGJ9Fq
 WbFjqESte/nB9SvhbES9E4gB33PTY2Z7p1BL3/euLx4MID9aE=
X-Received: by 2002:a05:600c:3b1b:b0:493:ece1:86b9 with SMTP id
 5b1f17b1804b1-4954a3d649fmr272087505e9.8.1784724329391; 
 Wed, 22 Jul 2026 05:45:29 -0700 (PDT)
Received: from freepad.sicorp.iliad.fr (free-mobile.vlq16.iliad.fr.
 [213.36.7.11]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956a508aa6sm72303185e9.7.2026.07.22.05.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2026 05:45:28 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
	Maxime Leroy <maxime@leroys.fr>
Date: Wed, 22 Jul 2026 14:45:24 +0200
Message-ID: <20260722124524.1678904-1-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784724329; x=1785329129; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=xFCDZxeC7IppKFn8mfzESCCUCDzwQIYgOlYQjP9oilo=;
 b=YcRKrmwbk/IwCJSQRTMutq8k7RBu7WEkSPZNIxlmAv820vGK9CwxcjHFrLoa96K27j
 dfrV7vel48bR4eXMt0pat38SFQ+gw97UlZSm9wiR63RWIhY2YM2NcVahthQBDx99GyWX
 JcIXgxRl7Z/sQdNwdkUjBjj83Ta9t/k2YtWEngPZm7BH+TvuXUZkskGcPknodN2fzPko
 mnrG16Dno1JWZQT+sFGRY4DTFDhmgFLH3RbBo3RRmA6FRTEXatYbHkLRaXISGeXWndjR
 Zfnc0ane5wdbsVaG9AEpLMdjm9u+pG13teTW4nR3SduPVl2hcsSolqr7RtSaVrGixuLN
 61Ow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=YcRKrmwb
Subject: [Buildroot] [PATCH] package/grout: bump version to 0.16.2
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

See the release notes of the new versions:
https://github.com/DPDK/grout/releases/tag/v0.16.0
https://github.com/DPDK/grout/releases/tag/v0.16.1
https://github.com/DPDK/grout/releases/tag/v0.16.2

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
Tested in GitLab CI (all jobs passed):
https://gitlab.com/maxime-leroy/buildroot/-/pipelines/2696302810

 package/grout/grout.hash | 2 +-
 package/grout/grout.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/grout/grout.hash b/package/grout/grout.hash
index ead390f8fc..b195157024 100644
--- a/package/grout/grout.hash
+++ b/package/grout/grout.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  c4a289d13453a42961db2131a179e95965450feb27505f4c463adbd8970e0440  grout-0.15.0.tar.gz
+sha256  cdec124614f50cbeb8f9b8ab51ac7a3f6f9153cdc3a95ec8a870fcb2fd533a64  grout-0.16.2.tar.gz
 sha256  1e412aae8da58b718c78b3d7a52eb547004384d4347e4746a22ca6af7522930c  licenses/BSD-3-clause.txt
diff --git a/package/grout/grout.mk b/package/grout/grout.mk
index 0b66995dfe..41b623f1d7 100644
--- a/package/grout/grout.mk
+++ b/package/grout/grout.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GROUT_VERSION = 0.15.0
+GROUT_VERSION = 0.16.2
 GROUT_SITE = $(call github,DPDK,grout,v$(GROUT_VERSION))
 GROUT_LICENSE = BSD-3-Clause
 GROUT_LICENSE_FILES = licenses/BSD-3-clause.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
