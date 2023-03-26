Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11317C6FD1C
	for <buildroot@archiver.kernel.org>; Sun, 26 Mar 2023 13:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7807F405C7;
	Sun, 26 Mar 2023 13:09:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7807F405C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zoVCjLLybO24; Sun, 26 Mar 2023 13:09:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA133405C2;
	Sun, 26 Mar 2023 13:09:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA133405C2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A1D601BF409
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 13:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7522140120
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 13:09:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7522140120
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VF5FDhz0x0wR for <buildroot@lists.busybox.net>;
 Sun, 26 Mar 2023 13:09:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A236F400C8
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A236F400C8
 for <buildroot@buildroot.org>; Sun, 26 Mar 2023 13:09:44 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 f6-20020a17090ac28600b0023b9bf9eb63so5995792pjt.5
 for <buildroot@buildroot.org>; Sun, 26 Mar 2023 06:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679836183;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ex+f0XghkcT3obCLo6/tEO8sfZegbQfOqCgNCVYHDt8=;
 b=iHH6AVGXuspu2xVR1Tw02fSYRJK9PxudC0pJ9QvRsHu+Afy8wz7xn2Iq8djgoQJ+mr
 1hBAJjeqqtu0/1ypGADLq+vZr4BAPpyUbvRAvzUGig8p3t/UTFHZ/pxPhCiH02y+uMC7
 zEErJJRGBiUY7fmD+OoUjlL9BjAkeRzLxWY58jgYffkPNq3srWvfw3ELzynBtPbUaIh/
 YdiAO8oE36FG9FNzXtQR26WcsPJmpUAguutorUOSJHiRzXQf8EascYYzbWZzhwHa9XJh
 6fs3X9HnMu6rXd/vMS3Hx+7KdL5XCkf9h+lugVpM/bcfyEX/h/8aATDvqGMyE6/2pFmM
 G15Q==
X-Gm-Message-State: AO0yUKWwMYYeFrUDYNkNudfAgePlQIQc1gfgsBGkgkbiJS/5BhC+XuNn
 E92dhfEIZfJeup4jNXVALBVLvs5wK+o=
X-Google-Smtp-Source: AK7set/LqAOjfsnlbz+ZGZGaDGp1AgDp1cscSNqHhesveU/HS7TlkvNbOBaU5e2Wu7zl7dXF+x0GaQ==
X-Received: by 2002:a05:6a20:6714:b0:d5:58df:fb7a with SMTP id
 q20-20020a056a20671400b000d558dffb7amr9110718pzh.3.1679836183253; 
 Sun, 26 Mar 2023 06:09:43 -0700 (PDT)
Received: from localhost.localdomain (ip72-194-116-95.oc.oc.cox.net.
 [72.194.116.95]) by smtp.gmail.com with ESMTPSA id
 i10-20020aa78b4a000000b0062619a002f6sm17016314pfd.187.2023.03.26.06.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Mar 2023 06:09:42 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Mar 2023 06:09:37 -0700
Message-Id: <20230326130937.56650-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679836183;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ex+f0XghkcT3obCLo6/tEO8sfZegbQfOqCgNCVYHDt8=;
 b=om9K6a4pqZPVw2utXE7NBV/yv2tA4myuFcMtOJk8wzLCeU6rBDsK45A3dwCzvJCy54
 o9z7Sfuv/5VNVSSYcUARTnjzT5r5g5RNJiJCMn++cieVv3o+1bJpgZZ8AU9X9H8kM2xC
 SLh2dAzFIpAS4E8EUCKpGr2m1FMJ7aMIkdyHx7aCXKCQnRmNOd3bRQUDFMa/ZSVNsWqE
 zpJehfgigAv7cLb4n9jeNKmJGXLqTGEz6kXGpCPnH+rCHB+K77tgbZmyop1Mc7COg1NX
 trDlz0y/z0f8h94tsCwae3ZWQZlLeNCq/se9R0geVw3rNWJAgIw9DUIM9Y7uISxtPgjc
 KmBw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=om9K6a4p
Subject: [Buildroot] [PATCH] package/bluez5_utils: Fix builds with musl-libc
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, marcin@bis.org.pl,
 d.lang@abatec.at, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Backport upstream commit ca6546fe521360fcf905bc115b893f322e706cb2
("shared: define MAX_INPUT for musl") to fix builds with musl-libc.

Fixes:
- http://autobuild.buildroot.net/results/3fd24a604a29eff70e20f82690e3f058f04903f9/
- http://autobuild.buildroot.net/results/bd57f1813be699cd5ce2ae94f5f511a71fe10428/
- http://autobuild.buildroot.net/results/90d528cc18a367af2f68e1c0673d962fe399e1ac/
- http://autobuild.buildroot.net/results/552b700ee129e1c7f651de13f6766eae5325dcbc/

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 .../bluez5_utils/0001-musl-max-input.patch    | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/bluez5_utils/0001-musl-max-input.patch

diff --git a/package/bluez5_utils/0001-musl-max-input.patch b/package/bluez5_utils/0001-musl-max-input.patch
new file mode 100644
index 000000000000..87fbb68f8f40
--- /dev/null
+++ b/package/bluez5_utils/0001-musl-max-input.patch
@@ -0,0 +1,35 @@
+From ca6546fe521360fcf905bc115b893f322e706cb2 Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Tue, 31 Jan 2023 05:52:58 +0000
+Subject: shared: define MAX_INPUT for musl
+
+musl systems don't have MAX_INPUT. Just define it to _POSIX_MAX_INPUT
+which musl does have if it's not already defined.
+
+Note that on glibc, the values match anyway (as of glibc-2.36), and
+indeed POSIX_MAX_INPUT has the same value on musl too.
+
+Bug: https://bugs.gentoo.org/888467
+---
+ src/shared/util.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/shared/util.c b/src/shared/util.c
+index 2f0ae0e86..b466fb001 100644
+--- a/src/shared/util.c
++++ b/src/shared/util.c
+@@ -28,6 +28,11 @@
+ #include <sys/random.h>
+ #endif
+ 
++/* define MAX_INPUT for musl */
++#ifndef MAX_INPUT
++#define MAX_INPUT _POSIX_MAX_INPUT
++#endif
++
+ #include "src/shared/util.h"
+ 
+ void *util_malloc(size_t size)
+-- 
+cgit 
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
