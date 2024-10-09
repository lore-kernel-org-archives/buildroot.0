Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1AC5CEE332
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 17:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 899DB406C9;
	Wed,  9 Oct 2024 17:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xo_KELPLchHx; Wed,  9 Oct 2024 17:10:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C679406FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C679406FB;
	Wed,  9 Oct 2024 17:10:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7AC321BF3E8
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 17:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A1696063F
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 17:10:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3vh4yjXENlds for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 17:10:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 70F6160631
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70F6160631
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 70F6160631
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 17:10:50 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-82cdb749598so421739f.1
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 10:10:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728493849; x=1729098649;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OOoTvY3hKdU87k3t2sT88zIc9nAb+xh70Kp7Po9qcGc=;
 b=bQUJXNE5ptG/9GjnewK2HB7O/7dUA1yiFr/ka+xG19rqBU7XXqkCufx7N4MXBPoUWa
 HpmdlLFu/+kw2qLiTkEf4rb7dG3ohxczu+V8MtO4vwtzHiIL/V+bNsvr0XQJjB8lUEPW
 fgX9+nuFXWX/jnfoQLzC5UJirX2D17zYauc0TVjougX7JSUB6uUZEJc+JKxfSjg5tRoC
 hnaYBUCOHFSjLkf2b57eIbkjD/bjsT9eQjVIjsa1NA3/lFw7qlMugxrbThfsZ0bcfKiP
 v4aVKw1CRnigJNz/30zAcWstGB3oUPIHoAoTAGVikJOPPOV/I1DaJ/vbqtA/LY/94Xq2
 ytqw==
X-Gm-Message-State: AOJu0Yz09xxQ0D3RH4fSnEWZFPK33bnZ0u+Qab8ba7ceAEm4wALLy2pv
 V2twbNX9bJh5nNhArHPOoyDXA5g/vVb0WyhC4qd73nk8d/+kjiKpONpTl+hY
X-Google-Smtp-Source: AGHT+IE/QmWtO2L+CyLtr90Oockk/LZwj5M+HVQPNzuj+5d4lr5fyRSHBLKnC3XVeAJ7AoOejWbpog==
X-Received: by 2002:a05:6602:6010:b0:832:13ce:1fa3 with SMTP id
 ca18e2360f4ac-8353d4ad333mr406972139f.8.1728493848997; 
 Wed, 09 Oct 2024 10:10:48 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4db8f3d31f0sm1113351173.5.2024.10.09.10.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 10:10:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 11:10:43 -0600
Message-Id: <20241009171043.3836884-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728493849; x=1729098649; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OOoTvY3hKdU87k3t2sT88zIc9nAb+xh70Kp7Po9qcGc=;
 b=nZJfX7TcVq9WvYEt39hyIpUeLdtVjW6O7LEyIn2H5sDR66mCSjJJcb4qbHCgbpLZDT
 J9eSW/lEGKJTITuhv8kU0v6nmnykp2fZMWrLFJ1TNNJVw6iMCtVfBC2Esud8UI/UogH/
 q8lWArV8Je3PtyjRhoXM4yp06Jgjpex+n2GlbZZUrt9L4g/ULtYRF4/4xFdAmwoBHpLF
 efsfU1g42V2SASpA26olBf5bm7Ni3WmkZAyLvlMT+mNb6UTG4byrm2ebSfJd1TFvtWDz
 J5BO6yecRIlaZYG5pYO5Glm49z/tshpECuvwsiIAkRrsQeMaImomETP8mEHIXxVOQta4
 jBkA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nZJfX7Tc
Subject: [Buildroot] [PATCH 1/1] package/python-markupsafe: bump to version
 3.0.1
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

License file renamed without changing content.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-markupsafe/python-markupsafe.hash | 6 +++---
 package/python-markupsafe/python-markupsafe.mk   | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-markupsafe/python-markupsafe.hash b/package/python-markupsafe/python-markupsafe.hash
index c6f9cd4702..8902d3d0ec 100644
--- a/package/python-markupsafe/python-markupsafe.hash
+++ b/package/python-markupsafe/python-markupsafe.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/markupsafe/json
-md5  8fe7227653f2fb9b1ffe7f9f2058998a  MarkupSafe-2.1.5.tar.gz
-sha256  d283d37a890ba4c1ae73ffadf8046435c76e7bc2247bbb63c00bd1a709c6544b  MarkupSafe-2.1.5.tar.gz
+md5  202a35d8c8309cd6e70f8b03c5eb7b61  markupsafe-3.0.1.tar.gz
+sha256  3e683ee4f5d0fa2dde4db77ed8dd8a876686e3fc417655c2ece9a90576905344  markupsafe-3.0.1.tar.gz
 # Locally computed sha256 checksums
-sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.rst
+sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.txt
diff --git a/package/python-markupsafe/python-markupsafe.mk b/package/python-markupsafe/python-markupsafe.mk
index b54a77365f..c96207d14b 100644
--- a/package/python-markupsafe/python-markupsafe.mk
+++ b/package/python-markupsafe/python-markupsafe.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_MARKUPSAFE_VERSION = 2.1.5
-PYTHON_MARKUPSAFE_SOURCE = MarkupSafe-$(PYTHON_MARKUPSAFE_VERSION).tar.gz
-PYTHON_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/87/5b/aae44c6655f3801e81aa3eef09dbbf012431987ba564d7231722f68df02d
+PYTHON_MARKUPSAFE_VERSION = 3.0.1
+PYTHON_MARKUPSAFE_SOURCE = markupsafe-$(PYTHON_MARKUPSAFE_VERSION).tar.gz
+PYTHON_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/b4/d2/38ff920762f2247c3af5cbbbbc40756f575d9692d381d7c520f45deb9b8f
 PYTHON_MARKUPSAFE_SETUP_TYPE = setuptools
 PYTHON_MARKUPSAFE_LICENSE = BSD-3-Clause
-PYTHON_MARKUPSAFE_LICENSE_FILES = LICENSE.rst
+PYTHON_MARKUPSAFE_LICENSE_FILES = LICENSE.txt
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
