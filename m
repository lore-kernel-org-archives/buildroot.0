Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D46D3A675
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 17:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D84D80531;
	Tue, 29 Oct 2024 17:09:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pf2aXTJXe9_o; Tue, 29 Oct 2024 17:09:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2537880503
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2537880503;
	Tue, 29 Oct 2024 17:09:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 04D0B496C
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 17:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF88980531
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 17:09:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3jyRFknfPW08 for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 17:09:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DA49F80503
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA49F80503
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA49F80503
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 17:09:07 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-3a3b8b34be9so21359065ab.2
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 10:09:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730221746; x=1730826546;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2PSoO7qWsTazQllEewWTKB1DZiaXP4tl4Xvx9YyB/oE=;
 b=YhBwalPGISlPyIIc2gscbM3Nu4BDwE7DHDuZJGvuaQgalekSWjxOOMP5tUCEbVqhrw
 Tc3TA5xtFdYY1ahtIaL9pn/R7WEHGy522ZeusfPh5vKok78HvWdruqazcQft4s1m1nEN
 xv7Zbd/SwJyZWx9wwD1nKWw+TzPeljdmM0MxvuSa8G92REssxY9Vz9wpMpBBQOdRJ23F
 XeWN67AczjyTV62Ws00KBSmKRvtikV3gCHfF0OMNZkvNKmVvglTLxQXEdxrQ0FPwER+N
 ZlSb+94l3vrfZa1G6h2qtUC90bAbNbwpgRzeVCYgpuBO/8f29jGfJ/UMsJMaDAmTYNy5
 MQwg==
X-Gm-Message-State: AOJu0YwbXeKYFpelF6XXZAx4dwKRRaXgI9t1rQltkYDnrS1ikPYiagaN
 +biHvuZSPgj3bhGUYcfiDF6/IHERyd9Viq5JbBN+VA8tPIl2O6FDxR3Cjw==
X-Google-Smtp-Source: AGHT+IE1TwNwS1grRTjyCMK5ojzlxB9xj3IOmeO/u63yMBRMcwnZlrKtGyninWtWDt7mTV8nmFMn/A==
X-Received: by 2002:a05:6e02:12e8:b0:3a0:c85c:f18b with SMTP id
 e9e14a558f8ab-3a4ed2f4656mr123780385ab.13.1730221746363; 
 Tue, 29 Oct 2024 10:09:06 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc725eb658sm2428178173.34.2024.10.29.10.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 10:09:06 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 29 Oct 2024 11:09:04 -0600
Message-Id: <20241029170904.1041681-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730221746; x=1730826546; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2PSoO7qWsTazQllEewWTKB1DZiaXP4tl4Xvx9YyB/oE=;
 b=KK3Ob3JSEAc6Lfgw+65S4mEeznqw3JITij87Q8hdpX8gd45u3YyGiajEpWpT5kmAiP
 vhsYTDW2VDmgEHs32MEVJprfw4CFjv9RgijpfupOT2xydvO8rF8RW3KAPXuWjTlr980C
 cpljKJ72921ShvT9j761OtTQywea1r604dsRo0Jsbm65idGqJ6rMW/mmkPzhIwQvDJnc
 hm863TlT2WuHTQ3pS7XKhAuc6IsUcQnq9hFnSIk7TnqbpkcZVCyuC/AOkncBQiu8dV91
 MX4i0WvXVaP/PGXlCfyJBJFwrDE/leI4X3mZmB44H0jl1fiPVtZ2ezZyLpdFUNQzDlPi
 BmkQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KK3Ob3JS
Subject: [Buildroot] [PATCH 1/1] package/python-yarl: bump to version 1.17.0
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-yarl/python-yarl.hash | 4 ++--
 package/python-yarl/python-yarl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-yarl/python-yarl.hash b/package/python-yarl/python-yarl.hash
index 766541bc94..0966c51a55 100644
--- a/package/python-yarl/python-yarl.hash
+++ b/package/python-yarl/python-yarl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/yarl/json
-md5  23595f461eb3eeba689e3567f60cd07a  yarl-1.16.0.tar.gz
-sha256  b6f687ced5510a9a2474bbae96a4352e5ace5fa34dc44a217b0537fec1db00b4  yarl-1.16.0.tar.gz
+md5  7b27203f854753afb8e6b0b560459f1d  yarl-1.17.0.tar.gz
+sha256  d3f13583f378930377e02002b4085a3d025b00402d5a80911726d43a67911cd9  yarl-1.17.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-yarl/python-yarl.mk b/package/python-yarl/python-yarl.mk
index 78f5082bce..2c6ff3ecc9 100644
--- a/package/python-yarl/python-yarl.mk
+++ b/package/python-yarl/python-yarl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_YARL_VERSION = 1.16.0
+PYTHON_YARL_VERSION = 1.17.0
 PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
-PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/23/52/e9766cc6c2eab7dd1e9749c52c9879317500b46fb97d4105223f86679f93
+PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/55/8f/d2d546f8b674335fa7ef83cc5c1892294f3f516c570893e65a7ea8ed49c9
 PYTHON_YARL_LICENSE = Apache-2.0
 PYTHON_YARL_LICENSE_FILES = LICENSE
 PYTHON_YARL_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
