Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D2EC3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 20:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 857BA6066E;
	Tue, 23 Jul 2024 20:55:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0XlX2qmK7lUL; Tue, 23 Jul 2024 20:55:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9303E606BD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9303E606BD;
	Tue, 23 Jul 2024 20:55:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 75CB41BF27E
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 20:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 704C5606BD
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 20:55:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ri_dkjpfINi for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 20:55:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7522C6066E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7522C6066E
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7522C6066E
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 20:55:51 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-42797289c8bso45096435e9.0
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 13:55:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721768149; x=1722372949;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n891e6AE3QwFzVBSQI3sKyKmqZBnm7cDJMbv7IqxDSU=;
 b=sGaZyFhM0TWjGSESN7M4qA/6kf22/0FbgHLDFHATjxpXuPH0bA63/laVJkTWgs+Pi2
 MLZlMdCNp7cvJVMs+GWF3KA1/sdB/XqPSuLYx9pwvoYtXETOVJtAgE2tQmKvVCblxcwy
 jPhGbGfunBpye0zVh0iKc8/ki77saumafK21P/2Xe5wsTkocRBU8A4ya89wWmkAnsOfn
 phd3jEkqs+wV+BjXGVChZNUgbF7S8KhmBa4q40pcHmmAaP+Q0ufJybAOE2WRph9oajis
 yFC5/RX0fpInNrTRe+qjJvEZY4WY7WYCuizS2HmTNdISSmjs2nTn54ODdWh18zwE/3RM
 7wug==
X-Gm-Message-State: AOJu0YxR3SBoNqlkzc4RsbDaT0sMBGbGlVxbaacFPBlouOE+loyCtWez
 Z4g+47jW8fbalo/g+aU7JgfsxDRKdv14EeaMpahHURmj8jNJx2U2mYxgzg==
X-Google-Smtp-Source: AGHT+IFVXGdyQR+GadaLxSHOkCeI86Fn4QsjcMQ1mrhEJu0Cs2XRdOjejaYsjROTiForpTNRFwSKwQ==
X-Received: by 2002:a5d:61c9:0:b0:367:9522:5e6b with SMTP id
 ffacd0b85a97d-369f5af3870mr49844f8f.45.1721768148609; 
 Tue, 23 Jul 2024 13:55:48 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36878694ba0sm12463362f8f.61.2024.07.23.13.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 13:55:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 22:55:43 +0200
Message-ID: <20240723205543.674164-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721768149; x=1722372949; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n891e6AE3QwFzVBSQI3sKyKmqZBnm7cDJMbv7IqxDSU=;
 b=Q3/rU1UhQjq9yqP8YlVV49Yy1zFcgPObnhIZfHvcELHR4aXxqZmsirWTy3dj8KaRKM
 l1LP8f9ACi4Fg4mEtydRebUCo2DbIkoHXx3xaEFo9Qwc+1eiybAbAV1NLWGsLbt5MiNX
 kMEGwttbFOaRK9l+RHPzbtPiPG8Fs32TV9Cy6V+U5S5HCckavIwHUkfbeiqBe8bit1CR
 NVkEXJPGDd85fHl2Fog0EG4YLQUod4dPkuu6vQB9Vt9aYoZhbVlNI1o7tWD8kNe7wgzw
 XRUYbjo9dVIBFkm/5iZgrDTT3OoySott64Kl51Rm/msxvmq+PlDri/aIBPc3gEVXkNXD
 Vzrg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Q3/rU1Uh
Subject: [Buildroot] [PATCH 1/1] package/xz: fix largefile option
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix typo in --enable-largefile added by commit
25254458bde6befcbf93b746d994f94665741c42

Fixes: 25254458bde6befcbf93b746d994f94665741c42

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xz/xz.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index e295144ed1..8dfd76f8b9 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -38,7 +38,7 @@ XZ_CONF_OPTS = \
 	--enable-sandbox=auto \
 	--enable-symbol-versions \
 	--enable-rpath \
-	--enable-largfile \
+	--enable-largefile \
 	--enable-unaligned-access=auto \
 	--disable-unsafe-type-punning \
 	--disable-werror \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
