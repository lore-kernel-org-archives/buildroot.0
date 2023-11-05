Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E64C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 05:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1002581CA3;
	Sun,  5 Nov 2023 05:45:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1002581CA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UBhSJF-u_oaH; Sun,  5 Nov 2023 05:45:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 591EF821B2;
	Sun,  5 Nov 2023 05:45:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 591EF821B2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E9D9A1BF5DF
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 05:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D032E81D24
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 05:45:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D032E81D24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rhkwc0zY43cQ for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 05:45:10 +0000 (UTC)
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D42081CA3
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 05:45:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D42081CA3
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3574297c79eso13139795ab.1
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 22:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699163109; x=1699767909;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E4i87vQ3gRPy/8KJonehFetT9CbpDwoCB19VOugQwwY=;
 b=WQBzJz4kKX5YHDV/OuH/WxgO5mTVTy4+eSIW4bzp01I9ItrAFbEFO5yHqgxsOPpAcC
 1AI/IK2teWQN+4/mpg4qoMd010f+qOIt6h3sNwf0QF68xgJ5okdirGIwB/F5vLwfoXMr
 CHjWrVrLnUE3XxSg5wCaF81zip0BttlPR8S9DtbB4O33TeqIsFryw2M23CWJHz9QClUV
 1QdCW7OOY63V9iK4zu6dmycUcWqV8anCvLw0IES0XySb5/nC7b3av8A4wCyVyJ2sgU/r
 ZVIGrJMMhfMYhF9qJYmsjf4xQzZlnex9W7en5mOfHMVuwcsvoMTuixv9FTy35CVQWkdA
 DrsA==
X-Gm-Message-State: AOJu0Yz8m6FirNoHu4NsKpym5cRZob3jR9gdjlopI406Zzi8LFRKMZbx
 Xgzkqh+wBSM04225DZdQduMTOzMn8bE=
X-Google-Smtp-Source: AGHT+IEr50kQc07mAcaZHZ+2g6Sl0qne3jDw0xISFSZGJ+kJ42MI4UtUxHVBlY/8J9S3aWmAFKrdww==
X-Received: by 2002:a05:6e02:20e8:b0:351:5acb:281 with SMTP id
 q8-20020a056e0220e800b003515acb0281mr32972105ilv.31.1699163109166; 
 Sat, 04 Nov 2023 22:45:09 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 v2-20020a056e0213c200b0034e28740e35sm1675313ilj.78.2023.11.04.22.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 22:45:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 23:45:02 -0600
Message-Id: <20231105054502.2846404-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231105054502.2846404-1-james.hilliard1@gmail.com>
References: <20231105054502.2846404-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699163109; x=1699767909; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E4i87vQ3gRPy/8KJonehFetT9CbpDwoCB19VOugQwwY=;
 b=WBFGIM2q5wj59wa7bxHx1wkMV8GZba8Wu39Ap362HnrR7/bVfoym8H+rl4qVmDDqEn
 dW4V3qxYj32jGsx0EzR1mGbtkX47WD6Z2taHdSPlDSLISdsDMfePnWBFFAzWWkdxQYrC
 YWKF/VGIgxO/ne/d5RzV9lsVmgLGTEZKN+E7A4Jmu8mPDDuerS4sRHSUpyFkg+Uyq0xe
 CbKdafE428Jx9k9BImRmcHPIFRP+crE+530ShhLTwG2rsGWSreb4nLyfDRqJZiXinVKN
 xs4nu3PQ5CDVFdakDggYEm2wSJUHtF9pfJFtfzm+ltUeDdgJmC9nGxgdVEh16Kf4efGT
 vJMQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WBFGIM2q
Subject: [Buildroot] [PATCH 4/4] package/python-filelock: bump to version
 3.13.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-filelock/python-filelock.hash | 4 ++--
 package/python-filelock/python-filelock.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-filelock/python-filelock.hash b/package/python-filelock/python-filelock.hash
index 4ef7afed00..3013cb6789 100644
--- a/package/python-filelock/python-filelock.hash
+++ b/package/python-filelock/python-filelock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/filelock/json
-md5  40eeb4a2963e1b07b8eab12b5db08418  filelock-3.9.0.tar.gz
-sha256  7b319f24340b51f55a2bf7a12ac0755a9b03e718311dac567a0f4f7fabd2f5de  filelock-3.9.0.tar.gz
+md5  368d00d1946b89c910d4bf1da68b5a66  filelock-3.13.1.tar.gz
+sha256  521f5f56c50f8426f5e03ad3b281b490a87ef15bc6c526f168290f0c7148d44e  filelock-3.13.1.tar.gz
 # Locally computed sha256 checksums
 sha256  88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd  LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index 02759935ad..a32517b1ad 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FILELOCK_VERSION = 3.9.0
+PYTHON_FILELOCK_VERSION = 3.13.1
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
-PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/0b/dc/eac02350f06c6ed78a655ceb04047df01b02c6b7ea3fc02d4df24ca87d24
+PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/70/70/41905c80dcfe71b22fb06827b8eae65781783d4a14194bce79d16a013263
 PYTHON_FILELOCK_SETUP_TYPE = pep517
 PYTHON_FILELOCK_LICENSE = Public Domain
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
