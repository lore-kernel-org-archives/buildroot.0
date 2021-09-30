Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0201FC433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 07:01:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFDDD615E5
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 07:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BFDDD615E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 969C3403DC;
	Thu, 30 Sep 2021 07:01:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZuBiq4fv3r0W; Thu, 30 Sep 2021 07:01:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84D6D4033D;
	Thu, 30 Sep 2021 07:01:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0936E1BF2B7
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 07:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED09F402D6
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 07:01:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z_e12GDgVo7k for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 07:01:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E6F40400FD
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 07:01:04 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id m22so2820929wrb.0
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 00:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3/9mkJCms1oB+EORYqN25nSQGtFKLmXMcl/bD54NATs=;
 b=ctKCmraqRpigLMGPEc3ol47ZE22LOZFOcCkh8wcYDUDg41tl9JEiEYCLba/T/HlJOP
 fwq8pLUkSefJF05Ufb+kn4MvZBIWAwiUbfEnXCTb5VoFP2jMk9V7thWpxV+Fl7W6Rhw4
 EqIedrW182vAnK6O3CMICm/e+Qwnu6WnaF68x2T35G4iukg38G+6QH/lBykE7MIsmusA
 5YHXgSHFCAnhDhHDV2aClGhi8FI3H+qtdPbWwgEPRSewtrbe7mRaqTHb73IZXNh2M0MK
 rmfjDy7A9jMKgmVpRbm9QzM0dWXabp42y8hgWfxUUNf44ULDwQT6dUHYIEQCOBJDS50I
 18jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3/9mkJCms1oB+EORYqN25nSQGtFKLmXMcl/bD54NATs=;
 b=mnXNYXrMupZf1vkWLh24Lbc4vNp+2TZ3qW8fQLi7wOUP7ZUkG5naR5jLSS3sjbEmWm
 +oLWG3a/maZxIS9vm91HnxamcvF/1lgb/vLW8YfQis2LumYaABFk+2y7N1EqabTqzmew
 RjiyAjb/aQvawZS3N6l3TedRQL4gkdeesY69WW7KDiImAg6tQqgnPs1k9vQqfqHeZAT3
 Vt+VvKE/Ca2ja9PDFs1GzO0H6IrBmvnzX7ylJ0QPNm6Ce8P7qRrkrqbLDnwfz/qqwu3G
 4Wm+xhp9EkpCIX0hRy2mNFlosrqIMswa2SKHmQI4AszZ6Ox/X8tISP+ChCfuE7ixgTBq
 p5jw==
X-Gm-Message-State: AOAM532+suVYP70KE83KSsVmrCfb29wOp+WqrrxFLmgPQbqATZlJCsWX
 E2uqAdf3DgJuie34ZNAPUyOqLfotNHk=
X-Google-Smtp-Source: ABdhPJzk4gq7i9lEtOfBDnh9N9HhDvQwyUDaqQMOSLAN1sv7Foqj3E6vetp4H4XqxCfwnYlf5US2Ow==
X-Received: by 2002:a5d:6d03:: with SMTP id e3mr4155084wrq.383.1632985262988; 
 Thu, 30 Sep 2021 00:01:02 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:c4c3:c3e7:ea7f:250b])
 by smtp.gmail.com with ESMTPSA id n26sm3801088wmi.43.2021.09.30.00.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 00:01:02 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Sep 2021 10:00:41 +0300
Message-Id: <20210930070051.40361-5-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210930070051.40361-1-asafka7@gmail.com>
References: <20210930070051.40361-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-semver: bump to version
 2.13.0
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

And update URL in Config.in.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-semver/Config.in          | 2 +-
 package/python-semver/python-semver.hash | 4 ++--
 package/python-semver/python-semver.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-semver/Config.in b/package/python-semver/Config.in
index c66231a730..4af2bbf449 100644
--- a/package/python-semver/Config.in
+++ b/package/python-semver/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_PYTHON_SEMVER
 	help
 	  Python helper for Semantic Versioning (http://semver.org/).
 
-	  https://github.com/k-bx/python-semver
+	  https://github.com/python-semver/python-semver
diff --git a/package/python-semver/python-semver.hash b/package/python-semver/python-semver.hash
index 5c13764e57..10cb0a8464 100644
--- a/package/python-semver/python-semver.hash
+++ b/package/python-semver/python-semver.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/semver/json
-md5  3e11ae9782121e8ffe9f8a8b763a8cb5  semver-2.10.2.tar.gz
-sha256  c0a4a9d1e45557297a722ee9bac3de2ec2ea79016b6ffcaca609b0bc62cf4276  semver-2.10.2.tar.gz
+md5  e98b5fb283ea84daa5195087de83ebf1  semver-2.13.0.tar.gz
+sha256  fa0fe2722ee1c3f57eac478820c3a5ae2f624af8264cbdf9000c980ff7f75e3f  semver-2.13.0.tar.gz
 # Locally computed
 sha256  cda490c32e61d3884dc17791fc8078f2a3e564fba98dd18b4dc64eb2720b2b6f  LICENSE.txt
diff --git a/package/python-semver/python-semver.mk b/package/python-semver/python-semver.mk
index 32ed6b971f..d3a905754f 100644
--- a/package/python-semver/python-semver.mk
+++ b/package/python-semver/python-semver.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SEMVER_VERSION = 2.10.2
+PYTHON_SEMVER_VERSION = 2.13.0
 PYTHON_SEMVER_SOURCE = semver-$(PYTHON_SEMVER_VERSION).tar.gz
-PYTHON_SEMVER_SITE = https://files.pythonhosted.org/packages/aa/e8/cb894f70a52887f001aff5f264f68272c21fa58268495aca17df396c161f
+PYTHON_SEMVER_SITE = https://files.pythonhosted.org/packages/31/a9/b61190916030ee9af83de342e101f192bbb436c59be20a4cb0cdb7256ece
 PYTHON_SEMVER_SETUP_TYPE = setuptools
 PYTHON_SEMVER_LICENSE = BSD-3-Clause
 PYTHON_SEMVER_LICENSE_FILES = LICENSE.txt
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
