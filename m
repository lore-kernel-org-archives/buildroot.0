Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89523C4708E
	for <buildroot@archiver.kernel.org>; Wed,  7 Dec 2022 14:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E455460F23;
	Wed,  7 Dec 2022 14:03:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E455460F23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0zvfIovAAS4c; Wed,  7 Dec 2022 14:03:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03B1C60EF2;
	Wed,  7 Dec 2022 14:03:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03B1C60EF2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B1EE1BF4D8
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 14:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE12F418A0
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 14:03:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE12F418A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8idX_3rf-qQ2 for <buildroot@lists.busybox.net>;
 Wed,  7 Dec 2022 14:03:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FAD84189F
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9FAD84189F
 for <buildroot@buildroot.org>; Wed,  7 Dec 2022 14:03:02 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id r26so24979357edc.10
 for <buildroot@buildroot.org>; Wed, 07 Dec 2022 06:03:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=23+XvUSYpLPvb5In3wkMTVztA99unfaHiPobIh0UGYw=;
 b=z7BiKto+Hk8Hoqu/K0raD4jV4DruJtb8FYaDTmi2b5DKorN4+LNye9oMRalOKEmTf1
 YUnaGoTbKGRN0FYSd3HjAagFs8BXzXERXQz11tsSxda9+a/DfQQUps3xnxzNHLbL1D0I
 22UnYsEo4ihRKl7+eybds+cVNXTqfjxIuArOTiFDfonruI5k7unUqQDje4gBUAMpUeUa
 QlQnCblrT+BCncRoWlFXFh1odZZF8FzvlYyqHVgMmBEmH5aEG45Hn4gbiZDU6f+jZ62Q
 sTlM7eQqKynKHogU0iPFenLIAyZADkGzA4C+lxDhYdt59OPbtM+KgkNT+iddWz8vsYM/
 WZVQ==
X-Gm-Message-State: ANoB5plTLJu0qBfEzWfgC7yOgY4dG7ckziDR0RX7sbMqJ/c4wrxb0qC2
 0O3ksBxTp0MCIHQirA4WuBr0q61Z0u8=
X-Google-Smtp-Source: AA0mqf4KP0SEnromo5w6CXplZGYGEztaiNmWtoIE7UGqLJWXqGnkWpMBvNwHpF40OqokPIzG7mDXdw==
X-Received: by 2002:aa7:db91:0:b0:458:bd09:1b20 with SMTP id
 u17-20020aa7db91000000b00458bd091b20mr82951741edt.176.1670421780441; 
 Wed, 07 Dec 2022 06:03:00 -0800 (PST)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 va13-20020a17090711cd00b007c09d37eac7sm8560716ejb.216.2022.12.07.06.02.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Dec 2022 06:02:59 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed,  7 Dec 2022 15:02:53 +0100
Message-Id: <20221207140253.20533-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=23+XvUSYpLPvb5In3wkMTVztA99unfaHiPobIh0UGYw=;
 b=YRX3736OX1gZsE6PaStrrNQP7XRFF4XPADoLRJn4f94lnlhTg7HutAK9eTKKjrdrR/
 acCZdJyaJhQ2gzv7+dQ0XFU2T3tZi6UBE43sajg3mvy0DoZG0BMDhxffBfadXtCnCSbK
 zK0qd86dofmHdZVI/Gz/oDoEinJNpBCGmUdHKjxIIpihGYMkqJGpuKxwV26hQIaslJOV
 lBzO62vVaglHvS31pf6xRWx9wgR/+QcNiHe45ve9EQQg5/b6UuNWpBpLikcc1AqF+uA4
 R0dtJ71UCC+vFsIMgm8/0I+uYS2YFe4DpHhZJBNmdlklMs80uoh6kR2xeypabX4lO896
 mc8g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YRX3736O
Subject: [Buildroot] [PATCH] package/python-dicttoxml: bump to version 1.7.15
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: Asaf Kahlon <asafka7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-dicttoxml/python-dicttoxml.hash | 4 ++--
 package/python-dicttoxml/python-dicttoxml.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dicttoxml/python-dicttoxml.hash b/package/python-dicttoxml/python-dicttoxml.hash
index d8c43d0144..de31782104 100644
--- a/package/python-dicttoxml/python-dicttoxml.hash
+++ b/package/python-dicttoxml/python-dicttoxml.hash
@@ -1,5 +1,5 @@
 # md5 from https://pypi.python.org/pypi/dicttoxml/json
-md5  ec5643a048cf32dad3c28db236b923e4  dicttoxml-1.7.4.tar.gz
+md5  234550e3aa875c6f3520aa9a2dff1ef1  dicttoxml-1.7.15.tar.gz
 # Locally computed
-sha256  ea44cc4ec6c0f85098c57a431a1ee891b3549347b07b7414c8a24611ecf37e45  dicttoxml-1.7.4.tar.gz
+sha256  5540fe7dfde2d2ed9467e67fcc981cbd2e164dc3120c862bdb7333202ac48838  dicttoxml-1.7.15.tar.gz
 sha256  4514114bd9da0b2fbf8c4fa264c0e6cc80fd41e6ac7f09d7a39a215662951c7c  LICENCE.txt
diff --git a/package/python-dicttoxml/python-dicttoxml.mk b/package/python-dicttoxml/python-dicttoxml.mk
index 537afff601..3e5f90e9de 100644
--- a/package/python-dicttoxml/python-dicttoxml.mk
+++ b/package/python-dicttoxml/python-dicttoxml.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DICTTOXML_VERSION = 1.7.4
+PYTHON_DICTTOXML_VERSION = 1.7.15
 PYTHON_DICTTOXML_SOURCE = dicttoxml-$(PYTHON_DICTTOXML_VERSION).tar.gz
-PYTHON_DICTTOXML_SITE = https://pypi.python.org/packages/74/36/534db111db9e7610a41641a1f6669a964aacaf51858f466de264cc8dcdd9
+PYTHON_DICTTOXML_SITE = https://files.pythonhosted.org/packages/45/b5/efa170fd88e8b8bc025c59592eade0fb7de6ae02ed3dd63957956adc1396
 PYTHON_DICTTOXML_SETUP_TYPE = distutils
 PYTHON_DICTTOXML_LICENSE = GPL-2.0
 PYTHON_DICTTOXML_LICENSE_FILES = LICENCE.txt
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
