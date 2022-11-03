Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C925C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 18:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27F41404D8;
	Thu,  3 Nov 2022 18:39:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27F41404D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Huuh3icdN8pX; Thu,  3 Nov 2022 18:39:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 442DB404C1;
	Thu,  3 Nov 2022 18:39:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 442DB404C1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 188F11BF3DE
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 18:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0199F61007
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 18:39:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0199F61007
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mLvlIOlCJm5F for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 18:39:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E57661006
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E57661006
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 18:39:11 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id e189so2111841iof.1
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 11:39:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=konm1W7oVM7Y3wcZMMr8dAkYu+5OdlYh8ggTlsT5qUA=;
 b=aNigi1oPdTcxEgIRV8Y7yrKEVez010KjDQEZtXXIMdrr60ibFNFGNIFgwkJUfVpLfT
 x6zW7TFvWhzfaGfDcELb4u6X1yd6uG0TK8PsyuCQAL3WhLfG39hC1Q1SGvTcqTisCL+A
 6QALe7Q0TJfBNSc/lzgp59weR2gahUK5pBjWZPnutGnBTVXx0J6fsEPe/wm3OjI3Ih7A
 Xq/fnguhpt6+4q3mfUr/JPcKfVaKwPK8Hddc4KeoK42dwJfrDvLBvb61ZzGK4dl0PL5M
 d6oWvwNArFcIPMV908kaPe1cXFU7pURd2PiCc9s1AjXrKFpQgeKfGr6s2o2C1pbY0w9x
 z9Ew==
X-Gm-Message-State: ACrzQf1SSeunr0r4Wf45m+0haXK2FBWVdO0uoBj4KYWYo2lXWYDclyHU
 qG+9M0M7DbopKI5oV2TYlhNHXEzfjPXOAoHH
X-Google-Smtp-Source: AMsMyM6ateBbNwLVGczxXtq/TKqhPxyc/hybVCnop6kzfQWxPMApIHf2TqRp80KSvTOVjRioJn5iEQ==
X-Received: by 2002:a02:c64f:0:b0:375:513e:454d with SMTP id
 k15-20020a02c64f000000b00375513e454dmr16068043jan.242.1667500750845; 
 Thu, 03 Nov 2022 11:39:10 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 n26-20020a02715a000000b003757ab96c08sm446456jaf.67.2022.11.03.11.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 11:39:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 12:39:08 -0600
Message-Id: <20221103183908.1696712-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=konm1W7oVM7Y3wcZMMr8dAkYu+5OdlYh8ggTlsT5qUA=;
 b=B4rHc7w6Yxm14vvPUNd9343+r5Lc4QCIfUxxylswWSZzqG0Cq6CXggUzmpMayXSPFz
 ANxBN1FdPsKa8idExfVqCVwcKQlcgglMDoVqL32NrFqNIFuMiLOQBnRq5EFouWbKOXJX
 LcVCJvZ7t0eYjf6tQ3AxNIKgrwHeANh1JYryJJuAlkf5IEVcfuAQu+3ordbW/65zzdSs
 mFv5ZdX2P02+JKfHQ/KgKHbGgSAk1VJD0SuhWm/MAB/H94iQNyLP/HMcuAuk2U2QmaXf
 QjT6gswZ+yWSNUIvm8QaSRmzdUNJSVoyd3tzNcrWHJYPUJJ5tKc2Ko6k6iURTFZGde/j
 DMGw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=B4rHc7w6
Subject: [Buildroot] [PATCH 1/1] package/python-pyudev: bump to version
 0.24.0
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

Fixup patch so that it applies against 0.24.0.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...rkaround-finding-libudev-on-systems-without-ldconf.patch | 6 +++---
 package/python-pyudev/python-pyudev.hash                    | 4 ++--
 package/python-pyudev/python-pyudev.mk                      | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch b/package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch
index d798f836a5..26f1ef6390 100644
--- a/package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch
+++ b/package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch
@@ -24,9 +24,9 @@ index 9dffb3c..aa9942f 100644
 --- a/src/pyudev/_ctypeslib/utils.py
 +++ b/src/pyudev/_ctypeslib/utils.py
 @@ -28,7 +28,7 @@
- from __future__ import print_function
- from __future__ import unicode_literals
+ """
  
+ # isort: STDLIB
 -from ctypes import CDLL
 +from ctypes import cdll, CDLL
  from ctypes.util import find_library
@@ -41,7 +41,7 @@ index 9dffb3c..aa9942f 100644
 +    try:
 +        lib = cdll.LoadLibrary('lib%s.so' % name)
 +    except OSError:
-         raise ImportError('No library named %s' % name)
+         raise ImportError("No library named %s" % name)
 -    lib = CDLL(library_name, use_errno=True)
      # Add function signatures
      for funcname, signature in signatures.items():
diff --git a/package/python-pyudev/python-pyudev.hash b/package/python-pyudev/python-pyudev.hash
index def10542fa..014bf20933 100644
--- a/package/python-pyudev/python-pyudev.hash
+++ b/package/python-pyudev/python-pyudev.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyudev/json
-md5  377eda61186c91e9440f01d76dbb4206  pyudev-0.22.0.tar.gz
-sha256  69bb1beb7ac52855b6d1b9fe909eefb0017f38d917cba9939602c6880035b276  pyudev-0.22.0.tar.gz
+md5  17c0a41f0e4dfc016350806a0a60f630  pyudev-0.24.0.tar.gz
+sha256  b2a3afe1c99ea751f8296652557eac559874da2a1b1ec0625178706ec5a345f3  pyudev-0.24.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/python-pyudev/python-pyudev.mk b/package/python-pyudev/python-pyudev.mk
index 42d5c7000b..5d48cd4f7c 100644
--- a/package/python-pyudev/python-pyudev.mk
+++ b/package/python-pyudev/python-pyudev.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYUDEV_VERSION = 0.22.0
+PYTHON_PYUDEV_VERSION = 0.24.0
 PYTHON_PYUDEV_SOURCE = pyudev-$(PYTHON_PYUDEV_VERSION).tar.gz
-PYTHON_PYUDEV_SITE = https://files.pythonhosted.org/packages/72/c8/4660d815a79b1d42c409012aaa10ebd6b07a47529b4cb6880f27a24bd646
+PYTHON_PYUDEV_SITE = https://files.pythonhosted.org/packages/00/8d/810750cb2fc64d7e0dbefc106a9137b157616a95be3f0ea51ca3cf6c762a
 PYTHON_PYUDEV_LICENSE = LGPL-2.1+
 PYTHON_PYUDEV_LICENSE_FILES = COPYING
 PYTHON_PYUDEV_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
