Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F0DC30658
	for <buildroot@archiver.kernel.org>; Fri,  5 Jul 2024 10:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6788960EB7;
	Fri,  5 Jul 2024 10:22:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AYWuLFY8iRbx; Fri,  5 Jul 2024 10:22:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A84B60EBC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A84B60EBC;
	Fri,  5 Jul 2024 10:22:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9CC8F1BF289
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 10:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8938A4093B
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 10:22:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tqko5CPM3k1d for <buildroot@lists.busybox.net>;
 Fri,  5 Jul 2024 10:22:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B77FD4093A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B77FD4093A
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B77FD4093A
 for <buildroot@buildroot.org>; Fri,  5 Jul 2024 10:22:31 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-58b966b41fbso2070277a12.1
 for <buildroot@buildroot.org>; Fri, 05 Jul 2024 03:22:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720174949; x=1720779749;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0PCGox3oJyJkRkJDI3+GgnIM2gNYiq19akQZM3JpCME=;
 b=nLdjw39mI7qo2nfb7FTiQLwDIfGz0Iu4x8pk3VzC5BVRC4fT3LSyjMr0YNyFtHeYr+
 8dW6GKLrbjGOa/BwUtyCjNYvEU0EXJp1GsR/o6cJdZxTMVEJeV9IolYCPgMh6dteBkEi
 b0myl18Ld+BV5RFABbHBmDIVKYwaK2wBFos12jafk+B84g7IuOBBXUNYoXG9yvhybEBl
 RrNgLp2p3amTOgUbAGf893p8sSr0jQBTJi8/1QjJYZOAhNd8K3aBkKpvzW7BHH7FDWPH
 2h1wz9i8XvwjO9KLQypRzUUiwARYITa5qPzcTiwT+TUaR2twSK0X7C661jjJsiZKm/Xa
 Fl5g==
X-Gm-Message-State: AOJu0YziiwWrPz2qNaJdtuCxsFV7+5PmKUJO2Efx4/sKcaTv0oFgv9Co
 ZsaaqP9BezkEN+ckkjQ5HRfr7n9AMUTuZxQbYU161y9cpAWkIB7+X6JYbtuSdrqXEmebGK4aiYB
 GnhQ=
X-Google-Smtp-Source: AGHT+IFeesEiob1/wiq9VsO/B2BLtLZQKWssbFntSfSNnMrFKJ/dQ9HvnZ5SoWNDp2a+wdvGVsc7fg==
X-Received: by 2002:a05:6402:2106:b0:57c:60f0:98bc with SMTP id
 4fb4d7f45d1cf-58e5965d15amr3524633a12.11.1720174949185; 
 Fri, 05 Jul 2024 03:22:29 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i..
 ([2001:b07:6474:ebbf:f8c9:214d:f5ce:3e55])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-58ec828b34asm1491913a12.15.2024.07.05.03.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 03:22:28 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  5 Jul 2024 12:22:25 +0200
Message-ID: <20240705102226.3283175-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720174949; x=1720779749;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0PCGox3oJyJkRkJDI3+GgnIM2gNYiq19akQZM3JpCME=;
 b=Sin+Crx8O02Rez8Hm3jPTDCSvZPS5d3y1rcTWvbmh7VR1Xi0hydYnDF+HhzI0XNBCB
 ROAlUF4hwnVBLCprGERFeQe1GjlAmAjO9w5qqRQH7Y4fmHblmvt2QohpSaobATapodxi
 jfAO01BE9N4/yqQhiu4OKv6dkI4GATmYKxZSw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Sin+Crx8
Subject: [Buildroot] [PATCH 1/1] package/udpcast: update the patches to be
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
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, udpcast fails to build with output:

    Applying 0001-fix-musl-build.patch using patch:
    patching file receivedata.c
    Hunk #1 FAILED at 1.
    1 out of 1 hunk FAILED -- saving rejects to file receivedata.c.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .checkpackageignore                       | 1 -
 package/udpcast/0001-fix-musl-build.patch | 7 ++++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 0a1d2627455e..a0480550b9e6 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1456,7 +1456,6 @@ package/uboot-tools/0001-drop-configh-from-tools.patch lib_patch.Upstream
 package/uboot-tools/0002-tools-only-in-no-dot-config-targets.patch lib_patch.Upstream
 package/uboot-tools/0003-tools-Makefile-fix-C-LD-FLAGS-with-CROSS_BUILD_TOOLS.patch lib_patch.Upstream
 package/ubus/0001-Install-server-and-client-examples.patch lib_patch.Upstream
-package/udpcast/0001-fix-musl-build.patch lib_patch.Upstream
 package/uemacs/01-clear-ixon-termios-flag.patch lib_patch.Upstream
 package/uhd/0001-host-CMakeLists-add-boost-unit_test_framework-requir.patch lib_patch.Upstream
 package/uhttpd/0001-Remove-Werror.patch lib_patch.Upstream
diff --git a/package/udpcast/0001-fix-musl-build.patch b/package/udpcast/0001-fix-musl-build.patch
index 0e213b279344..e24f3e9e940b 100644
--- a/package/udpcast/0001-fix-musl-build.patch
+++ b/package/udpcast/0001-fix-musl-build.patch
@@ -15,8 +15,9 @@ Fixes:
  - http://autobuild.buildroot.org/results/30208c6f175967fed6de690447a09e0c86547b24
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://udpcast.linux.lu/mailman3/hyperkitty/list/udpcast@udpcast.linux.lu/thread/4MBES2CPUSUNIZTC7NXCQYS2GAE4DQSG/]
+Upstream: https://udpcast.linux.lu/mailman3/hyperkitty/list/udpcast@udpcast.linux.lu/thread/4MBES2CPUSUNIZTC7NXCQYS2GAE4DQSG/
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 
 diff '--color=auto' -Nura udpcast-20211207.orig/receivedata.c udpcast-20211207/receivedata.c
 --- udpcast-20211207.orig/receivedata.c	2022-08-13 21:48:06.226588614 +0200
@@ -27,5 +28,5 @@ diff '--color=auto' -Nura udpcast-20211207.orig/receivedata.c udpcast-20211207/r
  #include <unistd.h>
 +#include <stddef.h>
  #include <stdlib.h>
- #include <sys/time.h>
  #include <errno.h>
+ 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
