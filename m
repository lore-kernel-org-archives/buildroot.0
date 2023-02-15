Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C051CC636D4
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 23:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A85181277;
	Wed, 15 Feb 2023 23:04:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A85181277
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B7ZLzmEuCyy0; Wed, 15 Feb 2023 23:04:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99136812C9;
	Wed, 15 Feb 2023 23:04:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99136812C9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AB8571BF35F
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 23:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84AE8607C0
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 23:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84AE8607C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KdD8pPym_reu for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 23:04:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2023A60768
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2023A60768
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 23:04:27 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id m10so230378wrn.4
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 15:04:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lgRin0sORZYoETeEUyFCKqL6ozBHxp1yvFQDbM7sujg=;
 b=Iql75Z2KVTwWwjsQwg43lCQmJ4bxadJH3PJyR7MRdpA4ETS/AxpgFNdfAA/g+RQeAN
 zgXJvpfE1W9ChjmRCbek2QIi6F2p235F0lVVxn3N77tk1fHlavnalPDKu/aeFy3BQOJ1
 ITgLzALYU6mE1tFVf03UB0j1pMaGzotSvTmkx1iVR51YpiiWNC6fwZ2waRi45Z6EWr5d
 ghvomBUo9Ja4Pz6t9kLZlh3EB1GaIcmJla4Mnv3WHiuoTQAlXRKfeJbzzHqGp42DhGFM
 RrPPDv1LgLtEZcXe9Y5a99+Tn2/R7mUWHOLM1Uxxk7S++d31QttO1bBKFBJLipdGBCMo
 9JjQ==
X-Gm-Message-State: AO0yUKWertucJbhaVJ/5K63DjV+wms4YGCMUmoJkkA7wyPO988+7QgzL
 p+0Pe9NWhYiMhYXTGn5URI94nn7F69E=
X-Google-Smtp-Source: AK7set/hcW669EVzCe5gTW9n5ahx1mOshCyFszkVR2TP0F/LWBoN/YVbFRnv4lNxYZFuVUEWtbeYZw==
X-Received: by 2002:a5d:6a06:0:b0:2c5:6cfe:aab4 with SMTP id
 m6-20020a5d6a06000000b002c56cfeaab4mr3353548wru.12.1676502264988; 
 Wed, 15 Feb 2023 15:04:24 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 x1-20020adfffc1000000b002425be3c9e2sm16792642wrs.60.2023.02.15.15.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 15:04:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 16 Feb 2023 00:04:13 +0100
Message-Id: <20230215230413.28610-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lgRin0sORZYoETeEUyFCKqL6ozBHxp1yvFQDbM7sujg=;
 b=kLzfJ5ik1/7bhnixVooeYZEpLnxjG4RueYjz9UnnKUJUUWjRYhx0VGI5GGT9TVBQyf
 +sA72Otq36fdzctFGxJWyZdy//ITaxyughxi6cD6mAZ4ZdBD0qL9AZ1JKXmhsy21rXoc
 5bEGFnIcX2yOIoofm9w4bfOBB2Af8200ugjGu+LaypVcWICLBRFPNzjMnVxzJQQ6KCK4
 t/TXtCi2ZD5Hl0Tf4KQLwwffb4WHWGhRzOW+5lUFOCcIGBPaW+xNHBxBiL5F6TM83PRg
 Ga0EyIEvJi8Bp5cIo81LTSodcjnXLSaxh76cXFlZeD9drOS45d7MR1tyGxNMYc6m3irO
 nCvg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kLzfJ5ik
Subject: [Buildroot] [PATCH 1/1] package/python-webargs: add CPE variables
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:webargs_project:webargs is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Awebargs_project%3Awebargs

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-webargs/python-webargs.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-webargs/python-webargs.mk b/package/python-webargs/python-webargs.mk
index e048d8a4ac..ce270842c1 100644
--- a/package/python-webargs/python-webargs.mk
+++ b/package/python-webargs/python-webargs.mk
@@ -10,5 +10,7 @@ PYTHON_WEBARGS_SITE = https://files.pythonhosted.org/packages/4b/7d/fece8e6547b3
 PYTHON_WEBARGS_SETUP_TYPE = setuptools
 PYTHON_WEBARGS_LICENSE = MIT
 PYTHON_WEBARGS_LICENSE_FILES = LICENSE
+PYTHON_WEBARGS_CPE_ID_VENDOR = webargs_project
+PYTHON_WEBARGS_CPE_ID_PRODUCT = webargs
 
 $(eval $(python-package))
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
