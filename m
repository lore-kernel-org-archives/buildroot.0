Return-Path: <SRS0=PVMq=MM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED1FC07E9B
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 21:50:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9991A610F7
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 21:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9991A610F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BF63402BA;
	Tue, 20 Jul 2021 21:50:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WYnkuJWcFuhi; Tue, 20 Jul 2021 21:50:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4FFE402B1;
	Tue, 20 Jul 2021 21:50:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5344B1BF9B2
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 21:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11EFB40229
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 21:48:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JDhabyk3ZPfh for <buildroot@lists.busybox.net>;
 Tue, 20 Jul 2021 21:48:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C32740248
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 21:48:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B861B87316; Tue, 20 Jul 2021 21:14:43 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 23:48:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4041c230c18d3a9d82bfc6a96b2ceaabddbc94b
X-Git-Newrev: a2e93a802cbdbcd42b504c26596a076fbc4c86d1
X-Patchwork-Hint: ignore
Message-ID: <20210720211443.B861B87316@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cryptsetup: fix tmpfiles.d setup
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
Message-ID: <20210720214842.M7H25cdlX8qLTfmaboLEvzCVZBSEYacDURZPDPxyfjk@z>

commit: https://git.buildroot.net/buildroot/commit/?id=a2e93a802cbdbcd42b504c26596a076fbc4c86d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configure script uses pkg-config to detect the location of
tmpfiles.d but imposes an unspecified ordering dependency with systemd.
Instead of relying on systemd being built before cryptsetup, set the
directory path explcitly, and ensure it is not set when systemd-tmpfiles
is disabled.

Signed-off-by: John Keeping <john@metanate.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
