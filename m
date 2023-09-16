Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E2BCD37BC
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 15:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B02116109B;
	Sat, 16 Sep 2023 15:10:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B02116109B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id To62c38DS2_7; Sat, 16 Sep 2023 15:10:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 019C960739;
	Sat, 16 Sep 2023 15:10:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 019C960739
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CF0C01BF4E5
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 15:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B501781C93
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 15:10:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B501781C93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LkbDeA5pmHaW for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 15:10:23 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F40F881C40
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 15:10:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F40F881C40
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-31c5a2e8501so2869176f8f.0
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 08:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694877020; x=1695481820;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vZR+eK0UVvUFNAfvZq0iwlfcgsH5DAr6HQX6x4LlLmA=;
 b=btfRiioyxBFinwtoJ1MDapP1HSNEjfkUAR0SexYwsCZ8IUBPdyS266YZc4Rv/Ewjbd
 EoaG6Jr1BuT3V0yuJz6QxOFSOgI4eV5XIv1Xb8405bHAWKAPnBe8Vk0odjgJFiQdbymq
 yex2nJNjFZLiF64jcfYC8aV6gvJcCOtH7BV0boDNqXGiNGKGFDLZTSS5ddU26RZBiRdB
 8GWsETzPucMZDk7yKmU/ICsNXiBLLEyWsjIPaa1KlCNUwWv0bTXGmWzRGPng2IdneQWV
 aqtZOoIoEEiMdkVb3/lZbPgGdYBAy0OqipAV6/0hg+oCKsmgVk9klsy2vntHGrlDNaZA
 XlYA==
X-Gm-Message-State: AOJu0YwrFxEGLz1wJRHKr+r+jLSvEnl2tVOItK5n4I8n4Bfr23Ez9tis
 nBVaHqqhfOLdZuCqLtzj/C7vfVsGDOY=
X-Google-Smtp-Source: AGHT+IFlF7V/zL1rb1as5CxdavanbgfkDVITVHGQjRvC1Estszj9o7c8ErlzdIx4MMAdNGu+8RZv+g==
X-Received: by 2002:a5d:40d0:0:b0:31f:ec06:20f with SMTP id
 b16-20020a5d40d0000000b0031fec06020fmr4425685wrq.14.1694877020221; 
 Sat, 16 Sep 2023 08:10:20 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 a4-20020a5d5704000000b0031fc9402b47sm7428706wrv.4.2023.09.16.08.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Sep 2023 08:10:19 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Sep 2023 17:10:15 +0200
Message-Id: <20230916151015.723729-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694877020; x=1695481820; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vZR+eK0UVvUFNAfvZq0iwlfcgsH5DAr6HQX6x4LlLmA=;
 b=jQe9y9r0SfaD1ulxPJs5lUifANuYpu+KqPwPU5NMWJPmDyI5l7ePpqTPWt/qHa9Ujd
 NhizGKUR94co7cqj3BJr2j6hWZJfbkhnI+mNHqqWz+1SDZe7MdzsUM7aTO5ofa17m0JA
 k4nE0hKzA+RA+onIzupA9lIUDw9+EwZyyzjGoc9FUfNCWKUvSesODuev6EN89jEkJCH4
 zxU0rnm1Fymy/Mwy886sMvaUG6CD2CSl9wUW8cBzSbwHdyqjzMC4x9ecDbZx6xt3EVQ8
 y4SuymOKtZ2aA2m4AjZu2AwJ5tJjx43VPVXMAGduYm8D265d4qnWcyg/amxzRVACMTx0
 QVEQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jQe9y9r0
Subject: [Buildroot] [PATCH 1/1] package/libarchive: add bsdunzip option
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add bsdunzip option to avoid the following build failure raised since
bump to version 3.7.1 in commit 7991d2c48a859f9c0333ade8192868c21b1a8a31 and
https://github.com/libarchive/libarchive/commit/c157e4ce8eb170a92945cc2d292fd7106bdfcce1:

  CCLD     bsdunzip
/home/autobuild/autobuild/instance-4/output-1/host/lib/gcc/powerpc-buildroot-linux-musl/12.3.0/../../../../powerpc-buildroot-linux-musl/bin/ld: cannot find -lz: No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/aaf7fdefa0b7bd7e5ac743487c197544c1a2ce6f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libarchive/Config.in     |  6 ++++++
 package/libarchive/libarchive.mk | 10 ++++++++++
 2 files changed, 16 insertions(+)

diff --git a/package/libarchive/Config.in b/package/libarchive/Config.in
index ffa4cff7b3..2c8d813ccb 100644
--- a/package/libarchive/Config.in
+++ b/package/libarchive/Config.in
@@ -30,4 +30,10 @@ config BR2_PACKAGE_LIBARCHIVE_BSDCAT
 	  The 'bsdcat' program is a simple replacement tool
 	  for zcat, bzcat, xzcat, and such.
 
+config BR2_PACKAGE_LIBARCHIVE_BSDUNZIP
+	bool "bsdunzip"
+	help
+	  The 'bsdunzip' program is a simple replacement tool
+	  for Info-ZIP.
+
 endif
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 2db36156b8..7e364e3902 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -42,6 +42,16 @@ else
 LIBARCHIVE_CONF_OPTS += --disable-bsdcat
 endif
 
+ifeq ($(BR2_PACKAGE_LIBARCHIVE_BSDUNZIP),y)
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBARCHIVE_CONF_OPTS += --enable-bsdunzip=static
+else
+LIBARCHIVE_CONF_OPTS += --enable-bsdunzip=shared
+endif
+else
+LIBARCHIVE_CONF_OPTS += --disable-bsdunzip
+endif
+
 ifeq ($(BR2_PACKAGE_ACL),y)
 LIBARCHIVE_DEPENDENCIES += acl
 else
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
