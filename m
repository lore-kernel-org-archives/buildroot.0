Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C227C3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 20:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EBCA8190B;
	Mon,  8 Jan 2024 20:44:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EBCA8190B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jJVl4pmSuydA; Mon,  8 Jan 2024 20:44:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F47F817AB;
	Mon,  8 Jan 2024 20:44:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F47F817AB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 27DC81BF2BA
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 20:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 006BC61047
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 20:44:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 006BC61047
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mBwUXjR4rIa3 for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 20:44:00 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CEA1260FE3
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 20:43:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEA1260FE3
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33687627ad0so2138890f8f.2
 for <buildroot@buildroot.org>; Mon, 08 Jan 2024 12:43:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704746637; x=1705351437;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mEmSS98yEybod1RqHqyG6Q3OIribkryZDY/5gbICPnY=;
 b=bAe77BupALU0Zdw1ytyQ4g/AcadDzCo3VAiQeBtqsNlhA5O4xJpZMyWkBI+ecbEZxs
 er+wj+2XDrYPtBxLwADwlr3KBF7FiRYNCYQzJKy6AwTZ2E79rtjcfn4+xhcNL6S4p2tR
 UEq7mmnHW5frVfAKN5em46+mHoJ5dgSr1cm1ZeMJTWZM4lxjtRwnKZAEIn2rv22iwG96
 BgGa8rQMFfYuWemPzq1ZaH0jxKl+05w0xiXXWk8g9TThOiF4gA0j3Nmva2o7hRrom18W
 68EiIFJNrD3im9qOUHRWcTiNC+6M09/eB04RLJVBiqmNkeZnMDU6IeOPK8Lp63ymnefw
 KhkQ==
X-Gm-Message-State: AOJu0YxeTsW9CnyLQVAr+3ESta9X267rVSabTHQoymdjAUR33L7f4QL6
 z5TLDP+ih1SO0MPtL5BINvXjxMVg2PQ=
X-Google-Smtp-Source: AGHT+IG440A5cbB9TWJGiNkQCiS93vekQKl4CPKn5C5aNPgglm2an6yYZPWeD3sBBqDJMdUm8BUCIg==
X-Received: by 2002:a05:600c:c08:b0:40e:4304:9124 with SMTP id
 fm8-20020a05600c0c0800b0040e43049124mr1648936wmb.83.1704746637327; 
 Mon, 08 Jan 2024 12:43:57 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 q17-20020a05600c46d100b0040e375604ecsm12321188wmo.31.2024.01.08.12.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 12:43:56 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Jan 2024 21:43:52 +0100
Message-ID: <20240108204352.319621-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704746637; x=1705351437; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mEmSS98yEybod1RqHqyG6Q3OIribkryZDY/5gbICPnY=;
 b=GSpmkEOp/b57E7iz/BJX2fF5SEpqg8kY8LXlMb+Ck8TukW5gxBlLBqWCU9PO1PjLw4
 lhUQRHrIFKuP+8sk+ZXIztc7FS/xDHceUuwwrM3sCT1H/W1wxygLetrtjmUBCakWc9o1
 GooeAgThxNL8k7U1W2TIPmjS0aiRjnRVEyZOH3zn8UJ4/lSNoFkG9NxSXigjQmIHq0Uu
 r3u2UnRG055r4rroNcsE3ZXuORyAWjuffwzM19Uf7nZPwTlO2ps9KREqOmoLZDMedM8H
 zCIYqj4+262gtyd7u4N2jIocetOi3nq3xf0Gw+lyhTNw+wsxdFXuYUBSw0g1E73vD0YL
 VMpQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GSpmkEOp
Subject: [Buildroot] [PATCH 1/1] package/libtraceevent: needs dynamic library
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since the addition of the package
in commit 1474f1b34b178defca1d16d18a2446fadda9a12b:

../src/event-plugin.c:10:10: fatal error: dlfcn.h: No such file or directory
   10 | #include <dlfcn.h>
      |          ^~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/7802d1ad00293147edda39683f6d3f614dd48263

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libtraceevent/Config.in | 4 ++++
 package/libtracefs/Config.in    | 4 ++++
 package/linux-tools/Config.in   | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/package/libtraceevent/Config.in b/package/libtraceevent/Config.in
index 399238eef1..28a5b32576 100644
--- a/package/libtraceevent/Config.in
+++ b/package/libtraceevent/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBTRACEEVENT
 	bool "libtraceevent"
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	help
 	  libtraceevent is a library that interfaces with the ftrace
 	  subsystem in the linux kernel.
@@ -9,3 +10,6 @@ config BR2_PACKAGE_LIBTRACEEVENT
 	  rtla.
 
 	  https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/
+
+comment "libtraceevent needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/libtracefs/Config.in b/package/libtracefs/Config.in
index 81a2e962ea..bb0777b16c 100644
--- a/package/libtracefs/Config.in
+++ b/package/libtracefs/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_LIBTRACEFS
 	bool "libtracefs"
+	depends on !BR2_STATIC_LIBS # libtraceevent
 	select BR2_PACKAGE_LIBTRACEEVENT
 	help
 	  libtracefs is used to easily interface with the ftrace
 	  interface through the tracefs virtual filesystem.
 
 	  https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/
+
+comment "libtracefs needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index adfca4dbe3..62adae4463 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -104,6 +104,7 @@ endif
 
 config BR2_PACKAGE_LINUX_TOOLS_RTLA
 	bool "rtla"
+	depends on !BR2_STATIC_LIBS # libtracefs -> libtraceevent
 	select BR2_PACKAGE_LINUX_TOOLS
 	select BR2_PACKAGE_LIBTRACEFS
 	help
@@ -123,6 +124,9 @@ config BR2_PACKAGE_LINUX_TOOLS_RTLA
 	  not available in Buildroot, so only rtla in kernels 5.19
 	  onwards is actually supported in Buildroot.
 
+comment "rtla needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
 	bool"selftests"
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
