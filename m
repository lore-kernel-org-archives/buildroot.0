Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0894C433FE
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACCF484BB9;
	Mon,  6 Dec 2021 18:40:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xtJEwXlScEDR; Mon,  6 Dec 2021 18:40:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11DB384BB1;
	Mon,  6 Dec 2021 18:40:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0FDD01BF983
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCA6741C60
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IYFydQSSDLN2 for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7175F41C67
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0B78281504; Mon,  6 Dec 2021 18:07:42 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 21:34:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e0b5ee9f18e79fdf2eb5e7073e32c702bc917c4e
X-Git-Newrev: 8736da7cbae5852946f4e14d3952f527d1e835c4
X-Patchwork-Hint: ignore
Message-Id: <20211206180742.0B78281504@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uhd: fix python module detection
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

commit: https://git.buildroot.net/buildroot/commit/?id=8736da7cbae5852946f4e14d3952f527d1e835c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

$(HOST_DIR)/bin/python symlink is only created when
BR2_PACKAGE_PYTHON3 is set.

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

This is a fallout from e9df5b0fc3f6e8bb36deedefb392bbc968116ee7, which
changed uhd to always use host-python3.

Fixes:
- http://autobuild.buildroot.net/results/35c0b9597c75dade241a3b3786fae30551c48008
- http://autobuild.buildroot.net/results/89069102bf8785ce8a9ec3b4c6fa32749c2e3586

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
