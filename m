Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90BCD43341
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFB8B406D4;
	Thu, 11 Dec 2025 19:56:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Ki5WTu6EYZ0; Thu, 11 Dec 2025 19:56:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3EEE405B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765482993;
	bh=wpK/+3lXTagurPOVcpAfqkmNp2HMpsr7Xi26CGmBG2E=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=SlVSUsHVvqCmsICLkCcHnU2/pHPUVP71Jvwoe8OoACE1ugsqoZx9WVFsh56JW3P8D
	 DWU1/UBeNuNXAMQSUS8tCEYZ3geIY9El5PG93us2ZI5Tk3VqXgONr8eC1JIvKRW0Hs
	 TOdeVymlqKFiAqkB9rKdYztKs3JauBFOSPC2WULviBy5u5o4NzfXbvdCsqWXow72l4
	 8bdldXvotJC0saR8NOJn/UXbdJjVde0vJAb8zsQAvIyOYhy3qd1KaOPuFWw0hMzGSG
	 Rv/ggZkqlTmkRbcDeQLhwo7FYt3MLU8Qo5yEvus/r0AehJRxKLiX8qzmPcQ6JWY9V1
	 p0YsebYuu/qgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3EEE405B7;
	Thu, 11 Dec 2025 19:56:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 950052C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B02B815DC
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:56:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QzGcz7nPWT-l for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:56:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 71425814D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71425814D3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 71425814D3
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:56:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5B9C2A4C381B;
 Thu, 11 Dec 2025 20:55:35 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39350)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vTml6-000000008Hh-2O49;
 Thu, 11 Dec 2025 19:55:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:55:13 +0100
Message-ID: <20251211195527.3276900-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251211195527.3276900-1-bernd@kuhls.net>
References: <20251211195527.3276900-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765482935;
 bh=Vgl3PIJLOcJZVTUs5zMWk5iStI93x1Ba3439weBviBY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=NrJps9FMnvCYanSL2bdia1tmmPXqZsqb5/PtS75EeUSxmQIKH1z/Ds5OrEhP9PWcz
 SIq/hzMeBLovbpzRQ01LAQy3Nh0kaiMfWp16jM//2r9uSEd6DvfgDerYrcQG/9BiXK
 V3nTse96Fnh1Qji9NNKR2U0hDFpbPcIy8gMOa5LcLBt5l59mRWMaKOGz0RW7fz0fyf
 wIlloNrtZRvS/7Xsr078D5KTqJ486Xi5A2vjHjPoaL6ydFGYoi3QBFuvJBckrl9Cwv
 ovj4rEJ9r0+hM9eS6Y0V2aTtdUyRNrW1nQu8oe3qVNXq25dT5uylOGvfFo2HhmmwnD
 +wH5OKYc6KiGw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=NrJps9FM
Subject: [Buildroot] [PATCH/next 07/21] package/python-falcon: bump version
 to 4.2.0
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Lionel Flandrin <lionel@svkt.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://falcon.readthedocs.io/en/stable/changes/4.2.0.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-falcon/python-falcon.hash | 4 ++--
 package/python-falcon/python-falcon.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-falcon/python-falcon.hash b/package/python-falcon/python-falcon.hash
index fb5d4dca71..f7d2d358cd 100644
--- a/package/python-falcon/python-falcon.hash
+++ b/package/python-falcon/python-falcon.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/falcon/json
-md5  062a6d925bdf9c0be791d736ab6b0e82  falcon-4.1.0.tar.gz
-sha256  dbc3fa642b43e7662f121d0a7b5d7ea42a1a31fb22ae63572c42ee3ecd1f79d0  falcon-4.1.0.tar.gz
+md5  d4d156864d62dfd93abc2fde90ad6fa0  falcon-4.2.0.tar.gz
+sha256  c13e86e49696d6655411fe09473c34997e49ff45e8cdf7576297b0ca71ceac3d  falcon-4.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-falcon/python-falcon.mk b/package/python-falcon/python-falcon.mk
index 91bcd1dd18..e6ad8f5d80 100644
--- a/package/python-falcon/python-falcon.mk
+++ b/package/python-falcon/python-falcon.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FALCON_VERSION = 4.1.0
+PYTHON_FALCON_VERSION = 4.2.0
 PYTHON_FALCON_SOURCE = falcon-$(PYTHON_FALCON_VERSION).tar.gz
-PYTHON_FALCON_SITE = https://files.pythonhosted.org/packages/90/85/a4abc8357f6bc6b6b0b3d80e2c319c895900c518a3528279a222d7a53b7e
+PYTHON_FALCON_SITE = https://files.pythonhosted.org/packages/ba/15/5a4d8d62e8b338d2ec4430965b51b592695e859d0c6bf104afa1ce927eed
 PYTHON_FALCON_SETUP_TYPE = setuptools
 PYTHON_FALCON_LICENSE = Apache-2.0
 PYTHON_FALCON_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
