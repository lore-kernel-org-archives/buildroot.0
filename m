Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0015EC77B7C
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 03:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A417C60F45;
	Thu,  3 Jul 2025 03:58:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZGlkR4_Ja-CK; Thu,  3 Jul 2025 03:58:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D128060E82
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D128060E82;
	Thu,  3 Jul 2025 03:57:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D551179
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 03:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48C2841B87
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 03:57:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 45QI6LiOhlHw for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 03:57:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com;
 envelope-from=f.fainelli@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6ADAA41B5A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6ADAA41B5A
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6ADAA41B5A
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 03:57:56 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-234bfe37cccso91546045ad.0
 for <buildroot@buildroot.org>; Wed, 02 Jul 2025 20:57:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751515075; x=1752119875;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a0YreRcqj747wYpC2bNNj7Ox/cm6eBK2KcrQ2URE6hU=;
 b=GbtBOpjDTGCAM49gy8ndAOFS+LU0fiqzV8zw3RtjTsgP0ld1/37anleTQXOnbFlhOv
 YBl8RXIF+P8uAdtR1P4hlES5M/SuPXf78QYqrKwhrw3VgG50Y4sAFVoeCbESlbD1cl0T
 PJy+5YzmEYhZ9STyzcpSHiRQiS0y5jXRi9xxyTzaI9n2hVOq21gPohGkxqtjiTnW2Vb1
 +APGghFPvavXlN7QjIO9WDanHzPj91XhhvPGXPYWfghYJ/w84OKdwXLpHg5qiCmxleCH
 fSyhD+yCe9Jo379vGprXm23aaylqx9alVKyhdCbAI7RW56ZEq0uJU0qy/2jnERNb5u7l
 5Eeg==
X-Gm-Message-State: AOJu0YyoDHfTbBcHbie+MVaH5D9BOOgMInHDAG8TW1FNkbzS6+QKakll
 V/gm8yZR5RQ5K5bjOJVMIcOcZp0ii2Wq4iAGU9L0CzCo5wwx/YisqtIQW5Xe/A==
X-Gm-Gg: ASbGncvgl/Fm8SNnJi4tfkWdOl3qisEhT8vTnFRYtIW11pe02Ni7YV0TXMhbUDST6fy
 eIF+61kagbtIDS8Muo1QNi/m0rhX2qBvMg2sY7/P8IdnuNLtTHL/R9unhv7J2MQUe4w/dvh+vyU
 G1HXhkYbpn0Ihm9TUhtygpZjdd8EuBturJYvmz83Js3VkXmsWVzm2Tdup7YE9ZtGt5UruaqjTMc
 ZzwpQC9FK8olpiakTzUuSrelG6spYTjMthU1zOFzDD/ftVmhZkG18Q5SQViWAgbIfIktu5NBS2J
 fMK1xdQ9UCgF+uctrgf3qJF0Dg5hqrB6UQusrCyHbeQSO39B/bYTr+eBr1QNYvoLxJUx5m653Tk
 4JwTbnncd3Rdo
X-Google-Smtp-Source: AGHT+IEasQpWSIXTEeGpaDOLFp8FqCDLIsxQ5KTZj/rq245z0MXf/XmJJ985SJCYiTMRVwBRfD73CQ==
X-Received: by 2002:a17:902:d48f:b0:224:1eab:97b2 with SMTP id
 d9443c01a7336-23c79842f80mr32858095ad.53.1751515075188; 
 Wed, 02 Jul 2025 20:57:55 -0700 (PDT)
Received: from eldorado.lan (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb2e21b2sm154254555ad.43.2025.07.02.20.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 20:57:54 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Jul 2025 20:57:51 -0700
Message-ID: <20250703035752.5032-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751515075; x=1752119875; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=a0YreRcqj747wYpC2bNNj7Ox/cm6eBK2KcrQ2URE6hU=;
 b=mKWCLQPSh+MjDm5Gf7QuLieRiM9mJgDTja0An2IsG6Tf+63u4H8hXZEhZygd+oSOH2
 06VWPQHdqxtrbkY61N3Gd+mYw6F3EHskiENP+02Q4kE8xevgucUZd19zcI8yrYerLwhN
 wSAqeiIsXz7B9SjTeciz0roTg2YPUD7C2V7b1ZU5+Z2kw6zFy6HzaBDbRiW3zDKVesYp
 zq3hPwp1vt5fkE4lOYYSWZkNJZif7WfSUUo9zlmpY98fKOhXlGUFCRtXPHdtf0uRtbuK
 bB1JjEed3cjnOkL6RpqTrldeOX7wUjS4nRsfffXAxOTLrMu07C0ryeeWwk7wIAPE2CBZ
 33Rw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mKWCLQPS
Subject: [Buildroot] [PATCH] package/cpulimit: Backport fix for function
 signature
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: ju.o@free.fr, romain.naour@smile.fr,
 Florian Fainelli <f.fainelli@gmail.com>, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Backport the upstream pull request patch fixing the incorrect function
signature passed to pthread_create()

Fixes: https://autobuild.buildroot.org/results/5308cb8239f31ef39e5c67d65ff1d69cdec1cedc
Fixes: https://autobuild.buildroot.org/results/6722247e3c830558ac0377352d05f4bb1684978d
Fixes: https://autobuild.buildroot.org/results/adc385fe35432be28453b8ed9f40e8a6647a4b28
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 ...0005-Correct-loop-function-signature.patch | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 package/cpulimit/0005-Correct-loop-function-signature.patch

diff --git a/package/cpulimit/0005-Correct-loop-function-signature.patch b/package/cpulimit/0005-Correct-loop-function-signature.patch
new file mode 100644
index 000000000000..5e143fdbb1a0
--- /dev/null
+++ b/package/cpulimit/0005-Correct-loop-function-signature.patch
@@ -0,0 +1,49 @@
+From 74e95c96e8d82e4e374f86142972fcf4305fe1f2 Mon Sep 17 00:00:00 2001
+From: Florian Fainelli <f.fainelli@gmail.com>
+Date: Wed, 2 Jul 2025 20:47:58 -0700
+Subject: [PATCH] Correct loop function signature
+
+loop is passed to pthread_create() which requires the following
+prototype to be used: void *(*start_routine) (void *)
+
+Correct the signature to avoid such warnings:
+
+In file included from busy.c:3:
+/home/buildroot/instance-0/output-1/host/mips-buildroot-linux-uclibc/sysroot/usr/include/pthread.h:164:36: note: expected 'void * (*)(void *)' but argument is of type 'void * (*)(void)'
+  164 |                            void *(*__start_routine) (void *),
+      |                            ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
+busy.c:6:7: note: 'loop' declared here
+    6 | void *loop()
+      |       ^~~~
+
+Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
+[Upstream: https://github.com/opsengine/cpulimit/pull/127]
+---
+ tests/busy.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tests/busy.c b/tests/busy.c
+index b3afb7cd853b..93f0bcce67a8 100644
+--- a/tests/busy.c
++++ b/tests/busy.c
+@@ -3,7 +3,7 @@
+ #include <pthread.h>
+ #include <unistd.h>
+ 
+-void *loop()
++void *loop(void *)
+ {
+ 	while(1);
+ }
+@@ -23,7 +23,7 @@ int main(int argc, char **argv) {
+ 			exit(1);
+ 		}
+ 	}
+-	loop();
++	loop(NULL);
+ 	return 0;
+ }
+ 
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
