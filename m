Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC5EC636D7
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 22:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E63A81FC5;
	Tue, 21 Feb 2023 22:47:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E63A81FC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KiYHHsXUcfRP; Tue, 21 Feb 2023 22:47:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 419D381FBF;
	Tue, 21 Feb 2023 22:47:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 419D381FBF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F10A1BF2FA
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 22:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D913960B94
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 22:47:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D913960B94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iv5pbTC6tOr3 for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 22:47:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED18460899
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED18460899
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 22:47:52 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id o14so4699703wms.1
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 14:47:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2eYjWt7Gk/lk1atoQ+3+Lbu3m3dEeMoq///SQmgx3Jo=;
 b=KmLHcNyKqkFTEtUMbjQTWVbRQBlfIQEs0NicpJDN2vsV7FGbbA43NF+9LU+otXooGe
 L3ZwssUEBxjwhnyWyLcWv1xIXeD2tURI5boo6fBfu10NY4r8wzTRyGqGlJyXz1uQmdPJ
 ApLpzTqtpoMQyK/CDp2I9lo7dB7M5NmTPNmU5CdseYyKcIHzQThjtzxbSNH4Y2tgtNNZ
 INHIW3ZGZjEDdr4kCtdgMNofN8NTecopd+0gcfkayGrRUvkor7jZsrvY6pufQGlDrxnp
 cL3g8xXiApTG22QL1TZ0eAN3ja4uWPCnZycG1DMKt8ftm5Jv9FACuAxLP5YoN1Q4QLLV
 E+lQ==
X-Gm-Message-State: AO0yUKVdxAIpFr1Cwj3022K8cAHF2B6uizNbH+5f4pg1d5fWcoDoCf57
 MnwptFAR7B/5VAHegVjKTYgWjChQZ08=
X-Google-Smtp-Source: AK7set+hfdHuVPZ3OYW7Fqx/6LuaGFW3E0OT7zH8zSagtOChF35vZs8f/UYXjn9ZAzZX6pkM8aPaIA==
X-Received: by 2002:a05:600c:929:b0:3e2:5c3:bcfc with SMTP id
 m41-20020a05600c092900b003e205c3bcfcmr4184096wmp.18.1677019670687; 
 Tue, 21 Feb 2023 14:47:50 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 n3-20020a1c7203000000b003dc522dd25esm6164341wmc.30.2023.02.21.14.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 14:47:50 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 23:47:47 +0100
Message-Id: <20230221224747.117361-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2eYjWt7Gk/lk1atoQ+3+Lbu3m3dEeMoq///SQmgx3Jo=;
 b=T9qZ3Q4u/DesiUW/+yVeWnNZzWx7A3JXqrJjnsSWQNIhkB0N12t5Z7lhwBasugbUm+
 sUUEsJc5LddcpGzw7NLhl255lqFbS6wl0sdHBLtrOPOr3EOQ6TKL+RaLlcuzoaFp3pQL
 EKqvMxMEhnMGKA3eRYn/psV/Pt4qWXw+b1g/Nczg6N4Jl9hwj+kiG2GX03aVm79SlAfd
 SawqIdj8xWsanccJzo9picRTEsHl39eDweF28qx2lmwPnGKiwBqxmHo+sX9tx94MSYLy
 nKvCsvP6Wz5w3cle/DICxIez384m3VJqbjZjiA+yot0mDbSSzLZXwAnRxZSw1mQ1+DwA
 dehw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=T9qZ3Q4u
Subject: [Buildroot] [PATCH 1/1] package/gcc/gcc-initial: fix typo
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix typo: am internal step -> an internal step

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gcc/gcc-initial/gcc-initial.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index ebd8e8f017..a8ac20c5d8 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -9,7 +9,7 @@ GCC_INITIAL_SITE = $(GCC_SITE)
 GCC_INITIAL_SOURCE = $(GCC_SOURCE)
 
 # We do not have a 'gcc' package per-se; we only have two incarnations,
-# gcc-initial and gcc-final. gcc-initial is just am internal step that
+# gcc-initial and gcc-final. gcc-initial is just an internal step that
 # users should not care about, while gcc-final is the one they shall see.
 HOST_GCC_INITIAL_DL_SUBDIR = gcc
 
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
