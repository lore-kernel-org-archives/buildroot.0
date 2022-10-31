Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF507ECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 22:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3903540255;
	Mon, 31 Oct 2022 22:00:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3903540255
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HZHMg7aW-V5I; Mon, 31 Oct 2022 22:00:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10BF34027E;
	Mon, 31 Oct 2022 22:00:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10BF34027E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6F4441BF2F9
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 22:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48F6E4027E
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 22:00:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48F6E4027E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f-auOp1SYEmm for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 22:00:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F0F140255
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F0F140255
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 22:00:25 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 a11-20020a05600c2d4b00b003cf6f5fd9f1so2696280wmg.2
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 15:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u3cGAX9BY0OGAPeXkS4eFhzQFnbW8ZdJfZAgNeF1Pso=;
 b=cvux4bmmqpdsXTTnP+xo1+U1Vlx+nndChno2nxjX7nA2ESxXV6nnHhIC4nctCNo7DZ
 RjYrv4LIeTAvvxzwl+FoLtmoCJ0TjP87cghDUhENwUE4cd49SRONRUcHP60/uq+75itW
 pdp/sdEYS8KViQIX6SHE5iQhRw282xFGsqNjn72Mmgf1OilDyIOOw/8qa45KVlYw4+1i
 GWAdWi4/m3z98CofLbS9dbR6mxCrslGS0otvFNUvXqSkSWbSRm8kZsA4qqjbosaRj17N
 vapyS/4Ydth3inLHwY5BEe7MPNlGkI8u67SHX36R2w8D1oSIwIEySBUuxlb4kXtTGQr2
 srAg==
X-Gm-Message-State: ACrzQf2wcsLBbCZ9oq2PESvhdD2411oOjOoX4bv/+VZnGgDDJa+KQqPM
 vjeL61NXU286vBimfmyr/8UjyyahHLo=
X-Google-Smtp-Source: AMsMyM6noiNrtoVCjRKYhWgCdy3k4QTZP8kVJ97Gckd8z0jBArb2421o0IwDMULsrjv4GRbgGWN0bg==
X-Received: by 2002:a05:600c:548a:b0:3c6:fb49:4f84 with SMTP id
 iv10-20020a05600c548a00b003c6fb494f84mr20239805wmb.153.1667253623169; 
 Mon, 31 Oct 2022 15:00:23 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 o17-20020a5d4091000000b0022584c82c80sm8455943wrp.19.2022.10.31.15.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 15:00:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 23:00:20 +0100
Message-Id: <20221031220020.44199-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u3cGAX9BY0OGAPeXkS4eFhzQFnbW8ZdJfZAgNeF1Pso=;
 b=Zk16OJ5ydMxinVc46a2zKUIMPYpBBSN59NaqNQXSPjNBZhIs8+YJ8/6ErnRsX9obWO
 aNwNVkY0+fOmFIynWXuocmMOndc2OWCQ65uLALHnEJv41aNd5Vd4vairKE6856h097R7
 j3gkjm6Mqu/gF7H0MDvX2qYVJgeZOUEp7lTEshrZGTIY/RvFAa19UvM5Ujs7kkp7tsHl
 iZ3siFEEK+AAuUyrGSyo8sRoWBzOjNqq+cYaVPZqsv6skJhPrZBl5vYUK0mW5wZizEaG
 +H1lDz0YSTs+c5S3UHUhRg23d/n40tSTPEZj24ltcuM0/ULVM1HdVokSTMfxTa9r2n1Y
 xZRA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Zk16OJ5y
Subject: [Buildroot] [PATCH 1/1] package/uftrace: bump to version 0.12
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop second patch (already in version)

https://github.com/namhyung/uftrace/blob/v0.12/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...support.c-define-EF_ARM_VFP_FLOAT-wh.patch | 31 -------------------
 package/uftrace/uftrace.hash                  |  2 +-
 package/uftrace/uftrace.mk                    |  2 +-
 3 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 package/uftrace/0002-arch-arm-mcount-support.c-define-EF_ARM_VFP_FLOAT-wh.patch

diff --git a/package/uftrace/0002-arch-arm-mcount-support.c-define-EF_ARM_VFP_FLOAT-wh.patch b/package/uftrace/0002-arch-arm-mcount-support.c-define-EF_ARM_VFP_FLOAT-wh.patch
deleted file mode 100644
index 03fba88693..0000000000
--- a/package/uftrace/0002-arch-arm-mcount-support.c-define-EF_ARM_VFP_FLOAT-wh.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 4e543097e62eb052650433d1d4c9c5996d30f242 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Fri, 23 Apr 2021 23:06:01 +0200
-Subject: [PATCH] arch/arm/mcount-support.c: define EF_ARM_VFP_FLOAT when not
- available
-
-uClibc-ng <elf.h> doesn't define EF_ARM_VFP_FLOAT, so let's define it.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- arch/arm/mcount-support.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/arch/arm/mcount-support.c b/arch/arm/mcount-support.c
-index 8d23460b..51331740 100644
---- a/arch/arm/mcount-support.c
-+++ b/arch/arm/mcount-support.c
-@@ -3,6 +3,10 @@
- #include <link.h>
- #include <elf.h>
- 
-+#ifndef EF_ARM_VFP_FLOAT
-+# define EF_ARM_VFP_FLOAT 0x400
-+#endif
-+
- #ifndef EF_ARM_ABI_FLOAT_HARD
- # define EF_ARM_ABI_FLOAT_HARD  EF_ARM_VFP_FLOAT
- #endif
--- 
-2.30.2
-
diff --git a/package/uftrace/uftrace.hash b/package/uftrace/uftrace.hash
index b2a3ddc5a9..195f0605c8 100644
--- a/package/uftrace/uftrace.hash
+++ b/package/uftrace/uftrace.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b8b56d540ea95c3eafe56440d6a998e0a140d53ca2584916b6ca82702795bbd9  uftrace-0.10.tar.gz
+sha256  2aad01f27d4f18717b681824c7a28ac3e1efd5e7bbed3ec888a3ea5af60e3700  uftrace-0.12.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/uftrace/uftrace.mk b/package/uftrace/uftrace.mk
index b487b30695..d36c3bd8f5 100644
--- a/package/uftrace/uftrace.mk
+++ b/package/uftrace/uftrace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UFTRACE_VERSION = 0.10
+UFTRACE_VERSION = 0.12
 UFTRACE_SITE = $(call github,namhyung,uftrace,v$(UFTRACE_VERSION))
 UFTRACE_LICENSE = GPL-2.0
 UFTRACE_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
