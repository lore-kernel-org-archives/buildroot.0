Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A84BC3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 07:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DA7060E86;
	Mon,  8 Jan 2024 07:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DA7060E86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AfBdqMjE8HWT; Mon,  8 Jan 2024 07:03:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 694BB6068F;
	Mon,  8 Jan 2024 07:03:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 694BB6068F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E5E7A1BF387
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 07:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 704FC60E86
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 07:03:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 704FC60E86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vl0qMjUlkJDU for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 07:03:13 +0000 (UTC)
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7419560E34
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 07:03:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7419560E34
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3606f133b1fso4183485ab.0
 for <buildroot@buildroot.org>; Sun, 07 Jan 2024 23:03:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704697392; x=1705302192;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1wu3MMZI3kV+3b5ZzSEEPUhYpPHC39zFX+W72Lx9jaM=;
 b=hBenTOzFMrD9qzn0Vh2kJ10c5JPo4VKEEm2EvRyDlSj4VZGkqcS1G2zqoxcwgcYS99
 aN1OTXCLB60Bt5OJwd4JxeTrF0ftLN+aoI+awp3MCaca4UrYFpOtFCfBRZ3lV5jYJDus
 vhMai8EPT+yqDVSwgul7Uxz9sr7IjNwC/URwErYFhPjB8mO9OIhLJM6ZCvPrRyiLshMZ
 WW2+Y41YQ4CvvlKixfnb62VbgH5QwZt2t3kze8H5eQg+grcSCOxHQYctHnfHY8QApP1m
 xFaygTZ6A3gJKMGoawRubdzSVpsm3l2X11Rcu3kbtQcOSIdbI6K8CGPHKoBoMYV66g+J
 SwFw==
X-Gm-Message-State: AOJu0YxQ9WzSaS1Q1qUnN0RDNwa+2pty3+LLN8CPjACMAvNbzQD+AsuC
 vgkpIwAO8R2xHjeV5T0EaDpTojfxHWNMxg==
X-Google-Smtp-Source: AGHT+IFMOjy1AWgx0BzOlicwOI19OGj0AgBcDjc2PFr+WGEULOO8o35swzY5cba5AWoMuuoTeDn0fg==
X-Received: by 2002:a92:c54b:0:b0:360:73de:be5e with SMTP id
 a11-20020a92c54b000000b0036073debe5emr2390213ilj.14.1704697392028; 
 Sun, 07 Jan 2024 23:03:12 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 br10-20020a056e0223ca00b0035fea0268bcsm2378990ilb.28.2024.01.07.23.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 23:03:11 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Jan 2024 00:03:09 -0700
Message-Id: <20240108070310.3462577-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704697392; x=1705302192; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1wu3MMZI3kV+3b5ZzSEEPUhYpPHC39zFX+W72Lx9jaM=;
 b=fs4oByxArFlNwoZvBNivrVs/Irq/zAgppiuYjZ9el/+rQwLkR1MDldDIJuyqeM4ce9
 N0JEFB4R900ZaJ5jyFKSfIJ5LjkKGFXFbO5HsLJRy2DgdIbYjP+UM5aY69T/QoAUI3oR
 60emZ81PjEAXG2ruWhJBy/AgXp7n76RKx4/05zZKMywaiIew99pJATYWVIbsqDZ5kag9
 vrTpM+W/9jz3PakJBNjKjFacPhE4+hzNh/7WdHixIIMcTzbMLsLoQV66jev0J5jG4JGm
 yTDnohbglz7w+FwqBiaU9Awxpdys+o++bTH0Xjh9EXBHdbgCwBz1HCnFK7cuERp+4zv/
 gtRQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fs4oByxA
Subject: [Buildroot] [PATCH 1/2] package/python-hatch-fancy-pypi-readme:
 bump to version 24.1.0
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
 .../python-hatch-fancy-pypi-readme.hash                     | 6 +++---
 .../python-hatch-fancy-pypi-readme.mk                       | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.hash b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.hash
index d9fdb88e1f..e3a6363eb7 100644
--- a/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.hash
+++ b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/hatch_fancy_pypi_readme/json
-md5  8755cce1a4a4d5e5d84992089801acbf  hatch_fancy_pypi_readme-23.1.0.tar.gz
-sha256  b1df44063094af1e8248ceacd47a92c9cf313d6b9823bf66af8a927c3960287d  hatch_fancy_pypi_readme-23.1.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/hatch-fancy-pypi-readme/json
+md5  f5f9e639f066c91f8e623ec6231beae9  hatch_fancy_pypi_readme-24.1.0.tar.gz
+sha256  44dd239f1a779b9dcf8ebc9401a611fd7f7e3e14578dcf22c265dfaf7c1514b8  hatch_fancy_pypi_readme-24.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  e69ea57f96e599e617f61af3e85bf326b87e833994709fb5e5908a81197730a2  LICENSE.txt
diff --git a/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk
index 6195a30436..2a26892388 100644
--- a/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk
+++ b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HATCH_FANCY_PYPI_README_VERSION = 23.1.0
+PYTHON_HATCH_FANCY_PYPI_README_VERSION = 24.1.0
 PYTHON_HATCH_FANCY_PYPI_README_SOURCE = hatch_fancy_pypi_readme-$(PYTHON_HATCH_FANCY_PYPI_README_VERSION).tar.gz
-PYTHON_HATCH_FANCY_PYPI_README_SITE = https://files.pythonhosted.org/packages/85/a6/58d585eba4321bf2e7a4d1ed2af141c99d88c1afa4b751926be160f09325
+PYTHON_HATCH_FANCY_PYPI_README_SITE = https://files.pythonhosted.org/packages/b4/c2/c9094283a07dd96c5a8f7a5f1910259d40d2e29223b95dd875a6ca13b58f
 PYTHON_HATCH_FANCY_PYPI_README_LICENSE = MIT
 PYTHON_HATCH_FANCY_PYPI_README_LICENSE_FILES = LICENSE.txt
 PYTHON_HATCH_FANCY_PYPI_README_SETUP_TYPE = pep517
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
