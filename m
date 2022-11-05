Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75EEC433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 20:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8735681E97;
	Sat,  5 Nov 2022 20:03:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8735681E97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W-JjBff_0qPJ; Sat,  5 Nov 2022 20:03:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C4C581E1D;
	Sat,  5 Nov 2022 20:03:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C4C581E1D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 74DDD1BF371
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 20:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DBF040273
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 20:03:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DBF040273
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tKuVgXiiNbCo for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 20:03:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0FA1400D9
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 20:03:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0FA1400D9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E2BD87DEA; Sat,  5 Nov 2022 20:03:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 21:02:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6aed2126b9c4cbae2a3f770e6d9029b44daa957
X-Git-Newrev: 0b4a9930124f7fb4c7bfae281db900905006a2da
X-Patchwork-Hint: ignore
Message-Id: <20221105200326.8E2BD87DEA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/swupdate: specify SWU_VER during
 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=0b4a9930124f7fb4c7bfae281db900905006a2da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The swupdate build process uses SWU_VER as part of the build commandline
for compiling objects to define the value for use in globals.h (see also
Makefile.flags).

This value is also used to communicate capabilities to lua handlers
(see upstream 0f38ff186e76c55c8d00ccb53739a29bcca91445).

When swupdate gets built, SWU_VER defaults to using `git describe` to
determine the version. This, unfortunately, picks up the version of the
Buildroot checkout and not the actual version of swupdate.

Now, specify SWU_VER as part of the make options to override the
calculated value so the proper version is reported.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/swupdate/swupdate.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index b2f50d2b71..2f618b2e79 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -209,6 +209,7 @@ SWUPDATE_KCONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_SWUPDATE_CONFIG))
 SWUPDATE_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 
 SWUPDATE_MAKE_OPTS = \
+	SWU_VER="$(SWUPDATE_VERSION) (Buildroot $(BR2_VERSION_FULL))"
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	CONFIG_EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
 	CONFIG_EXTRA_LDFLAGS="$(TARGET_LDFLAGS)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
