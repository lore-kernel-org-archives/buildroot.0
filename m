Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FB66C433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 06:01:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A01B60F56
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 06:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A01B60F56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA740406FC;
	Wed, 22 Sep 2021 06:01:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XMrHNHX7690Z; Wed, 22 Sep 2021 06:01:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EF0E406E9;
	Wed, 22 Sep 2021 06:01:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 173C81BF40E
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 06:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0178160AC1
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 06:01:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HC0p2L-0GfV6 for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 06:01:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BB39560ABE
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 06:01:46 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id w1so1579126ilv.1
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 23:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m6s/6KLU+n/x3MkaKqJ5E8u7GnMMiPRS//3UI9KhLqo=;
 b=S+LYGrgX9eN8BTNO6j4fof92FhnVS/xE7+dFN8LcKv/EN4Jo4VeNXglSXaofKlIrMd
 jsxVIYLMkjaPoJTx3KfoMWfoCxrz/NwSzi54g8A6A+0eFs4lCjSRuYCOabfQ/utcpDYZ
 fFijkdOyfozreEK2BzQz+FEzbdVNWOcuMTZwxAJXALANHDFmrOMPgSopKNTRzggHMLHI
 zyx5ZA34Q30bY/Lh6/c6BVjC4WM/XmaWXluDfJ4yMAi0l5tdY0andasxc/W6IHM0gB/H
 EEoOEs+qxA2+qZR3C5toMRYLVrE/aV1pK+Gddoz+H6IJ3NmdFBNbLxNPGgaV9eJ+Gmj+
 oAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m6s/6KLU+n/x3MkaKqJ5E8u7GnMMiPRS//3UI9KhLqo=;
 b=ZsF5h7hgxmr+y7AN2p41BBzQgWSdH7UvOwxH7RhUc3x3/sHbLonAFNWPyrY8/rrUbn
 5Y+ZOikDWGDnVN45bDNKLMCjI0ocuJiEw1IMo2vhasjeW2G7vJmuxQe+1Je1XAnmhk0l
 IDDza4m26MUgRzRGgQrGpfcgmx3m+xxF45iRJohZ4WA/MVo3hpCsDpIO6cE5XKsO0kOf
 QU0RwySbEA1LLN35xUaG2IgOcNsJH79K/6+KLHoKjOpRaymamSpJxoOBp7THqKUq8lA3
 /FSudETv+xK0+kmYoNUwY2O9Edczr8jbuWnsiGTYc5E4hTEaVtlgdmMmPCv3P8PoaNhV
 7AWQ==
X-Gm-Message-State: AOAM532TJfKIQjOrWJLS+vtkGvJ5a/fNeppfrVux1TQ1nMbFppBuJhPa
 NnUVNrnfknqjwoN6LXr/dew+s4D7pyM=
X-Google-Smtp-Source: ABdhPJxuucaWSWr15v8pKCDn/3AYZrG1usENVXsr+LDd8OZNJkv4NIJhgzHYThdA6ePTZS58yHOskw==
X-Received: by 2002:a05:6e02:1be6:: with SMTP id
 y6mr25061535ilv.106.1632290505732; 
 Tue, 21 Sep 2021 23:01:45 -0700 (PDT)
Received: from james-x399.localdomain (71-33-146-72.hlrn.qwest.net.
 [71.33.146.72])
 by smtp.gmail.com with ESMTPSA id h5sm566936ioz.31.2021.09.21.23.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 23:01:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Sep 2021 00:01:44 -0600
Message-Id: <20210922060144.2883249-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python{3}-cython: bump to version
 0.29.24
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cython/python-cython.hash | 4 ++--
 package/python-cython/python-cython.mk   | 4 ++--
 package/python3-cython/python3-cython.mk | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
index 04961ff03f..70469c012b 100644
--- a/package/python-cython/python-cython.hash
+++ b/package/python-cython/python-cython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cython/json
-md5  82837814b8d72d353e16bb9344e914b1  Cython-0.29.23.tar.gz
-sha256  6a0d31452f0245daacb14c979c77e093eb1a546c760816b5eed0047686baad8e  Cython-0.29.23.tar.gz
+md5  81aff945f5bfdfb86e7a5d24f5467668  Cython-0.29.24.tar.gz
+sha256  cdf04d07c3600860e8c2ebaad4e8f52ac3feb212453c1764a49ac08c827e8443  Cython-0.29.24.tar.gz
 # Locally computed sha256 checksums
 sha256  a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9  LICENSE.txt
 sha256  e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index cf32fc19d1..ffc8e719cd 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python3-cython/python3-cython.mk
-PYTHON_CYTHON_VERSION = 0.29.23
+PYTHON_CYTHON_VERSION = 0.29.24
 PYTHON_CYTHON_SOURCE = Cython-$(PYTHON_CYTHON_VERSION).tar.gz
-PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/d9/cd/0d2d90b27219c07f68f1c25bcc7b02dd27639d2180add9d4b73e70945869
+PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/59/e3/78c921adf4423fff68da327cc91b73a16c63f29752efe7beb6b88b6dd79d
 PYTHON_CYTHON_SETUP_TYPE = setuptools
 PYTHON_CYTHON_LICENSE = Apache-2.0
 PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
diff --git a/package/python3-cython/python3-cython.mk b/package/python3-cython/python3-cython.mk
index 2c65f1f1a4..2f15ad8c36 100644
--- a/package/python3-cython/python3-cython.mk
+++ b/package/python3-cython/python3-cython.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python-cython/python-cython.mk
-PYTHON3_CYTHON_VERSION = 0.29.23
+PYTHON3_CYTHON_VERSION = 0.29.24
 PYTHON3_CYTHON_SOURCE = Cython-$(PYTHON3_CYTHON_VERSION).tar.gz
-PYTHON3_CYTHON_SITE = https://files.pythonhosted.org/packages/d9/cd/0d2d90b27219c07f68f1c25bcc7b02dd27639d2180add9d4b73e70945869
+PYTHON3_CYTHON_SITE = https://files.pythonhosted.org/packages/59/e3/78c921adf4423fff68da327cc91b73a16c63f29752efe7beb6b88b6dd79d
 PYTHON3_CYTHON_SETUP_TYPE = setuptools
 PYTHON3_CYTHON_LICENSE = Apache-2.0
 PYTHON3_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
