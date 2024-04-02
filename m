Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE141CD1284
	for <buildroot@archiver.kernel.org>; Tue,  2 Apr 2024 04:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48F6E40103;
	Tue,  2 Apr 2024 04:51:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hL0YJUtSuv5o; Tue,  2 Apr 2024 04:51:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5158240184
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5158240184;
	Tue,  2 Apr 2024 04:51:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0567B1BF308
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 04:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E64284073B
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 04:51:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uLK7uW6diw1D for <buildroot@lists.busybox.net>;
 Tue,  2 Apr 2024 04:51:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DC08040736
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC08040736
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC08040736
 for <buildroot@buildroot.org>; Tue,  2 Apr 2024 04:50:59 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-7cc01644f51so273617539f.2
 for <buildroot@buildroot.org>; Mon, 01 Apr 2024 21:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712033458; x=1712638258;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6yOLtYJFWd+C8PRm+4wXvG/UCodS7yoB4Mt4Dt6nrLQ=;
 b=GpoGolSZVNGabdbmVsl6TN+UBrC2qoqzgbooKTaPNBpoLCYdf+eAR7+1vj2f7D6NEk
 zuyef53i/TpkQ7WYGQ9tEKQC6iCjPbUfgu1b6Yl15fUlEfz+w8siD1WuC/w+uostnvin
 oOQNhZEG8APRLcZ4l55cZiQZBE79FVeZNbiYxMSsN4jKlsDVdiNmmam3nbkmi5harMzR
 kW+t5l1hffOXfKltS6dwcIAclWb1775GwJNAGU9ghA1FEtGpGMi7FZks1DA+QR4ft6m7
 CIAEIlQgEak2QGA1etbvZOX5vhrpvfC+5u9fqb8we7pgqETY9A9erXr7R42OUBpFFVnK
 uukg==
X-Gm-Message-State: AOJu0Yzu1b8ihkghjElbLEGBu6ipyeG2w5voabxjS2UTxfVAauK1E2b3
 Tjv0OjePU91RDcpzZalaUExLUVT4Jg8mvfbAtRzq2f876yXk9XKiMtZ0OlEXMHlsPg==
X-Google-Smtp-Source: AGHT+IFYrN5CTh060G8PIHI5COTR4buoTl9pr2JYh8cZxqtMVBkBwaR8T+NrNh72cFMplZDSM/SEjg==
X-Received: by 2002:a05:6e02:1b0e:b0:369:b97e:7e53 with SMTP id
 i14-20020a056e021b0e00b00369b97e7e53mr4285474ilv.24.1712033457713; 
 Mon, 01 Apr 2024 21:50:57 -0700 (PDT)
Received: from james-x399.localdomain (71-218-245-145.hlrn.qwest.net.
 [71.218.245.145]) by smtp.gmail.com with ESMTPSA id
 n16-20020a02cc10000000b00476e7f39a44sm3005772jap.110.2024.04.01.21.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 21:50:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Apr 2024 22:50:55 -0600
Message-Id: <20240402045055.6236-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712033458; x=1712638258; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6yOLtYJFWd+C8PRm+4wXvG/UCodS7yoB4Mt4Dt6nrLQ=;
 b=LpPEJ3bRxuNHSf2bkl9eCj9uqQ4LPDylDjhyLRgHuVYn6fsjDL+TNUR+08WGkcQIXQ
 AAaJJ/J740189fsmm3ztkSYDZA9EcwDOTuux0HzhkPbYyupo22G83dwT7rtlKsNWtc+0
 SykDCcG30hMaEg0BLi1crxJ65uPhbjZWGzInv/Txivc0HoZRKmzj0hylFjQPRpR4TvNf
 7UoUPOKdpHX6SND8cRFo+kFFKrfFtBkMtAFRwjXDIfo4FsVsv7AAtKZojXgWLezQrhJ/
 lTKFB7eDcfC75XWJDEVRWF1xXNyJYqcYMHrPDNxBpDlHCYSuA/xxgOVgXeQC2m8FH4q6
 YHOw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LpPEJ3bR
Subject: [Buildroot] [PATCH 1/1] package/luaposix: fix build with glibc 2.39
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
 Assaf Inbal <shmuelzon@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When glibc was bumped to version 2.39 in commit
b5680f53d60acf8ff6010082f873438a39bd5d97 it removed the deprecated
libcrypt support.

As glibc's libcrypt was providing luaposix's libcrypt dependency this
broke any luaposix build using glibc version 2.39.

To fix this select the libxcrypt dependency to luaposix when using a
glibc toolchain and add the dependency if selected.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/luaposix/Config.in   | 1 +
 package/luaposix/luaposix.mk | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/luaposix/Config.in b/package/luaposix/Config.in
index 85943f9915..bd2105743d 100644
--- a/package/luaposix/Config.in
+++ b/package/luaposix/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LUAPOSIX
 	# "bit" module, but since it has a different name, luaposix
 	# doesn't find it.
 	select BR2_PACKAGE_LUA_BIT32 if BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1 # runtime
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  This is a POSIX binding for LuaJIT, Lua 5.1 through 5.4;
 	  like most libraries it simply binds to C APIs on the
diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
index d09a1bcd1d..680aeb8b81 100644
--- a/package/luaposix/luaposix.mk
+++ b/package/luaposix/luaposix.mk
@@ -8,7 +8,10 @@ LUAPOSIX_VERSION = 36.2.1
 LUAPOSIX_SITE = $(call github,luaposix,luaposix,v$(LUAPOSIX_VERSION))
 LUAPOSIX_LICENSE = MIT
 LUAPOSIX_LICENSE_FILES = LICENSE
-LUAPOSIX_DEPENDENCIES = luainterpreter host-lua
+LUAPOSIX_DEPENDENCIES = \
+	luainterpreter \
+	host-lua \
+	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt)
 
 define LUAPOSIX_BUILD_CMDS
 	(cd $(@D); \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
