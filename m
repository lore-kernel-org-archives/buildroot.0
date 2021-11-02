Return-Path: <SRS0=drHZ=PV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7095FC433EF
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 07:51:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7A80604DA
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 07:51:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C7A80604DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FF2A60727;
	Tue,  2 Nov 2021 07:51:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8rN-sbFRjDzm; Tue,  2 Nov 2021 07:51:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C127060682;
	Tue,  2 Nov 2021 07:51:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2CEC31BF5EA
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 07:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28C0E80C7B
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 07:51:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OmZYmpRl_Vxx for <buildroot@lists.busybox.net>;
 Tue,  2 Nov 2021 07:50:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 53FCD80C4E
 for <buildroot@buildroot.org>; Tue,  2 Nov 2021 07:50:59 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id s3so21100267ild.0
 for <buildroot@buildroot.org>; Tue, 02 Nov 2021 00:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i8gLYCUFaTII5j+Qr1kY1E5YcD8bmC64OI2g8lSxGVA=;
 b=FAuYQ6XkR4Ot2RJm2A6cMk/XHzZw6fJv6Wn2ADr5T8a5Wg8n0oN8VhkzcUofWTbycm
 OCmZOunh3tPUZhTdMt2IgYBsr4wcTRinHw/2rLdH5+fhTX2dAEMn9s+HxmQdwLx+KAxe
 uUdEZmV6rbavQeIr0kB4H5WybR58JgJfFrOgAmk858o5TOVRxe3ULTyVL06SfU0atK8R
 gzjNnKb7mRZRSTZJE6sMdiqG6Mjh4Pg1woWsJJDLkt+azoyPepd9K6Z92jACxjU8OTc5
 APnIzClyaJc8yrkTJxDQEAkclQVXJTbOIRSEzjgP6oaac7ps9WWta7yyAiJZG+VaTqGb
 SfzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i8gLYCUFaTII5j+Qr1kY1E5YcD8bmC64OI2g8lSxGVA=;
 b=h9sYkdOb67ehaOLNZLi2rwqg/fuQ1c7VviyKuJFPhqWsh2dio+IEXBE3oXQ2SqzQbr
 lS4h77/X9ZWOlNAYzzfBabQ8AS4d6vywdnVSy4ORAPTkWYAPT7fF+zISUp/GymkwacmC
 d4aTp4De4Jq9li6a1KkXeQqiiVZ5ddCI8nhK16xoVAGWaiWefxgYPta68BfCyi9qM+xp
 j/v11fJPbHEF1+nYIE0wctKOURUIICQuYm/XKULI6btzM1Iqm3ryg5mNOloyjbdKoG4s
 SVBS+UfjM8qg0BY2IbDp/zwF2Re8iu/v47PE55IVpwruNKVN/kxhGh96g8peicPBqilR
 AyqQ==
X-Gm-Message-State: AOAM532T9fNoJ6LhjLM6tyRL6gmDbN1YE3r8dYMaAJ5A/O65nnbMXxwG
 JEqZSbs+LWZMf0pok2sp9UATx3QAhbE=
X-Google-Smtp-Source: ABdhPJwqUbh82f7eZQ3P6L5Aj5VhZfiaq2/+BIq4+KnQ3KDJk/sztkDE1x1WnMfnQToDnCBAl9gjdA==
X-Received: by 2002:a05:6e02:180e:: with SMTP id
 a14mr23838134ilv.313.1635839458270; 
 Tue, 02 Nov 2021 00:50:58 -0700 (PDT)
Received: from james-x399.localdomain (71-218-115-49.hlrn.qwest.net.
 [71.218.115.49])
 by smtp.gmail.com with ESMTPSA id n4sm1658839ili.10.2021.11.02.00.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 00:50:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  2 Nov 2021 01:50:55 -0600
Message-Id: <20211102075055.3459307-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-yarl: bump to version 1.7.2
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-yarl/python-yarl.hash | 4 ++--
 package/python-yarl/python-yarl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-yarl/python-yarl.hash b/package/python-yarl/python-yarl.hash
index e488ee6939..bf971e9a9a 100644
--- a/package/python-yarl/python-yarl.hash
+++ b/package/python-yarl/python-yarl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/yarl/json
-md5  624ac1cd36abe92dc437fa97209c5c68  yarl-1.7.0.tar.gz
-sha256  8e7ebaf62e19c2feb097ffb7c94deb0f0c9fab52590784c8cd679d30ab009162  yarl-1.7.0.tar.gz
+md5  acd3eb25a9c46b10a699a3bee5fb9777  yarl-1.7.2.tar.gz
+sha256  45399b46d60c253327a460e99856752009fcee5f5d3c80b2f7c0cae1c38d56dd  yarl-1.7.2.tar.gz
 # Locally computed sha256 checksums
 sha256  56d6ac6c8105c0a51304c21db060e361af9a8ea0af9a75c239c28b5d13693838  LICENSE
diff --git a/package/python-yarl/python-yarl.mk b/package/python-yarl/python-yarl.mk
index 8a1a3bbca0..175aaa7a35 100644
--- a/package/python-yarl/python-yarl.mk
+++ b/package/python-yarl/python-yarl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_YARL_VERSION = 1.7.0
+PYTHON_YARL_VERSION = 1.7.2
 PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
-PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/7f/5c/a4ce6d4f46413afe49734bf901939105f4ce7fcfbcf87d0777cc39501060
+PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/f6/da/46d1b3d69a9a0835dabf9d59c7eb0f1600599edd421a4c5a15ab09f527e0
 PYTHON_YARL_LICENSE = Apache-2.0
 PYTHON_YARL_LICENSE_FILES = LICENSE
 PYTHON_YARL_SETUP_TYPE = setuptools
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
