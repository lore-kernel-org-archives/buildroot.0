Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D92CC433EF
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 15:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0961860A8B;
	Mon, 29 Nov 2021 15:54:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wgamlRgw6Gez; Mon, 29 Nov 2021 15:54:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57169605DD;
	Mon, 29 Nov 2021 15:54:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C22801BF3A9
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 15:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFFD14019E
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 15:54:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VGOgukeuYzsK for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 15:54:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0FCED4014D
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 15:54:00 +0000 (UTC)
Received: from localhost.localdomain (unknown [78.252.129.8])
 by smtp6-g21.free.fr (Postfix) with ESMTP id 61828780378;
 Mon, 29 Nov 2021 16:53:55 +0100 (CET)
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 16:53:18 +0100
Message-Id: <20211129155318.356600-1-gwenj@trabucayre.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next] package/uhd: fix python module detection
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

$(HOST_DIR)/bin/python symlink is only created when BR2_PACKAGE_PYTHON3 is
set.
When only host-python3 is used this symlink is not present and build fails
with:
-- Python checking for Python version 2.7 or greater
-- Python checking for Python version 2.7 or greater - unknown error
-- 
-- Python checking for Mako templates 0.4.2 or greater
-- Python checking for Mako templates 0.4.2 or greater - unknown error
-- 
-- Python checking for requests 2.0 or greater
-- Python checking for requests 2.0 or greater - unknown error
-- 
-- Python checking for numpy 1.7 or greater
-- Python checking for numpy 1.7 or greater - unknown error
-- 
-- Configuring LibUHD support...
--   Dependency Boost_FOUND = TRUE
--   Dependency HAVE_PYTHON_PLAT_MIN_VERSION = FALSE
--   Dependency HAVE_PYTHON_MODULE_MAKO = FALSE

This patch set explicitly PYTHON_EXECUTABLE to $(HOST_DIR)/bin/python3

fixes:
- http://autobuild.buildroot.net/results/35c0b9597c75dade241a3b3786fae30551c48008
- http://autobuild.buildroot.net/results/89069102bf8785ce8a9ec3b4c6fa32749c2e3586

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/uhd/uhd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uhd/uhd.mk b/package/uhd/uhd.mk
index 5da1697925..e8f197f9dd 100644
--- a/package/uhd/uhd.mk
+++ b/package/uhd/uhd.mk
@@ -19,7 +19,7 @@ UHD_DEPENDENCIES = \
 	host-python-mako
 
 UHD_CONF_OPTS = \
-	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python \
+	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3 \
 	-DRUNTIME_PYTHON_EXECUTABLE=/usr/bin/python \
 	-DENABLE_C_API=ON \
 	-DENABLE_DOXYGEN=OFF \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
