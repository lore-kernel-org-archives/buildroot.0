Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C4AC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 20:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F283A41857;
	Thu,  3 Nov 2022 20:07:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F283A41857
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kXaMvFpk79Hd; Thu,  3 Nov 2022 20:07:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADF8D41852;
	Thu,  3 Nov 2022 20:07:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADF8D41852
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A34B91BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F30361034
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:07:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F30361034
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CIanUfScVJDe for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:07:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 926CC61030
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 926CC61030
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:07:22 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id p141so2302274iod.6
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 13:07:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7ghvRpPcupGfOad+ChOorx9IHLdz1MwdNc9yT59JFL4=;
 b=Z3bBwK+3iTfu6Rm3LXi14P84V04s1Ds7rVeoWWHrPBWDreAXpaPTdLle8MTg3nLjoB
 hP+dEymGiAMva5PsA8nWjNzjmCnXJJLA3Ly3m+fwEIqzZdw8O+IcVCdcLpjy73SGSCU4
 uix7Nf9A9QYRBcGjwMekE2MQ+sjpssgI4ed2Flf+k3EkqzWwhxnNDoLX+SoC0Mrp967/
 4S0hojBozrf/m/H6zFhuB6aoXegpFE95Sj70bX0C5zh/Yt8TzI1ww6d5dGbpQFTN52hT
 cd57DKkmqxqsl3rGEDQcBusXqBW+CQpdL8skutCE0x+BbuoN0ww+ae5NFLDisxJVRRyj
 d2nA==
X-Gm-Message-State: ACrzQf1iQv+MjjcMIIdLcjz/mpWUl9P2pHEhOtK37hwxUT2kp3UlvE/6
 EFaisYvm0T3MM/CbMlqARUP2DULolBoEcNnH
X-Google-Smtp-Source: AMsMyM5/u4IMpZRKzDYyI/R23ilBfmay7YfvbmI+FHo+FwvucW+KIZ7fIkyylRNw3SC0Dueswg6OMg==
X-Received: by 2002:a02:cc18:0:b0:374:507b:8c16 with SMTP id
 n24-20020a02cc18000000b00374507b8c16mr20474374jap.296.1667506041398; 
 Thu, 03 Nov 2022 13:07:21 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 n26-20020a6b591a000000b006c0aa1ff1a8sm687976iob.6.2022.11.03.13.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 13:07:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 14:07:19 -0600
Message-Id: <20221103200719.2955162-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7ghvRpPcupGfOad+ChOorx9IHLdz1MwdNc9yT59JFL4=;
 b=ZxIa3/tJe+OHtFHIdmDDV6oiI/aNDyrySq4gFhjzvr/oeFnYEubfPvp2az4gqJ8Df9
 GyHIZbWt2QFf1/dGVSnOLarLwtH8zCjAroBEhZ7oOC9/5hlvLDlswqi2SR9XxAwJj/7+
 vwcdbOA1jayYjenu2jdIeZ+YNZLNDeqbo9sMVqMbG+ykARzbnzVeNBGp75maIx/X8BPp
 O8aGcyAtBLdm+0Bf9SiHAvIhvN8MeVxFkwCWaqfaC5wVeA5BIVsaWn21ScWhn1JBz2d0
 3cApsJFRWBpQMMyDaQVAocT0bkBaFCQs+E7/Rq/wfwBRXIa4o6R2SoF219wudBg7n52h
 toAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZxIa3/tJ
Subject: [Buildroot] [PATCH 1/1] package/python-tornado: bump to version 6.2
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

Verified license remains Apache-2.0 after hash change.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-tornado/python-tornado.hash | 6 +++---
 package/python-tornado/python-tornado.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-tornado/python-tornado.hash b/package/python-tornado/python-tornado.hash
index e9fbbedf65..f30a6bb136 100644
--- a/package/python-tornado/python-tornado.hash
+++ b/package/python-tornado/python-tornado.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tornado/json
-md5  cf39425f3d7eba9a54287f3e795a2f23  tornado-6.0.4.tar.gz
-sha256  0fe2d45ba43b00a41cd73f8be321a44936dc1aba233dee979f17a042b83eb6dc  tornado-6.0.4.tar.gz
+md5  32fbad606b439c3e1bf4e79d4e872741  tornado-6.2.tar.gz
+sha256  9b630419bde84ec666bfd7ea0a4cb2a8a651c2d5cccdbdd1972a0c859dfc3c13  tornado-6.2.tar.gz
 # Locally computed sha256 checksums
-sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-tornado/python-tornado.mk b/package/python-tornado/python-tornado.mk
index c05a7d65d3..2af86ecb18 100644
--- a/package/python-tornado/python-tornado.mk
+++ b/package/python-tornado/python-tornado.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TORNADO_VERSION = 6.0.4
+PYTHON_TORNADO_VERSION = 6.2
 PYTHON_TORNADO_SOURCE = tornado-$(PYTHON_TORNADO_VERSION).tar.gz
-PYTHON_TORNADO_SITE = https://files.pythonhosted.org/packages/95/84/119a46d494f008969bf0c775cb2c6b3579d3c4cc1bb1b41a022aa93ee242
+PYTHON_TORNADO_SITE = https://files.pythonhosted.org/packages/f3/9e/225a41452f2d9418d89be5e32cf824c84fe1e639d350d6e8d49db5b7f73a
 PYTHON_TORNADO_LICENSE = Apache-2.0
 PYTHON_TORNADO_LICENSE_FILES = LICENSE
 PYTHON_TORNADO_CPE_ID_VENDOR = tornadoweb
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
