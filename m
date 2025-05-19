Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3294C3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 14:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53BC8404A7;
	Mon, 19 May 2025 14:01:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6U9XCD2_PS_6; Mon, 19 May 2025 14:01:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F73B404A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F73B404A9;
	Mon, 19 May 2025 14:01:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E989FD4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 14:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5CE1404A9
 for <buildroot@buildroot.org>; Mon, 19 May 2025 14:00:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rlM9E9a5j2Wo for <buildroot@buildroot.org>;
 Mon, 19 May 2025 14:00:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 760F8404A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 760F8404A7
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 760F8404A7
 for <buildroot@buildroot.org>; Mon, 19 May 2025 14:00:57 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-601a6e2e93cso242800a12.1
 for <buildroot@buildroot.org>; Mon, 19 May 2025 07:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747663255; x=1748268055;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PIdYcU4CGTsfDTdoQIclpuNHfSbDdJsLls9mZ/aBmEw=;
 b=PEquWCT/0SZ1k6nF06J/TBsya2Wyw262mtwzeqV51Cij7+nmeM4g2BqCPYetwM5Oxe
 8CNsb5bZma1qDUAxG7fj08fuCbMWjMuMotkkCXqcR5f7dihycciFbA5/3kNPkzoDrQZ8
 k3Esa0LERk7DlSKAovEeQDqe0orLx1G9DJJLowc5FwoaJa/hwzlS3kW66CvaOzufgTo3
 Afl4gck7cl/Z7xlhrm0pNVeUtUiHyjoGCk2CADYAbzmlIjdQ7eyX0LAr3d2K20hGA8tz
 VlbEB5QVP7fYs0AuaKOQJzGR/Dbtx/sX6se39ocXdBRJfTyT+rEb4yRmtrcFaFAzKgl1
 lz9g==
X-Gm-Message-State: AOJu0Yxn++oR9VHN+eNuRx9zqa7S+KLvUbvZ7q/xFxiaPcQ87jPfjLqH
 YPMlwr6wTBC6sx09/KiNnB+uEQETho9m/oU1MeYygBNYmDtt95ZxmuwNvJyEBZTLFc5toBaAtRe
 eMEExnGo=
X-Gm-Gg: ASbGnctp58FeSTwMCGqqJDGhDnvcKDEjLg+ErYCECGYCEGwTMTdoHWD9DSb35EA81ud
 y1D40z/4eW6P+s6c6vhS7wWs33t3awsXa/v8sRAN4B0Ihw+HXW8HOuMEilezACmN17mHS583+Mp
 HNQSTIXAxVJX5wN6kQjnUpoAJrgBbzwqOD9mu2wgev10momno/RcP6T5Ac2r5HZwDvXpHMAzCLL
 MqFOFoT9qARm4Y5ZDImWbcxI+uQgsWne58UkW/6jBydZSUQglX6W75aYjCmZ1tQVznlTCBfTqah
 Kfv9OKI1OWl5VkzLIRjPdppZLt+u1nFf6yGPu0F/OWOnJ85W/7nRmOgPR1Qlj/llFtVwGgZ/0bw
 5yPnQbms=
X-Google-Smtp-Source: AGHT+IFxnWIwXiYBzLqpiuYm7bl/KPETjLEeeeg6NbVDWPlcpdYFd90w8/JHEv3vHqbNjQJ2530meQ==
X-Received: by 2002:a05:6402:50cb:b0:5ff:f205:e3dc with SMTP id
 4fb4d7f45d1cf-5fff205ea83mr13213594a12.15.1747663253846; 
 Mon, 19 May 2025 07:00:53 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005ac35e19sm5785301a12.53.2025.05.19.07.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 07:00:53 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>, thomas.perale@mind.be
Date: Mon, 19 May 2025 16:00:42 +0200
Message-ID: <20250519140042.4019332-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1747663255; x=1748268055; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PIdYcU4CGTsfDTdoQIclpuNHfSbDdJsLls9mZ/aBmEw=;
 b=NdR6TUwZiJzAci49e5R0/5s/DFVTQdkts0i4bGsg0AKNoDitopmU9UXH9ZLT59cc9P
 emOQONl/7LYgbzWIF0KcNlMWSE5l32WYl52Dfij+piz4010g8I3XL4UO49J24ZMSpNc5
 X79hzNS2bv20nMe9GmUBz2AM0ErabvokVLJSH/+vhGSzzVPZL8vzMCo9W62xCCJwYiCa
 9mnHKqLY8QdB9auSKh3OS3uZnWG9o5Xnz65hqeganC5NaO78m/YrHzbg4Mhea6p+MYYh
 KBbAc6M7raR2dfChFmds8G5wRURPwf+nmirznIxIwNh83OSc/X2sCaTwdCvgXe5woihK
 oswQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=NdR6TUwZ
