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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C29BC433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 06:48:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3102B61178
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 06:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3102B61178
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBE7C40704;
	Wed, 22 Sep 2021 06:48:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HMb66IIN4aAk; Wed, 22 Sep 2021 06:48:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D264406D5;
	Wed, 22 Sep 2021 06:48:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CB3251BF409
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 06:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C681C403E8
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 06:48:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v4fUOEcilsnB for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 06:48:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B6B11400DB
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 06:48:00 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id d11so1623885ilc.8
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 23:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kPB6aC5bih0w0hF5+mi7JFzelunls5ySUNFvyZ68ByA=;
 b=LOzlD0VuXjYcNg2DzTYwswSWDhLui9z18Yulk7p/LwV4k9lWPoLp7ZuVJLywSjUZdH
 iJhd23on7qu7Q6T/VFwQ4mFJ+CQvp2++/WRyLuf21DGAtfA3SwGaO1WAPUatMQktZtp1
 Sl8FvPxDfVy4yK6RkR6CHYaSeKAKvRCVmF9Iq1IwYE9Mqc2yp3VCY2H5GO7mGYWtfSWh
 fIFXo9PfDay7X6XXYP7m4RJh52JCNgaZQGwHOLOhQkvfXAGrqIqcqd/W5zHW2TBI2uJa
 hvJDJaIJMgKwQ3YamLABUge1EYi8xmlOe/nGCV2iSmcb+cMZgEtqzRjfJqAUUW1ts0gZ
 Gp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kPB6aC5bih0w0hF5+mi7JFzelunls5ySUNFvyZ68ByA=;
 b=n4vYLQoiiIWYAZCsWQMlLzU1tnxMWxOXmc1SNF/P4vlqsvBeBgz6cmXmZ7WiDP25Z/
 +zvGddB+qKh2OnIEkW1/tgX0GyK/sf30a4ddlKdJ31ToF/KHHpJ6iJ2ni5mlUoBf1Mak
 Vn+MwVe3avMwVlAH4G5I/DUFJA2wOOVDZMfD1y3XjQt3Wc9bcCm9V9+zGOe1eAkdFdUI
 wdwbOKJ08dM0JHhpEm2fOHpBcTZMuKXdXpNBN4TV1Oj5WQElXW76ILXrogCX3RCwErQQ
 T3J8b8cFkcMYlw3D82+aMqWQL0vdHauiI7muTlIEGzmy0Qt1XoeFddZvNQgs1hLcxdMf
 lahQ==
X-Gm-Message-State: AOAM532kedsQgngXnJ2vxsOSLUtSBlN5jIZoRQKJdauBUVxnX04eNSpo
 D1XQ0TONbh30uMTmqJwmj9VmnIV6HT8=
X-Google-Smtp-Source: ABdhPJyhMCZrswZiAFaPpOjMnQxQiJfIRvzqyXrj7kafg9s+cffgR1NH2O4xUJhhGKjllw0xL2zR1Q==
X-Received: by 2002:a05:6e02:dd3:: with SMTP id
 l19mr24382597ilj.144.1632293279643; 
 Tue, 21 Sep 2021 23:47:59 -0700 (PDT)
Received: from james-x399.localdomain (71-33-146-72.hlrn.qwest.net.
 [71.33.146.72])
 by smtp.gmail.com with ESMTPSA id d10sm645273ilu.54.2021.09.21.23.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 23:47:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Sep 2021 00:47:58 -0600
Message-Id: <20210922064758.190101-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-multidict: bump to version
 5.1.0
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
 package/python-multidict/python-multidict.hash | 4 ++--
 package/python-multidict/python-multidict.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-multidict/python-multidict.hash b/package/python-multidict/python-multidict.hash
index 6b78301200..65af9a58e5 100644
--- a/package/python-multidict/python-multidict.hash
+++ b/package/python-multidict/python-multidict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/multidict/json
-md5  b1dab3349efe90934ae3612f1202b733  multidict-5.0.2.tar.gz
-sha256  e5bf89fe57f702a046c7ec718fe330ed50efd4bcf74722940db2eb0919cddb1c  multidict-5.0.2.tar.gz
+md5  df8b37f069809779214d6b80b250e45b  multidict-5.1.0.tar.gz
+sha256  25b4e5f22d3a37ddf3effc0710ba692cfc792c2b9edfb9c05aefe823256e84d5  multidict-5.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a1c5825513279d3085a0ba46880e148ea3710c149bbaedcf2d11605a5ed3c4ad  LICENSE
diff --git a/package/python-multidict/python-multidict.mk b/package/python-multidict/python-multidict.mk
index a7043643c5..edf9656043 100644
--- a/package/python-multidict/python-multidict.mk
+++ b/package/python-multidict/python-multidict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIDICT_VERSION = 5.0.2
+PYTHON_MULTIDICT_VERSION = 5.1.0
 PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
-PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/da/e6/50c7f52781f45c2b37c77e962c30a3944a9e79a46ea92956e826c24d3432
+PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/1c/74/e8b46156f37ca56d10d895d4e8595aa2b344cff3c1fb3629ec97a8656ccb
 PYTHON_MULTIDICT_SETUP_TYPE = setuptools
 PYTHON_MULTIDICT_LICENSE = Apache-2.0
 PYTHON_MULTIDICT_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
