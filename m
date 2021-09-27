Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A875C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 06:38:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 025126113D
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 06:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 025126113D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3089404D0;
	Mon, 27 Sep 2021 06:38:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FQbh0MhsGZZb; Mon, 27 Sep 2021 06:38:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D089140491;
	Mon, 27 Sep 2021 06:38:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 895761BF307
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 06:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 869B181CA7
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 06:38:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3SFSi_OtCCwj for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 06:38:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C48581CE1
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 06:38:18 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id t8so49238895wrq.4
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 23:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gr+ijWOIsG9JtJ6q9gE93VwTQsNkdENzIhbM91z1wbc=;
 b=pT32dOA913jFIS044ADFH9RsIFEhAkzS/luWK9rdTeULx01e6en87eUoMkpskhbGcw
 MPVuWLB7uNdeeoTLik5tgOXuuFt6P7OQGXkbORmvb+tLAk2GpG42AXfZrBCpz37K8MQb
 xtBTKXwXO+/ggHJ9rFIqtxn0V+AuKdMFdSKoz5JgT8Oubh2oJSRSBGse+YayMeZYLT7z
 k5870fPEtaknUVWmTK7XE+BGiYagpZm4gPdDAm+AvyhADHsFWGvx4i5UZirnytnT+QDA
 SPJ/HnpLSslbQhAdi5F6th+JCrHPIO5SCiXRt4YmBtohtmS6BvwQ2Wew7AHBYX3r1Bwt
 vBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gr+ijWOIsG9JtJ6q9gE93VwTQsNkdENzIhbM91z1wbc=;
 b=N3W703OY5Xl3u8CcuxMaFsP4Lvrk4ThAXjnizkFX+3hsJ1mWlhCdBhQQwssKh1TVFd
 Et65KlJTcEd+xhURRnB3YpfQLKYk+mo/dim7VvQpyLRMCjwoYQ1DOSkbPUKJ4KwYy/Dl
 I9TMCvlCN8vaEr4haXjqwvK19FC+Wr3dUseLFROVeg5Mg7PG4WzQSIG8BZHKU9oowsYl
 /OoowIpx1769uFC4GpL85uR8QyiAzG1XTTC8ZC+2rQSsN3LJ5IO2wHasPJcue1bBMw75
 DxP6gauCUXOAz/zXDeBNgbFAaYy/V0JrnFUIvzajyUOvE70+wjgSzW1ZBlGH1hx1h0wA
 IntA==
X-Gm-Message-State: AOAM5313hwz2/FQmrDd09twL7UO+g6+IRTcssMnf7eF0TUrlQhe86IfP
 Ial14X9l52E+2Q5cu4/0+QJS8omZ14w=
X-Google-Smtp-Source: ABdhPJyjDTupgOcvgUlzdbd8HeOFScgjxX+nlqfRK2/nZU843WzOygnQI2k9EzmKyjmhDJGTn9Vcvw==
X-Received: by 2002:adf:9d47:: with SMTP id o7mr26136891wre.50.1632724696627; 
 Sun, 26 Sep 2021 23:38:16 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:424d:6143:cd4e:c1e])
 by smtp.gmail.com with ESMTPSA id t13sm5061135wro.76.2021.09.26.23.38.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 23:38:16 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 09:38:04 +0300
Message-Id: <20210927063809.505480-2-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210927063809.505480-1-asafka7@gmail.com>
References: <20210927063809.505480-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-mbstrdecoder: bump to
 version 1.1.0
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
 package/python-mbstrdecoder/python-mbstrdecoder.hash | 4 ++--
 package/python-mbstrdecoder/python-mbstrdecoder.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-mbstrdecoder/python-mbstrdecoder.hash b/package/python-mbstrdecoder/python-mbstrdecoder.hash
index 296930f607..90b9abb8d6 100644
--- a/package/python-mbstrdecoder/python-mbstrdecoder.hash
+++ b/package/python-mbstrdecoder/python-mbstrdecoder.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mbstrdecoder/json
-md5  aa377cfa117318583dffa1fd96123bdf  mbstrdecoder-1.0.1.tar.gz
-sha256  f895e1fb97496855ab5e43de99588787169c01f782c71625142d1a62729e9f9d  mbstrdecoder-1.0.1.tar.gz
+md5  b32ff478a38730a8ab0b884fe162cc41  mbstrdecoder-1.1.0.tar.gz
+sha256  f4dfd549e424ad8dfc985e6af8b55cb4ec0c208782f610d57439fe6a9a44c244  mbstrdecoder-1.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7588265082eed5e9f4afd5090c57e610b740ec547b16aaaab739ba07c5eefb15  LICENSE
diff --git a/package/python-mbstrdecoder/python-mbstrdecoder.mk b/package/python-mbstrdecoder/python-mbstrdecoder.mk
index 6474324b78..63f9af74f5 100644
--- a/package/python-mbstrdecoder/python-mbstrdecoder.mk
+++ b/package/python-mbstrdecoder/python-mbstrdecoder.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MBSTRDECODER_VERSION = 1.0.1
+PYTHON_MBSTRDECODER_VERSION = 1.1.0
 PYTHON_MBSTRDECODER_SOURCE = mbstrdecoder-$(PYTHON_MBSTRDECODER_VERSION).tar.gz
-PYTHON_MBSTRDECODER_SITE = https://files.pythonhosted.org/packages/b7/3b/2524dd4771dfca572269036fb08356715cb78a1c1c2a4dae3a810a86b777
+PYTHON_MBSTRDECODER_SITE = https://files.pythonhosted.org/packages/6c/10/f82ba5a91489c91bf6adaa0e1aca38a7ab2d1d7d80195a5f6ad8c2ff387a
 PYTHON_MBSTRDECODER_SETUP_TYPE = setuptools
 PYTHON_MBSTRDECODER_LICENSE = MIT
 PYTHON_MBSTRDECODER_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
