Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82511C4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 19:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1FC4416EF;
	Wed,  2 Nov 2022 19:00:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1FC4416EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kgBjqKF32nVq; Wed,  2 Nov 2022 19:00:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9685E416D7;
	Wed,  2 Nov 2022 19:00:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9685E416D7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D350E1BF4E7
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 19:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC04A400D0
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 19:00:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC04A400D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ct_tDJpRSIJW for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 19:00:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E31AB400AF
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E31AB400AF
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 19:00:14 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id d123so11075966iof.7
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 12:00:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rzDJhjNKoAYu9cJbdUb2FGKuBEAr+QUIwumH7Ov4/ps=;
 b=A3soaZ2AmGnuZOCNEjLsO8s8mqEMKkyntRt1N2YkqXcY5hEBIgz9Tt/CEtk3A8cGnp
 gg2B3FtYu3+vgDFZsRPvVlnQ9cBH5Ww+SQCLQ3XNa+6gRTfmsAcPqPVMOx0bwPP1YATc
 MhEGrq/yR7rwPONNGn7X+RQwX5B6V2EetkkfDu8k9E2+MVYxSVjz5FeGu0WySSB6OOk8
 bjOgFgR3Q627hsgqQFtt7Y+BHHsJtW95/5Cb6qL/z9/iKtxCyrlQi7IS6oZp5DURjq8o
 FZn7cG3G1ZU+Ve42FpZ3CAbFCB66zwVdymyNa5mp2zamyokLFKVAQIvSl96syDjGcklu
 ufQQ==
X-Gm-Message-State: ACrzQf1Id/ypL3yeuu/ty7Gg7JPhvlykeHVz1L6nJwjZNI04ytw3itdx
 0eM1FXv+0M0iFWS60SK6niizrAcwk/v2Ig==
X-Google-Smtp-Source: AMsMyM5IS5BKy9INPqG3fnpC5FYB9QFVt+LS/0AB85C+GtL9j3J2BmExRQ4Drm8bX98HeOFvdCH0HQ==
X-Received: by 2002:a05:6638:370c:b0:375:1820:7c6a with SMTP id
 k12-20020a056638370c00b0037518207c6amr16792439jav.20.1667415613136; 
 Wed, 02 Nov 2022 12:00:13 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 k21-20020a023355000000b003634aa4a55asm5146592jak.82.2022.11.02.12.00.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 12:00:12 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 13:00:10 -0600
Message-Id: <20221102190010.2418819-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rzDJhjNKoAYu9cJbdUb2FGKuBEAr+QUIwumH7Ov4/ps=;
 b=Bu54+lN28+TedCKuUVSnHCsTgRtqZlTGCOmBzjbo/XML6/tgv46bnJo8DQZKTf682i
 OSaxypegk7g2xPD/4LGvABDdUnD437dF3O+ADabcPeRnH5rsScooHO5qjbXWjPkM1Z0k
 i3Ltjq+iycQIi1ZWsSrVrcDcu2oirsokVR6gPpjj8sRkmXTPvz/3/+Iqlh7379TYXg/0
 8J49/IbKuOsYMzVdF1TL6QV8S/izz5B/q3DQf64HCbQU/BfrbaytuCnHXuRGZznkmT96
 Klcl4oHR7ApbbmoDfF/P0FbjrRw5ZDqEIpYvF3EgntJx52oGk3Q4mtUoORm+Jvy0r8Zy
 8jbQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Bu54+lN2
Subject: [Buildroot] [PATCH 1/1] package/python-bluezero: bump to version
 0.7.1
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
 Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-bluezero/python-bluezero.hash | 4 ++--
 package/python-bluezero/python-bluezero.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bluezero/python-bluezero.hash b/package/python-bluezero/python-bluezero.hash
index 59e8c5af5b..6bedf62b27 100644
--- a/package/python-bluezero/python-bluezero.hash
+++ b/package/python-bluezero/python-bluezero.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bluezero/json
-md5  b26e6425d8adc4613b7cdf1d131f8c0b  bluezero-0.6.0.tar.gz
-sha256  d94f0672b1de3ff0040801538143fe9a42c501d8db79bcd183c9e051b8da83bc  bluezero-0.6.0.tar.gz
+md5  efa07525f1bf6db9af66eb7d9775cdb0  bluezero-0.7.1.tar.gz
+sha256  f146feb65ee9f6fd9f3638ff0a44df9fd6efb48cf66a39ce51a62a7d38ab5206  bluezero-0.7.1.tar.gz
 # Locally computed sha256 checksums
 sha256  59319e80b4caa94ace4817c9f84aa16abc9d4d2b5f7866251b5fda92e87ccdef  LICENSE
diff --git a/package/python-bluezero/python-bluezero.mk b/package/python-bluezero/python-bluezero.mk
index 7e244fe3f0..34efb6155c 100644
--- a/package/python-bluezero/python-bluezero.mk
+++ b/package/python-bluezero/python-bluezero.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BLUEZERO_VERSION = 0.6.0
+PYTHON_BLUEZERO_VERSION = 0.7.1
 PYTHON_BLUEZERO_SOURCE = bluezero-$(PYTHON_BLUEZERO_VERSION).tar.gz
-PYTHON_BLUEZERO_SITE = https://files.pythonhosted.org/packages/be/15/4a806580ffd359a03184776f37cf201298918f302b414b8a3e594d1be65c
+PYTHON_BLUEZERO_SITE = https://files.pythonhosted.org/packages/9a/66/d4a92869ed2afd9483a65aff200b2ba0ca4365429bc9a836c5803ab876a5
 PYTHON_BLUEZERO_SETUP_TYPE = setuptools
 PYTHON_BLUEZERO_LICENSE = MIT
 PYTHON_BLUEZERO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
