Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BCACEE33F
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 18:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD71080F21;
	Wed,  9 Oct 2024 18:25:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PnuGeRPM4nbV; Wed,  9 Oct 2024 18:25:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE07D80F15
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE07D80F15;
	Wed,  9 Oct 2024 18:25:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 11E8D1BF403
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 18:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D4974013F
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 18:25:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ifhAxmbsIBhX for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 18:25:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F2340400E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2340400E7
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F2340400E7
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 18:25:43 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-3a0c8c40560so592435ab.2
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 11:25:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728498343; x=1729103143;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sIfulGf4k9JK08Z7dlluJOmcwrpq+G5wwiOAPB1tuB4=;
 b=PqnBxN5Fwri2DtdWkFibngyDL+WKjtuKtyTt5AtFoYTe1WH6m4p1S9r8ZejxzhBgfA
 7SvxGnCDNO6I/4wSWSv7OgMGMc2VeABmRBrRiuhcohtrYWEHMaaG5v2UngOvnJI5M74j
 PXU42X2qw5xipaijGk2pqtrJNRh4kRG4CGyZ7/DFWLiGakmPEKCExcCvhv77FLFKBUWX
 ZzymVG0q41FtcNAu8hLPv702wsxxwo9uUL03ycLz+IknNCk1HqEhM4aW6016WOxqxPx6
 ouihwMA/tSh0VmQKiIpifw0vsX7e7e2boGnrxw6uVhybjIcEV2U7OzeeqVY4Q+Tc+GOp
 17XA==
X-Gm-Message-State: AOJu0YwGeq1wVe43JJvMpJrA/lgq76CNkSbTdZ3zzF0aiBKU5bxMEyWZ
 ZjnUnmqMx/P72RnUsRpj7PNwYBrCDBghRbiiW9B42eIVejQMQok1Q9o3wOb4
X-Google-Smtp-Source: AGHT+IFFQ1Ao9vPrPKwI0fxDDeEz5+UnXovViYLpQl2TMtG9Wh1wmb3WoiINc6+w2T3OmcrJ2gtwbA==
X-Received: by 2002:a05:6e02:1a4f:b0:3a0:9fa5:8f1 with SMTP id
 e9e14a558f8ab-3a397d27c95mr41513035ab.24.1728498342640; 
 Wed, 09 Oct 2024 11:25:42 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a39716533asm5026035ab.41.2024.10.09.11.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 11:25:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 12:25:40 -0600
Message-Id: <20241009182540.3881681-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728498343; x=1729103143; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sIfulGf4k9JK08Z7dlluJOmcwrpq+G5wwiOAPB1tuB4=;
 b=WhMF0ja6g85urTJS/M1ZyDQAyOd5orA4xadopNq+SySFLoFiNBZW5rxV1eGhdDxzxK
 HeQf6wXxnUJhlJk24lXPc0uWFRTDPYRF77Sh1i/egXqjzSA3uDDHHqX69KNCX+8zUNo+
 ThJOYQHFhyQ5HmgpACm894069Dquom/hJnjbstWgYv+WA/CF+aXTlcmQG67rUtkneL1d
 wcVXxfMQxO++Gmjn3aM4excrDZLCNQqI3XWZYPuyVpzna34F80fS7VV9JKl3igHENnvJ
 oOSK2wS1IQlIF0NahrQJHVEgGF/CJqrhmxtX8LRs9gTluQ+JzYKhtHZ1vaXbAVxFY3xH
 N01A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WhMF0ja6
Subject: [Buildroot] [PATCH 1/1] package/python-watchdog: bump to version
 5.0.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-watchdog/python-watchdog.hash | 4 ++--
 package/python-watchdog/python-watchdog.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-watchdog/python-watchdog.hash b/package/python-watchdog/python-watchdog.hash
index 0d6047e21b..4377871db2 100644
--- a/package/python-watchdog/python-watchdog.hash
+++ b/package/python-watchdog/python-watchdog.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/watchdog/json
-md5  7e4eff2cd9a3e62f0dccd55801d5b0c0  watchdog-5.0.2.tar.gz
-sha256  dcebf7e475001d2cdeb020be630dc5b687e9acdd60d16fea6bb4508e7b94cf76  watchdog-5.0.2.tar.gz
+md5  83499e8a193ba23bb68436fbdc249589  watchdog-5.0.3.tar.gz
+sha256  108f42a7f0345042a854d4d0ad0834b741d421330d5f575b81cb27b883500176  watchdog-5.0.3.tar.gz
 # Locally computed sha256 checksums
 sha256  39f081828db6f94c70123fa4fb30c1bce3e215a8fdece53a49991fe076a69c08  COPYING
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-watchdog/python-watchdog.mk b/package/python-watchdog/python-watchdog.mk
index 2a2b80b04b..f5ef770fcf 100644
--- a/package/python-watchdog/python-watchdog.mk
+++ b/package/python-watchdog/python-watchdog.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WATCHDOG_VERSION = 5.0.2
+PYTHON_WATCHDOG_VERSION = 5.0.3
 PYTHON_WATCHDOG_SOURCE = watchdog-$(PYTHON_WATCHDOG_VERSION).tar.gz
-PYTHON_WATCHDOG_SITE = https://files.pythonhosted.org/packages/cd/5e/95dcd86d8339fcf76385f7fad5e49cbfd989b6c6199127121c9587febc65
+PYTHON_WATCHDOG_SITE = https://files.pythonhosted.org/packages/a2/48/a86139aaeab2db0a2482676f64798d8ac4d2dbb457523f50ab37bf02ce2c
 PYTHON_WATCHDOG_SETUP_TYPE = setuptools
 PYTHON_WATCHDOG_LICENSE = Apache-2.0
 PYTHON_WATCHDOG_LICENSE_FILES = LICENSE COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
