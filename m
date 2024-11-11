Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB0DD2E9F0
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 13:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D86040302;
	Mon, 11 Nov 2024 13:37:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ENbzkGkN6TvX; Mon, 11 Nov 2024 13:37:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B5B1400FC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B5B1400FC;
	Mon, 11 Nov 2024 13:37:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3538FE0B
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 13:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DEC8606BB
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 13:37:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fLWLcULqEllv for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 13:37:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77BD0606CA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77BD0606CA
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 13:37:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 744EC86072; Mon, 11 Nov 2024 13:37:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Nov 2024 11:46:28 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 3ac71fa840fd0bae912cecae7b04d266cfd8f465
X-Git-Newrev: 5a2be8f85a03b377ba0edf773d571fa86fc66774
X-Patchwork-Hint: ignore
Message-Id: <20241111133734.744EC86072@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/python-pyqt5: add
 missing SIP module
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

commit: https://git.buildroot.net/buildroot/commit/?id=5a2be8f85a03b377ba0edf773d571fa86fc66774
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

This fixes the following runtime error when importing PyQt5 in python:

from PyQt5.QtCore import *
ModuleNotFoundError: No module named 'PyQt5.sip'

The problem was likely triggered by the atomic upgrade from 5.7 to
5.15 in b36ce7e. This commit is part of the 2022-2024 LTS.

Signed-off-by: Ralf Dragon <hypnotoad@lindra.de>
Tested-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit ba09a448f1e2e3b3123384ddddeb62d18bfa9461)
[Peter: reword commit summary]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyqt5/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pyqt5/Config.in b/package/python-pyqt5/Config.in
index 9fa7676f98..0b37f14317 100644
--- a/package/python-pyqt5/Config.in
+++ b/package/python-pyqt5/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_PYTHON_PYQT5
 	bool "python-pyqt5"
 	depends on BR2_PACKAGE_QT5
 	select BR2_PACKAGE_PYTHON_SIP
+	select BR2_PACKAGE_PYTHON_PYQT5_SIP # runtime
 	select BR2_PACKAGE_QT5BASE_GUI
 	help
 	  Python bindings for Qt 5
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
