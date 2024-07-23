Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF04C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 08:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95F5D40452;
	Tue, 23 Jul 2024 08:56:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NvspgZGkOC-q; Tue, 23 Jul 2024 08:56:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53896409ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53896409ED;
	Tue, 23 Jul 2024 08:56:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 980611BF969
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 08:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 848C640288
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 08:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vzWxCtpamj8p for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 08:56:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9E432401FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E432401FB
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E432401FB
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 08:56:51 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3684e8220f9so2037780f8f.1
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 01:56:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721725010; x=1722329810;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+muylb3L8UdpPlQt9KCsFVLSYtuL154pT8DxQk36K+M=;
 b=kkBJpyOItfclzQbizQKHIq3dK6J0If3yHc5xeJBY5jkkq6J6dwwiyaURRdJkSPTmy7
 0NCk3h6OaBBV3Ek2S/cRgtHV++D1oBr1lj8XS2yDSCXVM3E9ylILPEb6HEAeJMlEki36
 znkH629ABa9FBONiTLn/JiMh+/JbnAE/VeMchzPk4kY1ETW81i7LmQe+BPAWqFKBzHAa
 Xw7Q91WGV7vCtCjsObh1GWB1HYbUJBW9nrKam94tL1MmE8XbkVI0WDDBbuUZTS6uK8gh
 hJdJu68Gz76zzCxMKbTqZ2DmxsTFbmQdlnv92d2DfAoFHA8DcXeSawpVacdmfEVahOCa
 3MCg==
X-Gm-Message-State: AOJu0YwmLZIrzgQeYtIcrbFhk5X+wpfMTx1bOzIenplZlip+OBfbYjx5
 1ENYVLmTYciFFQS+0F0NBMbp65ZztskDYnVlkibYwti+lImgo3A6tFdYFQ==
X-Google-Smtp-Source: AGHT+IFVn7uDTDLHsB1U9TcodK/dDdgNmjPexndJYquMgKRXrTeuAVgZ7Nlqwo6yum/IFzdH1HBAbQ==
X-Received: by 2002:a05:6000:1291:b0:367:40eb:a3c3 with SMTP id
 ffacd0b85a97d-369e3f30db6mr1007051f8f.34.1721725009579; 
 Tue, 23 Jul 2024 01:56:49 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368787ec6e5sm10775207f8f.96.2024.07.23.01.56.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 01:56:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 10:56:45 +0200
Message-ID: <20240723085645.732060-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721725010; x=1722329810; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+muylb3L8UdpPlQt9KCsFVLSYtuL154pT8DxQk36K+M=;
 b=fz1f6nIET4z0yOBWZSSnHI0Dli2PrEv8noL6umQiayZlndS4qtPVAnAcrPJ8EvBh3r
 Ca09fw+2wr8MEGHxyBpoSU0wTI+xc5fdLh90Bib3FGd+2y/FDvgQJeur01l5AyWP3X+1
 hs+zvtpwHCDhcDMn4XCnF8+IswZ772cH8JYH2oCNyg8n/M0AEVLgAf+QTY3q7vm2tg2d
 ku69nlwdnB9cOuHfM85MTyqQalfF3Yr/R0b8S9ucKyCF8OG8a1tWO6JbkwkTyaVd4Zbn
 n0wGRoulFisPiWPJUkSGHS77enJse+sij9v+y6+ZKutytQr1z8xZTDQrv5Lelx15YKlv
 QgWw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fz1f6nIE
Subject: [Buildroot] [PATCH 1/1] package/gamin: fix build with gcc >= 14
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

Fix the following build failure with gcc >= 14:

gam_api.c: In function 'gamin_get_user_name':
gam_api.c:123:9: error: implicit declaration of function 'strncpy' [-Wimplicit-function-declaration]
  123 |         strncpy(user_name, pw->pw_name, 99);
      |         ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/b267f53ba6035d256c013dbbbbd1bcdfe0ef111f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../gamin/0004-fix-build-with-gcc-14.patch    | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 package/gamin/0004-fix-build-with-gcc-14.patch

