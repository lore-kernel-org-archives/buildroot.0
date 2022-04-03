Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA082C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 08:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 585D060B60;
	Sun,  3 Apr 2022 08:25:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BIkjpn5abcW2; Sun,  3 Apr 2022 08:25:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53C1060ACD;
	Sun,  3 Apr 2022 08:25:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DCB011BF2AA
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 08:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C47684173F
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 08:25:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yJr2J_tdS_lq for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 08:25:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC1584173E
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 08:25:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 4EA35847BA; Sun,  3 Apr 2022 08:16:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Apr 2022 10:24:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 15f76e16b30aa7555aa84c71b42bfda69c5ebda7
X-Git-Newrev: 5bea8c9521b3fbfdf40030635989064af55cc26c
X-Patchwork-Hint: ignore
Message-Id: <20220403081607.4EA35847BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-python.mk: fix PEP517 paths
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

commit: https://git.buildroot.net/buildroot/commit/?id=5bea8c9521b3fbfdf40030635989064af55cc26c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use /usr target/staging prefix and / host prefix.

This allows the Python interpreter to find packages built via the new
Flit infrastructure.

Fixes: #14721

Signed-off-by: Emile Cormier <emile.cormier.jr@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-python.mk | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 52ce402281..867341fc7b 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -127,16 +127,16 @@ PKG_PYTHON_PEP517_ENV = \
 PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS = \
 	--interpreter=/usr/bin/python \
 	--script-kind=posix \
-	--purelib=$(TARGET_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
-	--headers=$(TARGET_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
+	--purelib=$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
+	--headers=$(TARGET_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	--scripts=$(TARGET_DIR)/usr/bin \
 	--data=$(TARGET_DIR)/usr
 
 PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS = \
 	--interpreter=/usr/bin/python \
 	--script-kind=posix \
-	--purelib=$(STAGING_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
-	--headers=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
+	--purelib=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
+	--headers=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	--scripts=$(STAGING_DIR)/usr/bin \
 	--data=$(STAGING_DIR)/usr
 
@@ -147,12 +147,12 @@ HOST_PKG_PYTHON_PEP517_ENV = \
 	$(HOST_CONFIGURE_OPTS)
 
 HOST_PKG_PYTHON_PEP517_INSTALL_OPTS = \
-	--interpreter=/usr/bin/python \
+	--interpreter=/bin/python \
 	--script-kind=posix \
 	--purelib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
-	--headers=$(HOST_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
-	--scripts=$(HOST_DIR)/usr/bin \
-	--data=$(HOST_DIR)/usr
+	--headers=$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR) \
+	--scripts=$(HOST_DIR)/bin \
+	--data=$(HOST_DIR)
 
 ################################################################################
 # inner-python-package -- defines how the configuration, compilation
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
