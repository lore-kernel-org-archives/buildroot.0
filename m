Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49A1CDD55C
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 20:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DD886123D;
	Wed, 18 Sep 2024 20:55:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mHqfzIrKdCAh; Wed, 18 Sep 2024 20:55:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DF7F61248
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DF7F61248;
	Wed, 18 Sep 2024 20:55:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3CB791BF30C
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 20:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37EE4427A7
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 20:55:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iEnmQ4T8TCnF for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 20:55:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1B0E742789
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B0E742789
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B0E742789
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 20:55:33 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3a046d4c465so481585ab.3
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 13:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726692933; x=1727297733;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=81D/lQFOZtx2zpDCXKzIQjmVZIcq2vXEY51V0zmW64A=;
 b=S2fcJA9n1AbgzJpepJHuDBIxUym2FVxNAP530N7Ot7ZnmZsvWcdqmwjIFyl+d2Dox2
 hBWLZ09KNkJrA4cmEiwvzahuRyXnT8nQP1DT9BF8hI59sgUaQJ7sFmyUsS9vRR2VQtlC
 uX1cS3edOgVDFjX7A5gihs+mHjuVHpFPoXcXjzKQ2PXNu7ccv0kVkL8YbFg2dLd2nkYP
 OZTGJmBqJ6+ltzuViWrRrIXHOKDpmrO1rIwuctWccDGjNzPyWRR8YDL4gVly+KT9qaa3
 hviE1ExaPltOhnMeR6CBi91/DCz03bAfaYhcF4PvXLyJp5H6W9kQn+QVQ3zqsEeuEYqm
 zI/Q==
X-Gm-Message-State: AOJu0YxwNWqST2ZbRqEeHLfSAtFAyw7qnR+a7mXf2mTaEkpouUEfwWdf
 LuCOXZ9NceJPwBzl72pPnTGitqRdThayyvsZt38D3fLdNnch8YPG09rZBcTP
X-Google-Smtp-Source: AGHT+IFn4ZqPDV+BGkyEWq6BKoDuWId0g3dC+0nJrRsw+u6G4XDzMhBK1fKQK6GVz3/d3Qwt20Mu4g==
X-Received: by 2002:a05:6e02:218c:b0:3a0:9050:702a with SMTP id
 e9e14a558f8ab-3a090507262mr158136135ab.17.1726692932632; 
 Wed, 18 Sep 2024 13:55:32 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e8d803sm30038205ab.76.2024.09.18.13.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2024 13:55:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 18 Sep 2024 14:55:30 -0600
Message-Id: <20240918205530.443111-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726692933; x=1727297733; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=81D/lQFOZtx2zpDCXKzIQjmVZIcq2vXEY51V0zmW64A=;
 b=kyuXVthqqA3GefkwiztbVCqNcsREBOeWUjnRvD1DuitIsT514WAVkPG74vL15uZVA4
 LnvvVISoxJzuLmVB1k+YPneShzLVhFsXpGznhp5P8hZvACzswDLn7RrLaLJuZEI1hcxL
 6vkfsuwVMKwPmmLBP8IyOz663fjcmUH3jssJYL8Axmdlih65N2232r0LZOOgpNQeJUC3
 o7oLIoSgeVtOO7X20Bae6/f25h8T2IJBYvJCpI9zd97syOQdCS/g/awbjOqHMIMRyTUx
 jgCEOCMeNKDSmre0pv9xk72DnqgkOLBMFEe8Iywexb92auNwq8pQbYS2NRxTGt3qG6a3
 mdOg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kyuXVthq
Subject: [Buildroot] [PATCH 1/1] package/python-pyudev: bump to version
 0.24.3
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
 package/python-pyudev/python-pyudev.hash | 4 ++--
 package/python-pyudev/python-pyudev.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyudev/python-pyudev.hash b/package/python-pyudev/python-pyudev.hash
index 72eb323e1f..e9596b7b43 100644
--- a/package/python-pyudev/python-pyudev.hash
+++ b/package/python-pyudev/python-pyudev.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyudev/json
-md5  fecaabe9eaa890d2173c7b49ab63a412  pyudev-0.24.1.tar.gz
-sha256  75e54d37218f5ac45b0da1f0fd9cc5e526a3cac3ef1cfad410cf7ab338b01471  pyudev-0.24.1.tar.gz
+md5  07bbe9111308d2509645705b8321c416  pyudev-0.24.3.tar.gz
+sha256  2e945427a21674893bb97632401db62139d91cea1ee96137cc7b07ad22198fc7  pyudev-0.24.3.tar.gz
 # Locally computed sha256 checksums
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/python-pyudev/python-pyudev.mk b/package/python-pyudev/python-pyudev.mk
index 53d60572a8..fa11ce5040 100644
--- a/package/python-pyudev/python-pyudev.mk
+++ b/package/python-pyudev/python-pyudev.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYUDEV_VERSION = 0.24.1
+PYTHON_PYUDEV_VERSION = 0.24.3
 PYTHON_PYUDEV_SOURCE = pyudev-$(PYTHON_PYUDEV_VERSION).tar.gz
-PYTHON_PYUDEV_SITE = https://files.pythonhosted.org/packages/20/b6/16961ac3575575260c72928f17df9c99c2a696871e486965ec6e2fa2aff4
+PYTHON_PYUDEV_SITE = https://files.pythonhosted.org/packages/c4/5c/6cc034da13830e3da123ccf9a30910bc868fa16670362f004e4b788d0df1
 PYTHON_PYUDEV_LICENSE = LGPL-2.1+
 PYTHON_PYUDEV_LICENSE_FILES = COPYING
 PYTHON_PYUDEV_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
