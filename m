Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,PDS_BTC_ID,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E07C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 06:32:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5596C61107
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 06:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5596C61107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E841C60ABE;
	Wed, 22 Sep 2021 06:32:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id whjdguHXGUFk; Wed, 22 Sep 2021 06:32:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EC5760BF8;
	Wed, 22 Sep 2021 06:32:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 481AF1BF409
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 06:32:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44D0A82B1E
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 06:32:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MscDtC-oIaay for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 06:32:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 83410826FB
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 06:32:41 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id p80so1947242iod.10
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 23:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9l/5juKmf99Tvfaioes1IXeUlfhShadfNOZzW6eiu/A=;
 b=gWLlENjVCFkJfqQbKKHPj0ghwoyxjHwfjNp7F6aj3KClkdipfhdYgzyhMkQQgBAcpZ
 yjvmFHpbXEIQVHxxa72Vl91RN9z6eoQsJtZVj3AQ2DusazLhM7fnoqmqJpX9qgfYbGiO
 Z2+VaMFp1z17hBdP6yK/FzqCozip16aI78RUywEyIQPiX7IquIlFPOuL81fB8IiiGY7a
 LrqMIRpkLdWcqicETjjTKuoRbTPJcKYCNRqiP7J1oCWjv42PRPsLc7HD+VU4K9e+DP0j
 lgcKCCCayhn6S7hngXNB2SI2RDldXRkZLMq8k8DAb/lDfOfovvh5Zl42ZhRRtG3d3EPJ
 Dlnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9l/5juKmf99Tvfaioes1IXeUlfhShadfNOZzW6eiu/A=;
 b=JPBUivlU8jLOiblkMsjxea1XF7pECOT4tH8xkxJgyf77gik3yUkPYzX8sMf88KIo1M
 EX/hxe+hGud351IroHt4FagQ3uHdG/f8sb7rBuZ4/OBKQzY3YtuKxhFkqr+evS5tRbnD
 Xd3nGCluVBsefkPe4E0uNVN6+E+H/5WXxOoJOcP5HydUp9nXkqojKCvnaaAXwIOxO03M
 d1zoNv1jahF8zaUZEpMCXliay9pIvLljH54grxrVn+oNCmhXAbwgn3HNLBiVxDWO0r6s
 QHV7WvS4hOSFe7rbGfbdX9VHL6/EiciwvdrbLfNqEecbUdqQAXLJrHbZii61qhyNoBbU
 BGzg==
X-Gm-Message-State: AOAM533gLZLZ9fwdqwvNyk9gzCF4OlEvpDu7PAx1BJw7+Fn72dRg4BCS
 JBbZQEx1XvyVFfTTxg7Fz+pIwW9kEIg=
X-Google-Smtp-Source: ABdhPJzEE6NYxPdr77rCIbTO4C+qTj9PkfSO2iwFy5f5jcmu6fG28UVjCJfm4e6zuDI/R/jeNJOgEQ==
X-Received: by 2002:a6b:400a:: with SMTP id k10mr1658157ioa.155.1632292360475; 
 Tue, 21 Sep 2021 23:32:40 -0700 (PDT)
Received: from james-x399.localdomain (71-33-146-72.hlrn.qwest.net.
 [71.33.146.72])
 by smtp.gmail.com with ESMTPSA id v17sm598668ilh.67.2021.09.21.23.32.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 23:32:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Sep 2021 00:32:38 -0600
Message-Id: <20210922063238.3953328-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-frozenlist: bump to version
 1.1.1
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
 package/python-frozenlist/python-frozenlist.hash | 4 ++--
 package/python-frozenlist/python-frozenlist.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-frozenlist/python-frozenlist.hash b/package/python-frozenlist/python-frozenlist.hash
index 0ecc5f9cdf..d8ca0d8b3c 100644
--- a/package/python-frozenlist/python-frozenlist.hash
+++ b/package/python-frozenlist/python-frozenlist.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/frozenlist/json
-md5  2a83a520014203d0a56993c332ff7e23  frozenlist-1.1.0.tar.gz
-sha256  d167a5050628323fcb3db410375eb06390ab135454fd85fd79c5832f5ec2b8ed  frozenlist-1.1.0.tar.gz
+md5  3d6747897187eb413327168329ecccde  frozenlist-1.1.1.tar.gz
+sha256  32fa8c86eee5c6f11b44863c0d3e945b2b1a03df3bf218617e832f1f04ba3146  frozenlist-1.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6fd5243e92dd7f98ec69c7ac377728e74905709ff527a5bf98d6d0263c04f5b6  LICENSE.txt
diff --git a/package/python-frozenlist/python-frozenlist.mk b/package/python-frozenlist/python-frozenlist.mk
index b113c38080..e17578879f 100644
--- a/package/python-frozenlist/python-frozenlist.mk
+++ b/package/python-frozenlist/python-frozenlist.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FROZENLIST_VERSION = 1.1.0
+PYTHON_FROZENLIST_VERSION = 1.1.1
 PYTHON_FROZENLIST_SOURCE = frozenlist-$(PYTHON_FROZENLIST_VERSION).tar.gz
-PYTHON_FROZENLIST_SITE = https://files.pythonhosted.org/packages/12/0e/119f1f186e93c21d078db1ddd7b21247a8a49261689d9284dec28be3b08e
+PYTHON_FROZENLIST_SITE = https://files.pythonhosted.org/packages/ab/bb/80e0fdd91fe4018c6c11a1bfe9bb8cb1da8dbb2ed3faa3c1317161d056fa
 PYTHON_FROZENLIST_SETUP_TYPE = setuptools
 PYTHON_FROZENLIST_LICENSE = Apache-2.0
 PYTHON_FROZENLIST_LICENSE_FILES = LICENSE.txt
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
