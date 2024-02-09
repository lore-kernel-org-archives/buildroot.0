Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B4DC48297
	for <buildroot@archiver.kernel.org>; Fri,  9 Feb 2024 20:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1AA7741A88;
	Fri,  9 Feb 2024 20:47:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CaDiCCSVEu1L; Fri,  9 Feb 2024 20:47:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5F07401ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5F07401ED;
	Fri,  9 Feb 2024 20:47:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1AB3C1BF3A6
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 20:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A15BE84400
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 20:47:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FTyarR8SwpwL for <buildroot@lists.busybox.net>;
 Fri,  9 Feb 2024 20:47:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9E8F7843DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E8F7843DF
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9E8F7843DF
 for <buildroot@buildroot.org>; Fri,  9 Feb 2024 20:47:43 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4101565d20bso12425215e9.2
 for <buildroot@buildroot.org>; Fri, 09 Feb 2024 12:47:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707511661; x=1708116461;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=076a2FVx7/6rRZ0kXOY++VF2zHVYA34y0rIJ13USYW0=;
 b=mOBfuDpEF+cHEdlhAJkLgr7KCXD5qhE3y0PwatFLcG09ZPXZ7b2wCxrJgbLzF10Q8H
 w4Gm1NMZhQwUQLjktjTqX0F7fAvhaR1cSNwTPqQQ0Arn1H/mHPJx0D9rxDlffpv2Uqcn
 cG/Euah49SA6mG+xVR4Sn2lJDlMRz6lNnSfkVwTZn/WdJBosQFA+DVFdYgXKnnVNsCvx
 aY/6QlMzpKEYXv0UO4rwpnqQejlAZSBdgZd9KrcRIdtg0+YpiA0tqNs4U0YK4utDehF1
 mBOpb+lTlbdQE9tBOlKIw8KVUlrjajaqxSUgr/7cH8HMiRi64xihOtAo3qSTHRq1tcfH
 TAfg==
X-Gm-Message-State: AOJu0YzXfCUVSePR7Sk8TjLXb3siR9DLQto4U4V8BZHj2i1OcZ5k7d5I
 BSI9IBt1tYG95LlF9qX+WJbBITrCAYF9jW2R6lxnxsBCII8u8hL+tKYMEOI7jLQ=
X-Google-Smtp-Source: AGHT+IEvpmZpC91LxAqC/+N4D2CRYDDKNcpJUBGo5JG3hxuxPCYXCx7Nm3xSZ8/aiR0ShaNIWV9aJw==
X-Received: by 2002:a5d:4384:0:b0:33b:65a7:6b87 with SMTP id
 i4-20020a5d4384000000b0033b65a76b87mr96298wrq.49.1707511661114; 
 Fri, 09 Feb 2024 12:47:41 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWsRpjaqXL4J2x8opPPQHZm9VhncXHcqrF6JJbJo1baF6hioP1RF30jcqwE/y4YQZQXeR1y1b+CSzC4D6hWjobxggOZjNWL2oBm6K3zb9x7DqWlRzNc/biaBgTs09QlmSw=
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m10-20020adff38a000000b0033b0d2ba3a1sm143284wro.63.2024.02.09.12.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 12:47:40 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  9 Feb 2024 21:38:52 +0100
Message-ID: <20240209203852.671387-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707511661; x=1708116461; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=076a2FVx7/6rRZ0kXOY++VF2zHVYA34y0rIJ13USYW0=;
 b=EI88eT0Nn5pbBwn4D6eWQpSu/bBaeRQio1mMqkceap2lDI77N3BlQ79t9BzR6Tr1c6
 jRhyQR7rCdOb8OxN3ptEdAfwD6f7iSZM0P6tIvea4PkgkhpR9Kp06Jxh77hiDt5fdslU
 nQrAQm/laG7Qans4HxsTDCM0yEKD/Q6q3UnrbltMVxnsYNTH8XoDyxknluQJ/nVhXz3V
 c4da4F0u0s/wAY46idTV46bfBQjjJ2hdqGQXMeJol8/ONfHUHWoUHyJHiBT3L/bGtz4S
 CekiBZsApkgERZ5bq0UaqeDbR72J1OCui90QQbzbaUoa3t8S2yROi+HnK6uJjmVakXbu
 5zMg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=EI88eT0N
Subject: [Buildroot] [PATCH 1/1] package/libqrtr-glib: fix static build
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
Cc: Petr Vorel <petr.vorel@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following static build failure raised since bump to version
1.2.2 in commit b50bb982208011841fe0a9a7e4309808085cf493:

[5/5] Linking target src/libqrtr-glib/libqrtr-glib.so.0.0.0
FAILED: src/libqrtr-glib/libqrtr-glib.so.0.0.0

Fixes:
 - http://autobuild.buildroot.org/results/e0442e97279a07f33a14ec52840f98b7ec0fe32d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...rtr-lib-meson.build-fix-static-build.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/libqrtr-glib/0001-src-libqrtr-lib-meson.build-fix-static-build.patch

diff --git a/package/libqrtr-glib/0001-src-libqrtr-lib-meson.build-fix-static-build.patch b/package/libqrtr-glib/0001-src-libqrtr-lib-meson.build-fix-static-build.patch
new file mode 100644
index 0000000000..8c0db7bed5
--- /dev/null
+++ b/package/libqrtr-glib/0001-src-libqrtr-lib-meson.build-fix-static-build.patch
@@ -0,0 +1,36 @@
+From dd9d68259c1fb79bcf40fcdf6aa1e6026edec9b2 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 9 Feb 2024 21:16:39 +0100
+Subject: [PATCH] src/libqrtr-lib/meson.build: fix static build
+
+Replace shared_library by library to avoid the following static build
+failure:
+
+[5/5] Linking target src/libqrtr-glib/libqrtr-glib.so.0.0.0
+FAILED: src/libqrtr-glib/libqrtr-glib.so.0.0.0
+
+Fixes:
+ - http://autobuild.buildroot.org/results/e0442e97279a07f33a14ec52840f98b7ec0fe32d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://gitlab.freedesktop.org/mobile-broadband/libqrtr-glib/-/merge_requests/24
+---
+ src/libqrtr-glib/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libqrtr-glib/meson.build b/src/libqrtr-glib/meson.build
+index bbdd869..0cddcc7 100644
+--- a/src/libqrtr-glib/meson.build
++++ b/src/libqrtr-glib/meson.build
+@@ -39,7 +39,7 @@ c_flags = [
+   '-DLIBEXEC_PATH="@0@"'.format(qrtr_prefix / qrtr_libexecdir),
+ ]
+ 
+-libqrtr_glib = shared_library(
++libqrtr_glib = library(
+   libname,
+   version: qrtr_glib_version,
+   sources: sources + [version_header],
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
