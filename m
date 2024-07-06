Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEF5C2BD09
	for <buildroot@archiver.kernel.org>; Sat,  6 Jul 2024 10:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2E17409C1;
	Sat,  6 Jul 2024 10:31:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ffl9DUd0lF7J; Sat,  6 Jul 2024 10:31:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 261E040124
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 261E040124;
	Sat,  6 Jul 2024 10:31:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8DF7F1BF2F3
 for <buildroot@lists.busybox.net>; Sat,  6 Jul 2024 10:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AB3084146
 for <buildroot@lists.busybox.net>; Sat,  6 Jul 2024 10:31:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o8bMlyPhWwvF for <buildroot@lists.busybox.net>;
 Sat,  6 Jul 2024 10:31:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4142B81FD3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4142B81FD3
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4142B81FD3
 for <buildroot@buildroot.org>; Sat,  6 Jul 2024 10:31:20 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-52ea5765e75so1802735e87.0
 for <buildroot@buildroot.org>; Sat, 06 Jul 2024 03:31:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720261878; x=1720866678;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0+tlr+6qkpjUrW5RtFISMViQ8xGnt6Er3qk/0nzeLf4=;
 b=sGchF4xf6mzGDDzB2lNlWKQkTYB7DDoDIkDLoPkM8md9d0uqtsfARJX78ecYBUINZ+
 tBwmf+NPRDpInBMh23NEOX52FFkdS/eA9Yzw7baU2XO+1FS793Y3+tDWH2hp2cw5sL1R
 99A649+YREU6YUiqhJveiuoaCUQ2LZV7FXPK8AJQLsO2CmS305NL5OJKpqwXaUEwU70+
 ZJxrrkUNiNrWQtl8CGwIQnh1TYxUHYs0B1ISxDICAFmwdw7yzjQ3RBtRxT/Im0qrHWvS
 SQD13K0pTUp+dcet/45AADTkmde4vzkAmxdyB2OOtnn3Qoa4+wxFoPzHzP7j/03KhRNc
 n/4Q==
X-Gm-Message-State: AOJu0YxVm4PIoOtxd+0St07ChCpw2HqM9Xn2RuQ3gRlgYot6a0xPoHln
 sXSK+P5Or/jwge0XO5huLpyHf9yJyRZEu8TJzvJsh3bzeF/O9klV6fnRDQ4mvFUJ94Jn5XlljZF
 HvOY=
X-Google-Smtp-Source: AGHT+IFvHGToxXoT9UloauyszfEklz6bgoqVe1+1Pv/uDfDjTw9ufwO74wHcHVlVhEpBH85+CcCm+w==
X-Received: by 2002:a05:6512:313b:b0:52c:e040:7d9 with SMTP id
 2adb3069b0e04-52ea06e8479mr4495335e87.59.1720261877292; 
 Sat, 06 Jul 2024 03:31:17 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-30-97-245.retail.telecomitalia.it. [79.30.97.245])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72ab08cec4sm749145166b.152.2024.07.06.03.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jul 2024 03:31:16 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat,  6 Jul 2024 12:31:11 +0200
Message-ID: <20240706103111.3489071-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720261878; x=1720866678;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0+tlr+6qkpjUrW5RtFISMViQ8xGnt6Er3qk/0nzeLf4=;
 b=DyZrpvsaAq7MPdxrpmIKbcg/cC8W27qk97o0dlNWimZzmjbTjO8SPCF6ISwbA42tnj
 2ya5TPJBbLfu35GlXtkCrH+Netv6qjujvHXDJm84g301En1JMU8ja+Dp4H2uilLn/G48
 R50gGFOq2roHOSYsX9fHLip44P22Ooh5yBGzw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=DyZrpvsa
Subject: [Buildroot] [PATCH 1/1] package/janus-gateway: update the patches
 to be applied with fuzz 0
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
Cc: Gregory Dymarek <gregd72002@gmail.com>, linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, janus-gateway fails to build with output:

    Applying 0002-Add-test-for-Wunused-but-set-variable.patch using patch:
    patching file src/Makefile.am
    Hunk #1 succeeded at 132 (offset -19 lines).
    patching file configure.ac
    Hunk #1 succeeded at 12 (offset -1 lines).
    Hunk #2 FAILED at 67.
    1 out of 2 hunks FAILED -- saving rejects to file configure.ac.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .checkpackageignore                            |  1 -
 ...Add-test-for-Wunused-but-set-variable.patch | 18 ++++++++++--------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 0a1d2627455e..9e9c493711e1 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -767,7 +767,6 @@ package/irrlicht/0002-makefile-override-LDFLAGS-and-remove-obsolete-X11R6-.patch
 package/iucode-tool/S00iucode-tool lib_sysv.Variables
 package/iwd/S40iwd Shellcheck lib_sysv.Variables
 package/janus-gateway/0001-disable-ssp.patch lib_patch.Upstream
-package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch lib_patch.Upstream
 package/jose/0001-lib-hsh.c-rename-hsh-local-variable.patch lib_patch.Upstream
 package/jose/0002-man-add-option-to-skip-building-man-pages.patch lib_patch.Upstream
 package/kexec-lite/0001-clean-restart.patch lib_patch.Upstream
diff --git a/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch b/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch
index 31796d6e28ed..4596577af390 100644
--- a/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch
+++ b/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch
@@ -20,8 +20,10 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 Signed-off-by: Adam Duskett <Aduskett@gmail.com>
 [rebased against v1.0.3)
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: rejected
-(https://github.com/meetecho/janus-gateway/pull/1789)]
+Upstream: rejected (https://github.com/meetecho/janus-gateway/pull/1789)
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+
 ---
  Makefile.am                 |  1 +
  configure.ac                |  6 ++-
@@ -30,10 +32,10 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
  create mode 100644 m4/ax_check_compile_flag.m4
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index f961fdb..3ddbe59 100644
+index 96d361e53be0..a8bfd17c930c 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -151,6 +151,7 @@ janus_CFLAGS = \
+@@ -132,6 +132,7 @@ janus_CFLAGS = \
  	-DEVENTDIR=\"$(eventdir)\" \
  	-DLOGGERDIR=\"$(loggerdir)\" \
  	-DCONFDIR=\"$(confdir)\" \
@@ -42,10 +44,10 @@ index f961fdb..3ddbe59 100644
  	$(NULL)
  
 diff --git a/configure.ac b/configure.ac
-index ca17a29..beef91a 100644
+index c37c85b7ab06..5afe0ef0bbff 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -13,6 +13,9 @@ AM_SILENT_RULES([yes])
+@@ -12,6 +12,9 @@ AM_SILENT_RULES([yes])
  AC_USE_SYSTEM_EXTENSIONS
  
  AC_PROG_CC
@@ -55,7 +57,7 @@ index ca17a29..beef91a 100644
  
  LT_PREREQ([2.2])
  LT_INIT
-@@ -64,8 +67,7 @@ clang*)
+@@ -65,8 +68,7 @@ cc*)
  	CFLAGS="$CFLAGS \
  		-Wcast-align \
  		-Wno-override-init \
@@ -64,7 +66,7 @@ index ca17a29..beef91a 100644
 +		-Wunsafe-loop-optimizations"
  esac
  
- JANUS_VERSION=103
+ JANUS_VERSION=1102
 diff --git a/m4/ax_check_compile_flag.m4 b/m4/ax_check_compile_flag.m4
 new file mode 100644
 index 0000000..51df0c0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
