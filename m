Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48E2C3601A
	for <buildroot@archiver.kernel.org>; Fri,  4 Apr 2025 16:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 628816F4D6;
	Fri,  4 Apr 2025 16:48:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E-O2cLwHT-m2; Fri,  4 Apr 2025 16:48:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71F7760B7C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71F7760B7C;
	Fri,  4 Apr 2025 16:48:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1463F117
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 16:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 064CD40C4E
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 16:48:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y-UwrkPrNSry for <buildroot@buildroot.org>;
 Fri,  4 Apr 2025 16:48:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.157.188.11;
 helo=smtp-bc0b.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 142624202C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 142624202C
Received: from smtp-bc0b.mail.infomaniak.ch (smtp-bc0b.mail.infomaniak.ch
 [45.157.188.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 142624202C
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 16:48:13 +0000 (UTC)
Received: from smtp-4-0001.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:7:10:40ca:feff:fe05:1])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4ZTl0T5sF0z7k;
 Fri,  4 Apr 2025 18:48:09 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4ZTl0T205dzkvV; Fri,  4 Apr 2025 18:48:09 +0200 (CEST)
From: Quentin Schulz <foss+buildroot@0leil.net>
Date: Fri, 04 Apr 2025 18:47:33 +0200
MIME-Version: 1.0
Message-Id: <20250404-libcamera-0-5-0-v1-2-e2ca9d029aeb@cherry.de>
References: <20250404-libcamera-0-5-0-v1-0-e2ca9d029aeb@cherry.de>
In-Reply-To: <20250404-libcamera-0-5-0-v1-0-e2ca9d029aeb@cherry.de>
To: buildroot@buildroot.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=0leil.net
Subject: [Buildroot] [PATCH 2/9] package/libcamera: fix documentation being
 built even if disabled
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

From: Quentin Schulz <quentin.schulz@cherry.de>

We currently disable building the documentation via the "documentation"
feature, but it is enabled nonetheless by meson if sphinx-build-3 is
found on the host.

This makes sure it doesn't happen by making the sphinx-build-3 check
only happen when the "documentation" feature is "auto" or "enabled",
which isn't the case for Buildroot.

The bug seems to have been introduced in v0.0.1 release.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 ...t-automatically-build-documentation-if-sp.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/libcamera/0001-meson-do-not-automatically-build-documentation-if-sp.patch b/package/libcamera/0001-meson-do-not-automatically-build-documentation-if-sp.patch
new file mode 100644
index 0000000000000000000000000000000000000000..d8975a86cb431ea44b19e168904157dda8a4b018
--- /dev/null
+++ b/package/libcamera/0001-meson-do-not-automatically-build-documentation-if-sp.patch
@@ -0,0 +1,42 @@
+From 1e4db1f9792e4343231a1cf36aa553404a534828 Mon Sep 17 00:00:00 2001
+From: Quentin Schulz <quentin.schulz@cherry.de>
+Date: Fri, 4 Apr 2025 18:01:33 +0200
+Subject: [PATCH] meson: do not automatically build documentation if
+ sphinx-build-3 is found
+
+Commit aba567338b25 ("Documentation: Move all dependencies into
+features") did an incomplete migration of the documentation boolean
+option into a documentation feature.
+
+If sphinx-build-3 binary is found on the host system, the documentation
+is built, regardless of the value of the feature option.
+
+This makes sure that sphinx-build-3 presence is only checked if the
+documentation feature is not disabled (which is the default, as it's
+"auto" by default).
+
+This is essential for reproducibility for build systems where
+sphinx-build-3 may or may not be present when libcamera is built, and
+also to declutter the generated package if documentation isn't desired.
+
+Fixes: aba567338b25 ("Documentation: Move all dependencies into features")
+Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
+Upstream: https://lists.libcamera.org/pipermail/libcamera-devel/2025-April/049705.html
+Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
+---
+ Documentation/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Documentation/meson.build b/Documentation/meson.build
+index 6158320e..c59849f6 100644
+--- a/Documentation/meson.build
++++ b/Documentation/meson.build
+@@ -116,7 +116,7 @@ endif
+ # Sphinx
+ #
+ 
+-sphinx = find_program('sphinx-build-3', required : false)
++sphinx = find_program('sphinx-build-3', required : get_option('documentation'))
+ if not sphinx.found()
+     sphinx = find_program('sphinx-build', required : get_option('documentation'))
+ endif

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
