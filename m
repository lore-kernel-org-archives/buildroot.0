Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB3ECAC592
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 00:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01FD060DA0;
	Tue, 16 Sep 2025 00:16:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MPubFGIm6KWP; Tue, 16 Sep 2025 00:16:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C853460D9E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C853460D9E;
	Tue, 16 Sep 2025 00:16:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D58F0199
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 00:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBBB4408E0
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 00:16:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P8P-3H8M7_WV for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 00:16:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F28C9408DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F28C9408DF
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F28C9408DF
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 00:16:49 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-8877b60f7a5so162959939f.3
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 17:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757981809; x=1758586609;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6jyYHYs1zJzGNKonlXmUcv4MzQG4KUla/iox01g0BWM=;
 b=XtZHvFA22SJzUbfJIN3v9dCTKJoO9YxfCImdpPzp1SKAfsAzc+PPSEOVmb9bM4HvkS
 j35AZuAGAnHanUOB2W3928bW4UOw9hb4gtH79fuOGyY1Sm5yZrgNZfjdkKWapAz2gwZc
 p3UA81QnxvFWj6wVJi1F1KRFcz/RKfi2gfY5jQbzGH9c0YDpTijGTIFaV2oqcHpquKcT
 HVMs9o/rIewDU/e9IBXaxSWI9LyyOgE3ob2wyl0K3NzTtxaMfHuyRp/9VF8p7eGuylLm
 oaL0DSclJ0gmtiMRTtd8XYRWawHKHhs4FEZ1I7Ap5MV81huhMiiCkivyA9vgSxi42kOv
 cM0A==
X-Gm-Message-State: AOJu0YwduNJ9dMl5kaQikMTrXCuBHFEBt9IAomE+unWhL2P35U9RcGQ3
 N4en/kgYvXHiJfMdY5BP5Nps3LNiyE8hGOYi//9uGAQiWyIhMS6lGWUn+50yyw==
X-Gm-Gg: ASbGnctlKUK5tFbm/vWe7kl+e9xIwX6ia5De/350JHqIeiNW0/FMLVobv2L95nxZ5Pn
 AN7iZ+hESbr4YGwZzmIV/y4VuuVqSfl3PGhKvyiuLV3sJTDDmrofPjitFuL6bgxOM1s5/RbaeBY
 LZN3sahZpVkyRjJzfbXTmOLRQkxRIJcvqZbnfDYVOM/tw7URzXEC5zw/WOPVUlusEDOxLpJaHvL
 9m+lsh/IijcXMcC3jxI9j4F+1Yi/TGfCpm1MJKIizoiL2j7bLSn6pIibJdWSArj1T/rywdHVzdx
 /Vd6sjsBeHMTtq0ML+oOO6rbeOH+yfTYopCUg6ksJZVj75o3iQej4goIUcqvsCpKpiRmVlWhMYI
 2vJgENUQH6IaFDvvRAYo/5Mc6Cfjo2x+ZYEWVdu/k3tWo1jUt3WDNKYk8208d3/PCNPJ9JsbIeu
 fX
X-Google-Smtp-Source: AGHT+IFfMp0aI0XbpgQik49G7Vw1ot9x4m/pBmm4l3x3rHu1Pt+3mKajv4AO23ATTyqNrRBBRBGHtg==
X-Received: by 2002:a05:6602:15c8:b0:887:5c98:dd73 with SMTP id
 ca18e2360f4ac-890352a9882mr1556871439f.15.1757981808631; 
 Mon, 15 Sep 2025 17:16:48 -0700 (PDT)
Received: from james-x399.localdomain (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-88f300980f8sm522299839f.28.2025.09.15.17.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 17:16:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Sep 2025 18:16:46 -0600
Message-ID: <20250916001646.2480518-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757981809; x=1758586609; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6jyYHYs1zJzGNKonlXmUcv4MzQG4KUla/iox01g0BWM=;
 b=jFi8hmzrwJIXf0BlhWIdu9vbunhQo1HTOGDOwI7aN7t8WLzMhkizIsXFZPJhI+KBCj
 Ek6QPxDu3gw3tvByvoBi4cwON7z1DzpkkEnpdWwhcE4M72E3YaSjjY+nX3N4u1ucMfvL
 dGx49YyH6043J1668Egio6gcquujo52J2evpzDquq9n3hciqCSEn9jw8aJWNCk8/0K/h
 jMG0QS0y58Yv1jETKANSG/cSAGifbW3PzEHH8GKjDs1U8V1GsnraMvXY5o3eTqqR8iEA
 J4fmt4alBV2fpSUMQkt6At6cLIROkvnHC/H7/PeL8Bna9wZv7WM1OgndfUIKzznJf7lh
 CSzQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jFi8hmzr
Subject: [Buildroot] [PATCH 1/1] package/python-multidict: bump to version
 6.6.4
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
 package/python-multidict/python-multidict.hash | 4 ++--
 package/python-multidict/python-multidict.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-multidict/python-multidict.hash b/package/python-multidict/python-multidict.hash
index 3230ac9b56..8a07c29cc6 100644
--- a/package/python-multidict/python-multidict.hash
+++ b/package/python-multidict/python-multidict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/multidict/json
-md5  2c8cf03b6e92e1b9c335de56b606c2fc  multidict-6.1.0.tar.gz
-sha256  22ae2ebf9b0c69d206c003e2f6a914ea33f0a932d4aa16f236afc049d9958f4a  multidict-6.1.0.tar.gz
+md5  479587db63b5fe7f74a921b51bdbd371  multidict-6.6.4.tar.gz
+sha256  d2d4e4787672911b48350df02ed3fa3fffdc2f2e8ca06dd6afdf34189b76a9dd  multidict-6.6.4.tar.gz
 # Locally computed sha256 checksums
 sha256  93d11a968e2f0f36373c40811ff6d20e173f58c3cab5884cd6617bbfd795492a  LICENSE
diff --git a/package/python-multidict/python-multidict.mk b/package/python-multidict/python-multidict.mk
index 6b952244bc..551fbd0ac0 100644
--- a/package/python-multidict/python-multidict.mk
+++ b/package/python-multidict/python-multidict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIDICT_VERSION = 6.1.0
+PYTHON_MULTIDICT_VERSION = 6.6.4
 PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
-PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/d6/be/504b89a5e9ca731cd47487e91c469064f8ae5af93b7259758dcfc2b9c848
+PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/69/7f/0652e6ed47ab288e3756ea9c0df8b14950781184d4bd7883f4d87dd41245
 PYTHON_MULTIDICT_SETUP_TYPE = setuptools
 PYTHON_MULTIDICT_LICENSE = Apache-2.0
 PYTHON_MULTIDICT_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
