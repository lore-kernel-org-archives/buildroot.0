Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202E8C4345F
	for <buildroot@archiver.kernel.org>; Sat, 13 Apr 2024 13:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8D44407E7;
	Sat, 13 Apr 2024 13:32:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D3DjbG7Gm45n; Sat, 13 Apr 2024 13:32:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6820A40808
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6820A40808;
	Sat, 13 Apr 2024 13:32:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EDA4C1BF855
 for <buildroot@lists.busybox.net>; Sat, 13 Apr 2024 13:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA6A940808
 for <buildroot@lists.busybox.net>; Sat, 13 Apr 2024 13:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xGj_fSw33O_b for <buildroot@lists.busybox.net>;
 Sat, 13 Apr 2024 13:32:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8C682407E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C682407E7
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8C682407E7
 for <buildroot@buildroot.org>; Sat, 13 Apr 2024 13:32:07 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a523fb1bc1fso146298966b.3
 for <buildroot@buildroot.org>; Sat, 13 Apr 2024 06:32:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713015125; x=1713619925;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q3Q7PnOOjC2/gYVfrUyNp2xBsQgfri2cr8vbOQVoC5o=;
 b=rula6sulddNdlf8ts/eU21JNkpPVY7pzr2fUrNNAIWljUn/2fm/xlpjDEcVkysiJNa
 PxZHOp+Wx0leWufUx3VtFpxHmM3rgKnL1S8GcjPgp4OAPDj6btnTi24QCWbFZaB1SToi
 sGDW1QyNbzoqUuG2ufXEB0e032CqPjSlmIuNt8HL/3JvGvocmhzZ3/N6+idRMgN/Wy2Q
 kHLnkgptqTzylIBJW2IuwybdOjTK3t5DsR+Q5YUEqV71sSQvCFMA00fws13XFHEOxvWI
 arDZPnJtB0+0+VtV1UTlG8+QGm774e2OsD6H+ue5SM7OJRVT7+DbC0IraNHWZAoRNI04
 Kacg==
X-Gm-Message-State: AOJu0Yx9LIEOKMw7jkkJZBjM2oBEjdKnFh4abpWhYZPV3CiULfuRNU9d
 n0/lKpsHzVbmUGtNigXROfk2UWkVWEmRaZbJIvTO4FOT3YwWjYLgEKLglA==
X-Google-Smtp-Source: AGHT+IGKMO3+/zzJwm3oyQ3C0yp7pZ1ovOIv+eGc4oZmDHiaWwYpyL2NIrgffFcvyeFd3+a+vUbAgA==
X-Received: by 2002:a17:906:5fd2:b0:a46:3ce4:5acb with SMTP id
 k18-20020a1709065fd200b00a463ce45acbmr2813488ejv.75.1713015124541; 
 Sat, 13 Apr 2024 06:32:04 -0700 (PDT)
Received: from t450s.fritz.box ([95.91.160.230])
 by smtp.gmail.com with ESMTPSA id
 dc11-20020a170906c7cb00b00a5195edf8e8sm2991684ejb.62.2024.04.13.06.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Apr 2024 06:32:04 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Apr 2024 15:32:02 +0200
Message-Id: <20240413133202.29033-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713015125; x=1713619925; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=q3Q7PnOOjC2/gYVfrUyNp2xBsQgfri2cr8vbOQVoC5o=;
 b=fUIvFDMN9ASP2JykAU1p9S3kA5WAQu1SCszhmp37huazXu0EtX8DdOPL9DaJ7IFcIu
 mIfoOMp6YjOtGvLuVgVlBGysxcOZ+2B3AZHfxEPdF3oynyKqWm4U1oBp+9L7gh47ICLx
 jqWOjSxHQ78f5UR5ll13V33fk2Tja3vuU/lY8Zu0CFL3n23T3GtMUDIEqNOM3Bc4yzOY
 WQiEDRD97Hn36rRAns6Idd56YMh6+N8jnOmx8ImuWGuN7X6uJhAGrf33rDe2hwluvJ9m
 EnK2hKVxt4ipwMpdyjgD+qwYCSAqGo85ladBt9vwWGH7HpPSGxZOEaXQOfQShDdKcbL7
 SxvA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fUIvFDMN
Subject: [Buildroot] [PATCH] package/python-yamllint: fix dependencies and
 SETUP_TYPE
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@smile.fr>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For host build the runtime depndencies has to be added. Also the setup
type needs to be set to 'setuptools'.

./output/host/bin/python ./support/testing/tests/package/sample_python_yamllint.py
Traceback (most recent call last):
  File "/home/hthiery/sources/mainline/buildroot/support/testing/tests/package/sample_python_yamllint.py", line 3, in <module>
    from yamllint import (config, linter)
  File "/home/hthiery/sources/mainline/buildroot/output/host/lib/python3.11/site-packages/yamllint/config.py", line 19, in <module>
    import pathspec
ModuleNotFoundError: No module named 'pathspec'

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Reported-by: Romain Naour <romain.naour@smile.fr>
---
 package/python-yamllint/python-yamllint.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/python-yamllint/python-yamllint.mk b/package/python-yamllint/python-yamllint.mk
index ceaca3b0b8..29344a1408 100644
--- a/package/python-yamllint/python-yamllint.mk
+++ b/package/python-yamllint/python-yamllint.mk
@@ -7,9 +7,13 @@
 PYTHON_YAMLLINT_VERSION = 1.35.1
 PYTHON_YAMLLINT_SOURCE = yamllint-$(PYTHON_YAMLLINT_VERSION).tar.gz
 PYTHON_YAMLLINT_SITE = https://files.pythonhosted.org/packages/da/06/d8cee5c3dfd550cc0a466ead8b321138198485d1034130ac1393cc49d63e
-PYTHON_YAMLLINT_SETUP_TYPE = pep517
+PYTHON_YAMLLINT_SETUP_TYPE = setuptools
 PYTHON_YAMLLINT_LICENSE = GPL-3.0
 PYTHON_YAMLLINT_LICENSE_FILES = LICENSE
 
+HOST_PYTHON_YAMLLINT_DEPENDENCIES += \
+	host-python-pathspec \
+	host-python-pyyaml
+
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
