Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26E5C433EF
	for <buildroot@archiver.kernel.org>; Thu, 31 Mar 2022 12:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5253F41091;
	Thu, 31 Mar 2022 12:03:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nu51SWlWSraC; Thu, 31 Mar 2022 12:03:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54AE041087;
	Thu, 31 Mar 2022 12:03:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2905F1BF3D2
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 12:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 110E441CC6
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 12:03:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M6ZnQ6crpd44 for <buildroot@lists.busybox.net>;
 Thu, 31 Mar 2022 12:03:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B1BF41CBA
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 12:03:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5804C86080; Thu, 31 Mar 2022 11:54:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 31 Mar 2022 14:02:06 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 98eccb68f27144d6b4686eabf02a4688442c31c6
X-Git-Newrev: 363284a04df1e4117e9789ee6b0eebbc3fee94c0
X-Patchwork-Hint: ignore
Message-Id: <20220331115418.5804C86080@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/opus: enable
 custom modes
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

commit: https://git.buildroot.net/buildroot/commit/?id=363284a04df1e4117e9789ee6b0eebbc3fee94c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Enable custom modes to avoid the following build failure with jack2
raised since commit 618a23100fe5ff54b90ada1a8f23453f6c5a77dc:

Checking for header opus/opus_custom.h   : not found
The above check failed, but the checkee is required for --opus.

It should be noted that before this commit, opus was silently disabled

Fixes:
 - http://autobuild.buildroot.org/results/b1c050ccd6152c43a6da5f5d2174c3cc0dc2ff3e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 92e436b73df21ff9347c53c25fd33d8fd48a9d43)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opus/opus.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/opus/opus.mk b/package/opus/opus.mk
index 3fb2d5d65f..4f816df477 100644
--- a/package/opus/opus.mk
+++ b/package/opus/opus.mk
@@ -17,6 +17,7 @@ OPUS_CFLAGS += -O0
 endif
 
 OPUS_CONF_ENV = CFLAGS="$(OPUS_CFLAGS)"
+OPUS_CONF_OPTS = --enable-custom-modes
 
 ifeq ($(BR2_PACKAGE_OPUS_FIXED_POINT),y)
 OPUS_CONF_OPTS += --enable-fixed-point
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
