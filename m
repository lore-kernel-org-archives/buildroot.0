Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C24C636CC
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 23:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D54D281FBC;
	Wed, 15 Feb 2023 23:00:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D54D281FBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xDJi8G6LzsB2; Wed, 15 Feb 2023 23:00:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 219BC81FB8;
	Wed, 15 Feb 2023 23:00:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 219BC81FB8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 293611BF396
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 23:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02349417BA
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 23:00:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02349417BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 10kK_PlN4iOy for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 23:00:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBFF7417AB
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BBFF7417AB
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 22:59:59 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id by3so190567wrb.10
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 14:59:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C3SQpfYwM5aaQnTdkm8K3muf44Z8sFVCW3VGnbNkT80=;
 b=ak3aydGUXTovLgjax9dx0D/drxjwKsRr2NhHmmHfE0fhNllgsx67Cnf1xr+rBf6/wl
 Z2Z4z8FP3EBwnfhur3Es9SrP/0YBIbYM9+3AeIBD7HorAKDeNtvt7xK/44PpgVwCijJJ
 Ho1pamkPRFujJujLgyN0df58ZT6jsThU5Zgx9KEAzcNfsd4U0063kJklQIG+IxxJPimX
 hDQCMSeG5zNmkyA2VaB0Fu6/zFSkXikiybzTVyVCYcrRUBCmEA9t1wPRfBrrS6KAuQrT
 PnUryDpjwwvfuyO9dneqMANYL4Ksm7K1VWdX+k/1IIvmro5NatnIHoE6cG4ZonnjtNvL
 nSPg==
X-Gm-Message-State: AO0yUKUkmYjqAqIAWNw87wfre50tYJXtr1svTTCZIaaI7A6LT3mzGCi8
 mh1hOsVKHsH0NlyAFj13XANYGSk5kfs=
X-Google-Smtp-Source: AK7set9vuYJK6Vcb3JzZ+1PmBs246sFEVlh0BEwAtCteSp/tTmZi+AUdeQjqj6TC6A/pd2dzadaXRA==
X-Received: by 2002:adf:e3d1:0:b0:2c3:ed14:8323 with SMTP id
 k17-20020adfe3d1000000b002c3ed148323mr2963029wrm.38.1676501997488; 
 Wed, 15 Feb 2023 14:59:57 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 k16-20020adfe8d0000000b002c54536c662sm15095891wrn.34.2023.02.15.14.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 14:59:57 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Feb 2023 23:59:47 +0100
Message-Id: <20230215225947.26078-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C3SQpfYwM5aaQnTdkm8K3muf44Z8sFVCW3VGnbNkT80=;
 b=d0WS7nNXQeDsq2OuxyROBctovHeBRM+613XKU5kOjVq4tTUSTUSuPnZhuMM1q/Kp3/
 JbZiuvAnGoWn1p/9SfvL3ZnS5WeSkKpz0+PHkLDNlx1/m0Zfp6sURrTGIJn0N12Wei3K
 TjSwSi2oRUiU1IbOqw5t/n45Ulgla3RYeh7GeZe4ZzoLpK9L3nyFkZjfTX2JjPaVQUU3
 4HlKm/6wJFzS8RFbQHHfTjuR0D/jHe3NREHci7U/H9ahGA+xiKP/3gu6v0hT+pN/wsoc
 l+eeOogxxDf8/evE6ttLl+1lsfeo2GwBgzzlpdsHDciqOg2QkodPHNcdrALGJbhrSPtv
 3P3g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=d0WS7nNX
Subject: [Buildroot] [PATCH 1/1] package/python-marshmallow: add CPE
 variables
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

cpe:2.3:a:marshmallow_project:marshmallow is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amarshmallow_project%3Amarshmallow

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-marshmallow/python-marshmallow.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-marshmallow/python-marshmallow.mk b/package/python-marshmallow/python-marshmallow.mk
index 6427296508..ba6da6b29c 100644
--- a/package/python-marshmallow/python-marshmallow.mk
+++ b/package/python-marshmallow/python-marshmallow.mk
@@ -10,5 +10,7 @@ PYTHON_MARSHMALLOW_SITE = https://files.pythonhosted.org/packages/5e/59/dd465e5a
 PYTHON_MARSHMALLOW_SETUP_TYPE = setuptools
 PYTHON_MARSHMALLOW_LICENSE = MIT
 PYTHON_MARSHMALLOW_LICENSE_FILES = LICENSE
+PYTHON_MARSHMALLOW_CPE_ID_VENDOR = marshmallow_project
+PYTHON_MARSHMALLOW_CPE_ID_PRODUCT = marshmallow
 
 $(eval $(python-package))
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
