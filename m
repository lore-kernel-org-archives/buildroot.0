Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F35DC433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 00:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3E4960E6B;
	Thu,  3 Nov 2022 00:54:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3E4960E6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e9CxwM49AgOc; Thu,  3 Nov 2022 00:54:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02BF260AC0;
	Thu,  3 Nov 2022 00:54:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02BF260AC0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B80A61BF95F
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 00:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 939C360AC0
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 00:54:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 939C360AC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NbLm9aOTPwFO for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 00:54:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C5D660AA4
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9C5D660AA4
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 00:54:22 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id o65so212016iof.4
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 17:54:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p9FbuAW1NGhK2EiXnrLE50LVMfXhmUIYdD2GWK7Q1Xc=;
 b=yABfcdLzwRpe5Zd2p9cWiVvgKpuckcX6KYX+W60BBGjViaR2a9/OKofnB1ESGduwCj
 1u4y8qniH4hXH6Afyxo47jWhjRp9jhwsTRjgyBzoVt6W8w/KgDKCygd64RtdS8ckpqLV
 J3BqnmJGo6BUBWreSw5xKLDLPH+Izd2pKzBv7HbcLJJIoVIkejTqaZz7krk+7IShhDlH
 ChKsXqItzWGOBWPgok+K22oT8rIB6J4ULAArhmDLbo0SUAmUxF1etURfRZb802JhonAg
 1EzvNZ6Apie7gmpF5/yvDtvb17uBEExQ6bXScFdCiudbknnzXJM3KX4c8SdVjFddfWSJ
 eIgg==
X-Gm-Message-State: ACrzQf07Wc0ci17Q/c1yt6dUrwrKP21dZOMWhtPm1Vjcr/QrfGjz43Mf
 9ttNzvTjw2AuXqeth2G2/KpQu02cCM7AGQfK
X-Google-Smtp-Source: AMsMyM7O3xh904g8fXdjdh4vg5mpJ3xvdYsZU4uk1pdwbS4yuA9N75gUUon6RFCBqqP8hCxV2e76PA==
X-Received: by 2002:a6b:ba83:0:b0:6d3:e190:5abd with SMTP id
 k125-20020a6bba83000000b006d3e1905abdmr6104921iof.188.1667436861293; 
 Wed, 02 Nov 2022 17:54:21 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 f24-20020a022418000000b0036ce87bfd0fsm5252995jaa.98.2022.11.02.17.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 17:54:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 18:54:18 -0600
Message-Id: <20221103005418.206715-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p9FbuAW1NGhK2EiXnrLE50LVMfXhmUIYdD2GWK7Q1Xc=;
 b=T2TEKbeDAvloZjK+CW+hFWOMPZ9cgRzgHMa5fod6KaDjrR6ZyMcYCKbXL7fmuguf92
 /fehe5vYju7q7DnKlIjox3x0gLm6cddn+M9S0XJUfbMXRuNJ9xDHX153ZQR5InrV2VOo
 NRrhp2MB0SeDOPSrWGwy8FabfCiTADbZFHlTiCmzNYwJeOPBhzQFXbsv7KWdgnbwnoGd
 CIn1NTIiTvAh0IfOQruyIhfRpQtmCF8mfpR26i2SMB9K0DVwZ2Y4c/vqTz393viES8jm
 pmOJcuZUEBKOqhXK5cofst7Idy9XV4m+4mRzvc2OXPRjCuU3gQa8bUoWFGy59JYcco9b
 g03w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=T2TEKbeD
Subject: [Buildroot] [PATCH 1/1] package/python-orjson: bump to version 3.8.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Graeme Smecher <gsmecher@threespeedlogic.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-orjson/python-orjson.hash | 2 +-
 package/python-orjson/python-orjson.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
index 1de1d7cdc2..5bc5433123 100644
--- a/package/python-orjson/python-orjson.hash
+++ b/package/python-orjson/python-orjson.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  285091518bdbde8086c60c5ed6d7090eccc1c232b00138c964c410f1a7da654f  orjson-3.7.11.tar.gz
+sha256  dc7a9ae16562ddf3589ef7cbdf122a26f845dae919d8ea9679e0fe4c9be69b3a  orjson-3.8.1.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
index 0a266e827a..00be3f1f4b 100644
--- a/package/python-orjson/python-orjson.mk
+++ b/package/python-orjson/python-orjson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ORJSON_VERSION = 3.7.11
+PYTHON_ORJSON_VERSION = 3.8.1
 PYTHON_ORJSON_SOURCE = orjson-$(PYTHON_ORJSON_VERSION).tar.gz
-PYTHON_ORJSON_SITE = https://files.pythonhosted.org/packages/fd/52/42520dbfd47191977140c49fa601624b9b4c6cc9d6a62d3e68970ee9eac6
+PYTHON_ORJSON_SITE = https://files.pythonhosted.org/packages/d0/e6/d012626dcf443e36ac1210be365d0a367beff7dd8b7029ace3006c948820
 PYTHON_ORJSON_SETUP_TYPE = pep517
 PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
 PYTHON_ORJSON_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
