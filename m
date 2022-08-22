Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D14BC28D13
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 09:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B485860D5F;
	Mon, 22 Aug 2022 09:00:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B485860D5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BjGOO4yfqd_f; Mon, 22 Aug 2022 09:00:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B070360C25;
	Mon, 22 Aug 2022 09:00:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B070360C25
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0AFEB1BF321
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 09:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA8ED4091C
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 09:00:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA8ED4091C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mKR1Uf3P92pL for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 09:00:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F19B400D2
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F19B400D2
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 09:00:40 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-11c5ee9bf43so12093467fac.5
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 02:00:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=DJSwg0wuTRMqR5kKgbT9u6Vzi2HgQaMYi6WblEUdKps=;
 b=SxE272+pAsU5N31AzixkasjYM42oI8w3ABOX7mIO+wQDkweDZFtbJBQqxENoPiZuY6
 vstvBGH29qgRELuIaD6cjH/RAjdgz0M3k3no7YU+nkOmZ58itYycDDnRJW3hstihPUFF
 qqNTnTGv0Mh/DhBNnFys0tFfaePMbLx99N7AgOSTIn2S3i17kN/wxScRjOmScUmd6X7m
 JDAh7y+oHBIWAGHdQNd5klmU+k3eguG8E91O5Pec9s7LA77SAFIOQ6HyyKkqc+tuw8Lj
 zqhoLEs53BJreLFDdz7xcKF521rbzLtceGffAe6/BxWOOOiMwQwsnm1vI5uoVfO1qRev
 mTkg==
X-Gm-Message-State: ACgBeo1NOfSKnFwRyxAzu3V1/XKYTnwQmBTLml0avVXXi586OZC0jZlb
 thCEb6KijlfY5Yp31qD9jIYo/3LeetE=
X-Google-Smtp-Source: AA6agR7ZRrWuF/3Eu9AiZZT3JvTLgLZlL3vodKCyGtM8O/b0UkJij45wuU4dRe1u7inbUcXclXyxag==
X-Received: by 2002:a05:6870:96a3:b0:11d:8179:aa94 with SMTP id
 o35-20020a05687096a300b0011d8179aa94mr278278oaq.103.1661158839550; 
 Mon, 22 Aug 2022 02:00:39 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 g5-20020a4ad845000000b0044b06d0eae7sm1775060oov.33.2022.08.22.02.00.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 02:00:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Aug 2022 03:00:23 -0600
Message-Id: <20220822090023.2086625-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=DJSwg0wuTRMqR5kKgbT9u6Vzi2HgQaMYi6WblEUdKps=;
 b=PYDP0VENBM0fZVbBghwquKw4GdIe4xrDDt6wx/kt/kC/egAbpjhVsB67wMvhRgaIP+
 yCQku3WOWfY94xhbdqsFbct4FahofYSEEh90XoPRsphtigX4d27z/0ArfCtec3SkxBgE
 dTvgNO2ImowFDh2geg+x9GU1WbukyoHwxp9jBeMLmGMPZzXtn5dXJ/vjPJbWVbvSuiDI
 h3wE8ifgi8Cdj95sxm+mL3iWWiJO5/NZhPEGHSynJF6XB/3iFp+igi9MVz7orbdtEtUY
 x0MVcK5jLuULszEjHbjgAK37UHDh1k1/2kL7d3P2qgog+59mhmtF2Z31g3wguOIYyzP+
 /bxg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PYDP0VEN
Subject: [Buildroot] [PATCH 1/1] package/gensio: bump to version 2.5.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gensio/gensio.hash | 6 +++---
 package/gensio/gensio.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gensio/gensio.hash b/package/gensio/gensio.hash
index 930a2fff81..a0db4bc516 100644
--- a/package/gensio/gensio.hash
+++ b/package/gensio/gensio.hash
@@ -1,7 +1,7 @@
 # From https://sourceforge.net/projects/ser2net/files/ser2net/
-md5  45cd3a4d9058816e50351b0700a035ad  gensio-2.2.9.tar.gz
-sha1  4bb34517931f5be4dc5982f6e7a567cf6fdc41b8  gensio-2.2.9.tar.gz
+md5  60f90f62180922e2c7550877c4bb950c  gensio-2.5.2.tar.gz
+sha1  b6c2ec39b51a56f5d28e88a59122f4c65ff844fa  gensio-2.5.2.tar.gz
 # Locally computed:
-sha256  3609f66e61c98cce181ec1b37508b727b636d7cfffdb6edd4c254d2f6097a000  gensio-2.2.9.tar.gz
+sha256  f7bc3d2ba9da73489dd3227a21ddd2f44a18c443185ce2b1a08ec564da06e6d1  gensio-2.5.2.tar.gz
 sha256  501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
 sha256  dcac7d447dd81ab96d28dce00a07a6486e623f7ded94e2a2a8e83312405cdf89  COPYING.LIB
diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index b27158c61f..f1cc00bf32 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GENSIO_VERSION = 2.2.9
+GENSIO_VERSION = 2.5.2
 GENSIO_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 GENSIO_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GENSIO_LICENSE_FILES = COPYING.LIB COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
