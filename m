Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9770C001DE
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 13:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C0FD4177E;
	Tue, 25 Jul 2023 13:14:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C0FD4177E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oKBxMscHYxuW; Tue, 25 Jul 2023 13:14:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74FB9414E4;
	Tue, 25 Jul 2023 13:14:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74FB9414E4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8A0E01BF3CE
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 637B360E4D
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:14:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 637B360E4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4MSCH6oW_MSr for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 13:14:18 +0000 (UTC)
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4823A60BCE
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 13:14:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4823A60BCE
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-7869bcee569so206406239f.0
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 06:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690290857; x=1690895657;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=89H1hEaj+xd9D1S/1TrfEvuH6kBywbTcE81gxlmMe84=;
 b=krY4iJSNN/uP80vLglHFdaUVaLejuS2llfkjAFdGKpMd7QWXH482QdHhk4Z2F7KKJo
 F8xmVRJECLD3KNSiF3Mt8C3UhIlHlHOIy0MjOX+Zh4964JKzFFAg0iWYNzSj6xnlYU+5
 pOnytRJk9FBnjZPgtn+cMBDIOeQcynFSTwynz+ogTHvnMzAX3rMxbr5E/9fFG2puh4BT
 R/MTl2Pk1oaokV5VoP38v4ylmthKrVe8ZfkFCSTdf5nU2JHjw+PqW4xJqNmIojXaDSyP
 VFtjmKdQuEpj970cwMV+hg6TYFA6W9dXkb6EeGexrNIMz3juEMjwT/ujyfFPXDBOiXTL
 fFbw==
X-Gm-Message-State: ABy/qLa5C8dadIYbe6eAKWIVZxU+xgtKsAM/yQ0UjVDReqvPdPHiq2C5
 E/NdUD2EoBnQNLgbcMpCTksFTWwBgcI=
X-Google-Smtp-Source: APBJJlF7q67DcSyVSUn6a4hbvlrtnac3elF+ZXFRgy93Zz3Rp5KEjekIJ/P3tlFE5rHXMb7QrVTvAw==
X-Received: by 2002:a5d:8957:0:b0:786:26f0:3092 with SMTP id
 b23-20020a5d8957000000b0078626f03092mr3236536iot.3.1690290856740; 
 Tue, 25 Jul 2023 06:14:16 -0700 (PDT)
Received: from james-x399.localdomain (71-33-156-134.hlrn.qwest.net.
 [71.33.156.134]) by smtp.gmail.com with ESMTPSA id
 h2-20020a0566380f8200b0042bb09e9345sm3591434jal.90.2023.07.25.06.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 06:14:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 07:14:14 -0600
Message-Id: <20230725131414.129714-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690290857; x=1690895657;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=89H1hEaj+xd9D1S/1TrfEvuH6kBywbTcE81gxlmMe84=;
 b=P0V2nZ9VpMH1xkeRBStNfhPEYVA+KqizxLvetHJRCny5zko2weXuN+rQ17COtuxqk1
 IS+Q0JR1Pt7fZC6emydVjAC8skq/qvfs44QHJOJE/RQLtRt0rQ1FXOMCx7cDJijn8pmX
 F2ORVvu6TzYoSVdS13n3GqYCgRs84/h6GeXhTWRzycHeqp6+VDDpQZAPmVB7VE6DE9mC
 tv/shND4nhXTUV5deE8q+dppnr8KxPt9QwygfV2IOMo3HVwT+fV1K4pl/I9r9Tmt8yHC
 WQWiKlKU8MV3QJGeNvzCclNIe6ivCTbKHkm1MvPY8fX9Mv2iISl7HHp76vBM6mxBf2vP
 wZPg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=P0V2nZ9V
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp: bump to version
 3.8.5
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
 package/python-aiohttp/python-aiohttp.hash | 4 ++--
 package/python-aiohttp/python-aiohttp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp/python-aiohttp.hash b/package/python-aiohttp/python-aiohttp.hash
index 0f687c7827..ec8334b193 100644
--- a/package/python-aiohttp/python-aiohttp.hash
+++ b/package/python-aiohttp/python-aiohttp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp/json
-md5  8208bc4b519ac4520720577f93561855  aiohttp-3.8.4.tar.gz
-sha256  bf2e1a9162c1e441bf805a1fd166e249d574ca04e03b34f97e2928769e91ab5c  aiohttp-3.8.4.tar.gz
+md5  4bb59a17563df9a692c64418224ade12  aiohttp-3.8.5.tar.gz
+sha256  b9552ec52cc147dbf1944ac7ac98af7602e51ea2dcd076ed194ca3c0d1c7d0bc  aiohttp-3.8.5.tar.gz
 # Locally computed sha256 checksums
 sha256  9f80d0db7d755a941db4572172c270ecbd8f082ba215ddd095985942ed94a9eb  LICENSE.txt
diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index 72fb34fd25..50b8268070 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_VERSION = 3.8.4
+PYTHON_AIOHTTP_VERSION = 3.8.5
 PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
-PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/c2/fd/1ff4da09ca29d8933fda3f3514980357e25419ce5e0f689041edb8f17dab
+PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/d6/12/6fc7c7dcc84e263940e87cbafca17c1ef28f39dae6c0b10f51e4ccc764ee
 PYTHON_AIOHTTP_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
