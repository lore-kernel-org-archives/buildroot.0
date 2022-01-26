Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C89C28CF5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 20:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F40E360F96;
	Wed, 26 Jan 2022 20:14:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CZm0ZR447r-n; Wed, 26 Jan 2022 20:14:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DF9260F8B;
	Wed, 26 Jan 2022 20:14:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0D0951BF4D5
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDE6160BD3
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:13:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A2VoUP8Hvn94 for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 20:13:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51276600CA
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 20:13:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 083F58255D; Wed, 26 Jan 2022 20:06:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 21:12:34 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: d3650dfb892fd85205dca7c563ab50b355d316d6
X-Git-Newrev: eed125b1ca46965f43ffe699b3c307ab496c0835
X-Patchwork-Hint: ignore
Message-Id: <20220126200652.083F58255D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/python-pyqt5: Fix
 per-package build
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

commit: https://git.buildroot.net/buildroot/commit/?id=eed125b1ca46965f43ffe699b3c307ab496c0835
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

pyqt5 uses qmake internally, but is python package rather than a qmake
package. Therefore, we need to manually apply the same fixup as for
qmake packages.

Without this, top-level parallel build may fail because dependencies are
looked for in the qt5 per-package staging directory instead of the
python-pyqt5 one.

Signed-off-by: Florent AUMAITRE <florent.aumaitre@medianesysteme.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 51c22b4ba905f8e0a0f75189715eab628cefab6c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyqt5/python-pyqt5.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/python-pyqt5/python-pyqt5.mk b/package/python-pyqt5/python-pyqt5.mk
index 8f28c90d15..b05043563e 100644
--- a/package/python-pyqt5/python-pyqt5.mk
+++ b/package/python-pyqt5/python-pyqt5.mk
@@ -152,6 +152,11 @@ define PYTHON_PYQT5_GENERATE_QTDETAIL
 	)
 endef
 
+# The file "qt.conf" can be used to override the hard-coded paths that are
+# compiled into the Qt library. We need it to make "qmake" relocatable and
+# tweak the per-package install pathes
+PYTHON_PYQT5_PRE_CONFIGURE_HOOKS += QT5_QT_CONF_FIXUP
+
 PYTHON_PYQT5_CONF_OPTS = \
 	--bindir $(TARGET_DIR)/usr/bin \
 	--destdir $(TARGET_DIR)/usr/lib/$(PYTHON_PYQT5_PYTHON_DIR)/site-packages \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
