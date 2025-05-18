Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F8CC3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 12:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49B8C40811;
	Sun, 18 May 2025 12:11:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GVMwQ6UWG7mS; Sun, 18 May 2025 12:11:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 882454084E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 882454084E;
	Sun, 18 May 2025 12:11:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B66CDF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 617A840811
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:11:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yWLLJf2KeOHM for <buildroot@buildroot.org>;
 Sun, 18 May 2025 12:11:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 76AAB4084E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76AAB4084E
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 76AAB4084E
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:11:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3ABCF1C0FAD; Sun, 18 May 2025 14:11:37 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>,
 Arnout Vandecappelle <arnout@rnout.be>
Date: Sun, 18 May 2025 14:11:29 +0200
Message-ID: <20250518121131.2821530-2-arnout@rnout.be>
In-Reply-To: <20250518121131.2821530-1-arnout@rnout.be>
References: <20250518121131.2821530-1-arnout@rnout.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747570297; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=+ELuaxwSGWGRhQ8swCpE2awR+F/GRIbjGFcDgyoG2ys=;
 b=dj8RmHPazoPUtNE7k6kp3MCC5+Jpv1XLadK0ltLFCMutDlAsMuXn+qZkUnKQ/grGWt9lJL
 WMSlZ2w9+JzoG7yYssGpE5NEpNvPjUk5jk6chA0kUmSdXT9kazCgaGLP5hZvqFH52OtRnT
 RaN35o7msOBzc1sMsnW6xZsuObfaPIpy216NyvOppkxmkkv508oo0al8tyQS1944+d9tRz
 0A6djeWZY/eL1SU7syHrXQweGIszdwM/oAQ3/zDirCMeGSoC3VmTFqqhl1TZ1bUl1QvDIO
 vJKw5mpyErGTwu31k7PpI44FHU6GE/nxYKl4cm34Q6F1o2PsF0wBcoWPBASC2Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=dj8RmHPa
Subject: [Buildroot] [PATCH 1/3] package/qt5/qt5declarative: fix build with
 GCC 15
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a patch that adds missing #include statements, which becomes an
error in GCC 15.

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 .../0003-Include-cstdint-for-uintptr_t.patch  | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/qt5/qt5declarative/0003-Include-cstdint-for-uintptr_t.patch

diff --git a/package/qt5/qt5declarative/0003-Include-cstdint-for-uintptr_t.patch b/package/qt5/qt5declarative/0003-Include-cstdint-for-uintptr_t.patch
new file mode 100644
index 00000000000..6f6c525eefb
--- /dev/null
+++ b/package/qt5/qt5declarative/0003-Include-cstdint-for-uintptr_t.patch
@@ -0,0 +1,50 @@
+From c8c602382ff5261501e7b323d04fee90fa40be58 Mon Sep 17 00:00:00 2001
+From: Arnout Vandecappelle <arnout@rnout.be>
+Date: Sat, 17 May 2025 21:16:32 +0200
+Subject: [PATCH] Include <cstdint> for uintptr_t
+
+GCC 15 adheres more strictly to the standard about which type is defined
+in which header. As such, uintptr_t is no longer available unless
+cstdint is included.
+
+Add #include <cstdint> in the files that use uintptr_t.
+
+Note that in masm, stdint.h is included instead of cstdint, so leave
+those alone.
+
+Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
+Upstream: https://invent.kde.org/qt/qt/qtdeclarative/-/merge_requests/57
+---
+ src/plugins/scenegraph/openvg/qopenvgoffscreensurface.cpp | 2 ++
+ src/qml/compiler/qv4compiler.cpp                          | 2 ++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/src/plugins/scenegraph/openvg/qopenvgoffscreensurface.cpp b/src/plugins/scenegraph/openvg/qopenvgoffscreensurface.cpp
+index 1f2709e06c..cc3703de64 100644
+--- a/src/plugins/scenegraph/openvg/qopenvgoffscreensurface.cpp
++++ b/src/plugins/scenegraph/openvg/qopenvgoffscreensurface.cpp
+@@ -37,6 +37,8 @@
+ **
+ ****************************************************************************/
+ 
++#include <cstdint>
++
+ #include <QDebug>
+ #include "qopenvgoffscreensurface.h"
+ 
+diff --git a/src/qml/compiler/qv4compiler.cpp b/src/qml/compiler/qv4compiler.cpp
+index 18e19cf01c..3a8df1cd47 100644
+--- a/src/qml/compiler/qv4compiler.cpp
++++ b/src/qml/compiler/qv4compiler.cpp
+@@ -37,6 +37,8 @@
+ **
+ ****************************************************************************/
+ 
++#include <cstdint>
++
+ #include <qv4compiler_p.h>
+ #include <qv4codegen_p.h>
+ #include <private/qv4compileddata_p.h>
+-- 
+2.49.0
+
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
