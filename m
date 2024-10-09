Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5AFCEE330
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 17:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DDDE400E4;
	Wed,  9 Oct 2024 17:15:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MV7x6pu5xHzQ; Wed,  9 Oct 2024 17:15:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF81540118
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF81540118;
	Wed,  9 Oct 2024 17:15:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0026F1BF3E8
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 17:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0D876060A
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 17:15:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zBIdDGKIfJHR for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 17:15:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E779160608
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E779160608
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E779160608
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 17:15:11 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3a3a0482266so499615ab.0
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 10:15:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728494110; x=1729098910;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lUwRTnPCQw7/LRcJvQujEUq1TtEh6JhOIcduG+R8Yk8=;
 b=jlvG0f2HlZn+qNa2hK3hAhmVeJ+Ja0hirQSYcIU/PQEALdctfgZonOij3hFcSewq+H
 VGMUMQ5Gd2Peezhe/idq6277aOamjXw/KlIibSkn0w4zJME11PJ0AChvkgnioGhFW7QE
 4JHK4G+03LNHtMsNUmbdax56e9DfkUvZBY4L82elLEJCZWq7rSGqiC54z/tVlgvKkies
 xzK1DEgt7TiZTl5O7IsperUtFEuXs0jhHi4SQnFEfHZ7IpJTTQ0JAy3m5E67xN2501ys
 FlDPnLZT2C4b4VMbVgcIWRWbOsppXVmUHLs2QGWQNVpzw8DmUM7mJZEc+ndI2YYpWxWO
 e2WQ==
X-Gm-Message-State: AOJu0Yzz2ncnX1RFoGvoMbAj3bhPnff/C8s4m3Xlqw+3LaKZwrd69ZHf
 RrD2pUF4vqfYiknXkFiF1H59OL4XmU2iqnncA7q5nlkbjRz+/kYgyfz4YEdo
X-Google-Smtp-Source: AGHT+IE485twNNehdSctYd2cHgZrmbX84t2aRASzhB+pXz8FEr+JrgrZxzgmL78kMWrLqQZ+7AvogA==
X-Received: by 2002:a05:6e02:174a:b0:3a2:6ce9:19c6 with SMTP id
 e9e14a558f8ab-3a397d19e1emr29225525ab.25.1728494110481; 
 Wed, 09 Oct 2024 10:15:10 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a3a030a20fsm2702475ab.8.2024.10.09.10.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 10:15:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 11:15:08 -0600
Message-Id: <20241009171508.3840258-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728494110; x=1729098910; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lUwRTnPCQw7/LRcJvQujEUq1TtEh6JhOIcduG+R8Yk8=;
 b=nsQ7S7vte2NlvCVAGon2ffOgjrc6wuP7czN/0qi24OHdZYGnvW/htAjZDLGBtXU7xZ
 EkNkRZhHIK+/DitUgwrb5FhGmHWbfiUNxECiW28375BiDEtBFWWCFtUvFEAX2zklKM25
 fsjaAdKQ9i1Voqhq8dJ9I5lWcVGhaVE1nO5/sIIAHVnem/YKp3NmO71SbCZmvgj+0Dzm
 1PPYWDwfWKxp/WTOXxFXRPorXXsP+D8TNTTFdc+vKLzuUuWsLXYrevfikdwP/ACWE7cZ
 BrcOW6k0f75tJ/C5gqll04oWllG0/PWw792uVXz5kl3jo66vigqeLvdSoHm1kK/XSO5+
 rmSw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nsQ7S7vt
Subject: [Buildroot] [PATCH 1/1] package/python-pycryptodomex: bump to
 version 3.21.0
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pycryptodomex/python-pycryptodomex.hash | 4 ++--
 package/python-pycryptodomex/python-pycryptodomex.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycryptodomex/python-pycryptodomex.hash b/package/python-pycryptodomex/python-pycryptodomex.hash
index d8c40e0586..357d9e8c2b 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.hash
+++ b/package/python-pycryptodomex/python-pycryptodomex.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pycryptodomex/json
-md5  0dc549942de42494e34e8670126471e9  pycryptodomex-3.20.0.tar.gz
-sha256  7a710b79baddd65b806402e14766c721aee8fb83381769c27920f26476276c1e  pycryptodomex-3.20.0.tar.gz
+md5  1f75ba3b07402102857b5ed496f48718  pycryptodomex-3.21.0.tar.gz
+sha256  222d0bd05381dd25c32dd6065c071ebf084212ab79bab4599ba9e6a3e0009e6c  pycryptodomex-3.21.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4e04660d77c1c64e89d79537919fb8240fa21484a7e3db29f358b2c7f84ea073  LICENSE.rst
 sha256  8e563c767164faa0831a333b57d23d4311cf566eb1b15d93250f4606be4eb549  Doc/LEGAL/COPYRIGHT.pycrypto
diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
index 8fd3df53a5..96a55050e6 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.mk
+++ b/package/python-pycryptodomex/python-pycryptodomex.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCRYPTODOMEX_VERSION = 3.20.0
+PYTHON_PYCRYPTODOMEX_VERSION = 3.21.0
 PYTHON_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON_PYCRYPTODOMEX_VERSION).tar.gz
-PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/31/a4/b03a16637574312c1b54c55aedeed8a4cb7d101d44058d46a0e5706c63e1
+PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/11/dc/e66551683ade663b5f07d7b3bc46434bf703491dbd22ee12d1f979ca828f
 PYTHON_PYCRYPTODOMEX_SETUP_TYPE = setuptools
 PYTHON_PYCRYPTODOMEX_LICENSE = \
 	BSD-2-Clause, \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
