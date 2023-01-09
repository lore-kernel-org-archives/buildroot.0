Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21322C54EBD
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 03:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AECF4817EB;
	Mon,  9 Jan 2023 03:11:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AECF4817EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q90MOLnakfpr; Mon,  9 Jan 2023 03:11:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECBC4817C3;
	Mon,  9 Jan 2023 03:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECBC4817C3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 408281BF86B
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 03:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AEEB40984
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 03:11:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AEEB40984
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hnimA1ECsrya for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 03:11:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E15F4094D
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E15F4094D
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 03:11:20 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id v2so3994531ioe.4
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 19:11:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e+Yg1bJ68y3EGHPIhONXJM9aszAfXSMXroz1buRqcC4=;
 b=fMln7zsvjzfuBww4bV2yAa5mzJzdSW1+DhYIveih+0iJXOcQtr3d+fAFCA2GoDy2+Y
 qH4mn/Z+M7XWCVpeC31a2PrZgEWWbTxH9XevMNeuD/F9vJn9GwdAcSZ11w9E4oWFr0d3
 HqsS1SosddRgJYF17E2w/muTJvCdJHhBUTEKSw4E6ACVkWRsA2fAlSLD0uWMh59EsQCI
 v7yxaWLPHcNL0qOJhiLTWFeQb/z/hx6ne7NIW5ellGWp/P8XX9d+Qz8MKMi4mKN8JqMb
 YiLQp8/zY8FXH6Z9QK0yBIz+958mkxrEJrDoeOqyZYBGDWWradYgzt3UdycKS5QGuj38
 pJow==
X-Gm-Message-State: AFqh2kpMmaORpTOoNSIj1Re6Z+xlRwJdPE5C9vE8atodZyPMrbbAUT/x
 gtVEoYa7cIOzGHz4G+pYvW6le5Kq24sU6w==
X-Google-Smtp-Source: AMrXdXtGqY57jQ2c4TpTDBAJW9YDZzy1TVzLMYCj59tXwet32n7Pt/uGGxnrP4zRrHpAvK2Bv9y5rA==
X-Received: by 2002:a6b:dc1a:0:b0:6ee:f9e1:4223 with SMTP id
 s26-20020a6bdc1a000000b006eef9e14223mr44566918ioc.11.1673233879909; 
 Sun, 08 Jan 2023 19:11:19 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 z6-20020a05660217c600b006df2b3f17c3sm2822308iox.30.2023.01.08.19.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 19:11:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 20:11:16 -0700
Message-Id: <20230109031116.2017514-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=e+Yg1bJ68y3EGHPIhONXJM9aszAfXSMXroz1buRqcC4=;
 b=CwxizkZUohicN4laG0uFMlUdn+PCfnqd9w+rcA6vqwUKxFDDqLYcMU9nD/+xDSQB7E
 m9/IE6dIrujTmPaECVofwpf947rHK7LUuR2awYUhKiRj0hkhdfMoLCb/8qBcsg8KmjpZ
 /soWmcWbFW+r/WVt+LtZ6Y+/6DskHEbN6BezvFv8+v318AZxjk31DKuNFXDJyskb7F6a
 ZhGxxzKhgEi7CUN+jChtdHcnRWM64u2xpXGZF67CxcNfN1HFv9PL0AkEyCsfYwsOJ6J+
 7uNzBCpucQ/285NziqyCzIvLw5K8vAKfUp9OivbSIC9DjnsXsPOneGWe06XLZ1B97W64
 SzIA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CwxizkZU
Subject: [Buildroot] [PATCH 1/1] package/python-autobahn: bump to version
 22.12.1
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-autobahn/python-autobahn.hash | 4 ++--
 package/python-autobahn/python-autobahn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index 4ae158be03..f9b68dcb22 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5  2921fb2bdea60b4cb36ccec367625995  autobahn-22.7.1.tar.gz
-sha256  8b462ea2e6aad6b4dc0ed45fb800b6cbfeb0325e7fe6983907f122f2be4a1fe9  autobahn-22.7.1.tar.gz
+md5  98d8451385ccd8ece2d2fac023c61a19  autobahn-22.12.1.tar.gz
+sha256  43b4e8b1aeaeb20a0cc0a81572e613dc958057c0ab248a7d6b41b2763270f925  autobahn-22.12.1.tar.gz
 # Locally computed sha256 checksums
 sha256  0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index fb3a7b84de..4c14151960 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 22.7.1
+PYTHON_AUTOBAHN_VERSION = 22.12.1
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/c5/b5/c92d6640fd55cbbdd97c05800ab534d84197f7b485d89a9df981ab67cce3
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/a8/6f/78b90951f263232e468439627f31a2c0846e36043c95af96dc527a4aeee6
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_CPE_ID_VENDOR = crossbar
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
