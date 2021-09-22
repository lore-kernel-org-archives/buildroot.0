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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A8F8C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 04:28:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9872261166
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 04:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9872261166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43AEF608FE;
	Wed, 22 Sep 2021 04:28:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6e4xrVDT_2ct; Wed, 22 Sep 2021 04:28:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F85360755;
	Wed, 22 Sep 2021 04:28:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BCC721BF41E
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 04:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2FF840245
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 04:28:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lb-wCrIqetTn for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 04:28:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9311640017
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 04:28:52 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id b10so1646694ioq.9
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 21:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1TXzGtWdffIyK1TRHCC7d4SPTXh7EjteyRfCmxMNbgs=;
 b=HG+Qe6L6+mWMwkC+0Lcs4njf+LsVgLV33oRi8z4PE4hEigrebZ5DFT5WPtWJKVXZ3b
 fyWX5gD/wGGlDZntEhmYEee5XS2SUtlIvN3k+k8td7pCGZ190tcqS5VXjLmZ4bJr9b1T
 PIuwvGzR0FkJViGzoEi6RVuyIPRUaNrGTan1ekUpLbXApS3Btm0xQ3Jn92UgSQDP0a+o
 zn7CUGd7NrYvoRfdPBQBgWwna0+zvEW7I4L0fp57wdEUsIjgBJL/Ee36oKurMlqSR8hp
 jwA3zAekTG/goV6PRhJuxL5faiC0Hh620iajs82O781pvCCgmkSmjjzG/KOclR4q0+EN
 fR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1TXzGtWdffIyK1TRHCC7d4SPTXh7EjteyRfCmxMNbgs=;
 b=SbEiGxYsNxelmxBlL79bN2Pe6QYp5HWFXTeNInYtNpcCpXgXh6CiY64JIH+JAbOImL
 wyMvgFpuMkpjGlvq0YZpYoxv3kWr8JjewEOq7gsWCImdtaI5MfQxbxtmMmaZyy88+0Ci
 mfKSr28FwyLSVMz/ulpPn3TOdzH7sqZYMG8Zvk3JQ+KnUB9R710NsUKFybQLqrDx4qWu
 arRgXess/iuCrn8kVnx6zGCxEgRBSlwQ+a2brNreAdkVpGKhEjjvVehjYnv3y3VJKl1G
 ayrSKbMQs7/7pqSK7csKZt7XvJXuzJZc4r4t5IF1e3mN3vc41RbtYzMpEIXSUKb1HG9A
 /0Hg==
X-Gm-Message-State: AOAM533hOGgk4r0esjh/C4h++UI3yOY1asjKHg/Pd0EWFW6OYTVbO1Wh
 S26wbAqtTp0k7qwFscAWdtUST7iNMgo=
X-Google-Smtp-Source: ABdhPJye93Wm/tnWQWTvH9C4uGYmsbUYFAPWOQsS4wqmhywzShG53LRNbwRLoB3L4F8ob4DiMZwTJA==
X-Received: by 2002:a05:6602:1a:: with SMTP id b26mr2835962ioa.0.1632284931547; 
 Tue, 21 Sep 2021 21:28:51 -0700 (PDT)
Received: from james-x399.localdomain (71-33-146-72.hlrn.qwest.net.
 [71.33.146.72])
 by smtp.gmail.com with ESMTPSA id b3sm481551ilo.48.2021.09.21.21.28.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 21:28:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 22:28:40 -0600
Message-Id: <20210922042840.3703106-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-aiojobs: bump to version
 0.3.0
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
 package/python-aiojobs/python-aiojobs.hash | 6 +++---
 package/python-aiojobs/python-aiojobs.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aiojobs/python-aiojobs.hash b/package/python-aiojobs/python-aiojobs.hash
index 56a8bb111c..44bf20c428 100644
--- a/package/python-aiojobs/python-aiojobs.hash
+++ b/package/python-aiojobs/python-aiojobs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiojobs/json
-md5	8fd929e4ef9bc6560c675a5b11ac6077  aiojobs-0.2.2.tar.gz
-sha256	8e4b3e3d1bdb970bdaf8f8cd5eb4e4ff3e0e01a4abd22b4f73a87002a5ae4005  aiojobs-0.2.2.tar.gz
+md5  d537fefca047067255758d7cb9e39db8  aiojobs-0.3.0.tar.gz
+sha256  f6631d42dc4308f7d883abbd70d4e976f3fcc35a3ba1e8eae5d4af4940a1e0c3  aiojobs-0.3.0.tar.gz
 # Locally computed sha256 checksums
-sha256	b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
+sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/python-aiojobs/python-aiojobs.mk b/package/python-aiojobs/python-aiojobs.mk
index 7a95f9908f..5d9a19eb8c 100644
--- a/package/python-aiojobs/python-aiojobs.mk
+++ b/package/python-aiojobs/python-aiojobs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOJOBS_VERSION = 0.2.2
+PYTHON_AIOJOBS_VERSION = 0.3.0
 PYTHON_AIOJOBS_SOURCE = aiojobs-$(PYTHON_AIOJOBS_VERSION).tar.gz
-PYTHON_AIOJOBS_SITE = https://files.pythonhosted.org/packages/57/c5/9eb091930d6574002d1721dab5ca15a1bd69ed5dc8e654159d27223cdd3b
+PYTHON_AIOJOBS_SITE = https://files.pythonhosted.org/packages/da/09/76d9c0d66d2fd1333835f110cd85f7456de7cf3f60425e3b283fba562731
 PYTHON_AIOJOBS_SETUP_TYPE = distutils
 PYTHON_AIOJOBS_LICENSE = Apache-2.0
 PYTHON_AIOJOBS_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
