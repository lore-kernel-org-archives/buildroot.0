Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A26C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 14:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 856954149A;
	Fri, 12 Jul 2024 14:13:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UZwSd8h89svw; Fri, 12 Jul 2024 14:13:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BB334199D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BB334199D;
	Fri, 12 Jul 2024 14:13:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0C4341BF424
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE0D961312
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:13:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ypxRoz3GiTcA for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 14:13:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1549661106
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1549661106
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 14:13:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F087B85EF4; Fri, 12 Jul 2024 14:13:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 16:08:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 76051e653199f8f6c20afa0c28496c7d8cfcb527
X-Git-Newrev: 98f452f97425c76a9404692530b585cd950dd1fd
X-Patchwork-Hint: ignore
Message-Id: <20240712141302.F087B85EF4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-python: fix pep517 data files
 installation
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=98f452f97425c76a9404692530b585cd950dd1fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When installing a wheel in pep517 compatibility mode, the pyinstaller.py is
invoked with the --data parameter which point to the directory in which data
files should be installed.
Actually the --data parameter points to the /usr subdirectory which is indeed
wrong cause it shall point to the root directory where the wheel will be
installed.
This fixes the problem of having configuration files installed in /usr/etc
instead of /etc.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Tested-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-python.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 88fadecd54..2a85a04b7c 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -67,7 +67,7 @@ PKG_PYTHON_PEP517_INSTALL_TARGET_CMD = \
 	--purelib=$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
 	--headers=$(TARGET_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	--scripts=$(TARGET_DIR)/usr/bin \
-	--data=$(TARGET_DIR)/usr
+	--data=$(TARGET_DIR)
 
 PKG_PYTHON_PEP517_INSTALL_STAGING_CMD = \
 	$(TOPDIR)/support/scripts/pyinstaller.py \
@@ -76,7 +76,7 @@ PKG_PYTHON_PEP517_INSTALL_STAGING_CMD = \
 	--purelib=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
 	--headers=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	--scripts=$(STAGING_DIR)/usr/bin \
-	--data=$(STAGING_DIR)/usr
+	--data=$(STAGING_DIR)
 
 PKG_PYTHON_PEP517_DEPENDENCIES = \
 	host-python-pypa-build \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
