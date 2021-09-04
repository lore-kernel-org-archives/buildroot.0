Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C463C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 21:49:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9DA760F55
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 21:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E9DA760F55
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86269606EE;
	Sat,  4 Sep 2021 21:49:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DxKQAFrYKS-C; Sat,  4 Sep 2021 21:49:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDB4E606AA;
	Sat,  4 Sep 2021 21:49:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5E5A01BF3ED
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 21:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E2B4606AA
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 21:49:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sh4qFQP1HtuW for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 21:49:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5652F6065C
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 21:49:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BF53F8850E; Sat,  4 Sep 2021 21:48:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Sep 2021 23:36:19 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: ed54e66af61d948772194621e0123bc49a310834
X-Git-Newrev: 6cdae45fd3a6abc9791344febe9f3abc572cee9f
X-Patchwork-Hint: ignore
Message-Id: <20210904214818.BF53F8850E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/fontconfig: fix
 build with NLS
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6cdae45fd3a6abc9791344febe9f3abc572cee9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
(cherry picked from commit 93351fa0b3b8b6dd10faa9a15a7a173b92cb40a0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
