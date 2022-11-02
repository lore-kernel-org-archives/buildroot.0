Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979FEC433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 22:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECFE541704;
	Wed,  2 Nov 2022 22:17:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECFE541704
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 78O-ySpEpdw8; Wed,  2 Nov 2022 22:17:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADF88416FF;
	Wed,  2 Nov 2022 22:17:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADF88416FF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0388C1BF471
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CED334014B
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:17:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CED334014B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZvFxw0ZeKpH9 for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 22:17:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA735408DC
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA735408DC
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 22:17:25 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id z3so16242518iof.3
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 15:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pLPXiq3XDmZt/H1uI4H3B844fMafVEvJoPBQBlDXI10=;
 b=5udYQ7U4etdIDVyRiTF/HQ9QCw7JnEnwtau0Dcsmtn0aAFgDmtayol/NCIcQSpDGsD
 UAB7gqLZricFenPh7bVw62u6+UN0uGd6lNGTyTjxm1X+BaSXMXkt+bcyELKTPqe07GYj
 jN8PB9LPFSeAvEhe5HkCH8U8EZHFzDy5vG+13ryWe2FCpR6dBP2NOZ59r8cgSznHpe9q
 4Atiys/BJ84OuTb7PD8e7KVO5iOATHWt/5l7/cNsH+trWHj39Rj3gJ9dque9g9d4AcXg
 BpyA8i4k8erMpjCrqV4iWONv4udqocJSC/2/QqumbUcdOdKFVBMiWW+4OyTL+oc3vm06
 eGgA==
X-Gm-Message-State: ACrzQf1fj07kDLVZmJdZcihS+15Nv6fnoMUeIj3k/val8OlRsk/x4ban
 +bJmbSW7oE8lhX1ZLi5aKjWvMGipKSnpkQ==
X-Google-Smtp-Source: AMsMyM5jWnpSVZ5RuPLoNbWMXyeeGMjwz4HifDMFc1JjuY79M7iWwhTPpl1T9E876pgVGmI0j4ivNg==
X-Received: by 2002:a02:6d15:0:b0:375:3523:b643 with SMTP id
 m21-20020a026d15000000b003753523b643mr18257197jac.144.1667427444580; 
 Wed, 02 Nov 2022 15:17:24 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 m8-20020a924a08000000b002f9a7dc2e1fsm4895337ilf.53.2022.11.02.15.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 15:17:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 16:17:22 -0600
Message-Id: <20221102221722.2501784-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pLPXiq3XDmZt/H1uI4H3B844fMafVEvJoPBQBlDXI10=;
 b=PzTLSE7gEeNlnGapO99jwFbk4PlPd2tbMMOoeZRsb6UjlT5uASsYkNIJxPoS/lOGjZ
 FIiFDtcal/7xHtuZf8IxxlLdXEE5IiwN9nunoP7JNS+1TZxWZ9EAiKNh3GwbjdCI0z1z
 qSBwcD9/bGMbqQqz87plAtS3DQDNppVHay9SUr1WIzSpvYcy4xYMZoPFk5LMsadbIkPR
 OnFj2UMc/QXiM1VzK0+r4B3RLwvPVw3PfPeCOnq/TpxzrEyH5uIfkA1AGNe5kmPXbjx3
 SgIzd3hxLaCmhl395X9NOhKn5EcFIKHWLVxUWK2skAI6uq6c1rlK0tPm10t1+ALrdS3T
 0RPg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PzTLSE7g
Subject: [Buildroot] [PATCH 1/1] package/python-ipython: bump to version
 8.6.0
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
 Philippe Proulx <eeppeliteloop@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch which is no longer needed.

Migrate from distutils to setuptools infrastructure.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../0001-set-correct-python-executable-path.patch | 15 ---------------
 package/python-ipython/python-ipython.hash        |  4 ++--
 package/python-ipython/python-ipython.mk          |  6 +++---
 3 files changed, 5 insertions(+), 20 deletions(-)
 delete mode 100644 package/python-ipython/0001-set-correct-python-executable-path.patch

diff --git a/package/python-ipython/0001-set-correct-python-executable-path.patch b/package/python-ipython/0001-set-correct-python-executable-path.patch
deleted file mode 100644
index 0fbd5a1c8e..0000000000
--- a/package/python-ipython/0001-set-correct-python-executable-path.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Set correct Python executable path
-
-Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
-
---- python-ipython-2.1.0/setupbase.py	2014-05-21 15:19:12.000000000 -0400
-+++ python-ipython-2.1.0-new/setupbase.py	2014-07-23 23:34:32.892030423 -0400
-@@ -394,7 +394,7 @@ class build_scripts_entrypt(build_script
- 
-             mod, func = entrypt.split(':')
-             with open(outfile, 'w') as f:
--                f.write(script_src.format(executable=sys.executable,
-+                f.write(script_src.format(executable='/usr/bin/env python',
-                                           mod=mod, func=func))
- 
-         return outfiles, outfiles
diff --git a/package/python-ipython/python-ipython.hash b/package/python-ipython/python-ipython.hash
index cd18c3d125..e61727e045 100644
--- a/package/python-ipython/python-ipython.hash
+++ b/package/python-ipython/python-ipython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/ipython/json
-md5  6907b67691ba697173a3befb2c35f7ac  ipython-7.31.1.tar.gz
-sha256  b5548ec5329a4bcf054a5deed5099b0f9622eb9ea51aaa7104d215fece201d8c  ipython-7.31.1.tar.gz
+md5  8c98f6def0622ea32975cb779247c3d7  ipython-8.6.0.tar.gz
+sha256  7c959e3dedbf7ed81f9b9d8833df252c430610e2a4a6464ec13cd20975ce20a5  ipython-8.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  341afcbd729887b7046fe7b98fc4f4edff3aed8d38f06eefd9b30670f043df17  COPYING.rst
 sha256  e0e390748ed440ab893ca1f135a88a920aaf5409dbb90a5b427c75c5e51268fb  LICENSE
diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
index 389ebfa897..f3aac75db1 100644
--- a/package/python-ipython/python-ipython.mk
+++ b/package/python-ipython/python-ipython.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-PYTHON_IPYTHON_VERSION = 7.31.1
+PYTHON_IPYTHON_VERSION = 8.6.0
 PYTHON_IPYTHON_SOURCE = ipython-$(PYTHON_IPYTHON_VERSION).tar.gz
-PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/fb/39/c1947dc1bb993a35469ca474535cb3214c91f5f9a7752a1fcbd9b6b37dde
+PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/7f/59/05e94e067afb61460f0d5229a1edb800e2f65b8436085fad9cd262d80d45
 PYTHON_IPYTHON_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst LICENSE
 PYTHON_IPYTHON_CPE_ID_VENDOR = ipython
 PYTHON_IPYTHON_CPE_ID_PRODUCT = ipython
-PYTHON_IPYTHON_SETUP_TYPE = distutils
+PYTHON_IPYTHON_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
