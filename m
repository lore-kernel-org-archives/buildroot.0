Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AAC6CF9C69
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 07:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8FB880E78;
	Sun, 22 Sep 2024 07:27:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wm-3d6YJsLam; Sun, 22 Sep 2024 07:27:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E48A680EE7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E48A680EE7;
	Sun, 22 Sep 2024 07:27:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0AC6A1BF3FB
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 07:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 068A440288
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 07:27:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tjuH1pFmQ7fq for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 07:27:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A2BD440159
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2BD440159
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A2BD440159
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 07:27:09 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-3a09dd37ceaso12683165ab.1
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 00:27:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726990028; x=1727594828;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nJur13AUcgCMRzO9hg6BvKbyrQWDl0zDvVS5pSs21wE=;
 b=ENWFb1vVLEGeBk03WjJkRd1Qxm4A+lFCR5oIeXurVe8y9PYzE6bTTgh4Ikul8Aa+so
 V+r6GGIVQqlxjMhiD4/fSAWr2aOLMMyocCSzYV8cNkAcqPbcVMmlfz1OcfCBmrQ1DOtU
 wWMxGb/FPGz5nyj23ve2HK4cWLWsSDg0K0kLygTkOPddrK9jjj7u9o8KjQxE1TQhKpxb
 gKEGW3w6R5fC33yUuq1JJd1Y+HJKOy1L5b4tKS7UAkKUtHNGBG/0jFUfKy22VuTR6Oo/
 15ByLSBkAmm9WPH1sS5Qhg4MFrdEyc8gl6CCqgwifvtydRxlHCvwhEnqPPSrp3r8QC+2
 oiUg==
X-Gm-Message-State: AOJu0YzAOjzE9917Jfvi2uIAhoRD6UhvF9jQzAo0Aolxe/BUUr2Nf6sK
 4NPTnyl5NofdwYzAqjJjTleGysoiaYnFsIAsVNlmE+kOwdhnqP59zhAUvw==
X-Google-Smtp-Source: AGHT+IFkrC3+JIDtFi8Xf7CUeY52NMB8X5NsqpFk3XtRniFrM7cKasFo3O7H0JB0G5DakbegA7ZTlg==
X-Received: by 2002:a05:6e02:1b0d:b0:3a0:8ecb:a1dc with SMTP id
 e9e14a558f8ab-3a0c9d32f34mr60341935ab.15.1726990028123; 
 Sun, 22 Sep 2024 00:27:08 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed4b52bsm4521034173.154.2024.09.22.00.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 00:27:07 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 01:27:05 -0600
Message-Id: <20240922072705.997454-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726990028; x=1727594828; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nJur13AUcgCMRzO9hg6BvKbyrQWDl0zDvVS5pSs21wE=;
 b=Bv7xDXHQ6mcL/4TWh7SANcXmnnb/A2h7lvk6cgN9M1Im9wC+NPQwO97P3LV8HqMP24
 XlgM4qx/8MkaDLJMMrAVFSRxJ22OZRaJdPQqaDZ+ko/UbCkqSONXGJ5NoddHEfQjmycu
 3zV8/wM1Z3pbAsBYXM1gZksNGp0BcnBR6Yh/TlMVuTfnitFDWaSlcuZrYdpuDPmQqmtU
 YarBdb7wm8OGSvcfbGQkwHQnvwiD6Pbwgbeo1JFQF8JsVSYzPQJMUzkD43000hg4iNRU
 lpaVVfknKc4uaX6tkL/shJBdMWb24FXwPjfdoTYNHUcfCXEWkSLX1NY4x1H3/1tlvV9f
 cgLg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Bv7xDXHQ
Subject: [Buildroot] [PATCH 1/1] package/python-zeroconf: bump to version
 0.123.0
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

License hash changed due to formatting changes:
https://github.com/python-zeroconf/python-zeroconf/commit/755ceae1f6a899a8befcc033d99acdddee224ba2

Migrate from setuptools to poetry build backend.

Add new host-python-cython build dependency.

Add host-python-setuptools build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-zeroconf/python-zeroconf.hash |  6 +++---
 package/python-zeroconf/python-zeroconf.mk   | 10 +++++++---
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/python-zeroconf/python-zeroconf.hash b/package/python-zeroconf/python-zeroconf.hash
index 13e1d16cde..dbc54b1e1c 100644
--- a/package/python-zeroconf/python-zeroconf.hash
+++ b/package/python-zeroconf/python-zeroconf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zeroconf/json
-md5  f85fb9d239397b53836495fd49b85e5f  zeroconf-0.39.4.tar.gz
-sha256  701e4d697f89fe952aa9c13a512ed6bf472dcf4f0a6d275e71085604b3882295  zeroconf-0.39.4.tar.gz
+md5  c4d49cca10d8d10f12e9152d6380de35  zeroconf-0.123.0.tar.gz
+sha256  c50f24c9a7a6c7ba4bb301defad03a9d85dffb3ee280953de44eee9f432f2550  zeroconf-0.123.0.tar.gz
 # Locally computed sha256 checksums
-sha256  35e4136e96aace60757a8b939741959d8627c4bc1fce62af99df325395276c56  COPYING
+sha256  4d1d974999ae8655ee47afb47ac3b327cd1baeea3509aecb35341ba1a1a53c94  COPYING
diff --git a/package/python-zeroconf/python-zeroconf.mk b/package/python-zeroconf/python-zeroconf.mk
index d939b2e5ae..726d874034 100644
--- a/package/python-zeroconf/python-zeroconf.mk
+++ b/package/python-zeroconf/python-zeroconf.mk
@@ -4,11 +4,15 @@
 #
 ################################################################################
 
-PYTHON_ZEROCONF_VERSION = 0.39.4
+PYTHON_ZEROCONF_VERSION = 0.123.0
 PYTHON_ZEROCONF_SOURCE = zeroconf-$(PYTHON_ZEROCONF_VERSION).tar.gz
-PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/f5/4f/c47cea73d7ae5467b63de3999d7207fd5b14d70cb2f35ce81c4ab7d7a52e
-PYTHON_ZEROCONF_SETUP_TYPE = setuptools
+PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/db/47/85eafb277f6ef78e1a1895cc72f0035dfa6a5e51396134eb9ce21564c72f
+PYTHON_ZEROCONF_SETUP_TYPE = pep517
 PYTHON_ZEROCONF_LICENSE = LGPL-2.1+
 PYTHON_ZEROCONF_LICENSE_FILES = COPYING
+PYTHON_ZEROCONF_DEPENDENCIES = \
+	host-python-cython \
+	host-python-poetry-core \
+	host-python-setuptools
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
