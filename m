Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581D3C5AD49
	for <buildroot@archiver.kernel.org>; Mon, 26 May 2025 16:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07A6D404E3;
	Mon, 26 May 2025 16:14:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W8cqHZQOZEnJ; Mon, 26 May 2025 16:14:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B6DA405ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B6DA405ED;
	Mon, 26 May 2025 16:14:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 58B8B28B
 for <buildroot@buildroot.org>; Mon, 26 May 2025 16:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E11E405ED
 for <buildroot@buildroot.org>; Mon, 26 May 2025 16:14:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zyU-Qn9mLccx for <buildroot@buildroot.org>;
 Mon, 26 May 2025 16:14:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 21A63404E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21A63404E3
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 21A63404E3
 for <buildroot@buildroot.org>; Mon, 26 May 2025 16:14:12 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-602e203db66so3332855a12.1
 for <buildroot@buildroot.org>; Mon, 26 May 2025 09:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748276051; x=1748880851;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mQm0SBBkTbxRAFN+Tq3tJG9GR/tjmgnCqmOTa8PuHmc=;
 b=w495aH9k8Dh1yJeqHc8IugzJuxrkgdvXT4YUVaG6VgT531fpPZCPNLHQ2oim74yC89
 5vpLTHm+g0IeAeXRW13BwR0gJFFi4eFGQF+4RarFXuTSnSIfTqoWDIHXPF98Gw2Xx9AQ
 K4xpX5p+NzX4XoF6MWaBklFA+emuavTmhGNeSF1AxOwsp4NBmpewQRWFaXxUw5Q6x7ZR
 X6o8sdIWGXirRBIpa5Fw9rRcii3NTw+Tsn3VzaISwp53iPysgKVfINGxJfOrbHwTHwyX
 KMDkeLYbT6cm14BlQhktVqASkSVYhCY8rM+yn/5zV/CO+SJbirOsEVaH1F7LWUTcLyOM
 brtA==
X-Gm-Message-State: AOJu0YyNVgKMw32AJ5lus+wy7VoiSwtWjVmNG1JLTbXsuolcGM5D65HB
 oFlPNeOsFrTz7OYnzn0fi629nkafE0yzvxusPomaWy3PU3sK2yuU5J/jAE0y7MVZWYDmq4i3r0h
 9zK/j
X-Gm-Gg: ASbGncusU1UkXRtn8ljH/upXZ4E2nEvoe5ntaUowDGseKpP7b+X+OkbswjBHnnEX9N9
 C+hxmuWNLUP9yTou24N2txr9cE91FcAtPauiuXzamWuFCXiS74fl1kqE0ux/cgWWjrwiQ73U2KZ
 vfWe2eZeA9CaKStnbavpJvwuZRTe623+imfyOfcYAF6EO6Pge540gnZnnkiFPlDam/vzX+/7AcS
 lMQNhx/vzT0E4xcub6B24nXsYQ2SgXBIm1nHFFPaTqHTp0EFP8E5kgj+KxdlRw4l9v34fzzwD0R
 iU+TFFLQ66BwoMUxfsYKpRyhQfF8wCWQgQIqWx7sXChVdHuutj3qEFWGq7L3BmypnAkxidEOE4O
 904Oqpeo9pAgOgiw=
X-Google-Smtp-Source: AGHT+IEYN31UiSAH9jncl/GylQRWQqTipeofvW07cA/0q7ufiCziRBJTkzj3NbwUL92reuNGkWuPqA==
X-Received: by 2002:a17:907:3faa:b0:ac7:d7f3:86c6 with SMTP id
 a640c23a62f3a-ad85b0a61d8mr707310066b.9.1748276050595; 
 Mon, 26 May 2025 09:14:10 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.88])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4e8afdsm1721048566b.176.2025.05.26.09.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 09:14:10 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Mon, 26 May 2025 18:14:03 +0200
Message-ID: <20250526161403.1305438-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1748276051; x=1748880851;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mQm0SBBkTbxRAFN+Tq3tJG9GR/tjmgnCqmOTa8PuHmc=;
 b=T7wYaH685GGtt32Ll9IygvrNkHrzsBVJxY/Gz/jm1OwO9UNfSTBWjCNJhECKvdN0e8
 0ucp6/ob6eNqbJqMbimwX3y14AEnf/dhd+8z6elIXIki63gyxgLXdoMKA64AYw+SNs13
 KnakkhF5Pc9o/ZZ8q+4e5h5HsurFUdYOGUIBU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=T7wYaH68
