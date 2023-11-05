Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BC3C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 07:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CB5641B68;
	Sun,  5 Nov 2023 07:07:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CB5641B68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tu6L87DYYszq; Sun,  5 Nov 2023 07:07:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7907B41B5E;
	Sun,  5 Nov 2023 07:07:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7907B41B5E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8A4051BF588
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 07:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 629BC41B5E
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 07:07:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 629BC41B5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CBGZ082dLJZh for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 07:07:12 +0000 (UTC)
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5DE4541B5D
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 07:07:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DE4541B5D
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-35809893291so13618245ab.1
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 00:07:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699168031; x=1699772831;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pEp4X5TlWrxMXXaUEu6IjdR6qzHuh3dfEMeOJ2T2W7I=;
 b=vdpqTbUvEPAz1yi5P4r3j6TVCeKhvj6aLMUDg/XcicZksYSaLu8q0KONbAS0ENb78L
 YGzsyf9NJrKjPNBsGTHLwLNty1iUsI6+I9pEp15/Mnl9ocKR4Z7GeHOJXlCOkVio5vev
 1CRF37TemK2GhWFR5CP8mXFd8oDtOcP2m3XcvX7cBDI6vRpV5bCCtqTGG0nSG4l/zwkx
 c019VsNs2KzMtawluo6w9bNOYh7zl7oIU3rNG10sGFqKyyx8c2e9OlauKXyszrowX4QK
 pdKm9w38VRpjVBMwuUeyIzbr8qC11wHOyWEcjSqOMrqGIQ36hF/A29ULC93TUqrJEDdf
 SWxQ==
X-Gm-Message-State: AOJu0YwtrRAkHMezp9RupQBS/+z8WoLKoDz8cvabToSY5ikvg4YllNW9
 5dGuaCWfWecLtTf6wSSrsPz+bEV0Q1o=
X-Google-Smtp-Source: AGHT+IHUGHFyQ/szcUMRnqDbzADbDukdWnXr+bHzvVSceLnulwa5tWsvusSh6K+ivi0wYUarlp/Ccg==
X-Received: by 2002:a05:6602:2b91:b0:792:72b8:b90 with SMTP id
 r17-20020a0566022b9100b0079272b80b90mr31182531iov.16.1699168030890; 
 Sun, 05 Nov 2023 00:07:10 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 c13-20020a5ea90d000000b007951e14b951sm1628926iod.25.2023.11.05.00.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 00:07:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 01:07:08 -0600
Message-Id: <20231105070708.2870403-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699168031; x=1699772831; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pEp4X5TlWrxMXXaUEu6IjdR6qzHuh3dfEMeOJ2T2W7I=;
 b=VJAQzH/8y4C3q1/pXjsCzaSPBPzaokadqIwQLeExldaFfOMfQV3zDyQ3SoZXbhG+p/
 VBaI1z+jX05FPF9j4vJZIxGVYkRv4AzHM3Oc3be++J5vMPXc/L1i9i3FTtkP6rfksN69
 r/4uw7BUFHnRNs1X8PIYAN8IXZqf8WL+uucIcLhU6vVs1RxITHq4x48G9EUNv7GU7HRQ
 WzU/bZbqmPxhsoWn0lXu6dXSVh7CBzyZSswAx3qtmr83c1A6nX/ijUxs2FMYbcYtxiHY
 YCPm2dGlH9fJNNpofBofoSXZT3GJQcmfduq27g59Xt/C8NQB5GCLy3JF92ykNXnOBhsn
 2Whg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VJAQzH/8
Subject: [Buildroot] [PATCH 1/1] package/python-gitdb2: bump to version
 4.0.11
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-gitdb2/python-gitdb2.hash | 4 ++--
 package/python-gitdb2/python-gitdb2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-gitdb2/python-gitdb2.hash b/package/python-gitdb2/python-gitdb2.hash
index 7bc187cf53..c70c1aade9 100644
--- a/package/python-gitdb2/python-gitdb2.hash
+++ b/package/python-gitdb2/python-gitdb2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/gitdb/json
-md5  3f52187435ab0b6e64a15782ffaf29ab  gitdb-4.0.7.tar.gz
-sha256  96bf5c08b157a666fec41129e6d327235284cca4c81e92109260f353ba138005  gitdb-4.0.7.tar.gz
+md5  6071755f2899cd4882b83a070b045bac  gitdb-4.0.11.tar.gz
+sha256  bf5421126136d6d0af55bc1e7c1af1c397a34f5b7bd79e776cd3e89785c2b04b  gitdb-4.0.11.tar.gz
 # Locally computed sha256 checksums
 sha256  efd29f596a08e8857e68e7694a50bcda72839792da7c3f041bcbff5f18009239  LICENSE
diff --git a/package/python-gitdb2/python-gitdb2.mk b/package/python-gitdb2/python-gitdb2.mk
index 91a17e24a7..424f37f8f4 100644
--- a/package/python-gitdb2/python-gitdb2.mk
+++ b/package/python-gitdb2/python-gitdb2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GITDB2_VERSION = 4.0.7
+PYTHON_GITDB2_VERSION = 4.0.11
 PYTHON_GITDB2_SOURCE = gitdb-$(PYTHON_GITDB2_VERSION).tar.gz
-PYTHON_GITDB2_SITE = https://files.pythonhosted.org/packages/34/fe/9265459642ab6e29afe734479f94385870e8702e7f892270ed6e52dd15bf
+PYTHON_GITDB2_SITE = https://files.pythonhosted.org/packages/19/0d/bbb5b5ee188dec84647a4664f3e11b06ade2bde568dbd489d9d64adef8ed
 PYTHON_GITDB2_SETUP_TYPE = setuptools
 PYTHON_GITDB2_LICENSE = BSD-3-Clause
 PYTHON_GITDB2_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
