Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC174C5AD49
	for <buildroot@archiver.kernel.org>; Thu, 29 May 2025 21:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47C7661660;
	Thu, 29 May 2025 21:04:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 30AnI4WLw0bp; Thu, 29 May 2025 21:04:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B98561652
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B98561652;
	Thu, 29 May 2025 21:04:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C620F1513
 for <buildroot@buildroot.org>; Thu, 29 May 2025 21:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACA8661647
 for <buildroot@buildroot.org>; Thu, 29 May 2025 21:04:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1hqjlY2AH4ky for <buildroot@buildroot.org>;
 Thu, 29 May 2025 21:04:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B692E61643
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B692E61643
 for <buildroot@buildroot.org>; Thu, 29 May 2025 21:04:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A305587597; Thu, 29 May 2025 21:04:15 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 29 May 2025 21:20:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1bdb79ba786c2043b080fe4a7ec1a2dfa9e4e1bb
X-Git-Newrev: 1495863b9807ba70444f8d5ef1ca1136e7669039
X-Patchwork-Hint: ignore
Message-Id: <20250529210415.A305587597@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5declarative: fix build with
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1495863b9807ba70444f8d5ef1ca1136e7669039
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch that adds missing #include statements, which becomes an
error in GCC 15.

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0003-Include-cstdint-for-uintptr_t.patch       | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/package/qt5/qt5declarative/0003-Include-cstdint-for-uintptr_t.patch b/package/qt5/qt5declarative/0003-Include-cstdint-for-uintptr_t.patch
new file mode 100644
index 0000000000..6f6c525eef
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
