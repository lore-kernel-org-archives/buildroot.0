Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27186C433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 17:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A409460E8E;
	Wed,  2 Nov 2022 17:34:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A409460E8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 67urBg_zHnv8; Wed,  2 Nov 2022 17:34:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C89F160B5A;
	Wed,  2 Nov 2022 17:34:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C89F160B5A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 94B0F1BF294
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 17:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CAA760B5A
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 17:34:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CAA760B5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YNoi0dMDIzuv for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 17:33:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1297C60A7B
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1297C60A7B
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 17:33:59 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id 11so15654259iou.0
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 10:33:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CA1hGCzLI/7RIzXIdNntm9zaUWjrI/1Tw3JhZZS5XTM=;
 b=iwV5RcTJErJY/ZXbs/f4lNJLnhomLi0SV2fYl1bcaosgk5VYtngLYxYBFYyxUwcQAG
 4MTwmyUdFj72uXPoihX6tdONyiZ5QU1ZXh/S2WfCgYGLvg3YEpvuFseEOSFP/djOXFjg
 qQYQt0lPe6k2rZ2PuvDkn6wOrUBS+oFUWSkYHMjsMtm8ZAD3ZbWkEq5boqtz2psmaLKk
 dVIU4nfxxJ+X/cNzGLcPuO7dAlqut27qFbJK9Pvj6Xev6fAQUJPKygAyahJU5FXUpmhI
 PlPVImVYWRv4vjz911FaSNvJotSKYGVBWED7BEPU+dYh7GAUiVI3PXDZeuUVe2wNM6e/
 /lFA==
X-Gm-Message-State: ACrzQf0fziASCiWhX8aIhsuSx0Qsr3CpanCMykamy20HA6fkS1bJZ15n
 UqRSq09j/9jJGzQ1RiB/sJPakzlbgxp8TQ==
X-Google-Smtp-Source: AMsMyM4L9Iu8ED0zAqhby3JJBoNT/Eu4sULIuXv27HsLQQhOdzDB2T+EVLAJeyu/BgDcLTVWhyXHHQ==
X-Received: by 2002:a02:cd14:0:b0:375:6a54:eb99 with SMTP id
 g20-20020a02cd14000000b003756a54eb99mr9400901jaq.151.1667410437821; 
 Wed, 02 Nov 2022 10:33:57 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 b3-20020a05663805a300b0036fdc9ef995sm4992209jar.92.2022.11.02.10.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 10:33:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 11:33:55 -0600
Message-Id: <20221102173355.1423323-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CA1hGCzLI/7RIzXIdNntm9zaUWjrI/1Tw3JhZZS5XTM=;
 b=pBRksuy5TkHA4+PEaX2LnB6yYfqHtz3iVxs3O2H/MkYkPzvG1hQX7Maw8phmxL58+y
 7ke3RJZwUW7c4xxoa1eoCm3jA2ulTnB84xJv2dG6UTTRnmze3SJWrrJV7PsU81EHIjBX
 Njyuyu4GLLJSSD7lQt6fAMJr5N0NKfkev+TYc5il7rysnOq05b9bE1guoaz9mqg/7lmi
 +mmt6LH/Gvc5LFNBhbxtIJuitLlVTlZCb0vufkRucwGGMzTZdtYjLTAL1Na4XvkI+iX+
 LkJa5slLpgS81HNiE1nm+1FjKHGVJRjX+e8l1XcrZIS/KwbV2Y5hoW/Lrp+f4WOpUV02
 uwvg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pBRksuy5
Subject: [Buildroot] [PATCH 1/1] package/python-aiocoap: bump to version
 0.4.4
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
 package/python-aiocoap/python-aiocoap.hash | 4 ++--
 package/python-aiocoap/python-aiocoap.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiocoap/python-aiocoap.hash b/package/python-aiocoap/python-aiocoap.hash
index 6357a87931..176b3d22c7 100644
--- a/package/python-aiocoap/python-aiocoap.hash
+++ b/package/python-aiocoap/python-aiocoap.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiocoap/json
-md5  c5809dfb02be8784ec17897380009052  aiocoap-0.4.1.tar.gz
-sha256  c47c9d19a98699f27707186871b7c84f4a7016fe4fbb5bd300f809ae456f8a55  aiocoap-0.4.1.tar.gz
+md5  218178420e8fc3581001f52eb726b016  aiocoap-0.4.4.tar.gz
+sha256  9d7c9626cbc4dc24a91c6b8694cbeb834e376ab7e20e4137609380f726a9540b  aiocoap-0.4.4.tar.gz
 # Locally computed sha256 checksums
 sha256  2bb211d412a6bfa4b2a9cf01123c7fe90e5e6185938896e23ab07b84f8494180  LICENSE
diff --git a/package/python-aiocoap/python-aiocoap.mk b/package/python-aiocoap/python-aiocoap.mk
index c933d27b23..96d8619a84 100644
--- a/package/python-aiocoap/python-aiocoap.mk
+++ b/package/python-aiocoap/python-aiocoap.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOCOAP_VERSION = 0.4.1
+PYTHON_AIOCOAP_VERSION = 0.4.4
 PYTHON_AIOCOAP_SOURCE = aiocoap-$(PYTHON_AIOCOAP_VERSION).tar.gz
-PYTHON_AIOCOAP_SITE = https://files.pythonhosted.org/packages/67/1c/6d6764010a4779d61bc7241afa663b368261c72af20555b26efc875d4276
+PYTHON_AIOCOAP_SITE = https://files.pythonhosted.org/packages/6a/7c/139993da8dcdfc86446ee6df65b98c68e40c5fcb0caeff3a6b348d9f7d6f
 PYTHON_AIOCOAP_SETUP_TYPE = setuptools
 PYTHON_AIOCOAP_LICENSE = MIT
 PYTHON_AIOCOAP_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
