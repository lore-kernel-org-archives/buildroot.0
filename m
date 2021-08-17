Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21AD5C4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 19:49:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B169361038
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 19:49:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B169361038
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C12684322;
	Tue, 17 Aug 2021 19:49:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lusp5CysC2dn; Tue, 17 Aug 2021 19:49:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4187284323;
	Tue, 17 Aug 2021 19:49:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6942F1BF86D
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 19:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 582CC40242
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 19:48:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9HYWl6ocqJmw for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 19:48:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1A6040215
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 19:48:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 23A068D37F; Tue, 17 Aug 2021 19:48:12 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 17 Aug 2021 21:36:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb058222596d83bbdc96c80c5d0cdecb572a4ac3
X-Git-Newrev: 93351fa0b3b8b6dd10faa9a15a7a173b92cb40a0
X-Patchwork-Hint: ignore
Message-Id: <20210817194812.23A068D37F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fontconfig: fix build with NLS
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
