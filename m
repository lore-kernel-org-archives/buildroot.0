Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53EBCC432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:27:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1F0F60E93
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F1F0F60E93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A76314077F;
	Thu, 26 Aug 2021 22:27:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zvSyI3fDWdK1; Thu, 26 Aug 2021 22:27:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2318640790;
	Thu, 26 Aug 2021 22:27:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B30F1BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9180540777
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BMpz7fdedXKE for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27E1D407AD
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 89F338DC50; Thu, 26 Aug 2021 22:01:30 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 17 Aug 2021 21:31:59 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 94c41eef615bb33ad26fff71d341f66e35286f5d
X-Git-Newrev: eb058222596d83bbdc96c80c5d0cdecb572a4ac3
X-Patchwork-Hint: ignore
Message-Id: <20210826220130.89F338DC50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/fontconfig: break
 circular dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb058222596d83bbdc96c80c5d0cdecb572a4ac3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Build fails because of the following circular dependency:

fontconfig -> util-linux -> udev -> systemd -> polkit ->
gobject-introspection -> cairo -> fontconfig

which results in the following build failure:

checking for UUID... no
checking where uuid functions comes from... configure: error:
*** uuid is required. install util-linux.

To break it, apply the same ugly workaround that was applied for
libglib2 and cryptsetup until a better solution is found:
https://patchwork.ozlabs.org/project/buildroot/patch/20201101150619.1709959-1-fontaine.fabrice@gmail.com/

Fixes:
 - http://autobuild.buildroot.org/results/2c6ef073e7e98e13daa409e1ea6130e9abd32c87

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/fontconfig/fontconfig.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index 33218ed639..d59e893d4d 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -10,7 +10,8 @@ FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.bz2
 # 0002-add-pthread-as-a-dependency-of-a-static-lib.patch
 FONTCONFIG_AUTORECONF = YES
 FONTCONFIG_INSTALL_STAGING = YES
-FONTCONFIG_DEPENDENCIES = freetype expat host-pkgconf host-gperf util-linux
+FONTCONFIG_DEPENDENCIES = freetype expat host-pkgconf host-gperf \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS),util-linux-libs,util-linux)
 HOST_FONTCONFIG_DEPENDENCIES = \
 	host-freetype host-expat host-pkgconf host-gperf host-util-linux
 FONTCONFIG_LICENSE = fontconfig license
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
