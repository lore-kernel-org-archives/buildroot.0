Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23CF1C61D9D
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 06:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9F7B60E47;
	Sat, 25 Nov 2023 06:57:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9F7B60E47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CB75C3X_QHBF; Sat, 25 Nov 2023 06:57:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17D7760AF6;
	Sat, 25 Nov 2023 06:57:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17D7760AF6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E4F2F1BF861
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 06:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6DCE8223B
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 06:56:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6DCE8223B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1GlBd9GLduYR for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 06:56:56 +0000 (UTC)
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A0EF282217
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 06:56:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0EF282217
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-35ab17957c3so9539675ab.3
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 22:56:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700895415; x=1701500215;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+JETYsKBallygLQBx7rSOpgXTeHNb0bj/kwDr92HOUg=;
 b=R+zCs+OHQzImdiBcZSHb8d3fyMC9k5FpOVOPniYCBKMRgrYNFbEIkkcDjXWZ8VvrfB
 e6Cvm2GKOLeRnnBoA/1gqx0bRbhuG9b/S+tWdgx0U1acL+p9YrYaNz25Fj/WVNuvRuNE
 LfohWWwRRLzA4KnIol13BmRdHPi6YeuySuv/2IW6aYcuXqCrw2zQzAQ2wgOCH+V1sjls
 hr/UdR/vfd2CPCsNphPZYFYwUcH3xPiwgFKr6NGZ8sGCZRzlmOf9typi7U6dml2e0MtU
 rouGnsmypzTo2yHCE8UGD57I7/yNaWdaKNFrmDBLA73V0rSBzGQacbpkVD16NNT0pqt5
 +9UQ==
X-Gm-Message-State: AOJu0YykNiRzO2a2hTTwrjdXP7y43MoyXuoHCREWL1/h5arvjQFIE7bB
 UeyATfavf38KMTTvPuK7nYe+n1SBsiU=
X-Google-Smtp-Source: AGHT+IGTmJQJqIbMG95rUKY2VzR/hp38YJ6UdMhN9v9ubrEOS+I5LSFwx7qR46pgO9DSN/EZGRONHg==
X-Received: by 2002:a92:cc4c:0:b0:35c:7ce9:fd2f with SMTP id
 t12-20020a92cc4c000000b0035c7ce9fd2fmr2076653ilq.13.1700895415174; 
 Fri, 24 Nov 2023 22:56:55 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 k14-20020a92c9ce000000b0035b0ad262e2sm1466115ilq.47.2023.11.24.22.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 22:56:54 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 23:56:53 -0700
Message-Id: <20231125065653.831873-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700895415; x=1701500215; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+JETYsKBallygLQBx7rSOpgXTeHNb0bj/kwDr92HOUg=;
 b=VLdUXffvW/B0Hrabd5hxHxOpHNx1OKUV7gDwlJBhM1QWQ4PyUF2FSqrGws9ff8pL2O
 +Vj5XB6P8iZOWcowbM7RI3HL5kk3HEQSsYl8ZNrQJzepUa7CsKtMfX5Z2kVvu5RS31z9
 h8bqIF9YlACKmfw4Z5nIS/GS5yt0ZyRIXTHSheGDgLSJmrynI+cTC7wnDCHHwy/A3YeU
 baMhNMuVIu0BhSAZbcaC+BANuxXL2ZJkbgwCM3iUwjfTsC61l2Rd3VNpeEu8nlpGVkjH
 dqnum0K4l6j4mwNWDnqkmo2euyBNTEVck+mSYUmaiMQg9bxnLAqtCWclJBc0942lPGwU
 J1bw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VLdUXffv
Subject: [Buildroot] [PATCH 1/1] package/python-pycrate: bump to version
 0.7.0
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
 Nasser Afshin <afshin.nasser@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pycrate/python-pycrate.hash | 4 ++--
 package/python-pycrate/python-pycrate.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycrate/python-pycrate.hash b/package/python-pycrate/python-pycrate.hash
index fd41274369..94ec99b738 100644
--- a/package/python-pycrate/python-pycrate.hash
+++ b/package/python-pycrate/python-pycrate.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycrate/json
-md5  d51fd27d99481990ff85a1e418b1c938  pycrate-0.6.0.tar.gz
-sha256  b49738c02a3f93ba9f76c0dac82b689a5341882814b36c714e9600e9f560daf7  pycrate-0.6.0.tar.gz
+md5  bd21fa697ecff7ad93bec4943230d281  pycrate-0.7.0.tar.gz
+sha256  c83232f522b5bbc3b3eeaca2cf38ee63cd3c25d0c15f3ba221e6dafa89b9a763  pycrate-0.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  license.txt
diff --git a/package/python-pycrate/python-pycrate.mk b/package/python-pycrate/python-pycrate.mk
index 2f947ab807..1645eaf52c 100644
--- a/package/python-pycrate/python-pycrate.mk
+++ b/package/python-pycrate/python-pycrate.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCRATE_VERSION = 0.6.0
+PYTHON_PYCRATE_VERSION = 0.7.0
 PYTHON_PYCRATE_SOURCE = pycrate-$(PYTHON_PYCRATE_VERSION).tar.gz
-PYTHON_PYCRATE_SITE = https://files.pythonhosted.org/packages/fb/7f/5f354100270a5d41350e9806dc9950a33e00a30eb3a7ab5fc9db86326856
+PYTHON_PYCRATE_SITE = https://files.pythonhosted.org/packages/a6/a5/aab94e6bb8b3281cc450dde3961b417bd56abde2401955a9a4904df44c68
 PYTHON_PYCRATE_SETUP_TYPE = setuptools
 PYTHON_PYCRATE_EXTRA_DOWNLOADS = https://raw.githubusercontent.com/P1sec/pycrate/$(PYTHON_PYCRATE_VERSION)/license.txt
 PYTHON_PYCRATE_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
