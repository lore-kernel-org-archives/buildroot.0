Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D270FCD13CF
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 20:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 861CB4048E;
	Sun, 17 Sep 2023 20:14:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 861CB4048E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SRFEShAu1JN2; Sun, 17 Sep 2023 20:14:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7DD7F4054E;
	Sun, 17 Sep 2023 20:13:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DD7F4054E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D825C1BF399
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 20:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B11DA81E78
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 20:13:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B11DA81E78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pvRKXN_kOs3z for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 20:13:57 +0000 (UTC)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA10981E77
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 20:13:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA10981E77
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-31ad779e6b3so3675845f8f.2
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 13:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694981634; x=1695586434;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3sGN4ehyao+8ztATfvJ1Me7OlwvaUv+HN9oikBQ5edI=;
 b=DbtVhfnXxRZ2FioaQ4MmAqp0T0aXAGMZ+zpOfqvOXxxaZYHLQQ13xahaheoI77pIWH
 Rl3ngEe2KC5X2Lt/0wKSV+7KEUqz7hgEDrYG9lgggRIjDzZbnsrc7SB+m24YPYGxZgCy
 3gxFgInse2pqwrWnNWe5xBPLEwd4u7sF3PTOaWRaLrJy+DS7htJzROgY9CeOU8Wx3lsz
 b0nHhpwiGpre6Wrc4fMI1nnQxXzeD1i3L1l0twvboYhNHvuMdNQUh+fYTAQGecs/cb6f
 kwcgPG3fa3FF0Pl/RWwRTxvQEmPbYUQHH0ZBqWeJt2aSDvdzw1cdQY8LyZD8LfKMPmQf
 JpjA==
X-Gm-Message-State: AOJu0YzQvWFpS2eLuvuHIsleAQVf5sgH4jZE+NGsPyMGlv/Q2aiOiMkH
 6149tjh7VPw6ggRZ1bOvApIBpHGK6nE=
X-Google-Smtp-Source: AGHT+IH0MWnIh2ZSqI3qOIJAUZTAirgnfHaQrwl3uO4Lf77q7pkEbSgTlZEdRgURvfq85qRE/OhzQg==
X-Received: by 2002:a5d:484a:0:b0:319:7428:9ca0 with SMTP id
 n10-20020a5d484a000000b0031974289ca0mr5724101wrs.61.1694981634188; 
 Sun, 17 Sep 2023 13:13:54 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 u8-20020a5d6ac8000000b003179b3fd837sm10431422wrw.33.2023.09.17.13.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Sep 2023 13:13:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 17 Sep 2023 22:13:48 +0200
Message-Id: <20230917201348.1124404-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694981634; x=1695586434; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3sGN4ehyao+8ztATfvJ1Me7OlwvaUv+HN9oikBQ5edI=;
 b=AOlHsN5ZCissY5YUkZAeDlnbQwhTIyUfSnSrcZc7zbMSfIT5w/pM9PjGjxTiyzp7/a
 yC8m6UpZc4CwAH8kiye3BIMO+FjCmuPkT0LqN4yQMGACF/d3uNgbas102JF3ctKGSOFf
 VYuDGeNvR7r3YWF2NaTcYBSLSuBQ0w4EEoCupLgrLiGvrQxhNN1XqxVN8b0qWGWNW5uX
 +ONNGvJJm4mScIkhwq/plRp7CKfj9uRJRwcb7O2WmD5DWc5gr4fprVigkpoLoYt3Gfyn
 OK/jh8u3ZlN8CHhl/VMFvrBVIinz4bbZPeXnalA0d2CH/LO7qCI+EJ5bwc1xmbL+lo84
 ns3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AOlHsN5Z
Subject: [Buildroot] [PATCH 1/1] package/pound: include limits.h
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

Fix the following build failure raised since bump to version 4.8 in
commit 525cb6a8fbe04a959ea6e3a21a3f6f8828d7e9dc and
https://github.com/graygnuorg/pound/commit/c951f2357d9f606a9e1f8727e74b55f1da91fa2f:

Fixes:
 - http://autobuild.buildroot.org/results/4edfffcd5d4383c57947d97139331e0bf2cb6155

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pound/0001-include-limits.h.patch | 75 +++++++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 package/pound/0001-include-limits.h.patch

diff --git a/package/pound/0001-include-limits.h.patch b/package/pound/0001-include-limits.h.patch
new file mode 100644
index 0000000000..8f188af07c
--- /dev/null
+++ b/package/pound/0001-include-limits.h.patch
@@ -0,0 +1,75 @@
+From a0374d946e55129b36ba1e0024e1d94675a8f044 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 17 Sep 2023 22:01:21 +0200
+Subject: [PATCH] include limits.h
+
+Include limits.h to avoid the following build failure:
+
+poundctl.c: In function 'oi_getn':
+poundctl.c:232:29: error: 'INT_MAX' undeclared (first use in this function)
+  232 |   if (errno || n < 0 || n > INT_MAX)
+      |                             ^~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/4edfffcd5d4383c57947d97139331e0bf2cb6155
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/graygnuorg/pound/pull/17
+---
+ src/config.c   | 1 +
+ src/poundctl.c | 1 +
+ src/svc.c      | 1 +
+ src/tmpl.c     | 1 +
+ 4 files changed, 4 insertions(+)
+
+diff --git a/src/config.c b/src/config.c
+index b7e3150..12f5cfa 100644
+--- a/src/config.c
++++ b/src/config.c
+@@ -21,6 +21,7 @@
+ #include "extern.h"
+ #include <openssl/x509v3.h>
+ #include <assert.h>
++#include <limits.h>
+ 
+ 
+ /*
+diff --git a/src/poundctl.c b/src/poundctl.c
+index bd1459f..7fa18c8 100644
+--- a/src/poundctl.c
++++ b/src/poundctl.c
+@@ -19,6 +19,7 @@
+ #include "pound.h"
+ #include "json.h"
+ #include <assert.h>
++#include <limits.h>
+ 
+ char *conf_name = POUND_CONF;
+ char *socket_name;
+diff --git a/src/svc.c b/src/svc.c
+index 6e810a6..457f1e0 100644
+--- a/src/svc.c
++++ b/src/svc.c
+@@ -20,6 +20,7 @@
+ #include "pound.h"
+ #include "extern.h"
+ #include "json.h"
++#include <limits.h>
+ 
+ /*
+  * basic hashing function, based on fmv
+diff --git a/src/tmpl.c b/src/tmpl.c
+index 2efa72f..0e5b65d 100644
+--- a/src/tmpl.c
++++ b/src/tmpl.c
+@@ -26,6 +26,7 @@
+ 
+ #include "pound.h"
+ #include <assert.h>
++#include <limits.h>
+ #include "json.h"
+ 
+ static void
+-- 
+2.40.1
+
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
