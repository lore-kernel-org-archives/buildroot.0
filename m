Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67F0CC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:52:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2612860F91
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:52:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2612860F91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 035FA80FE8;
	Mon, 27 Sep 2021 19:52:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lqlaP6frzwu4; Mon, 27 Sep 2021 19:52:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43F7D8102F;
	Mon, 27 Sep 2021 19:52:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6D4AD1BF379
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69A9760AC1
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:51:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y4807hK6C0zR for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 19:51:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 61CA660AC0
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 19:51:52 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 205-20020a1c01d6000000b0030cd17ffcf8so5983wmb.3
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 12:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ppejbkeAIqEYWm3xKOVLVGAAL+vMfHSJWujQUZ5BfPY=;
 b=he/W6GoZQIe4RLsXQlV553MXy6z+0EzFWFhfExop/TM7t5L5apBhM0VvBoArncaTnA
 ebFeG17E2EdweQKzV6etoKB65h1ClynXymKz7L+lB0zUzcWceX17VwVNrVAIkR/SfJfO
 Rm40/oWXYSuIhT1+hokRm8zuUt7GDZ8c99ynv5ySE6JDC0wMkua+eCsTm9dleDaIp43N
 RHNDPFMXJq2XiteYd8+u65ZsMGCAtxLbSfUyLcBXnfCSCynGM7W2CwNLiLNmHD7/ndHW
 QyJUdz8JtsB/np3D5r7B2wAQxsqXdDJYmsnWMzt/4n+M2VLlcBQNILboMferEBjm70lZ
 tvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ppejbkeAIqEYWm3xKOVLVGAAL+vMfHSJWujQUZ5BfPY=;
 b=kWRpaoziJ3SwtKD83hr6EAj07mXnw0c9l+KCIalbIUj9i9eeXQyWANWKuv3QdluZ5H
 RDLOmR0Nkn6Dgnq2Hvrzs4W3bib9bsA0cUlhZ2rFczBP1q2pbPh7y5dssZ4eCbb9ZWhg
 0aBd7UBJc44pntnKlqNHfTsJQBwjoAkaQKXEaQQ91SjxGD+DBcMOvu/hBB5EyVdOnNaZ
 3idQpjcZ4kzaZRZTy/qK5QMVdVAhRyIET8v83eTq6/eZyiAEYNj0d/9OBYCuzpk6nrbU
 9WrzN9x2nq3/RyoGsAUwXr7EPysx0RVfWaM8yvbvgY5okMTFAEwSto8qWP4X/95Kx8ha
 zGHw==
X-Gm-Message-State: AOAM533U8pcQVLxzA5+vz9gcLHUzWqQ3l0U8GLcwhapF3b486FkLzj5q
 d4jgsfAyZYHyHF4i1d29cu6F2Iqpwvw=
X-Google-Smtp-Source: ABdhPJzS5wHU+iy2SvNtzhEteOCvIZKPVY+GlXMh9mInZTmVPp+tBQMmIppqw8cSwmdLT9Laqb7rxg==
X-Received: by 2002:a7b:cf02:: with SMTP id l2mr847576wmg.73.1632772310453;
 Mon, 27 Sep 2021 12:51:50 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:fc32:81cf:8e3a:84a0])
 by smtp.gmail.com with ESMTPSA id w23sm485359wmi.6.2021.09.27.12.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 12:51:50 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 22:51:30 +0300
Message-Id: <20210927195136.549542-6-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210927195136.549542-1-asafka7@gmail.com>
References: <20210927195136.549542-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-colorlog: bump to versio
 6.4.1
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
* Hence, python-simplelogging now depends on python3.
* License was updated with a year bump.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-colorlog/Config.in            | 1 +
 package/python-colorlog/python-colorlog.hash | 6 +++---
 package/python-colorlog/python-colorlog.mk   | 4 ++--
 package/python-simplelogging/Config.in       | 1 +
 4 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-colorlog/Config.in b/package/python-colorlog/Config.in
index 673f97aad2..e191ae82ac 100644
--- a/package/python-colorlog/Config.in
+++ b/package/python-colorlog/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_COLORLOG
 	bool "python-colorlog"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  Log formatting with colors.
 
diff --git a/package/python-colorlog/python-colorlog.hash b/package/python-colorlog/python-colorlog.hash
index 7c6fb73be7..f324c1f290 100644
--- a/package/python-colorlog/python-colorlog.hash
+++ b/package/python-colorlog/python-colorlog.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/colorlog/json
-md5  2111508f7c512976a34b107c17586f79  colorlog-4.8.0.tar.gz
-sha256  59b53160c60902c405cdec28d38356e09d40686659048893e026ecbd589516b1  colorlog-4.8.0.tar.gz
+md5  f1b92c1cac428b2e3c9ac7edf2988440  colorlog-6.4.1.tar.gz
+sha256  af99440154a01f27c09256760ea3477982bf782721feaa345904e806879df4d8  colorlog-6.4.1.tar.gz
 # Locally computed sha256 checksums
-sha256  915d2c0c578d5015fb561f69ce2970a0d0ed566f0b99bdb6a4ebb439e9c81b0d  LICENSE
+sha256  b1d9082bc483623fd59fc7279b457f0e40d942a76426cde257239e04dfe4125a  LICENSE
diff --git a/package/python-colorlog/python-colorlog.mk b/package/python-colorlog/python-colorlog.mk
index eb4074d464..801b30be89 100644
--- a/package/python-colorlog/python-colorlog.mk
+++ b/package/python-colorlog/python-colorlog.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_COLORLOG_VERSION = 4.8.0
+PYTHON_COLORLOG_VERSION = 6.4.1
 PYTHON_COLORLOG_SOURCE = colorlog-$(PYTHON_COLORLOG_VERSION).tar.gz
-PYTHON_COLORLOG_SITE = https://files.pythonhosted.org/packages/75/32/cdfba08674d72fe7895a8ec7be8f171e8502274999cae9497e4545404873
+PYTHON_COLORLOG_SITE = https://files.pythonhosted.org/packages/d6/4a/840f6cb7e922a717c765a3cdc6988aff22a6ef211d88c8d16701dfbd664f
 PYTHON_COLORLOG_SETUP_TYPE = setuptools
 PYTHON_COLORLOG_LICENSE = MIT
 PYTHON_COLORLOG_LICENSE_FILES = LICENSE
diff --git a/package/python-simplelogging/Config.in b/package/python-simplelogging/Config.in
index db95efa25f..7f58791836 100644
--- a/package/python-simplelogging/Config.in
+++ b/package/python-simplelogging/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_SIMPLELOGGING
 	bool "python-simplelogging"
+	depends on BR2_PACKAGE_PYTHON3 # python-colorlog
 	select BR2_PACKAGE_PYTHON_COLORLOG # runtime
 	help
 	  Logging made simple, no excuse for any debug print call.
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
