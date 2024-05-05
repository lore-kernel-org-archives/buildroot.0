Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CBFC4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 19:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1F92401D5;
	Sun,  5 May 2024 19:00:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5UZWgnKYihrB; Sun,  5 May 2024 19:00:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D311B402CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D311B402CE;
	Sun,  5 May 2024 19:00:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2E8101BF373
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 19:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A474406D0
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 19:00:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xSA79NK4t2Zm for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 19:00:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C788F406CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C788F406CF
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C788F406CF
 for <buildroot@buildroot.org>; Sun,  5 May 2024 19:00:51 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-41c7ac73fddso13206995e9.3
 for <buildroot@buildroot.org>; Sun, 05 May 2024 12:00:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714935649; x=1715540449;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1rSsX5tdY5YqSoMwZZbfwsnbvnoHmzOoLeOnS2NQ20M=;
 b=JbQ3tpNgeV5ju93HOaW0Od67atHf0kvVMagIPPVNyHAxViVFhCyrgR1XXzXz0XtTwQ
 F07K/WfWulVmORhlq3v1Dsv/Nuj5IkvlgK1Rx3RfsLB83HNqTE518TH9JiauyXP9jo9B
 EH2LZ268NoXyHnkuEM+kOLlt7MfVJhJh6scZy+54P+xXrcZep8tnv1urYnbtSDZPmEvi
 26V2BJxc36AGA/JlYl/Hn2zgsK2A7HeZF2Mtbs39BkP/mAuOnRY8L1eLYcQsbUBNhCvr
 40Ae6dsj9qSXfa49H6VMc+J2QMneexqURqvfC91OgZZ5bjHZScKMpdl0rY00hTVKbcTf
 L1Bg==
X-Gm-Message-State: AOJu0YwH5+zkspwqJiNqgydFTBG0gYNZkv6XhEDSwfEDHts0wfZayFM5
 pmsvyPV3yxk9otd8vqoTmlidedN7pIZ6jhrk0GcZZyyQNWBObAjmi/A5iw==
X-Google-Smtp-Source: AGHT+IGRahp7QwYYzFWEo0MRm4F0zQZzT6gz3PGGdPlYq8eJ4MnCyy0HM2YJVplbwEGB4+DmyiJqRg==
X-Received: by 2002:a05:600c:3c9f:b0:418:f6b7:429a with SMTP id
 bg31-20020a05600c3c9f00b00418f6b7429amr7313580wmb.27.1714935648783; 
 Sun, 05 May 2024 12:00:48 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 p17-20020a05600c359100b0041adf358058sm13403949wmq.27.2024.05.05.12.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 May 2024 12:00:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 May 2024 21:00:44 +0200
Message-ID: <20240505190044.1246330-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714935649; x=1715540449; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1rSsX5tdY5YqSoMwZZbfwsnbvnoHmzOoLeOnS2NQ20M=;
 b=CQzg4mtKf774aEyeitb1GxuQJCWvsnveTpbUjnwGOVPbSvAenV1kMKENFh6DGBkCha
 2FUlZ86wfJjbZpYucWcG68o19mD36nXAahT0zHHuXeIzl3wpzNkz+O78wuwIpD9dQxKj
 cd55+HmKEkZ7pTLwFSYm53lecVqAtL4MjXLgtXdXvG7NrdCP6q9kwFFPIK2ZIRoywu6C
 47nMuig6o+w8Of7sLyzeM21PEaFmZ2VazFRXujxOPYL3vjIuCM7vVImUJIiQWIggVfMc
 eZm+8isHX391tt/Ugojw/Uhjm6QmtUMrfTgQiJFsxWhVpmqg7pWjU0d1LpStSLiVDxun
 nsHQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CQzg4mtK
Subject: [Buildroot] [PATCH v2, 1/1] package/libutempter: do not hardcode PIE
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

PIE will be set by buildroot if the user wants it so set
{COMPILE,LINK}_PIE to an empty value to fix the following build failure
raised since the addition of the package in commit
02c818bc5c7a6967a212f12e4caa8ccdfa0b452b:

/home/buildroot/autobuild/run/instance-3/output-1/host/bin/m68k-linux-gcc -W -Wall -Waggregate-return -Wcast-align -Wconversion -Wdisabled-optimization -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wwrite-strings -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -g0   -std=gnu99  -DLIBEXECDIR=\"/usr/lib\" -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wl,-z,relro -Wl,-stats   -fPIE -pie -Wl,-z,now  utempter.c -o utempter

[...]

/home/buildroot/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/m68k-buildroot-linux-uclibc/12.3.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/run/instance-3/output-1/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/Scrt1.o: in function `lib_main':
(.text+0x4): undefined reference to `__shared_flat_add_library'

Fixes: 02c818bc5c7a6967a212f12e4caa8ccdfa0b452b
 - http://autobuild.buildroot.org/results/3a5581fd4edf56bbdc48ab111a2351fc70f1c703

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Also set COMPILE_PIE

 package/libutempter/libutempter.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libutempter/libutempter.mk b/package/libutempter/libutempter.mk
index d51f70049c..aad98126f7 100644
--- a/package/libutempter/libutempter.mk
+++ b/package/libutempter/libutempter.mk
@@ -11,7 +11,8 @@ LIBUTEMPTER_LICENSE = LGPL-2.1+
 LIBUTEMPTER_LICENSE_FILES = COPYING
 
 define LIBUTEMPTER_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		COMPILE_PIE= LINK_PIE=
 endef
 
 define LIBUTEMPTER_INSTALL_STAGING_CMDS
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
