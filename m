Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DBB2C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:04:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E6A160F9C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:04:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E6A160F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16329402E5;
	Tue,  3 Aug 2021 22:04:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6pU8YpzY_gEc; Tue,  3 Aug 2021 22:04:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 784C340359;
	Tue,  3 Aug 2021 22:04:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B43961BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DEA640502
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fxdZj5gr1mEJ for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A2444056C
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D18568B3ED; Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 17 Jul 2021 10:15:26 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2170033bf68f1a34dc5d183d50e3f38d9779b6de
X-Git-Newrev: 49e436f4823ed982a9a4fadeb00e1159d55f7939
X-Patchwork-Hint: ignore
Message-Id: <20210803211005.D18568B3ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mpg123: remove
 --disable-lfs-alias option
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

commit: https://git.buildroot.net/buildroot/commit/?id=49e436f4823ed982a9a4fadeb00e1159d55f7939
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit 56b28d3ee1e5 (mpg123: bump to version 1.13.1) added the
--disable-lfs-alias option, without explaining why it was needed.

However, this causes undefined references for apps that want to link
against mpg123.

The help for that option is pretty explicit that this is a dangerous
option to use:

    disable alias wrappers for largefile bitness (mpg123_seek_32 or
    mpg123_seek_64 in addition to mpg123_seek, or the other way around;
    It is a mess, do not play with this!)

The default is that it is enabled, so leave it at it.

Signed-off-by: Bruno Marie <gameblabla@protonmail.com>
[yann.morin.1998@free.fr: rework commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mpg123/mpg123.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 9aa9cd1c10..fbb011c2c2 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -7,7 +7,6 @@
 MPG123_VERSION = 1.25.15
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
-MPG123_CONF_OPTS = --disable-lfs-alias
 MPG123_INSTALL_STAGING = YES
 MPG123_LICENSE = LGPL-2.1
 MPG123_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
