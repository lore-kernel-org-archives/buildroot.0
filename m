Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12077C87FCA
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 16:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0585740DA0;
	Sun, 10 Aug 2025 16:30:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x-jWFpq4dYwZ; Sun, 10 Aug 2025 16:30:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BC9740D8C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BC9740D8C;
	Sun, 10 Aug 2025 16:30:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D7390138
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 16:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE79960DB9
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 16:30:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1pNEH95B_XjH for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 16:30:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1782160F47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1782160F47
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1782160F47
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 16:30:38 +0000 (UTC)
Received: from eos.home.n621.de (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id 1F1C8E007C0;
 Sun, 10 Aug 2025 18:30:36 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Simon Dawson <spdawson@gmail.com>, Romain Naour <romain.naour@smile.fr>,
 Florian Larysch <fl@n621.de>
Date: Sun, 10 Aug 2025 18:30:27 +0200
Message-ID: <20250810163029.19877-3-fl@n621.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250810163029.19877-1-fl@n621.de>
References: <20250810163029.19877-1-fl@n621.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1754843436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=521yYZvF7cXiwnbDdfXe4KSIGNeA5rsqganL88zAx3s=;
 b=hV2y+cQiDqN6nONB0+Dos5W3hD5HrmaNSlO1eDuN/nWpaYaHzQp/Bdi+ZwtiyvFf/qvXxd
 qpalusPQJD9dASzS4+jsL0AhNC2ttlFq+04jY9In1+GwOuyetQxz46yC/sA8uGwESvvN4e
 Eqpy4nokqvL5LHAJRy4gVlb9jvmLcYw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=hV2y+cQi
Subject: [Buildroot] [PATCH v2 2/2] package/nanocom: fix build with GCC 15
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

GCC 15 switched to C23 by default, which made "void foo()" equivalent to
"void foo(void)". This causes a build error because init_comm() doesn't
actually take any arguments.

Signed-off-by: Florian Larysch <fl@n621.de>
---
 .../nanocom/0003-fix-build-with-gcc-15.patch  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 package/nanocom/0003-fix-build-with-gcc-15.patch

diff --git a/package/nanocom/0003-fix-build-with-gcc-15.patch b/package/nanocom/0003-fix-build-with-gcc-15.patch
new file mode 100644
index 0000000000..59a2095337
--- /dev/null
+++ b/package/nanocom/0003-fix-build-with-gcc-15.patch
@@ -0,0 +1,19 @@
+GCC 15 switched to C23 by default, which made "void foo()" equivalent to
+"void foo(void)". This causes a build error because init_comm() doesn't
+actually take any arguments.
+
+Upstream: Submitted to author via email
+Signed-off-by: Florian Larysch <fl@n621.de>
+
+diff -purN old/nanocom.c new/nanocom.c
+--- old/nanocom.c	2025-08-10 01:34:12.000284003 +0200
++++ new/nanocom.c	2025-08-10 01:31:05.639050630 +0200
+@@ -329,7 +329,7 @@ int main(int argc, char *argv[]) {
+     memcpy(&pots, &pts, sizeof(pots));
+     
+     /*setup serial port with new settings*/
+-    init_comm(&pts);
++    init_comm();
+         
+     fprintf(stderr,"Press CTRL+T for menu options");   
+     display_state();
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
