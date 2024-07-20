Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C429EC3DA59
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 12:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76F8F6062C;
	Sat, 20 Jul 2024 12:40:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uxzmogUlWWdH; Sat, 20 Jul 2024 12:40:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6ABA36062F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6ABA36062F;
	Sat, 20 Jul 2024 12:40:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 915FB1BF3F9
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 12:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D2BC80499
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 12:40:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PMmO5YlFGxqm for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 12:40:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 527E580BBC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 527E580BBC
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 527E580BBC
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 12:40:17 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-427b9dcbb09so19928885e9.3
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 05:40:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721479215; x=1722084015;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2ceoxZazKFovcblbviaxcZONx58IeG3XwbSe40Tgsa4=;
 b=tfZ9MczI1mLuoou4p8iTXEWsmVwCYOv+ZciAExaHxtvNcXaIEcJh7yEkEqUyUdb3lg
 vHrHvNIqucAd5Yu0+7IwU3yEuim6hsS/cVEvG6EaoVwIKozsgSmuHQtSWOQEZOftSyri
 bVLZrTd6jCUAz/Vb7be4QpAgBeJXuoawxBKHR85IdpJyosuUAALyj1h4LUW/y/HD7nhF
 uYuMhi4pYo9fXh9wlMKWcIOYuF52bEe6Uaq/pV73cAYvLpBf43x33jQY/OCnb25joTo/
 5CYv81DRAS0+xXTbdGcWtAs2IeeFiQ/0rURT1XpHoDkKl+gfCTU58DQr3fzIRzz7SYBY
 nVvQ==
X-Gm-Message-State: AOJu0YxsdxX8NSLTxkIzyVfPP9Y9dfxJ7+UfZQeoEPUtX+fr/SmQ8e8F
 ywtBLU20vsigfH+RgiVaRdwulroBlDTuOL9rBe9OlNLrl7Rb/6fNxLD3yA==
X-Google-Smtp-Source: AGHT+IGIqnLDsW+8EAmpWadp6XGgcyLXQtlA42VgC7p11hV01qKJGaUfvZ9XGvB9juNmdFAudiYjSQ==
X-Received: by 2002:a05:600c:1388:b0:426:6455:f124 with SMTP id
 5b1f17b1804b1-427dc4700acmr11326565e9.0.1721479214499; 
 Sat, 20 Jul 2024 05:40:14 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368787cecbfsm3838483f8f.85.2024.07.20.05.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jul 2024 05:40:14 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 14:40:08 +0200
Message-ID: <20240720124008.460751-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721479215; x=1722084015; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2ceoxZazKFovcblbviaxcZONx58IeG3XwbSe40Tgsa4=;
 b=FI5ogFzz3LEYiWUMRaLoitX5PIRMMA82K/YkoVSLFDp+2GvR9MB9SHED+16JjA6GcJ
 QOV9q4PYLRhdANTt/hS9jhY03hzp5KWUwQY0k4byupKygEWUwcMwew0iep8MKxDOXAxI
 9ucEllSJIUKvvA9ln3+Me40vo2g362FF9oQUR+BnQgC3o2HEikPVtn8zZM+l2+QN54Z0
 tu3kBA32nhFp6J0gz0QdjqMPLZjkj0cb3mq0+HHOnBSdjJRiPv6oYr81KtMUXZ/nugzy
 nl4rqbmGHo98ixOTOswwJVRORdqQfuJv1L0q3pTA2/SBom0Ck72L1oiY0FskmHmMsdnP
 OG4w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FI5ogFzz
Subject: [Buildroot] [PATCH 1/1] package/cpuload: fix build with gcc >= 14
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

Fix the following build failure with gcc >= 14:

read_cpu_stat.c: In function 'cpudata_new':
read_cpu_stat.c:49:17: error: implicit declaration of function 'error'; did you mean 'perror'? [-Wimplicit-function-declaration]
   49 |                 error("too many cpus");
      |                 ^~~~~
      |                 perror

