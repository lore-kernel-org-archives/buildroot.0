Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7B3EB64DD
	for <buildroot@archiver.kernel.org>; Mon, 24 Jul 2023 18:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3CF06106A;
	Mon, 24 Jul 2023 18:24:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3CF06106A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2IbX4FKaluxO; Mon, 24 Jul 2023 18:24:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 003496102D;
	Mon, 24 Jul 2023 18:24:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 003496102D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EDB461BF3DE
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 18:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C766D82004
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 18:24:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C766D82004
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bgodARvMD5hV for <buildroot@lists.busybox.net>;
 Mon, 24 Jul 2023 18:24:44 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D39CE81F6A
 for <buildroot@busybox.net>; Mon, 24 Jul 2023 18:24:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D39CE81F6A
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3172144c084so4261473f8f.1
 for <buildroot@busybox.net>; Mon, 24 Jul 2023 11:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690223082; x=1690827882;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DmR73IkeTWwGqG4pqsdzT6zBCVFvKOftLkv2jvrzOXo=;
 b=PjtDCGAGw8BYP+U8sjRkkMnyjQgWLgDQPWP/g05806XhjVKd1BS/gOxkPruISwYKbk
 6IIqllUflHWZ9IhVA4NLMQjaJxRFc6YK6c80uyRlunxH49Fn0O3yrXWIVuLEdzGfEWv3
 E+o+tXTzoXvJdsPSYX4rELGP+BwdadKlT3HcSB0j0cJ4UA6gF5wVLeWUhRUirRzPHZhl
 tnX5IQ/icbiDBpKDWMclJ8t9FyxmDJhqbBTa/qvHwOqOPBwTWb1mwZVE3t1WMYGtcZx+
 AJAhuI916CZZImz2mPc3G1KA4+wLVK4p0OOMmamnWpr/SPA4Er8kO8d/7WmBftbQwIPc
 KeoA==
X-Gm-Message-State: ABy/qLbtUMW7veNcpRyQkxkPzAdqCpIzCLpX+5WWgxW9uAG4hvSxZmKZ
 Zfxw4upKV5EEFxopO3kNXxYf2qbMxD0=
X-Google-Smtp-Source: APBJJlFQjjPbzlyFaQdzPk2Nij9/Il9anVPM9B2a/JHTougFteTzvH0bBc6x2+PxB16zpmc6Gx9hfw==
X-Received: by 2002:a5d:54c3:0:b0:317:52d2:d196 with SMTP id
 x3-20020a5d54c3000000b0031752d2d196mr4102954wrv.33.1690223081714; 
 Mon, 24 Jul 2023 11:24:41 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 x13-20020a5d60cd000000b0030ada01ca78sm13711603wrt.10.2023.07.24.11.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 11:24:41 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 24 Jul 2023 20:24:37 +0200
Message-Id: <20230724182437.889823-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690223082; x=1690827882;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DmR73IkeTWwGqG4pqsdzT6zBCVFvKOftLkv2jvrzOXo=;
 b=qTJGAVJQKXfdsy8Wf40xG5foclU9IPzgRfO1tjMPZyvOSE4vskAoovHNaAUwxsW7D4
 PG7OskBxwU+wvttFKVZv0FvdJWZg/25oXSI/ROGTC6qUPQvmTkGCO9r1pLlikL4/mBJW
 yqjJ5I3JfOLl/SFiSDhi0M5xeGNYbNlJYLdzgL3vPOqSgZewoyjOcr685NCZlT01E0CS
 a1Djz+FMYoJRLrLS9bd6QQ5KigBfGpVG/7x2Zkfo3yJIy/txp1v49R5ZBgZZvv4JXi9q
 d5vBR4gJY7ymbhW7AiEKNRICqySLmhdwNgQTvJdgq+nwytL9ZOzBYtYjzondWIUNxmZt
 mhjg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=qTJGAVJQ
Subject: [Buildroot] [PATCH] package/open62541: bump to version 1.3.6
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/open62541/open62541.hash | 2 +-
 package/open62541/open62541.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/open62541/open62541.hash b/package/open62541/open62541.hash
index 09002436e..2e650a125 100644
--- a/package/open62541/open62541.hash
+++ b/package/open62541/open62541.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9a7955ba01e12dbd327e534c25288f4918d275031394c804943a7e45ba903621  open62541-v1.3.4-br1.tar.gz
+sha256  372fd6b2d78823d3f9e8279f78fb43b6af2501603675450a194d2bac65925ca1  open62541-v1.3.6-br1.tar.gz
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 2c0e3b17f..672fb17be 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPEN62541_VERSION = v1.3.4
+OPEN62541_VERSION = v1.3.6
 OPEN62541_SITE_METHOD = git
 OPEN62541_SITE = https://github.com/open62541/open62541.git
 OPEN62541_GIT_SUBMODULES = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
