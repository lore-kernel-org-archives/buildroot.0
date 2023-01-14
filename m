Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C509C3DA78
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 18:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8514360F54;
	Sat, 14 Jan 2023 18:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8514360F54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jmc5gt2OkkMn; Sat, 14 Jan 2023 18:16:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF02B60F48;
	Sat, 14 Jan 2023 18:16:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF02B60F48
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 62B661BF3D9
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 18:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37FA941296
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 18:16:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37FA941296
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mwAXeSOQaHhT for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 18:16:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7205D410EA
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7205D410EA
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 18:16:02 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id t5so19440831wrq.1
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 10:16:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xTqqOkjefBTmnaE/pZbdm3VBfjTRwWX+LlSDU17AJkU=;
 b=gTytbhonWYJkbbCAjg7YdVoSYycAvIgLixx/7kpIa5BbRCe5+QaAGeGYk+u0WDpqJs
 +JuTL8TRSv24TIdk4halJS8pd2THuXerrEfG4c9TYidCu4sE9JDFPYd/0+TqEh3IZI/+
 TEmPs1oGUTmfqgzCbiIbLXjJyOhjL+GoEYvd+2dcSWx0p8UWX/P0chb07WRPUCQw904H
 5Sd6KVvSVwkAKCdrKBvU6qEo3EsLulEwc0Qr6hPIlY80GjG/OEiUiYK3lfBP+wQp3vZi
 N+aAy3xppjANehEfI+HrsI7DCCyCIQL1EYoGtnp7XoZEDolJCSW24PJQqPwzvZaH/tLk
 lejQ==
X-Gm-Message-State: AFqh2kp21ugArH5ud+IZ7KTIZAhBMUo9563PZqMVmxD8M5OPlrjVF1yK
 Vny7GcKcuiXglxahopw66JTHfWX0L8s=
X-Google-Smtp-Source: AMrXdXu8Td2xC1XdaXko1+Z1Vlk4325/0czqwBduiyP5J1ja+wNd8DN218nKfeAcJNO2V/pTo0ufXA==
X-Received: by 2002:a5d:5701:0:b0:2bd:db93:8f3b with SMTP id
 a1-20020a5d5701000000b002bddb938f3bmr5721652wrv.39.1673720159909; 
 Sat, 14 Jan 2023 10:15:59 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 f8-20020a0560001b0800b002423edd7e50sm21809638wrz.32.2023.01.14.10.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Jan 2023 10:15:59 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Jan 2023 19:15:56 +0100
Message-Id: <20230114181556.1371822-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xTqqOkjefBTmnaE/pZbdm3VBfjTRwWX+LlSDU17AJkU=;
 b=UXcSVT4241xYe2Z/j/RAhIUiCvuQtVWKBRR8Az3Srm7Y4cajjKJ1cUhmKjWnOD/Noe
 0j1V0giouRigi3VTPVXKZeUKtcB0GZ1Zox3Bd9G2mXg6lk30Bf0UNVsn/O2BdqJQ4FPK
 0NCobY6feQc44GSwUYEM4X3asD9CbQDoj4vWLufyoiiM8IBkUASxfmNr+om8b4wx1MAd
 upA4DaQUX7ejSUQ87/YO4vIOqDxQfbdUcfeEO3ymntKGOOLOD2vm6Lkn5/ZNZz5jM1AE
 ex0J55Cy4W4ltvo4CpJFrQGTmagQvEVjBXpseO5c8cT33Wdt9tEpySi/RBNnx566hSV7
 y81A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UXcSVT42
Subject: [Buildroot] [PATCH 1/1] package/gpsd: bump to version 3.25
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
 "Yann E . MORIN" <yann.morin@orange.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch (not needed anymore)

https://gitlab.com/gpsd/gpsd/-/blob/release-3.25/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../gpsd/0001-gpsctl-fix-yodaification.patch  | 44 -------------------
 package/gpsd/gpsd.hash                        |  2 +-
 package/gpsd/gpsd.mk                          |  2 +-
 3 files changed, 2 insertions(+), 46 deletions(-)
 delete mode 100644 package/gpsd/0001-gpsctl-fix-yodaification.patch

diff --git a/package/gpsd/0001-gpsctl-fix-yodaification.patch b/package/gpsd/0001-gpsctl-fix-yodaification.patch
deleted file mode 100644
index 753ff300eb..0000000000
--- a/package/gpsd/0001-gpsctl-fix-yodaification.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 72ae7ce646792b07061cbbb31ed47f55a1d2422c Mon Sep 17 00:00:00 2001
-Message-Id: <72ae7ce646792b07061cbbb31ed47f55a1d2422c.1663075350.git.yann.morin@orange.com>
-From: "Yann E. MORIN" <yann.morin@orange.com>
-Date: Tue, 13 Sep 2022 15:10:48 +0200
-Subject: [PATCH] gpsctl: fix yodaification
-
-Commit d5a672abd98a (gpsctl.c: Style tweaks.  Yoda style, braces, //
-comments.) claimed "No functional changes", but mis-treated a comparison
-when it was converted to yoda-style (simplified diff):
-
-    -    if (write(gpsdata->gps_fd, buf, strlen(buf)) <= 0) {
-    +    if (0 <= write(gpsdata->gps_fd, buf, strlen(buf))) {
-
-As one may notice, the comparison operator was not reversed while the
-operands were.
-
-This got silently fixed in commit 3219ab9f6a89 (gpsctl.c: First cut at
---ship sending commands to running gpsd.) but this is completely
-unrelated.
-
-Fix that comparison.
-
-Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
-Upstream status: not applicable as already fixed.
----
- gpsctl.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gpsctl.c b/gpsctl.c
-index cb342af87..ef59a6622 100644
---- a/gpsctl.c
-+++ b/gpsctl.c
-@@ -96,7 +96,7 @@ static bool gps_query(struct gps_data_t *gpsdata,
-     if ('\n' != buf[strnlen(buf, sizeof(buf) - 1) - 1]) {
-         (void)strlcat(buf, "\n", sizeof(buf));
-     }
--    if (0 <= write(gpsdata->gps_fd, buf, strnlen(buf, sizeof(buf)))) {
-+    if (0 >= write(gpsdata->gps_fd, buf, strnlen(buf, sizeof(buf)))) {
-         GPSD_LOG(LOG_ERROR, &context.errout, "gps_query(), write failed\n");
-         return false;
-     }
--- 
-2.25.1
-
diff --git a/package/gpsd/gpsd.hash b/package/gpsd/gpsd.hash
index f415c3af0f..15e1181ed9 100644
--- a/package/gpsd/gpsd.hash
+++ b/package/gpsd/gpsd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  00ee13f615655284874a661be13553abe66128e6deb5cd648af9bc0cb345fe5c  gpsd-3.24.tar.gz
+sha256  b368b6a305e3f7a6382d23a0cbfc1d78923060b6b7f54cf7987a73c7b4a9afc2  gpsd-3.25.tar.gz
 sha256  fdf339997bbca9eaf507476b82fbcac608fc39a3d89b86b51e16db4c9f933716  COPYING
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 961ebde649..d7425513fd 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPSD_VERSION = 3.24
+GPSD_VERSION = 3.25
 GPSD_SITE = http://download-mirror.savannah.gnu.org/releases/gpsd
 GPSD_LICENSE = BSD-2-Clause
 GPSD_LICENSE_FILES = COPYING
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
