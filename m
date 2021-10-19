Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E679C433FE
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 17:54:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2184960F57
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 17:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2184960F57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E92FE4052E;
	Tue, 19 Oct 2021 17:54:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OLgoQc629f9V; Tue, 19 Oct 2021 17:54:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 999D8404E2;
	Tue, 19 Oct 2021 17:54:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 70E9D1BF4D8
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 17:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D3D140134
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 17:53:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s01p1rmoo8js for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 17:53:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF8EB400CB
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 17:53:50 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id m42so13368291wms.2
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 10:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9k4BLkl5HLzQPmNSu1B783Cm6TS5WZxaqiCMo/4j+i4=;
 b=GpWyRdGgKQitWe01u7vt4B6d9mtvKGglfmtKVCBjKVL5jiYkiZ3m5hbOnrAFEArLPv
 uTT/KV+/QnoDGyo7CZnNhca/pxEhrWiE90xrjUk7sGMufPmzTqaF8ZIg1jPgMwPL7DDv
 Je0UMWpKb3RcvUsPrI1iu2zOF8RidK9iw10QQZRvcDfLaLXABFgvU+PzIV6O6Rm9BlTp
 R4nj7UGuqU54Tz+ltCYHNyydTCNtBM7/2S4YUj89lzrdQsGCi5vX5bh9BSznMqRVzC8m
 hPFObs4qL9cPXNJpEVORNz5i4+15Z7dkBKdOkjua3aoy8bbW+9YquthhUB2fPZHQFWTk
 p2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9k4BLkl5HLzQPmNSu1B783Cm6TS5WZxaqiCMo/4j+i4=;
 b=2X5ISZVT7Tfp3rSdIxrZyToR3e+7gcXUeFGKPgEYOXLGkwWStSCi+i1h3Gt+vGqz69
 oe4cbrkzjWn2QuAhXNmJzcCsDszkWvGKcw0jNKXHM2xSZ2lKHFuHT+stpakao8aIWgWu
 Kz8MPlQhWTFbKLuxyQIq7qal5YutbgV9ABo3mdbHY0BikZk2G0vyP06KfsLCJSPED5H8
 vBerIc81Z+5lc+ipC17fNaIK7YS8YneaZo0m01ItKD+0p4tvYTJSisHlT9J5Y9VjbOva
 PJ6rBikILlLkKKhRLNNS6FZOuD1qfURrunTF7O88cUEUJjXNWMwgGsR7VZmb9xO52Pyx
 omqQ==
X-Gm-Message-State: AOAM531FD6zO4F9s6+qPCOJTT9p1EJLLBDyfgTOrAiY0EhQoQAuN5xX2
 RiEx5IVSYWKTVD01RPJ2nDiFp74n3HA=
X-Google-Smtp-Source: ABdhPJzYyg6zD05Us7eFgQwk/hk9EmvqfORif5AE7PbM/Pl4Hh596lzBGUOUiSCLDhC0uVei1FvJsA==
X-Received: by 2002:adf:fa8f:: with SMTP id h15mr46269230wrr.323.1634666028998; 
 Tue, 19 Oct 2021 10:53:48 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id l24sm2819655wmi.3.2021.10.19.10.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 10:53:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 19 Oct 2021 19:52:14 +0200
Message-Id: <20211019175214.3539445-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ipcalc: bump to version 1.0.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Derrick Lyndon Pallas <derrick@meter.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patches (already in version)
- Update indentation in hash file (two spaces)

https://gitlab.com/ipcalc/ipcalc/-/blob/1.0.1/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...not-fail-to-build-if-ronn-is-missing.patch | 49 -------------------
 .../0002-Include-stdarg-for-va_list.patch     | 29 -----------
 package/ipcalc/ipcalc.hash                    |  4 +-
 package/ipcalc/ipcalc.mk                      |  2 +-
 4 files changed, 3 insertions(+), 81 deletions(-)
 delete mode 100644 package/ipcalc/0001-Do-not-fail-to-build-if-ronn-is-missing.patch
 delete mode 100644 package/ipcalc/0002-Include-stdarg-for-va_list.patch

