Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881D1C433EF
	for <buildroot@archiver.kernel.org>; Mon, 28 Mar 2022 19:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 515F3410BB;
	Mon, 28 Mar 2022 19:59:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TJ4uRkJsLadl; Mon, 28 Mar 2022 19:59:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 693F6415B3;
	Mon, 28 Mar 2022 19:59:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A32411BF2BA
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D4BF4015C
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:58:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jxczEZpzb1Eg for <buildroot@lists.busybox.net>;
 Mon, 28 Mar 2022 19:58:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9732E401EE
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 19:58:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 99EDB85F40; Mon, 28 Mar 2022 19:48:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 28 Mar 2022 21:51:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ba8f35eda65d3623967e35547d6bec38f5ebc66a
X-Git-Newrev: 1da911cbde3d744ff70211cf3ea714f55888adc5
X-Patchwork-Hint: ignore
Message-Id: <20220328194854.99EDB85F40@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5wayland: fix compilation when
 libxkbcommon is disabled
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

commit: https://git.buildroot.net/buildroot/commit/?id=1da911cbde3d744ff70211cf3ea714f55888adc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
