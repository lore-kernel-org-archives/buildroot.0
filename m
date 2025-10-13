Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9B5CCD183
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 20:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D267681516;
	Mon, 13 Oct 2025 20:17:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RwfFMzBxXWDD; Mon, 13 Oct 2025 20:17:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADCBE81E3F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADCBE81E3F;
	Mon, 13 Oct 2025 20:17:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 60C8F1C9
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 20:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45D5181E5B
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 20:17:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VWvQ80CZC91F for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 20:17:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 15D6781516
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15D6781516
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 15D6781516
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 20:17:28 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3ee15505cdeso3879139f8f.0
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 13:17:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760386647; x=1760991447;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZAcUBwTSYASRP5hY1OH0472BmqrffyjqHBtvbD67AQk=;
 b=HTC3yuuklBGAdUUSTQbKRgoDBHFn+qHhyUhVFifKNh5/EmZHevXwwOJDsech+0MhVi
 jsvvuX9wqTkF9Q0CvY9WbS7kHfM+/HSLbl7ZWmHyI0SvpLKnaKlxf74+Ewbix5/A1b3m
 dfxL8ZYZXzSxCm2IhatGOMP8Fj+llmX4CuVVta5iks1bkG3jy3JsKq7dj5CTpOBXywhk
 QKhdMi0K8d9VFS1keQCmwMyRUELxtAmu47RMOBxonvtOnRuNi4QqyhQH463PtQHf1DGE
 sjJh+04wR4a9/kife5flnZCDJ0+jivbSoxzPtZm5C9tU055Vx6LKdn8E0riJWvE8TQFP
 md9Q==
X-Gm-Message-State: AOJu0Yx0TD1SaN6a+VmKMoxaFy66AUETljmrkatfs2j6MNlbbUqZEM+g
 WDJbiL9dR7JAEIgbq3ggRz5AbfOBrgy0/WrotPXbHGOILYmNdS51WZGDkHsSC5lcNP8bTfBHqfn
 lfkU1Pb4=
X-Gm-Gg: ASbGncsseybCB8urDTGBLMDRZXNYomJvnzzuHavu+jkjuJNQY0Yu4M8N2YrNlmdGkpL
 CvyyJECsFwMQNZ4y4x7MsTIr79aLHMXdt0OIe29Ql12mfdfU9aqS1sLmuHUB6otJXCUSKhBG/mP
 p6ria4JR2AT3ACF4bJ9Dt0Fz52pF20AoD6K0QP7lnYSPZxfxEX4qxZhARpEyI/4T8PhZFPz41AN
 to5S3M1uGkfyxIXYVG8TwwVHwp8d7o40nj59Lz2JTN+23b98ZFU4tBisFJIuFFIpyIXxwY+bi2J
 vmITH4QtJkhKdd1/8+yRq0pyuvy/k+SOLSHrCKZjdRo76SPd9B876ZLNinJ0WhL2rIUog8BYP1l
 BR6uSk/WNRCFxG8S/ZQJyXYTqNpeJrMAS5OzmjGcqp/go52mg3a9nxTXJVPBfjCJEs11CJgw7dt
 N4Ng==
X-Google-Smtp-Source: AGHT+IEoSCyXqdEoZBrUsBoY5HgF/ehuDgt95AsY/a0ogGUkaGsvs4eFKZn4JiCaGGrnYLhjp8kOfA==
X-Received: by 2002:a05:6000:2681:b0:3ec:d9a8:3700 with SMTP id
 ffacd0b85a97d-4266e7c84cemr14981457f8f.23.1760386646871; 
 Mon, 13 Oct 2025 13:17:26 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.42.9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cf6b4sm20090573f8f.25.2025.10.13.13.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 13:17:26 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 13 Oct 2025 22:17:23 +0200
Message-ID: <20251013201723.3833289-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1760386647; x=1760991447;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZAcUBwTSYASRP5hY1OH0472BmqrffyjqHBtvbD67AQk=;
 b=hWZOpzsdC3+6uaL38Pot13aZQj9YzhPdSTkkwapZjW922yetrRERi9LNqECqVn4Hcr
 1CsRg/+VEbLcZ6nchTu63BfinX/aaqAYZ745PRpanHWqdRxkfxqJOtdmn2rARqnICyoa
 CMVFfrV05hf+hsVtnewcBxohN6YtweVvdMS0A=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=hWZOpzsd
Subject: [Buildroot] [PATCH 1/1] package/gupnp: bump to version 1.6.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The removed patch has been merged in version 1.6.7.

Release notes:
https://gitlab.gnome.org/GNOME/gupnp/-/blob/gupnp-1.6.7/NEWS
https://gitlab.gnome.org/GNOME/gupnp/-/blob/gupnp-1.6.8/NEWS
https://gitlab.gnome.org/GNOME/gupnp/-/blob/gupnp-1.6.9/NEWS

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...ix-compatibility-with-libxml2-2-12-x.patch | 84 -------------------
 package/gupnp/gupnp.hash                      |  4 +-
 package/gupnp/gupnp.mk                        |  2 +-
 3 files changed, 3 insertions(+), 87 deletions(-)
 delete mode 100644 package/gupnp/0001-all-Fix-compatibility-with-libxml2-2-12-x.patch

