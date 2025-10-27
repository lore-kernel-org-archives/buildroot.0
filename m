Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC44CCF9EB
	for <buildroot@archiver.kernel.org>; Mon, 27 Oct 2025 19:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8719F84379;
	Mon, 27 Oct 2025 19:18:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N4f2jggeHEfs; Mon, 27 Oct 2025 19:18:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAC2E8437A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAC2E8437A;
	Mon, 27 Oct 2025 19:18:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3852070B
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 19:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1ED7C411FB
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 19:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F2EOPQFOybOJ for <buildroot@buildroot.org>;
 Mon, 27 Oct 2025 19:18:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3FA3541426
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FA3541426
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3FA3541426
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 19:18:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a04a9.dip0.t-ipconnect.de [91.58.4.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E41DDA4C4BE7;
 Mon, 27 Oct 2025 20:18:29 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48874)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vDSjd-000000000hD-3HYW;
 Mon, 27 Oct 2025 19:18:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Carsten Schoenert <c.schoenert@gmail.com>
Date: Mon, 27 Oct 2025 20:18:29 +0100
Message-ID: <20251027191829.1129021-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761592709;
 bh=5+/8uGeLmXvdgBbvt9tw0tg4T8utE3gwAOBg0Xn2iXo=;
 h=From:To:Cc:Subject:Date:From;
 b=H7k7RdfwN/RLFsc78WnrPeJZBHfpdMMeAUs0p3rylGM+jyWopkDKP29oU+I3mDifs
 Lv9eS3NyY9d2YTuY7jsq6F2C/dA13yA+UObMlTxBJ0aYQPgo2KEGrlx5wSufmgioEp
 5xKuMqEj0PgiXg+QbLfBOWHjpoZHtKIqgu9yzypI4yyB+onNIN3QUkcZVcYPMF48Ye
 URIlNxkT4nm+WXCsuv2TKsKD9539DU/VplMQ2cewTa7JiLs/ouc3OuXYScf537qXcG
 a8aB5z0Qr96Af5PeouVs6OUG6Qf11nOdW1eApCaNSTemspn/taLSSRgDRdHggdj0pA
 BLStrxjFVQLeA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=H7k7Rdfw
Subject: [Buildroot] [PATCH 1/1] package/libsvg: fix build with gcc 14.x
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

Fixes:
https://autobuild.buildroot.net/results/12e/12e2481afb8acd3149f7ce5692d0f113f2419cd3/

No active upstream was found:
https://lists.freedesktop.org/pipermail/cairo/2010-July/020272.html
https://www.freshports.org/graphics/libsvg/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libsvg/0003-stdlib.patch | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 package/libsvg/0003-stdlib.patch

diff --git a/package/libsvg/0003-stdlib.patch b/package/libsvg/0003-stdlib.patch
new file mode 100644
index 0000000000..8434d3b4e1
--- /dev/null
+++ b/package/libsvg/0003-stdlib.patch
@@ -0,0 +1,18 @@
+Add stdlib.h include to fix build with gcc 14.x
+
+Upstream: dead
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+diff -uNr libsvg-0.1.4.orig/src/svgint.h libsvg-0.1.4/src/svgint.h
+--- libsvg-0.1.4.orig/src/svgint.h	2005-06-03 18:17:59.000000000 +0200
++++ libsvg-0.1.4/src/svgint.h	2025-10-27 19:40:34.231457892 +0100
+@@ -23,6 +23,8 @@
+ #ifndef SVGINT_H
+ #define SVGINT_H
+ 
++#include <stdlib.h>
++
+ #ifdef LIBSVG_EXPAT
+ 
+ #include <expat.h>
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
