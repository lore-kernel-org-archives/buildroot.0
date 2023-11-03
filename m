Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EE1C4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 19:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7B8841904;
	Fri,  3 Nov 2023 19:08:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7B8841904
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HqtaeNuIjIi7; Fri,  3 Nov 2023 19:08:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF3F241901;
	Fri,  3 Nov 2023 19:08:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF3F241901
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C8EA91BF33D
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 19:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C0C140232
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 19:08:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C0C140232
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3RMq_ifHVCwD for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 19:08:23 +0000 (UTC)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 14D1A4011B
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 19:08:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14D1A4011B
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-32f78dcf036so2144588f8f.0
 for <buildroot@buildroot.org>; Fri, 03 Nov 2023 12:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699038500; x=1699643300;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AOFeMVSoDD0mshaH2hR2cVpLm4GU4iPlZZGxE3yJQQE=;
 b=AHOhUbhglX+0abZtv0GA9se0Rxsb6lgBKaq5ThNxFIBlLKzNrX22tXm5bWURm1Nt2p
 mNiVTvSwxnk3SIfS1vzsVK2l6A9Al7/8/+Fh1FBwzoHOT4gVfq6T8Pbp8n2P2+PH80Sv
 kN/8Zh2OTbZUBJP87/t0ZfKY50H14QXQ4b8AVJfO4t2Y55D1DjRKQrf7PlffiiyKj/RY
 UzBkaTgwqYuZda8ypfsmUHdWxbSMkuUh5HyuBaAd6rolCmlTfP8IS+w+BGn77ZQl7O51
 eEchwNk/atequioALDUVLiV+MjiXccspI6y4c3JRPsiClP1a6q1BHKX+F9Do1sL4zMwf
 aKIg==
X-Gm-Message-State: AOJu0YzCDQdgsLW/ZG+1t3r79EuGH7RKexfgN+nzdTeDmHKllRKUcIVj
 DesdYiJngI4DdNcIfu+CpW81wx8gbBk=
X-Google-Smtp-Source: AGHT+IHEHrf2nVG8MSIi6QzfZwpA0XWlo3V38SXUeUMr34kVE2PzCeJtNDSwYb/51oCshDiJioqa7w==
X-Received: by 2002:adf:ed4f:0:b0:32d:a366:7073 with SMTP id
 u15-20020adfed4f000000b0032da3667073mr3755577wro.14.1699038500050; 
 Fri, 03 Nov 2023 12:08:20 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 g4-20020a05600c310400b004068e09a70bsm3365152wmo.31.2023.11.03.12.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 12:08:19 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 Nov 2023 20:08:12 +0100
Message-ID: <20231103190812.2484268-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699038500; x=1699643300; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AOFeMVSoDD0mshaH2hR2cVpLm4GU4iPlZZGxE3yJQQE=;
 b=Jo4TIpAASqJ3Hu+qlfEaxAVZW35FnjdKXuxVlWmAxUzG035vrv+ctD0kAeHtJ6kUra
 poR+V68xd+7ZXAEojSmkDS8TCPLCYQNXGurjgF16Ip75Nny8usWML7/QMERhELRFJkZP
 AKYJM9bqSWaHF9S4Vgsc63GMVyi5ATaCQ+bQ70G+SgSPhy1rl76eLolUu7KcnfeqVpWv
 +jlmDD1up5bxyJ0VH79hwKfCpIgbGzyezHuPtlxkandfTsyBy7h+b7zVwtNFhPXlq5is
 TcPRrdI+IHUE9irpJvlQEiHnFcoc7+EalMvW/Vl4h+z5WD71qFIg225qqQZrlMrYsmRM
 OItw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Jo4TIpAA
