Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEDA8C433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 16:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DE25405C2;
	Tue,  8 Feb 2022 16:24:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9z1qzxn-EixY; Tue,  8 Feb 2022 16:24:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B9DB405AD;
	Tue,  8 Feb 2022 16:24:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB6F41BF5E9
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 16:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8535813B0
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 16:24:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j8EvcvEmx5jT for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 16:24:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5FB52813AC
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 16:24:35 +0000 (UTC)
Received: from localhost.localdomain (unknown [78.252.129.8])
 by smtp6-g21.free.fr (Postfix) with ESMTP id 8CE9C780383;
 Tue,  8 Feb 2022 17:24:30 +0100 (CET)
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: buildroot@buildroot.org
Date: Tue,  8 Feb 2022 17:24:09 +0100
Message-Id: <20220208162409.496110-2-gwenj@trabucayre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208162409.496110-1-gwenj@trabucayre.com>
References: <20220208162409.496110-1-gwenj@trabucayre.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/gnuradio: move to package/volk
 instead of using the internal one
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

Until recent releases GNURadio was shipped with volk as a submodule. With 3.9
and 3.10 this is no more true and requires building volk before GNURadio.

This patch disable internal's volk, and add a dependency to the corresponding
package, to use inconditionnaly the one build by buildroot 

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/gnuradio/Config.in   | 1 +
 package/gnuradio/gnuradio.mk | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 1896d1326a..103175946c 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -28,6 +28,7 @@ config BR2_PACKAGE_GNURADIO
 	select BR2_PACKAGE_BOOST_THREAD
 	select BR2_PACKAGE_LOG4CPP
 	select BR2_PACKAGE_GMP
+	select BR2_PACKAGE_VOLK
 	help
 	  GNU Radio is a free & open-source software development
 	  toolkit that provides signal processing blocks to implement
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 417a51e067..ed7060b85c 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -19,13 +19,15 @@ GNURADIO_DEPENDENCIES = \
 	host-swig \
 	boost \
 	log4cpp \
-	gmp
+	gmp \
+	volk
 
 GNURADIO_CONF_OPTS = \
 	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3 \
 	-DENABLE_DEFAULT=OFF \
 	-DENABLE_VOLK=ON \
 	-DENABLE_GNURADIO_RUNTIME=ON \
+	-DENABLE_INTERNAL_VOLK=OFF \
 	-DENABLE_TESTING=OFF \
 	-DXMLTO_EXECUTABLE=NOTFOUND
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
