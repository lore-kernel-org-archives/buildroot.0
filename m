Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66712C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 15:51:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27EEB60EFD
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 15:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 27EEB60EFD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1C60837A4;
	Tue,  3 Aug 2021 15:51:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fUl5FTWVn5mF; Tue,  3 Aug 2021 15:51:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B44383139;
	Tue,  3 Aug 2021 15:51:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8A3D21BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 15:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 763AD607B3
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 15:51:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TCSM53ZcA4o5 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 15:51:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C35E260794
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 15:51:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9146B8AB46; Tue,  3 Aug 2021 15:50:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 3 Aug 2021 17:45:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 94b6fbd5823cbf94f2f76e402b0d73b473a8b64f
X-Git-Newrev: 2def1ccccbece30f53c4b98d8e806c5f77b2c47f
X-Patchwork-Hint: ignore
Message-Id: <20210803155054.9146B8AB46@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opencv4: do not detect ccache
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=2def1ccccbece30f53c4b98d8e806c5f77b2c47f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

OpenCV-4's buildsystem will try to detect ccache and use it if
available. This may yield a system-installed ccache.

However, in Buildroot, ccache is entirely hidden away and handled in the
toolchain wrapper.

Forcibly disable detection of ccache.

Commit 505e7f47715c77d8586444a4fefe4a190b77aaad already applied this
change to opencv3.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/opencv4/opencv4.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
index 3cc6c05769..040fc63e4e 100644
--- a/package/opencv4/opencv4.mk
+++ b/package/opencv4/opencv4.mk
@@ -49,6 +49,7 @@ endif
 # OpenCV build options
 OPENCV4_CONF_OPTS += \
 	-DBUILD_WITH_STATIC_CRT=OFF \
+	-DENABLE_CCACHE=OFF \
 	-DENABLE_COVERAGE=OFF \
 	-DENABLE_FAST_MATH=ON \
 	-DENABLE_IMPL_COLLECTION=OFF \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
