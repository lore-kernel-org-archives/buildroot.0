Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314FBC4332F
	for <buildroot@archiver.kernel.org>; Tue, 15 Nov 2022 13:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A38668132D;
	Tue, 15 Nov 2022 13:02:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A38668132D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O-JROE1_rqCb; Tue, 15 Nov 2022 13:02:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E38248149D;
	Tue, 15 Nov 2022 13:02:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E38248149D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0328C1BF94B
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 13:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFE8160DDF
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 13:01:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFE8160DDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6XenKdVovcis for <buildroot@lists.busybox.net>;
 Tue, 15 Nov 2022 13:01:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 252A660D88
 for <buildroot@buildroot.org>; Tue, 15 Nov 2022 13:01:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 252A660D88
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0ECA383C59; Tue, 15 Nov 2022 13:01:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 15 Nov 2022 13:57:44 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 2e7f3dcc8e12da71a323d0616880570600c2b5ef
X-Git-Newrev: 72842461de91209709d2055ed7377a441d5cb3cd
X-Patchwork-Hint: ignore
Message-Id: <20221115130152.0ECA383C59@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/imagemagick:
 utilities now need C++ support
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

commit: https://git.buildroot.net/buildroot/commit/?id=72842461de91209709d2055ed7377a441d5cb3cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Since upstream commit
https://github.com/ImageMagick/ImageMagick/commit/07f3b487f9860fd4eb9422f1a906d0fe83b6fd1c
(which first appeared in version 7.1.0-47), ImageMagick forces the
need of a C++ compiler to build its utilities. Despite the request of
Bernd Kuhls to revert this change, upstream declined.

Since this change is causing build failures in our autobuilders, our
only choice is to follow the choice of upstream, and disable building
the utilities when C++ support is not available.

Fixes:

  http://autobuild.buildroot.net/results/4283235d697408cf2e70be5e3769dbe6ebb9ddae/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0910ada70b7194596c6ace0cb06b303173c13de7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 6bdf24c1e8..8a2ec460d5 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -178,6 +178,12 @@ else
 IMAGEMAGICK_CONF_OPTS += --without-bzlib
 endif
 
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+IMAGEMAGICK_CONF_OPTS += --with-utilities
+else
+IMAGEMAGICK_CONF_OPTS += --without-utilities
+endif
+
 HOST_IMAGEMAGICK_CONF_OPTS = \
 	--disable-opencl \
 	--disable-openmp \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
