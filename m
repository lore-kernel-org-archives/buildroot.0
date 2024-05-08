Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78FE4C04FFE
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 20:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE3F4402AA;
	Wed,  8 May 2024 20:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 527LzboO-h2A; Wed,  8 May 2024 20:11:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 849874033B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 849874033B;
	Wed,  8 May 2024 20:11:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 551981BF2B8
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 20:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E1014033B
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 20:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BCXYvkhQhP2B for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 20:11:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A21CA402AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A21CA402AA
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A21CA402AA
 for <buildroot@buildroot.org>; Wed,  8 May 2024 20:11:50 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-41fc2f7fbb5so821485e9.1
 for <buildroot@buildroot.org>; Wed, 08 May 2024 13:11:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715199108; x=1715803908;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XSZt67wPbzCB6Rcrea3ZnHfZPslOyem3qXPf6xgaFPk=;
 b=wVNVlYPvpKGNSr2C1XaPo0Wp4STCtYOdKR7jdQnSWOIxHDmGcIQEvCAKp7TxNatRTS
 cNjyMrWZYWjBlfKPZzu6opqyA5Xev7mKB5WLxvLyCE1TSGKLE2wjW7BBXFNGpbqacGi+
 X3lyeyKjP/uvcMAmBq+QoDoKOdvraDbNe3iRK9zkgYlpAHjiQUGMIgJmpCr1NkJIyZO6
 lWaRgFGkDLGm42PkpgJRb2c18zyIz9wLNZ4sEjA9yRJh99mwmeneDLGLHkPfTfvb3myN
 QTzuxPuzY0Pye07gDlHKA49tl9tX1rYQDcdmHhTo1EzQPjzAhOe85XCUj58dXLEn0Zo/
 afVg==
X-Gm-Message-State: AOJu0YwmqFaNrcIZatzm4fSfIlye9Wpn7dPKMzHocvJQYNWhGemGGmSk
 02BfmLHK6wPPTVWIJTg+Q8bjzM5rktyE8WtjfLp265UwNJp0NJJmzKJolA==
X-Google-Smtp-Source: AGHT+IF4oJrbynBqVxOxNSmx29SxQZjtZaqhd4pOqzwnMUIsD8CyXuXgFLnBWRFKofNOEP5NF8qCxg==
X-Received: by 2002:adf:e256:0:b0:34e:3d3a:e144 with SMTP id
 ffacd0b85a97d-35017fe1ed2mr528769f8f.2.1715199108038; 
 Wed, 08 May 2024 13:11:48 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 g17-20020adfa491000000b0034de87e81c7sm16216554wrb.23.2024.05.08.13.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 13:11:47 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 May 2024 22:11:30 +0200
Message-ID: <20240508201130.706168-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715199108; x=1715803908; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XSZt67wPbzCB6Rcrea3ZnHfZPslOyem3qXPf6xgaFPk=;
 b=KmpiTqvswacpXXHm3Pf7rg7UpUCwDwk04IDGe1DLTD03VO51nE5xJxJYbu1+4E7rp/
 jtlgQsYFDv9FqalEBnClEcJhAzcT3X1xQP651f9jEBrFevodBAFN9HoH1ufLy1vOutqW
 xhQtSMr8PngdL3DqdfocOffR1gWaGNc6AwLIjwJ+P1frx8seim+i9oL4U5rVrNIs803s
 sWSLottEECvVotxQOWJIF/SmC9F47yA/ns3GWhzZsEtPag4XAsr2ML6nM7IJ2S1d3VjS
 m/Nf46ACKf1FMcvKsPQClY7vmK0JiikHdNvHexE5CzoYwq7mnMRaD98nAVJCgViXRBKa
 WYPA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KmpiTqvs
Subject: [Buildroot] [PATCH 1/1] package/stress-ng: fix uclibc-ng build
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following uclibc-ng build failure raised since bump to version
0.17.07 in commit 6fb179b906a1755d77bda9e501c5335ac163f3cb and
https://github.com/ColinIanKing/stress-ng/commit/e75ecbc8994e94b9e151b1191c1888bd2821fe72:

In file included from core-sched.c:25:
core-sched.c: In function 'stress_set_sched':
core-sched.c:170:22: error: 'struct shim_sched_attr' has no member named '__sched_priority'; did you mean 'sched_priority'?
  170 |                 attr.sched_priority = (unsigned int)sched_priority;
      |                      ^~~~~~~~~~~~~~

Fixes: 6fb179b906a1755d77bda9e501c5335ac163f3cb
 - http://autobuild.buildroot.org/results/d7d38dbb10f7f188da8dccc44a84a3c46a720bed

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...002-core-sched.c-fix-uclibc-ng-build.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/stress-ng/0002-core-sched.c-fix-uclibc-ng-build.patch

diff --git a/package/stress-ng/0002-core-sched.c-fix-uclibc-ng-build.patch b/package/stress-ng/0002-core-sched.c-fix-uclibc-ng-build.patch
new file mode 100644
index 0000000000..c9c4e22603
--- /dev/null
+++ b/package/stress-ng/0002-core-sched.c-fix-uclibc-ng-build.patch
@@ -0,0 +1,40 @@
+From f8dc9f790251562c3a4635edd29d7674298cd5f7 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 4 May 2024 17:52:32 +0200
+Subject: [PATCH] core-sched.c: fix uclibc-ng build
+
+Since version 0.17.02 and commit
+e75ecbc8994e94b9e151b1191c1888bd2821fe72, sched.h is not included before
+including core-shim.h. The issue is that core-shim.h defines its own
+sched_priority parameter in shim_sched_attr. When sched.h is included
+after core-shim.h, the build will fail because __sched_priority will not
+be found:
+
+In file included from core-sched.c:25:
+core-sched.c: In function 'stress_set_sched':
+core-sched.c:170:22: error: 'struct shim_sched_attr' has no member named '__sched_priority'; did you mean 'sched_priority'?
+  170 |                 attr.sched_priority = (unsigned int)sched_priority;
+      |                      ^~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/d7d38dbb10f7f188da8dccc44a84a3c46a720bed
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/ColinIanKing/stress-ng/commit/f8dc9f790251562c3a4635edd29d7674298cd5f7
+---
+ core-shim.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/core-shim.h b/core-shim.h
+index bed4cf2f6..475aac512 100644
+--- a/core-shim.h
++++ b/core-shim.h
+@@ -23,6 +23,8 @@
+ #include <sys/uio.h>
+ #endif
+ 
++#include <sched.h>
++
+ /*
+  *  BeagleBoneBlack with 4.1.15 kernel does not
+  *  define the following, these should be defined
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
