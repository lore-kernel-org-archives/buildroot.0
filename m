Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 746E8C433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 04:40:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3575B61156
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 04:40:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3575B61156
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0430D81DAB;
	Wed, 22 Sep 2021 04:40:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SQIxXTV3mnK2; Wed, 22 Sep 2021 04:40:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DB1B81B25;
	Wed, 22 Sep 2021 04:40:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B0281BF41E
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 04:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27FC283E38
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 04:40:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 87H6U9oNrcY8 for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 04:40:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E27B781D68
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 04:40:15 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id p80so1650896iod.10
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 21:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cTQv4uF+BTFLnD+Gbvp1JrpM82ijvD562Ah65c7PbrM=;
 b=oyh+B6Q34dmYNa2RjBmLxZ8VsWrItI20rwZyqS9qLVM0aM/t1GmZlgYsw+ZT8g3k3o
 BQq5FP5edXitsES4Z2ktI4ZrY7QG3BYtkYVlxDIXpoW2Hd+Y0I8rV88h7HZ5Ykh13RVj
 m1CobhMEuFOhl1Nh6/0UN6S1bbI4vGpni60rKrpUwQ931e5E/8rVHwIZBnn4JYtLVQ2k
 pXFTHo/Au45P9Y8KIQY9JRP564I4JFYyS7ht3If0JWe2hBEF6CjEeQ+X+JL44zDokh2I
 J181DERQN5nGm1/tXnhyR7PgWcmuLefTym0ZZ6RiIqgQphA65IPTojejrnwUgaD7qe9o
 6//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cTQv4uF+BTFLnD+Gbvp1JrpM82ijvD562Ah65c7PbrM=;
 b=zgnA2NACz8KBNYDHtnZFB1AuBk4hAWXsT8vhay0Lb1IG1gl26Ethyk3m6DHlx5Y2vC
 GoXCr8NoZJvc/jlltaaSIJ6HLl9IdR0uRMYR22Ya7ydPR7LCSmZH/x0EdJSYmcl9k+RC
 8T2+daBLaUfpCNqU3DLpOXtawpm4JM6JExx3BzfJi5Sy/nuEhvxltpkcS6ADSqWEPu6Q
 GrfuQyRA27/whawz/ipNS6Dj3+1qokijco4/OgCrEL84lJ9Dpw9WXg/3c8+eKibLJydM
 XsSlIKzmW7huqJ19beCjFh0ez9FOxywan2QVWgfHFhbzfIaAYCIEIA8z/uQz0HUAyJdy
 2wVQ==
X-Gm-Message-State: AOAM533s5WOutLpv0kGH0a2Pk8rJp2BIovlvGGL+7i7iZ+Z3tGB3TvW2
 MRLFy8E/nWFtnhn/uyRTJnYn29QaLwM=
X-Google-Smtp-Source: ABdhPJxnhk+Ei7AJoDI2Dyn4lHduMKdVPqewfzxlOLcc9Med1lTPd+chqFjqEaP0rlfROO8GJ0RhiQ==
X-Received: by 2002:a5e:8d10:: with SMTP id m16mr2736718ioj.215.1632285614810; 
 Tue, 21 Sep 2021 21:40:14 -0700 (PDT)
Received: from james-x399.localdomain (71-33-146-72.hlrn.qwest.net.
 [71.33.146.72])
 by smtp.gmail.com with ESMTPSA id c11sm490088ilq.26.2021.09.21.21.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 21:40:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 22:40:12 -0600
Message-Id: <20210922044012.162305-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-aiozipkin: bump to version
 1.1.0
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

License hash change due to linebreak removal:
https://github.com/aio-libs/aiozipkin/commit/5712878b214d87a2c9b5e95bed30d309b5ea099f

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiozipkin/python-aiozipkin.hash | 6 +++---
 package/python-aiozipkin/python-aiozipkin.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aiozipkin/python-aiozipkin.hash b/package/python-aiozipkin/python-aiozipkin.hash
index af07285c23..356d83786f 100644
--- a/package/python-aiozipkin/python-aiozipkin.hash
+++ b/package/python-aiozipkin/python-aiozipkin.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiozipkin/json
-md5  7be9acaa48d4d4dc14abcc79edfd6c16  aiozipkin-0.7.1.tar.gz
-sha256  aa99984832225378d900a5cd0d4e8e89af7ec9f359612c2e311f55b9039ed501  aiozipkin-0.7.1.tar.gz
+md5  0e98374ea561e4e4e589ffabc0ba6471  aiozipkin-1.1.0.tar.gz
+sha256  bf46a065f87ba51eeb49fed756e285c7faa560f89e0c7ad4bc891d5ae4b5364d  aiozipkin-1.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256  9b42fe3a288996988c552e387e7877be7525a1649e62086aedd6b32d3cb56365  LICENSE
+sha256  98397c300949e0cc1ddc68b0e48e67b10f2d0a4ffada4903d891a1315fe04156  LICENSE
diff --git a/package/python-aiozipkin/python-aiozipkin.mk b/package/python-aiozipkin/python-aiozipkin.mk
index e351dbacfe..37812f2752 100644
--- a/package/python-aiozipkin/python-aiozipkin.mk
+++ b/package/python-aiozipkin/python-aiozipkin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOZIPKIN_VERSION = 0.7.1
+PYTHON_AIOZIPKIN_VERSION = 1.1.0
 PYTHON_AIOZIPKIN_SOURCE = aiozipkin-$(PYTHON_AIOZIPKIN_VERSION).tar.gz
-PYTHON_AIOZIPKIN_SITE = https://files.pythonhosted.org/packages/9e/33/120925f90470b7f52f46e2b9f71caf2514e389f42b3ed3b62f6389baee95
+PYTHON_AIOZIPKIN_SITE = https://files.pythonhosted.org/packages/0a/46/5f328fb8163163f0d4401a1c07585cdf567e56305cb12ce54c9bb62e3f74
 PYTHON_AIOZIPKIN_SETUP_TYPE = setuptools
 PYTHON_AIOZIPKIN_LICENSE = Apache-2.0
 PYTHON_AIOZIPKIN_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