diff --git a/package/ipcalc/0001-Do-not-fail-to-build-if-ronn-is-missing.patch b/package/ipcalc/0001-Do-not-fail-to-build-if-ronn-is-missing.patch
deleted file mode 100644
index 419f4bba44..0000000000
--- a/package/ipcalc/0001-Do-not-fail-to-build-if-ronn-is-missing.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 322294d7bf61f9fdf0e45e9b6c6013a7c6a35bfd Mon Sep 17 00:00:00 2001
-From: Derrick Lyndon Pallas <derrick@meter.com>
-Date: Wed, 14 Oct 2020 18:25:54 +0000
-Subject: [PATCH] Do not fail to build if ronn is missing
-
-If ruby-ronn is missing, we can not compile the man page from markdown but
-that should not prevent the application from building.
-
-Signed-off-by: Derrick Lyndon Pallas <derrick@meter.com>
----
- meson.build | 23 ++++++++++++-----------
- 1 file changed, 12 insertions(+), 11 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index a2169fc..981d4a4 100644
---- a/meson.build
-+++ b/meson.build
-@@ -72,16 +72,17 @@ ipcalc = executable('ipcalc',
- 	install : true
- )
- 
--ronn = find_program('ronn', required: true)
--
--ipcalc_1 = custom_target(
--	'ipcalc.1',
--	output : 'ipcalc.1',
--	input : 'ipcalc.1.md',
--	command : [ronn, '--pipe', '-r', '@INPUT@'],
--	capture: true,
--	install_dir: join_paths(get_option('mandir'), 'man1'),
--	install: true
--)
-+ronn = find_program('ronn', required: false)
-+if ronn.found()
-+	ipcalc_1 = custom_target(
-+		'ipcalc.1',
-+		output : 'ipcalc.1',
-+		input : 'ipcalc.1.md',
-+		command : [ronn, '--pipe', '-r', '@INPUT@'],
-+		capture: true,
-+		install_dir: join_paths(get_option('mandir'), 'man1'),
-+		install: true
-+	)
-+endif
- 
- subdir('tests')
--- 
-2.28.0
-
diff --git a/package/ipcalc/0002-Include-stdarg-for-va_list.patch b/package/ipcalc/0002-Include-stdarg-for-va_list.patch
deleted file mode 100644
index 9261ce383c..0000000000
--- a/package/ipcalc/0002-Include-stdarg-for-va_list.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 7795c02fb1e0f5fdbdf949007e52684c590235d4 Mon Sep 17 00:00:00 2001
-From: Derrick Lyndon Pallas <derrick@meter.com>
-Date: Wed, 14 Oct 2020 18:40:38 +0000
-Subject: [PATCH] Include stdarg for va_list
-
-While several function signatures use va_list, stdarg was never included.
-This fixes that.
-
-Signed-off-by: Derrick Lyndon Pallas <derrick@meter.com>
----
- ipcalc.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/ipcalc.h b/ipcalc.h
-index 0e81320..a220dc5 100644
---- a/ipcalc.h
-+++ b/ipcalc.h
-@@ -20,6 +20,8 @@
- #ifndef _IPCALC_H
- #define _IPCALC_H
- 
-+#include <stdarg.h> /* for va_list */
-+
- #if defined(USE_GEOIP)
-   void geo_ip_lookup(const char *ip, char **country, char **ccode, char **city, char  **coord);
-   int geo_setup(void);
--- 
-2.28.0
-
diff --git a/package/ipcalc/ipcalc.hash b/package/ipcalc/ipcalc.hash
index df610eb693..bf9b34a610 100644
--- a/package/ipcalc/ipcalc.hash
+++ b/package/ipcalc/ipcalc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 d7aca371335ab3e35364bcfe34cd0229db005be8bebb9236608ec318cb3f7748  ipcalc-1.0.0.tar.bz2
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  dac080c0773cc14c1d6f818899351d2286cace85751dd9dc704944e54c2c3565  ipcalc-1.0.1.tar.bz2
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ipcalc/ipcalc.mk b/package/ipcalc/ipcalc.mk
index ff9d643389..57376503b7 100644
--- a/package/ipcalc/ipcalc.mk
+++ b/package/ipcalc/ipcalc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPCALC_VERSION = 1.0.0
+IPCALC_VERSION = 1.0.1
 IPCALC_SITE = $(call gitlab,ipcalc,ipcalc,$(IPCALC_VERSION))
 IPCALC_SOURCE = ipcalc-$(IPCALC_VERSION).tar.bz2
 IPCALC_LICENSE = GPL-2.0+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
