Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AE8C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 15:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73F2760A9B;
	Fri, 10 Nov 2023 15:59:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73F2760A9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 27y1zGAZ0xmM; Fri, 10 Nov 2023 15:59:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90CDE616FA;
	Fri, 10 Nov 2023 15:59:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90CDE616FA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6FC891BF37B
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 15:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5604F60A9B
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 15:58:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5604F60A9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gw-mO4zrQrYu for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 15:58:35 +0000 (UTC)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 73CEE60D88
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 15:58:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73CEE60D88
Received: by mail-pf1-x443.google.com with SMTP id
 d2e1a72fcca58-6c3363a2b93so2183579b3a.3
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 07:58:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699631914; x=1700236714;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zOpc08pVuC5MIPxbSieQtPdFcjGIpbNb2LoGlWHzlvI=;
 b=rxs4y+vlr0JekcHbdgcMsNgJYoaM3uQBweDjttfcyq46T9N0G1uGaqFVG1p4ZhiKch
 tK3K+lPXyOnyUDqXjHvhZmgxTY+bVs3d3GPYBCtLetlresXj7saqyL4DIphrWSYoeSqw
 Kkm7dMQx1xfMZ/spWqLmmtDwAxF7GLxoz5V2hSTEc8pIuX95oMi9IdQ6tkEmyav3GYoY
 7jBXgKE+v91tzwi5UVLkxhHkYRt/bY+F28eHtwsnzxIxn4OO99AXBk6qXG5pKNPct9Q4
 cCHvkkpDccMTH4YzD9z6QWczy6avWVcU7YSYr6ZswieKfBx/g/h4KCKkRGS67+KQA/fO
 wkBQ==
X-Gm-Message-State: AOJu0YyXgANrKFG36h1XABWsO/hoj+MzjBYlrTul846i7vJi7drCKd9k
 CoNGrRp0qW4DHxoqcMZ8rxX/vGlTlpCh2tnccp+1goUqA/Q=
X-Google-Smtp-Source: AGHT+IGw+oxXGY0sk+9HRl/R0P8Sno/SmfdIgd3O7leZnrkg1zMXhjuEVBp/45Dgo2pF5NABBqS7SA==
X-Received: by 2002:a05:6a20:728e:b0:17e:1f9a:91f5 with SMTP id
 o14-20020a056a20728e00b0017e1f9a91f5mr8959788pzk.44.1699631913761; 
 Fri, 10 Nov 2023 07:58:33 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.106])
 by smtp.gmail.com with ESMTPSA id
 p55-20020a056a0026f700b006c2d53e0b5fsm12796153pfw.57.2023.11.10.07.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 07:58:33 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 10 Nov 2023 08:58:22 -0700
Message-ID: <20231110155826.10416-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231110155826.10416-1-adam.duskett@amarulasolutions.com>
References: <20231110155826.10416-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699631914; x=1700236714;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zOpc08pVuC5MIPxbSieQtPdFcjGIpbNb2LoGlWHzlvI=;
 b=oCgEQQ7TmG7jhoQI9BpahFOSq0ElgPPGpCigZanUz5fs9dnYHs+RjNxWpm+ih/MQy1
 EQQsRVvIWiBgmzm5yCtc6l9qg49GiGFpQFGpNGwGMUIBK84bBw8CpUZyTdOeoFt7EEQo
 F/me4JCyCvVhSnyFylaZYy3IMNBsh8olqMSV0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=oCgEQQ7T
Subject: [Buildroot] [PATCH v3 3/7] package/python-constantly: bump version
 to 23.10.4
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package now requires host-python-versioneer to build.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: Bump the package instead of patching.

 package/python-constantly/python-constantly.hash | 4 ++--
 package/python-constantly/python-constantly.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-constantly/python-constantly.hash b/package/python-constantly/python-constantly.hash
index 8e646d82ba..7a246e882a 100644
--- a/package/python-constantly/python-constantly.hash
+++ b/package/python-constantly/python-constantly.hash
@@ -1,5 +1,5 @@
 # md5 from https://pypi.python.org/pypi/constantly/json
-md5  f0762f083d83039758e53f8cf0086eef  constantly-15.1.0.tar.gz
+md5  c090579309b2b34be04385b54b0a5a85  constantly-23.10.4.tar.gz
 # Locally computed
-sha256  586372eb92059873e29eba4f9dec8381541b4d3834660707faf8ba59146dfc35  constantly-15.1.0.tar.gz
+sha256  aa92b70a33e2ac0bb33cd745eb61776594dc48764b06c35e0efd050b7f1c7cbd  constantly-23.10.4.tar.gz
 sha256  020870fcaf4bf9c50b233e331817094fe109b91c0880570fd476f527cfbfc085  LICENSE
diff --git a/package/python-constantly/python-constantly.mk b/package/python-constantly/python-constantly.mk
index 783d198d06..466c9bf455 100644
--- a/package/python-constantly/python-constantly.mk
+++ b/package/python-constantly/python-constantly.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_CONSTANTLY_VERSION = 15.1.0
+PYTHON_CONSTANTLY_VERSION = 23.10.4
 PYTHON_CONSTANTLY_SOURCE = constantly-$(PYTHON_CONSTANTLY_VERSION).tar.gz
-PYTHON_CONSTANTLY_SITE = https://pypi.python.org/packages/95/f1/207a0a478c4bb34b1b49d5915e2db574cadc415c9ac3a7ef17e29b2e8951
+PYTHON_CONSTANTLY_SITE = https://files.pythonhosted.org/packages/4d/6f/cb2a94494ff74aa9528a36c5b1422756330a75a8367bf20bd63171fc324d
 PYTHON_CONSTANTLY_SETUP_TYPE = setuptools
 PYTHON_CONSTANTLY_LICENSE = MIT
 PYTHON_CONSTANTLY_LICENSE_FILES = LICENSE
+PYTHON_CONSTANTLY_DEPENDENCIES = host-python-versioneer
 
 $(eval $(python-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
