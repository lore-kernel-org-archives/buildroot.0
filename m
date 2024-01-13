Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E42EC4707B
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 19:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E397F41962;
	Sat, 13 Jan 2024 19:49:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E397F41962
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8X9doRv-9LeI; Sat, 13 Jan 2024 19:49:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25B264192B;
	Sat, 13 Jan 2024 19:49:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25B264192B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 397F01BF3BB
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 19:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F9D982864
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 19:49:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F9D982864
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rDx5vWB9Y-Dc for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 19:49:55 +0000 (UTC)
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D61082871
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 19:49:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D61082871
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-3bd6dc05690so507113b6e.1
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 11:49:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705175393; x=1705780193;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y1QUwHAH0XE1SS6PVBwhqHMxtskVOEcKyjg8QF923GY=;
 b=MifB6maQ0WpTlLFKEW51CkKtcAqD7hdiZ34qmmKRZYW4RSlvSbMhxrMp4iXO+/rede
 z80vhR/QaxdST5hkqpdnenIGw00MxWyIkREC8H925WzQQCZw17ROFV2Z8qD7COPyLefa
 9mIbUeox/GKInmEuZKbzrFuOua66CSSyaEJ6h8j8nHk1tFG24fD/AY00OSf4QJ4NlpHK
 fri5cCeygDkPJ3m81wqW0vscxGsQ+tl6JzSF15CwQ5Iel/h5AEf5sGghCzg/3hW/GU+k
 fxhOfblh6rmbV6qzwb2pS6CSatomJoneYr+tosS5dYANlR005Sex7l2VI7Bzr9w0PXgS
 VyIA==
X-Gm-Message-State: AOJu0YxN/49BLWICYKVKIt28fS1/i228CnJ1gXZT+VAwcxUWWMFeUibK
 OCmuq2BbUfKZP0WNskJhSl+AmA1J1jnRmaocAAA1a6+7OYo=
X-Google-Smtp-Source: AGHT+IFHmE6OQFUJVU9nLLOm8gfMUN8rONS7so3JwL+dq3RMkdGyKi54ggKNBdDm54VfudhnwYDW+w==
X-Received: by 2002:a05:6808:2029:b0:3bb:f778:1d17 with SMTP id
 q41-20020a056808202900b003bbf7781d17mr4679667oiw.23.1705175393331; 
 Sat, 13 Jan 2024 11:49:53 -0800 (PST)
Received: from fedora.. (24-116-183-211.cpe.sparklight.net. [24.116.183.211])
 by smtp.gmail.com with ESMTPSA id
 ke12-20020a170903340c00b001cfc3f73920sm5125969plb.227.2024.01.13.11.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jan 2024 11:49:52 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 12:49:50 -0700
Message-ID: <20240113194950.11170-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705175393; x=1705780193;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=y1QUwHAH0XE1SS6PVBwhqHMxtskVOEcKyjg8QF923GY=;
 b=nkMjZYFVSQqFTT1nc/RIB3dKbwZxMxHDFhw2yqLepUpm9aLhC1Q9ju5ZaZoFp0EkLU
 +OC1Mv/rcB//G8NO3zb+ByY0vpMD8f6GsdKOXNVRyaWrlwCf/BObUy0ElAvkPYg4hhKX
 zxIxDi+e8bkPBQ7ChuVAREMaRRkHP1fJRk01s=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=nkMjZYFV
Subject: [Buildroot] [PATCH v4 1/1] package/flutter-sdk-bin/Config.in.host:
 change flutter-pub-cache location
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When running the command "flutter pub get," the plugins are stored in the
pub-cache directory along with their sha256sum hashes. The default location of
the pub-cache directory is current $(HOST_DIR)/share/flutter/sdk/.pub-cache,
which is not an acceptable choice by default because every plugin is
re-downloaded during every build of a flutter application either during a new
build or when building with the per-package-directory option enabled.

Furthermore, keeping the pub-cache in its current location prevents users from
committing the pub-cache directory to git for faster rebuilds of a
Buildroot-based system, as users cannot store the pub-cache for later use.

To fix the above issue completely, the following two changes must occur:

  - Change the hard-coded Flutter pub-cache location to
    $(DL_DIR)/br-flutter-pub-cache.

  - Remove the `rm -rf $(HOST_FLUTTER_SDK_BIN_SDK)/.pub-cache` and the
    associated comment about why the build system removes the .pub-cache
    directory. After further research, the help text of the precache command
    reads, "Populate the Flutter tool's cache of binary artifacts."
    The current reasoning listed in the comments is not accurate for a
    the following reasons:

    1. We do not want to remove their directory if users already have a pub
       cache they have symlinked to.

    2. If the flutter-sdk-bin package previously set up the pub-cache, then
       the pub-cache directory is set up with the options we want, and there
       is no reason to remove the pub-cache directory.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
changes v3 -> v4:
  - Hardcode the directory to $(DL_DIR)/br-flutter-pub-cache. [Yann]
  - Remove the `rm -rf $(HOST_FLUTTER_SDK_BIN_SDK)/.pub-cache` line. [Yann]
  - Remove the associated comments about the above line. [Yann]
  - Expand the commit log.

 package/flutter-sdk-bin/flutter-sdk-bin.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
index 5e5042bea8..2e37e6f036 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -41,11 +41,8 @@ define HOST_FLUTTER_SDK_BIN_CONFIGURE_CMDS
 	$(HOST_FLUTTER_SDK_BIN_ENV) $(@D)/bin/dart --disable-analytics
 endef
 
-# Remove the cache, as we will run precache after setting up flutter and dart
-# with the new config options.
 define HOST_FLUTTER_SDK_BIN_BUILD_CMDS
 	mkdir -p $(HOST_FLUTTER_SDK_BIN_SDK)
-	rm -rf $(HOST_FLUTTER_SDK_BIN_SDK)/.pub-cache
 	cd $(@D) && \
 		$(HOST_FLUTTER_SDK_BIN_ENV) $(@D)/bin/flutter precache;
 endef
@@ -104,4 +101,4 @@ HOST_FLUTTER_SDK_BIN_DART_BIN = \
 $(eval $(host-generic-package))
 
 # For target packages to locate said pub-cache
-FLUTTER_SDK_BIN_PUB_CACHE = $(HOST_FLUTTER_SDK_BIN_SDK)/.pub-cache
+FLUTTER_SDK_BIN_PUB_CACHE = $(DL_DIR)/br-flutter-pub-cache
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
