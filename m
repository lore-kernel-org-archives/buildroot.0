Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6D3CCA476
	for <buildroot@archiver.kernel.org>; Tue,  7 Oct 2025 20:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D01D340AF4;
	Tue,  7 Oct 2025 20:49:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rx7UWI7HsTt4; Tue,  7 Oct 2025 20:49:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7BB540AEC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7BB540AEC;
	Tue,  7 Oct 2025 20:49:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 887DF9DA
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 20:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A10660B35
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 20:49:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4hmYSK-WpPvp for <buildroot@buildroot.org>;
 Tue,  7 Oct 2025 20:49:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ADBC660B46
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADBC660B46
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ADBC660B46
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 20:49:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0845.dip0.t-ipconnect.de [91.58.8.69])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 63911A4C5FDD
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 22:49:19 +0200 (CEST)
Received: from [192.168.1.144] (port=45350 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v6EcZ-000000000ct-0Gys
 for buildroot@buildroot.org; Tue, 07 Oct 2025 20:49:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  7 Oct 2025 22:49:18 +0200
Message-ID: <20251007204919.3783289-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759870159;
 bh=pV5mVQjytc6DpYlNet55cM3PdvpJwO6b0ZE+4GdojSk=;
 h=From:To:Subject:Date:From;
 b=ZNYQwkWnqTMi9fP8vE0mTA30OVK8BJ1DiDzLRTtIvJdlny3qy9zrf4MeAAX8oruNI
 rDy2t8cRcz8nZBB+3qWgYOwGq3TsERwzQumon+URF6lRV6nGud+XMrE+SwTYthSkgp
 H6FOd5UZhavKVY/KN9QBNRhJh2XIk+NNtGc4cem7MlLBkmZ1PG3X/jGhvadkQFTDwm
 VdHPvdCwoocuFoi5kqnSpl/HF1LGy9ihp8pUbaeYoXrgqr6inxZo89rlZPttwRck1q
 DHIRieqiS+zol29tFdjEzjG1/Z7ylgpNtNPsjUpy1gpI4yWVetDMb5Soc4lJRA83gp
 d20DH8fvM4dRw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=ZNYQwkWn
Subject: [Buildroot] [PATCH 1/1] package/libdisplay-info: include
 sys/types.h to fix build error
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

Fixes: https://autobuild.buildroot.org/results/2d72feabdd0c9e1c9aa89e6d683d5f5ae0bb942d/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-cta-include-sys-types.h.patch        | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/libdisplay-info/0001-cta-include-sys-types.h.patch

diff --git a/package/libdisplay-info/0001-cta-include-sys-types.h.patch b/package/libdisplay-info/0001-cta-include-sys-types.h.patch
new file mode 100644
index 0000000000..f56e41d7b4
--- /dev/null
+++ b/package/libdisplay-info/0001-cta-include-sys-types.h.patch
@@ -0,0 +1,35 @@
+From e569a92539c96acd2a618729827c8fbf3659d803 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Tue, 7 Oct 2025 22:44:01 +0200
+Subject: [PATCH] cta: include sys/types.h
+
+Fixes build error with uClibc-based toolchain and gcc 15.2.0 found by
+Buildroot autobuilders[1]:
+
+../cta.c: In function 'parse_vendor_hdmi_block':
+../cta.c:168:15: error: unknown type name 'ssize_t'; did you mean 'size_t'?
+
+[1] https://autobuild.buildroot.org/results/2d72feabdd0c9e1c9aa89e6d683d5f5ae0bb942d/
+
+Upstream: https://gitlab.freedesktop.org/emersion/libdisplay-info/-/merge_requests/201
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ cta.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/cta.c b/cta.c
+index 12187cc..53edfca 100644
+--- a/cta.c
++++ b/cta.c
+@@ -4,6 +4,7 @@
+ #include <math.h>
+ #include <stdlib.h>
+ #include <string.h>
++#include <sys/types.h>
+ 
+ #include "bits.h"
+ #include "cta.h"
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
