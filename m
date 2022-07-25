Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74CACCA473
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 18:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A8448343B;
	Mon, 25 Jul 2022 18:29:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A8448343B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ih3ivdGFvLiE; Mon, 25 Jul 2022 18:29:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 290CF83417;
	Mon, 25 Jul 2022 18:29:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 290CF83417
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6D19F1BF380
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 18:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 554A083417
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 18:29:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 554A083417
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id myDsP4IMp32Y for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 18:29:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43EF083415
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43EF083415
 for <buildroot@busybox.net>; Mon, 25 Jul 2022 18:29:31 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id l15so13148938wro.11
 for <buildroot@busybox.net>; Mon, 25 Jul 2022 11:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n0prBxf7qZ1553B7c4vDi6tauNeEiIhzhM42zIwFX9g=;
 b=plT91Ts3pcpb9JrAt2zM0EZBNF2AbqBDVgJK24eFuuzflAyhc7N4ywVvgBgORq0whu
 cWCaIJAtzrLvBlc85yvMtLU6X0z+r5f1dQEA8T2J3CDBPuf2pZ1Nr5Y0u4OOkY/HjooT
 KyIjrCuLCKg4vjC/HQXkwTpkItX8EsZJtk0cJdDayRKFkMHJrYHGn9ytZYk9AVolwVMJ
 GtvDJmwvMi++6f6JfmbWGlNLboGoOnzX32OI5fYUa3RBH/YpbLmPI79CgKq7wj6wpRgc
 OJUy98WMgwvAhEchQDvvUUPtsij/+YeqZJN4PSYZ7yH1O3LlFbq+BAKszyRs5ARki2mz
 Bd+w==
X-Gm-Message-State: AJIora/LaALmU4koVzBKWr3nVxxvTRx3evUBGaETlITLdRjXC+PJRK9c
 EuK1ULj6RUjLcyHaIneg886eo2OvuIh+rw==
X-Google-Smtp-Source: AGRyM1tvL77KuZPOFolM6uHrqSi+Qx8UtLV+jv5PGw0iwuqoXDSdfKfubzfGmINHDppI+NqC0njvrg==
X-Received: by 2002:a5d:650e:0:b0:21e:660e:2665 with SMTP id
 x14-20020a5d650e000000b0021e660e2665mr8322375wru.185.1658773769035; 
 Mon, 25 Jul 2022 11:29:29 -0700 (PDT)
Received: from pc-140.home ([2a01:cb15:81e5:ad00:7afb:407b:e9ac:7e79])
 by smtp.gmail.com with ESMTPSA id
 m184-20020a1c26c1000000b003a04722d745sm19443009wmm.23.2022.07.25.11.29.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 11:29:28 -0700 (PDT)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Mon, 25 Jul 2022 20:29:18 +0200
Message-Id: <20220725182918.28371-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n0prBxf7qZ1553B7c4vDi6tauNeEiIhzhM42zIwFX9g=;
 b=jeA25QHtx2brAN1MlmgZjHtcc9iTJkG2PeY/frMntQMGHz/Xk0pDSXFz0Ci9+iln34
 3sMk/nJF/WD/utBtoI+FqMZhQbGT1UxCErNZ2PoH4PX9UsNq2OFZwmKpgg5IbEXeVvlt
 hsaTMX6TkOTJJf6rAt60jSkGWELLBAioyWwKP5ikQZOPPkKaTS2bwKiNT1OV0mDMJJaT
 cfMVwex4YRkZdt2sX+queevPTi9iqPMERm23y3Y2usUaQElvZW47sSQMKrh5gRM2eDLa
 uxQblF1qb118rK3QSeDxQ5M8zUd1pgJO5CqtcK2rz5Ydkkw7xOylkZb1Yr06ISUAO6mw
 Xl7Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jeA25QHt
Subject: [Buildroot] [PATCH 1/1] package/python-pybind: bump version to
 2.10.0
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
Cc: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>, yann.morin.1998@free.fr,
 gwen@trabucayre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 ...nd11-commands.py-support-STAGING_DIR.patch | 20 +++++++++----------
 package/python-pybind/python-pybind.hash      |  2 +-
 package/python-pybind/python-pybind.mk        |  2 +-
 3 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch b/package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch
index 021321a9b7..1f1fede128 100644
--- a/package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch
+++ b/package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch
@@ -1,7 +1,7 @@
-From bf9f0d619e2e0a424e471a2f9235d26ece5b348c Mon Sep 17 00:00:00 2001
-From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
-Date: Fri, 7 Jan 2022 19:32:18 +0100
-Subject: [PATCH] pybind11/commands.py: support STAGING_DIR
+From 65ea1a8e1b5fe30c61a3f936a3116c3ce6c3a686 Mon Sep 17 00:00:00 2001
+From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
+Date: Mon, 25 Jul 2022 10:55:27 +0200
+Subject: [PATCH] pybind11 commands.py support STAGING_DIR
 
 In Buildroot, we install build-time python scripts in the host directory
 (otherwise they can't be run with host python), but when running
@@ -10,18 +10,16 @@ pybind11 --includes it should return the staging directory.
 Patch commands.py to use the STAGING_DIR environment variable instead of
 the current directory, if it is set.
 
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
-Upstream-Status: N/A, Buildroot specific
+Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
 ---
  pybind11/commands.py | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/pybind11/commands.py b/pybind11/commands.py
-index 11f81d2..8c4876d 100644
+index a29c8ca..de8a27c 100644
 --- a/pybind11/commands.py
 +++ b/pybind11/commands.py
-@@ -1,7 +1,8 @@
- # -*- coding: utf-8 -*-
+@@ -1,6 +1,7 @@
  import os
  
 -DIR = os.path.abspath(os.path.dirname(__file__))
@@ -29,7 +27,7 @@ index 11f81d2..8c4876d 100644
 +    os.path.abspath(os.path.dirname(__file__))
  
  
- def get_include(user=False):
+ def get_include(user: bool = False) -> str:  # pylint: disable=unused-argument
 -- 
-2.31.1
+1.8.3.1
 
diff --git a/package/python-pybind/python-pybind.hash b/package/python-pybind/python-pybind.hash
index d5b4b4829e..b4b3ff94d0 100644
--- a/package/python-pybind/python-pybind.hash
+++ b/package/python-pybind/python-pybind.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  057fb68dafd972bc13afb855f3b0d8cf0fa1a78ef053e815d9af79be7ff567cb  python-pybind-2.9.0.tar.gz
+sha256  eacf582fa8f696227988d08cfc46121770823839fe9e301a20fbce67e7cd70ec  python-pybind-2.10.0.tar.gz
 # License files, locally calculated
 sha256  83965b843b98f670d3a85bd041ed4b372c8ec50d7b4a5995a83ac697ba675dcb  LICENSE
diff --git a/package/python-pybind/python-pybind.mk b/package/python-pybind/python-pybind.mk
index 05fc593346..c5bee3d0a7 100644
--- a/package/python-pybind/python-pybind.mk
+++ b/package/python-pybind/python-pybind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYBIND_VERSION = 2.9.0
+PYTHON_PYBIND_VERSION = 2.10.0
 PYTHON_PYBIND_SITE = $(call github,pybind,pybind11,v$(PYTHON_PYBIND_VERSION))
 PYTHON_PYBIND_LICENSE = BSD-3-Clause
 PYTHON_PYBIND_LICENSE_FILES = LICENSE
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
