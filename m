Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9551D3B98F
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 19:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84D12401EB;
	Tue,  9 Dec 2025 19:45:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lHlYYEALX_ml; Tue,  9 Dec 2025 19:45:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9B784026A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765309524;
	bh=7T/eh1HSILdkDwdJ8lvhiYGhblMjw2Amx2Kv2WEIqIw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ZJ2Nk/I/HSC6+aZQG/bxflVe/MvuXoqWjwX2VvJdPnIVfndgkerd0zznW+lbbDrvZ
	 Wc/IE6iUJ9XX4lymidIKEUCsa9RrgK2dTRGGfF1pYMJy76vI9l1DJZxjM33TerEJC+
	 kvFITuZF0RSi56GDX/YDpB/IFbh6+VWemW9J3JqJhh8P7/tUvWDlCnEU7ahxNjEC14
	 UohUTTrSoI0eG69BCstb1CvqtlviL5bdu44pIboDEE4t9Gb1muSju7MlC5x29G+/Q1
	 lTPPZGoNbScPjTmxcmLqRKYveLyeQnRfgHNgSqk555IhCOx/EWdjxXA9oiGnrcw5yp
	 0JMu6gmv32btg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9B784026A;
	Tue,  9 Dec 2025 19:45:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 49DB32C0
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 306F98417B
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:45:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xq30WsVxK8mR for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 19:45:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1A0EC840C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A0EC840C6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A0EC840C6
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:45:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7805FA4C2D1C;
 Tue,  9 Dec 2025 20:40:18 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45534)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vT3Yv-000000006DN-40eS;
 Tue, 09 Dec 2025 19:39:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  9 Dec 2025 20:39:48 +0100
Message-ID: <20251209193951.1000100-28-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251209193951.1000100-1-bernd@kuhls.net>
References: <20251209193951.1000100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765309218;
 bh=6CB2SX2RxxYcexOxQZt62ETkk1aiMY5aUSPZUBz/MEo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=VnLRoc/RRxHnTA22Ndhyl5c7rxPxvPSG8NopD0Dv8OwEnBrHbXZ7kOS9IvD1Gx6b1
 rq1gK2+Kec6SvOZLU7oDEuUnHld5aFpRjCkuVhjbXLvCr383nEi1Pr5diZNGoQ7BMc
 Td8pVyp2a2RD1XKaW3lrCyN+MlPpuFYg1nZJyPjpnvaWibHjPf/KjDlE2g4Tg7BBjS
 WdSoxygi5JujZTSDPm1fc001fY7fDl01gA+xmiksR0tLbHwb5VBoOvJr6RoSUrpdJr
 ff0mQdhjT3tNaVg3JQJmn//P9MCgxqBqrBZqOg+oyl5ScKSssNMqILofLtA4fRI4CJ
 wkhmMsAaIUD+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=VnLRoc/R
Subject: [Buildroot] [PATCH/next 28/31] package/python-channels: bump
 version to 4.3.2
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

https://github.com/django/channels/blob/4.3.2/CHANGELOG.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-channels/python-channels.hash | 4 ++--
 package/python-channels/python-channels.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-channels/python-channels.hash b/package/python-channels/python-channels.hash
index 8b402cdcd2..712a0979d9 100644
--- a/package/python-channels/python-channels.hash
+++ b/package/python-channels/python-channels.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/channels/json
-md5  f1c7e533a0afa026b61dd3cf228dbd18  channels-4.3.1.tar.gz
-sha256  97413ffd674542db08e16a9ef09cd86ec0113e5f8125fbd33cf0854adcf27cdb  channels-4.3.1.tar.gz
+md5  971656fda3f92ea559428c61506eecf5  channels-4.3.2.tar.gz
+sha256  f2bb6bfb73ad7fb4705041d07613c7b4e69528f01ef8cb9fb6c21d9295f15667  channels-4.3.2.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-channels/python-channels.mk b/package/python-channels/python-channels.mk
index cafabf2676..77b2ea8def 100644
--- a/package/python-channels/python-channels.mk
+++ b/package/python-channels/python-channels.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHANNELS_VERSION = 4.3.1
+PYTHON_CHANNELS_VERSION = 4.3.2
 PYTHON_CHANNELS_SOURCE = channels-$(PYTHON_CHANNELS_VERSION).tar.gz
-PYTHON_CHANNELS_SITE = https://files.pythonhosted.org/packages/12/a0/46450fcf9e56af18a6b0440ba49db6635419bb7bc84142c35f4143b1a66c
+PYTHON_CHANNELS_SITE = https://files.pythonhosted.org/packages/74/92/b18d4bb54d14986a8b35215a1c9e6a7f9f4d57ca63ac9aee8290ebb4957d
 PYTHON_CHANNELS_SETUP_TYPE = setuptools
 PYTHON_CHANNELS_LICENSE = BSD-3-Clause
 PYTHON_CHANNELS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
