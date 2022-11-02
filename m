Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BF1C433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 23:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E50AC4040B;
	Wed,  2 Nov 2022 23:50:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E50AC4040B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2cOkblTMm3MZ; Wed,  2 Nov 2022 23:50:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6AAD40234;
	Wed,  2 Nov 2022 23:50:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6AAD40234
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 27B5F1BF46A
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 23:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0104781DE5
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 23:50:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0104781DE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6C1Ur4XH8926 for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 23:50:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02B7981D02
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 02B7981D02
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 23:50:09 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id z3so129931iof.3
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 16:50:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wmFK7hkMhUK6szpyBiuH8itxIXRtzSZIxpO3Fe24zXI=;
 b=ZSM9r40Uz75wPaXXkLnLV9A9dV7eu2jEIP7AaabBmJuR4c3E7JcTXyMAXrdGfIg0iz
 xtsTJ/kFKKQUxrVI8586ZXFu/tnJqZbfcofK13b2E8tYF4siGfScKEEQJiZIKB/4mPV1
 7J7lCe/Mpx8w+A79P/6NBAt0+/Gq+wA7vyXesTIktwCalsDtU5lLKrEAOk2ZN1u3A300
 baMnYWr+cpFmpwT7v/D2r29GVl4EarKYtBo0PC6mWXxebjGtQf5pCp8z+dGe8Lg0fOlZ
 uPoFRAiqaRcIyodRamdpXTo3Zc71vsInenzU+xLt1ChXg+ARiihqLZcO/pnBYn9XcFof
 R/Mw==
X-Gm-Message-State: ACrzQf0SC2EcTfgd8Xtq8VkutxPidoZuHFrRw5XYLbZYmd6+ggBUwTAS
 YFD4/WxlyvW94setWsWt3nVB1vWyDnx98Q==
X-Google-Smtp-Source: AMsMyM7ud8K6Q+v+lWwFCxpAb3MItxeVTqQxLSHZN4xQZ3BWXck4H2VswbG2qaRh9ZeO+L72FWGn6w==
X-Received: by 2002:a02:6247:0:b0:363:b6bf:d2d0 with SMTP id
 d68-20020a026247000000b00363b6bfd2d0mr17289940jac.166.1667433008687; 
 Wed, 02 Nov 2022 16:50:08 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 e93-20020a028666000000b00349d2d52f6asm5206952jai.37.2022.11.02.16.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 16:50:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 17:50:06 -0600
Message-Id: <20221102235006.4102405-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wmFK7hkMhUK6szpyBiuH8itxIXRtzSZIxpO3Fe24zXI=;
 b=QtKIyBPfJ4UIG1+XEzSqwwIAPn+P5G8B4ebiUo/sCsUTuWk2KrxabDJm4UjQntECiO
 eaFu4VTLNkbwGVsFhqmSaWGSOsFrJYpnXtvKC9Dt5UMickILFfvPIgpyRoN/gAvgR6nx
 gxzY0wzy1W4WN2wR9b+sMP//ysIEPOPltffDnwGWGZvrr1I5POTTylJs9A+o2wyoApLb
 VroEe38LvJ8ldN+2tLhUwQvK3Rn3kyQeetoym990ilGwudPQ5FQFJ6pWPk7R65kYLt3Q
 X2RzrJCSTV+4frIF3DgBziZxyNcvifXv1Hxa/13hZ7avMFVKThUC4ByJjR8mgTSLwxu7
 HeyA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QtKIyBPf
Subject: [Buildroot] [PATCH 1/1] package/python-jmespath: bump to version
 1.0.1
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
 package/python-jmespath/python-jmespath.hash | 5 +++--
 package/python-jmespath/python-jmespath.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-jmespath/python-jmespath.hash b/package/python-jmespath/python-jmespath.hash
index a1c64a121e..03f64f3b74 100644
--- a/package/python-jmespath/python-jmespath.hash
+++ b/package/python-jmespath/python-jmespath.hash
@@ -1,4 +1,5 @@
-# sha256 from https://pypi.org/pypi/jmespath/json
-sha256  a490e280edd1f57d6de88636992d05b71e97d69a26a19f058ecf7d304474bf5e  jmespath-1.0.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/jmespath/json
+md5  2dd28beb22d698f58fe2281bfe5fe3a3  jmespath-1.0.1.tar.gz
+sha256  90261b206d6defd58fdd5e85f478bf633a2901798906be2ad389150c5c60edbe  jmespath-1.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  66b313cce80ed0623fc7db3f24863a0c80fd83eb341a46b57864158ae74faa56  LICENSE.txt
diff --git a/package/python-jmespath/python-jmespath.mk b/package/python-jmespath/python-jmespath.mk
index 48b19e8494..a94a13a229 100644
--- a/package/python-jmespath/python-jmespath.mk
+++ b/package/python-jmespath/python-jmespath.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JMESPATH_VERSION = 1.0.0
+PYTHON_JMESPATH_VERSION = 1.0.1
 PYTHON_JMESPATH_SOURCE = jmespath-$(PYTHON_JMESPATH_VERSION).tar.gz
-PYTHON_JMESPATH_SITE = https://files.pythonhosted.org/packages/06/7e/44686b986ef9ca6069db224651baaa8300b93af2a085a5b135997bf659b3
+PYTHON_JMESPATH_SITE = https://files.pythonhosted.org/packages/00/2a/e867e8531cf3e36b41201936b7fa7ba7b5702dbef42922193f05c8976cd6
 PYTHON_JMESPATH_SETUP_TYPE = setuptools
 PYTHON_JMESPATH_LICENSE = MIT
 PYTHON_JMESPATH_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
