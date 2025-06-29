Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98796C7EE30
	for <buildroot@archiver.kernel.org>; Sun, 29 Jun 2025 09:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15D0C407EA;
	Sun, 29 Jun 2025 09:21:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5OW1yDLqWst6; Sun, 29 Jun 2025 09:21:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F7DB407CF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F7DB407CF;
	Sun, 29 Jun 2025 09:21:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A99E1C5
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 09:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B5C1407CF
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 09:21:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9E0gvGkqgZUV for <buildroot@buildroot.org>;
 Sun, 29 Jun 2025 09:21:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AF373407CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF373407CC
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF373407CC
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 09:21:27 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a4ef2c2ef3so1092812f8f.2
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 02:21:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751188885; x=1751793685;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nADStH445gUFxucqZVsQQOWx47TgslSSyOS/ZUMhijM=;
 b=n0/m1dSEV/6dHPxZxor1sYsnselX/N0HQ91eQwL/nKwF+fA8enCInZSMnslL0aTCkF
 4EUq+kPylG+9qJODxX5pKOIib0lcqwyhBTO1ujkMArPyNBZcAwjphc3/4E/fKkbI/60h
 bm0fuIB55qhk1B2tzoQGXwMjF97WXw1EdCN+RE3OLj+eXCDW5LvSChHFL+biVytJgk8Y
 iR0ou97DQNGgOGPJsr8R1qEShu0waNLV0aFw2PMq2Go0c2TaZhsYfkGxz0LrJ+L+DnEb
 LWyYzTX4YbmdlRxIp70JAN4hhalGSRzR61BGYJxWs8V4LX1oyBJtI/IzxQiOjZJ40rTa
 nQYw==
X-Gm-Message-State: AOJu0Yyro0lTGOTJvIFYQCuC7md2gCl81yEw2+ui58tAdOlIsrj2oJyf
 ruykLnIVm2PbPqWTnp4aVQ2bUcQ2+9OE0GqDKT8UdNkNdcmpMVdsWs/01L9fC+NiUCuPTyL/4uY
 iIW1r
X-Gm-Gg: ASbGncs4WYdNsw1FW6bRfYW2PHap5BrpB3+4sVcVAOvfixTQo0DcGsY9eNQhx/rPIhL
 pibOpZMXSshuLKbmIvszbaxb+piSbrq3UWWeOcyiLD5E5x0nEKrMF8GlI2KNnvi4JArQXoOrCGm
 /8Dm5eDALkZxbtHLTSP/P5axXUj7c8PnAayfy+Ntq5jrxmAhnzTUlYqvcglxgA9QXeFXS5sQX4E
 4JED6qhpp8dhIjSyBrKur06ygygJRAnM1P/eR+jluDFoZPfcR/guNsivbQYY3YSPXK4OqG+v7go
 1O+H7rnonrtUdupKBILw22tHmDD2qsE/aVXrDcHVyMf2073eKuvD8wZeU6xaVgHjJ90Orb20R8r
 vHrm6qODa5A==
X-Google-Smtp-Source: AGHT+IFgqdPSObh+TOpKqd2vDP3gc+xCljPDNYF/yJTCDgAnGfIAmzCGUipeZd+PwmMiCSF+QgQ3Xw==
X-Received: by 2002:a05:6000:2407:b0:3a5:783f:528a with SMTP id
 ffacd0b85a97d-3a8ff051153mr9521067f8f.59.1751188884652; 
 Sun, 29 Jun 2025 02:21:24 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e62144sm7413686f8f.92.2025.06.29.02.21.23
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 02:21:24 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 29 Jun 2025 11:21:23 +0200
Message-ID: <20250629092123.608605-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751188885; x=1751793685; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=nADStH445gUFxucqZVsQQOWx47TgslSSyOS/ZUMhijM=;
 b=LRld2D+bQp22c4qHs8GNRv47WfiANUjvS0kFTW9hEewBwJD3zn47Yiz7CjRGbdeZZA
 qqTqcnew4BDGBxoD8maj6QvD/aVJNwC/f/fO1VhsZMuf+TIPq059se51QrnqPUY7bUBw
 ruqLfMox3DqqE1OA5b/qm4+vH0XN2F7b1rThRDCjVy2yVIjQ+prQFsDvFIE/UVG+c0z1
 uYr2SACSpE1p6qNuQmTNxV5LpvkgWgA6b0k4aGZ+gUfzop21EjMRKJQAUbP7GGgKCwya
 U6jlSn95s8DbFM+jaC1IbJSkUnV+c8GUysJS4cIthI7nvEOb1heI3kBtm4mSIE8e/+fb
 0MTQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=LRld2D+b