diff --git a/package/gamin/0004-fix-build-with-gcc-14.patch b/package/gamin/0004-fix-build-with-gcc-14.patch
new file mode 100644
index 0000000000..0380c6f120
--- /dev/null
+++ b/package/gamin/0004-fix-build-with-gcc-14.patch
@@ -0,0 +1,104 @@
+From 2e37707a94d20d6772862f18902a62b5ff666a27 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 23 Jul 2024 10:43:54 +0200
+Subject: [PATCH] fix build with gcc >= 14
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ libgamin/gam_api.c      | 1 +
+ server/gam_connection.c | 1 +
+ server/gam_eq.c         | 2 +-
+ server/gam_inotify.c    | 1 +
+ server/gam_listener.c   | 1 +
+ server/gam_node.c       | 1 +
+ server/gam_server.c     | 1 +
+ 7 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/libgamin/gam_api.c b/libgamin/gam_api.c
+index 4e87e63..64e0749 100644
+--- a/libgamin/gam_api.c
++++ b/libgamin/gam_api.c
+@@ -6,6 +6,7 @@
+ #include <pwd.h>
+ #include <stdlib.h>
+ #include <stdio.h>
++#include <string.h>
+ #include <unistd.h>
+ #include <sys/types.h>
+ #include <fcntl.h>
+diff --git a/server/gam_connection.c b/server/gam_connection.c
+index 250b200..8300253 100644
+--- a/server/gam_connection.c
++++ b/server/gam_connection.c
+@@ -3,6 +3,7 @@
+ #include <stdlib.h>             /* for exit() */
+ #include <time.h>
+ #include "gam_connection.h"
++#include "gam_excludes.h"
+ #include "gam_subscription.h"
+ #include "gam_listener.h"
+ #include "gam_server.h"
+diff --git a/server/gam_eq.c b/server/gam_eq.c
+index 79d8f69..b8051c8 100644
+--- a/server/gam_eq.c
++++ b/server/gam_eq.c
+@@ -124,7 +124,7 @@ gam_eq_flush (gam_eq_t *eq, GamConnDataPtr conn)
+ {
+ 	gboolean done_work = FALSE;
+ 	if (!eq)
+-		return;
++		return done_work;
+ 
+ #ifdef GAM_EQ_VERBOSE
+ 	GAM_DEBUG(DEBUG_INFO, "gam_eq: Flushing event queue for %s\n", gam_connection_get_pidname (conn));
+diff --git a/server/gam_inotify.c b/server/gam_inotify.c
+index 35054d6..90a5841 100644
+--- a/server/gam_inotify.c
++++ b/server/gam_inotify.c
+@@ -27,6 +27,7 @@
+ #endif
+ #include "gam_error.h"
+ #include "gam_event.h"
++#include "gam_poll_basic.h"
+ #include "gam_server.h"
+ #include "gam_subscription.h"
+ #include "gam_inotify.h"
+diff --git a/server/gam_listener.c b/server/gam_listener.c
+index 9c41464..085ce2e 100644
+--- a/server/gam_listener.c
++++ b/server/gam_listener.c
+@@ -20,6 +20,7 @@
+ 
+ #include <string.h>
+ #include <glib.h>
++#include "gam_excludes.h"
+ #include "gam_listener.h"
+ #include "gam_subscription.h"
+ #include "gam_server.h"
+diff --git a/server/gam_node.c b/server/gam_node.c
+index d0302d2..ab99042 100644
+--- a/server/gam_node.c
++++ b/server/gam_node.c
+@@ -23,6 +23,7 @@
+ #include "gam_event.h"
+ #include "gam_node.h"
+ #include "gam_error.h"
++#include "gam_server.h"
+ 
+ /**
+  * Create a new node
+diff --git a/server/gam_server.c b/server/gam_server.c
+index f92a691..615eb5a 100644
+--- a/server/gam_server.c
++++ b/server/gam_server.c
+@@ -29,6 +29,7 @@
+ #include "gam_protocol.h"
+ #include "gam_event.h"
+ #include "gam_listener.h"
++#include "gam_poll_basic.h"
+ #include "gam_server.h"
+ #include "gam_channel.h"
+ #include "gam_subscription.h"
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
