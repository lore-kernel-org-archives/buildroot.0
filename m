Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA11C001DE
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 21:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E06440919;
	Mon,  7 Aug 2023 21:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E06440919
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7woWe0cHanez; Mon,  7 Aug 2023 21:52:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E852A408FD;
	Mon,  7 Aug 2023 21:52:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E852A408FD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D569B1BF3F6
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 21:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD73C408FD
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 21:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD73C408FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W31JB_Za8nsL for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 21:52:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2013408FB
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 21:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2013408FB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8ECE084777; Mon,  7 Aug 2023 21:52:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Aug 2023 23:49:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 02a199105d88b295cac5bbce3d48f896e5605300
X-Git-Newrev: ff050de534eed1dab152890d748952fc659882a0
X-Patchwork-Hint: ignore
Message-Id: <20230807215218.8ECE084777@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libglib2: fix libiconv handling
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

commit: https://git.buildroot.net/buildroot/commit/?id=ff050de534eed1dab152890d748952fc659882a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In upstream commit e71ecc8771a4f13bc6046438ab0845944831b9a6 ("build:
Remove deprecated -Diconv option"), merged since glib 2.75.1, the
meson -Diconv option was removed.

In Buildroot, this means that the build of libglib2 has been broken
since commit 3f9622fe3d85b4d9f734b879abc1d485afea19b2, which bumped
libglib2 from 2.72.3 to 2.76.1 for configurations that have libiconv
enabled, causing this build failure:

../output-1/build/libglib2-2.76.1/meson.build:1:0: ERROR: Unknown options: "iconv"

iconv is now automatically detected by Meson machinery, and so the
option was considered as no longer being needed. This commit fixes
that by dropping the useless -Diconv=external.

Another related change done is remove the double addition of libiconv
into the <pkg>_DEPENDENCIES variable: libiconv can only be enabled
when BR2_ENABLE_LOCALE is disabled, and libglib2/Config.in selects
BR2_PACKAGE_LIBICONV when !BR2_ENABLE_LOCALE. So testing
BR2_ENABLE_LOCALE!=y and BR2_PACKAGE_LIBICONV=y is exactly the same
thing, causing libiconv to be added twice to the dependencies.

Fixes:

  http://autobuild.buildroot.net/results/d2da03f7558f3b6ee59c813bb64115702e52704c/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libglib2/libglib2.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index ecd7d5dbfe..c06ded2a5b 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -60,10 +60,6 @@ LIBGLIB2_MESON_EXTRA_PROPERTIES = \
 	have_c99_snprintf=true \
 	have_unix98_printf=true
 
-ifneq ($(BR2_ENABLE_LOCALE),y)
-LIBGLIB2_DEPENDENCIES += libiconv
-endif
-
 ifeq ($(BR2_PACKAGE_ELFUTILS),y)
 LIBGLIB2_DEPENDENCIES += elfutils
 endif
@@ -74,7 +70,6 @@ LIBGLIB2_LDFLAGS += -latomic
 endif
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
-LIBGLIB2_CONF_OPTS += -Diconv=external
 LIBGLIB2_DEPENDENCIES += libiconv
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
