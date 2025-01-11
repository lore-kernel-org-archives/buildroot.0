Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161B4E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 13:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1C3D4027B;
	Sat, 11 Jan 2025 13:08:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s0xIkD3PSyO2; Sat, 11 Jan 2025 13:08:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 964FB402A6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 964FB402A6;
	Sat, 11 Jan 2025 13:08:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B714A942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 13:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97CA2402A6
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 13:08:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V9oHcBE-gVk5 for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 13:08:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 788444027B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 788444027B
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 788444027B
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 13:08:20 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-844e7bc6d84so89698539f.0
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 05:08:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736600899; x=1737205699;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9wupgICv1t8Tttf/DwM1GTgnPSbn+71YH1cyC1Ah+dA=;
 b=XBzBqmIrEFQGkLYxbRrxGToDkfBwDoBnT6DuL4JgYSY5SxloHaxkT4YRAY/mlXvQBE
 XAjFdoYd4+m9EJp+nvq66nSiFYfyokVNVxO/KimrK17CmfqbLaZ5j/DzVvFZHVwZq4rI
 Girv0S8PayMYPWGyr0oq7UGAqUWolRGayY9p3njT1X91eC4kmyCTEnja/vKQ2UBQnTQk
 tThISjU25sMqH3XE+XJmqbT0zZMH4/WX4Pvft6Jnay/ViDZcyiUe5RLat72uZm4eC/iS
 4FUU8dYLfD2oE+VCXhd7ER2HE58d1hWrhapnqaZw9GDwNLv/lxTP/lgkQB5P/aJL3AIq
 nduQ==
X-Gm-Message-State: AOJu0Yxu0O0FC6xAiSkE1MR7f+90CWyZ/2XvmetmeejE8gChg6bVbNqZ
 ScbN4apoR52duq1CnrO9d4i7A3EjSn+v8roMLIRNvWGjTBUeUCpBJsyb1dTkr4M=
X-Gm-Gg: ASbGncvwyQJoWoQAKlscO8pg0BxNTe/0sWMKSZc6Ihnsue+9/dP6kQQW+pQtI7ZiqPT
 hTPGRLAXklSpm4Uope7b/n+UnfXFq+W+BxvGQz1MdrFHo1xltTSEdhKYF4b5u0zIfdoPo2cDmw7
 YArbnHd3pCdw3+0UrF03UPaJDg4b05sHIeIKNH1UBnXw13Wa/6sntojjk4Xx7zqqn3RG1ezxLCr
 cY8Ix0U0eaX5SH3CJXLwDU4IsUE7Gj9VaGF/Ol3W2Zrpe5qSGxgiX3u0AuM71WNw3L/sCyV4w7J
 3D1EAgoXdERgGBHuP8nxsEaYqtTE3FM=
X-Google-Smtp-Source: AGHT+IGtSkE/adz1pJYYV7w51K/LhfQ5Tx8dff2COpPfSN/CxFfIz6cdBHIaliHds9A2VQ+xzv6FzQ==
X-Received: by 2002:a05:6602:3e99:b0:7f6:8489:2679 with SMTP id
 ca18e2360f4ac-84cebf17b13mr831212739f.8.1736600899219; 
 Sat, 11 Jan 2025 05:08:19 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-84d4fb32323sm152961639f.19.2025.01.11.05.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 05:08:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 06:08:17 -0700
Message-Id: <20250111130817.2461428-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736600899; x=1737205699; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9wupgICv1t8Tttf/DwM1GTgnPSbn+71YH1cyC1Ah+dA=;
 b=Vqq8cipoPQ0Jb0A3q7HB8Dm2IbTkK5d0n51ljkiOfa64gjKUpzbPivBZ1Cpv+EW2hD
 zJKTI+6R2EIrpn8E5qUp+VonvJ7puiA3l9x7tpBizSxvUWrcs76sVAsp5DAZHYptUHgS
 0hd26+D8t05YLaA6smKuXm1ROUhoJD4y193BSR+ObkXCVKIp7hNcH7H8DSXUE10bTOfR
 SwLYDq4ZHWQ1C+DtBmHaF0h/PFIg/wV/gjiJmHiv9F8IYfVZpJLCIM2t8TF7VGku5PQb
 fUSGEorNbbbZaEDhkqEAi8/g1OHY/p1+dGaJfSAAv3ekeG9+8W7s47Z0b5yc4j/cXKia
 N0IA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Vqq8cipo
Subject: [Buildroot] [PATCH 1/1] package/python-markdown2: bump to version
 2.5.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-markdown2/python-markdown2.hash | 4 ++--
 package/python-markdown2/python-markdown2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-markdown2/python-markdown2.hash b/package/python-markdown2/python-markdown2.hash
index f5c2adb0e1..6419e3da7c 100644
--- a/package/python-markdown2/python-markdown2.hash
+++ b/package/python-markdown2/python-markdown2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/markdown2/json
-md5  1b6f79fa3baea447e6b4dda5132e2fbc  markdown2-2.5.1.tar.gz
-sha256  12fc04ea5a87f7bb4b65acf5bf3af1183b20838cc7d543b74c92ec7eea4bbc74  markdown2-2.5.1.tar.gz
+md5  9896bd95d1eb564300d7fd176e17d0a1  markdown2-2.5.2.tar.gz
+sha256  3ac02226a901c4b2f6fc21dbd17c26d118d2c25bcbb28cee093a1f8b5c46f3f1  markdown2-2.5.2.tar.gz
 # Locally computed sha256 checksums
 sha256  f8c7c4d554409cf621b8d653dbfffb719745fd36f5c49b8305258649b403ef9c  LICENSE.txt
diff --git a/package/python-markdown2/python-markdown2.mk b/package/python-markdown2/python-markdown2.mk
index 228c5d0eff..60c01dbdef 100644
--- a/package/python-markdown2/python-markdown2.mk
+++ b/package/python-markdown2/python-markdown2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKDOWN2_VERSION = 2.5.1
+PYTHON_MARKDOWN2_VERSION = 2.5.2
 PYTHON_MARKDOWN2_SOURCE = markdown2-$(PYTHON_MARKDOWN2_VERSION).tar.gz
-PYTHON_MARKDOWN2_SITE = https://files.pythonhosted.org/packages/05/92/22e3645e352562ea9bfc89aeaeb9a76feb79e20907b18bc25d5ca340b50f
+PYTHON_MARKDOWN2_SITE = https://files.pythonhosted.org/packages/a0/61/d3c0c21280ba1fc348822a4410847cf78f99bba8625755a5062a44d2e228
 PYTHON_MARKDOWN2_SETUP_TYPE = setuptools
 PYTHON_MARKDOWN2_LICENSE = MIT
 PYTHON_MARKDOWN2_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
