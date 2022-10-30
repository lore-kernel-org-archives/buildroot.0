Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE06ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 19:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0952F404A9;
	Sun, 30 Oct 2022 19:00:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0952F404A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K9I-rPDjyPFS; Sun, 30 Oct 2022 19:00:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2246940182;
	Sun, 30 Oct 2022 19:00:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2246940182
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 110FB1BF473
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 19:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFCB6402BE
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 19:00:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFCB6402BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2hNrXMwjAhDV for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 19:00:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3BA64027D
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F3BA64027D
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 19:00:31 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id r1so5346274ilg.6
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 12:00:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=66ww0xwcCdy6919ew0cQ8iztcRcTzY4DzeNorGTlyEs=;
 b=NR/loWL3e6K7YQCWommiHO6+bHScRrRIwjnonIscrpH/k/3pzhpD1NZKV2rSBQmeBW
 ucBbpm/VJUEpAu3lMnbFzhGgasfRIjCw8QjraKmXK8R1r+qJuGIEgHAbLDspRt6ijVzg
 MqVeUYwzpZyYpAXQ2yJgqOXGGQ/LImcgUo3oSJjq3fRoGqDDEONadpiJwOTTe46c6U/B
 wQkyDboAI4phOG1BfhUHfobt26QySZ49zvKwYMbi6u2yZ1WGpqkqJKRTdILhc+TK89rC
 u8nhNKVqstS64c4TdyZuPAqGd6u4o9Bt67WrOL1Pmdf3d8k3ypVVxi2pAKyN6E8DTN4u
 /gcA==
X-Gm-Message-State: ACrzQf2XToME5YHhmQ0OX7o9ej4r6VJdqEV/M8aGoLQeHg3lNeECcAMr
 aD0eq1MdHIaswfA/gPRb2kSxhAf7hBpwwQ==
X-Google-Smtp-Source: AMsMyM5Z5FrbEq2x+vjEgHRKGIwvnDhFSi6MiuR54Lh4doak7lPoLme5gaV26FNEDp6YSBMLpZZHbg==
X-Received: by 2002:a92:c84c:0:b0:300:98df:8790 with SMTP id
 b12-20020a92c84c000000b0030098df8790mr3688783ilq.110.1667156430600; 
 Sun, 30 Oct 2022 12:00:30 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 r2-20020a92c502000000b002facbe5f358sm1799737ilg.35.2022.10.30.12.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 12:00:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 13:00:28 -0600
Message-Id: <20221030190028.3632333-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=66ww0xwcCdy6919ew0cQ8iztcRcTzY4DzeNorGTlyEs=;
 b=XWR2AMzJTfyLOtzMLKsfJ7FHN0nOC/nuy9tEJJm8NZ5CDRneE5qSqACz5V0k+2o47C
 +vaSDBGuXV89hmIk9MM9+3UYwtIIPQoqEg+0dqer4loRs2hiiT0uc4TXcA3Yr0ksEI82
 Gaiiz/FVhyynkIZQIpKHlmZQHPoEbXZ1ree23FGepHeUhNBIBfPI9l1540dthW7DQMqt
 4oSneNccp2G42CnWhUKUN6iS5CypiAz9GVP6ka5QPJ660wtXCPolPQGfdLvWiQNB70lO
 nTRbTuY8ooIWUN9+CNJqrVTmtNx/Qy1R1oKtqUnDxpNW7ajT/lFFQa1z9qRGA/efbCaW
 Ungw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XWR2AMzJ
Subject: [Buildroot] [PATCH 1/1] package/pkg-cmake.mk: MakeFiles -> Makefiles
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
CMake Error: Could not create named generator Unix MakeFiles

Generators
  Green Hills MULTI            = Generates Green Hills MULTI files
                                 (experimental, work-in-progress).
* Unix Makefiles               = Generates standard UNIX makefiles.
  Ninja                        = Generates build.ninja files.
  Ninja Multi-Config           = Generates build-<Config>.ninja files.
  Watcom WMake                 = Generates Watcom WMake makefiles.
  CodeBlocks - Ninja           = Generates CodeBlocks project files.
  CodeBlocks - Unix Makefiles  = Generates CodeBlocks project files.
  CodeLite - Ninja             = Generates CodeLite project files.
  CodeLite - Unix Makefiles    = Generates CodeLite project files.
  Eclipse CDT4 - Ninja         = Generates Eclipse CDT 4.0 project files.
  Eclipse CDT4 - Unix Makefiles= Generates Eclipse CDT 4.0 project files.
  Kate - Ninja                 = Generates Kate project files.
  Kate - Unix Makefiles        = Generates Kate project files.
  Sublime Text 2 - Ninja       = Generates Sublime Text 2 project files.
  Sublime Text 2 - Unix Makefiles
                               = Generates Sublime Text 2 project files.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pkg-cmake.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index db9fdebb8d..8c375779cb 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -88,7 +88,7 @@ define $(2)_CONFIGURE_CMDS
 	rm -f CMakeCache.txt && \
 	PATH=$$(BR_PATH) \
 	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
-		-G"Unix MakeFiles" \
+		-G"Unix Makefiles" \
 		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \
 		-DCMAKE_INSTALL_PREFIX="/usr" \
 		-DCMAKE_INSTALL_RUNSTATEDIR="/run" \
@@ -119,7 +119,7 @@ define $(2)_CONFIGURE_CMDS
 	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
 	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
 	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
-		-G"Unix MakeFiles" \
+		-G"Unix Makefiles" \
 		-DCMAKE_INSTALL_SO_NO_EXE=0 \
 		-DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
 		-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
