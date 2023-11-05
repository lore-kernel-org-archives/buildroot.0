Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA208C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 02:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52E0360DFD;
	Sun,  5 Nov 2023 02:16:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52E0360DFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a_LZRHstJ5K8; Sun,  5 Nov 2023 02:16:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 866F960DF9;
	Sun,  5 Nov 2023 02:15:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 866F960DF9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BB51D1BF59E
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 02:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93F6B60DF9
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 02:15:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93F6B60DF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zytGSn1zIxia for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 02:15:56 +0000 (UTC)
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6971660DC6
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 02:15:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6971660DC6
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7a67b9cd230so124190839f.1
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 19:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699150555; x=1699755355;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=leYtp2wkEBVtLwp+hTnL3rPSPfT9IuyH3cScofklc+E=;
 b=q4XaIIBNVSuCY2OJhB56fX9rRJLEuM/uTJzNiV0cJIjSv/bvYeHRvT+S/GZGmjO98A
 THKQMFq0B4pdiLCZfb7icyNNLP/Y+oGSPZEbQe83NA+guX3/qFzRQM9u9TZodsrfVl4c
 sbOt9JGvt69MHHDoLtqeP65jo5YK8LcTlT9QsOMF5eV1zwdQ+HrkUe4EO274ZNUd207k
 G4HEEI7voy7215bCt96ZnmLIiG1EUHFo25P1EZgiL2USF7fkMkbjwa0SliEpoBQvGtJ6
 6oS1cRXezWkf3CK2oW9BkRcPmPYY5OfcTMQHDusbc0t0ArjLlg/mpIvK088Iznu/JpNr
 DNIA==
X-Gm-Message-State: AOJu0YwfzfI3pi5Aa17xnA38GKTHnTP9nd8Ckznz9mVGE3VK983bPXTo
 c0oM1U1BSNWQM0UAy6pf5YuUiF/bLXI=
X-Google-Smtp-Source: AGHT+IGbnm99Ow7dFG4XWPaWSlF4UjaX+EheINXHyN48Me42k8xc1o/TBan6ICmOiyNaU9X+V1rR1g==
X-Received: by 2002:a05:6602:1592:b0:7a9:a9c6:d6b2 with SMTP id
 e18-20020a056602159200b007a9a9c6d6b2mr35538091iow.16.1699150555081; 
 Sat, 04 Nov 2023 19:15:55 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 n11-20020a056602340b00b007a66df53f71sm1538803ioz.38.2023.11.04.19.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 19:15:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 20:15:52 -0600
Message-Id: <20231105021552.2741273-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699150555; x=1699755355; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=leYtp2wkEBVtLwp+hTnL3rPSPfT9IuyH3cScofklc+E=;
 b=cImyVZhLRJ34P0a10HZwohKLRqNjTB2AGHtzi09Oij+/XdJCXAEnHHy42V+vtZbXzy
 1j9YEx+cSqLXgIl9WimjNxUhJdT/H6plGjnnZSEvZ4v199OXfU/XfRUFOr7vyYS0asMQ
 2XlxmpvQV73/MypH0b/alDeb4ygCw6KP0J5LJuTh+hNHC/V+zgClgPMtMyBVA0sQRNVu
 u6YYOV5V969RXVafL8Q1IvOlAceOtBS6Sup5olbqGlyAls18B44Vc/QItFDGiQN+tZP3
 1K3vEZqNob1wh9/AfDF5792432I8PzIEOJ7mewyxxOpwPpSR5xiqalTXsiKbIVchVMA6
 aYew==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cImyVZhL
Subject: [Buildroot] [PATCH 1/1] package/python-boto3: bump to version
 1.28.78
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
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-boto3/python-boto3.hash | 4 ++--
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index eae5081f34..253a9de85e 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  212358fb8b9cbea44a63ab9185c628e8  boto3-1.26.115.tar.gz
-sha256  2272a060005bf8299f7342cbf1344304eb44b7060cddba6784f676e3bc737bb8  boto3-1.26.115.tar.gz
+md5  12a1c0bb1e9ab692a1e33204a0da7f12  boto3-1.28.78.tar.gz
+sha256  aa970b1571321846543a6e615848352fe7621f1cb96b4454e919421924af95f7  boto3-1.28.78.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index 78e410d804..f60f3467d4 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.26.115
+PYTHON_BOTO3_VERSION = 1.28.78
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/78/a8/b07686bd9a56e2556708d562c6b8ade423f3cf4cb1b7c3cbc9ed6c24d022
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/70/f7/da69e173dd5663775f114fad3827dcc49537e232e36266463ff70529f1a4
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
