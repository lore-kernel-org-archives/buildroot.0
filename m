Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DA3C433EF
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 16:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58931404CF;
	Mon, 29 Nov 2021 16:50:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gReHefyA-iIL; Mon, 29 Nov 2021 16:50:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A58F6404C3;
	Mon, 29 Nov 2021 16:50:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 237E71BF325
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 16:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 127E481B10
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 16:50:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q-fauggDu-oV for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 16:50:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 73B8B81B0A
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 16:50:26 +0000 (UTC)
Received: from localhost.localdomain (unknown [78.252.129.8])
 by smtp6-g21.free.fr (Postfix) with ESMTP id D71C0780313;
 Mon, 29 Nov 2021 17:50:23 +0100 (CET)
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 17:50:01 +0100
Message-Id: <20211129165001.363636-2-gwenj@trabucayre.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211129165001.363636-1-gwenj@trabucayre.com>
References: <20211129165001.363636-1-gwenj@trabucayre.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 2/2] package/gnuradio: fix host python name
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

-- User set python executable buildroot/output/host/bin/python
-- Found PythonInterp: buildroot/output/host/bin/python (Required is at least version "2.7.6")
CMake Error at cmake/Modules/GrPython.cmake:40 (if):
  if given arguments:

    "VERSION_EQUAL" "3"

  Unknown arguments specified
Call Stack (most recent call first):
  CMakeLists.txt:368 (include)


-- Configuring incomplete, errors occurred!

This patch set explicitly PYTHON_EXECUTABLE to $(HOST_DIR)/bin/python3

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/gnuradio/gnuradio.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 5616039559..658357398d 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -29,7 +29,7 @@ GNURADIO_DEPENDENCIES = \
 	gmp
 
 GNURADIO_CONF_OPTS = \
-	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python \
+	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3 \
 	-DENABLE_DEFAULT=OFF \
 	-DENABLE_VOLK=ON \
 	-DENABLE_GNURADIO_RUNTIME=ON \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
