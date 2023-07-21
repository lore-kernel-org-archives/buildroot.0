Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A857CEB64DC
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 06:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B87282313;
	Fri, 21 Jul 2023 06:38:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B87282313
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mknWrmnHifEx; Fri, 21 Jul 2023 06:38:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65A8B82295;
	Fri, 21 Jul 2023 06:38:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65A8B82295
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A2A31BF35C
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 06:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0813641B83
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 06:38:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0813641B83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Er5cQ9ROMMWP for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 06:38:08 +0000 (UTC)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C698641B60
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 06:38:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C698641B60
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b702319893so23567601fa.3
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 23:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689921485; x=1690526285;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lymBDxdlZqLMEK+h4wIBZTJ+YxnyuwHxGCEoeP+6T/o=;
 b=ixvad2z4FNLBSVJNCCUeyfFqkXpqsGHpi9JCeWGb/wMyKlzgaWPOa0sxH+cs/i9Pxf
 gnGyD07iacqQjG6lyOGUugrYw21FtqCubPqzpvO0zDg8dkt694UKXsSbDIGxu1P0MIjf
 zsHUpTpfLgCUthzwdYv4b+IHmUAFhhcZUfOYDsd9RlzazantC7gZdrpiAOX19bD7k6ov
 343iArqZHLlH7uDJiJLvaAizpHALhohU7f1nDLmUdyHE2bfruWMNVDi5jxuHIqdbWEna
 URsgiBJQWahUbRpj8wECckeepEJitD/k2ijDhdQyrqFXSMxobhTAcpyQogSTM8WQConr
 mL2Q==
X-Gm-Message-State: ABy/qLY0scoMk6ysuIojINsTFeSElgQmVcB/LCTWrja/1TQWP6wAH1DJ
 2dNBqllAKuY7mzxMbVVqZDmB9y3Ue+I=
X-Google-Smtp-Source: APBJJlGdu03QpW5Z+HRxszN5PBndxgD5ox3AYIbBzHxeKq7thO4tCLCM5CREShrxkmnf33/Uc07lkA==
X-Received: by 2002:a2e:8784:0:b0:2b6:fca2:fc6e with SMTP id
 n4-20020a2e8784000000b002b6fca2fc6emr823391lji.42.1689921484928; 
 Thu, 20 Jul 2023 23:38:04 -0700 (PDT)
Received: from localhost.localdomain ([188.243.23.53])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a2e81ca000000b002b6f8d07d30sm722201ljg.134.2023.07.20.23.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jul 2023 23:38:04 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 21 Jul 2023 09:37:55 +0300
Message-Id: <20230721063755.315887-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689921485; x=1690526285;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lymBDxdlZqLMEK+h4wIBZTJ+YxnyuwHxGCEoeP+6T/o=;
 b=YlbNDMO1f2QSBcNz8kKtdUnBBSJNVMQrkbaPwxvsRftFWAQvCJABSnLRiDN/1RziVd
 Z5u95MZEx2gZo/L5FBjvSiNSo1tjYpYZUUGKN7Ku89ZGt7rrQ9HG25P2DY9GMpkBlh+5
 kGuyGMff5XbGafTgE4AVGq1gtUKUaqTfJT9+4FNx/libGn+1HqJfYugW1ddCUFJSRgGu
 zfSkkQ7BiippGZLWOXQT1ZNOU+HvjjFRNdrBib9Xrc251+PG4lM40RhFUYuo27SBcMIE
 pYgZKPwwxxLnFzSBtaiFPSUvT1LBrKHvYcSmboaRkXQNlFr9gg353qelWGFhcFU0S11A
 frhg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=YlbNDMO1
Subject: [Buildroot] [PATCH] boot/barebox: Fix building of internal scripts
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
Cc: Alexander Shiyan <eagle.alexander923@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some barebox targets need to use internal scripts, for example rockchip64
uses scripts/rkimage which requires the pkg-config package to look up the
openssl options. Since the buildroot uses its own pkkconf package for this
purpose, the scripts cannot be built correctly.
To fix this situation, let's use the CONFIGURATOR_MAKE_ENV wrapper.

  HOSTCC  scripts/rkimage
Package openssl was not found in the pkg-config search path.
Perhaps you should add the directory containing `openssl.pc'
to the PKG_CONFIG_PATH environment variable
Package 'openssl', required by 'virtual:world', not found
/usr/lib/gcc/x86_64-pc-linux-gnu/12/../../../../x86_64-pc-linux-gnu/bin/ld: /tmp/ccN8Xyaj.o: in function `main':
rkimage.c:(.text.startup+0x218): undefined reference to `SHA256_Init'
/usr/lib/gcc/x86_64-pc-linux-gnu/12/../../../../x86_64-pc-linux-gnu/bin/ld: rkimage.c:(.text.startup+0x22b): undefined reference to `SHA256_Update'
/usr/lib/gcc/x86_64-pc-linux-gnu/12/../../../../x86_64-pc-linux-gnu/bin/ld: rkimage.c:(.text.startup+0x23e): undefined reference to `SHA256_Final'
/usr/lib/gcc/x86_64-pc-linux-gnu/12/../../../../x86_64-pc-linux-gnu/bin/ld: rkimage.c:(.text.startup+0x253): undefined reference to `SHA256_Init'
/usr/lib/gcc/x86_64-pc-linux-gnu/12/../../../../x86_64-pc-linux-gnu/bin/ld: rkimage.c:(.text.startup+0x265): undefined reference to `SHA256_Update'
/usr/lib/gcc/x86_64-pc-linux-gnu/12/../../../../x86_64-pc-linux-gnu/bin/ld: rkimage.c:(.text.startup+0x275): undefined reference to `SHA256_Final'
collect2: error: ld returned 1 exit status
make[2]: *** [scripts/Makefile.host:107: scripts/rkimage] Error 1
make[1]: *** [Makefile:976: scripts] Error 2

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 boot/barebox/Config.in  | 1 +
 boot/barebox/barebox.mk | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 3961c69c56..9a8291c944 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -1,5 +1,6 @@
 config BR2_TARGET_BAREBOX
 	bool "Barebox"
+	select BR2_PACKAGE_HOST_PKGCONF
 	help
 	  The Barebox bootloader, formerly known as U-Boot v2.
 
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index d7bcafe436..a521887cca 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -128,7 +128,9 @@ endef
 
 define $(1)_BUILD_CMDS
 	$$($(1)_BUILD_BAREBOXENV_CMDS)
-	$$($(1)_MAKE_ENV) $$(MAKE) $$($(1)_MAKE_FLAGS) -C $$(@D)
+# In order to compile some barebox target tools we need to use pkg-config,
+# so lets always use CONFIGURATOR_MAKE_ENV wrapper.
+	$$($(1)_CONFIGURATOR_MAKE_ENV) $$(MAKE) $$($(1)_MAKE_FLAGS) -C $$(@D)
 	$$($(1)_BUILD_CUSTOM_ENV)
 endef
 
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
