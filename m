Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43075C433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 18:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01A40403C1;
	Mon,  7 Feb 2022 18:25:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rc-LTVp7NZ93; Mon,  7 Feb 2022 18:25:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DE9040457;
	Mon,  7 Feb 2022 18:25:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A91821BF299
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 18:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C0B8403C7
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 18:24:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GRVNYggL_1XY for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 18:24:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACE55403C1
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 18:24:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8228782AB5; Mon,  7 Feb 2022 18:17:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 7 Feb 2022 19:18:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 11f8b9fb45aee2d83fffd8d57f5c4ccfc1b1f613
X-Git-Newrev: 7162d69194d606734e7148f009dd034b31d1302a
X-Patchwork-Hint: ignore
Message-Id: <20220207181734.8228782AB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnuradio: simplify pyver logic
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

commit: https://git.buildroot.net/buildroot/commit/?id=7162d69194d606734e7148f009dd034b31d1302a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Gnuradio only works with python3 since commit 786c783f3796
(package/python-numpy: bump to version 1.18.2), so the python2/3 logic for
_PYVER can be dropped.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnuradio/gnuradio.mk | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 658357398d..417a51e067 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -11,13 +11,6 @@ GNURADIO_LICENSE_FILES = COPYING
 
 GNURADIO_SUPPORTS_IN_SOURCE_BUILD = NO
 
-# needed to determine site-packages path
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-GNURADIO_PYVER = $(PYTHON_VERSION_MAJOR)
-else ifeq ($(BR2_PACKAGE_PYTHON3),y)
-GNURADIO_PYVER = $(PYTHON3_VERSION_MAJOR)
-endif
-
 # host-python-mako and host-python-six are needed for volk to compile
 GNURADIO_DEPENDENCIES = \
 	host-python3 \
@@ -125,7 +118,7 @@ GNURADIO_CONF_OPTS += -DENABLE_PYTHON=ON
 # mandatory to install python modules in site-packages and to use
 # correct path for python libraries
 GNURADIO_CONF_OPTS += -DGR_PYTHON_RELATIVE=ON \
-	-DGR_PYTHON_DIR=lib/python$(GNURADIO_PYVER)/site-packages
+	-DGR_PYTHON_DIR=lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
 else
 GNURADIO_CONF_OPTS += -DENABLE_PYTHON=OFF
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
