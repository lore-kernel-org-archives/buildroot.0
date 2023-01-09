Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACD8C54EBD
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 04:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D63CE402E4;
	Mon,  9 Jan 2023 04:23:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D63CE402E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tXzuXFwQrT9X; Mon,  9 Jan 2023 04:23:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11DC640142;
	Mon,  9 Jan 2023 04:23:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11DC640142
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DD32D1BF357
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 04:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B625B60AED
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 04:23:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B625B60AED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eU0LCDjT0rou for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 04:23:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E20F60AA7
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E20F60AA7
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 04:23:17 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id p66so4065797iof.1
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 20:23:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1R7kvWdQmdPp+gru3EkXfp+HZelPWm0BzenggeyjBBM=;
 b=SWMv+n/BiOXX5aICZdGyLl/ktSGCMBYI8Yi0Zy17ARzPirWJghD2T/0Fm+iQ4yUNm3
 X8Pqsn06FZ2rzCZQTtjGBi5Q/li0JkwOxr3TtqY4YIV4/9Ect1+yX02XmRQmWhy19h0c
 bm9PPtuVVtg/9ClW1cldP7ZjLFhNzopeAOycaUf9Fqg7AQA9Iq2Z5wTsQzgVLw/+O3cB
 psprlKBBChwawp+/4DKG+6VgCZZmCz2Vp1FnDMR6kvQMyZfz0uxeudEyUriwpKKfG1l1
 NWTBx4ronpWdEvQj1b9hy9qVHT/UTvaarxQRWvrChHUM8GOPAu5Ss+0YQU0ewHxOeinQ
 7P4A==
X-Gm-Message-State: AFqh2kqYO9F5tR4WANpj0cojJuHgfJr0+Jr94y0qlJAGo/22B7F+WcLu
 6bYQBz5A4wzX1mm3R6YW8aoN3quP340Qmw==
X-Google-Smtp-Source: AMrXdXt6vhYIeC0tVCpOfNFlB7boy6Ne7UMNQYSX7No77nI/5SXBh7Lb2I7Wk6P7JmmvVT8r0z+0wA==
X-Received: by 2002:a6b:dc10:0:b0:6eb:abee:634e with SMTP id
 s16-20020a6bdc10000000b006ebabee634emr43464447ioc.7.1673238196539; 
 Sun, 08 Jan 2023 20:23:16 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 o20-20020a02a1d4000000b0038a87954f81sm2463009jah.31.2023.01.08.20.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 20:23:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 21:23:14 -0700
Message-Id: <20230109042314.2326173-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1R7kvWdQmdPp+gru3EkXfp+HZelPWm0BzenggeyjBBM=;
 b=BlmHOqWaBnI/HLA/HEScFdWlHtX32Q8mZt34EOpcNCXSTxWr/rZlmpgbD24NEs+0cR
 GDJw/pjcq+CFLS2UV4JiX2/hWlMU+8GVXDqXknHr/dtrams7lHEciP89us6ZoqdULNFi
 O58x0ROvDr5s88DiQSneuhKFd/Hwmeh0mMhdcq+KyGKHkxYwFSR6aiVG1nyE++jRKzuA
 h05Rr/3tGJf9uBQXtTCSgxs7ptnkbVPiQC5Ao3D7KnSq6eV44aJsQlRMJq/ECj1qfsIC
 nw9+PtTnWik81GwYrhJNFk3U6VHddsozc/f7jbcRtzn//Svjzd9JROLCNZGN51I0Ewzc
 XLCQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BlmHOqWa
Subject: [Buildroot] [PATCH 1/1] package/python-iniconfig: bump to version
 2.0.0
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
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate from setuptools to hatchling pep517 build backend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-iniconfig/python-iniconfig.hash | 4 ++--
 package/python-iniconfig/python-iniconfig.mk   | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-iniconfig/python-iniconfig.hash b/package/python-iniconfig/python-iniconfig.hash
index b2469db99b..541ae3e3f3 100644
--- a/package/python-iniconfig/python-iniconfig.hash
+++ b/package/python-iniconfig/python-iniconfig.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/iniconfig/json
-md5  0b7f3be87481211c183eae095bcea6f1  iniconfig-1.1.1.tar.gz
-sha256  bc3af051d7d14b2ee5ef9969666def0cd1a000e121eaea580d4a313df4b37f32  iniconfig-1.1.1.tar.gz
+md5  3c030b3f51dcc3aca585de05635600e4  iniconfig-2.0.0.tar.gz
+sha256  2d91e135bf72d31a410b17c16da610a82cb55f6b0477d1a902134b24a455b8b3  iniconfig-2.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  2af680c39ef493fb82830356d1d3df1acb5a06033cba2dec7a19e21caa77a866  LICENSE
diff --git a/package/python-iniconfig/python-iniconfig.mk b/package/python-iniconfig/python-iniconfig.mk
index 5c31c69957..99e946f0ab 100644
--- a/package/python-iniconfig/python-iniconfig.mk
+++ b/package/python-iniconfig/python-iniconfig.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_INICONFIG_VERSION = 1.1.1
+PYTHON_INICONFIG_VERSION = 2.0.0
 PYTHON_INICONFIG_SOURCE = iniconfig-$(PYTHON_INICONFIG_VERSION).tar.gz
-PYTHON_INICONFIG_SITE = https://files.pythonhosted.org/packages/23/a2/97899f6bd0e873fed3a7e67ae8d3a08b21799430fb4da15cfedf10d6e2c2
-PYTHON_INICONFIG_SETUP_TYPE = setuptools
+PYTHON_INICONFIG_SITE = https://files.pythonhosted.org/packages/d7/4b/cbd8e699e64a6f16ca3a8220661b5f83792b3017d0f79807cb8708d33913
+PYTHON_INICONFIG_SETUP_TYPE = pep517
 PYTHON_INICONFIG_LICENSE = MIT
 PYTHON_INICONFIG_LICENSE_FILES = LICENSE
+PYTHON_INICONFIG_DEPENDENCIES = host-python-hatchling host-python-hatch-vcs
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
