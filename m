Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DBE9C61DB9
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 19:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8FF1607A8;
	Thu, 27 Aug 2026 19:47:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AF0NHOlJOaRJ; Thu, 27 Aug 2026 19:47:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787860044;
	bh=J7j4wTivpShzgIJ9Tjq8G8qUCxH2XJARddD9GN4gH/Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KXZ7SpW0zEROk+Ho6CbqpxB419jnyZPEFrB7oOcwOiK2f39lbRufqdJslOumdcPT5
	 C9PppG5mBQiHUxzrGh1mPkAtoAjGyu5l7Au8J5hjo6E8VO8yGSNKV8q1fuqlyPXeh2
	 uV2ofYI0FVjsxIhnqyb6FeIM01ZjVJkv2wXPnauobIxqisVut4wREqgYLxsQRTEUeK
	 s8ccQpvJQShCvb+m5oJkXD6DyREAViD/icoe3SbtSiL1LwGvTnhvEAxRwv2Zm/tzzI
	 pFe7ZmWl3Dg1qm4MEMdKG6xOhTNQtVHonGV9/w/FgDGQIdm69wwnynn1W5fnfr86wp
	 1p3C8nU5GiAag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CF76607A9;
	Thu, 27 Aug 2026 19:47:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 771D9105
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 19:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68C64607A9
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 19:47:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QlHD6ET6HkYo for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 19:47:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3B0F607A8
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 19:47:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 28B1D920E2; Thu, 27 Aug 2026 19:46:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Aug 2026 21:28:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 50a1dd2676bb5a346a8f62cc00842a7e3c016174
X-Git-Newrev: 240ea08d3f1568b463a9bce09da524bbf42e6b99
X-Patchwork-Hint: ignore
Message-Id: <20260827194626.28B1D920E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6: fix c++ static_assert issue
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/240ea08d3f1568b463a9bce09da524bbf42e6b99
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since the last qt6 version bump to 6.11.1 [1], the TestQuazipQt6 fail to
build due to a c++ static_assert issue.

Backport a patch from v6.11.2 release.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/16060153667 (TestQuazipQt6)

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/05cd38635a1c2a8e6c44170b5eae8488b0c7a104

Signed-off-by: Romain Naour <romain.naour@smile.fr>
[Julien: fix link to qt6 version bump commit]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...t_core.cpp-remove-is_always_lock_free-sta.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/qt6/qt6base/0001-qtestsupport_core.cpp-remove-is_always_lock_free-sta.patch b/package/qt6/qt6base/0001-qtestsupport_core.cpp-remove-is_always_lock_free-sta.patch
new file mode 100644
index 0000000000..3347caa8da
--- /dev/null
+++ b/package/qt6/qt6base/0001-qtestsupport_core.cpp-remove-is_always_lock_free-sta.patch
@@ -0,0 +1,41 @@
+From 2983318421d623c6c9feff95ff947ca489f4313d Mon Sep 17 00:00:00 2001
+From: Mitch Curtis <mitch.curtis@qt.io>
+Date: Mon, 11 May 2026 08:41:08 +0800
+Subject: [PATCH] qtestsupport_core.cpp: remove is_always_lock_free
+ static_assert
+
+This causes a build failure when cross-compiling Qt for MIPS32 targets
+(e.g. `mips-unknown-linux-musl`, `mipsel-unknown-linux-musl`).
+
+Amends 9b938823776865837901f29082301f5624ac2b04.
+
+Fixes: QTBUG-146670
+Change-Id: I170bd9f93c1ef809f56e5b36835e457bbbe8e16c
+Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
+Reviewed-by: Qt Cherry-pick Bot <cherrypick_bot@qt-project.org>
+
+Upstream: https://github.com/qt/qtbase/commit/2983318421d623c6c9feff95ff947ca489f4313d
+[Romain: backport to 6.11.1]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ src/corelib/kernel/qtestsupport_core.cpp | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/src/corelib/kernel/qtestsupport_core.cpp b/src/corelib/kernel/qtestsupport_core.cpp
+index 9bbe1c18e84..5f28cedec68 100644
+--- a/src/corelib/kernel/qtestsupport_core.cpp
++++ b/src/corelib/kernel/qtestsupport_core.cpp
+@@ -8,10 +8,6 @@
+ 
+ using namespace std::chrono_literals;
+ 
+-// Assert that this instantiation of std::atomic is always lock-free so we
+-// know that no code will execute on destruction.
+-static_assert(std::atomic<std::chrono::milliseconds>::is_always_lock_free);
+-
+ QT_BEGIN_NAMESPACE
+ 
+ // ### Qt 7: reduce the default: QTBUG-138160
+-- 
+2.55.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