diff --git a/package/gupnp/0001-all-Fix-compatibility-with-libxml2-2-12-x.patch b/package/gupnp/0001-all-Fix-compatibility-with-libxml2-2-12-x.patch
deleted file mode 100644
index 14f696ca801f..000000000000
--- a/package/gupnp/0001-all-Fix-compatibility-with-libxml2-2-12-x.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 00514fb62ebd341803fa44e26a6482a8c25dbd34 Mon Sep 17 00:00:00 2001
-From: Jens Georg <mail@jensge.org>
-Date: Sat, 25 Nov 2023 17:56:02 +0100
-Subject: [PATCH] all: Fix compatibility with libxml2 2.12.x
-
-Upstream: https://gitlab.gnome.org/GNOME/gupnp/-/commit/00514fb62ebd341803fa44e26a6482a8c25dbd34
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- libgupnp/gupnp-control-point.c        | 2 ++
- libgupnp/gupnp-service-proxy-action.c | 2 ++
- libgupnp/gupnp-service-proxy.c        | 2 ++
- libgupnp/gupnp-xml-doc.c              | 3 +++
- libgupnp/xml-util.h                   | 2 ++
- 5 files changed, 11 insertions(+)
-
-diff --git a/libgupnp/gupnp-control-point.c b/libgupnp/gupnp-control-point.c
-index d4b44721..4374f726 100644
---- a/libgupnp/gupnp-control-point.c
-+++ b/libgupnp/gupnp-control-point.c
-@@ -27,6 +27,8 @@
- #include <config.h>
- #include <string.h>
- 
-+#include <libxml/parser.h>
-+
- #include "gupnp-control-point.h"
- #include "gupnp-context-private.h"
- #include "gupnp-resource-factory-private.h"
-diff --git a/libgupnp/gupnp-service-proxy-action.c b/libgupnp/gupnp-service-proxy-action.c
-index b241d86c..6ea241ad 100644
---- a/libgupnp/gupnp-service-proxy-action.c
-+++ b/libgupnp/gupnp-service-proxy-action.c
-@@ -9,6 +9,8 @@
- 
- #include <config.h>
- 
-+#include <libxml/parser.h>
-+
- #include "gupnp-error.h"
- #include "gupnp-service-proxy.h"
- #include "gvalue-util.h"
-diff --git a/libgupnp/gupnp-service-proxy.c b/libgupnp/gupnp-service-proxy.c
-index adba5ab0..3f1a4454 100644
---- a/libgupnp/gupnp-service-proxy.c
-+++ b/libgupnp/gupnp-service-proxy.c
-@@ -16,6 +16,8 @@
- #include <locale.h>
- #include <errno.h>
- 
-+#include <libxml/globals.h>
-+
- #include "gena-protocol.h"
- #include "gupnp-context-private.h"
- #include "gupnp-error-private.h"
-diff --git a/libgupnp/gupnp-xml-doc.c b/libgupnp/gupnp-xml-doc.c
-index 627f1a28..66f9b3dd 100644
---- a/libgupnp/gupnp-xml-doc.c
-+++ b/libgupnp/gupnp-xml-doc.c
-@@ -15,6 +15,9 @@
- #include <config.h>
- #include <string.h>
- #include <gio/gio.h>
-+
-+#include <libxml/parser.h>
-+
- #include "gupnp-xml-doc.h"
- #include "gupnp-error.h"
- 
-diff --git a/libgupnp/xml-util.h b/libgupnp/xml-util.h
-index a02eb3d4..d0dcaeba 100644
---- a/libgupnp/xml-util.h
-+++ b/libgupnp/xml-util.h
-@@ -10,6 +10,8 @@
- #define GUPNP_XML_UTIL_H
- 
- #include <libxml/tree.h>
-+#include <libxml/parser.h>
-+
- #include <stdarg.h>
- #include <glib-object.h>
- 
--- 
-GitLab
-
diff --git a/package/gupnp/gupnp.hash b/package/gupnp/gupnp.hash
index b8a3fa082e23..61cdd19e5f27 100644
--- a/package/gupnp/gupnp.hash
+++ b/package/gupnp/gupnp.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.gnome.org/sources/gupnp/1.6/gupnp-1.6.6.sha256sum:
-sha256  c9dc50e8c78b3792d1b0e6c5c5f52c93e9345d3dae2891e311a993a574f5a04f  gupnp-1.6.6.tar.xz
+# Hash from: https://download.gnome.org/sources/gupnp/1.6/gupnp-1.6.9.sha256sum:
+sha256  2edb6ee3613558e62f538735368aee27151b7e09d4e2e2c51606833da801869b  gupnp-1.6.9.tar.xz
 
 # Hash for license file:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
index cfcc11418959..7ace1dc25bfb 100644
--- a/package/gupnp/gupnp.mk
+++ b/package/gupnp/gupnp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GUPNP_VERSION_MAJOR = 1.6
-GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).6
+GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).9
 GUPNP_SOURCE = gupnp-$(GUPNP_VERSION).tar.xz
 GUPNP_SITE = https://download.gnome.org/sources/gupnp/$(GUPNP_VERSION_MAJOR)
 GUPNP_LICENSE = LGPL-2.1+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
