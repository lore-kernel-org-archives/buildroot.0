Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811B3C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 13:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1409360FF9;
	Thu,  3 Nov 2022 13:24:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1409360FF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Nx2FrL5Huec; Thu,  3 Nov 2022 13:24:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31C6060FF6;
	Thu,  3 Nov 2022 13:24:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31C6060FF6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3A9821BF3F4
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2381760FF6
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:24:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2381760FF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6bRGkfDELzTX for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 13:24:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFFD060FEF
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CFFD060FEF
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 13:24:16 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id q5so992490ilt.13
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 06:24:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wt25PvR6cYVphDtZnbI92Y2PB33Uvi8OAyERvFn4RHM=;
 b=gfKMMpNg22wxEFRrf/MKSHFcSV9Ovp9XSCV3C6vpFAYZKYbBSQ/CxeBZl9GcygkAw2
 P1SuYPNTEbDJJ1sdtgFzz+wlMXPgpp4o19+vksEWufQS4uPdZXSdeYAR2kWf/ACBNfkw
 4Atxm3Mk6+h1ygiVkbqJHm5mv8qG2ix3OnGWsRpVf1kklwodyb0YHaZxYEhbW88R6efd
 gHre0nqXGkTeNDCHjjEupyAwirsJXylD/uFjyTOS6xZVReER5Z43oSDJcyy5WPJe7h5Z
 VX3N25yqycUN805bvBYBIdOB3qFUv4wFgLgTfVejCZrwVQW5AxTY4mwK9xpJ7dJr2ZaV
 /AzA==
X-Gm-Message-State: ACrzQf1UW1GVCarhA432eAvJK96+rp31+ZzUdHfdIWaVIb4PK+dDxX0m
 Af413SGTBhzLqQAdMayZXI9QifLHQVgrQnh0
X-Google-Smtp-Source: AMsMyM733dCMxETwQEXS9hxeqCKn0R15C0p56JWqOF9F2agsalO2Ug0RAO9EQLJZvY4ZdqslL8+dEw==
X-Received: by 2002:a05:6e02:158a:b0:2d5:12f0:4dce with SMTP id
 m10-20020a056e02158a00b002d512f04dcemr16810243ilu.159.1667481855641; 
 Thu, 03 Nov 2022 06:24:15 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 m1-20020a0566022ac100b006ce94d987a3sm329452iov.30.2022.11.03.06.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 06:24:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 07:24:09 -0600
Message-Id: <20221103132409.1332718-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wt25PvR6cYVphDtZnbI92Y2PB33Uvi8OAyERvFn4RHM=;
 b=geiZRgz6PBlzhI20KTstt5fA7r8F7GtRgTOrIrkaH9sF4+BAQwBJjc72yhsUpNrj6/
 1nhBbAb36VfJKgLqVCNCEMMclWPU1e/bfl4Aq69zsZrIj6UlXksD4m+nfaacBsGfLaVi
 wDGuspM+4raeOQvowd+xGirbqti28IeVlsnpt+brJsf706fXqUlKNVDVSZBzdwtYtzgr
 MQ1JilxBhVcfHm8dQ1TWaHdAcaXLHjKvvHMKWUcFd/QnPORgRGU61unl2HIkMo1bRrs0
 OXpQAp6LhoVWbbmH0wRdx7/i/uH8eIMA0xPntuWlREwL+wMUtKZzK4jhZjPokoitm8VH
 2IoA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=geiZRgz6
Subject: [Buildroot] [PATCH 1/1] package/python-oauthlib: bump to version
 3.2.2
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-oauthlib/python-oauthlib.hash | 4 ++--
 package/python-oauthlib/python-oauthlib.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-oauthlib/python-oauthlib.hash b/package/python-oauthlib/python-oauthlib.hash
index e55f0c861d..6a2ad003e1 100644
--- a/package/python-oauthlib/python-oauthlib.hash
+++ b/package/python-oauthlib/python-oauthlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/oauthlib/json
-md5  9201e30a4eacf3ecfa15503b241ad5e3  oauthlib-3.1.1.tar.gz
-sha256  8f0215fcc533dd8dd1bee6f4c412d4f0cd7297307d43ac61666389e3bc3198a3  oauthlib-3.1.1.tar.gz
+md5  2f7b898cc1af8c1409cc329e8843ea8f  oauthlib-3.2.2.tar.gz
+sha256  9859c40929662bec5d64f34d01c99e093149682a3f38915dc0655d5a633dd918  oauthlib-3.2.2.tar.gz
 # Locally computed sha256 checksums
 sha256  3d1e12d8ac52c0b6c148af6d291f72400b8720ed16c0ac4a89868b6d14b1c939  LICENSE
diff --git a/package/python-oauthlib/python-oauthlib.mk b/package/python-oauthlib/python-oauthlib.mk
index 7369768b35..1e49487d6a 100644
--- a/package/python-oauthlib/python-oauthlib.mk
+++ b/package/python-oauthlib/python-oauthlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_OAUTHLIB_VERSION = 3.1.1
+PYTHON_OAUTHLIB_VERSION = 3.2.2
 PYTHON_OAUTHLIB_SOURCE = oauthlib-$(PYTHON_OAUTHLIB_VERSION).tar.gz
-PYTHON_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/9e/84/001a3f8d9680f3b26d5e7711e13d5ff92e4b511766a72ac6b4a4e5f06796
+PYTHON_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/6d/fa/fbf4001037904031639e6bfbfc02badfc7e12f137a8afa254df6c4c8a670
 PYTHON_OAUTHLIB_SETUP_TYPE = setuptools
 PYTHON_OAUTHLIB_LICENSE = BSD-3-Clause
 PYTHON_OAUTHLIB_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
