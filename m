Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9015BC27C47
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 15:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0FA4441525;
	Sat, 28 Oct 2023 15:14:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FA4441525
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L7lqz1bz_KpS; Sat, 28 Oct 2023 15:14:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E736041526;
	Sat, 28 Oct 2023 15:14:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E736041526
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8D7131BF362
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 15:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 658C161121
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 15:14:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 658C161121
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aAH7rNKMZxWz for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 15:14:52 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6540E6111D
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 15:14:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6540E6111D
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-32db8f8441eso2069134f8f.0
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 08:14:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698506090; x=1699110890;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hNHFSCi+HUFU01WeluDNVDWRZugGQs3WPASOOvHMtYo=;
 b=Se55Zzo1gtG7TL1CVh5GStJqxAziHzslUdl6cE4uF7mPpBYto1vUwRdoSG/g0xEnYi
 CCIVpHHv7HDv0EN3Chy9nYpgAgZyRjCzHNKkuIbhFnDNlgBTaOJcImfXAS9vtwYFq8BM
 kvZqF6xCjQpDmVZ2hXm8dfiYHV6IYkih7ew311uEiQ6e3Zfi5l7esk1aFxNdOiUi0qvr
 KVhllLfzbgnC7GXgNsu1fKY1ImUg+rsT6QKjPabD4d0EXK8LMyOG014GeRlMDMsOgBKn
 2eGKQWqfVCFrUa6hjR637USTE0RSDqviHiKUiSSusI3e6zdGAu2K8Td+Dyjt04HcOHrG
 /NVQ==
X-Gm-Message-State: AOJu0YwPhhVLq9etCTB1+WVGWEVSTgfaK84KNZONFljAquMUadyTrEgT
 GuGFP9C3PxrEqNw14Y/7BrOmGa1kpj0=
X-Google-Smtp-Source: AGHT+IEzHv523QfLufZWm5Eq/XxJ2NHq3JEPiulVl9x6sMe7/yAtgZSSYAaPZsmO9gySG3I5jZH7ZQ==
X-Received: by 2002:a5d:5b0e:0:b0:32d:ad4a:bcef with SMTP id
 bx14-20020a5d5b0e000000b0032dad4abcefmr5652556wrb.2.1698506089804; 
 Sat, 28 Oct 2023 08:14:49 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 k23-20020a5d5257000000b0032db8cccd3asm3974914wrc.114.2023.10.28.08.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 08:14:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 17:14:45 +0200
Message-ID: <20231028151445.10334-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698506090; x=1699110890; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hNHFSCi+HUFU01WeluDNVDWRZugGQs3WPASOOvHMtYo=;
 b=E1Bg4nC+NSXHjnGPtJISEPnQBDmcZBTRsfW97iZdfP7THUjMdOYgXqi8rW0SbH47sB
 gCBVnM9oplM1ug92a5P8n6uNTWVCXPh/ImR1OnVCHUi4kF4OEosv2hEIUjtb6dUq/YBz
 NlfCngNFulFanqaoQnmbvDt6fd/dRsTZwt4pE/5E1KzXzEVVtziq4LArv0ERhA1XdoA6
 UXkqKgcZpcycbl3rbSnepYFmgk4heYq1V1aOhqi7p4QAJsTiMrd9H+69hz7galdfaETN
 J+3BTvxesb+YnnQJNrY6veYZ93K5d6t5UjDv6EpWGF5GIO2iFxSxdCIH46LYaibMlkk5
 V1Yg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=E1Bg4nC+
Subject: [Buildroot] [PATCH 1/1] package/spirv-headers: needs C++
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since the addition of the package
in commit 0a01085abeb7d8a097cb68b9f7f4faec7711543c:

CMake Error at /home/buildroot/autobuild/instance-3/output-1/host/share/cmake-3.27/Modules/CMakeTestCXXCompiler.cmake:60 (message):
  The C++ compiler

    "/usr/bin/c++"

  is not able to compile a simple test program.

Fixes:
 - http://autobuild.buildroot.org/results/4b94edf6dee03e74ff53939aa228069cc6ba4292

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/spirv-headers/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/spirv-headers/Config.in b/package/spirv-headers/Config.in
index fd20f301d4..e03a6ca1ee 100644
--- a/package/spirv-headers/Config.in
+++ b/package/spirv-headers/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_SPIRV_HEADERS
 	bool "spirv-headers"
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  Machine-readable files for the SPIR-V Registry
 
 	  https://www.khronos.org/registry/spir-v
+
+comment "spirv-headers needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
