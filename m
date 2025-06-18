Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF16EC7115A
	for <buildroot@archiver.kernel.org>; Wed, 18 Jun 2025 09:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79E2C60755;
	Wed, 18 Jun 2025 09:52:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2hSBex0XDskl; Wed, 18 Jun 2025 09:52:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C78E607BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C78E607BE;
	Wed, 18 Jun 2025 09:52:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ECEE0151
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 09:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB6A640112
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 09:52:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NimMUAtzcwtS for <buildroot@buildroot.org>;
 Wed, 18 Jun 2025 09:52:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D6FB840063
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6FB840063
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D6FB840063
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 09:52:53 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-451e2f0d9c2so4737805e9.1
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 02:52:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750240372; x=1750845172;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W1DR1qPP19zi8haWDnbtvML2Gz6N0H2CHj3Pcb484m8=;
 b=paphMTAfL8b3JZKyh1JHjpxHqE922fS3zs6Hc2JT3iqlFYzzUmSWVJPkCop7Cdyu04
 qW5+kcsqj+OuHb598w1Feh6xCtNkChNNtfPetb8lMN8hPVCJWpnLKGn11IsNh4NtA/4o
 OkG0LBQc9j7m3IRF9grUh1dyHsUVyYxgYGzXJZ/rXylqwXyYbaQe2kpfRkhZJD0vMpqg
 5BMTLGatUSGu1K5STPI39PSfBRBPxD+IPJ8hsAVjJkE+lqMVibWyYvy2lZkGUHnotcRc
 TlYFK5NXcjJPgsgulyf7UR9hNGe8TdNo5hfAZGnbMfc5sumSUGr3MDE0tFdRqwi8GrN+
 21NA==
X-Gm-Message-State: AOJu0YxrPoI2jqxolE25tjGIphxS9XBnwJupPdatPVAxfUXTbGxgFaMg
 fBFenWqelzYt/E/YLPtkNuCzct/+2OU73xbaVi2H8gIqHMB0Sw9CtcS4zwngpQ==
X-Gm-Gg: ASbGnctSezL/m2UPCnetnvfRD9RyQsNAUN0Qa0u1SppX9yyKpCuSDLsZvgF+MtHikVe
 5eaeSkvu1WsDHpJNkh1XhGbIpTFCfRKrh/zKvD9wH0rCy8c+TzCdW05bl5kb1QxwQQ4MB3P4b11
 dWcoGhIkiF/6oUClAAne2olYdZdmrzu4yUCBBrORM5xjn5F9xgSlRzDh7bQDrbdjQrQt1ipwuaq
 LMzY4abJ0KMc2PheMPqb6kOCpQ5O19mxVmSC2ONF+4buzr9CL9dz/Tn6muGgvKGpTZ6wqQt+IPo
 ODlmL5Ij99WQhwJ/NuNIJ6G5hx5PGWIN3qGaBO9vVsZX2U62xEwfiqfq/s95ZZ88xV3Ue02iFLG
 /go4y
X-Google-Smtp-Source: AGHT+IF3zAGefLvYojAXK1qVNB7V6siFCna633wNbzy6M71sKhfyc085GS4jA4I97xtSHCZqrtRqhg==
X-Received: by 2002:a05:600c:4d1f:b0:453:45f1:9c96 with SMTP id
 5b1f17b1804b1-45359995f03mr12523215e9.14.1750240371431; 
 Wed, 18 Jun 2025 02:52:51 -0700 (PDT)
Received: from freepad.iliad.local (z6.kawaii.iliad.fr. [213.36.7.76])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568a67361sm16582112f8f.30.2025.06.18.02.52.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 02:52:51 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: thomas.petazzoni@bootlin.com, ju.o@free.fr, Maxime Leroy <maxime@leroys.fr>
Date: Wed, 18 Jun 2025 11:52:39 +0200
Message-ID: <20250618095240.25712-1-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750240372; x=1750845172; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=W1DR1qPP19zi8haWDnbtvML2Gz6N0H2CHj3Pcb484m8=;
 b=elL5WefDUcg6qIdFsExxmugiFwcYElk2FEms7hPyuR6WqetqMx/jbAKIskrCOtI12D
 uePNTeKy6HE72tB4+CUSb0erE3xVXb3b15f+t44U5y2uqTsrk/7hpgPP0Y3vulJLEjmO
 EZzIvGrzsso7/OF5a2xSzCzYZ0cs6KeVsQ96KVdGr4GvbSXaAfjU3SxpHRV732pUZHaZ
 GG1/QdYetmqtn1hkXjq0eECM8rBZ2eORVMArb1dr/cjR6EJbyWohbu7M16RstwaEqQxt
 i+EeL1O9ADipDDDPrvHoip6roao1xnwNPv/fOrLuC7R4Mt1wLW9iXYqWIFqjxG38VElS
 3g+g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=elL5WefD
Subject: [Buildroot] [PATCH 1/2] package/grout: bump to 0.10.3 version
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the release note of the new version:
https://github.com/DPDK/grout/releases/tag/v0.10.3

Locale is not needed anymore for this new version, thus comment on
BR2_GENERATE_LOCALE has been removed in consequence.

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
 package/grout/Config.in  | 2 --
 package/grout/grout.hash | 4 ++--
 package/grout/grout.mk   | 4 ++--
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/grout/Config.in b/package/grout/Config.in
index 0ebf772e51..7e6e34e07f 100644
--- a/package/grout/Config.in
+++ b/package/grout/Config.in
@@ -18,8 +18,6 @@ config BR2_PACKAGE_GROUT
 	help
 	  Graph router based on DPDK
 
-	  NOTE: grout needs a working UTF-8 locale (BR2_GENERATE_LOCALE)
-
 comment "grout needs a glibc toolchain w/ dynamic library, threads, wchar, gcc >= 4.9, headers >= 4.19"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_DPDK_ARCH_SUPPORTS
diff --git a/package/grout/grout.hash b/package/grout/grout.hash
index 388f600a73..063e518283 100644
--- a/package/grout/grout.hash
+++ b/package/grout/grout.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  95918642f8bebcaa298bc4128a1522ad837ccfcf3f06b6d9979e0a62c76688d0  grout-0.10.0.tar.gz
-sha256  1e412aae8da58b718c78b3d7a52eb547004384d4347e4746a22ca6af7522930c  LICENSE
+sha256  9e07275f7d97e9a02f29ac5df2112ca34a0af579e5435d8990ff6339ab30c3ef  grout-0.10.3.tar.gz
+sha256  1e412aae8da58b718c78b3d7a52eb547004384d4347e4746a22ca6af7522930c  licenses/BSD-3-clause.txt
diff --git a/package/grout/grout.mk b/package/grout/grout.mk
index 228601dbec..46d3cf5f0a 100644
--- a/package/grout/grout.mk
+++ b/package/grout/grout.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-GROUT_VERSION = 0.10.0
+GROUT_VERSION = 0.10.3
 GROUT_SITE = $(call github,DPDK,grout,v$(GROUT_VERSION))
 GROUT_LICENSE = BSD-3-Clause
-GROUT_LICENSE_FILES = LICENSE
+GROUT_LICENSE_FILES = licenses/BSD-3-clause.txt
 
 # Avoid using buildroot commit hash
 GROUT_CONF_ENV = GROUT_VERSION=$(GROUT_VERSION)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
