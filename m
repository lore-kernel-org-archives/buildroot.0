Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE496C4345F
	for <buildroot@archiver.kernel.org>; Sat, 13 Apr 2024 13:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D99981C19;
	Sat, 13 Apr 2024 13:18:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kSdtn-Hq2x1K; Sat, 13 Apr 2024 13:18:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B17481E6D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B17481E6D;
	Sat, 13 Apr 2024 13:18:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ACBD41BF855
 for <buildroot@lists.busybox.net>; Sat, 13 Apr 2024 13:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A638F407AC
 for <buildroot@lists.busybox.net>; Sat, 13 Apr 2024 13:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v1q0Gti_SViJ for <buildroot@lists.busybox.net>;
 Sat, 13 Apr 2024 13:18:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 35C12407A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35C12407A2
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35C12407A2
 for <buildroot@buildroot.org>; Sat, 13 Apr 2024 13:18:03 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a52223e004dso193955166b.2
 for <buildroot@buildroot.org>; Sat, 13 Apr 2024 06:18:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713014281; x=1713619081;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uabRGeyKyGpdLuRItPlhioL3KAUiPUGM6RC7PCFNFvo=;
 b=ap+KfzjlA5SDzFX3LwYBthIRUFblu2LLlvyU31RAXOu6NZ8FoGDs8DmbmKu1Bw76EV
 yhyA/IRhPDuIEfiWadzQYBvTp43J6npf6V7MfuEp07WweKJM1TstZr4RwUPUEv4Js32m
 t4PMGp8VQlkSUpm60JSRQxeQ52CxGs2RKV+2KsicKu/aOOIPDMRA1gAkkC5frBW4kxF5
 Tz7bl9W5Ow4+j6UK3fj1SNBSxrCS0RvLUrKyUSoUyCsFP4MrvswPPnsixSBSW6QZp74M
 9R25DgZHvc5AG936tYMj7/dVq8NJTFxv9t003ByJnr1vGcU5bJxWUsVpZZEhjqdG+lQY
 KTPw==
X-Gm-Message-State: AOJu0YxwhYR6Zaor07fY2s/u2UMgbk96U1QZOFc8awsu8qnXe41NLp8y
 DkBUZmePE+aSr5rYihMpf/IrAb/zWx7b/n9yIWwVuiNnbc1MOeWmdbKtBGNhT6EnSaUFILgmGXE
 c904=
X-Google-Smtp-Source: AGHT+IEJfKns4Mnnz/fNndlPM6uPoIXD4IBRQCLREEWF6vGzJ/OWg4WEATWPHDPioOr3BA5SED370Q==
X-Received: by 2002:a17:906:590b:b0:a52:42ee:4e10 with SMTP id
 h11-20020a170906590b00b00a5242ee4e10mr2211622ejq.8.1713014281044; 
 Sat, 13 Apr 2024 06:18:01 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-8-99-67.retail.telecomitalia.it. [87.8.99.67])
 by smtp.gmail.com with ESMTPSA id
 jy3-20020a170907762300b00a521603e14csm2993302ejc.138.2024.04.13.06.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Apr 2024 06:18:00 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 13 Apr 2024 15:17:55 +0200
Message-ID: <20240413131757.3627575-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1713014281; x=1713619081;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uabRGeyKyGpdLuRItPlhioL3KAUiPUGM6RC7PCFNFvo=;
 b=MZrzmqWhYBySBWsIEFUXx07PxHIvqoh1Cr8f3uVAcsYT71C5GFbOwm77dWadaU+cqh
 K65a1PnLm8THmN+HKlGchuR/9PUuyOrKVAPO0DL0DpRmsDSugSt79c/KjXsIZ2pRmokG
 9BWK73EciMknA8u0yqTL+0VbNqwBq1WItpLu0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=MZrzmqWh
Subject: [Buildroot] [PATCH 1/3] package/bmap-tools: update GitHub URL
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
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As reported in the README file of the old GitHub URL (i.e.
https://github.com/intel/bmap-tools), "The code at this location is no
longer maintained and will likely be removed in the future. This project
has moved to https://github.com/yoctoproject/bmaptool".

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/bmap-tools/Config.in      | 2 +-
 package/bmap-tools/Config.in.host | 2 +-
 package/bmap-tools/bmap-tools.mk  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bmap-tools/Config.in b/package/bmap-tools/Config.in
index 91081069c739..425b7dfb9e07 100644
--- a/package/bmap-tools/Config.in
+++ b/package/bmap-tools/Config.in
@@ -40,4 +40,4 @@ config BR2_PACKAGE_BMAP_TOOLS
 	  python-gpgme is not available. Optimized bzip2 decompression
 	  is not supported as pbzip2 is not available.
 
-	  https://github.com/intel/bmap-tools
+	  https://github.com/yoctoproject/bmaptool
diff --git a/package/bmap-tools/Config.in.host b/package/bmap-tools/Config.in.host
index a20829030d68..cb4d35a437fa 100644
--- a/package/bmap-tools/Config.in.host
+++ b/package/bmap-tools/Config.in.host
@@ -9,4 +9,4 @@ config BR2_PACKAGE_HOST_BMAP_TOOLS
 	  image files, can be copied or flashed a lot faster with
 	  bmaptool than with traditional tools like "dd" or "cp".
 
-	  https://github.com/intel/bmap-tools
+	  https://github.com/yoctoproject/bmaptool
diff --git a/package/bmap-tools/bmap-tools.mk b/package/bmap-tools/bmap-tools.mk
index 32399ca151c4..69a22c4745ab 100644
--- a/package/bmap-tools/bmap-tools.mk
+++ b/package/bmap-tools/bmap-tools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 BMAP_TOOLS_VERSION = 3.6
-BMAP_TOOLS_SITE = $(call github,intel,bmap-tools,v$(BMAP_TOOLS_VERSION))
+BMAP_TOOLS_SITE = $(call github,yoctoproject,bmaptool,v$(BMAP_TOOLS_VERSION))
 BMAP_TOOLS_LICENSE = GPL-2.0
 BMAP_TOOLS_LICENSE_FILES = COPYING
 BMAP_TOOLS_SETUP_TYPE = setuptools
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
