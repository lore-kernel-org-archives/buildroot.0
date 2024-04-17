Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82B3C001CC
	for <buildroot@archiver.kernel.org>; Wed, 17 Apr 2024 08:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7464407F7;
	Wed, 17 Apr 2024 08:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S5P9YfI5NNZ5; Wed, 17 Apr 2024 08:06:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4E5F4077F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4E5F4077F;
	Wed, 17 Apr 2024 08:06:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 555FD1BF341
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 08:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D1CC81412
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 08:06:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4NitmTqheuKM for <buildroot@lists.busybox.net>;
 Wed, 17 Apr 2024 08:06:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E6AB881395
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6AB881395
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6AB881395
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 08:06:24 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2d872102372so4151481fa.0
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 01:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713341183; x=1713945983;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kbqgBPrgpNxbPJtQmNNavE0KAaePj54vB7RjOPbmZHU=;
 b=AWcIJdsl8un7YFtmxvu5LQ0K4c++oVW4urRNbtIndFG/FqT/nwo0HEP2rO8CFIcXPH
 TZLeNpeoK2sb3y8GBrudWgrbjZkJLaem42N9+y2X7XpaQg+K2CouHo/EaXb/oXsXykMs
 /Wy3xyWuXtKgEOq5eqKviwf56DU6yvKcqdYdy97UoV8ZlLpk+HTZTxtwsR/s5G41u63p
 FPR+g5dqlqB2MG9/FM2kXW/T9zFtaLYlh4Wq5fG0aYvF8iU4H9lzP+IsNXzP2Qvs80U4
 UAfnT9h/7CJLsDUK30xN6HMi/6EChscAp9fqARa02h8zf33yfWaV8NRO7Es4eux1vbFu
 Rm/g==
X-Gm-Message-State: AOJu0YyxRtyBelteS4TS3fSQYhUeX7eJCXTxZHBBV4NQQFe3DAHp7Mv0
 IK4OZxMlTGcqQ29umxyYuxLc68YJKTN+/d0ggb6ZXiYw7DLGQcirxjsyta6p
X-Google-Smtp-Source: AGHT+IGeZfjMLYgJUZY9UJkMxwCEvwJTQFnlrV2JXHcSU5GXBtebMEzCtkJmj/z2dOo/79QDVJo0tQ==
X-Received: by 2002:a2e:b016:0:b0:2da:9d88:5f2b with SMTP id
 y22-20020a2eb016000000b002da9d885f2bmr1545492ljk.18.1713341182533; 
 Wed, 17 Apr 2024 01:06:22 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.12])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a2e8912000000b002d2191e20e1sm1830254lji.92.2024.04.17.01.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 01:06:22 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Wed, 17 Apr 2024 10:05:25 +0200
Message-ID: <20240417080538.3451923-4-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240417080538.3451923-1-roy.kollen.svendsen@akersolutions.com>
References: <20240417080538.3451923-1-roy.kollen.svendsen@akersolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713341183; x=1713945983; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kbqgBPrgpNxbPJtQmNNavE0KAaePj54vB7RjOPbmZHU=;
 b=GV+J7ysbgzeeUMlPGKdNReWQX3lhYx4OAfXBAmy0OXQFs7KHUKAy4Bi/LKXRWJSUyC
 timbYx1BISb7kVSUdzt0nAUH5Ka+Kd5P2VvlHGbQPFSNzbSxe48ez3qcRsCGN8Zk+0gQ
 o/Qe4hIN1a/l1ZwDapgiSflvm7zRr0OdetYMpYE93yqu88OOujC3drD0P82rxz2ZInTp
 oqfASN63zxr/flXOcO7seuXBNFoHGtCFjWGzo29WeWe+0tzFyTKp2ZPJEEBlkpu6ROnE
 0bLRSahuWOq8fCP8fIoHoypT1NzThnbEOeZq0/LS4iA6Fyv1MjstPy+QvpyINEqPtflV
 lI6g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GV+J7ysb
Subject: [Buildroot] [PATCH v2 04/11] package/qt6/qt6svg: allow building for
 host
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
---
 package/qt6/qt6svg/qt6svg.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt6/qt6svg/qt6svg.mk b/package/qt6/qt6svg/qt6svg.mk
index 25e87dd208..a9d7eaef51 100644
--- a/package/qt6/qt6svg/qt6svg.mk
+++ b/package/qt6/qt6svg/qt6svg.mk
@@ -37,3 +37,4 @@ QT6SVG_DEPENDENCIES = \
 	qt6base
 
 $(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
