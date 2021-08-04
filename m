Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9037C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 15:18:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FCDA60F14
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 15:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4FCDA60F14
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11D6740431;
	Wed,  4 Aug 2021 15:18:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SN0OhgIBXcBR; Wed,  4 Aug 2021 15:18:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D475B4023A;
	Wed,  4 Aug 2021 15:18:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CD6B51BF2B6
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 15:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B95A74023A
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 15:18:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id drYyVv0wS0yt for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 15:18:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCC6840169
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 15:18:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4DE5A8B57E; Wed,  4 Aug 2021 15:18:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 17:17:00 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 472a3ffe4aa756b1e9fc59043dbf68faa0638834
X-Git-Newrev: 7ac3f1675a2e6be761d67e59b2de383d599292d8
X-Patchwork-Hint: ignore
Message-Id: <20210804151820.4DE5A8B57E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/cryptsetup: fix
 tmpfiles.d setup
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

commit: https://git.buildroot.net/buildroot/commit/?id=7ac3f1675a2e6be761d67e59b2de383d599292d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

The configure script uses pkg-config to detect the location of
tmpfiles.d but imposes an unspecified ordering dependency with systemd.
Instead of relying on systemd being built before cryptsetup, set the
directory path explcitly, and ensure it is not set when systemd-tmpfiles
is disabled.

Signed-off-by: John Keeping <john@metanate.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a2e93a802cbdbcd42b504c26596a076fbc4c86d1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cryptsetup/cryptsetup.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index cd5883d0b4..b816dc2f22 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -33,6 +33,12 @@ else
 CRYPTSETUP_CONF_OPTS += --with-crypto_backend=kernel
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_TMPFILES),y)
+CRYPTSETUP_CONF_OPTS += --with-tmpfilesdir=/usr/lib/tmpfiles.d
+else
+CRYPTSETUP_CONF_OPTS += --without-tmpfilesdir
+endif
+
 HOST_CRYPTSETUP_DEPENDENCIES = \
 	host-pkgconf \
 	host-lvm2 \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