Subject: [Buildroot] [PATCH 1/1] package/uuu: fix gcc-15 compile errors
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

Fix the following compilation errors:

In file included from /workdir/instance-0/output-1/build/host-uuu-1.5.201/libuuu/sdps.cpp:32:
/workdir/instance-0/output-1/build/host-uuu-1.5.201/libuuu/sdps.h:52:9: error: 'uint32_t' does not name a type
   52 |         uint32_t m_offset = 0;
      |         ^~~~~~~~
/workdir/instance-0/output-1/build/host-uuu-1.5.201/libuuu/sdps.h:33:1: note: 'uint32_t' is defined in header '<cstdint>'; this is probably fixable by adding '#include <cstdint>'
   32 | #include "cmd.h"
  +++ |+#include <cstdint>
   33 |
/workdir/instance-0/output-1/build/host-uuu-1.5.201/libuuu/sdps.h:53:9: error: 'uint64_t' does not name a type
   53 |         uint64_t m_scan_limited = UINT64_MAX;
      |         ^~~~~~~~
/workdir/instance-0/output-1/build/host-uuu-1.5.201/libuuu/sdps.h:53:9: note: 'uint64_t' is defined in header '<cstdint>'; this is probably fixable by adding '#include <cstdint>'
/workdir/instance-0/output-1/build/host-uuu-1.5.201/libuuu/sdps.h: In constructor 'SDPSCmd::SDPSCmd(char*)':
/workdir/instance-0/output-1/build/host-uuu-1.5.201/libuuu/sdps.h:41:47: error: 'm_offset' was not declared in this scope
   41 |                 insert_param_info("-offset", &m_offset, Param::Type::e_uint32);

Fixes:
- https://autobuild.buildroot.org/results/b7b/b7bd052a0137a2e2d5606d66a0dc563789999364/
- https://autobuild.buildroot.org/results/350/3500f573427545e51bfc4fc708f769966d95bf1e/
- https://autobuild.buildroot.org/results/6dc/6dc2b0585e8e1900e5a977cd0b9e26b2ee1e90d4/
- https://autobuild.buildroot.org/results/d1f/d1f82cae003cddefae0c49f673768cd8601449f2/
- https://autobuild.buildroot.org/results/9ed/9edc245d0a03089812d631708a4294ff293a461d/

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...libuuu-sdps-fix-gcc15-compile-errors.patch | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/uuu/0001-libuuu-sdps-fix-gcc15-compile-errors.patch

diff --git a/package/uuu/0001-libuuu-sdps-fix-gcc15-compile-errors.patch b/package/uuu/0001-libuuu-sdps-fix-gcc15-compile-errors.patch
new file mode 100644
index 000000000000..a3c1d85fc07d
--- /dev/null
+++ b/package/uuu/0001-libuuu-sdps-fix-gcc15-compile-errors.patch
@@ -0,0 +1,33 @@
+From 142448e55386b88adf5b1d7e6206df1ca6784708 Mon Sep 17 00:00:00 2001
+From: Bruno Thomsen <bruno.thomsen@gmail.com>
+Date: Sat, 1 Mar 2025 14:32:41 +0100
+Subject: [PATCH] libuuu/sdps: fix gcc15 compile errors
+
+This gcc 15 error happens on Fedora 42.
+
+error: uint32_t does not name a type
+
+error: uint64_t does not name a type
+
+Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
+Upstream: https://github.com/nxp-imx/mfgtools/commit/142448e55386b88adf5b1d7e6206df1ca6784708
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+---
+ libuuu/sdps.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libuuu/sdps.h b/libuuu/sdps.h
+index b82f9d71c981..667a477ee48f 100644
+--- a/libuuu/sdps.h
++++ b/libuuu/sdps.h
+@@ -30,6 +30,7 @@
+ */
+ 
+ #include "cmd.h"
++#include <cstdint>
+ 
+ class SDPSCmd : public CmdBase
+ {
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
