Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F24C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 10:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0251402BD;
	Sun,  6 Feb 2022 10:30:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MmH2V-bRGsZe; Sun,  6 Feb 2022 10:30:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F40C3402A7;
	Sun,  6 Feb 2022 10:30:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6CBC41BF83B
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67BE2401ED
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:30:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qWuoSSjCPcTR for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 10:30:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 56281400A8
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 10:30:03 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3D062100003;
 Sun,  6 Feb 2022 10:29:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nGent-0003zf-C2; Sun, 06 Feb 2022 11:29:57 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 11:29:55 +0100
Message-Id: <20220206102956.15291-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/gnuradio: simplify pyver logic
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
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
