Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A79C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Oct 2022 15:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15C5560B88;
	Sun,  9 Oct 2022 15:35:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15C5560B88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d0-9JbiM2ife; Sun,  9 Oct 2022 15:35:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F29D60B2A;
	Sun,  9 Oct 2022 15:35:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F29D60B2A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2A1A91BF36C
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 15:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04FDE4061D
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 15:35:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04FDE4061D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dBDW2xrR2V0l for <buildroot@lists.busybox.net>;
 Sun,  9 Oct 2022 15:35:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FED0400D8
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4FED0400D8
 for <buildroot@buildroot.org>; Sun,  9 Oct 2022 15:35:26 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id a10so13737489wrm.12
 for <buildroot@buildroot.org>; Sun, 09 Oct 2022 08:35:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l5IgOHWLciNaLUMtJN+LwzokcmMXfu1XdyhMLlYovQw=;
 b=1Ewf2l/iU6gCSGBrMBOHL6jUbVwOZS5fmFo/eh1UXme0/Rn0jle6cMkG/QZ9k0HDUl
 APmJRP6cFFAqgqVaMxDE3WZlufRjE8fIlb6IAIFdqY7hu5QDMEho7n3DWmgEq/awJARd
 5rV9HRCU129Q3jjGDEyuSuTDGutqADtJXf640XJtQ+kINqgrGTo7WDEHAoFnjnBPPR+B
 ZhV/4GB0EDzThWZnto72UaIj8DoS+s8J7Q1X1JxRyIkGgWeROgXDJoyiVblbLVP3mvyZ
 dPrTxhl3HOuRlu4dGoleDDnovbCcB/aNQYzMNaNx9JHDAjVn8yiDWpW8zqiY5MK8uyd0
 cjEg==
X-Gm-Message-State: ACrzQf1X/Dr9bugaXvOrsl9odFEKbbbzoaIRNOfdGJ9lkTY3x4jxWJR9
 vPiAZW+Ys/TID9qi0OSw1wBNY++4FWY=
X-Google-Smtp-Source: AMsMyM6+f3CUmddI2TJtpsYHhHnJBuxpqJTkTdvynZzHHCAzbLzN8UXF7CavOdh7Om+mOuTE2bW42w==
X-Received: by 2002:a5d:4b8b:0:b0:22e:4185:bcc7 with SMTP id
 b11-20020a5d4b8b000000b0022e4185bcc7mr9377638wrt.174.1665329724257; 
 Sun, 09 Oct 2022 08:35:24 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a5d64a3000000b00228cbac7a25sm6938414wrp.64.2022.10.09.08.35.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Oct 2022 08:35:23 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Oct 2022 17:35:21 +0200
Message-Id: <20221009153521.12444-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l5IgOHWLciNaLUMtJN+LwzokcmMXfu1XdyhMLlYovQw=;
 b=bSz/h9j3fRKNv8JY5Qtxgh8jZ/wq4rxIRgCEtpvIje850dC78gsupTvAthas107ZIf
 V29Q1/P1Mt8F14CtjqkGkopn+7NCeKsUcZsfs6I7uC5vSyXYHlwZVOiH9g7Hat8lg/LN
 XTw2D8AVoNwwV6g0F+7aiJevb1+r0XzCyhBxwrzwUbN034MZRKldYTFbPcucrC8p4+zm
 2M24DQBqOLP5a33aDbjLBIa6aqoKLyf8cTNvDLNNcMOzu10BLD3JSqZWX9u2MpQaJFyH
 Ne4PE8+DDXZDjmX9HzktFZly8nw/T16HN7DyLzouPv7IbYUd+MU0ysYjJ8yDFXSZbAYQ
 nvUw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bSz/h9j3
Subject: [Buildroot] [PATCH] package/glibc: Fix x86_64 builds with -Os
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Backport upstream commit for x86_64 builds with -Os reported by [1].

[1] https://sourceware.org/bugzilla/show_bug.cgi?id=29576

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229902
https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229956

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../0002-x86-Fix-Os-build-BZ-29576.patch      | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/glibc/0002-x86-Fix-Os-build-BZ-29576.patch

diff --git a/package/glibc/0002-x86-Fix-Os-build-BZ-29576.patch b/package/glibc/0002-x86-Fix-Os-build-BZ-29576.patch
new file mode 100644
index 0000000000..4470324f1c
--- /dev/null
+++ b/package/glibc/0002-x86-Fix-Os-build-BZ-29576.patch
@@ -0,0 +1,48 @@
+From 3935b543adcb9a46ab79f8931bc489068b049378 Mon Sep 17 00:00:00 2001
+From: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
+Date: Wed, 21 Sep 2022 10:51:08 -0300
+Subject: [PATCH] x86: Fix -Os build (BZ #29576)
+
+The compiler might transform __stpcpy calls (which are routed to
+__builtin_stpcpy as an optimization) to strcpy and x86_64 strcpy
+multiarch implementation does not build any working symbol due
+ISA_SHOULD_BUILD not being evaluated for IS_IN(rtld).
+
+Checked on x86_64-linux-gnu.
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+Tested-by: Carlos O'Donell <carlos@redhat.com>
+
+(cherry picked from commit 9dc4e29f630c6ef8299120b275e503321dc0c8c7)
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ sysdeps/x86_64/multiarch/rtld-strcpy.S | 18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
+ create mode 100644 sysdeps/x86_64/multiarch/rtld-strcpy.S
+
+diff --git a/sysdeps/x86_64/multiarch/rtld-strcpy.S b/sysdeps/x86_64/multiarch/rtld-strcpy.S
+new file mode 100644
+index 0000000000..19439c553d
+--- /dev/null
++++ b/sysdeps/x86_64/multiarch/rtld-strcpy.S
+@@ -0,0 +1,18 @@
++/* Copyright (C) 2022 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <https://www.gnu.org/licenses/>.  */
++
++#include "../strcpy.S"
+-- 
+2.34.3
+
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
