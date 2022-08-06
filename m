Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44C7C19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 22:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5930E405CE;
	Sat,  6 Aug 2022 22:22:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5930E405CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id arMdRziFNUX2; Sat,  6 Aug 2022 22:22:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A40F401DF;
	Sat,  6 Aug 2022 22:22:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A40F401DF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 68C641BF580
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 22:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 441A160F85
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 22:22:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 441A160F85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YJQIpIuPoNbh for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 22:21:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78C1E606BF
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 22:21:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78C1E606BF
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9BD4A86ED4; Sat,  6 Aug 2022 22:07:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Aug 2022 00:21:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd933d676f210789730ecb25b23d902620d72072
X-Git-Newrev: 974ca92229a4d82fa015adf4164315d0c7a25d68
X-Patchwork-Hint: ignore
Message-Id: <20220806220749.9BD4A86ED4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cryptsetup: fix host building
 trying to call asciidoctor
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

commit: https://git.buildroot.net/buildroot/commit/?id=974ca92229a4d82fa015adf4164315d0c7a25d68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While bumping version I've fixed build failure due to missing host
asciidoctor by passing --disable-asciidoc to CRYPTSETUP_CONF_OPTS but that
is missing in HOST_CRYPTSETUP_CONF_OPTS and this leads the same build
failure of target building. So let's fix it by adding --disable-asciidoc
to host HOST_CRYPTSETUP_CONF_OPTS too.

Fixes:

  http://autobuild.buildroot.net/results/0c1a6a8e59653afaa09303550f74475b4a3898bf/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cryptsetup/cryptsetup.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 01902c3f6a..4a52bb62dd 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -65,7 +65,8 @@ HOST_CRYPTSETUP_CONF_OPTS = --with-crypto_backend=openssl \
 	--disable-kernel_crypto \
 	--disable-ssh-token \
 	--enable-blkid \
-	--with-tmpfilesdir=no
+	--with-tmpfilesdir=no \
+	--disable-asciidoc
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
