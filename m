Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 471E5C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:46:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F64F60E96
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F64F60E96
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA022842C5;
	Wed,  4 Aug 2021 00:46:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zz39_2giPxBF; Wed,  4 Aug 2021 00:46:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A3DC83EC6;
	Wed,  4 Aug 2021 00:46:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 100AC1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8745740F7E
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9l_3lwXNHnUl for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF41340F92
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3059787884; Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 27 Jul 2021 22:05:47 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7332bc6eb092a18c506e614fc950c5b697ba1114
X-Git-Newrev: 0b4b533dca9ac36e2c5dc35bde618c2eba036bb4
X-Patchwork-Hint: ignore
Message-Id: <20210803211021.3059787884@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] core/show-info: report image
 name of filesystems
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

commit: https://git.buildroot.net/buildroot/commit/?id=0b4b533dca9ac36e2c5dc35bde618c2eba036bb4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The rootfses, unlike packages, do not have stampfiles to represent
whether they are built or not. Indeed, we always rebuild the rootfs, and
there is a single step to do.

Hpwever, people (and scripts) who want to report on the build progress,
will want to know whether each rootfs has been built already or not.

Expose in show-info the name of the file that wil contain the rootfs
image.

$(1)_FINAL_IMAGE_NAME is set by the fs infrastructure, but initramfs
doesn't use the infrastructure. So to support that one as well, set
image_name to null if $(1)_FINAL_IMAGE_NAME is not set.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Vadim Kochan <vadim4j@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: eeppeliteloop@gmail.com
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-utils.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index d0fcdd4e1d..ae3c7f9da9 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -156,6 +156,10 @@ define _json-info-pkg-details
 endef
 
 define _json-info-fs
+	"image_name": $(if $($(1)_FINAL_IMAGE_NAME), \
+				"$($(1)_FINAL_IMAGE_NAME)", \
+				null \
+			),
 	"dependencies": [
 		$(call make-comma-list,$(sort $($(1)_DEPENDENCIES)))
 	]
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
