Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24ECEE7FEF
	for <buildroot@archiver.kernel.org>; Fri,  8 Sep 2023 12:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F1714150F;
	Fri,  8 Sep 2023 12:54:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F1714150F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XNvYGHFJY_Wc; Fri,  8 Sep 2023 12:54:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC4E84157D;
	Fri,  8 Sep 2023 12:54:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC4E84157D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DEECB1BF2A2
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 12:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B625A4150F
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 12:54:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B625A4150F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o8lsvyQMUWaN for <buildroot@lists.busybox.net>;
 Fri,  8 Sep 2023 12:54:15 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 391E5414E4
 for <buildroot@buildroot.org>; Fri,  8 Sep 2023 12:54:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 391E5414E4
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-401c90ed2ecso21751575e9.0
 for <buildroot@buildroot.org>; Fri, 08 Sep 2023 05:54:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694177653; x=1694782453;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QJ2jDidDHPkKRxSghPm0vtkyW7xXLiZXIc+WGCvNK14=;
 b=dP60MP5XDdwFwNHPO5Z4WX/o4VXZQ1pHfXnSqdVCYnvYl2MAGkg8uC+psiEsCeOpiu
 34R4eIfdZGcwnROK7MSfL75nXq+o6f8iYegpQyzKWagaBULc6tsPVyGkXyYMidHuWByn
 mTWkO38AKBg2zTAGUGDcMH+ghKz9C8+VKRmOILuJaELjcvAhht/k8NRaoJ5WpydlMhAT
 9fdRi98q9P1nPKDMBmuj2S6WlPTfiCrxAkpGPQJ91FxhLeenEnXW0ESazn7MU2cW1cMs
 gPWHHHfciTPmge8oWUMiymc5vdGkVfPWItQXd04tkva01TO+KrySvhdr7M2pUb2z/5Yn
 NNrg==
X-Gm-Message-State: AOJu0YzinZOt9J+6oyUyNRDBt6K3iL2hN6g27so9Wfnf0cawe3wtUs0f
 CeDg1u9AlUdEEMkJ/yvDDk0Nw1gHyRX/Gw==
X-Google-Smtp-Source: AGHT+IHIIXiIA9Q2RKRBNShienfGHm6AFcnZnQFOqlqcWchXey7tZspUa3ypBUqp2Ot2ihopJ18m0Q==
X-Received: by 2002:a1c:f70a:0:b0:401:aa8f:7566 with SMTP id
 v10-20020a1cf70a000000b00401aa8f7566mr1829783wmh.26.1694177652507; 
 Fri, 08 Sep 2023 05:54:12 -0700 (PDT)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 w3-20020a05600c014300b003fefe70ec9csm5133890wmm.10.2023.09.08.05.54.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Sep 2023 05:54:12 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Fri,  8 Sep 2023 14:53:57 +0200
Message-ID: <20230908125400.3722455-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230413142927.3137190-1-aperez@igalia.com>
References: <20230413142927.3137190-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694177653; x=1694782453; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QJ2jDidDHPkKRxSghPm0vtkyW7xXLiZXIc+WGCvNK14=;
 b=GgpYrkYxZMRJmD7/AUxNjfbhL5r/VkgeY5NZc+RTtHhC7gs7kOrhQF4YJny6/w02lY
 2xkLSoKKPWrqFvUMHIdNScQNrgmVZ0sg0Xq/J09aZPpZKq+kNu+38TyVPx+o1ZejmVsZ
 02RhW4tVZYJvV5//tosDYxTqQPzZ+qKKZLMu4dAPVkFvAsl0R+8Xuczs+Gz2NbhAXNaM
 g1xGql65maBNRAeO//uXqgq1OSWY+cz0C4B9rzi6eSGiyQ7JzQQbe34u3bidjNJNiEHs
 hAzzP2x9PBLziVjzjvjnZmSSzB33kf4iu3uM3UUYF9r+UCVK5c3BTRvjFo6YSiRODZNN
 lLsw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=GgpYrkYx
Subject: [Buildroot] [PATCH v1 1/4] package/webkitgtk: security bump to
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
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
