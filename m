Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3881FC4167B
	for <buildroot@archiver.kernel.org>; Tue, 28 Nov 2023 19:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C44A5417A0;
	Tue, 28 Nov 2023 19:47:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C44A5417A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pek6pek51u8L; Tue, 28 Nov 2023 19:47:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18A224179D;
	Tue, 28 Nov 2023 19:46:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18A224179D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 82E1B1BF311
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 19:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B8D660C24
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 19:46:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B8D660C24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sWlRpCEhcsDL for <buildroot@lists.busybox.net>;
 Tue, 28 Nov 2023 19:46:56 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 06AF960C02
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 19:46:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06AF960C02
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-332e3664665so3544700f8f.0
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 11:46:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701200813; x=1701805613;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lg5u6YVcJTJ9rZbjsqvzgBQFLM3pNDp9l6oUuLzPjVY=;
 b=P8win/lkxnrRuqMRTriOQbTcMSFzr7NM2kC/9XPk7Y/u/k8CjOf74NmHokNtZnQvt/
 +HnE3DQNJLKFnQp0jT38USZc4JunBUrCE2zc0AzYFjcWLJX9tVuj7gC1pMAkl7zBN9OP
 X4TUpX4RrQy36WGEa4sOuRVXA3/3fNPprq1qp0pG/ueh4d0lAEUmuRFnvtslvMKpXr0Y
 k2hcCZAg+4TuZr8ucmHs4C0GsTm2TgpHgXTHoREWP0uRh0ZcNa+7vFiW6OgCQkS/CbAR
 gg+dVX/LGgESlHoN6Pwuwk9U7rvMeohpZeT2k1bY/8+A88T0Efqnq0C7POz0LpTzCrrx
 NpCQ==
X-Gm-Message-State: AOJu0Yzd9KZqajp6GYZnNmeg2hXaI2BqtcILDk7hDDqWc1QRpTz7P6Ve
 l8FOeiQAVbm6ddx3k8rll77C16jPOO8=
X-Google-Smtp-Source: AGHT+IEcgYXhxbaCOF7htbRfv7ZqyQ0ajBYsoaHIK+ahg7clLyFyhUIGwHcQOzitrtB7Y/S/oZtmEw==
X-Received: by 2002:adf:f9c6:0:b0:333:69:41fc with SMTP id
 w6-20020adff9c6000000b00333006941fcmr6311389wrr.30.1701200813009; 
 Tue, 28 Nov 2023 11:46:53 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 n8-20020a05600c3b8800b0040b398f0585sm16075941wms.9.2023.11.28.11.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 11:46:52 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Nov 2023 20:46:47 +0100
Message-ID: <20231128194647.12817-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701200813; x=1701805613; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Lg5u6YVcJTJ9rZbjsqvzgBQFLM3pNDp9l6oUuLzPjVY=;
 b=NFW14kAjtUOnS1Rt92JxI4UTppiAKs7/MzyhKvlGatDlDojnAVItgm+W4n9s9XVB2f
 gM4C1b5JnpXpK+McfPQ7VlBUJbqgxcG02Cbt+dpMA/RMSnpiDsKsdYDqkwQfCFoqCE64
 xE+H877d/PbwAgaNjnJ7ZRpiPzgp93n2YanHEzysIOsW0ruZ9pv3LUZQc/zLuJAFLGdg
 aaI7qqGJwEIbCFxgXl5VI19/PkQNBfR28/odArgRraTdyhrqY/gzVxPIcTBMyUeP8vTE
 b/SVi6Wl5l55TrrLs7Q9j/ZMna3ZQee0NcR904G7NnReDCAVcrI89uR5WKnPSaVPS7QQ
 wHHw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NFW14kAj
Subject: [Buildroot] [PATCH 1/1] system/Config.in: disable openrc with uclibc
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

openrc raises the following uclibc build failures since bump to version
0.51 in commit 730c90faa3ec13ee1ead47113c9c5c7d3a8dac55:

../src/rc-abort/rc-abort.c: In function 'main':
../src/rc-abort/rc-abort.c:27:21: error: implicit declaration of function 'kill'; did you mean 'killpg'? [-Werror=implicit-function-declaration]
   27 |                 if (kill(pid, SIGUSR1) != 0)
      |                     ^~~~
      |                     killpg

../src/libeinfo/libeinfo.c: In function 'colour_terminal':
../src/libeinfo/libeinfo.c:319:26: error: implicit declaration of function 'fileno' [-Werror=implicit-function-declaration]
  319 |         if (f && !isatty(fileno(f)))
      |                          ^~~~~~

../src/librc/librc-misc.c: In function 'rc_getfile':
../src/librc/librc-misc.c:79:14: error: implicit declaration of function 'fileno'; did you mean 'd_fileno'? [-Werror=implicit-function-declaration]
   79 |         fd = fileno(fp);
      |              ^~~~~~
      |              d_fileno

../src/librc/librc-daemon.c: In function 'rc_service_daemons_crashed':
../src/librc/librc-daemon.c:633:37: error: implicit declaration of function 'kill'; did you mean 'killpg'? [-Werror=implicit-function-declaration]
  633 |                                 if (kill(pid, 0) == -1 && errno == ESRCH)
      |                                     ^~~~
      |                                     killpg

These build failures could be fixed by patching openrc but upstream
is not happy with this patch: https://github.com/OpenRC/openrc/pull/674.

So, as advised by Yann E. Morin, openrc is hided away for uClibc, until
upstream has a proper fix.

Fixes:
 - http://autobuild.buildroot.org/results/494ef392a971ddb3c5c7b01e0149c6439018dbe7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 system/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 0b4dc9543e..b90e40e415 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -105,12 +105,13 @@ config BR2_INIT_OPENRC
 	bool "OpenRC"
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	select BR2_PACKAGE_OPENRC
 	select BR2_PACKAGE_SKELETON_INIT_OPENRC if BR2_ROOTFS_SKELETON_DEFAULT
 
-comment "openrc needs a toolchain w/ dynamic library"
+comment "openrc needs a glibc or musl toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS
+	depends on BR2_STATIC_LIBS && BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 
 # In Buildroot, we decided not to support a split-usr when systemd is
 # used as an init system. This is a design decision, not a systemd
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
