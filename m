Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ACFCC433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:56:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E80E160F9D
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E80E160F9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEF53830A8;
	Sat,  9 Oct 2021 20:56:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id phYbAyJ60pya; Sat,  9 Oct 2021 20:56:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13595827DE;
	Sat,  9 Oct 2021 20:56:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5009C1BF5A6
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E417405F7
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:55:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i54WQ8QixlkG for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 20:55:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A986440012
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 20:55:30 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id i65so8221392pfe.12
 for <buildroot@buildroot.org>; Sat, 09 Oct 2021 13:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AsTIg95uz9kzAOvDNgk2G9RyisGnIo4DuCekYy/P7o0=;
 b=b/+IdPD5Rvoz4TLQlHVq2DyFeKwexdXITpUsWuzeBXpfAe6C79v+g7vjVa2pVGxIRb
 I8lWbBHNf7RzPcWiehYM/G6SjbPRifMCSJiKPi4AA32dEBi65U0ed29ZE8E6sncnYDrN
 D/MzD2uxFCWesZ8bToLzPVyf5U9BHa/l4YGvR82epzV9kT/JbppLHrKW3JdqBF42aNZk
 8VZsc2ZrgQsuSRNB0YE44erAU355HkdEi2O299vI6Vew1adx5c5JQRH180S9BRnJObw6
 1y6BTh3OP7vzd2obprz9VohRcP0JyhO/9DsDWg2UgFcy3gpQJt66NVE8H44GnVN21n5d
 5sGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AsTIg95uz9kzAOvDNgk2G9RyisGnIo4DuCekYy/P7o0=;
 b=4guFBTw0orWvgxJ0OyXHoAyxoR48oYd3eG1X6AdQPE5rWuStgaONMgtSMT7k85YX5F
 5F17mtHfVIstG0Go7WzjHT6fD48LTV6jAgo8RAYE9rpN+UPXSiZVFvyao+bHfdVJsKQ5
 sJHH1NhwO+kYRBZGz9JLXcu1DiRaa03Jsu66vTfVl+m1wfHAucrSL3RzqRzrG9Dmev0c
 QYbKbDGToXOdGPcMeQl8GJ1T+KYQZ456Vqw4pcF1WMFzL1PUlUWxj2E7cBkrCqOuhvOi
 sMQhgHATbnFfCaXzsMngG0haKY1GzdOXCFB/5U6pjBOKLt5Z3Nm4KOl6hUt81AQSHDpR
 ETKg==
X-Gm-Message-State: AOAM532qMFV0niw7m5A6ekT4vipIha6fRXTGUr9qGxnLiEFLdPMKFoQ8
 cz8EU1Xl8UXXSEq8q0Re1g0EBYVxWnDxYw==
X-Google-Smtp-Source: ABdhPJwVf2o3g4AMnY63G4+XEtGI/MbALrS5ShyIDIXF+Qs7VwdPVgjHGNwDC4vc0VL53iKz2dUAlA==
X-Received: by 2002:a63:4a18:: with SMTP id x24mr11041649pga.209.1633812929964; 
 Sat, 09 Oct 2021 13:55:29 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id qe17sm3125765pjb.39.2021.10.09.13.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 13:55:29 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Oct 2021 13:55:06 -0700
Message-Id: <20211009205523.3137859-4-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211009205523.3137859-1-aduskett@gmail.com>
References: <20211009205523.3137859-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 03/20] package/python-crossbar: bump to version
 21.3.1
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Samuel Martin <s.martin49@gmail.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Matt Weber <matthew.weber@collins.com>, Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>, Oli Vogt <oli.vogt.pub01@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 .../python-crossbar/0002-Remove-idna-requirement.patch | 10 +++++-----
 package/python-crossbar/python-crossbar.hash           |  4 ++--
 package/python-crossbar/python-crossbar.mk             |  4 ++--
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/python-crossbar/0002-Remove-idna-requirement.patch b/package/python-crossbar/0002-Remove-idna-requirement.patch
index 4948b91b05..5e19a467c2 100644
--- a/package/python-crossbar/0002-Remove-idna-requirement.patch
+++ b/package/python-crossbar/0002-Remove-idna-requirement.patch
@@ -16,14 +16,14 @@ diff --git a/requirements-min.txt b/requirements-min.txt
 index 92fb0f8f..13cdac87 100644
 --- a/requirements-min.txt
 +++ b/requirements-min.txt
-@@ -6,7 +6,6 @@ click>=6.7
+@@ -8,7 +8,6 @@ click>=6.7
  constantly>=15.1.0
- cryptography>=1.9
- h2>=3.0,<4.0
+ cryptography>=2.6.1
+ h2>=3.2.0
 -idna<2.6,>=2.5
+ importlib-resources>=4.1.1
  incremental>=17.5.0
- jinja2>=2.9.6
- lmdb>=0.92
+ jinja2>=2.10.1
 -- 
 2.17.1
 
diff --git a/package/python-crossbar/python-crossbar.hash b/package/python-crossbar/python-crossbar.hash
index 486b4d5695..4441578a29 100644
--- a/package/python-crossbar/python-crossbar.hash
+++ b/package/python-crossbar/python-crossbar.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/crossbar/json
-md5  f1756c5a7eac95aa0ff3e307cdd960df  crossbar-20.4.2.tar.gz
-sha256  67a14864850b562c2b5586eca37f39b2eff3d650ba955bace894e6b5d0633dbb  crossbar-20.4.2.tar.gz
+md5  df576100bcf6e423cdc1e2e96b602140  crossbar-21.3.1.tar.gz
+sha256  ac71959f0c57ab08d43f7830b85c6312e000b25543a179cd751ac357944dd7ef  crossbar-21.3.1.tar.gz
 # Locally computed
 sha256  57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6  crossbar/LICENSE
diff --git a/package/python-crossbar/python-crossbar.mk b/package/python-crossbar/python-crossbar.mk
index 99ddc67df7..aae61cd2e8 100644
--- a/package/python-crossbar/python-crossbar.mk
+++ b/package/python-crossbar/python-crossbar.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CROSSBAR_VERSION = 20.4.2
+PYTHON_CROSSBAR_VERSION = 21.3.1
 PYTHON_CROSSBAR_SOURCE = crossbar-$(PYTHON_CROSSBAR_VERSION).tar.gz
-PYTHON_CROSSBAR_SITE = https://files.pythonhosted.org/packages/3f/a2/d8aff4b366b565669236e6bbb09d9f1bbe9162eb542822e89210141dd738
+PYTHON_CROSSBAR_SITE = https://files.pythonhosted.org/packages/17/37/aafc4ec30068fd7ebb97f1a00d4ddf8de482dfa4c1d2a1fc6bb814d91400
 PYTHON_CROSSBAR_LICENSE = AGPL-3.0
 PYTHON_CROSSBAR_LICENSE_FILES = crossbar/LICENSE
 PYTHON_CROSSBAR_SETUP_TYPE = setuptools
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
