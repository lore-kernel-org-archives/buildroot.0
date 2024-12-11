Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08513E7717D
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 09:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B62D6401CB;
	Wed, 11 Dec 2024 09:46:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rvu7WLS6A5J1; Wed, 11 Dec 2024 09:46:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66E974025E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66E974025E;
	Wed, 11 Dec 2024 09:46:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 99BA5E11
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 09:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78E1680CA2
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 09:46:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PT1oGUjvoUxA for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 09:46:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4F5B080C77
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F5B080C77
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F5B080C77
 for <buildroot@busybox.net>; Wed, 11 Dec 2024 09:46:53 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4361f65ca01so2690485e9.1
 for <buildroot@busybox.net>; Wed, 11 Dec 2024 01:46:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733910411; x=1734515211;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ufvb3v/XP59jGYMIJTus20FvTnkgnTZMf+jQjeJqXtw=;
 b=mT/sMFN2sKyyxamYsVVUyAirqIfWdXMOIV/1ChLxL9g9t7KW6lg68l+We6M/UtoHZC
 n803xg3Uh/OZvFuGYJ92+yB5D6xQNOSysVVMgVMhF4mKlME+LxFuQ8TX6Hf69N7SK7a9
 eZJtKOcE2pLgFLppfw96U7NjPfcs05vtlDXO3KnmeaFB0E9Mjz224QOgAN3mzqFgk3sg
 /JiTAvu0ozHJ9DppSCLiZlNTGNSQXR15tRWfEd9k6oWbzM2AyxTzlk5zRwV3JBAOSt0F
 vOghzN6Mmbe1AVXCxwM3lvqAWS80OevuDb3hAtQvpFtZAvw9Hah1pFa9pYOpzTdCEGor
 a3FQ==
X-Gm-Message-State: AOJu0YyBDzfU061z4CWQ1/zLaYhMRei0vGFP2wEvkB51EdsIyVDWlyJL
 daTpdxQScxOzBLm5vql/+MRNQumYK300bH9pq2zX5ZRUibx+qATn83pJs2PCsrxiPribxECct2Y
 cdA==
X-Gm-Gg: ASbGncsZsE5quflOAy/dY3Ubv+vMJTIT1Ft6N/ij5kzU7et16ENtCRiNvulcyoUhjDo
 NURu3RjCDdA7QXTp8PfzcipIRE3ooTammEJC2vaztmXc6znD6IEeYetJC6F98kVrRCWgW5aeSyH
 KULDVtgXOV9OI/xc3sH34RlNNKRznla+nNjb44NAIf8Cu+caovuqNpCawolON88Q01I9NMJB1ne
 0z0g9Hi551jFSCyO2MogA7V/a2nV9WD0bT+alwkysqI/3zs8iv2ZjuqGOT+XgISy6ClPyQCPlaL
 CT8syDLN5bSB
X-Google-Smtp-Source: AGHT+IH9Uq5tgTlCcyRWncR60b+Jm5AyXedqDPYgUefTSIjolZElHHNXOmG/tpALfm+7PWO7LohjUQ==
X-Received: by 2002:a05:6000:1f83:b0:385:e94d:b152 with SMTP id
 ffacd0b85a97d-3864ced32bdmr1682754f8f.54.1733910410887; 
 Wed, 11 Dec 2024 01:46:50 -0800 (PST)
Received: from vm-2404.. (75.184.66.37.rev.sfr.net. [37.66.184.75])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38782514d35sm892518f8f.74.2024.12.11.01.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 01:46:50 -0800 (PST)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 11 Dec 2024 10:46:37 +0100
Message-ID: <20241211094639.968420-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1733910411; x=1734515211; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ufvb3v/XP59jGYMIJTus20FvTnkgnTZMf+jQjeJqXtw=;
 b=RrOqY5nsvnl7J++jYp1tDIOlOH6ksRl53nq7SBoH4pEs0ZREWAOLmXP9gS05/zBkqY
 jRREU9/X00Gun2OfRV+x0NR0Xjd9CbxdPNTh+sk76nJApyRxt0lyR9a4B/NjCMlXHAsw
 ndLByxs+5r+6RjxhYzRMgsxhI/Y7LhOFLRqcf10on6XeDDpTf0h35VtrgsxLihCCfpTW
 d42vgGfZsJhHBIXUcp5B9nC/8O7Zqr3JIccqqs2yHt/HRT2FDj6YIscalo9N25q0xpTY
 YrnTYS2QThi8v7n1GCiPIRXq6kQqEIOu2MImENsklACfWYwq5Ps7Gu+fDHv3IxgcMMWB
 9Ncw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=RrOqY5ns
Subject: [Buildroot] [PATCH 1/3] package/lua-iconv: bump to version 7.1.0
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-iconv/Config.in      | 2 +-
 package/lua-iconv/lua-iconv.hash | 4 ++--
 package/lua-iconv/lua-iconv.mk   | 3 ++-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/lua-iconv/Config.in b/package/lua-iconv/Config.in
index e76019d67..73c2af9bf 100644
--- a/package/lua-iconv/Config.in
+++ b/package/lua-iconv/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_LUA_ICONV
 	help
 	  Lua binding to the POSIX 'iconv' library
 
-	  http://ittner.github.io/lua-iconv/
+	  https://github.com/lunarmodules/lua-iconv
diff --git a/package/lua-iconv/lua-iconv.hash b/package/lua-iconv/lua-iconv.hash
index b28ce0b31..d53429525 100644
--- a/package/lua-iconv/lua-iconv.hash
+++ b/package/lua-iconv/lua-iconv.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  fb66e785e15376c2d2817f1f1b27d10272b877eacc998c727a10f081a7d768fa  lua-iconv-7-1.src.rock
-sha256  30227b9571827f3dfcdeb3830594fc415459d64ad7271e9954178d3ef58a9bd4  lua-iconv-7/COPYING
+sha256  fdcb6b3fdae53967451054a87b1c977d87aeaa88f2d9518c0e316efb777d65f4  lua-iconv-7.1.0-1.src.rock
+sha256  30227b9571827f3dfcdeb3830594fc415459d64ad7271e9954178d3ef58a9bd4  lua-iconv/COPYING
diff --git a/package/lua-iconv/lua-iconv.mk b/package/lua-iconv/lua-iconv.mk
index ea8e0dd8b..23f4b31b4 100644
--- a/package/lua-iconv/lua-iconv.mk
+++ b/package/lua-iconv/lua-iconv.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-LUA_ICONV_VERSION = 7-1
+LUA_ICONV_VERSION = 7.1.0-1
+LUA_ICONV_SUBDIR = lua-iconv
 LUA_ICONV_LICENSE = MIT
 LUA_ICONV_LICENSE_FILES = $(LUA_ICONV_SUBDIR)/COPYING
 LUA_ICONV_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
