Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A40D0BB49
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 04:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB044608A1;
	Thu, 24 Oct 2024 04:34:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8OOHgU6fV6fJ; Thu, 24 Oct 2024 04:34:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5BCD608A4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5BCD608A4;
	Thu, 24 Oct 2024 04:34:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 82DC82073
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 04:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5564C608A7
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 04:34:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0suS4-GfgYRn for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 04:34:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6258A608A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6258A608A1
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6258A608A1
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 04:34:26 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-3a3b463e9b0so1993005ab.3
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729744465; x=1730349265;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hvZj84bXo5KUg942CdnktV6ogTBiB8JEcJqwECb3BKA=;
 b=AIFz8qtGTHXADovGykcEiz+hr/+MpsPz6YWHUMj98eJdMKlKrI2trexYJDubdq6Ti+
 DIp5/FbhR9v7c8LoH7PsS9HkhHOksjslDN1KCdWvrSs0lA4RfSLqpjkITxmWHcoRmhVf
 f39D4j2pqaUw5g1FNwM/Qqj/zy4isM4Kg1paWc3v5md/yJJYRrb5vx3yCpvwqYrweaRd
 UlnVnaAkF8FjzKQy+gqjNowicgrkgLvIGlppGP+J7/clzd0ysmG2Xcs1pgynp3/jzZNU
 ock1kId9m7WZWZmdKfHCAAktc4/WUA0ioll1TIuWB7WhTWCEgP9VHeS0o2NyuiIYe3UV
 Et1w==
X-Gm-Message-State: AOJu0YwAoLgTVvV62oCQXItsOfEsJW1GEKL2ZqwS/5/bhaMCNsNE7GWc
 qn498I76ojbkWvMZHphq13MSQAVS4wWuDzR/+UxDV4UDGzVbJzDx7Rm4SA==
X-Google-Smtp-Source: AGHT+IG/NnM5vNkY+wH5FNPSsgyzT3ZdZnpNknkRmKUQ3UU2pbCBwPAYk1LAQLs517xd2+RDJx/CZg==
X-Received: by 2002:a05:6e02:1c4b:b0:3a2:6cd7:3250 with SMTP id
 e9e14a558f8ab-3a4de79cf7emr8054905ab.10.1729744465052; 
 Wed, 23 Oct 2024 21:34:25 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a4dc8997b4sm4230195ab.28.2024.10.23.21.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 21:34:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 22:34:13 -0600
Message-Id: <20241024043413.3364494-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729744465; x=1730349265; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hvZj84bXo5KUg942CdnktV6ogTBiB8JEcJqwECb3BKA=;
 b=nWU3te4zyM9hG6fHvs/6TYqg6Vq/yrOiitEKJztvYw9obv1xoepX01WRKEG+/LatBS
 OpBaNTkFC8WHp+htFhE+gUbTbSe/DIBO5dcO3fhxGCKscrY3Psmafod1s4S2pT7ZFhws
 WiWWid5IfpGHaaGg8cm/9pENgt4FUiOIw3UPdMs6vj/QI1upb8weQPg7voAe3A60X6t1
 Wmdu/bafhaMJMjOul/bo1qlm+Ko/JLPdhh6WVRWjEuMZK5mteQsCxxpR0Fk6FyFkYB0o
 Ei8aR9PZlezYK+6sDe0c4bZq1ZGec2fjN7bvcCfGQmJdDPS0heg3Ab6S+jNIKMWBfP8R
 EQZQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nWU3te4z
Subject: [Buildroot] [PATCH 1/1] package/python-expandvars: use hatch setup
 type
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the new hatch setup type which automatically pulls in the
host-python-hatchling dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-expandvars/python-expandvars.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-expandvars/python-expandvars.mk b/package/python-expandvars/python-expandvars.mk
index 5c9a7249b3..0a72601b5a 100644
--- a/package/python-expandvars/python-expandvars.mk
+++ b/package/python-expandvars/python-expandvars.mk
@@ -7,9 +7,8 @@
 PYTHON_EXPANDVARS_VERSION = 0.12.0
 PYTHON_EXPANDVARS_SOURCE = expandvars-$(PYTHON_EXPANDVARS_VERSION).tar.gz
 PYTHON_EXPANDVARS_SITE = https://files.pythonhosted.org/packages/2b/a5/46d1f58edcae1d632fafdfee313e378240e002ae45d26502bac938bd8751
-PYTHON_EXPANDVARS_SETUP_TYPE = pep517
+PYTHON_EXPANDVARS_SETUP_TYPE = hatch
 PYTHON_EXPANDVARS_LICENSE = MIT
 PYTHON_EXPANDVARS_LICENSE_FILES = LICENSE
-HOST_PYTHON_EXPANDVARS_DEPENDENCIES = host-python-hatchling
 
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
