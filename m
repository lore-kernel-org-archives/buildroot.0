Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0FA1C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 07:01:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50B80615E1
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 07:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 50B80615E1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1014D40345;
	Thu, 30 Sep 2021 07:01:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iN3H82MTHtqW; Thu, 30 Sep 2021 07:01:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C7D9402F2;
	Thu, 30 Sep 2021 07:01:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 943241BF2B7
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 07:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 832B3402D6
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 07:01:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vq5a_N4bIVli for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 07:01:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 80643400FD
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 07:01:03 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 c73-20020a1c9a4c000000b0030d040bb895so3516271wme.2
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 00:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7tCYjuWWTvxYjoMxQNxbGxlOaeucZZOiCRVDnSHKy4A=;
 b=J8goXhLNnKUDjx17OJ7TrXstHzE4nOt2VAJ4T59N2S1HaIQKMeDmxPKfEUzJB4L1vL
 BIeXrQmWAInQ+ed1R0Ods83JeQzrYfRgIZe0WCwX/1Ku5w7akilm9ZC9FmC0IjTxlhvR
 w2Ygn33ICVTTrw9AY6nu1tSJTzJriGXaxaKtInZG/C6FVV0xGe12naJtyZZLaTZN7UhG
 DPk8fMatM6AcrHWHsoHPVp6sLLnKygfCD6k+I+/3mPw0nC5wLOluevMzk0OOsA31j2Ck
 S4GaB96dTCotlLTco9a9zAMxF4Nb/1hY/uKt5V6Kq8aysY9s5e4/oWJTlX+uJdvK3zXb
 fBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7tCYjuWWTvxYjoMxQNxbGxlOaeucZZOiCRVDnSHKy4A=;
 b=Tyrxz9QeYVE7ZBCPMDua/c5BmP9LgK+dLdNKXoL/k0A1OkxKQYFVHpt2rBbD+XPZOU
 MgfmF8ffRsTCLoaesz4LExoNUEMKRdyDjKoAKgwETbMCt/O/hOH98D0G+jkk5VI91tD2
 EM+8QaHp6OX5NEYh30aO6EYz5xfI7CZUuOMEpWEC0VqePqJVMdrFR+VeD85e01uCZbeu
 sHR68Kx5P4P5NgC8YFxu87G3ZKxwMoMbW80ttLNFI/Ok9l27h7OXDZ6OTX+4eDhNbrdw
 hu7NBVdz1zc2W284I2OYDQTLjogJNq3i4tBJ0hVnuc+fL+mGjfWXUyrv7smBYUM2j5zR
 JEKQ==
X-Gm-Message-State: AOAM531WkH/42nmqe6JhQLj1eClQf4bDRhvp9hpwmX2KWKVmMO0du6rM
 NOVUqhUyut6+CkMzSlV38Cal3upgZ80=
X-Google-Smtp-Source: ABdhPJzrfZYHW1zsam6Z3S2CF7pL6o8BwbmCNLuva2J//12y5ZZRUk7GmrI6g2e5XBDC9sIwpUYLdw==
X-Received: by 2002:a05:600c:214a:: with SMTP id
 v10mr3618272wml.167.1632985261564; 
 Thu, 30 Sep 2021 00:01:01 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:c4c3:c3e7:ea7f:250b])
 by smtp.gmail.com with ESMTPSA id n26sm3801088wmi.43.2021.09.30.00.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 00:01:01 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Sep 2021 10:00:40 +0300
Message-Id: <20210930070051.40361-4-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210930070051.40361-1-asafka7@gmail.com>
References: <20210930070051.40361-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/python-schedule: bump to version
 1.1.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

* The package doesn't support python2 anymore.
* Indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-schedule/Config.in            | 1 +
 package/python-schedule/python-schedule.hash | 6 +++---
 package/python-schedule/python-schedule.mk   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-schedule/Config.in b/package/python-schedule/Config.in
index d00c245948..a0f800e364 100644
--- a/package/python-schedule/Config.in
+++ b/package/python-schedule/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_SCHEDULE
 	bool "python-schedule"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  Job scheduling for humans.
 
diff --git a/package/python-schedule/python-schedule.hash b/package/python-schedule/python-schedule.hash
index 79777829de..3d67be0f5e 100644
--- a/package/python-schedule/python-schedule.hash
+++ b/package/python-schedule/python-schedule.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/schedule/json
-md5	e29fd3b436b03220e147a4ed8191d220  schedule-0.6.0.tar.gz
-sha256	f9fb5181283de4db6e701d476dd01b6a3dd81c38462a54991ddbb9d26db857c9  schedule-0.6.0.tar.gz
+md5  9bf7544e37824e450457187633a17b17  schedule-1.1.0.tar.gz
+sha256  e6ca13585e62c810e13a08682e0a6a8ad245372e376ba2b8679294f377dfc8e4  schedule-1.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256	30a8352c318ce1b645acde0299697342d4380ed2637d7ca18a8ad25661e3b41b  LICENSE.txt
+sha256  30a8352c318ce1b645acde0299697342d4380ed2637d7ca18a8ad25661e3b41b  LICENSE.txt
diff --git a/package/python-schedule/python-schedule.mk b/package/python-schedule/python-schedule.mk
index c0cc7dce8c..fc6081cf22 100644
--- a/package/python-schedule/python-schedule.mk
+++ b/package/python-schedule/python-schedule.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SCHEDULE_VERSION = 0.6.0
+PYTHON_SCHEDULE_VERSION = 1.1.0
 PYTHON_SCHEDULE_SOURCE = schedule-$(PYTHON_SCHEDULE_VERSION).tar.gz
-PYTHON_SCHEDULE_SITE = https://files.pythonhosted.org/packages/00/07/6a9953ff83e003eaadebf0a51d33c6b596f9451fcbea36a3a2e575f6af99
+PYTHON_SCHEDULE_SITE = https://files.pythonhosted.org/packages/a8/b5/a291a4c0faa491fd5baefa6d89011ece581cff47b23c0a39b42a63383358
 PYTHON_SCHEDULE_SETUP_TYPE = setuptools
 PYTHON_SCHEDULE_LICENSE = MIT
 PYTHON_SCHEDULE_LICENSE_FILES = LICENSE.txt
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
