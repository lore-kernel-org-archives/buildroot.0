Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FB3C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 18:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD8B3607F5;
	Tue, 26 Jul 2022 18:50:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD8B3607F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JH98scpJMDYN; Tue, 26 Jul 2022 18:50:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE2CA605AF;
	Tue, 26 Jul 2022 18:50:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE2CA605AF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D3611BF27C
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 18:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 175C78175E
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 18:50:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 175C78175E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lkwkc8SDbpe2 for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 18:50:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47AE381455
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 18:50:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47AE381455
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E5DCB85F52; Tue, 26 Jul 2022 18:36:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 20:43:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5f54ccb46f7f35c4b73418d10f51ad4525a1e6ca
X-Git-Newrev: 7050140f23655511bb219c3a9829846ffb6123c5
X-Patchwork-Hint: ignore
Message-Id: <20220726183654.E5DCB85F52@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnuradio: use external volk
 instead of the internal one
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7050140f23655511bb219c3a9829846ffb6123c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Until recent releases GNURadio was shipped with volk as a
submodule. Even though we still use 3.8.x, with the newer 3.9 and
3.10, volk is no longer available as a submodule, and it is needed to
build it separately.

In order to prepare for this, this patch disable the internal volk,
and adds a dependency to the corresponding package, to use
unconditionnaly the one built by Buildroot.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
index 49e3b95191..e36dce081c 100644
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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