Subject: [Buildroot] [PATCH 2025.02.x]
 support/dependencies/check-host-cmake.mk: set host-cmake max version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the introduction of CMake 4 in several distributions, build errors
started occurring on those distributions for cmake packages that
included calls to cmake_minimum_required() or cmake_policy() with a
version older than 3.50 (see [1]).

To avoid backporting numerous individual fixes for affected packages,
commit [2] was previously applied to the LTS branch as a workaround.

Following further discussion (see [2][3]), that raised concerns about
policy changes between CMake versions that could lead to breaking builds
in non-obvious ways, a different approach was chosen.

This patch reverts commit [2] and instead of applying a global
compatibility variable, we now enforce building host-cmake when the host
system provides CMake 4 or newer.

[1] https://cmake.org/cmake/help/latest/release/4.0.html#deprecated-and-removed-features
[2] 70aac2d9e8 package/pkg-cmake.mk: force config version >=3.5
[3] https://lists.buildroot.org/pipermail/buildroot/2025-May/780262.html
[4] https://lists.buildroot.org/pipermail/buildroot/2025-June/780372.html

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
Hi list,

Since this patch is targetted at the 2025.02.x branch I didn't modify
the infra to support passing 'max' version over 'check-host-*.sh'
scripts.
If this is something that is valuable for the master branch as well I
can send a v2 of this series.

Thomas
---
 package/pkg-cmake.mk                     |  4 ----
 support/dependencies/check-host-cmake.mk | 10 +++++++++-
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 08fe7c431e..ba287d244a 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -53,10 +53,6 @@ define inner-cmake-package
 
 $(3)_SUPPORTS_IN_SOURCE_BUILD ?= YES
 
-# Some packages requires CMake 3.0.0 but latest CMake requires >=3.5
-# Set the policy version minimum to force these packages to 3.5 or greater.
-$(2)_CONF_OPTS += -DCMAKE_POLICY_VERSION_MINIMUM=3.5
-
 # The default backend, unless specified by the package
 $(3)_CMAKE_BACKEND ?= make
 
diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
index e367690319..781c7a3631 100644
--- a/support/dependencies/check-host-cmake.mk
+++ b/support/dependencies/check-host-cmake.mk
@@ -6,11 +6,19 @@
 # cmake infra will catch it and build its own.
 #
 BR2_CMAKE_VERSION_MIN = $(BR2_HOST_CMAKE_AT_LEAST)
+BR2_CMAKE_VERSION_MAX = 4.0
 
 BR2_CMAKE_CANDIDATES ?= cmake cmake3
 BR2_CMAKE ?= $(call suitable-host-package,cmake,\
 	$(BR2_CMAKE_VERSION_MIN) $(BR2_CMAKE_CANDIDATES))
-ifeq ($(BR2_CMAKE),)
+BR2_CMAKE_MAX ?= $(call suitable-host-package,cmake,\
+	$(BR2_CMAKE_VERSION_MAX) $(BR2_CMAKE_CANDIDATES))
+ifneq ($(BR2_CMAKE_MAX),)
+# If BR2_CMAKE_MAX is non-empty, the host cmake version
+# is >= BR2_CMAKE_VERSION_MAX.
+BR2_CMAKE = $(HOST_DIR)/bin/cmake
+BR2_CMAKE_HOST_DEPENDENCY = host-cmake
+else ifeq ($(BR2_CMAKE),)
 BR2_CMAKE = $(HOST_DIR)/bin/cmake
 BR2_CMAKE_HOST_DEPENDENCY = host-cmake
 endif
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
