Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E0BC433EF
	for <buildroot@archiver.kernel.org>; Thu, 19 May 2022 22:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24EBA42525;
	Thu, 19 May 2022 22:08:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V8viNDiY7LEP; Thu, 19 May 2022 22:08:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D350942541;
	Thu, 19 May 2022 22:08:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D906A1BF59C
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 22:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D51A660AD5
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 22:08:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KyWhgPTI7bC3 for <buildroot@lists.busybox.net>;
 Thu, 19 May 2022 22:08:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DAC2D60A79
 for <buildroot@buildroot.org>; Thu, 19 May 2022 22:08:01 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id a11so6245533pff.1
 for <buildroot@buildroot.org>; Thu, 19 May 2022 15:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sdylRcvjFL7zSwEX11P7GUh8W33RWVZS14l/4qX1SaA=;
 b=UfEcduOuScvmMAI9mkqS/71ZTS5WL1QUtQaqpyAts2GBSAVUONyKXcQPFWuuzmhB8h
 zXGt8Gm0uoINq3EpDpupVHoK4DYrggfrlA5CTqfjO4FCWC91xoM4CurS2KfMKW6GEV8n
 uR5iAvC/uOgV4ir/NcfwXU7vHpGDyRtJEm4STZAdeK0d1tAC0g+QWoZdXZIB8V5Ol3Jb
 K2nCSCeNABcKLYFhhxMZAOjG9WDguK4ghj296KQA4oF4qyyk8mP6iX418TmNXmJ0xSeh
 rnvMRUkpXp6nwQaXKo2QsHwwzpH9ZWXdUYjQNpoMuXPW3Ml+XfwZ+r64qskcswJjQ3OR
 VCgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sdylRcvjFL7zSwEX11P7GUh8W33RWVZS14l/4qX1SaA=;
 b=4XzQMvkHBsDhU+cq4ALg4As0zakW8fxsrRqDkBWmpqmlXuS1+yuWqmYjF7q016ncwm
 qlXfGV/eqQuc5tJYkenld617qfbr/8aEodWra+o2ygq8200UGj9tpKALH8Yw8vjTxaAF
 0nmZBzNBuRtaltp6E6cndx0+p16YLuEOLCFWQ6qcmPsjEmTUkgqvUXu5RgHFZjc0EZHR
 gHQjU5czbEO4KLnnSl6JBJ/F7m1aNu+o8HJ9dM3garsEnxl9pgHATiZ+2pf5S795nbda
 5DxRtySW+IsiVaFeLB7L9AE/WasU+Z4leSMpz7WhN6uNBvaQ7i5SnHaYrtz62HMmiqTL
 PxRQ==
X-Gm-Message-State: AOAM530W863hP3gvJEkenJ2Q8rOpaAfewI03RGS+Q72IAhMgn2PlDCy/
 v3yb0sddl6RiaEHlXxyIjEzTxRyecRQ=
X-Google-Smtp-Source: ABdhPJyUT3okT3ob8NAr0b/18ITUxK9BwJ3ozcmmjPi4mf+E8F8kOsYaeA9HMPnf2sef5fhExGBLVQ==
X-Received: by 2002:a63:1645:0:b0:3c2:4706:f62b with SMTP id
 5-20020a631645000000b003c24706f62bmr5734807pgw.11.1652998080760; 
 Thu, 19 May 2022 15:08:00 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a1709026e0200b00161455d8029sm4290075plk.12.2022.05.19.15.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 15:08:00 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 May 2022 15:07:47 -0700
Message-Id: <20220519220747.455528-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519220747.455528-1-f.fainelli@gmail.com>
References: <20220519220747.455528-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/cpulimit: Remove or1k/musl
 limitation
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, mmayer@broadcom.com,
 thomas.petazzoni@bootlin.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It turns out that we can build cpulimit for or1k using musl-libc if we
remove the inclusion of the problematic procfs.h header file which is
not required at all. This is a backport of the following upstream pull
request:

https://github.com/opsengine/cpulimit/pull/110

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 .../0004-Remove-procfs.h-inclusion.patch      | 30 +++++++++++++++++++
 package/cpulimit/Config.in                    |  5 ++--
 2 files changed, 32 insertions(+), 3 deletions(-)
 create mode 100644 package/cpulimit/0004-Remove-procfs.h-inclusion.patch

diff --git a/package/cpulimit/0004-Remove-procfs.h-inclusion.patch b/package/cpulimit/0004-Remove-procfs.h-inclusion.patch
new file mode 100644
index 000000000000..771c2fe12c71
--- /dev/null
+++ b/package/cpulimit/0004-Remove-procfs.h-inclusion.patch
@@ -0,0 +1,30 @@
+From 48a88c033c5704d37645051ca51799a8b5a7e059 Mon Sep 17 00:00:00 2001
+From: Florian Fainelli <f.fainelli@gmail.com>
+Date: Thu, 19 May 2022 14:22:40 -0700
+Subject: [PATCH] Remove procfs.h inclusion
+
+We do not use anything from this header
+
+Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
+[Upstream: https://github.com/opsengine/cpulimit/pull/110]
+---
+ src/process_iterator.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/src/process_iterator.c b/src/process_iterator.c
+index 8b4019d237f2..5b6c651bc5d0 100644
+--- a/src/process_iterator.c
++++ b/src/process_iterator.c
+@@ -22,9 +22,6 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+-#ifndef __APPLE__
+-#include <sys/procfs.h>
+-#endif
+ #include <time.h>
+ #include "process_iterator.h"
+ 
+-- 
+2.25.1
+
diff --git a/package/cpulimit/Config.in b/package/cpulimit/Config.in
index cca74afc9955..11a4f1da01e2 100644
--- a/package/cpulimit/Config.in
+++ b/package/cpulimit/Config.in
@@ -1,12 +1,11 @@
-comment "cpulimit needs a toolchain w/ threads, does not build open openrisc with musl"
+comment "cpulimit needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || (BR2_or1k && BR2_TOOLCHAIN_USES_MUSL)
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_CPULIMIT
 	bool "cpulimit"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !(BR2_or1k && BR2_TOOLCHAIN_USES_MUSL)
 	help
 	  Cpulimit is a tool which limits the CPU usage of a process
 	  (expressed in percentage, not in CPU time)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
