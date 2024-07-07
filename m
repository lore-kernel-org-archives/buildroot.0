Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82EC3C30653
	for <buildroot@archiver.kernel.org>; Sun,  7 Jul 2024 16:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8F6A8176E;
	Sun,  7 Jul 2024 16:22:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MeLuXMM5q5ES; Sun,  7 Jul 2024 16:22:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40C058176B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40C058176B;
	Sun,  7 Jul 2024 16:22:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7BA691BF3D7
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 16:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6924C608BF
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 16:21:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RaxwaNE2_Dck for <buildroot@lists.busybox.net>;
 Sun,  7 Jul 2024 16:21:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 53B1760856
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53B1760856
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 53B1760856
 for <buildroot@buildroot.org>; Sun,  7 Jul 2024 16:21:58 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52e9b9fb3dcso3784856e87.1
 for <buildroot@buildroot.org>; Sun, 07 Jul 2024 09:21:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720369316; x=1720974116;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QAIxgnTTHEDwnHLlQS3tBelM0zoGI9JWQq8TwJhCrEE=;
 b=Nq/wAsPSB8VxdkUZSkp2nXU6XNMyKu7d6q/Km7y7TRIpn7TlrTQU9w2Fd2SpkUmHKz
 5fKhHlCBRhMmbStFZCCpttIXYg3A8T/Gc+47FNdvM2J9WBy7ue0cBt+4cEyQ6o+ncdx+
 RkkwpHoHj/q0qkhmpmuNjjv1Kuh0mn1mCUxo2/AZX0b9t4LetvRdxt+lT3Qn2jVMRcI+
 Z6k4OdFaVw05H1ASJRAUTU/Zoi4bnegcHRTt12ypKuavqmlnYkILTFW4Kd+9/UfI+sx7
 ME4y78/yhGr6vdjM65YzUoeIoEiV+kN5yfAnFfIi99rR3sBQnVwe+9STvLz62ZfAm9mF
 zlCw==
X-Gm-Message-State: AOJu0YzR8R2VlAfvyn6kCG7mMmDCx5+h5LwdnhelwNq46rrLdx0mclst
 kPyKDTN+sGnRRicVuCRAINQ48ttuJqFM6LVChN2Rp35kz2wHRJNkYl7EMG5WurJZGsxceZ9aaOq
 eo9E=
X-Google-Smtp-Source: AGHT+IGTj29vMi6+d1bBKwqQs7k8cQ7tc6yOiT85RqmFTVdUsE1iNCzpRL9dUAOWIvDqjlYd/DK2Jw==
X-Received: by 2002:a05:6512:ac3:b0:52b:b327:9c1c with SMTP id
 2adb3069b0e04-52ea06e92b9mr8017291e87.62.1720369315382; 
 Sun, 07 Jul 2024 09:21:55 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-30-97-245.retail.telecomitalia.it. [79.30.97.245])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a77ccee5277sm228472466b.177.2024.07.07.09.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jul 2024 09:21:55 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jul 2024 18:21:49 +0200
Message-ID: <20240707162149.302187-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720369316; x=1720974116;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QAIxgnTTHEDwnHLlQS3tBelM0zoGI9JWQq8TwJhCrEE=;
 b=ODixfgKsljB7MLXfMUcj3/W1dxjbssK/zw6N/So5y25ooI3NGRjgQrgrIPw09ogOZg
 ag3m5yYhxzMnn0uoS3oq/bv3bYMxm8sUFm327pstvxMmyJgjwajC11b53gdZF4qagn/O
 3QVr8Knf60nqsMxUPlsO2+k3GEuY0UkNHWtjw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ODixfgKs
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-tdfx: fix
 patch fuzz
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
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, xdriver_xf86-video-tdfx fails to build with output:

    Applying 0001-cross.patch using patch:
    patching file configure.ac
    Hunk #1 FAILED at 67.
    1 out of 1 hunk FAILED -- saving rejects to file configure.ac.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .checkpackageignore                                    | 2 +-
 package/x11r7/xdriver_xf86-video-tdfx/0001-cross.patch | 8 +++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 0a1d2627455e..e0c406e56592 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1560,7 +1560,7 @@ package/x11r7/xdriver_xf86-video-imx/0005-xf86-video-imxfb-fix-m4-hardcodded-pat
 package/x11r7/xdriver_xf86-video-imx/0006-xserver-1.14-compat.patch lib_patch.Upstream
 package/x11r7/xdriver_xf86-video-mach64/0001-cross-compile.patch lib_patch.Sob lib_patch.Upstream
 package/x11r7/xdriver_xf86-video-nouveau/0001-nouveau-fixup-driver-for-new-X-server-ABI.patch lib_patch.Upstream
-package/x11r7/xdriver_xf86-video-tdfx/0001-cross.patch lib_patch.Sob lib_patch.Upstream
+package/x11r7/xdriver_xf86-video-tdfx/0001-cross.patch lib_patch.Upstream
 package/x11r7/xserver_xorg-server/0001-include-misc.h-fix-uClibc-build.patch lib_patch.Upstream
 package/x11r7/xserver_xorg-server/S40xorg Shellcheck lib_sysv.Variables
 package/x11vnc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch lib_patch.Upstream
diff --git a/package/x11r7/xdriver_xf86-video-tdfx/0001-cross.patch b/package/x11r7/xdriver_xf86-video-tdfx/0001-cross.patch
index e53591bb0bc2..f9880afb5478 100644
--- a/package/x11r7/xdriver_xf86-video-tdfx/0001-cross.patch
+++ b/package/x11r7/xdriver_xf86-video-tdfx/0001-cross.patch
@@ -1,8 +1,10 @@
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 --- xf86-video-tdfx-1.3.0/configure.ac.orig	2007-06-10 21:01:54.000000000 +0200
 +++ xf86-video-tdfx-1.3.0/configure.ac	2007-06-10 21:02:06.000000000 +0200
-@@ -67,13 +67,20 @@
- # Checks for header files.
- AC_HEADER_STDC
+@@ -75,13 +75,20 @@
+ 	      [#include "xorg-server.h"])
+ CPPFLAGS="$SAVE_CPPFLAGS"
  
 -if test "$DRI" != no; then
 +if test "x$DRI" != xno; then
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
