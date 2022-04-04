Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81BBC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 12:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72E3360FB6;
	Mon,  4 Apr 2022 12:30:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GTm1D-iQclh4; Mon,  4 Apr 2022 12:30:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9053B60FCF;
	Mon,  4 Apr 2022 12:30:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BD6111BF3D1
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 12:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABA2460B1C
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 12:30:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2YRd3xYzOtI1 for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 12:30:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBC9460A9C
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 12:30:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id ECA4686162; Mon,  4 Apr 2022 12:21:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 14:27:13 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: b27f378ff71380b0dbcbfa5f90764e7c9ae4ccc6
X-Git-Newrev: 143097f780ddbe860d0a06e430d7c3253ecd6250
X-Patchwork-Hint: ignore
Message-Id: <20220404122121.ECA4686162@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/qt5wayland: fix
 compilation when libxkbcommon is disabled
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=143097f780ddbe860d0a06e430d7c3253ecd6250
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

When libxkbcommon is disabled, QT_CONFIG(xkbcommon) is not defined which
means the variable and function pointer in this patch are compiled out
from the header, but the cpp code actually still made use of it. This
patch fixes the build issue when libxkbcommon package is not to be
built.

This patch was taken from (merged):
https://codereview.qt-project.org/c/qt/qtwayland/+/344916

Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 1da911cbde3d744ff70211cf3ea714f55888adc5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Add-missing-define-guards.patch           | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/qt5/qt5wayland/0001-Add-missing-define-guards.patch b/package/qt5/qt5wayland/0001-Add-missing-define-guards.patch
new file mode 100644
index 0000000000..adad3768b2
--- /dev/null
+++ b/package/qt5/qt5wayland/0001-Add-missing-define-guards.patch
@@ -0,0 +1,35 @@
+From 05658e127dedfff65789860415537c6920ec574d Mon Sep 17 00:00:00 2001
+From: Samuli Piippo <samuli.piippo@qt.io>
+Date: Thu, 22 Apr 2021 15:29:56 +0300
+Subject: [PATCH] Add missing define guards
+
+Ammend cca1b94190a094b5d1d7ce492b6533e2d330c5e8 to use m_composeState
+only if xcbcommon is available.
+
+Pick-to: 5.15
+Change-Id: I48332b15def3282c5bda3e1c7c393ea7e9849cbe
+Reviewed-by: Aleix Pol Gonzalez <aleixpol@kde.org>
+[Backported from: 05658e127dedfff65789860415537c6920ec574d]
+Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
+---
+ src/client/qwaylandinputcontext.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/client/qwaylandinputcontext.cpp b/src/client/qwaylandinputcontext.cpp
+index 16e03ea1..cbf63cde 100644
+--- a/src/client/qwaylandinputcontext.cpp
++++ b/src/client/qwaylandinputcontext.cpp
+@@ -408,8 +408,10 @@ bool QWaylandInputContext::isValid() const
+ void QWaylandInputContext::reset()
+ {
+     qCDebug(qLcQpaInputMethods) << Q_FUNC_INFO;
++#if QT_CONFIG(xkbcommon)
+     if (m_composeState)
+         xkb_compose_state_reset(m_composeState);
++#endif
+ 
+     QPlatformInputContext::reset();
+ 
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
