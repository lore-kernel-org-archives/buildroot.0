Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BFFC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 20:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0733404BD;
	Sat,  4 Dec 2021 20:24:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WOjAb86Kql5c; Sat,  4 Dec 2021 20:24:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B9F0404C4;
	Sat,  4 Dec 2021 20:24:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 35AB71BF861
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 20:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30849404C4
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 20:24:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b7wBNXj-vrhZ for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 20:24:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C5944051E
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 20:24:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6277E9236A; Sat,  4 Dec 2021 20:19:12 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 21:24:00 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5a5859df8a8dfc00fd952ed9f323dd9e298c1d50
X-Git-Newrev: e0b5ee9f18e79fdf2eb5e7073e32c702bc917c4e
X-Patchwork-Hint: ignore
Message-Id: <20211204201912.6277E9236A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gnuradio: fix host
 python name
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

commit: https://git.buildroot.net/buildroot/commit/?id=e0b5ee9f18e79fdf2eb5e7073e32c702bc917c4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
