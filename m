Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255D3C4167B
	for <buildroot@archiver.kernel.org>; Mon, 27 Nov 2023 21:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 984C7818A2;
	Mon, 27 Nov 2023 21:31:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 984C7818A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m3N8_5bSjk_t; Mon, 27 Nov 2023 21:31:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D069081801;
	Mon, 27 Nov 2023 21:31:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D069081801
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 427471BF37B
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 21:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21E9381801
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 21:31:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21E9381801
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QKrcZ1ElhKMv for <buildroot@lists.busybox.net>;
 Mon, 27 Nov 2023 21:31:45 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0440F817F5
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 21:31:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0440F817F5
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-32dff08bbdbso3207548f8f.2
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 13:31:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701120703; x=1701725503;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Pf38k+J8fUh9+oxJDcSAfnBUKo0Ze0mIQiNME67IcjA=;
 b=LkuFUpCpKNQVy7FRnJlXhuoWetjhQGZfAT4hv5icar0KbS91WIcwkNRN/2i8mJbYTu
 92qX8RiGYVduBeTLpC6E+oQ2bCODnJp6g90ZSLAjr2Ycfb+N0TGKt/04XUAMeScQcc9u
 cYt48DS2ouxIFkvYC2epTRmhsZ5EU4Ssvu0Uq3rlOP8IBW+cn/xu2b9K+qJzf/1wm4sP
 MVyU//G3soO4b+66puj/+5QdQSVROq3bqXpCPqQ9OgMg/XvzAahiBs0pPkAa/6Li+XZp
 QMGio2TsjGDZMLrXe7U0o4F0oY+KIsPVs23QtPQhBiw/23eViKjFOHCKQ/EL9nqK6jSt
 +EJg==
X-Gm-Message-State: AOJu0Yyv/xzs2GT5o9zwpmYqVrU1UEo0O3+O4liPjwa2ZNx4BwJ3X9oG
 usi14u8qZPU8/vaF9qawvyb1u3IVbd4=
X-Google-Smtp-Source: AGHT+IGYp/AR3P0n19OPwNmVnidMqIR+PcMWODmwB8n4M9K8DfA6nbHp0qDJlO55DpH3nfa88SpoBA==
X-Received: by 2002:adf:e4d1:0:b0:332:cae3:f2cf with SMTP id
 v17-20020adfe4d1000000b00332cae3f2cfmr8419193wrm.35.1701120702610; 
 Mon, 27 Nov 2023 13:31:42 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m6-20020a056000180600b00332e73f8231sm11319845wrh.39.2023.11.27.13.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 13:31:42 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Nov 2023 22:31:38 +0100
Message-ID: <20231127213138.1062051-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701120703; x=1701725503; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Pf38k+J8fUh9+oxJDcSAfnBUKo0Ze0mIQiNME67IcjA=;
 b=CH5YOJWyY24XqaFyPhmwMAUhpVqKLjartO6jvm3ESgNCTa2PFNELrBG0HATakExIPh
 lnpqURHWPNezKwOWjHofej7XxPixagf/QMAMMLp9R65uJY/CpRmZH6nX/+IUTT+mBVXV
 XPP2WH9C2i2NiQoHRO3UzkEI275GJ121zWc3e4DPEK5icZpx88s8fTzglbdWlIgkH7Ao
 pLNIKhnrlQ7z3m4S8imG6xO4P9FOoklu/7EMw5uOvYuKBkPXztwwU3F8Z1mjU9EOd6/j
 ambh6goNL0QiPUXtsLHPuGrb5L57rVzgG4zlNDSeEWwFl9O5oJs/bC4iuGPweaKaLpV6
 nvXg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CH5YOJWy
Subject: [Buildroot] [PATCH 1/1] package/openrc: fix uclibc build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following uclibc build failures raised since bump to version
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

Fixes:
 - http://autobuild.buildroot.org/results/494ef392a971ddb3c5c7b01e0149c6439018dbe7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0008-meson.build-fix-uclibc-build.patch   | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 package/openrc/0008-meson.build-fix-uclibc-build.patch

diff --git a/package/openrc/0008-meson.build-fix-uclibc-build.patch b/package/openrc/0008-meson.build-fix-uclibc-build.patch
new file mode 100644
index 0000000000..b01cb5f894
--- /dev/null
+++ b/package/openrc/0008-meson.build-fix-uclibc-build.patch
@@ -0,0 +1,53 @@
+From ce1f18ca178186821c812e0e965edd984557fed1 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 27 Nov 2023 22:22:56 +0100
+Subject: [PATCH] meson.build: fix uclibc build
+
+Fix the following uclibc build failures raised with meson because kill
+and fileno are not standard functions:
+
+../src/rc-abort/rc-abort.c: In function 'main':
+../src/rc-abort/rc-abort.c:27:21: error: implicit declaration of function 'kill'; did you mean 'killpg'? [-Werror=implicit-function-declaration]
+   27 |                 if (kill(pid, SIGUSR1) != 0)
+      |                     ^~~~
+      |                     killpg
+
+../src/libeinfo/libeinfo.c: In function 'colour_terminal':
+../src/libeinfo/libeinfo.c:319:26: error: implicit declaration of function 'fileno' [-Werror=implicit-function-declaration]
+  319 |         if (f && !isatty(fileno(f)))
+      |                          ^~~~~~
+
+../src/librc/librc-misc.c: In function 'rc_getfile':
+../src/librc/librc-misc.c:79:14: error: implicit declaration of function 'fileno'; did you mean 'd_fileno'? [-Werror=implicit-function-declaration]
+   79 |         fd = fileno(fp);
+      |              ^~~~~~
+      |              d_fileno
+
+../src/librc/librc-daemon.c: In function 'rc_service_daemons_crashed':
+../src/librc/librc-daemon.c:633:37: error: implicit declaration of function 'kill'; did you mean 'killpg'? [-Werror=implicit-function-declaration]
+  633 |                                 if (kill(pid, 0) == -1 && errno == ESRCH)
+      |                                     ^~~~
+      |                                     killpg
+
+Fixes:
+ - http://autobuild.buildroot.org/results/494ef392a971ddb3c5c7b01e0149c6439018dbe7
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/OpenRC/openrc/pull/674
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 9f4fc5ee5..9ab293c3a 100644
+--- a/meson.build
++++ b/meson.build
+@@ -149,7 +149,7 @@ else
+ endif
+ 
+ if os == 'Linux' or os == 'GNU-kFreeBSD'
+-  cc_os_flags = ['-D_DEFAULT_SOURCE']
++  cc_os_flags = ['-D_DEFAULT_SOURCE', '-D_GNU_SOURCE']
+ elif os == 'FreeBSD'
+   cc_os_flags = ['-D_BSD_SOURCE']
+ elif os == 'GNU'
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
