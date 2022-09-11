Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29501C6FA83
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 23:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FACE84438;
	Sun, 11 Sep 2022 23:10:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FACE84438
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BC90OtzM0bs5; Sun, 11 Sep 2022 23:10:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52E9584430;
	Sun, 11 Sep 2022 23:10:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52E9584430
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D03DF1BF427
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 23:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8443402F7
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 23:10:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8443402F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nks38nppjIpp for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 23:10:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EAA8401E1
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6EAA8401E1
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 23:10:35 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id v15so3720729iln.6
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 16:10:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=CzbZbPHhX5AUUPRkOzM0/TRWtGd5DnuxLiNSTk3jZe0=;
 b=lZ3UUc0xeX9b0eOFYaslq222/u12wbUjXIaVZOUd+kJbEVDKpxoC2NfVJ+9ysWpeV4
 2w2kcsXNC0nf9ZCq+yrIm04eW7vHT3Jm10SsAZk3mMgxYEkfXAwkz+Bri1MlHEPabvwl
 u17ASATHXTnf+VTKqJFmh50Ysk1IZXNo9Ited5pGO4SYcOwSOO+5W5GotQ6PASJ5zQxl
 Dd51+eT/F0Edgu0bONDRARrFjkE2DlwrRtNXnxxwWrJOzFqVNbJoCzZd1pdyzyaGYYX0
 EmyROFW6ir/ZS1zBYbHK22+sTL/l/Bf8XEZBdXiOHXkBqNPdahg72AE6w/7C3NOqOi/b
 WULA==
X-Gm-Message-State: ACgBeo2OIpCqcLfgtazEKxrI288Q4P1K9tLrZ71dOEDk3r42zDPuMij1
 jA6N4qpI46l4vuxxg2dpn3gy5orgV1o=
X-Google-Smtp-Source: AA6agR7LVcPfzqUXBGP9pmV+Gfzy1x4xdCwsXm6F6qCiFT4axGcDtLSLGrHTzke+bzCqY0vL0khBow==
X-Received: by 2002:a92:c267:0:b0:2f1:b17c:994e with SMTP id
 h7-20020a92c267000000b002f1b17c994emr9181026ild.275.1662937834119; 
 Sun, 11 Sep 2022 16:10:34 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 i14-20020a02c60e000000b0035847625587sm2793715jan.132.2022.09.11.16.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:10:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Sep 2022 17:10:31 -0600
Message-Id: <20220911231031.3738483-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=CzbZbPHhX5AUUPRkOzM0/TRWtGd5DnuxLiNSTk3jZe0=;
 b=KTIT/jXcqXw/zXQqHtDygCro9/MD4Tbts2eCb+x6W2oXUCc0ZaX46IZ67V2aFF6RTU
 tm9WZJwf14hfz0vS7BFXCr/df/AE6HLMmFj4EWi33WAxBKqXJpRQ8qWLNEGUoip3t/eP
 QZNdRCr4ShDNMDazFnEuTRq6LJkGM8vo3krGBDn9U84LKSIjmgC85pz9i2ygS/Fk5UgJ
 jhxLZECqPyjhqBjj8p9i4GyPaaCd0rBV/twVZ4xHOLt2GEj/bCTdAZkh1ZjE3w5UG1Ix
 5Pok+WpjhsLSLx4mdgOs9HpHMMx2QBsFHgZ07tzPbkciNf7E1pItJ4fhw60NSNraV6G7
 bGbw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KTIT/jXc
Subject: [Buildroot] [PATCH 1/1] package/python-cython: bump to version
 0.29.32
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cython/python-cython.hash | 4 ++--
 package/python-cython/python-cython.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
index 19f5143b05..3ed9fb56a1 100644
--- a/package/python-cython/python-cython.hash
+++ b/package/python-cython/python-cython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cython/json
-md5  3cf4001b4be42a263f163865235c39d8  Cython-0.29.30.tar.gz
-sha256  2235b62da8fe6fa8b99422c8e583f2fb95e143867d337b5c75e4b9a1a865f9e3  Cython-0.29.30.tar.gz
+md5  91c36ea86c00adcc5c1c11cf48b733c0  Cython-0.29.32.tar.gz
+sha256  8733cf4758b79304f2a4e39ebfac5e92341bce47bcceb26c1254398b2f8c1af7  Cython-0.29.32.tar.gz
 # Locally computed sha256 checksums
 sha256  a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9  LICENSE.txt
 sha256  e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index 44efdd6b16..9a90f6198e 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CYTHON_VERSION = 0.29.30
+PYTHON_CYTHON_VERSION = 0.29.32
 PYTHON_CYTHON_SOURCE = Cython-$(PYTHON_CYTHON_VERSION).tar.gz
-PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/d4/ad/7ce0cccd68824ac9623daf4e973c587aa7e2d23418cd028f8860c80651f5
+PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/4c/76/1e41fbb365ad20b6efab2e61b0f4751518444c953b390f9b2d36cf97eea0
 PYTHON_CYTHON_SETUP_TYPE = setuptools
 PYTHON_CYTHON_LICENSE = Apache-2.0
 PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
