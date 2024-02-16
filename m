Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B8AC48260
	for <buildroot@archiver.kernel.org>; Fri, 16 Feb 2024 18:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75A9780A90;
	Fri, 16 Feb 2024 18:14:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DMNEfTB4T9yz; Fri, 16 Feb 2024 18:14:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6304580AD0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6304580AD0;
	Fri, 16 Feb 2024 18:14:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B0151BF2C2
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 18:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 889446129D
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 18:14:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FjTBhUhvCBvG for <buildroot@lists.busybox.net>;
 Fri, 16 Feb 2024 18:14:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DA0A6606B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA0A6606B3
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA0A6606B3
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 18:14:22 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2d10ae127ffso30127811fa.3
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 10:14:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708107259; x=1708712059;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Fv3b8s/gPuhm14deEjtfemSz8H3V3cNnWXft4A9Uy9U=;
 b=B5VeA28oM8QWmELKB673uRKihQpEzd0+of6AwG3li+i4f4HN2wRSv+7g5C/jKlGxDZ
 A1kfttl+YdxqVBMPu/Q94FUpdqsnX7F5E27BMoRQ54zh1E8yR3UI4BlrTrILIA8nZke7
 mGo5ndAe9zDw95upVuBm3IOsKkPq71idOZU20u7ZYBOdugS/3ZTk9tDKAOQBKyOYJi30
 P74RmCbdpuJGr1REU7BEfBESErnH3cjuJzMDfnMJgkp/q/nsR90j8lU88JMk+HOB2P7+
 PProG3iA3HKq+fVkkhgCFSC8Lq6EHQuNIPo72qJDMLFtq/hnL6CXkMAlYZ17cunnYD/Y
 87VA==
X-Gm-Message-State: AOJu0Yx7g/ATxQyDV7iQZPoiy7swOxxB+PJF5bZa+cdEGGet3lG4A+//
 O39Kk5ltkCadUK8FElVgkoE80EjHtDlICbOr7x1JKmG5fVOzF2w7IdpomWO7cg0=
X-Google-Smtp-Source: AGHT+IHcCqLBXCsR9J7YB9BNQ8elrVvvAZ5hO49nqd/54BYzPaTo3lOp/yAXiOQ2GKBARgk3G7SAjQ==
X-Received: by 2002:a2e:a40f:0:b0:2d0:c37b:edc1 with SMTP id
 p15-20020a2ea40f000000b002d0c37bedc1mr3916160ljn.36.1708107258940; 
 Fri, 16 Feb 2024 10:14:18 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 k10-20020a7bc40a000000b004101f27737asm3001789wmi.29.2024.02.16.10.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 10:14:17 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 16 Feb 2024 19:14:15 +0100
Message-ID: <20240216181415.1188314-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708107259; x=1708712059; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Fv3b8s/gPuhm14deEjtfemSz8H3V3cNnWXft4A9Uy9U=;
 b=dBBPkSOlX7qJEWxY74K3d+3kaJO49lM79eNEjgA52TXmM9oFGESx56XwMqAPUIsNmA
 pp92qhNBo16Er61TIsDVgG6hYwyhW0/jl/Ac5luzmN4UO7v3a6H1WJvvpwWhhmAhZ3x0
 eWZyLPVy50QTHZmcuUJfMUsJq7ChDpBb3ME/1douktNq99fqPVqXiTBBZuGVtQE0UmeJ
 EK6OfjaMFkWIRyoAH5NBlwzdpTj3kVINWs6Vv9rnlUG6NMEgFJIC2kob4vLlcAzKXewi
 trJFKQJrKd/7lgF7qSpVVWzF28/24mmElvGVp05k2Fe8KG9skko26Ak7Mhkkm+Xp0fWl
 WNmQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dBBPkSOl
Subject: [Buildroot] [PATCH 1/1] package/dash: fix static build
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

Drop -Wl,--fatal-warnings with --enable-static to avoid the following
static build failure:

