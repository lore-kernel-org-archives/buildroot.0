Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB87C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 18:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DF4060AE4;
	Sat, 10 Dec 2022 18:48:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DF4060AE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XvLvtCy_KnNQ; Sat, 10 Dec 2022 18:48:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABA6360B2A;
	Sat, 10 Dec 2022 18:48:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABA6360B2A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DD35D1BF2E4
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 18:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6BAF40E47
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 18:48:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6BAF40E47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P-AbA_iDGV5U for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 18:48:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B25440AB9
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B25440AB9
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 18:48:12 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id m15so1506037ilq.2
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 10:48:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wuEvOuWuTwdg6urUli+4tgDkLAt7G+TLICz0+hRPKEw=;
 b=uOI33LduR1ly72alHQzoHAr8Y0wf2XjkQwgMTCcylJI0WvgYimaN++3Gl2qHUY7Ij5
 b/NBvEN+RcpNDPDFE8eROjisvsYGDvHSSAgT20FhIIzyl6DREKhFEaFX0rqYk6yIJzSp
 khECZfawOcijsNr++b6UxVYiQzP+OnvZGtiam+Zt7sbvKqkm+OMdQjHPy4FXoGF1nDAB
 QoiLu5Ep146aa8XOoQMNA/dE8A/wzUzBB/7fPoOQu0B7oCs4RsvosO1i4UkbMCipCEbq
 poiLzOB61T4b9xXQynIZ6hpjfTCwHz5238ER7rwtNsaxDBYeORwsqYMyPWwD1oyhHgKi
 5lVg==
X-Gm-Message-State: ANoB5pnrWgO6cUq+obkIE7VE7ayAlgZf2DyBRA5jJ7wi995gNfHjtNEY
 Mtob6f/eChrma39L8vpjHo7tEeuH8JGpvw==
X-Google-Smtp-Source: AA0mqf4qZb3ouqsKA3xNbOh1nx0LQQBT5H1/Kw3lRh4aEIacGJ7Xg2tBZJla4HG4yjuksxt1Jjy/xw==
X-Received: by 2002:a92:d70b:0:b0:300:f24f:16d7 with SMTP id
 m11-20020a92d70b000000b00300f24f16d7mr7684035iln.4.1670698091320; 
 Sat, 10 Dec 2022 10:48:11 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 c20-20020a056e020bd400b00302d0392ea9sm1498977ilu.65.2022.12.10.10.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 10:48:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 11:48:09 -0700
Message-Id: <20221210184809.2953159-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wuEvOuWuTwdg6urUli+4tgDkLAt7G+TLICz0+hRPKEw=;
 b=jVjI8MyAHRt0MfBKmbhaCx8HliTTeuW4gFEWbRTqTGNnz6GdgmLNEqUSLanbfRJjGI
 ZLnkjBVpZLyzI+fciVKVrwptvInSHJ0+C1ila/9xWeR4WDlxpHXvMAS4+nMdHYqEcXcA
 q79MVEgA6VbnCBxWyU+cbeX83g9v7GwiBMxUrjdaUl8HJqM3gDyMgXayK+x7lncpQ+iV
 /rMrxNb3S6PdZauvbRcMApJQh9GQpL682t8RgBwKFLeUgln5Mp1r5gIP6JbRtmVu6ylJ
 /sIE1GgbYWeZ8UmNnk3R0tDnysZkH3rfmuFztaZuUXAYOz/aHS4ZaNyze3SjN8bvrHZX
 cJRA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jVjI8MyA
Subject: [Buildroot] [PATCH 1/1] package/python-numpy: bump to version 1.23.5
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
 Samuel Martin <s.martin49@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-numpy/python-numpy.hash | 4 ++--
 package/python-numpy/python-numpy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-numpy/python-numpy.hash b/package/python-numpy/python-numpy.hash
index 2a2dec44da..9ac9280c78 100644
--- a/package/python-numpy/python-numpy.hash
+++ b/package/python-numpy/python-numpy.hash
@@ -1,5 +1,5 @@
-# Copied from https://github.com/numpy/numpy/releases/tag/v1.23.4
-sha256  ed2cc92af0efad20198638c69bb0fc2870a58dabfba6eb722c933b48556c686c  numpy-1.23.4.tar.gz
+# Copied from https://github.com/numpy/numpy/releases/tag/v1.23.5
+sha256  1b1766d6f397c18153d40015ddfc79ddb715cabadc04d2d228d4e5a8bc4ded1a  numpy-1.23.5.tar.gz
 # License files, locally calculated
 sha256  0f88787955e7131224f53a8c3f3e859dc502408e3a539a4dcf61fb7888b5b984  LICENSE.txt
 sha256  c27d0a8026bdb8876562b720ab24d1688e3827a89f6083cd6e7e8caa9584aba3  numpy/core/src/multiarray/dragon4.c
diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index 4f4848c4ba..812bfdae4a 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_NUMPY_VERSION = 1.23.4
+PYTHON_NUMPY_VERSION = 1.23.5
 PYTHON_NUMPY_SOURCE = numpy-$(PYTHON_NUMPY_VERSION).tar.gz
 PYTHON_NUMPY_SITE = https://github.com/numpy/numpy/releases/download/v$(PYTHON_NUMPY_VERSION)
 PYTHON_NUMPY_LICENSE = BSD-3-Clause, MIT, Zlib
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
