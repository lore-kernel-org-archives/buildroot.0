Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3706AC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 12:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2ABA80B64;
	Tue, 23 Jul 2024 12:31:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yyXPr0Md36bv; Tue, 23 Jul 2024 12:31:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4F4580B8E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4F4580B8E;
	Tue, 23 Jul 2024 12:31:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E8DC11BF83C
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 12:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E255140374
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 12:31:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sUnF4ROSsxmY for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 12:31:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 34E594035D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34E594035D
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34E594035D
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 12:31:51 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2eeb1ba040aso78605631fa.1
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 05:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721737908; x=1722342708;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hrz/C/p4+k3lcMStkXzbFfK9cbJn/8fJ53LBv+csnso=;
 b=NDqXwYcUNLPaqWmvPtsxMKuq98/TthxSDH/KulDB0hLyWFYR/vCXx5v2SD9Jdd5k7u
 mYyzaUrE15xTCOVowCCJzlFQFeALYIby4JV8qRNZs9IL3j0eocgLnxy0M431AQJOFn/+
 OBSoRnHegHepTdeWsFkQ+PIH/ypzzWa6UXnD3sy6H0LNv7xQ53CbNk3mHAKhcoAHWSxx
 /y441yrAunc1rgkDimElgNqYkae3EMR3kaTdLUO9sDuTiVljP5RpMSsFQnaWV/wuAZ93
 j5LYGssj1dA9alEDFKpqN/8gcaYYIVbPkGOb9Ez77lyYgnKYLgst7NST/WVXGMq9W/1i
 IxUQ==
X-Gm-Message-State: AOJu0YxZGhS4mLsXVu2bzGBfSXPpMfDUrNi0jP9pmWIjyqaJI9VBWl8U
 m6mnL/jJ7dUecgDxWlCYfKyfvbbxcExMzQ+ntFWEck6mbeca1PnX0BWdRQ==
X-Google-Smtp-Source: AGHT+IHt2proH60KA8W2i/6HonaSljEHu9K2AOUdEdofYegUoQJPwwHht5dCzsOsPyP60WlwY57zGQ==
X-Received: by 2002:a2e:7303:0:b0:2ef:564c:9b6b with SMTP id
 38308e7fff4ca-2f01ea67974mr19298721fa.23.1721737908166; 
 Tue, 23 Jul 2024 05:31:48 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3687868b5fdsm11355175f8f.38.2024.07.23.05.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 05:31:47 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 14:31:45 +0200
Message-ID: <20240723123145.463136-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721737908; x=1722342708; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Hrz/C/p4+k3lcMStkXzbFfK9cbJn/8fJ53LBv+csnso=;
 b=maTgo/lSu9pQdFPLI561TuQ+DDjfrG/ZeIuQLBQO55XpQEq3sonkmzFA1QMUV8gChQ
 8lM9/arFm4R08ebPNMSWlBkKfkROeSlRHJ1XtwjtP91UqV2mzgV3srwXsCL0mqRgRpNl
 4IOqoC3AoWVbn7LkLtoqQ/MrN5+DejOg4NiAPNEw+Mi8o6bvCOC32Txy08si8Li5QceI
 BxJqeVr/GalxkrwCgYnu6Jvuj1bZHGZ09LvZrWO3dR0UqP0RdGE07UahZNcxCs6Cg/BU
 3dNOEWerZ7JHDTktELuiCNCDpVUU8gpQ32abPnTG3+gXNCPZOpGNBAAOhvbu4t8SD4MJ
 BaXA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=maTgo/lS
Subject: [Buildroot] [PATCH 1/1] package/quotatool: bump to version 1.6.4
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Switch site to get latest release
- Send patch upstream
- This bump will fix the following build failure with gcc >= 14:

  src/main.c: In function 'main':
  src/main.c:211:17: error: implicit declaration of function 'quota_reset_grace'; did you mean 'xfs_reset_grace'? [-Wimplicit-function-declaration]
    211 |           if (! quota_reset_grace(quota, (argdata->block_reset ? GRACE_BLOCK : GRACE_INODE)))
        |                 ^~~~~~~~~~~~~~~~~
        |                 xfs_reset_grace

https://github.com/ekenberg/quotatool/blob/v1.6.4/ChangeLog

Fixes:
 - http://autobuild.buildroot.org/results/1855bc61fb231fadab77840dcd7ef75c414fe5be

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                                           | 1 -
 .../0001-fix-missing-__P-definition-for-musl-compile.patch    | 1 +
 package/quotatool/quotatool.hash                              | 2 +-
 package/quotatool/quotatool.mk                                | 4 ++--
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 2fbd51c6a6..baa4d20d73 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1184,7 +1184,6 @@ package/qt5cinex/0001-Fix-execution-problem-with-Qt5.3.patch lib_patch.Upstream
 package/quagga/0001-fix-ipctl-forwarding.patch lib_patch.Upstream
 package/quagga/0002-lib-prefix.h-fix-build-with-gcc-10.patch lib_patch.Upstream
 package/quagga/0003-Fix-build-with-gcc-10.patch lib_patch.Upstream
-package/quotatool/0001-fix-missing-__P-definition-for-musl-compile.patch lib_patch.Upstream
 package/racehound/0001-Fix-module-install-path-lib-instead-of-usr-lib-prefi.patch lib_patch.Upstream
 package/rapidxml/0001-ensure-internal-print-operations-are-declared-before.patch lib_patch.Upstream
 package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch lib_patch.Upstream
diff --git a/package/quotatool/0001-fix-missing-__P-definition-for-musl-compile.patch b/package/quotatool/0001-fix-missing-__P-definition-for-musl-compile.patch
index 927e62ba8c..534c7fe945 100644
--- a/package/quotatool/0001-fix-missing-__P-definition-for-musl-compile.patch
+++ b/package/quotatool/0001-fix-missing-__P-definition-for-musl-compile.patch
@@ -15,6 +15,7 @@ Fixes:
                  ^~~
 
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+Upstream: https://github.com/ekenberg/quotatool/pull/28
 ---
  src/linux/linux_quota.h | 1 +
  1 file changed, 1 insertion(+)
diff --git a/package/quotatool/quotatool.hash b/package/quotatool/quotatool.hash
index d41fd4ed1b..9ce9ceaec1 100644
--- a/package/quotatool/quotatool.hash
+++ b/package/quotatool/quotatool.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  e53adc480d54ae873d160dc0e88d78095f95d9131e528749fd982245513ea090  quotatool-1.6.2.tar.gz
+sha256  ef6b0494c505278ae140d1e105417d73703b4b9e08a1ee1f95dca1e0c19497b7  quotatool-1.6.4.tar.gz
 
 # Hash for license files:
 sha256  94686eeb98a40edc64106c6f8644068d8a08816a510a3cde75e50f1bf470564d  COPYING
diff --git a/package/quotatool/quotatool.mk b/package/quotatool/quotatool.mk
index 7b63c01316..5a60ff7bc1 100644
--- a/package/quotatool/quotatool.mk
+++ b/package/quotatool/quotatool.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-QUOTATOOL_VERSION = 1.6.2
-QUOTATOOL_SITE = http://quotatool.ekenberg.se
+QUOTATOOL_VERSION = 1.6.4
+QUOTATOOL_SITE = $(call github,ekenberg,quotatool,v$(QUOTATOOL_VERSION))
 QUOTATOOL_LICENSE = GPL-2.0
 QUOTATOOL_LICENSE_FILES = COPYING
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
