Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DDAC47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 19:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B760960D80;
	Thu, 11 Jan 2024 19:42:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B760960D80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Rorb5F4G_3J; Thu, 11 Jan 2024 19:42:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA0EE6F61C;
	Thu, 11 Jan 2024 19:42:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA0EE6F61C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B9D01BF82C
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 19:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2633409F9
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 19:42:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2633409F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gMprMnrhvnrz for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 19:42:50 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E7B8405DF
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 19:42:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E7B8405DF
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40d60c49ee7so64568765e9.0
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 11:42:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705002168; x=1705606968;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7V4R4Z3Jog+r2jASLCcZtgA1vVlTmmh0If6dfCJAn78=;
 b=NI5exy4vFnOMeE5erxrynMnxaVG5eQtfqJy9+cGRDT+MZkPSMZ8twJExCDhhB0OeFn
 u04x96JWddASrhnGt9nAZmVPYubZW6N/nfh4Zy9wm0YmEjoy/FzAzM5AV05t+mCvC1VL
 MJb0Oi0VJIDWplfyQ9WcXIDVXquKr6v4fci1X4f+6jYEfN+Ab/5mU2T6WXDBA0wSl29M
 jzGf0F1r8axGTWB0x723zA1vl0fyDrI1y530SBlXoU3iOpPb/za0kioTQ2Da2ppZ/7o+
 tTyjQjyK779mfqt0Cm458v6gYMHVRGFuxhDo9sKsyHQOX+vrBTEGALrVHI7qde8OrVOC
 DRdQ==
X-Gm-Message-State: AOJu0YwKjLwFj3JDTdptT8YT47pKGEP+IIV2X7KCJfXER32xPcDU/rIi
 0BEaAlBTza+PHFWyarBFYp5Cvb+QvVI=
X-Google-Smtp-Source: AGHT+IGWFZqGDYweX7AF5VSmL7vglCVsIOYJnrqQE4/cXa5jyFwYOKqbKKd5AzYdhrC+nL5LDeUygQ==
X-Received: by 2002:a05:600c:a05:b0:40d:271e:67bc with SMTP id
 z5-20020a05600c0a0500b0040d271e67bcmr182983wmp.112.1705002167749; 
 Thu, 11 Jan 2024 11:42:47 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 c11-20020a05600c0a4b00b0040d53588d94sm7007801wmq.46.2024.01.11.11.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 11:42:47 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 20:42:42 +0100
Message-ID: <20240111194242.2572172-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705002168; x=1705606968; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7V4R4Z3Jog+r2jASLCcZtgA1vVlTmmh0If6dfCJAn78=;
 b=ckB+6k00udUR5UU+ui9IuUgS/HFwKpCsNPqg51leG3jWvJDSD6SCQLRTj2OJCHOsSw
 7fvqM0Y0V6jF1veW2iRCCJFCYux7m+/OwneZpVq482ZMhez0WtwFy33iRs19FJ68Eu1V
 l/8J85knEgeDEF1BPT+q8e/Djh0tM56vfZMp064mtHiZWoTrjcPlEfUyKdkz6PHhuEG9
 ItjEwn73V7b8PltOdfg2VKwZU+Y+ESIrZaKrJMGXT55VCiLnZOdmIjhLguB9FxayikQp
 HUk5rDUKIJDMYWManKQ8n/UW1PbUo8gyVV4E7HSe5BRJ1IviMMQcksSVFbqM4oNGGfnS
 MPfw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ckB+6k00
Subject: [Buildroot] [PATCH 1/1] package/freeradius-server: fix python3
 build with -Ofast
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
Cc: David GOUARIN <dgouarin@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following python3 build failure with -Ofast raised since commit
4513f5198a8f24af7bd24fdfc1ede143eb4e844a:

powerpc64-buildroot-linux-gnu-gcc.br_real: error: ast: linker input file not found: No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/904c43241b99a8d848c1891cb5af132a291311b4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ules-rlm_python-fix-build-with-Ofast.patch | 49 +++++++++++++++++++
 .../freeradius-server/freeradius-server.mk    |  6 +++
 2 files changed, 55 insertions(+)
 create mode 100644 package/freeradius-server/0009-src-modules-rlm_python-fix-build-with-Ofast.patch

