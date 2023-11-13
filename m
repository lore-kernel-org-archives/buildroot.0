Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFF5C4167B
	for <buildroot@archiver.kernel.org>; Mon, 13 Nov 2023 21:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A252941EB5;
	Mon, 13 Nov 2023 21:53:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A252941EB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nHHYl-sRtDrW; Mon, 13 Nov 2023 21:53:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D60E5410AC;
	Mon, 13 Nov 2023 21:53:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D60E5410AC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED9BA1BF389
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 21:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6D7881E67
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 21:53:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6D7881E67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m8PKtsJAm-L4 for <buildroot@lists.busybox.net>;
 Mon, 13 Nov 2023 21:53:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1F5581E61
 for <buildroot@buildroot.org>; Mon, 13 Nov 2023 21:53:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1F5581E61
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE0BA8710A; Mon, 13 Nov 2023 21:53:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Nov 2023 22:49:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bcd879d5e2bda7e570084be7d6009cd1ff4aeafd
X-Git-Newrev: b32a46e2a8acf896eda29ae5ceae48151a949d55
X-Patchwork-Hint: ignore
Message-Id: <20231113215303.DE0BA8710A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "package/tar: allowing building
 even on non-Y2038 compliant systems"
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

commit: https://git.buildroot.net/buildroot/commit/?id=b32a46e2a8acf896eda29ae5ceae48151a949d55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 7f1088f9cae9f191740423a0084bb31f94af2e75.

We're going back to tar 1.34, so this needs to be reverted as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tar/tar.mk | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index 8a612b6f45..eea112ebc7 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -7,15 +7,9 @@
 TAR_VERSION = 1.35
 TAR_SOURCE = tar-$(TAR_VERSION).tar.xz
 TAR_SITE = $(BR2_GNU_MIRROR)/tar
-# --exec-prefix=/: busybox installs in /bin, so we need tar to install
-# as well in /bin so that we don't end up with two different tar
-#
-# --disable-year2038: tells the configure script to not abort if the
-# system is not Y2038 compliant. tar will support year2038 if the
-# system is compliant even with this option passed
-TAR_CONF_OPTS = \
-	--exec-prefix=/ \
-	--disable-year2038
+# busybox installs in /bin, so we need tar to install as well in /bin
+# so that we don't end up with two different tar
+TAR_CONF_OPTS = --exec-prefix=/
 TAR_LICENSE = GPL-3.0+
 TAR_LICENSE_FILES = COPYING
 TAR_CPE_ID_VENDOR = gnu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
