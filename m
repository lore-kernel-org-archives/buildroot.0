Return-Path: <SRS0=vewd=OP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A94C433F5
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 09:47:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2231760F70
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 09:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2231760F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9954401E8;
	Sat, 25 Sep 2021 09:47:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xgQ30kzLBULu; Sat, 25 Sep 2021 09:47:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05D40401D9;
	Sat, 25 Sep 2021 09:47:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5958E1BF29E
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 09:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49B9A404ED
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 09:46:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lRHr3us9_VSX for <buildroot@lists.busybox.net>;
 Sat, 25 Sep 2021 09:46:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51346404EA
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 09:46:39 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id t28so21474180wra.7
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 02:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LYygbHCR35eRTQkCd8iIu2Xb2iWif6cS3QEfZAcd1Rw=;
 b=E1m1whN4D1ChhdZrzgM7DHGSpS2pTpEIGTvLUnu6GnWaK7KEWN5Jb0sXmL10DldyTi
 TFd8ku3bInVPh0iUBoFZW2OusefYf1BY8PdpvZ6VK3PcjKNhXz05EakC71eLN/c3cqrc
 T7WxXbv82LaFQHfzTaYSSv5aAy7opTyAMpaPX0dYojZ4YmXGjpr4dm+izhVVj/WatGA0
 /JmbjLPniW29KZCcE5t2KseBmHiJ+iWb7NRS3T2u/25m/EeP+P9ILW7+e2WyJyV3k2CY
 8scPLPBXAkxMI2piccnfpL2fvTPNIwD46b+FokOdvWXmko08kWhfDuMWF8WOe5YS0gdd
 2bbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LYygbHCR35eRTQkCd8iIu2Xb2iWif6cS3QEfZAcd1Rw=;
 b=4jQ4SoNgEuKNnRdB/MUv33jHtEKhh7gFBowp4nianBfOTvubUvBBo8VYOTbKpRkf1u
 VjcDlw6hfMcq9SUYM2VNoxbS2r7bTtD1KCvBhDNpg1JLbe1X8AZozvaQx8dN/jZX981R
 J95Yxnw9/HVJvHndWP9UrtpIpsDxjvsaOuKENCaKB1esGGFYlYX3yXnIUuZDGVUxIWFc
 d9uyRxBbQb+7uszlze3VlR7Ql+dxNoPdXjJLlgCg2KstBNEDoR2BFEmjUQhDpSTwtJYO
 Z5Q4myicFV8AQyZPKPTqHsOVQakJG48+RWbQEUlG7FRvl6cRtSVVzfbd56Uhaw9TTJh7
 zx9Q==
X-Gm-Message-State: AOAM532/y5KHK5/sxYwdYoo3+McYvBd+o6tqjSOUKHTuR5ktPXQeV/BS
 vvYfgIdOSfQlsvmUKiDYQGHe+klmhPs=
X-Google-Smtp-Source: ABdhPJxQOPdHviS9tzVfoDvpVekxEf8DlTaqfdvruZj+UfX8QzIa9CndWG4xJBQXvQXm3N8TtSuiHA==
X-Received: by 2002:a1c:a54e:: with SMTP id o75mr6097531wme.32.1632563197477; 
 Sat, 25 Sep 2021 02:46:37 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:7829:fae8:ae6e:81f0])
 by smtp.gmail.com with ESMTPSA id d2sm10297194wrc.32.2021.09.25.02.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 02:46:37 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Sep 2021 12:46:26 +0300
Message-Id: <20210925094626.365400-6-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210925094626.365400-1-asafka7@gmail.com>
References: <20210925094626.365400-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-sh: bump to version 1.14.2
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
 package/python-sh/python-sh.hash | 4 ++--
 package/python-sh/python-sh.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sh/python-sh.hash b/package/python-sh/python-sh.hash
index fffdd20c15..13a0207de9 100644
--- a/package/python-sh/python-sh.hash
+++ b/package/python-sh/python-sh.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sh/json
-md5  7e3dd3a6b49c06db93746994a68cb8cf  sh-1.13.1.tar.gz
-sha256  97a3d2205e3c6a842d87ebbc9ae93acae5a352b1bc4609b428d0fd5bb9e286a3  sh-1.13.1.tar.gz
+md5  33becadcb5214afd00b9eec05fa98c06  sh-1.14.2.tar.gz
+sha256  9d7bd0334d494b2a4609fe521b2107438cdb21c0e469ffeeb191489883d6fe0d  sh-1.14.2.tar.gz
 # Locally computed
 sha256  d8491c6e236568d04f7c8c07f2f1b8f5d142706dab6ab88f6e0d2dd476b6c706  LICENSE.txt
diff --git a/package/python-sh/python-sh.mk b/package/python-sh/python-sh.mk
index 21c0fb3d77..d2d8b14c8b 100644
--- a/package/python-sh/python-sh.mk
+++ b/package/python-sh/python-sh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SH_VERSION = 1.13.1
+PYTHON_SH_VERSION = 1.14.2
 PYTHON_SH_SOURCE = sh-$(PYTHON_SH_VERSION).tar.gz
-PYTHON_SH_SITE = https://files.pythonhosted.org/packages/c9/3b/2c9a22bf1c48ced7ff3a11d4a862682c21d825c35f9d025811ad9808d263
+PYTHON_SH_SITE = https://files.pythonhosted.org/packages/80/39/ed280d183c322453e276a518605b2435f682342f2c3bcf63228404d36375
 PYTHON_SH_SETUP_TYPE = setuptools
 PYTHON_SH_LICENSE = MIT
 PYTHON_SH_LICENSE_FILES = LICENSE.txt
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