diff --git a/package/freeradius-server/0009-src-modules-rlm_python-fix-build-with-Ofast.patch b/package/freeradius-server/0009-src-modules-rlm_python-fix-build-with-Ofast.patch
new file mode 100644
index 0000000000..c92b4171d2
--- /dev/null
+++ b/package/freeradius-server/0009-src-modules-rlm_python-fix-build-with-Ofast.patch
@@ -0,0 +1,49 @@
+From 963edf3f87d34e274885d9cc448651d8a1601a6f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 11 Jan 2024 17:38:41 +0100
+Subject: [PATCH] src/modules/rlm_python: fix build with -Ofast
+
+Stripping logic wrongly translates -Ofast into ast resulting in the
+following build failure:
+
+configure: /home/fabrice/buildroot/output/host/powerpc64-buildroot-linux-gnu/sysroot/usr/bin/python3-config's cflags were "-I/home/fabrice/buildroot/output/host/powerpc64-buildroot-linux-gnu/sysroot/usr/include/python3.11 -I/home/fabrice/buildroot/output/host/powerpc64-buildroot-linux-gnu/sysroot/usr/include/python3.11  -Wsign-compare -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Ofast -g0 -D_FORTIFY_SOURCE=2 -DNDEBUG -g -fwrapv -O3 -Wall"
+configure: Sanitized cflags were " -isystem/home/fabrice/buildroot/output/host/powerpc64-buildroot-linux-gnu/sysroot/usr/include/python3.11 -isystem/home/fabrice/buildroot/output/host/powerpc64-buildroot-linux-gnu/sysroot/usr/include/python3.11   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  ast  -D_FORTIFY_SOURCE=2 -fwrapv  "
+
+[...]
+
+powerpc64-buildroot-linux-gnu-gcc.br_real: error: ast: linker input file not found: No such file or directory
+
+Fixes:
+ - http://autobuild.buildroot.org/results/904c43241b99a8d848c1891cb5af132a291311b4
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/FreeRADIUS/freeradius-server/pull/5263
+---
+ src/modules/rlm_python/configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/modules/rlm_python3/configure.ac b/src/modules/rlm_python3/configure.ac
+index e2f74574fb..ee30b324d9 100644
+--- a/src/modules/rlm_python3/configure.ac
++++ b/src/modules/rlm_python3/configure.ac
+@@ -59,7 +59,7 @@ else
+ 
+ 	dnl # Convert -I to -isystem to get rid of warnings about issues in Python headers
+ 	dnl # Strip -systemroot
+-	dnl # Strip optimisation flags (-O[0-9]?). We decide our optimisation level, not python.
++	dnl # Strip optimisation flags (-O[0-9|fast]?). We decide our optimisation level, not python.
+ 	dnl # -D_FORTIFY_SOURCE needs -O.
+ 	dnl # Strip debug symbol flags (-g[0-9]?). We decide on debugging symbols, not python
+ 	dnl # Strip -W*, we decide what warnings are important
+@@ -73,7 +73,7 @@ else
+ 	mod_cflags=`echo " $python_cflags" | sed -e '\
+ 		s/ -I/ -isystem/g;\
+ 		s/ -isysroot[[ =]]\{0,1\}[[^-]]*/ /g;\
+-		s/ -O[[^[[:blank:]]]]*/ /g;\
++		s/ -O[[^[[:blank:]]*]]*/ /g;\
+ 		s/ -Wp,-D_FORTIFY_SOURCE=[[[:digit:]]]/ /g;\
+ 		s/ -g[[^ ]]*/ /g;\
+ 		s/ -W[[^ ]]*/ /g;\
+-- 
+2.43.0
+
diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
index 16a817b680..1b5751d753 100644
--- a/package/freeradius-server/freeradius-server.mk
+++ b/package/freeradius-server/freeradius-server.mk
@@ -21,6 +21,12 @@ define FREERADIUS_SERVER_RUN_KRB5_AUTORECONF
 endef
 FREERADIUS_SERVER_PRE_CONFIGURE_HOOKS += FREERADIUS_SERVER_RUN_KRB5_AUTORECONF
 
+# We're patching src/modules/rlm_python3/configure.ac
+define FREERADIUS_SERVER_RUN_PYTHON3_AUTORECONF
+	cd $(@D)/src/modules/rlm_python3; $(AUTORECONF) -I$(@D)/m4
+endef
+FREERADIUS_SERVER_PRE_CONFIGURE_HOOKS += FREERADIUS_SERVER_RUN_PYTHON3_AUTORECONF
+
 # some compiler checks are not supported while cross compiling.
 # instead of removing those checks, we cache the answers
 FREERADIUS_SERVER_CONF_OPTS += \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
