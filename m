Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F640C5479D
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 05:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 037BD8175F;
	Mon,  9 Jan 2023 05:23:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 037BD8175F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gzWFEMl5HAQG; Mon,  9 Jan 2023 05:23:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17ABA81760;
	Mon,  9 Jan 2023 05:23:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17ABA81760
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C04DB1BF3EF
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 05:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C3D560AF4
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 05:23:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C3D560AF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bz2EzgAQWSm0 for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 05:23:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 808A460A81
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 808A460A81
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 05:23:07 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id m15so4430282ilq.2
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 21:23:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mB1d4JIrOLaLWpqVREspPf111ubiSp2Jjbmqzc2Y7Lg=;
 b=KGKs4E4nce6IljhGt4PfjWaG4V3Gjb2N3wkOil6hEd55V7n1Cqev6uDAH8FZlmRlwN
 nCh6B/tLIXr9/miD4j758yqW4XYfnOljQteAQcmjl7Q8GO4J9DW1uFev2ebivrL+obe5
 BLBPjzi6swKYULR42w568aWT2mYxVWOfQT9JMwjIPxwxnAqly9Rx/I9ECdBFuTBkN/Lw
 VvszQS5dSKIzxO1X1XLrdMpsblaArdonyUaEnyrCZkeDweUq1XDpEdJKGs3W1Dx3P8Wc
 hT8Ip9LHTtqZfpiI+gSvEjB4C7S7iavzsCHGgCh8xwqVGiA7e83rEC/+uHHi7DTbD+1c
 uO6w==
X-Gm-Message-State: AFqh2kogsJBuQW1KKuS0imvlBb8EmF0iVMSOvFppdn4nVmPEqW8Wg4+P
 Eoc60qnQ+CelgobMD6iux9njvyqaFP4IEVVz
X-Google-Smtp-Source: AMrXdXuqoDxzYEB+zo5i0T5vkv+ZZpoKy/97i2xjekFx8FhkLAXIhB6VALx7vGpMYmFrieKNAj/vow==
X-Received: by 2002:a92:3204:0:b0:30d:7f76:83be with SMTP id
 z4-20020a923204000000b0030d7f7683bemr9539696ile.8.1673241786358; 
 Sun, 08 Jan 2023 21:23:06 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 v19-20020a02b093000000b0039e8c12414asm372085jah.164.2023.01.08.21.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 21:23:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 22:23:04 -0700
Message-Id: <20230109052304.2631145-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mB1d4JIrOLaLWpqVREspPf111ubiSp2Jjbmqzc2Y7Lg=;
 b=N/rDv06WZRQZjba6simP0KIJOmzK7JvNyB8FaLV9MSrig9bMpaOnejtEImOXqchBY3
 jl4kjrGFFTIal+XXR86eNKaz7Idk0kfENwqZ7cFWrCSyMNToVB99XmwK57n+qQBXVgkk
 kgQcsLPo0jRM+yZX47ylMmAndzX7LT/HBzAU9Wma8gXoSrrV3Tesq5Z6efjL4lMMJPJ5
 q+079qGQ3xNAnWZmkzl57Ioa0S7YHqKL5LKZOYIp5r19gPcWhAqSIrmoDWBDpOHkI63U
 DoNlzvASUtOj2pi0QI6XaFOl8hPBVSdtTAmCWNl6utDefHvyWHj2mlVimx7S5cvh394K
 aj0w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=N/rDv06W
Subject: [Buildroot] [PATCH 1/1] package/{,
 python-py}mupdf: bump to version 1.21.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/mupdf/mupdf.hash                   | 4 ++--
 package/mupdf/mupdf.mk                     | 2 +-
 package/python-pymupdf/python-pymupdf.hash | 4 ++--
 package/python-pymupdf/python-pymupdf.mk   | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mupdf/mupdf.hash b/package/mupdf/mupdf.hash
index 6785aa163a..ef91abee18 100644
--- a/package/mupdf/mupdf.hash
+++ b/package/mupdf/mupdf.hash
@@ -1,8 +1,8 @@
 # From https://mupdf.com/downloads/index.html:
-sha1  27d75cae256450abb9f50cd00b3e5a895fc684cf  mupdf-1.21.0-source.tar.lz
+sha1  f759d914ec6ad6a3b96f994630ff70b75823831b  mupdf-1.21.1-source.tar.lz
 
 # Locally computed:
-sha256  f23fc1ad9081375d9c5f2318d6e6e5c5be490ecb70b10ed7167932afbe1ccfb5  mupdf-1.21.0-source.tar.lz
+sha256  66a43490676c7f7c2ff74067328ef13285506fcc758d365ae27ea3668bd5e620  mupdf-1.21.1-source.tar.lz
 
 # Hash for license files:
 sha256  57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6  COPYING
diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
index e93a41bd00..d6cc407c49 100644
--- a/package/mupdf/mupdf.mk
+++ b/package/mupdf/mupdf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # python-pymupdf's version must match mupdf's version
-MUPDF_VERSION = 1.21.0
+MUPDF_VERSION = 1.21.1
 MUPDF_SOURCE = mupdf-$(MUPDF_VERSION)-source.tar.lz
 MUPDF_SITE = https://mupdf.com/downloads/archive
 MUPDF_LICENSE = AGPL-3.0+
diff --git a/package/python-pymupdf/python-pymupdf.hash b/package/python-pymupdf/python-pymupdf.hash
index d930d04335..bda356d905 100644
--- a/package/python-pymupdf/python-pymupdf.hash
+++ b/package/python-pymupdf/python-pymupdf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymupdf/json
-md5  ae24d77d44369e46bbcd5457fe97d776  PyMuPDF-1.21.0.tar.gz
-sha256  a63dfc289e127a16ab60310ee6005fe83121c7a97f7c120db688f9281c9e5d0f  PyMuPDF-1.21.0.tar.gz
+md5  be10963679ac6d52b7aed2311ca7e3c5  PyMuPDF-1.21.1.tar.gz
+sha256  f815741a435c62a0036bbcbf5fa6c533567bd69c5338d413714fc57b22db93e0  PyMuPDF-1.21.1.tar.gz
 # Locally computed sha256 checksums
 sha256  57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6  COPYING
diff --git a/package/python-pymupdf/python-pymupdf.mk b/package/python-pymupdf/python-pymupdf.mk
index 38212dc44b..70448e8d90 100644
--- a/package/python-pymupdf/python-pymupdf.mk
+++ b/package/python-pymupdf/python-pymupdf.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # python-pymupdf's version must match mupdf's version
-PYTHON_PYMUPDF_VERSION = 1.21.0
+PYTHON_PYMUPDF_VERSION = 1.21.1
 PYTHON_PYMUPDF_SOURCE = PyMuPDF-$(PYTHON_PYMUPDF_VERSION).tar.gz
-PYTHON_PYMUPDF_SITE = https://files.pythonhosted.org/packages/61/14/632eefe5568ee7a4ec95aa7fc9c63996ff6a6d2464d4e3a9dc35da11a409
+PYTHON_PYMUPDF_SITE = https://files.pythonhosted.org/packages/30/44/9fce79689e5df7deebe2d17cb2b9b2a6b888439c241e71296e732aefa649
 PYTHON_PYMUPDF_SETUP_TYPE = setuptools
 PYTHON_PYMUPDF_LICENSE = AGPL-3.0+
 PYTHON_PYMUPDF_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
