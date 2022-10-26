Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7379DC38A02
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 03:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFA0C4026F;
	Wed, 26 Oct 2022 03:12:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFA0C4026F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YJtEg4gZ6-KX; Wed, 26 Oct 2022 03:12:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BF8D4025A;
	Wed, 26 Oct 2022 03:12:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BF8D4025A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A75C91BF41A
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 03:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 815DB4025A
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 03:12:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 815DB4025A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TmW1-u907gWT for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 03:12:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72B3C40252
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 72B3C40252
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 03:12:05 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id o65so12302106iof.4
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 20:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LVf0rni5ZMsIZ5jS20XC3+KzEA7Y7kNbLLIetkHZ5C4=;
 b=QxDTJ3osSgWtLkOqWokNj/HAehM3jjT9rUeyPVbM2IZA4yjLAM9alEhm3zGAnhOzYl
 dYUCkgwtGzEPOlE1eWYlqMcPUZvEKEG9Sz94ypOWm+6gZXbppVVbrv7rLLn94XMRHtbI
 YSeWkMeHbKavJvOBpzeD4s52r9tn/NetHigMJeJvOktrYurT1AoN9fpS04J+u5LqPVuT
 ivTegCg8E3KlnmK/pP6YBwZ+o8LmKK1edYqxIYXssVbASbGX4JKI8PaTSnMjyKFZAVXR
 1DiBH46Tp/sYE0cNxIOj1fM8XVdZeMPEnlF5dQ8KaGcs0pFqzLqSnJ3gXx6C+Wzl9KL3
 Ubtw==
X-Gm-Message-State: ACrzQf0OL5doux2K3MHWSgkd0ISm+j63N8ygpOXO1cAKYhz6B1u6Inkd
 dG10UmBJkHKwJCQiHAoNGqsXCSFfeXrq3A==
X-Google-Smtp-Source: AMsMyM69zL48uzoyKl+eu2Ib8ZpvDkDbA4UTCmRtgQNetGcDjj7rLv3HYr+d/Y77ChmeRu8NDgsI0Q==
X-Received: by 2002:a05:6602:3c7:b0:6a4:334d:3344 with SMTP id
 g7-20020a05660203c700b006a4334d3344mr23250945iov.21.1666753924146; 
 Tue, 25 Oct 2022 20:12:04 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 t3-20020a92dc03000000b002f16e7021f6sm1625935iln.22.2022.10.25.20.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 20:12:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Oct 2022 21:11:57 -0600
Message-Id: <20221026031157.658391-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LVf0rni5ZMsIZ5jS20XC3+KzEA7Y7kNbLLIetkHZ5C4=;
 b=Ek2E01JJ5e208ia/NSGptW4MCFWy/0YaqYdqM1YKdp8Mn9y3p5XpyjUunhuHIBrVsj
 i+rFKr/js0A/BxooKEDL3b2Ojv/lIZTqoK2BwcgxMV++RIbTBAwDHmZp1Rm5RV3fqJA3
 Ld+9sL6KzmZxqUAPKxSPJe31w2uVMCpnnstBGLKJ/1SMRLAQoQZ1ZtZ0jWdsEPlVOGBo
 8V3RgPJZBSMFSIpO9Ll1SfbiZYoScD4QCghHrSUuEct00X7b+ot1p7iHD0xVEVojdx2e
 thjnZkaWSOn13NfmFNaJu30vWgD7sYkQnGylLg+Ob/11ag38CwNQtBTdILBC7Qof/mlB
 Jk7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Ek2E01JJ
Subject: [Buildroot] [PATCH 1/1] package/python-pyzmq: bump to version 24.0.1
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
Cc: Michael Rommel <rommel@layer-7.net>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate to setuptools infrastructure.

Add new host-python-packaging dependency.

Refresh zmq version override patch.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...-ZMQ-version-check-to-the-ZMQ-versi.patch} | 37 +++++++++++++------
 package/python-pyzmq/python-pyzmq.hash        |  4 +-
 package/python-pyzmq/python-pyzmq.mk          |  8 ++--
 3 files changed, 31 insertions(+), 18 deletions(-)
 rename package/python-pyzmq/{0001-use-buildroot-zmq-version-instead-of-detect.patch => 0001-detect.py-fix-the-ZMQ-version-check-to-the-ZMQ-versi.patch} (55%)

diff --git a/package/python-pyzmq/0001-use-buildroot-zmq-version-instead-of-detect.patch b/package/python-pyzmq/0001-detect.py-fix-the-ZMQ-version-check-to-the-ZMQ-versi.patch
similarity index 55%
rename from package/python-pyzmq/0001-use-buildroot-zmq-version-instead-of-detect.patch
rename to package/python-pyzmq/0001-detect.py-fix-the-ZMQ-version-check-to-the-ZMQ-versi.patch
index 315c8c8bb2..18553582f4 100644
--- a/package/python-pyzmq/0001-use-buildroot-zmq-version-instead-of-detect.patch
+++ b/package/python-pyzmq/0001-detect.py-fix-the-ZMQ-version-check-to-the-ZMQ-versi.patch
@@ -1,4 +1,8 @@
-detect.py: fix the ZMQ version check to the ZMQ version of the buildroot
+From 8eae1193457f72899f9cc2254ae1489026df9bb6 Mon Sep 17 00:00:00 2001
+From: Michael Rommel <rommel@layer-7.net>
+Date: Sat, 10 Aug 2013 00:44:35 +0200
+Subject: [PATCH] detect.py: fix the ZMQ version check to the ZMQ version of
+ the buildroot
 
 The setup.py script tries to compile a test C program and runs it, to
 retrieve a version string for the installed ZMQ library, but if the cross
