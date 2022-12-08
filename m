Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440B8C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 20:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFE8381DAB;
	Thu,  8 Dec 2022 20:27:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFE8381DAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iF6HfZ-BHRcR; Thu,  8 Dec 2022 20:27:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB47781D11;
	Thu,  8 Dec 2022 20:27:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB47781D11
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BA64D1BF591
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 20:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2D1440339
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 20:27:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2D1440339
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dw_OjUByPcuA for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 20:27:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F9A0401B7
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F9A0401B7
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 20:27:28 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so4346675wma.1
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 12:27:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UBGg8Px5/sYYVHXbUPOcLG4s1PtRX9o5yhPWfJavHO4=;
 b=URRele1+camkVDDHoCsmg+0KoHnkiHG9pgyQH0KIPOo8jg0MP1sFTSH9aph+UzMlXv
 pqtKnfF/yAp8xt4kseRoFwihEtBJQ1yRJZOg8edkji+Pqleq/il6zUucRFKjWu+ax/wT
 bzOk++/k/XcURqnTi1rIkI/fScYxY6e3CGNJA6XnsLoGRZqNvwRJrltlFa3ccyzWhSDU
 vx8ayVNIQLI6mWadgJjJfVu25IRcy1yrAHic8n+y+Xt+w6ttKIDWmZpzJ1C++TfbS7SO
 zCiIsyLwTxP2XYTbUTiCmpLEDcTxthbzuSkuUn75PjGwyJgnwULXQFlZphwKZ7IFbwwl
 FdvA==
X-Gm-Message-State: ANoB5plofPsx5dAYX/u8mlMVFhlvVt2l4vY1IrUS1T+CZ/xKCgZSInbW
 5m3cBnZ/jftmRiVCmQ7uI3Ju6iQdmGc=
X-Google-Smtp-Source: AA0mqf4gc4r0VTgNmYi9Z29uoHk32b3zzz6BHwGkXIUxDnVjxeEp94/KmlleRhQ+65c4wy91G+z5gA==
X-Received: by 2002:a05:600c:1d09:b0:3c6:e63d:adb3 with SMTP id
 l9-20020a05600c1d0900b003c6e63dadb3mr2851349wms.35.1670531246053; 
 Thu, 08 Dec 2022 12:27:26 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 q128-20020a1c4386000000b003c71358a42dsm7756691wma.18.2022.12.08.12.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 12:27:25 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 21:27:21 +0100
Message-Id: <20221208202721.5592-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UBGg8Px5/sYYVHXbUPOcLG4s1PtRX9o5yhPWfJavHO4=;
 b=UIGYQlcGuOOv7MKgcrQkUYPJEx0Zj/yHH5QLWI2t7IfV8gCGPbtNh7EEft0oOTv7OS
 5wciexuXEzROxkdsjUk9/vIZ3Xg77jU+x++x268OoPCps92wnvyB4Q4jns9YC2NNdQNS
 GURTXTg8q08p7ihURw8uZVftCXixjJyuVKJgzKNTdy0OBTMVyL7t/O1OP7BsMu2P7YWL
 U8a2OveqzHp6mxLh9NdvjkQN+SMngLVhR3S+woZMfqa4ajzjb8B6NyH4V39qW2fbtgFC
 bv+qTKGhUE7IXEaEl1KTSAfbhBZFmQv+NnkulkCfy8v9UhhU7XmxJq8YRIOBEkS456bl
 F5rQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UIGYQlcG
Subject: [Buildroot] [PATCH 1/1] package/lttng-tools: bump to version 2.13.8
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
Cc: Philippe Proulx <eeppeliteloop@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This bump will fix the following build failure without NPTL thanks to
https://github.com/lttng/lttng-tools/commit/27f2b8400c9db484cd195c4240c379e845b1413d
which is raised since bump to version 2.13.2 in commit
8e5f2d0f8e8c04e98f8761f3cba683c56bbefc8c and
https://github.com/lttng/lttng-tools/commit/014d7d3b5e9d69989bf776cffb6c21ff7e1d36ff:

In file included from thread.c:10:
../../src/common/compat/pthread.h: In function 'lttng_pthread_setname_np':
../../src/common/compat/pthread.h:63:27: error: 'LTTNG_UST_ABI_PROCNAME_LEN' undeclared (first use in this function)
   63 |         if (strnlen(name, LTTNG_UST_ABI_PROCNAME_LEN) >= LTTNG_UST_ABI_PROCNAME_LEN) {
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~

https://github.com/lttng/lttng-tools/blob/v2.13.8/ChangeLog

Fixes:
 - http://autobuild.buildroot.org/results/bbc8d6621822bb5da7513331e69799ca25a03f66

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lttng-tools/lttng-tools.hash | 4 ++--
 package/lttng-tools/lttng-tools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lttng-tools/lttng-tools.hash b/package/lttng-tools/lttng-tools.hash
index 5b5f55da30..b48904d0b9 100644
--- a/package/lttng-tools/lttng-tools.hash
+++ b/package/lttng-tools/lttng-tools.hash
@@ -1,5 +1,5 @@
-# From https://lttng.org/files/lttng-tools/lttng-tools-2.13.2.tar.bz2.sha256
-sha256  ced2ba00020da77fd17ac92b5a53825502409a07e3aeca28f9515d4a844fd7bd  lttng-tools-2.13.2.tar.bz2
+# From https://lttng.org/files/lttng-tools/lttng-tools-2.13.8.tar.bz2.sha256
+sha256  b1e959579b260790930b20f3c7aa7cefb8a40e0de80d4a777c2bf78c6b353dc1  lttng-tools-2.13.8.tar.bz2
 
 # Locally computed
 sha256  068e55c7dbe597400199aee75ac5e71bdb2ca88c4c9a4cfa8e1fbc61f933eda5  LICENSE
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index efa22a52e3..add1f12a8c 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_TOOLS_VERSION = 2.13.2
+LTTNG_TOOLS_VERSION = 2.13.8
 LTTNG_TOOLS_SITE = https://lttng.org/files/lttng-tools
 LTTNG_TOOLS_SOURCE = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 LTTNG_TOOLS_INSTALL_STAGING = YES
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
