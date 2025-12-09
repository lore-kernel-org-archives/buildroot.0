Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C736D3B992
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 19:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54CCC8446A;
	Tue,  9 Dec 2025 19:44:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UFUUq68wP0KP; Tue,  9 Dec 2025 19:43:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DAD78446B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765309439;
	bh=pSo+iuVdXdmkPVc+Ly4B48JaT5WDXjHNfRxaXzS4yKE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=f62jLMTibQhQf8otnPGpa1yH4jcuJkYi/VQzJ+7kmeZZWFW7g/FKNiejuZJyU2RBg
	 gjzgEjKPqTrxLUJb/abB4ZxpOAqR5jm9lXbO4ngoHb/R9zmEbvzN0EkQQQz1+Dyk8/
	 4KHI47Fe0INHqRmasO8hu4G3jwW4zH0SAZqxUrJJknUoeT5dUxJlcS+EUA/et6GYag
	 6AxTFvumM0z4+RrUH2089nDDxvaavrG/hO8vUZPoNO+jNRjvIO21LToDyO+RfwmT9R
	 FrNFCVU92mCKv8JpOuW/qCmShJrAUsB1wx5Fkm8Os7cF91mfZarrXSEmsEQz2DEsp8
	 Z2TgiL3eTzWMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DAD78446B;
	Tue,  9 Dec 2025 19:43:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 53CC8E7
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3AE834026F
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:43:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XnUMrwp8Y9PX for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 19:43:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 37D51401EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37D51401EB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37D51401EB
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:43:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C0FB9A4C2CDD;
 Tue,  9 Dec 2025 20:40:16 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45534)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vT3Yv-000000006DN-22Eo;
 Tue, 09 Dec 2025 19:39:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  9 Dec 2025 20:39:41 +0100
Message-ID: <20251209193951.1000100-21-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251209193951.1000100-1-bernd@kuhls.net>
References: <20251209193951.1000100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765309216;
 bh=UTWEqL7xTtGolCMTOD8EtKxmeJeBkPIyfI6wSLsy/1w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=HuQCe6KkYGK3dPTutp7V7OTbOwGta01agdHfyJIXjxucLAtmATzaxRU+q+yL3MpkZ
 8axwWz8qsFfaIpJvJeiMhKU2slIGBaTXQ31woAAMitZRNHH8+t6nD4L8CqwcmwCMV/
 vL42qCwQKzr4QSDMZtQC5BvcT3HFu9CTl/CbJbwZ008gjBBsbV13koFDJUceN7XtQF
 LgquM2UQr6xawefkJz7LEemsMBLZIA2hzdYSlstCoF5F6XJ6piMuw314AGlQ0GfBJt
 s99dqv5cOptJL6b03w37rxW4ZDVBoXRfh2gT0iCEAVFGwS3/BGKZj6gdn0IpQHB1E9
 oSCk+BVQC3pow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=HuQCe6Kk
Subject: [Buildroot] [PATCH/next 21/31] package/python-bleak: bump version
 to 2.0.0
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Graeme Smecher <gsmecher@threespeedlogic.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Mauro Condarelli <mc5686@mclink.it>,
 Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/hbldh/bleak/blob/v2.0.0/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-bleak/python-bleak.hash | 4 ++--
 package/python-bleak/python-bleak.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bleak/python-bleak.hash b/package/python-bleak/python-bleak.hash
index 2213ec2f70..b3388d1917 100644
--- a/package/python-bleak/python-bleak.hash
+++ b/package/python-bleak/python-bleak.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bleak/json
-md5  261eb442ba16707ed00a21265cd337fc  bleak-0.22.3.tar.gz
-sha256  3149c3c19657e457727aa53d9d6aeb89658495822cd240afd8aeca4dd09c045c  bleak-0.22.3.tar.gz
+md5  e2a443b2d5f9671ff33ef632051b8c8a  bleak-2.0.0.tar.gz
+sha256  a8043fc0f3af1a00a84963824195463ca39789ae4f6804d3d7b1423e6083254a  bleak-2.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c4029a2b63b3824ab68be841f414addbdde20cb79cdbe272fa80c0b2abe65374  LICENSE
diff --git a/package/python-bleak/python-bleak.mk b/package/python-bleak/python-bleak.mk
index f47440388e..4aee0e95f4 100644
--- a/package/python-bleak/python-bleak.mk
+++ b/package/python-bleak/python-bleak.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BLEAK_VERSION = 0.22.3
+PYTHON_BLEAK_VERSION = 2.0.0
 PYTHON_BLEAK_SOURCE = bleak-$(PYTHON_BLEAK_VERSION).tar.gz
-PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/fb/96/15750b50c0018338e2cce30de939130971ebfdf4f9d6d56c960f5657daad
+PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/ce/cb/20f3dd0498a820278c7078dce786676d18342721a3723591d5853323b363
 PYTHON_BLEAK_SETUP_TYPE = poetry
 PYTHON_BLEAK_LICENSE = MIT
 PYTHON_BLEAK_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
