Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18AA0C4332F
	for <buildroot@archiver.kernel.org>; Wed, 16 Nov 2022 17:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF51360FB7;
	Wed, 16 Nov 2022 17:12:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF51360FB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T8-NUqoTiV6y; Wed, 16 Nov 2022 17:12:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C47B760B2F;
	Wed, 16 Nov 2022 17:12:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C47B760B2F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C79211BF489
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 17:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A040560FB6
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 17:12:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A040560FB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f0mhLIPY-T0F for <buildroot@lists.busybox.net>;
 Wed, 16 Nov 2022 17:12:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7194F60FB5
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7194F60FB5
 for <buildroot@buildroot.org>; Wed, 16 Nov 2022 17:12:14 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id t4so12355289wmj.5
 for <buildroot@buildroot.org>; Wed, 16 Nov 2022 09:12:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x92UxdefoTEdKoTJGu1nxOMYvdp7xJ0dgBrLXhR19LY=;
 b=KlvIilQSq46+ykuvIh8DZJffx6+MJ99R9zzVOXYoMLM5TsNxKPuh9O5hu9JKUaEyO7
 a7vvw/JbLnS91108MoMTH1Boz2yEcc7kABtSHcWlBpgVZz5/OsashuURldR1yUlG+KBh
 R27aKf9AvapInAh81nYYtNMhRRgI1zjd1LaCbPb2RdT71K64Mc7FfEbMfoG8ucbHRF8T
 Q0RTce6gdxeZF6sEiUf07qzQtFTtJSVed8AemTtdrZUEdJqWFSrGaYdwXRworm24rJwI
 rwsiGVrc1lYQMbc4eq6/vd2PqOi5IoN8ALnH+snhgnKfjKGdJ7CFKPWyr2xc+DBw6/N3
 A8dQ==
X-Gm-Message-State: ANoB5pm7o6stpf3C2vRIupxgRwHL1ICR/bQ9WKkR1s+06WZrgv0XCQk7
 UX90dacirTFiV4lIO2fvYNrjLxpuZls=
X-Google-Smtp-Source: AA0mqf4+IYoB7r1MYTN2UbxrnRqElR/uYzsKFqDlmedPsZIXWrpOy0l+CTSxvZn0S+iaF0LrvGO3xg==
X-Received: by 2002:a05:600c:1e02:b0:3cf:5bd9:68a1 with SMTP id
 ay2-20020a05600c1e0200b003cf5bd968a1mr2961658wmb.113.1668618732304; 
 Wed, 16 Nov 2022 09:12:12 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 7-20020a1c1907000000b003cfbe1da539sm2731693wmz.36.2022.11.16.09.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 09:12:11 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 16 Nov 2022 18:11:56 +0100
Message-Id: <20221116171156.112638-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=x92UxdefoTEdKoTJGu1nxOMYvdp7xJ0dgBrLXhR19LY=;
 b=QQcm+eyU/M33bPG1geZxGA2MePVGZpUORoen2A+IoN4Kk83pUWilo36UbOba5Q2RNV
 l5Wc3EmAuTkpjVDKptpErqHzIAk5zCr6ebxBbMqCHdM0ZsGXlWT3Ty11LRJssAq7OQLa
 F21gRPYDVSqlZcH76nQ8/OwpKm/zucdD7CahNfXaiTNMESo30orQW0ZQPymiarxC1w2Y
 SaQAsVGSBd8Oh1ldzuxGTGZ9RaydIw/rQQucZ4UY++eQslaK3y4oLTYk7gzYOjxhJSsn
 M4Q9a4lpxTVsZWb+UNYT7QXL0PZuQ7Y8E+hkhIFOtZZOw4vqSryu1E8cLPxDrl5e0NwW
 d1CA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QQcm+eyU
Subject: [Buildroot] [PATCH 1/1] package/gptfdisk: fix runtime failure with
 popt 1.19
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following runtime failure raised since bump of popt to version
1.19 in commit 895bfba93f6e5535f2132aeea144d2cd87ebc71b:

Problem opening  for reading! Error is 2.
The specified file does not exist!

Fixes:
 - No autobuilder failure

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...h-of-sgdisk-when-compiled-with-lates.patch | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 package/gptfdisk/0002-Fix-failure-crash-of-sgdisk-when-compiled-with-lates.patch

diff --git a/package/gptfdisk/0002-Fix-failure-crash-of-sgdisk-when-compiled-with-lates.patch b/package/gptfdisk/0002-Fix-failure-crash-of-sgdisk-when-compiled-with-lates.patch
new file mode 100644
index 0000000000..bdeedd95cc
--- /dev/null
+++ b/package/gptfdisk/0002-Fix-failure-crash-of-sgdisk-when-compiled-with-lates.patch
@@ -0,0 +1,60 @@
+From 5d5e76d369a412bfb3d2cebb5fc0a7509cef878d Mon Sep 17 00:00:00 2001
+From: Rod Smith <rodsmith@rodsbooks.com>
+Date: Fri, 15 Apr 2022 18:10:14 -0400
+Subject: [PATCH] Fix failure & crash of sgdisk when compiled with latest
+ popt (commit 740; presumably eventually release 1.19)
+
+[Retrieved from:
+https://sourceforge.net/p/gptfdisk/code/ci/5d5e76d369a412bfb3d2cebb5fc0a7509cef878d/]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ NEWS      | 8 ++++++++
+ gptcl.cc  | 2 +-
+ support.h | 2 +-
+ 3 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/NEWS b/NEWS
+index c7add56..9e153fd 100644
+--- a/NEWS
++++ b/NEWS
+@@ -1,3 +1,11 @@
++1.0.10 (?/??/2022):
++-------------------
++
++- Fixed problem that caused sgdisk to crash with errors about being unable
++  to read the disk's partition table when compiled with the latest popt
++  (commit 740, which is pre-release as I type; presumably version 1.19 and
++  later once released).
++
+ 1.0.9 (4/14/2022):
+ ------------------
+ 
+diff --git a/gptcl.cc b/gptcl.cc
+index 34c9421..0d578eb 100644
+--- a/gptcl.cc
++++ b/gptcl.cc
+@@ -155,7 +155,7 @@ int GPTDataCL::DoOptions(int argc, char* argv[]) {
+    } // while
+ 
+    // Assume first non-option argument is the device filename....
+-   device = (char*) poptGetArg(poptCon);
++   device = strdup((char*) poptGetArg(poptCon));
+    poptResetContext(poptCon);
+ 
+    if (device != NULL) {
+diff --git a/support.h b/support.h
+index 8ba9ad1..f91f1bc 100644
+--- a/support.h
++++ b/support.h
+@@ -8,7 +8,7 @@
+ #include <stdlib.h>
+ #include <string>
+ 
+-#define GPTFDISK_VERSION "1.0.9"
++#define GPTFDISK_VERSION "1.0.9.1"
+ 
+ #if defined (__FreeBSD__) || defined (__FreeBSD_kernel__) || defined (__APPLE__)
+ // Darwin (Mac OS) & FreeBSD: disk IOCTLs are different, and there is no lseek64
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