Subject: [Buildroot] [PATCH 1/1] package/brltty: bump to version 6.6
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
Cc: Mario Lang <mlang@blind.guru>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop second patch (already in version)
- Update hash of README (DotPadd added with
  https://github.com/brltty/brltty/commit/5a9288c6bc3226201146aaafed4885f2bb277739
  and year updated with
  https://github.com/brltty/brltty/commit/f21f2199162012a74398afb1265d458933a19291
  https://github.com/brltty/brltty/commit/68589179695e129ab2b0972071a93b2233115df6)
- This bump will fix the following build failure raised since bump of
  gettext-gnu to version 0.22 in commit f6a6e3a8363a32e5443c9eadc2ee047853640d1a
  thanks to
  https://github.com/brltty/brltty/commit/31061173fd80c7ed0f83e8d20d62c59dbedcebe0:

/home/thomas/autobuild/instance-2/output-1/host/bin/msgfmt --output-file zh.mo -- ./zh.po
/home/thomas/autobuild/instance-2/output-1/host/bin/msgfmt: input file doesn't contain a header entry with a charset specification
make[3]: *** [Makefile:86: ru.mo] Error 1

https://github.com/brltty/brltty/blob/BRLTTY-6.6/Documents/ChangeLog

Fixes:
 - http://autobuild.buildroot.org/results/29f5ef8a52db4dd717fbaf1ade9d250dfcebe6ff

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  1 -
 ...unProgramTerminationCommands-used-a-.patch | 29 -------------------
 package/brltty/brltty.hash                    |  4 +--
 package/brltty/brltty.mk                      |  2 +-
 4 files changed, 3 insertions(+), 33 deletions(-)
 delete mode 100644 package/brltty/0002-shell-prologue-runProgramTerminationCommands-used-a-.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 18acf0bba2..1fda294145 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -217,7 +217,6 @@ package/botan/0002-src-build-data-arch-superh.txt-add-sh4-eb-aeb.patch Upstream
 package/brickd/S70brickd Indent Shellcheck Variables
 package/bridge-utils/0001-fix-build-on-musl.patch Upstream
 package/brltty/0001-Fix-linking-error-on-mips64el.patch Upstream
-package/brltty/0002-shell-prologue-runProgramTerminationCommands-used-a-.patch Upstream
 package/brltty/S10brltty Indent Shellcheck Variables
 package/bsdiff/0001-Add-missing-header-for-u_char.patch Upstream
 package/bustle/0001-Makefile-fix-pcap-config-call.patch Upstream
diff --git a/package/brltty/0002-shell-prologue-runProgramTerminationCommands-used-a-.patch b/package/brltty/0002-shell-prologue-runProgramTerminationCommands-used-a-.patch
deleted file mode 100644
index 0f81254e08..0000000000
--- a/package/brltty/0002-shell-prologue-runProgramTerminationCommands-used-a-.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 4503c2cbd3981ba1b50ec7ce287ab48c772b3a7f Mon Sep 17 00:00:00 2001
-From: Dave Mielke <Dave@Mielke.cc>
-Date: Sat, 15 Oct 2022 15:20:38 -0400
-Subject: [PATCH] shell prologue: runProgramTerminationCommands used a bash
- command. (dm)
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1@gmail.com: backport from upstream commit
-4503c2cbd3981ba1b50ec7ce287ab48c772b3a7f]
----
- brltty-prologue.sh | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/brltty-prologue.sh b/brltty-prologue.sh
-index 05b817742..6d1faf983 100644
---- a/brltty-prologue.sh
-+++ b/brltty-prologue.sh
-@@ -102,7 +102,7 @@ runProgramTerminationCommands() {
-    while [ "${programTerminationCommandCount}" -gt 0 ]
-    do
-       set -- $(getVariable "programTerminationCommand${programTerminationCommandCount}")
--      let "programTerminationCommandCount -= 1"
-+      programTerminationCommandCount=$((programTerminationCommandCount - 1))
- 
-       local process="${1}"
-       local directory="${2}"
--- 
-2.34.1
-
diff --git a/package/brltty/brltty.hash b/package/brltty/brltty.hash
index 9fc63714bc..9b707fc1c2 100644
--- a/package/brltty/brltty.hash
+++ b/package/brltty/brltty.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  2f173535291ba39b5a9fc8d80c349234333d92042d95d6dd88796c98a02f316b  brltty-6.5.tar.xz
+sha256  ab11cfc5fbd7ef0ec876ffea7e131e424b2fd004b6158064e1a2e46412825529  brltty-6.6.tar.xz
 sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  LICENSE-LGPL
-sha256  c00c876cb4581a6b54fcc176f7e694896e5b52c4b015615566a787e8bc89fe69  README
+sha256  72740317768530c60046c591160d4552afb3ac49657b04c7b8452c1bbe7b834e  README
diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index dc5a38cddb..f00a18cc6f 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BRLTTY_VERSION = 6.5
+BRLTTY_VERSION = 6.6
 BRLTTY_SOURCE = brltty-$(BRLTTY_VERSION).tar.xz
 BRLTTY_SITE = http://brltty.com/archive
 BRLTTY_INSTALL_STAGING_OPTS = INSTALL_ROOT=$(STAGING_DIR) install
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