Subject: [Buildroot] [PATCH] package/binutils: apply security patch for
 CVE-2025-3198
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes a memory leaks that affects both binutils 2.43 and 2.44,
see https://www.cve.org/CVERecord?id=CVE-2025-3198

Fixes the following CVE:
- CVE-2025-3198: A vulnerability has been found in GNU Binutils 2.43/2.44
                 and classified as problematic. Affected by this
                 vulnerability is the function display_info of the file
                 binutils/bucomm.c of the component objdump.
                 The manipulation leads to memory leak.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 .../2.43.1/0003-objdump-memleak.patch         | 31 +++++++++++++++++++
 .../binutils/2.44/0003-objdump-memleak.patch  | 31 +++++++++++++++++++
 package/binutils/binutils.mk                  |  3 ++
 3 files changed, 65 insertions(+)
 create mode 100644 package/binutils/2.43.1/0003-objdump-memleak.patch
 create mode 100644 package/binutils/2.44/0003-objdump-memleak.patch

diff --git a/package/binutils/2.43.1/0003-objdump-memleak.patch b/package/binutils/2.43.1/0003-objdump-memleak.patch
new file mode 100644
index 0000000000..1b1632093d
--- /dev/null
+++ b/package/binutils/2.43.1/0003-objdump-memleak.patch
@@ -0,0 +1,31 @@
+From ba6ad3a18cb26b79e0e3b84c39f707535bbc344d Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Wed, 19 Feb 2025 07:58:54 +1030
+Subject: [PATCH] PR32716, objdump -i memory leak
+
+PR binutils/32716
+* bucomm.c (display_info): Free arg.info.
+
+Upstream: https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=ba6ad3a18cb26b79e0e3b84c39f707535bbc344d
+
+CVE: CVE-2025-3198
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ binutils/bucomm.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/binutils/bucomm.c b/binutils/bucomm.c
+index ccf54099154..d4554737db1 100644
+--- a/binutils/bucomm.c
++++ b/binutils/bucomm.c
+@@ -435,6 +435,7 @@ display_info (void)
+   if (!arg.error)
+     display_target_tables (&arg);
+ 
++  free (arg.info);
+   return arg.error;
+ }
+ 
+-- 
+2.43.5
+
diff --git a/package/binutils/2.44/0003-objdump-memleak.patch b/package/binutils/2.44/0003-objdump-memleak.patch
new file mode 100644
index 0000000000..1b1632093d
--- /dev/null
+++ b/package/binutils/2.44/0003-objdump-memleak.patch
@@ -0,0 +1,31 @@
+From ba6ad3a18cb26b79e0e3b84c39f707535bbc344d Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Wed, 19 Feb 2025 07:58:54 +1030
+Subject: [PATCH] PR32716, objdump -i memory leak
+
+PR binutils/32716
+* bucomm.c (display_info): Free arg.info.
+
+Upstream: https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=ba6ad3a18cb26b79e0e3b84c39f707535bbc344d
+
+CVE: CVE-2025-3198
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ binutils/bucomm.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/binutils/bucomm.c b/binutils/bucomm.c
+index ccf54099154..d4554737db1 100644
+--- a/binutils/bucomm.c
++++ b/binutils/bucomm.c
+@@ -435,6 +435,7 @@ display_info (void)
+   if (!arg.error)
+     display_target_tables (&arg);
+ 
++  free (arg.info);
+   return arg.error;
+ }
+ 
+-- 
+2.43.5
+
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index fd6fc3de8d..2b5064d739 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -31,6 +31,9 @@ BINUTILS_LICENSE = GPL-3.0+, libiberty LGPL-2.1+
 BINUTILS_LICENSE_FILES = COPYING3 COPYING.LIB
 BINUTILS_CPE_ID_VENDOR = gnu
 
+# 0003-objdump-memleak.patch
+BINUTILS_IGNORE_CVES += CVE-2025-3198
+
 ifeq ($(BINUTILS_FROM_GIT),y)
 BINUTILS_DEPENDENCIES += host-flex host-bison
 HOST_BINUTILS_DEPENDENCIES += host-flex host-bison
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
