Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A5BC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 21:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62C57424A4;
	Sat, 23 Jul 2022 21:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62C57424A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QeQUzk8tFheu; Sat, 23 Jul 2022 21:26:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FBAE424A1;
	Sat, 23 Jul 2022 21:26:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FBAE424A1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 017DE1BF419
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 21:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC28C424A1
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 21:26:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC28C424A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xaoqw1hzG1Sk for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 21:26:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AAD7424A0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2AAD7424A0
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 21:26:14 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id h9so10936480wrm.0
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 14:26:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k40GxpQHUvPnTL7JcbGG5wnh2WKis9UzMnE4ZzdpfXg=;
 b=2yhjR1udFGpJMVeXs26p0Avvfmn37QNJu/yAgA0ljfSp2NJ0BvAWvmJbi1ey5/vkMm
 ySfKIPNpFBn1QCHiyZpQ3/oh5gfdQgEAVEcd3/RA346Z1mkVwdIqja7KsvRw144dfPpe
 cueoaTeufnkQu/gMbtYN1fql5KwrkbMAGWHexbefw0fouSK7/hbS7yR0McRAo7k5ohoG
 27ChkyfpAyWjEVODLGILene71lXEFyb5ryvkO/qdJO94mdVLgSi7YerW6QDLds34Kvfj
 V4Q6+KUxWOgMKdO5sgxSLX0eBz7/uRZkV4tUIcy8OdipcuzNBa6OccxAMXpA7VngMBMM
 o87Q==
X-Gm-Message-State: AJIora8pwT3cW2ndCK7VVpAVjqyZCSnx4BH1euvRY5i6AQT1XH8eFsgv
 ToZZpgIqNkN8x9HAOCR4eh8UnfOtfuc=
X-Google-Smtp-Source: AGRyM1sYjtIBoVIMbKN80+BXjtvvJu/dGs7asshHRv/NtdRjwG2dlSti8h9Isr2CVPUS44Fbk82J6w==
X-Received: by 2002:adf:eb88:0:b0:21e:488a:5c81 with SMTP id
 t8-20020adfeb88000000b0021e488a5c81mr3820262wrn.437.1658611571770; 
 Sat, 23 Jul 2022 14:26:11 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 a9-20020adfeec9000000b0021dfacfdf0dsm8117430wrp.33.2022.07.23.14.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 14:26:11 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 23:26:08 +0200
Message-Id: <20220723212608.488037-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k40GxpQHUvPnTL7JcbGG5wnh2WKis9UzMnE4ZzdpfXg=;
 b=NHv/Pcy4/LbWlPS/eXn1QjG74oEZWvHyGcrdRCDboA5ZYQAkJyvv+oj3Rs+iOeW8U7
 8bcf7eX9u93fGMfmzNLyJNJe9B/Bhxq6XarWbXu4J5zdObY3Kgebnw2xZISpO6bIUmwl
 TB56qqy7BU3n6ZXNBG1TJLvptXpXeihFsBz8IteHNGwwMj0QXfNV1uPWNhfiztseHmMy
 1psD14W3XsPyzcgv3rO7Asg1qJ7rP2ztDNL4m4bTvFfRokZMEgHPX1pLAGMaoJBRim0F
 AkuzkLARbU1w4u7WnyoMJ2c2pJNdstS5FwNNKTL/QY2/mWrWzPmmzaA1kMB1Nf1q0mR2
 Aw1Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NHv/Pcy4
Subject: [Buildroot] [PATCH 1/1] package/python-ruamel-yaml: add CPE
 variables
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:ruamel.yaml_project:ruamel.yaml is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aruamel.yaml_project%3Aruamel.yaml

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-ruamel-yaml/python-ruamel-yaml.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-ruamel-yaml/python-ruamel-yaml.mk b/package/python-ruamel-yaml/python-ruamel-yaml.mk
index 95d20de4a6..a6fed3bc2c 100644
--- a/package/python-ruamel-yaml/python-ruamel-yaml.mk
+++ b/package/python-ruamel-yaml/python-ruamel-yaml.mk
@@ -10,5 +10,7 @@ PYTHON_RUAMEL_YAML_SITE = https://files.pythonhosted.org/packages/46/a9/6ed24832
 PYTHON_RUAMEL_YAML_SETUP_TYPE = setuptools
 PYTHON_RUAMEL_YAML_LICENSE = MIT
 PYTHON_RUAMEL_YAML_LICENSE_FILES = LICENSE
+PYTHON_RUAMEL_YAML_CPE_ID_VENDOR = ruamel.yaml_project
+PYTHON_RUAMEL_YAML_CPE_ID_PRODUCT = ruamel.yaml
 
 $(eval $(python-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
