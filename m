Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60613C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 02:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD1C640B2D;
	Sun, 24 Jul 2022 02:42:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD1C640B2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZYc0QBvAbYez; Sun, 24 Jul 2022 02:42:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7C4D40185;
	Sun, 24 Jul 2022 02:42:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7C4D40185
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 78E081BF4E7
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 02:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52B1184888
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 02:42:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52B1184888
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PsB8lroeUsVT for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 02:42:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B98784887
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B98784887
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 02:42:50 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id v185so6333046ioe.11
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:42:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fcxbGcKbq+MmHshC389Lsxxh6Twszjmq2wPYxobRosg=;
 b=rg+qqevPj98OiD1ITNQAtwC8QhFKg0S96kjWayAv/wgYPwPyMyYhFHO1y3lyb9Vhr4
 wgzlysEVj1wvcMsmfTuMJSqA7bg7LktxMou4NetOKS0MgOQRZMdX5RlEL0iq9qiQDaBT
 hOD7C9wacaVAIgar+HxPEMYcISMaB6yNKXnLVwAjtw1Zw8fCa3cKdTxxXtRyAQgAotMc
 SY26Y6+CImCWg4ErKPWjjuxb4B3TeqKBOaWFly/dp3LD0Es//c3YUhbjcY2r6vHJzDys
 vIt1lOEd6HaMFA9L7XJPgBzztyN+MclLMSQG42dsCOFT/sMUNqMCm2THN5sMwsYHA79j
 OqOg==
X-Gm-Message-State: AJIora9IxZN4zX2nNTqZ1idDfATAboBIcspXB4S27fCyDpEbb/p8vZay
 gL++tkDCsCAc4obmWbNDGjbBQ8d+GqiGzA==
X-Google-Smtp-Source: AGRyM1tXyMbo66MwH6888KrCnOrHNhGBGDufZZCrYQXfMqaHkr0zgmS61IL6aB8N6Q7PBu6M9zlBvQ==
X-Received: by 2002:a05:6638:3d0a:b0:33f:5368:a95f with SMTP id
 cl10-20020a0566383d0a00b0033f5368a95fmr2622761jab.123.1658630569350; 
 Sat, 23 Jul 2022 19:42:49 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-32.hlrn.qwest.net.
 [71.33.133.32]) by smtp.gmail.com with ESMTPSA id
 x8-20020a0566022c4800b0067c09fd0b53sm4132002iov.21.2022.07.23.19.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 19:42:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 20:42:47 -0600
Message-Id: <20220724024247.1033155-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fcxbGcKbq+MmHshC389Lsxxh6Twszjmq2wPYxobRosg=;
 b=HdxPijrPJX23jszNeb79dC8KH1EOnbB4kOJysYEt/ahl1FsHr6YWSPHVu3ZQJOAH3W
 DcfzU7tUChCF9f72Re4alZ7qSZjG0uoHWst1z5qzw9Xz4YcUDXpsHtNh9lPnt3ou+5Ub
 hBi2qqcaMO7rqPMn49Gp4RpL44b//VasvsP6PQfPnz339QESSE7L2OcA3F6PX4HmP4VB
 s39B9GEEibhk7aMJJWqNCdXtYrw3ejvc8nFS7z3/xfuawHu7hNpoRVIMSKCm+Ad3WUQa
 qGGijSVOVcWEYaR7F1b9a2ZtYVF2N2JB2d7MMTud3oNPh+B2H3w7knsV8b4V3mJ6I/K/
 S8OQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HdxPijrP
Subject: [Buildroot] [PATCH 1/1] package/python-fonttools: bump to version
 4.34.4
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
 package/python-fonttools/python-fonttools.hash | 4 ++--
 package/python-fonttools/python-fonttools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fonttools/python-fonttools.hash b/package/python-fonttools/python-fonttools.hash
index ef75a54ae3..469fea9c19 100644
--- a/package/python-fonttools/python-fonttools.hash
+++ b/package/python-fonttools/python-fonttools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fonttools/json
-md5  02a4c1216de481ca881f92afba1c80db  fonttools-4.33.3.zip
-sha256  c0fdcfa8ceebd7c1b2021240bd46ef77aa8e7408cf10434be55df52384865f8e  fonttools-4.33.3.zip
+md5  197ad603c91d4c2909acf9e54c26e85f  fonttools-4.34.4.zip
+sha256  9a1c52488045cd6c6491fd07711a380f932466e317cb8e016fc4e99dc7eac2f0  fonttools-4.34.4.zip
 # Locally computed sha256 checksums
 sha256  6787208f83f659ccbc2223b2fde952ffa6f7e8aca62f1a8a2bf5bc51bb1b2383  LICENSE
diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
index 5ee159d551..c35c538cb6 100644
--- a/package/python-fonttools/python-fonttools.mk
+++ b/package/python-fonttools/python-fonttools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FONTTOOLS_VERSION = 4.33.3
+PYTHON_FONTTOOLS_VERSION = 4.34.4
 PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).zip
-PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/de/54/14376a4e5c1e7d2105a5be33ad5584b56e36753dc615506728a1489071cd
+PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/5a/a4/a97cff4c4af6764a04cc202299e5205b2e101cb1543bcaf9737be29f78ab
 PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
 PYTHON_FONTTOOLS_LICENSE = MIT
 PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
