Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAB8C433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 09:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 684D94089F;
	Wed, 29 Dec 2021 09:13:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PVJew03Ijls9; Wed, 29 Dec 2021 09:13:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE977408B9;
	Wed, 29 Dec 2021 09:13:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 914D51BF4E7
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 09:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AF984089F
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 09:13:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cbWZx-Da2XAz for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 09:13:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBBC94067C
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 09:13:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9E4B682A06; Wed, 29 Dec 2021 09:07:49 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 29 Dec 2021 10:12:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c5912e7db37cc0a04696cf081410ec007f8f0be9
X-Git-Newrev: 661032e32c28976b3abb58fe88f8f0e75d3d2dde
X-Patchwork-Hint: ignore
Message-Id: <20211229090749.9E4B682A06@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/swupdate: add optional zchunk
 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=661032e32c28976b3abb58fe88f8f0e75d3d2dde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is required for delta update handler support.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/swupdate/swupdate.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index e16060f5cb..065ae772ba 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -172,6 +172,13 @@ else
 SWUPDATE_MAKE_ENV += HAVE_WOLFSSL=n
 endif
 
+ifeq ($(BR2_PACKAGE_ZCHUNK),y)
+SWUPDATE_DEPENDENCIES += zchunk
+SWUPDATE_MAKE_ENV += HAVE_ZCK=y
+else
+SWUPDATE_MAKE_ENV += HAVE_ZCK=n
+endif
+
 ifeq ($(BR2_PACKAGE_ZEROMQ),y)
 SWUPDATE_DEPENDENCIES += zeromq
 SWUPDATE_MAKE_ENV += HAVE_LIBZEROMQ=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
