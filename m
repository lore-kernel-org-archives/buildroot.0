Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6AC2C433FE
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 16:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F9F160ADD;
	Sun,  6 Nov 2022 16:23:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F9F160ADD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bSaDfA7uYCzI; Sun,  6 Nov 2022 16:23:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60E6C60888;
	Sun,  6 Nov 2022 16:23:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60E6C60888
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3EB5E1BF32A
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 16:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 194C960888
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 16:23:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 194C960888
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uMfAmrja7J6T for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 16:23:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C9DD60670
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C9DD60670
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 16:23:19 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id bp12so3497422ilb.9
 for <buildroot@buildroot.org>; Sun, 06 Nov 2022 08:23:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ydAil0d73VhRe7en421moDz4FLrr3j3oHDvTzUWWFFc=;
 b=uWLoA3xKxpPvoAytETFR08w97zo1JFN6teM9fT8LWkdvK/AO1aTWp3xbj7YHuzwOVe
 TXPTQPj5OzWoFVI/CbP1Lotd8pvVmtXChVn0I1o8NANCPeMTat96Qvr8hYK0YygrLU7n
 GV2OA68wr/8LpoPl3aJc8J+Uv0lQDQ7du1ZDD3N6lZm/pD3pZ9RiaAnEcv6yldpBpGUN
 NkGqijwG/fkYhS0ctOOv84hb387NztH+6oR+aTXDwx3cpbv81XY5w0VKa5YPj2RDP2ox
 kaxiqtji018PbeDdy7NknftHRbZpMK7X1G3Rxxw9xOBZFJso9IXHHGjJXRzyPi94sBzq
 EkQA==
X-Gm-Message-State: ACrzQf3+FizOGeZ9zDPZyyU5aHD1qndGGRuxAaRXV1/gKgjN+ZdqMf2K
 YsuqRLupR/fnXkc/YA0va4wt+BGg2vCXNg==
X-Google-Smtp-Source: AMsMyM7KeeXkTNoM0nVRp9XrRY7KPjpbgeC2YoMHe28yBVxHdz4MgyiydeeVqdOmW16x4Tjh15l5iw==
X-Received: by 2002:a92:c206:0:b0:300:9c1e:c56a with SMTP id
 j6-20020a92c206000000b003009c1ec56amr25458314ilo.170.1667751797788; 
 Sun, 06 Nov 2022 08:23:17 -0800 (PST)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 d15-20020a0566022bef00b006cecd92164esm2056544ioy.34.2022.11.06.08.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 08:23:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Nov 2022 09:23:15 -0700
Message-Id: <20221106162315.328858-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ydAil0d73VhRe7en421moDz4FLrr3j3oHDvTzUWWFFc=;
 b=hzUusvCKwR0mGn50cruAwTu8CQwFPcIlxcli2SbIeEY7iscUxxjpMwTaADfvjl6myA
 +GEVlKiQq6b5Eygk/g0MOqkOrg+IoXc6J8u1fVTh5JOmjyq4A7GjE6csIt8MmJgyHg2z
 OSjKxeR9mA/MVyzO1NnWVBce2kb0T3AiuunV2S9oh7GIEFKhKl/ug3hSqwpDe5Rby2hP
 8p9jiOMcASHsBazfEOYXKbxEgpVshwKgsspbIMz+qV3yFfbS+Fa2DHSWXZIB9gt3Y6u+
 9Y2nKHaldZFCZHx0Tp7ekrWGkxorr9Jjb+z4bxYhNYjuqVCZrhyhlTFQWbRfZqLD1e4H
 fIvg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=hzUusvCK
Subject: [Buildroot] [PATCH 1/1] package/python-pyroute2: bump to version
 0.7.3
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

Migrate from distutils to setuptools infrastructure.

README.license hash changed due to identifier format update:
https://github.com/svinota/pyroute2/commit/7cd8791881d636069fd57788391314fab625ef49

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyroute2/python-pyroute2.hash | 10 +++++-----
 package/python-pyroute2/python-pyroute2.mk   |  8 ++++----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/python-pyroute2/python-pyroute2.hash b/package/python-pyroute2/python-pyroute2.hash
index c292379ebf..bac8809f2d 100644
--- a/package/python-pyroute2/python-pyroute2.hash
+++ b/package/python-pyroute2/python-pyroute2.hash
@@ -1,7 +1,7 @@
 # md5, sha256 from https://pypi.org/pypi/pyroute2/json
-md5  371683b62314211b8bc9807ac8ef1144  pyroute2-0.5.7.tar.gz
-sha256  963fce07da2841456d39e3b932b071f6de28d23dadfae014022d67a752916f98  pyroute2-0.5.7.tar.gz
+md5  caaef93e32f2c3aee305aefba7c8ad21  pyroute2-0.7.3.tar.gz
+sha256  7041040db1c2d187fbccd151485b1244c41d758be821785847946370eb6bb706  pyroute2-0.7.3.tar.gz
 # Locally computed sha256
-sha256  4739b32a2478e9c204bf010bad5d565d188e59ff905e3c8f71fe3398098b7093  LICENSE.Apache.v2
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL.v2
-sha256  e329111754f1340de20b6084cae4d264b7b4fc8fb48964173f8ee0cb7440a51c  README.license.md
+sha256  4739b32a2478e9c204bf010bad5d565d188e59ff905e3c8f71fe3398098b7093  LICENSE.Apache-2.0
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL-2.0-or-later
+sha256  cbd229e4525bd162dd51f53b2e972d0383f0d0bd5277a10387a57ab9bff97c9f  README.license.rst
diff --git a/package/python-pyroute2/python-pyroute2.mk b/package/python-pyroute2/python-pyroute2.mk
index 44c42d1033..fb4a1cbe5d 100644
--- a/package/python-pyroute2/python-pyroute2.mk
+++ b/package/python-pyroute2/python-pyroute2.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_PYROUTE2_VERSION = 0.5.7
+PYTHON_PYROUTE2_VERSION = 0.7.3
 PYTHON_PYROUTE2_SOURCE = pyroute2-$(PYTHON_PYROUTE2_VERSION).tar.gz
-PYTHON_PYROUTE2_SITE = https://files.pythonhosted.org/packages/6b/94/2a5f6c11369a21efd27a0b4cb92adf5012da7acdbce7e78055710986ca23
+PYTHON_PYROUTE2_SITE = https://files.pythonhosted.org/packages/9c/e6/8d163b1aea84223696fef8f8c55566adf166b79d614d602469d64af00226
 PYTHON_PYROUTE2_LICENSE = Apache-2.0 or GPL-2.0+
-PYTHON_PYROUTE2_LICENSE_FILES = LICENSE.Apache.v2 LICENSE.GPL.v2 README.license.md
-PYTHON_PYROUTE2_SETUP_TYPE = distutils
+PYTHON_PYROUTE2_LICENSE_FILES = LICENSE.Apache-2.0 LICENSE.GPL-2.0-or-later README.license.rst
+PYTHON_PYROUTE2_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
