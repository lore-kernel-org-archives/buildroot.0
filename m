Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B94C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 07:02:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14E68615E5
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 07:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 14E68615E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBF0642529;
	Thu, 30 Sep 2021 07:02:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id guOG7Vgn8HbZ; Thu, 30 Sep 2021 07:02:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4812A42525;
	Thu, 30 Sep 2021 07:02:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A41861BF2B7
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 07:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 945AC83F75
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 07:01:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jEo0w0zU6mJ5 for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 07:01:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A0EE83F74
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 07:01:06 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id k7so8179515wrd.13
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 00:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lpY9Rnqca6hRnnhKQ/qJKBLZj3rJsciehjjvfcHNnfU=;
 b=Q12nmYif11kinb2JH+a8cNgA/DgGRcUpwW1weoh311SiEKLiVkCsJOIWo3aHozWyLj
 GhlgVrqGJds0CLQWwSiRfEguoqtOyg/3L1CdcLI/MJQ0TjNaVmeTpDAXpci0WAs1/ofI
 PRoseFGQXx3BOKKdW664HiKZNA2ngu11bHk1potZFV0vGTmK+9JRGPcbHaqt82nDHCBW
 +QgYlCets/1NCuAhYdOJiuFcCcFhRyXTCWl82I+i1UZfRK6M6AlHbcbFJuJtJtTpLLXg
 VjVTdq3IpGndhLy42DIKqV/0s8MkYuDpwXMR451PO+RTH3kgB0JRs4nfOu4RdFbVs07K
 OGPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lpY9Rnqca6hRnnhKQ/qJKBLZj3rJsciehjjvfcHNnfU=;
 b=aYGCJxEIyc8D+qS2XY1HRF8E5XJ6n60J4wS3RcEIYMKHAE5TDecDvUiSA7ODcd/sNp
 5eBmr0ok+4Vl+goIOYOzl95ENcSv24VwReEyIUya+ogfg7ZRgOMyMy+m/+arJ/2rDhfL
 xw/fp4+W6CP4/R4hlgSV/skEczeT6ve/CcYvXEqFrnUHo3AEAoq2lo6Uy7O6MEMMgmAq
 bieFwB7aS708VeCsU0TQnOpKOTDjaoFWJsa81rtYajndMiq18nl3IaApR/xyM0KilECF
 gkLxwpVrm0nReK2J1EJqE7hSOdcBSf2KSrbVnIA3sAzCP9vR6fyWdkPCOr7kqwaQo2y6
 vlIw==
X-Gm-Message-State: AOAM531PG8d63RKQSSMJVQ37jt5haAfa2WKFvKbXWrzytE0sSa22iY+8
 61ekWy4xdvk3KPJWxed+Awbsn75w32w=
X-Google-Smtp-Source: ABdhPJxuphbFpVkfFdsjl4C3gwYP7wE2Hw3CWFyp2t1jC0LwdzzxsMsRvXU05W2b3u1lhav9rS6qCg==
X-Received: by 2002:a5d:4a46:: with SMTP id v6mr4260268wrs.262.1632985264652; 
 Thu, 30 Sep 2021 00:01:04 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:c4c3:c3e7:ea7f:250b])
 by smtp.gmail.com with ESMTPSA id n26sm3801088wmi.43.2021.09.30.00.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 00:01:04 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Sep 2021 10:00:42 +0300
Message-Id: <20210930070051.40361-6-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210930070051.40361-1-asafka7@gmail.com>
References: <20210930070051.40361-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-sentry-sdk: bump to version
 1.4.3
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

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-sentry-sdk/python-sentry-sdk.hash | 4 ++--
 package/python-sentry-sdk/python-sentry-sdk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.hash b/package/python-sentry-sdk/python-sentry-sdk.hash
index feade89f0a..e9fda822ae 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.hash
+++ b/package/python-sentry-sdk/python-sentry-sdk.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
-md5  5d4abcc416cbd0b9443bf56588b02b55  sentry-sdk-0.17.3.tar.gz
-sha256  0af429c221670e602f960fca85ca3f607c85510a91f11e8be8f742a978127f78  sentry-sdk-0.17.3.tar.gz
+md5  6dc8c7586d95f7679c7bf7f749336cf8  sentry-sdk-1.4.3.tar.gz
+sha256  b9844751e40710e84a457c5bc29b21c383ccb2b63d76eeaad72f7f1c808c8828  sentry-sdk-1.4.3.tar.gz
 # Locally computed sha256 checksums
 sha256  59404d4c854e579097d41bfccd5006afde9d6d70e646cf55074cdbfead5ecf1c  LICENSE
diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index 256aafa62d..5ccd2aff5c 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SENTRY_SDK_VERSION = 0.17.3
+PYTHON_SENTRY_SDK_VERSION = 1.4.3
 PYTHON_SENTRY_SDK_SOURCE = sentry-sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
-PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/64/7e/f1725d8649ef8f7d58cbec582157c454884238e59fef00b1707d555c7bea
+PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/a7/30/1d967b2e0cac2fa388344b2968fa57e69d5382b922e57cda43af54b9063a
 PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
 PYTHON_SENTRY_SDK_LICENSE = BSD-2-Clause
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
