Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59ED9EEB57F
	for <buildroot@archiver.kernel.org>; Sat,  9 Sep 2023 07:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D757482073;
	Sat,  9 Sep 2023 07:58:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D757482073
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tFptUPHcQb7l; Sat,  9 Sep 2023 07:58:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93001820F4;
	Sat,  9 Sep 2023 07:58:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93001820F4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F0FAC1BF28C
 for <buildroot@lists.busybox.net>; Sat,  9 Sep 2023 07:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B93B7820C8
 for <buildroot@lists.busybox.net>; Sat,  9 Sep 2023 07:58:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B93B7820C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S_DR1HUBi1TK for <buildroot@lists.busybox.net>;
 Sat,  9 Sep 2023 07:58:04 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B354D82073
 for <buildroot@buildroot.org>; Sat,  9 Sep 2023 07:58:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B354D82073
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-401d80f4ef8so29321715e9.1
 for <buildroot@buildroot.org>; Sat, 09 Sep 2023 00:58:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694246281; x=1694851081;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cDKUb4gnyvMeDS9gHN4aWW+sL3rk4udXRA11fQvDcMg=;
 b=fIrf6PIJ1KMYkmdayTwIdiyVxcDi/a1ITCY1QPETBAZ+Dd+lfCIDZpzgIi6z3Mrp0w
 FGXUljIPfzEh61hXes0eH18x3uUPx3fE9a7XZ3ax0DXC26vuEjrSRTqX3Dp1Zx/5T1LO
 qvMBwS48S21rPYuwgakSpiyaawEoRj22r4vF+SraGDox6ikvk/3u+88eiID0ZptE1zhs
 wLbQ3A2jXfdwvZwMhT8rJT8Y4w/RIgrDSaAdLyb3mZscM/5Gbk8HgkKoVjEJ5ogL79OQ
 T/kk/5vb/NvZtQXLPyesj7LO/4dDERZ5YW0qXQgQiKCPEAgCaheH+hhYer1VBfGlG+9I
 845Q==
X-Gm-Message-State: AOJu0YwsYym/3kmRTzVSGVYPqY0iLqTmQEWmOCZwoEVzAorOXZ9jVaZX
 QvCmKC96H2tCeQBDA3QEy3KjCEaLqXQp1w==
X-Google-Smtp-Source: AGHT+IEpwbbbzvqjcYvG9h4ooq0cRFHkmcrwiMXoHjUoqIDm3poX2WIvj06MZsIxCxRMIXrXp1/amA==
X-Received: by 2002:a1c:6a14:0:b0:401:b908:85a2 with SMTP id
 f20-20020a1c6a14000000b00401b90885a2mr3604333wmc.23.1694246281151; 
 Sat, 09 Sep 2023 00:58:01 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:f478:a81f:8ede:9814])
 by smtp.gmail.com with ESMTPSA id
 y12-20020a1c4b0c000000b003fee9cdf55esm3833262wma.14.2023.09.09.00.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Sep 2023 00:58:00 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sat,  9 Sep 2023 09:57:50 +0200
Message-Id: <20230909075753.7471-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/4] package/webkitgtk: security bump to
 version 2.40.5
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bugfix release with many security fixes, including (but not limited to)
patches for CVE-2023-37450, CVE-2023-38133, CVE-2023-38572, CVE-2023-38592,
CVE-2023-38594, CVE-2023-38595, CVE-2023-38597, CVE-2023-38599,
CVE-2023-38600, and CVE-2023-38611.

Release notes:

  https://webkitgtk.org/2023/07/21/webkitgtk2.40.4-released.html
  https://webkitgtk.org/2023/08/01/webkitgtk2.40.5-released.html

Accompanying security advisory:

  https://webkitgtk.org/security/WSA-2023-0006.html
  https://webkitgtk.org/security/WSA-2023-0007.html

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
v2: no change
---
 ...e-when-gstreamer-support-is-disabled.patch | 36 +++++++++++++++++++
 package/webkitgtk/webkitgtk.hash              |  6 ++--
 package/webkitgtk/webkitgtk.mk                |  2 +-
 3 files changed, 40 insertions(+), 4 deletions(-)
 create mode 100644 package/webkitgtk/0001-Fix-build-failure-when-gstreamer-support-is-disabled.patch

diff --git a/package/webkitgtk/0001-Fix-build-failure-when-gstreamer-support-is-disabled.patch b/package/webkitgtk/0001-Fix-build-failure-when-gstreamer-support-is-disabled.patch
new file mode 100644
index 0000000000..3fa23b215b
--- /dev/null
+++ b/package/webkitgtk/0001-Fix-build-failure-when-gstreamer-support-is-disabled.patch
@@ -0,0 +1,36 @@
+From 9b31965cdf362768e86f7e592e59e68fb3351261 Mon Sep 17 00:00:00 2001
+From: Matt Turner <mattst88@gmail.com>
+Date: Tue, 8 Aug 2023 16:51:25 -0700
+Subject: [PATCH] Fix build failure when gstreamer support is disabled
+ https://bugs.webkit.org/show_bug.cgi?id=259931 https://bugs.gentoo.org/911663
+
+Reviewed by Carlos Alberto Lopez Perez.
+
+* Source/WebCore/loader/MixedContentChecker.cpp:
+
+Canonical link: https://commits.webkit.org/260527.429@fix-build
+
+(cherry picked from commit f5ceef5bf2e3c4d7203a37b9e2d2fdd9b1bb2732)
+
+Upstream: https://github.com/WebKit/WebKit/commit/f5ceef5bf2e3c4d7203a37b9e2d2fdd9b1bb2732
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
+---
+ Source/WebCore/loader/MixedContentChecker.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Source/WebCore/loader/MixedContentChecker.cpp b/Source/WebCore/loader/MixedContentChecker.cpp
+index 9b4c7fe62020..ac4733bc08bc 100644
+--- a/Source/WebCore/loader/MixedContentChecker.cpp
++++ b/Source/WebCore/loader/MixedContentChecker.cpp
+@@ -33,6 +33,8 @@
+ #include "ContentSecurityPolicy.h"
+ #include "Document.h"
+ #include "Frame.h"
++#include "FrameLoader.h"
++#include "FrameLoaderClient.h"
+ #include "SecurityOrigin.h"
+ 
+ namespace WebCore {
+-- 
+2.42.0
+
diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 756ac13ec2..7f50f1aa7b 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,6 +1,6 @@
-# From https://www.webkitgtk.org/releases/webkitgtk-2.40.3.tar.xz.sums
-sha1  74ee7241f2add46897019e22bd4f8e19e09027bb  webkitgtk-2.40.3.tar.xz
-sha256  cc0aa83f40dbc64c1c6ae42ec6b85af4be2a9dbf524cfcb95f89a367fb5098dd  webkitgtk-2.40.3.tar.xz
+# From https://www.webkitgtk.org/releases/webkitgtk-2.40.5.tar.xz.sums
+sha1  2f4d06b021115eb4106177f7d5f534f45b5d3b2e  webkitgtk-2.40.5.tar.xz
+sha256  7de051a263668621d91a61a5eb1c3771d1a7cec900043d4afef06c326c16037f  webkitgtk-2.40.5.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 32f6102797..71599477f2 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.40.3
+WEBKITGTK_VERSION = 2.40.5
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
