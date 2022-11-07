Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B3FC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EE6F41D49;
	Mon, 20 Feb 2023 21:10:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EE6F41D49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D5YMlq7WYXpp; Mon, 20 Feb 2023 21:10:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 063C142A72;
	Mon, 20 Feb 2023 21:10:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 063C142A72
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 06C311BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FE18610B0
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FE18610B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kRzA9fVCA3mc for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F57561067
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F57561067
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 14BE08648F; Mon, 20 Feb 2023 20:51:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Nov 2022 23:06:29 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ea38acd17d88b9eaf853313398c772b94338ad47
X-Git-Newrev: a38682dd54dde976836c37dcc30ec24baa474690
X-Patchwork-Hint: ignore
Message-Id: <20230220205149.14BE08648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gptfdisk: fix popt
 static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=a38682dd54dde976836c37dcc30ec24baa474690
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following static build failure with popt and iconv raised since
bump to version 1.0.9 in commit 69015ce94ac3ffe7f349ec37868eea0d0ffec90e
and
https://sourceforge.net/p/gptfdisk/code/ci/122b58ad82f1a144226d262c87241ee035ed1aff
(which added an unified Makefile):

/home/autobuild/autobuild/instance-0/output-1/host/bin/mips64el-buildroot-linux-uclibc-g++ crc32.o support.o guid.o gptpart.o mbrpart.o basicmbr.o mbr.o gpt.o bsd.o parttypes.o attributes.o diskio.o diskio-unix.o sgdisk.o gptcl.o -static -liconv -lpopt  -o sgdisk
/home/autobuild/autobuild/instance-0/output-1/host/lib/gcc/mips64el-buildroot-linux-uclibc/11.3.0/../../../../mips64el-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-0/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/lib64/../lib64/libpopt.a(poptint.o): in function `strdup_locale_from_utf8':
poptint.c:(.text+0x113c): undefined reference to `libiconv_open'

As can be seen above, this build failure is raised because -liconv is
added before -lpopt so use pkgconfig and SGDISK_LDLIBS

The addition of -liconv in LDLIBS could probably be removed in a
follow-up patch for next branch

Fixes:
 - http://autobuild.buildroot.org/results/c9f2c9e737c2dd1cd4c1a08a5e8a48165179282d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gptfdisk/gptfdisk.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
index 0df9cda08f..f3fc930202 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -15,7 +15,8 @@ GPTFDISK_TARGETS_$(BR2_PACKAGE_GPTFDISK_CGDISK) += cgdisk
 
 GPTFDISK_DEPENDENCIES += util-linux
 ifeq ($(BR2_PACKAGE_GPTFDISK_SGDISK),y)
-GPTFDISK_DEPENDENCIES += popt
+GPTFDISK_DEPENDENCIES += host-pkgconf popt
+GPTFDISK_SGDISK_LDLIBS += `$(PKG_CONFIG_HOST_BINARY) --libs popt`
 endif
 ifeq ($(BR2_PACKAGE_GPTFDISK_CGDISK),y)
 GPTFDISK_DEPENDENCIES += ncurses
@@ -32,7 +33,8 @@ endif
 
 define GPTFDISK_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
-		LDLIBS='$(GPTFDISK_LDLIBS)' $(GPTFDISK_TARGETS_y)
+		LDLIBS='$(GPTFDISK_LDLIBS)' \
+		SGDISK_LDLIBS='$(GPTFDISK_SGDISK_LDLIBS)' $(GPTFDISK_TARGETS_y)
 endef
 
 define GPTFDISK_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
