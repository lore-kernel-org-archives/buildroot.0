Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D24EC433F5
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 18:38:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBDA5610FD
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 18:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EBDA5610FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 982C54159A;
	Thu, 23 Sep 2021 18:38:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6S16-3pKjc_v; Thu, 23 Sep 2021 18:38:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EEDA41596;
	Thu, 23 Sep 2021 18:38:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A99AE1BF389
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 18:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92BA8606B6
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 18:37:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B27Phjj0bYLx for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 18:37:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B2527605F2
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 18:37:58 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id u15so19878509wru.6
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 11:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EUT05G4JhCIK43CkS1Kg/h8zLolB2V1lhIsdUyOZzMs=;
 b=JfNgq2Agia9qsIERSlOKt/RDzYF93/awZutwJQ68v2jSkZr0HVrFdMTkWw/OfLP0Yt
 QUo/GAzmwGWzTcGsPVtBlPu/ZVLM4lStLrZ8/n4TaXEdjBy/OMC/AB3hTLJq39Hh9inw
 Ba2XtDVt5pFSX+eUBDg1CZIBROnR9KCtHLKLKp2JTQExlP0LRW1ndPvnRUN4/zSkY9qx
 1cTkgioEB2Hf/efZwXQkgbmmuvNsprK6Yxz85NaFhq0K93/hYSRFJLXEtampY05pa1TV
 lew2LLuqzUAmHf2YYs/pdbmkMHkhutv52qwJN36q1/Wolf+bI6KRJPHOsdlLXccxPnZg
 Kfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EUT05G4JhCIK43CkS1Kg/h8zLolB2V1lhIsdUyOZzMs=;
 b=E4A5Mh6Apy8Uz2lA83hwUTALBbLpOCLfdQEb3dys5x4fJ1/2qC/tHvHuTqT2KfqWgp
 /u19LXwUmSqZyHhRsxYqcZ2Mj5GWsxLkiBX2QdBe6mBBPLOXpxKUMA4PzARIivXRB7tx
 jLl8Nzbe06qaqfrLR/HGF9YgiRMAaFs1498/2DCfnuXB5glQ7DqVfzy10NVtLtHlmEIS
 AK3xwT0/kjRyjqxPBoW4y3r6KGcccvGUZSgkCIq+SjoFMYAICW/QfibikfEhG3kRTucy
 gWjXrVtFegjn6AjyRzZJYiNYXzWpn4QQ8j4rPbhGvWpXHzOoNT9TtixPpndyx50flw0e
 LPng==
X-Gm-Message-State: AOAM532AvL/PdUHPNpOXUvVqXdzzOXqvdtzhB7yfcGANVwHkDEHqwh+1
 wdMm1HUu9ARzXpwisP6Us8YrYGhN7cA=
X-Google-Smtp-Source: ABdhPJxp0IVWKVOQhZo9dOHJqh8EfAChkgzzY/FTsQPYBCrCmKSlabBsQFTvaSm3TMztmFWNeV0RYQ==
X-Received: by 2002:a7b:cbce:: with SMTP id n14mr17638135wmi.169.1632422276601; 
 Thu, 23 Sep 2021 11:37:56 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:f83a:8b82:715:ac42])
 by smtp.gmail.com with ESMTPSA id h18sm6469531wmq.23.2021.09.23.11.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 11:37:56 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 23 Sep 2021 21:37:49 +0300
Message-Id: <20210923183751.361386-1-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-attrs: remove _next_gen.py
 on python2
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

The _next_gen.py file contains python 3.6+ API and it's not
useable with python 2.
In addition, this file is imported on __init__.py only after
checking the version of python is above 3.6, so we can safely
remove it.

Fixes:
 - http://autobuild.buildroot.net/results/5774c6237b72b6f5e005bb5b229c078235ff2741/

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-attrs/python-attrs.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/python-attrs/python-attrs.mk b/package/python-attrs/python-attrs.mk
index b99a98501c..f23cabd998 100644
--- a/package/python-attrs/python-attrs.mk
+++ b/package/python-attrs/python-attrs.mk
@@ -11,4 +11,13 @@ PYTHON_ATTRS_SETUP_TYPE = setuptools
 PYTHON_ATTRS_LICENSE = MIT
 PYTHON_ATTRS_LICENSE_FILES = LICENSE
 
+# _next_gen is usable only on python 3.6+ and it's not imported
+# on __init__.py in case lower version of python is used.
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+define PYTHON_ATTRS_REMOVE_NEXT_GEN
+        $(RM) $(@D)/src/attr/_next_gen.py
+endef
+PYTHON_ATTRS_POST_PATCH_HOOKS += PYTHON_ATTRS_REMOVE_NEXT_GEN
+endif
+
 $(eval $(python-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