configure:4778: checking for strtod
configure:4778: /home/autobuild/autobuild/instance-8/output-1/host/bin/powerpc-buildroot-linux-uclibcspe-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mabi=spe -mfloat-gprs=single -Wa,-me500 -Os -g0  -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -static -Wl,--fatal-warnings conftest.c  >&5
/home/autobuild/autobuild/instance-8/output-1/host/lib/gcc/powerpc-buildroot-linux-uclibcspe/8.4.0/../../../../powerpc-buildroot-linux-uclibcspe/bin/ld: warning: conftest has a LOAD segment with RWX permissions
collect2: error: ld returned 1 exit status

[...]

In file included from arith_yylex.c:44:
system.h:74:22: error: static declaration of 'strtod' follows non-static declaration
 static inline double strtod(const char *nptr, char **endptr)
                      ^~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/a54fdc7d1b94beb47203373ae35b08d9cea8d42c
 - http://autobuild.buildroot.org/results/a4287b86186bf0a1d5370cf53123b324ae65c1da

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-configure.ac-drop-Wl-fatal-warnings.patch | 45 +++++++++++++++++++
 package/dash/dash.mk                          |  2 +
 2 files changed, 47 insertions(+)
 create mode 100644 package/dash/0001-configure.ac-drop-Wl-fatal-warnings.patch

diff --git a/package/dash/0001-configure.ac-drop-Wl-fatal-warnings.patch b/package/dash/0001-configure.ac-drop-Wl-fatal-warnings.patch
new file mode 100644
index 0000000000..eaa5d6cc60
--- /dev/null
+++ b/package/dash/0001-configure.ac-drop-Wl-fatal-warnings.patch
@@ -0,0 +1,45 @@
+From 7d07f683b83ef9fbdf258ce61b022b32f06f253a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 16 Feb 2024 17:26:28 +0100
+Subject: [PATCH] configure.ac: drop -Wl,--fatal-warnings
+
+Drop -Wl,--fatal-warnings with --enable-static to avoid the following
+static build failure:
+
+configure:4778: checking for strtod
+configure:4778: /home/autobuild/autobuild/instance-8/output-1/host/bin/powerpc-buildroot-linux-uclibcspe-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mabi=spe -mfloat-gprs=single -Wa,-me500 -Os -g0  -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -static -Wl,--fatal-warnings conftest.c  >&5
+/home/autobuild/autobuild/instance-8/output-1/host/lib/gcc/powerpc-buildroot-linux-uclibcspe/8.4.0/../../../../powerpc-buildroot-linux-uclibcspe/bin/ld: warning: conftest has a LOAD segment with RWX permissions
+collect2: error: ld returned 1 exit status
+
+[...]
+
+In file included from arith_yylex.c:44:
+system.h:74:22: error: static declaration of 'strtod' follows non-static declaration
+ static inline double strtod(const char *nptr, char **endptr)
+                      ^~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a54fdc7d1b94beb47203373ae35b08d9cea8d42c
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://lore.kernel.org/dash/20240216163319.860768-1-fontaine.fabrice@gmail.com
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 5524650..6993364 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -34,7 +34,7 @@ fi
+ AC_ARG_ENABLE(static, AS_HELP_STRING(--enable-static, \
+ 				     [Build statical linked program]))
+ if test "$enable_static" = "yes"; then
+-	export LDFLAGS="-static -Wl,--fatal-warnings"
++	export LDFLAGS="-static"
+ fi
+ 
+ AC_ARG_ENABLE(fnmatch, AS_HELP_STRING(--disable-fnmatch, \
+-- 
+2.43.0
+
diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 6efc71e568..aebfd28be8 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -8,6 +8,8 @@ DASH_VERSION = 0.5.11.5
 DASH_SITE = http://gondor.apana.org.au/~herbert/dash/files
 DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
 DASH_LICENSE_FILES = COPYING
+# We're patching configure.ac
+DASH_AUTORECONF = YES
 
 # dash does not build in parallel
 DASH_MAKE = $(MAKE1)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
