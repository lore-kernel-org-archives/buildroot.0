Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F0F8C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 07:03:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 178D2615E1
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 07:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 178D2615E1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D618F40337;
	Thu, 30 Sep 2021 07:03:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Gf5tX4ncdt2; Thu, 30 Sep 2021 07:03:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE31F402F7;
	Thu, 30 Sep 2021 07:03:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F03811BF2B7
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 07:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECFD0613AD
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 07:01:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HCjwvpIX5uTk for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 07:01:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F70260715
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 07:01:16 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 f78-20020a1c1f51000000b0030cdb3d6079so3495963wmf.3
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 00:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J7GS5hJT7UU4HhVJ5AzS80BEWvwXO4ycaoNyvhnWhuw=;
 b=JmNt+52sf8AaRYmAsZRvb8IYo5f6xAsg55WQ2EjsouPl8xGiar1qICVrXrYLrUfPlT
 3CctCZd04HAma/cAbU1dogorajHk+VoAGtXT0uQWq6sInEYBGNCiJ1QobbeEqDvpnE4d
 vm4iO9iciciiIArn6GUu8rDLwOyXnZRD6/qRMviZy8g3ji6yZ9rBYxniQIB0xAmlYjNk
 0kcPH0VDcUbYfhvjR4D7bfyQQdG4BEAOUZ3ztm6JgRRw57bll7jHY2xHlzorOzADJYRS
 O4PO1thP0d5PWnHQbd7XdoTZl3ZTv1utwCvwc7ddUZg5CEDnYZPtorg0iWmwgFQKOjYW
 QRtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J7GS5hJT7UU4HhVJ5AzS80BEWvwXO4ycaoNyvhnWhuw=;
 b=HzCNLfaarDm7LrITEKlbVyQXt3DXAr/hEm8QORTUlsRUsy55JFcncT9yCCgx8e0i/U
 QDQp125lmtcNMblWrLJrDf06TaSi9DL80pnuj49OI4/VFetmTbTQTf0zu7eQEJqczKHe
 itWLaBM3d44v4HcK1tgURal5PTYhOj/oufUQ7o4hrl49k/Z8+VfEK4XYnp0H3dQmI8wm
 JnK9H+OcIpaTf+tmBJU4ULc9uVfeRiChPU9A4hEX86Z5965W4GMIcPy+IbSJMPGqEY/F
 9aN1FF6Iz5h8PRmBdnzYTH60KdB/Ds5XOpao7iLbyBFb2kv0mG0c/nmZcjiLcYcF1vTy
 79QA==
X-Gm-Message-State: AOAM532dRUsCIVoMC72i3j5VTbiXmTczg20LMrKxKy2vrsa+77PVNOws
 ZAaD+kxKpQKhJ2vRvGzalRUupKxBymk=
X-Google-Smtp-Source: ABdhPJzofvnAvgYHtTkEXqT/HBdg9l+5T1TctZvRvyAuONIT0U9+5Va5wRoM+hnQYLgcqFEubqQ86g==
X-Received: by 2002:a1c:7c0f:: with SMTP id x15mr3558758wmc.149.1632985275129; 
 Thu, 30 Sep 2021 00:01:15 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:c4c3:c3e7:ea7f:250b])
 by smtp.gmail.com with ESMTPSA id n26sm3801088wmi.43.2021.09.30.00.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 00:01:14 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Sep 2021 10:00:49 +0300
Message-Id: <20210930070051.40361-13-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210930070051.40361-1-asafka7@gmail.com>
References: <20210930070051.40361-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-wrapt: bump to version 1.12.1
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

Plus, indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-wrapt/python-wrapt.hash | 6 +++---
 package/python-wrapt/python-wrapt.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-wrapt/python-wrapt.hash b/package/python-wrapt/python-wrapt.hash
index feab3f056d..63dae991eb 100644
--- a/package/python-wrapt/python-wrapt.hash
+++ b/package/python-wrapt/python-wrapt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wrapt/json
-md5	cc15c001b129f81eb2f79b15eb99ffe5  wrapt-1.11.2.tar.gz
-sha256	565a021fd19419476b9362b05eeaa094178de64f8361e44468f9e9d7843901e1  wrapt-1.11.2.tar.gz
+md5  6d56ed0de4336462a73350341462f45e  wrapt-1.12.1.tar.gz
+sha256  b62ffa81fb85f4332a4f609cab4ac40709470da05643a082ec1eb88e6d9b97d7  wrapt-1.12.1.tar.gz
 # Locally computed sha256 checksums
-sha256	e37c13f84fb3c9a54161b0fcf75f4d302fb86ce42cd6106147bda79e4197d9f2  LICENSE
+sha256  e37c13f84fb3c9a54161b0fcf75f4d302fb86ce42cd6106147bda79e4197d9f2  LICENSE
diff --git a/package/python-wrapt/python-wrapt.mk b/package/python-wrapt/python-wrapt.mk
index 91f9d7f52a..32d8a24c14 100644
--- a/package/python-wrapt/python-wrapt.mk
+++ b/package/python-wrapt/python-wrapt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WRAPT_VERSION = 1.11.2
+PYTHON_WRAPT_VERSION = 1.12.1
 PYTHON_WRAPT_SOURCE = wrapt-$(PYTHON_WRAPT_VERSION).tar.gz
-PYTHON_WRAPT_SITE = https://files.pythonhosted.org/packages/23/84/323c2415280bc4fc880ac5050dddfb3c8062c2552b34c2e512eb4aa68f79
+PYTHON_WRAPT_SITE = https://files.pythonhosted.org/packages/82/f7/e43cefbe88c5fd371f4cf0cf5eb3feccd07515af9fd6cf7dbf1d1793a797
 PYTHON_WRAPT_SETUP_TYPE = distutils
 PYTHON_WRAPT_LICENSE = BSD-2-Clause
 PYTHON_WRAPT_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
