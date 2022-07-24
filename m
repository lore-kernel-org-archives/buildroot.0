Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0D6C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 02:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59BA942431;
	Sun, 24 Jul 2022 02:22:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59BA942431
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bYM2_eTM_pl4; Sun, 24 Jul 2022 02:22:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDBD04187A;
	Sun, 24 Jul 2022 02:22:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDBD04187A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4EE511BF4E7
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 02:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2611E40374
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 02:22:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2611E40374
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 30ZvVySmdNov for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 02:22:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E06E540156
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E06E540156
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 02:22:31 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id x64so6349142iof.1
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:22:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jIX3qyHV0IwQdLAJPSXUM/sJ4cgBOTBGNottNgs7+8w=;
 b=7nETJra8sAl2O1vLem1mgRPrRUmUN3C+M8B2xq7uymPXGjvskGfvMo9NPIV25dqhtu
 L3k47O27sQDr6vV8eEaYD7yalZPws+bm8oJEHlwAMecS85RnUiuXVcYY1QeotqZWhNKI
 krhcMACyJScKytadrsI/LT2B+i1fkR2QKHjlkWhoaDIUhZgxN1Obofbnm4XlZi0+tX2s
 YCn/1DS5R5RmtnOwtP4+KwOc6xWvsWP5hRz92Wv1ISmc0XI00S0w7ArRu38MZYpJPnbJ
 2ly8rB9CeRLrFlx1toTg/AND/NUSvXsDUnDMc5DlSx13TSA1qrWmA4qTiEcP2rznIToR
 RSbg==
X-Gm-Message-State: AJIora8QusIV/6luIw+/QgAOTkUJE0MHbbH8tmBX2ZCMBEhePNcKI6YZ
 SaXCwyeyokDKEXJfB4ZO3acSx8xlUG/aHg==
X-Google-Smtp-Source: AGRyM1sTyisJAmPoJTbBg7B6IyhNcs7Wy2+wN4RcUyiPHyfZ3KwiVzHGPlKX8qMFla771m1/Qgbg1g==
X-Received: by 2002:a05:6602:2ac3:b0:67c:65e:8ec1 with SMTP id
 m3-20020a0566022ac300b0067c065e8ec1mr2235765iov.188.1658629350786; 
 Sat, 23 Jul 2022 19:22:30 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-32.hlrn.qwest.net.
 [71.33.133.32]) by smtp.gmail.com with ESMTPSA id
 o17-20020a056e02115100b002dd0ba40abdsm3330524ill.18.2022.07.23.19.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 19:22:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 20:22:17 -0600
Message-Id: <20220724022217.1017818-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jIX3qyHV0IwQdLAJPSXUM/sJ4cgBOTBGNottNgs7+8w=;
 b=UHVl+QPJpQCO1SxZXJf/22F5/T1IGqfBf/kdqguJ3/WQr4ePSsqC8eFTSPmsmtFP+T
 0fqYxaxLoiYsVyItcDYHfZEf8e5oZoPH99KPkW31qDh2J4dK27cXwEQDbJfUX2Hs0QfW
 Y+BNnhMyWNVzDYq6GLmIvTEuX44vLximVQD7VaKxpImNoB/qzz0zGlJyJokQjI3q7CCR
 Gmo5LgyDP6I6Xq0904GxZtB8h++81k0mT/fduyMSMOVRxkNrBA+SxZ5qdlzcEEneq9fL
 P1SGploqxqKVs2T1LlOa0e/7cAdhCPf7bUSNPhWMYJx4tdTLuTNFl1W3gKiFKHevWl8a
 RV8g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UHVl+QPJ
Subject: [Buildroot] [PATCH 1/1] package/python-cffi: bump to version 1.15.1
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
 package/python-cffi/python-cffi.hash | 4 ++--
 package/python-cffi/python-cffi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cffi/python-cffi.hash b/package/python-cffi/python-cffi.hash
index 41565f9a62..ae7f9a477f 100644
--- a/package/python-cffi/python-cffi.hash
+++ b/package/python-cffi/python-cffi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cffi/json
-md5  f3a3f26cd3335fc597479c9475da0a0b  cffi-1.15.0.tar.gz
-sha256  920f0d66a896c2d99f0adbb391f990a84091179542c205fa53ce5787aff87954  cffi-1.15.0.tar.gz
+md5  f493860a6e98cd0c4178149568a6b4f6  cffi-1.15.1.tar.gz
+sha256  d400bfb9a37b1351253cb402671cea7e89bdecc294e8016a707f6d1d8ac934f9  cffi-1.15.1.tar.gz
 # Locally computed sha256 checksums
 sha256  04b80f5b077bbed68808cfebadeb5e3523f2a8c9a96495c587bd96df1eac2a33  LICENSE
diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
index 83a21cb75a..c1fcfda5fe 100644
--- a/package/python-cffi/python-cffi.mk
+++ b/package/python-cffi/python-cffi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CFFI_VERSION = 1.15.0
+PYTHON_CFFI_VERSION = 1.15.1
 PYTHON_CFFI_SOURCE = cffi-$(PYTHON_CFFI_VERSION).tar.gz
-PYTHON_CFFI_SITE = https://files.pythonhosted.org/packages/00/9e/92de7e1217ccc3d5f352ba21e52398372525765b2e0c4530e6eb2ba9282a
+PYTHON_CFFI_SITE = https://files.pythonhosted.org/packages/2b/a8/050ab4f0c3d4c1b8aaa805f70e26e84d0e27004907c5b8ecc1d31815f92a
 PYTHON_CFFI_SETUP_TYPE = setuptools
 PYTHON_CFFI_DEPENDENCIES = host-pkgconf libffi
 PYTHON_CFFI_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
