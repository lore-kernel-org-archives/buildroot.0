Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD58C4332F
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 19:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E16D583495;
	Fri, 14 Oct 2022 19:17:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E16D583495
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yoW8CKaeXZf8; Fri, 14 Oct 2022 19:17:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4008383026;
	Fri, 14 Oct 2022 19:17:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4008383026
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6E4FD1C11A0
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 19:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54D9E60AE5
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 19:17:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54D9E60AE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iaMLKM1TGy1V for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 19:17:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46FD760AAC
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 19:17:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46FD760AAC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3132A86D23; Fri, 14 Oct 2022 19:17:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 14 Oct 2022 21:16:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eeeaa801f38e20b421b798c8e937e79cbd1d7cfa
X-Git-Newrev: 4c7f1a439ad44c8c7bd56a9e550fc059a14aeaa6
X-Patchwork-Hint: ignore
Message-Id: <20221014191709.3132A86D23@busybox.osuosl.org>
Subject: [Buildroot] [git commit] mmc-utils: allow enabling of dangerous
 commands
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

commit: https://git.buildroot.net/buildroot/commit/?id=4c7f1a439ad44c8c7bd56a9e550fc059a14aeaa6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Provide a config option that allows the user to enable mmc's "dangerous
commands" if so desired. mmc-utils considers turning on permanent write
protection on a device a "dangerous command" and doesn't offer it by
default.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
[yann.morin.1998@free.fr:
  - use if-endif block
  - move closer to main option for proper indentation
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mmc-utils/Config.in    | 11 +++++++++++
 package/mmc-utils/mmc-utils.mk | 10 +++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/package/mmc-utils/Config.in b/package/mmc-utils/Config.in
index 850aeac445..953afec588 100644
--- a/package/mmc-utils/Config.in
+++ b/package/mmc-utils/Config.in
@@ -6,5 +6,16 @@ config BR2_PACKAGE_MMC_UTILS
 
 	  https://git.kernel.org/cgit/linux/kernel/git/cjb/mmc-utils.git
 
+if BR2_PACKAGE_MMC_UTILS
+
+config BR2_PACKAGE_MMC_UTILS_ENABLE_DANGEROUS_COMMANDS
+	bool "Enable dangerous commands"
+	help
+	   Enable support for dangerous commands in mmc-utils. mmc-utils
+	   considers turning on permanent write protection on a device a
+	   "dangerous command" and doesn't offer it by default.
+
+endif
+
 comment "mmc-utils needs a toolchain w/ headers >= 3.0"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
index c847378692..14e2bee587 100644
--- a/package/mmc-utils/mmc-utils.mk
+++ b/package/mmc-utils/mmc-utils.mk
@@ -10,12 +10,20 @@ MMC_UTILS_SITE_METHOD = git
 MMC_UTILS_LICENSE = GPL-2.0
 MMC_UTILS_LICENSE_FILES = mmc.h
 
+MMC_UTILS_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_PACKAGE_MMC_UTILS_ENABLE_DANGEROUS_COMMANDS),y)
+MMC_UTILS_CFLAGS += -DDANGEROUS_COMMANDS_ENABLED
+endif
+
 # override AM_CFLAGS as the project Makefile uses it to pass
 # -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2, and the latter conflicts
 # with the _FORTIFY_SOURCE that we pass when hardening options are
 # enabled.
 define MMC_UTILS_BUILD_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) AM_CFLAGS=
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(MMC_UTILS_CFLAGS)" \
+		AM_CFLAGS=
 endef
 
 define MMC_UTILS_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
