Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D19C30653
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 19:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70A1861026;
	Wed,  3 Jul 2024 19:58:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id suilVRxlx4F6; Wed,  3 Jul 2024 19:58:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B1436066D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B1436066D;
	Wed,  3 Jul 2024 19:58:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 783301BF2F6
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 19:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71FEF40531
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 19:58:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0DPDIVAo5Y5e for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 19:58:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C7C06400FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7C06400FE
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C7C06400FE
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 19:58:37 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a6fe61793e2so333864166b.0
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 12:58:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720036715; x=1720641515;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D/PULVwvvkF2drspSjDnVbvIR/Lh5367/5t1wl8HynY=;
 b=ULqnxzFjww89ZG+FhQRuAC+Rg1EiV16obHzrCAMkVkHblbWYxUS3nwK9JJP694czxJ
 HPeNjE7DWpSwsg+ltSux+6Em6zUArhISWJ1fHyeuhBg2JPOnExUcoOsV1dP52wL8SZRg
 Q6tptYmIAZ/wlteO+0BEwxcit4B72w/EeI6Dygma0ghMXHA9bJSEeTeV65S/Y+jN1VQo
 FlMfzl1G5HVL4dL0i77jmj5grc617eP5Hstv+chAv1Ry1a8UJg856zY8+jXPhniDi/vd
 +pOcrNkMAhiQPguGIUTMJt3GdpoQEq2XO4xX7L2igiDw4vtj4ie6q/VxMFTmAf7Bs7yc
 fQDg==
X-Gm-Message-State: AOJu0YzuX/NRDQamypQwxB+loUp0fYHXo1pN3AVGwt2WwyB3bdur0DGP
 Qw77YF99uEtFkOfGM0r8+mmtP4A8T8Sr99YKhAj4J1lhicTE1BEsgKQbrScSTwQ+xX8d8cmuL8q
 1e4s=
X-Google-Smtp-Source: AGHT+IF7OSimiFY+iqijng4+PLJ8XIDtJ9K4a0ITighQsoODj7tO/YagYeBPjxtjkUHIvapexlmC6w==
X-Received: by 2002:a05:6402:2549:b0:57d:42f6:63fe with SMTP id
 4fb4d7f45d1cf-5879f69b504mr11690148a12.22.1720036715618; 
 Wed, 03 Jul 2024 12:58:35 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-30-97-245.retail.telecomitalia.it. [79.30.97.245])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-58d4b19b6eesm929705a12.76.2024.07.03.12.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 12:58:35 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  3 Jul 2024 21:58:32 +0200
Message-ID: <20240703195832.2891159-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720036715; x=1720641515;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=D/PULVwvvkF2drspSjDnVbvIR/Lh5367/5t1wl8HynY=;
 b=p9mr0H0irBbWvPlElds4aXkJjqPqNDaMVOU1Y/dC1jnLxxtKzR6qFZWS5jbn2l1KoQ
 6XNrQyp7MV3N8CUmk1xIFwiG9VxTQHWLT0wYCddmtA6p8VP+y+LvkITckZ2LmuIuCLpY
 Y4AjFPEK7ZEMXdXCr6eQKNU+tGaCyv0ZHRiiQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=p9mr0H0i
Subject: [Buildroot] [PATCH 1/1] package/ncmpc: update the patches to be
 applied with fuzz 0
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, ncmpc fails to build with output:

    Applying 0001-meson.build-add-atomic-dependency-for-sparc.patch using patch:
    patching file meson.build
    Hunk #1 succeeded at 232 (offset 58 lines).
    Hunk #2 FAILED at 355.
    1 out of 2 hunks FAILED -- saving rejects to file meson.build.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .checkpackageignore                              |  1 -
 ...n.build-add-atomic-dependency-for-sparc.patch | 16 +++++++++-------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 9a7a3af757d3..0a1d2627455e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1053,7 +1053,6 @@ package/musl/0001-avoid-kernel-if_ether.h.patch lib_patch.Upstream
 package/musl/0002-package-musl-Make-scheduler-functions-Linux-compatib.patch lib_patch.Upstream
 package/nano/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch lib_patch.Upstream
 package/nanocom/0001-fix-build-with-gcc-10.patch lib_patch.Upstream
-package/ncmpc/0001-meson.build-add-atomic-dependency-for-sparc.patch lib_patch.Upstream
 package/ne10/0001-CMakeLists-don-t-hard-code-thumb-code-generation.patch lib_patch.Upstream
 package/ne10/0002-fix-build-without-C.patch lib_patch.Upstream
 package/neard/S53neard Shellcheck lib_sysv.Indent lib_sysv.Variables
diff --git a/package/ncmpc/0001-meson.build-add-atomic-dependency-for-sparc.patch b/package/ncmpc/0001-meson.build-add-atomic-dependency-for-sparc.patch
index fd2458976053..2b726b743753 100644
--- a/package/ncmpc/0001-meson.build-add-atomic-dependency-for-sparc.patch
+++ b/package/ncmpc/0001-meson.build-add-atomic-dependency-for-sparc.patch
@@ -1,4 +1,4 @@
-From d2bd33ec18c146b27fb5aff7dd0089faa195ef9b Mon Sep 17 00:00:00 2001
+From 72ef4c1c3c11fc05c057f2b40b87de92a573f2eb Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Mon, 11 Feb 2019 21:42:01 +0100
 Subject: [PATCH] meson.build: add atomic dependency for sparc
@@ -11,16 +11,18 @@ Fixes:
  - http://autobuild.buildroot.org/results/7ac1a07e4f72633d3ec92b79dc5d8c062490abdc
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/MusicPlayerDaemon/ncmpc/pull/45]
+Upstream: https://github.com/MusicPlayerDaemon/ncmpc/pull/45
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  meson.build | 4 ++++
  1 file changed, 4 insertions(+)
 
 diff --git a/meson.build b/meson.build
-index 2e6defc..b393e39 100644
+index fa0eff9408b6..819674cbede4 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -174,6 +174,9 @@ else
+@@ -232,6 +232,9 @@ else
    pcre_dep = declare_dependency()
  endif
  
@@ -30,14 +32,14 @@ index 2e6defc..b393e39 100644
  inc = include_directories(
    'src',
  
-@@ -352,6 +355,7 @@ ncmpc = executable('ncmpc',
+@@ -445,6 +448,7 @@ ncmpc = executable('ncmpc',
    sources,
    include_directories: inc,
    dependencies: [
 +    atomic_dep,
      thread_dep,
-     boost_dep,
+     event_dep,
      pcre_dep,
 -- 
-2.14.1
+2.43.0
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
