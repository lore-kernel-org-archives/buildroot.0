Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E05EC4320A
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:27:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41EDC60FD9
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:27:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 41EDC60FD9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DF4342737;
	Thu, 26 Aug 2021 22:27:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uc5QXtKzvMGB; Thu, 26 Aug 2021 22:27:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DEED42703;
	Thu, 26 Aug 2021 22:27:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 312201BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A06ED407A4
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1h5SMneBH2OZ for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 406EA407B2
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 94BF08DC50; Thu, 26 Aug 2021 22:01:30 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 17 Aug 2021 21:36:41 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: eb058222596d83bbdc96c80c5d0cdecb572a4ac3
X-Git-Newrev: 93351fa0b3b8b6dd10faa9a15a7a173b92cb40a0
X-Patchwork-Hint: ignore
Message-Id: <20210826220130.94BF08DC50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/fontconfig: fix build
 with NLS
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

commit: https://git.buildroot.net/buildroot/commit/?id=93351fa0b3b8b6dd10faa9a15a7a173b92cb40a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add TARGET_NLS_DEPENDENCIES and host-gettext dependency to avoid the
following build failure in a per-package-directorie build with
host-cairo raised because fontconfig installs its ITS files in the wrong
directory (i.e. outside of gettext-tiny symlink):

mkdir -p /tmp/instance-0/output-1/per-package/host-cairo/host
rsync -a --link-dest=/tmp/instance-0/output-1/per-package/host-fontconfig/host/ /tmp/instance-0/output-1/per-package/host-fontconfig/host/ /tmp/instance-0/output-1/per-package/host-cairo/host
rsync -a --link-dest=/tmp/instance-0/output-1/per-package/host-freetype/host/ /tmp/instance-0/output-1/per-package/host-freetype/host/ /tmp/instance-0/output-1/per-package/host-cairo/host
rsync -a --link-dest=/tmp/instance-0/output-1/per-package/host-libglib2/host/ /tmp/instance-0/output-1/per-package/host-libglib2/host/ /tmp/instance-0/output-1/per-package/host-cairo/host
cannot delete non-empty directory: share/gettext
could not make way for new symlink: share/gettext

This only happens with per-package directories because then the rsync is
done. Otherwise the fontconfig installation will simply follow the
symlink.

The error of course exists for target as well, but doesn't occur in
autobuilders since it already fails for host.

Fixes:
 - http://autobuild.buildroot.org/results/00e29958cecfffa4e994ab549637117dd8f55c30

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/fontconfig/fontconfig.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index d59e893d4d..e34acde534 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -11,9 +11,11 @@ FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.bz2
 FONTCONFIG_AUTORECONF = YES
 FONTCONFIG_INSTALL_STAGING = YES
 FONTCONFIG_DEPENDENCIES = freetype expat host-pkgconf host-gperf \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS),util-linux-libs,util-linux)
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS),util-linux-libs,util-linux) \
+	$(TARGET_NLS_DEPENDENCIES)
 HOST_FONTCONFIG_DEPENDENCIES = \
-	host-freetype host-expat host-pkgconf host-gperf host-util-linux
+	host-freetype host-expat host-pkgconf host-gperf host-util-linux \
+	host-gettext
 FONTCONFIG_LICENSE = fontconfig license
 FONTCONFIG_LICENSE_FILES = COPYING
 FONTCONFIG_CPE_ID_VENDOR = fontconfig_project
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
