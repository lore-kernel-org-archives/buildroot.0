Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B972AC47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 04:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24FB883E47;
	Thu, 11 Jan 2024 04:18:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24FB883E47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rdHjYjBREZrJ; Thu, 11 Jan 2024 04:18:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7337583E45;
	Thu, 11 Jan 2024 04:18:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7337583E45
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D32E81BF380
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 04:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC38483E45
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 04:18:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC38483E45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l3jj1-JzOfUI for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 04:18:00 +0000 (UTC)
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E7A283DB8
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 04:18:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E7A283DB8
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-7bed9f3ca97so88880139f.1
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:18:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704946679; x=1705551479;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cyM0tJfFFsn7DbVd/RB/V4nuvoFgHY4TlOP3Jm2TGUs=;
 b=nBb6zurB6U3z1+J5ikBhyl2xYde0py2d6YFXs6iOeh8iE2gnYChb13nUh+5bNXIiVX
 1F2Di7JuF1PbSyygBhHKTAjTEfZLZNp5oi9ue3D1JAcYpvA5J0RY1bywpPZhs5UvXFB+
 Film2VDPHa6qEMKOkJi1yD+bshYllNBAtwYDd0JdrZIYfrbHI90wAVik1nhc11Wue+Ci
 ueexQgSI1OLm6G10pB0g2Ds1IQ4ngvK69tVpFn+cLYXULwRW0oomQ34RN1sXO209Fwp1
 7g0hVXplxBeq0Zgq+nUDhd+zInzWafmPNgR7SLS6uHprnXXgWcHGmxmRq9XzAUk7NOz7
 KIvA==
X-Gm-Message-State: AOJu0YyJ/9PEqH5Ogo4sQSx6RvA0sycQt9oGqXp4cq3MFLGfWu7Mjvhz
 kjZqU+ZzuMJV03tvJwFybRFGdeAkxnI4Hg==
X-Google-Smtp-Source: AGHT+IGna4QzpfTGw/k042jQR3MmeqZGuI4JpDO7Zr6FDtPbXB1Q8502eK5VOZR2Gaz1+KjMy/E4Ww==
X-Received: by 2002:a6b:c84d:0:b0:7ba:db6f:6a6 with SMTP id
 y74-20020a6bc84d000000b007badb6f06a6mr790961iof.11.1704946679220; 
 Wed, 10 Jan 2024 20:17:59 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 c5-20020a02a405000000b0046e304dc641sm85550jal.95.2024.01.10.20.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 20:17:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 21:17:57 -0700
Message-Id: <20240111041757.2707481-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704946679; x=1705551479; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cyM0tJfFFsn7DbVd/RB/V4nuvoFgHY4TlOP3Jm2TGUs=;
 b=fbXcef3k4yRnqWWv2hCdMYfUgA6emPi125Fzliij2iyY8hAAMU5z5oITgaKjZXiNnn
 p11e0nAfDxGd+wyxbVTpYQ39cRBpWyXKkQu55edZeW6dkM91jEQJMclZCv18UJ1Kv0hA
 mE2CkA8FZue6zkoURmWHYgXv5XkLPL6XQ9Njyc+PEix6VA34MWTUYn64442Br8c0Tujh
 uZdRhl1M3L9jt9+fKjxrDwoULK746PS3Pej4d6mERo39OYDLhvi3R5T9ZFW4sCJUEx54
 nxhDriwiYZlk5rlM0KNE879G7ql609Yk1Bxj6oq4iMrqmBDqO6twN4cWGkyaGDPn7CB+
 feAQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fbXcef3k
Subject: [Buildroot] [PATCH 1/1] package/python-pyudev: bump to version
 0.24.1
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

Drop no longer required python-six runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyudev/Config.in          | 1 -
 package/python-pyudev/python-pyudev.hash | 4 ++--
 package/python-pyudev/python-pyudev.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-pyudev/Config.in b/package/python-pyudev/Config.in
index e0da067cc2..aa98c2cc61 100644
--- a/package/python-pyudev/Config.in
+++ b/package/python-pyudev/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PYTHON_PYUDEV
 	bool "python-pyudev"
 	depends on BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  pyudev is a LGPL licenced, pure Python 2/3 binding to
 	  libudev, the device and hardware management and information
diff --git a/package/python-pyudev/python-pyudev.hash b/package/python-pyudev/python-pyudev.hash
index 014bf20933..72eb323e1f 100644
--- a/package/python-pyudev/python-pyudev.hash
+++ b/package/python-pyudev/python-pyudev.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyudev/json
-md5  17c0a41f0e4dfc016350806a0a60f630  pyudev-0.24.0.tar.gz
-sha256  b2a3afe1c99ea751f8296652557eac559874da2a1b1ec0625178706ec5a345f3  pyudev-0.24.0.tar.gz
+md5  fecaabe9eaa890d2173c7b49ab63a412  pyudev-0.24.1.tar.gz
+sha256  75e54d37218f5ac45b0da1f0fd9cc5e526a3cac3ef1cfad410cf7ab338b01471  pyudev-0.24.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/python-pyudev/python-pyudev.mk b/package/python-pyudev/python-pyudev.mk
index 5d48cd4f7c..53d60572a8 100644
--- a/package/python-pyudev/python-pyudev.mk
+++ b/package/python-pyudev/python-pyudev.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYUDEV_VERSION = 0.24.0
+PYTHON_PYUDEV_VERSION = 0.24.1
 PYTHON_PYUDEV_SOURCE = pyudev-$(PYTHON_PYUDEV_VERSION).tar.gz
-PYTHON_PYUDEV_SITE = https://files.pythonhosted.org/packages/00/8d/810750cb2fc64d7e0dbefc106a9137b157616a95be3f0ea51ca3cf6c762a
+PYTHON_PYUDEV_SITE = https://files.pythonhosted.org/packages/20/b6/16961ac3575575260c72928f17df9c99c2a696871e486965ec6e2fa2aff4
 PYTHON_PYUDEV_LICENSE = LGPL-2.1+
 PYTHON_PYUDEV_LICENSE_FILES = COPYING
 PYTHON_PYUDEV_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
