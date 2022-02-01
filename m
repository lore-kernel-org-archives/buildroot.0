Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908E3C433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 22:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50C7840168;
	Tue,  1 Feb 2022 22:08:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EAHQbz152bvx; Tue,  1 Feb 2022 22:07:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84EFB4014C;
	Tue,  1 Feb 2022 22:07:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 58A0D1BF3BE
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5A7641594
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:05:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lEtT5fcW0ROV for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 22:05:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D21FD41598
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 22:05:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E60D38285F; Tue,  1 Feb 2022 21:58:21 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 1 Feb 2022 22:23:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 67126ef063a9a502bddb016be89e40bcaefc74c2
X-Git-Newrev: c97e139924c28f98dae13b3c0ef2f5c1f75e1d70
X-Patchwork-Hint: ignore
Message-Id: <20220201215821.E60D38285F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mtd: fix build with libexecinfo
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

commit: https://git.buildroot.net/buildroot/commit/?id=c97e139924c28f98dae13b3c0ef2f5c1f75e1d70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised on uclibc and musl since the
addition of libexecinfo package in commit
eea8ba446c10701a273432552108d80fb2224ef4:

/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-musleabihf/10.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: tests/fs-tests/integrity/integck-integck.o: in function `check_failed.constprop.0':
integck.c:(.text+0x96c): undefined reference to `backtrace'

Fixes:
 - http://autobuild.buildroot.org/results/9409ebf6517db87672f3f4df5909a8ac4abfe8af

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mtd/mtd.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 9f4cc27ef1..45e7c0c61c 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -13,6 +13,15 @@ MTD_CPE_ID_VENDOR = mtd-utils_project
 MTD_CPE_ID_PRODUCT = mtd-utils
 MTD_INSTALL_STAGING = YES
 
+MTD_LDFLAGS = $(TARGET_LDFLAGS)
+
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+MTD_DEPENDENCIES += libexecinfo
+MTD_LDFLAGS += -lexecinfo
+endif
+
+MTD_CONF_ENV += LDFLAGS="$(MTD_LDFLAGS)"
+
 ifeq ($(BR2_PACKAGE_MTD_JFFS_UTILS),y)
 MTD_DEPENDENCIES += zlib lzo host-pkgconf
 MTD_CONF_OPTS += --with-jffs
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
