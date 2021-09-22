Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C65C433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 04:36:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2823461166
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 04:36:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2823461166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB1DF40701;
	Wed, 22 Sep 2021 04:36:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1gkH_yyNkp1N; Wed, 22 Sep 2021 04:36:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B91D406E9;
	Wed, 22 Sep 2021 04:36:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0CD3A1BF41E
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 04:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0D378249C
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 04:36:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0FZHNuz7I8xu for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 04:36:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1699282443
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 04:36:10 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id s20so1724755ioa.4
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 21:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7ybbDU4Pbel2ruinzAcPqzUimiVPPJeBo+6wZ046iM0=;
 b=d+ldD6XoOuKmuYVVqsqgda2AC4eVEGLD0tw62phrNqz+/kbs+m3kLrqgeXBSePmUAH
 ggzN1xbRlitLnqXPJPxfQtBOAwisgaM9lp2u8rZ9s5Oh7Vc+GkudcmXzmwC9kRffVsaL
 p+EjVriBs53MQxBduy5kZylxrahx2FiSEWOQ/5OK8BTEhxZzoSYGClo3vCIHynk18g11
 p6b3SZt20cfbSjZtGjzG90ode7IY6m76ykFpoKqgHyxmTV7Hs/wW88R6mWGfGyyPtFpG
 s3yM70lOv6kd00tBNrrZRWybxjDxnh9mixXxaWFWUhieMmBHWtevNLRjP7Drg2pX4MZn
 k27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7ybbDU4Pbel2ruinzAcPqzUimiVPPJeBo+6wZ046iM0=;
 b=O3nYs1h/BHcMEpoD2ZBzyRU53tC0dAVfSJiuhsbJNHp0Q094kvrNXimz8frxRHkMlZ
 Yqnr50i+kQh0Ex7BrAl+QODAhsnaGWDZghI3vMdqWdFHg2q+VUy3/5WtzSLIeKD92zBA
 iZcnQsjj4FacLtyC47A9JGcN6GUmH8J7P7sM1r89Pv6Pn1ytVxE3uMjD0Bbw10E5mfic
 tfEdIcm0yVCJ8o0uYnSMsVYJgAVBwlSidrkKlsRusKv1giNOjgcjPEUkwjo5TKzkEYKR
 YApT8APaWg66MjbM/7wz5jr5WBqssp6aGCyOXkvS80+rFkg9nr/SIMtvFdekbv3j16fK
 rWow==
X-Gm-Message-State: AOAM5337zXBCKkDOuO9o4SMwcEdPCi7637FjpfMiZ602S9gKKGvEJaF2
 E/hSzCewZwAbvUmTRidgrLytE5I77SQ=
X-Google-Smtp-Source: ABdhPJyq0sUiGVUAB2pqEDQOHLatlQ9PWA5vO9j8G3rluOuTsUqIShDoJlDwxSjNZbiGZvdqrG/2fQ==
X-Received: by 2002:a02:a46:: with SMTP id 67mr3014465jaw.142.1632285368819;
 Tue, 21 Sep 2021 21:36:08 -0700 (PDT)
Received: from james-x399.localdomain (71-33-146-72.hlrn.qwest.net.
 [71.33.146.72])
 by smtp.gmail.com with ESMTPSA id e13sm484688iod.36.2021.09.21.21.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 21:36:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 22:35:53 -0600
Message-Id: <20210922043553.4168153-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-aiosignal: bump to version
 1.1.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiosignal/python-aiosignal.hash | 6 +++---
 package/python-aiosignal/python-aiosignal.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aiosignal/python-aiosignal.hash b/package/python-aiosignal/python-aiosignal.hash
index 17c69c8144..3fdd459502 100644
--- a/package/python-aiosignal/python-aiosignal.hash
+++ b/package/python-aiosignal/python-aiosignal.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiosignal/json
-md5	0831ab9e46799842ed84529dbaa86196  aiosignal-1.0.0.tar.gz
-sha256	7cd33cbe05bc2d83e77f80d688b4717e424d15eecf6d65384e173b2873e62f13  aiosignal-1.0.0.tar.gz
+md5  f3edf1b700b4fee6ea6ed375c3f6555c  aiosignal-1.1.2.tar.gz
+sha256  15605698a0401075a03d36cea979e3c0e6cf8467a9e3b9047040514dd9e6f43b  aiosignal-1.1.2.tar.gz
 # Locally computed sha256 checksums
-sha256	6fd5243e92dd7f98ec69c7ac377728e74905709ff527a5bf98d6d0263c04f5b6  LICENSE.txt
+sha256  6fd5243e92dd7f98ec69c7ac377728e74905709ff527a5bf98d6d0263c04f5b6  LICENSE.txt
diff --git a/package/python-aiosignal/python-aiosignal.mk b/package/python-aiosignal/python-aiosignal.mk
index 14b4264620..ea11d97060 100644
--- a/package/python-aiosignal/python-aiosignal.mk
+++ b/package/python-aiosignal/python-aiosignal.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOSIGNAL_VERSION = 1.0.0
+PYTHON_AIOSIGNAL_VERSION = 1.1.2
 PYTHON_AIOSIGNAL_SOURCE = aiosignal-$(PYTHON_AIOSIGNAL_VERSION).tar.gz
-PYTHON_AIOSIGNAL_SITE = https://files.pythonhosted.org/packages/ca/b7/5ae01ed039ea51cc8280d87b8a1269ba2f1343d7466c1e50c618558352e5
+PYTHON_AIOSIGNAL_SITE = https://files.pythonhosted.org/packages/ac/f7/c3df3b7eac6ea96175e0817b272b43b398d5ba589be09a50d1b758d5b852
 PYTHON_AIOSIGNAL_SETUP_TYPE = setuptools
 PYTHON_AIOSIGNAL_LICENSE = Apache-2.0
 PYTHON_AIOSIGNAL_LICENSE_FILES = LICENSE.txt
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
