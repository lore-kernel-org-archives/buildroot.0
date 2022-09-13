Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DD4ECAAD8
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 18:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9422281336;
	Tue, 13 Sep 2022 18:19:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9422281336
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3DWxxkVcGVBk; Tue, 13 Sep 2022 18:19:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC738812FF;
	Tue, 13 Sep 2022 18:19:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC738812FF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 003371BF3EA
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 18:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0130812F8
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 18:19:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0130812F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UhZa66jJ9aEi for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 18:19:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E585A80C81
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E585A80C81
 for <buildroot@busybox.net>; Tue, 13 Sep 2022 18:19:04 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id t14so22131047wrx.8
 for <buildroot@busybox.net>; Tue, 13 Sep 2022 11:19:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=z/LrOHU2OvVnisvYLlgIUzboeefmt/77bXECW49q+4M=;
 b=p+PtY3AZLGsGyxh9iVWH53Fl6wHS7nt8AUjEgTk4p6tCSCSNFAqI+A/4dQU+kTxwI6
 L+BhFm8VZTbMHAAP527K+Frp9nfrcPSCqKhRm3rOo+F1PEYif7cru3voUqOdkGomBRLq
 OoBl5feeyExDfSNqdPJNS4rmQu09gIfdcgMzYsImjN1Os57c7idADUwaBnLkcEAbV9Sw
 Zo46bxhnQFxQO/yBUjr1l5Il6oJQh74dvgTPy+BmHGzKFs+tXVgrmYsoT3Hblp+26FVU
 IPqaCL1eBafSr33lRVdMfpyTtju0qRW+ZNVxjsWg5iO9gqMLzP6YBjWXsT69h0zGt8kW
 z3Hw==
X-Gm-Message-State: ACgBeo3eGN+Y9pbc5s8Y0yW1+i8RbzB9/J9Oa2Pqjmco0MOwsX7W0dqr
 8ZpjoDPm/ggOiCdKfyet4eA9klwk9tI=
X-Google-Smtp-Source: AA6agR4dgcLFlbe9MXIm83rXggiABVML9R4OX21spVwZSksA+1ivz/3g/vaf4RlWN8iPc318EBNtcQ==
X-Received: by 2002:a5d:58da:0:b0:22a:c3cb:e3cb with SMTP id
 o26-20020a5d58da000000b0022ac3cbe3cbmr1414976wrf.34.1663093137518; 
 Tue, 13 Sep 2022 11:18:57 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 n22-20020a05600c3b9600b003b435c41103sm18141686wms.0.2022.09.13.11.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 11:18:57 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 13 Sep 2022 20:18:52 +0200
Message-Id: <20220913181852.2703410-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=z/LrOHU2OvVnisvYLlgIUzboeefmt/77bXECW49q+4M=;
 b=aCrANdcuQ31LFfultTGYG6iT5BmQdyxKKP50C/uDveZRqwpGlbeE3YYAT/GbXhdglt
 s3UBOfz2dZfaEJ3RfbvqaHT0Fj+A/wQfj8yaERESag10wiXxrQ5Cty34D+AIuH/mQ3VL
 VDnjBj6x+ZXnrafqzfQSSE4QN7vmmisUtPCW+7XNmWSnrbi5oySnhp0ZiUyUPl/eCx85
 65R1/OtGxlKRxFLl2CHXOFCUETpDoffTlsus37rIPS+yjD9OBU1QF7tAkUnLVb652zfb
 YkG4OBokx+fgOpOQo8s2oWC/szNGrQAIvqgiNRmlOezdlGkeRHlvt0OChOA8iJGe0Hbe
 6nfA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=aCrANdcu
Subject: [Buildroot] [PATCH] package/libxslt: bump to version 1.1.37
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libxslt/libxslt.hash | 4 ++--
 package/libxslt/libxslt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxslt/libxslt.hash b/package/libxslt/libxslt.hash
index 8d1a2af19..c771e1fd7 100644
--- a/package/libxslt/libxslt.hash
+++ b/package/libxslt/libxslt.hash
@@ -1,5 +1,5 @@
-# from https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.36.sha256sum
-sha256  12848f0a4408f65b530d3962cd9ff670b6ae796191cfeff37522b5772de8dc8e  libxslt-1.1.36.tar.xz
+# from https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.37.sha256sum
+sha256  3a4b27dc8027ccd6146725950336f1ec520928f320f144eb5fa7990ae6123ab4  libxslt-1.1.37.tar.xz
 
 # Hash for license file:
 sha256  7e48e290b6bfccc2ec1b297023a1d77f2fd87417f71fbb9f50aabef40a851819  COPYING
diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index d908e3c55..95b0325c9 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXSLT_VERSION = 1.1.36
+LIBXSLT_VERSION = 1.1.37
 LIBXSLT_SOURCE = libxslt-$(LIBXSLT_VERSION).tar.xz
 LIBXSLT_SITE = https://download.gnome.org/sources/libxslt/1.1
 LIBXSLT_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
