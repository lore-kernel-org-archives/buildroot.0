Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0CE0C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 20:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7DA5440BC6;
	Thu,  3 Nov 2022 20:50:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DA5440BC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ugf_AaQjjHhq; Thu,  3 Nov 2022 20:50:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BABCC40BC0;
	Thu,  3 Nov 2022 20:50:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BABCC40BC0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A2B541BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B2B26072A
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:50:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B2B26072A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uWWwUwu32qCE for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:50:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF9A960709
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF9A960709
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:50:20 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id s10so546273ioa.5
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 13:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=55DUl8WMUFvziZUfAv9tyaUASDkqGhjb/OKsBz36ypk=;
 b=GWXLLDm7wX8G3Lz0veJVz2U1H86VyjsvEadr3w+RsFwcAOYOfX2VYYa5RFxwk3qaE5
 kqoR1KPbjYbbXn5j+UvWSibw4gVwHgiaHicimJY8n5/a4iEqOgVM4VOphducD6kd0jjc
 K8PIvOKoHmPRZ3OZWq2Ktlilb6g6v2Mgmchxbs5J/h13K8UAT/wwusotENqib2jTRdLI
 dgw1VA85fKwjap6+vhgZ5IVS9PCuN8jWkPxOqi255jNonZu1CoVO1zt2ipsHxZKVPPhL
 /p6MlFKTf0ibR3M8LhlQ5kKbasJM8QVeYvMj8bCYfKf63AiXWXWSCB0KuJYVfjcTUXXh
 Xx8g==
X-Gm-Message-State: ACrzQf0Lr0Bm8d+LBVylvpcfnWfI4O9OfSBeHLA9tAeftCLTee4ztsRs
 vWKt6gY95D3l05NxqBcCVhfSmUXz+iC6OMv0
X-Google-Smtp-Source: AMsMyM4Wq9Y8XLyccee9grRkj5G46tdIlcmVwvR5ZdS3U0OvzYM82Uol4Shnd7FdUt3PjFxdbzIVJg==
X-Received: by 2002:a05:6638:13cc:b0:35b:a3e1:3ccf with SMTP id
 i12-20020a05663813cc00b0035ba3e13ccfmr19255255jaj.317.1667508619534; 
 Thu, 03 Nov 2022 13:50:19 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 q16-20020a02b050000000b0035a10a7e3ecsm530945jah.74.2022.11.03.13.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 13:50:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 14:50:17 -0600
Message-Id: <20221103205017.1985263-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=55DUl8WMUFvziZUfAv9tyaUASDkqGhjb/OKsBz36ypk=;
 b=S1yd0esa6X/FXdVNH/i+PwG8piiMvQvlQVMmJNGDW0yBukKftdkiaOfFNeLLRiycKY
 8kdHFFbMhBLYT7xev6BwF6X9dqZO/8j19PlfDzrAE42tnRVHOep6uwJA3kpDL8PoQR0/
 9umcY9BrB5+3H1aS/Btnare6AXGfjMaeIPZZilNuefexsliKHd7hAuZi+W7hhQYZU/NM
 8ezIhb+kdwb4fJYpYUai87Nrl+fO9SgRDMAdtzATjghTQ4Kx2Ju7eKAV8xZktRvl4ODM
 n8W0GNw+TtjVe8b4v6y8GHer5ps9sxREi830RZ0LyLkzGxvIPd9TpCwLrQzZBTanjXy3
 q8KA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=S1yd0esa
Subject: [Buildroot] [PATCH 1/1] package/python-werkzeug: bump to version
 2.2.2
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
 package/python-werkzeug/python-werkzeug.hash | 4 ++--
 package/python-werkzeug/python-werkzeug.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-werkzeug/python-werkzeug.hash b/package/python-werkzeug/python-werkzeug.hash
index 73fa6b5630..13b95bc448 100644
--- a/package/python-werkzeug/python-werkzeug.hash
+++ b/package/python-werkzeug/python-werkzeug.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/Werkzeug/json
-md5  5835c8738b8081c53367cbcc5db8784c  Werkzeug-2.1.2.tar.gz
-sha256  1ce08e8093ed67d638d63879fd1ba3735817f7a80de3674d293f5984f25fb6e6  Werkzeug-2.1.2.tar.gz
+md5  9d7e50c5bb3a9fc12823b5faf374b90e  Werkzeug-2.2.2.tar.gz
+sha256  7ea2d48322cc7c0f8b3a215ed73eabd7b5d75d0b50e31ab006286ccff9e00b8f  Werkzeug-2.2.2.tar.gz
 # Locally computed sha256 checksums
 sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.rst
diff --git a/package/python-werkzeug/python-werkzeug.mk b/package/python-werkzeug/python-werkzeug.mk
index 9b32fdf097..3ebae3c165 100644
--- a/package/python-werkzeug/python-werkzeug.mk
+++ b/package/python-werkzeug/python-werkzeug.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WERKZEUG_VERSION = 2.1.2
+PYTHON_WERKZEUG_VERSION = 2.2.2
 PYTHON_WERKZEUG_SOURCE = Werkzeug-$(PYTHON_WERKZEUG_VERSION).tar.gz
-PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/10/cf/97eb1a3847c01ae53e8376bc21145555ac95279523a935963dc8ff96c50b
+PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/f8/c1/1c8e539f040acd80f844c69a5ef8e2fccdf8b442dabb969e497b55d544e1
 PYTHON_WERKZEUG_SETUP_TYPE = setuptools
 PYTHON_WERKZEUG_LICENSE = BSD-3-Clause
 PYTHON_WERKZEUG_LICENSE_FILES = LICENSE.rst
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
