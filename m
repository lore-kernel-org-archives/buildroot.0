Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A3EEED619
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 17:04:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EED3661366;
	Fri, 15 Sep 2023 17:04:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EED3661366
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c3eeAEJdDYF3; Fri, 15 Sep 2023 17:04:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 243966131D;
	Fri, 15 Sep 2023 17:04:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 243966131D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4B0221BF5A8
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 17:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 240326131D
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 17:04:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 240326131D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ADowGd6ZvoYD for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 17:04:20 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 28B2F60B53
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 17:04:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28B2F60B53
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-403004a96eeso25740905e9.3
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 10:04:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694797458; x=1695402258;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oNUN5XthK5JL2M6IK/2F/4zA5JezWTelmoWJ7VfilTA=;
 b=BozMInroJ4d/M+bigu5PHikCzNAE7NqlaHN0faKu5fn9RL03mtfsjNS3zBY1Tivhbd
 putLIksHUaY870d+w6Vz/yJAkLF9izVm9TsCaqqKj2UaQmNq0dylD98KQd4s5ciXmkmn
 Kfz563QunzDW1s/QbhXW4PkGVokZu5vD2sDhVLGj70au6h9I7b/h+DPgk3MreK2jPMHS
 35p/a87TcA2KAZ6o+uvygo0hbB2xi4UFDbQkayeOssAlK6E3c1/iAXSabMqDSaoAXO6/
 uALMMZMreIQAxesJLhUd0Is0g03pj8W4FzGeWpQsm7yL6jMSMiFzpwbk1pjmVe5tGHFf
 cZAw==
X-Gm-Message-State: AOJu0Yxpi3eWRdiImYrsiNXDhqOP7viFOq996BnKozUdXtXNnswoiIoK
 Iaw7JR9v57BqnPa4/2Bl9R7D/oR72rs=
X-Google-Smtp-Source: AGHT+IFi2rCk1U9kNj8KyBRi4CepxGMaP7NYHVoAftXNM2n/VQMb/v0HMPufKPZr6+uqnoidHSBYKA==
X-Received: by 2002:a05:600c:241:b0:3fb:a0fc:1ba1 with SMTP id
 1-20020a05600c024100b003fba0fc1ba1mr2084138wmj.35.1694797457620; 
 Fri, 15 Sep 2023 10:04:17 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l26-20020a056000023a00b0031ff1ef7dc0sm2050274wrz.66.2023.09.15.10.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Sep 2023 10:04:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 15 Sep 2023 19:04:12 +0200
Message-Id: <20230915170412.855864-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694797458; x=1695402258; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oNUN5XthK5JL2M6IK/2F/4zA5JezWTelmoWJ7VfilTA=;
 b=LtpZdjCshk+gIQ39+RhSlRrIj4zS+WK442uU0Q1hiB+E/jhMeYBItnJ60fXVn1f/3C
 h0822JvZrkaRaf+1r4wzHfWL6z7dWunEdEXVj/kp1T1wdCxL0oDeLAZq8Je8Ot4O9MwM
 vzwqsqGdHlcN9J5MhIWuwBbA3firpHOCSv57vGnVV6wX6yHerxgIar8OzcWJ3w4x81UA
 nDlCD2Tpd2c4BEbG/Av6QnTLvYWMYvX6N+BKQgm6gwKmmtJatILI3tcio/vX+Qzgxiuk
 4CsPv1tEu+CxycNbsElw723+WyMB490MI7xvmRNwp0yhJpurRMHJbrPOHcz/4Hz7vDCH
 a0LQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LtpZdjCs
Subject: [Buildroot] [PATCH 1/1] package/hwlock: security bump to version
 2.9.3
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
Cc: Steven Noonan <steven@uplinklabs.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2022-47022: An issue was discovered in open-mpi hwloc 2.1.0
allows attackers to cause a denial of service or other unspecified
impacts via glibc-cpuset in topology-linux.c.

https://github.com/open-mpi/hwloc/blob/hwloc-2.9.3/NEWS
https://github.com/open-mpi/hwloc/compare/hwloc-2.9.2...hwloc-2.9.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/hwloc/hwloc.hash | 4 ++--
 package/hwloc/hwloc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/hwloc/hwloc.hash b/package/hwloc/hwloc.hash
index d40315a3af..8010b857f0 100644
--- a/package/hwloc/hwloc.hash
+++ b/package/hwloc/hwloc.hash
@@ -1,5 +1,5 @@
 # From https://www.open-mpi.org/software/hwloc/v2.9/
-sha1  be2a4f299c0da7670d39724986268bfa3fac6aee  hwloc-2.9.2.tar.bz2
-sha256  0a87fdf677f8b00b567d229b6320bf6b25c693edaa43e0b85268d999d6b060cf  hwloc-2.9.2.tar.bz2
+sha1  76b49087619b46d71e18bd1131d35a5ccf5de791  hwloc-2.9.3.tar.bz2
+sha256  5c4062ce556f6d3451fc177ffb8673a2120f81df6835dea6a21a90fbdfff0dec  hwloc-2.9.3.tar.bz2
 # Locally computed
 sha256  d79a936a42f3c6cb7c8375a023d43f4435f4664d3a5a2ea6b4623cff83c7fc06  COPYING
diff --git a/package/hwloc/hwloc.mk b/package/hwloc/hwloc.mk
index f6cf5433c4..0524ec17fd 100644
--- a/package/hwloc/hwloc.mk
+++ b/package/hwloc/hwloc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HWLOC_VERSION_MAJOR = 2.9
-HWLOC_VERSION = $(HWLOC_VERSION_MAJOR).2
+HWLOC_VERSION = $(HWLOC_VERSION_MAJOR).3
 HWLOC_SOURCE = hwloc-$(HWLOC_VERSION).tar.bz2
 HWLOC_SITE = https://download.open-mpi.org/release/hwloc/v$(HWLOC_VERSION_MAJOR)
 HWLOC_LICENSE = BSD-3-Clause
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