Fixes:
 - http://autobuild.buildroot.org/results/3bca2659011d123d7b7a0ca19c4e868643d45766

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Changed-error-calls-to-perror.patch  | 115 ++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 package/cpuload/0001-Changed-error-calls-to-perror.patch

diff --git a/package/cpuload/0001-Changed-error-calls-to-perror.patch b/package/cpuload/0001-Changed-error-calls-to-perror.patch
new file mode 100644
index 0000000000..6672bec677
--- /dev/null
+++ b/package/cpuload/0001-Changed-error-calls-to-perror.patch
@@ -0,0 +1,115 @@
+From ffd61eaa72acf123dea0c80ed3774656289ab49f Mon Sep 17 00:00:00 2001
+From: roiec <roiec@D-H-ROIEC-LX-WW1.com>
+Date: Wed, 5 Jan 2022 17:12:05 +0200
+Subject: [PATCH] Changed 'error' calls to 'perror'
+
+Upstream: https://github.com/kelvincheung/cpuload/pull/1
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ .gitignore           | 60 ++++++++++++++++++++++++++++++++++++++++++++
+ src/graph_cpu_load.c |  4 +--
+ src/read_cpu_stat.c  |  2 +-
+ 3 files changed, 63 insertions(+), 3 deletions(-)
+ create mode 100644 .gitignore
+
+diff --git a/.gitignore b/.gitignore
+new file mode 100644
+index 0000000..c2ae907
+--- /dev/null
++++ b/.gitignore
+@@ -0,0 +1,60 @@
++# Prerequisites
++*.d
++
++# Object files
++*.o
++*.ko
++*.obj
++*.elf
++
++# Linker output
++*.ilk
++*.map
++*.exp
++
++# Precompiled Headers
++*.gch
++*.pch
++
++# Libraries
++*.lib
++*.a
++*.la
++*.lo
++
++# Shared objects (inc. Windows DLLs)
++*.dll
++*.so
++*.so.*
++*.dylib
++
++# Executables
++*.exe
++*.out
++*.app
++*.i*86
++*.x86_64
++*.hex
++
++# Debug files
++*.dSYM/
++*.su
++*.idb
++*.pdb
++
++# Kernel Module Compile Results
++*.mod*
++*.cmd
++.tmp_versions/
++modules.order
++Module.symvers
++Mkfile.old
++dkms.conf
++
++#images
++*.tgz
++*.img
++
++
++#build
++configure
+diff --git a/src/graph_cpu_load.c b/src/graph_cpu_load.c
+index e4b7785..525d9ed 100644
+--- a/src/graph_cpu_load.c
++++ b/src/graph_cpu_load.c
+@@ -132,7 +132,7 @@ void graph_new_line(char *str, unsigned long color)
+ 	graph_last_x = graph_last_y = -1;
+ 
+ 	if (graph_data_index >= MAX_GRAPH_DATA - 2)
+-		error("Too many graph data.");
++		perror("Too many graph data.");
+ 
+ 	graph_data[graph_data_index++] = DATUM_COLOR;
+ 	graph_data[graph_data_index++] = color;
+@@ -145,7 +145,7 @@ void graph_new_line(char *str, unsigned long color)
+ void graph_add_point(int size, int amount)
+ {
+ 	if (graph_data_index >= MAX_GRAPH_DATA - 4)
+-		error("Too many graph data.");
++		perror("Too many graph data.");
+ 
+ 	graph_data[graph_data_index++] = DATUM_SIZE;
+ 	graph_data[graph_data_index++] = size;
+diff --git a/src/read_cpu_stat.c b/src/read_cpu_stat.c
+index 3d014be..ff51d7f 100644
+--- a/src/read_cpu_stat.c
++++ b/src/read_cpu_stat.c
+@@ -46,7 +46,7 @@ ProcessList *cpudata_new(void)
+ 	fclose(file);
+ 
+ 	if (cpu > cpus -1) {
+-		error("too many cpus");
++		perror("too many cpus");
+ 		exit(1);
+ 	}
+ 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