@@ -17,38 +21,47 @@ Flandrin.
 
 Modified for version 18.0.2 by Asaf Kahlon
 
+Modified for version 24.0.1 by James Hilliard
+
+Signed-off-by: Michael Rommel <rommel@layer-7.net>
 Signed-off-by: Lionel Flandrin <lionel@svkt.org>
 Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 ---
  buildutils/detect.py | 14 ++++++++------
  1 file changed, 8 insertions(+), 6 deletions(-)
 
 diff --git a/buildutils/detect.py b/buildutils/detect.py
-index d1380fe..4a91351 100644
+index 842e3b14..e2eca744 100644
 --- a/buildutils/detect.py
 +++ b/buildutils/detect.py
-@@ -120,13 +120,15 @@ def detect_zmq(basedir, compiler=None, **compiler_attrs):
+@@ -120,18 +120,20 @@ def detect_zmq(basedir, compiler, **compiler_attrs):
  
      cc = get_compiler(compiler=compiler, **compiler_attrs)
      efile = test_compilation(cfile, compiler=cc, **compiler_attrs)
 -    patch_lib_paths(efile, cc.library_dirs)
 +    #patch_lib_paths(efile, cc.library_dirs)
  
--    rc, so, se = get_output_error([efile])
+     # add library dirs to %PATH% for windows
+     env = os.environ.copy()
+     if sys.platform.startswith("win"):
+         env["PATH"] = os.pathsep.join([env["PATH"]] + cc.library_dirs)
+ 
+-    rc, so, se = get_output_error([efile], env=env)
 -    if rc:
--        msg = "Error running version detection script:\n%s\n%s" % (so,se)
+-        msg = f"Error running version detection script:\n{so}\n{se}"
 -        logging.error(msg)
--        raise IOError(msg)
-+    #rc, so, se = get_output_error([efile])
-+    # if rc:
-+    #     msg = "Error running version detection script:\n%s\n%s" % (so,se)
+-        raise OSError(msg)
++    #rc, so, se = get_output_error([efile], env=env)
++    #if rc:
++    #     msg = f"Error running version detection script:\n{so}\n{se}"
 +    #     logging.error(msg)
-+    #     raise IOError(msg)
++    #     raise OSError(msg)
 +
 +    so = "vers: ##ZEROMQ_VERSION##"
  
-     handlers = {'vers':  lambda val: tuple(int(v) for v in val.split('.'))}
+     handlers = {'vers': lambda val: tuple(int(v) for v in val.split('.'))}
  
 -- 
-2.20.1
+2.34.1
 
diff --git a/package/python-pyzmq/python-pyzmq.hash b/package/python-pyzmq/python-pyzmq.hash
index ecf6489249..efbc91d83c 100644
--- a/package/python-pyzmq/python-pyzmq.hash
+++ b/package/python-pyzmq/python-pyzmq.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pyzmq/json
-md5  200abc1a75bdcfff7adf61304f46f55e  pyzmq-19.0.2.tar.gz
-sha256  296540a065c8c21b26d63e3cea2d1d57902373b16e4256afe46422691903a438  pyzmq-19.0.2.tar.gz
+md5  f10b7c3dee2c03557e2c5d00b73dfc7f  pyzmq-24.0.1.tar.gz
+sha256  216f5d7dbb67166759e59b0479bca82b8acf9bed6015b526b8eb10143fb08e77  pyzmq-24.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  aef3b80570351d44e29c22d080d4e9e106b34f3fdbc5cdf9636994474c72b1a2  COPYING.BSD
 sha256  44b23767df3c0fe27f88981f09bc7f50a1695cec4b24252fa5f55f03e76bcd6d  COPYING.LESSER
diff --git a/package/python-pyzmq/python-pyzmq.mk b/package/python-pyzmq/python-pyzmq.mk
index d1f4314a1e..5792957eaf 100644
--- a/package/python-pyzmq/python-pyzmq.mk
+++ b/package/python-pyzmq/python-pyzmq.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-PYTHON_PYZMQ_VERSION = 19.0.2
+PYTHON_PYZMQ_VERSION = 24.0.1
 PYTHON_PYZMQ_SOURCE = pyzmq-$(PYTHON_PYZMQ_VERSION).tar.gz
-PYTHON_PYZMQ_SITE = https://files.pythonhosted.org/packages/05/77/7483975d84fe1fd24cc67881ba7810e0e7b3ee6c2a0e002a5d6703cca49b
+PYTHON_PYZMQ_SITE = https://files.pythonhosted.org/packages/46/0d/b06cf99a64d4187632f4ac9ddf6be99cd35de06fe72d75140496a8e0eef5
 PYTHON_PYZMQ_LICENSE = LGPL-3.0+, BSD-3-Clause, Apache-2.0
 # Apache license only online: http://www.apache.org/licenses/LICENSE-2.0
 PYTHON_PYZMQ_LICENSE_FILES = COPYING.LESSER COPYING.BSD
-PYTHON_PYZMQ_DEPENDENCIES = zeromq
-PYTHON_PYZMQ_SETUP_TYPE = distutils
+PYTHON_PYZMQ_DEPENDENCIES = host-python-packaging zeromq
+PYTHON_PYZMQ_SETUP_TYPE = setuptools
 PYTHON_PYZMQ_BUILD_OPTS = --zmq=$(STAGING_DIR)/usr
 
 # Due to issues with cross-compiling, hardcode to the zeromq in BR
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
