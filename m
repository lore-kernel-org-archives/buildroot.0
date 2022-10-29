Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1927AFA3741
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 03:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61E098143D;
	Sat, 29 Oct 2022 03:02:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61E098143D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LiaTvK2e_DwM; Sat, 29 Oct 2022 03:02:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6872881434;
	Sat, 29 Oct 2022 03:02:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6872881434
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 790671BF9AD
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 03:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5221B60E82
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 03:02:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5221B60E82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pUc5PwMEPZKp for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 03:02:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C878760E7E
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C878760E7E
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 03:02:31 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id d123so1332527iof.7
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 20:02:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0rqjvQok05HDNRoWhTjSKyd0WS8V+Pb6GbeGxBKrxYs=;
 b=oW/c6fegp94hMU/UsNQsoqa0snWSJ97vKqan+vk/OYvCEBMcgE9thSpXNsWJ+3OgQi
 Ggs5AtzJB0kTaO5ZkxhmQ790EOsefRZdjPfyEwC7mtRKyV6GMJwgP6Lrl7sg3nrAgNE4
 blU9TWvXwt/O+lgiXDTjJbxgMrbPc8Snr7N5cK/jGdnByA1WhNoZgfXz+nOUBXxPqqHC
 j5SZZ7fnSEW187dkfz1h2U5hwQE/eS1hZve2nSCqcgKH6A/GF5WWsDIyRrd1n58+V/Vs
 w9qDODU8/d6fFx2DC1pVvLnfPA1kh6T0a9rZGSEYPt8ISyHjIQDV0mq2k+E+wnDybGIy
 vS4A==
X-Gm-Message-State: ACrzQf0iKH27XHTjT5hubyQPh2QMsmGHlunxOa9ZgliiRsQK2hLtp2bg
 h88WNwDK6dC2I1yeg6PUpTFIYlV735sXuQ==
X-Google-Smtp-Source: AMsMyM44F+0B9LGLRAufIFTJKnt3zojwG4Wb/0ITL1tlbKR10Kt7bUmwb+QmR/1MhfeISK29Wnw55w==
X-Received: by 2002:a05:6638:4398:b0:371:cfe4:a63 with SMTP id
 bo24-20020a056638439800b00371cfe40a63mr1140621jab.95.1667006422264; 
 Fri, 28 Oct 2022 18:20:22 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 z6-20020a056e02088600b002fff117027dsm97410ils.13.2022.10.28.18.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 18:20:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Oct 2022 19:20:20 -0600
Message-Id: <20221029012020.1396608-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0rqjvQok05HDNRoWhTjSKyd0WS8V+Pb6GbeGxBKrxYs=;
 b=Cp2VnkelvkLJTEJMm9OGNC1fass+BLNwFqkhac/NGLpTK4uJqHVe7U1t6cb1P0IUbI
 Glbj9f1y7cjKcqMle5qFGCQL8of1ocqt8OndP03OJ4T7jFoYJ4uAeqrpKNVgUkiqz5fa
 7Y+WRVska4DuFFMSX9ncnAoh0cNS0fkEi9b6POPPB99ijbhUnehodXb99QKUdy3NNjL3
 CXmeiiY0OgtcKQiT86VymiMfC9c56G7LxG+8wRBI42mrsDzyQz7Di53gWRfxyOPatA9G
 e9v33m4w55O8maWFT1Ne1J0HO9yemMyFPLo1R8Sjabr9WwjUEci3DRGLRecW2UwPXIBP
 1AeA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Cp2Vnkel
Subject: [Buildroot] [PATCH 1/1] package/python-attrs: bump to version 22.1.0
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

License hash changed due to ownership clarification:
https://github.com/python-attrs/attrs/commit/899497f165b3c8291b66c9c3a01b64881b69cf39

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-attrs/python-attrs.hash | 6 +++---
 package/python-attrs/python-attrs.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-attrs/python-attrs.hash b/package/python-attrs/python-attrs.hash
index 823a9459bd..d5548c0ed3 100644
--- a/package/python-attrs/python-attrs.hash
+++ b/package/python-attrs/python-attrs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/attrs/json
-md5  5a9b5e9ceebc380a13fb93235b11bbda  attrs-21.4.0.tar.gz
-sha256  626ba8234211db98e869df76230a137c4c40a12d72445c45d5f5b716f076e2fd  attrs-21.4.0.tar.gz
+md5  0487081b7ead8753fc46cf7c6d1e28e3  attrs-22.1.0.tar.gz
+sha256  29adc2665447e5191d0e7c568fde78b21f9672d344281d0c6e1ab085429b22b6  attrs-22.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256  bf659a28b49240602f56bbdf490cbe2ec509b15b98f99d7b19a52c740e327863  LICENSE
+sha256  882115c95dfc2af1eeb6714f8ec6d5cbcabf667caff8729f42420da63f714e9f  LICENSE
diff --git a/package/python-attrs/python-attrs.mk b/package/python-attrs/python-attrs.mk
index 4877d62285..33651ee80a 100644
--- a/package/python-attrs/python-attrs.mk
+++ b/package/python-attrs/python-attrs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ATTRS_VERSION = 21.4.0
+PYTHON_ATTRS_VERSION = 22.1.0
 PYTHON_ATTRS_SOURCE = attrs-$(PYTHON_ATTRS_VERSION).tar.gz
-PYTHON_ATTRS_SITE = https://files.pythonhosted.org/packages/d7/77/ebb15fc26d0f815839ecd897b919ed6d85c050feeb83e100e020df9153d2
+PYTHON_ATTRS_SITE = https://files.pythonhosted.org/packages/1a/cb/c4ffeb41e7137b23755a45e1bfec9cbb76ecf51874c6f1d113984ecaa32c
 PYTHON_ATTRS_SETUP_TYPE = setuptools
 PYTHON_ATTRS_LICENSE = MIT
 PYTHON_ATTRS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
