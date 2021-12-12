Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647CBC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 12:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1462160E6E;
	Sun, 12 Dec 2021 12:23:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Il0FFXQBbLVo; Sun, 12 Dec 2021 12:23:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B0A960E7B;
	Sun, 12 Dec 2021 12:23:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 73BA71BF973
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 621EA60E75
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:22:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n68HUWwVD0P0 for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 12:22:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C4AF60E60
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 12:22:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E894E82B71; Sun, 12 Dec 2021 12:17:14 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 13:21:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ee1a2826dcf7ff75f90b0bf9f7aa53d19ce19cf6
X-Git-Newrev: e39d60a982fa6dd5e1e0733a527dfc25d82aa4ad
X-Patchwork-Hint: ignore
Message-Id: <20211212121714.E894E82B71@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/stella: libpng is optional,
 not mandatory
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

commit: https://git.buildroot.net/buildroot/commit/?id=e39d60a982fa6dd5e1e0733a527dfc25d82aa4ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libpng is optional, not mandatory since version 6.1 and
https://github.com/stella-emu/stella/commit/eb13d515fb6385df6c653c5d295d97979b140031

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/stella/Config.in | 1 -
 package/stella/stella.mk | 9 ++++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/stella/Config.in b/package/stella/Config.in
index c14f48572b..c74c7a704d 100644
--- a/package/stella/Config.in
+++ b/package/stella/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_STELLA
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # C++14
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	select BR2_PACKAGE_SDL2
-	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_ZLIB
 	help
 	  Stella is a multi-platform Atari 2600 VCS emulator.
diff --git a/package/stella/stella.mk b/package/stella/stella.mk
index 2dcfbeaccd..e7b0082e7e 100644
--- a/package/stella/stella.mk
+++ b/package/stella/stella.mk
@@ -10,13 +10,20 @@ STELLA_SITE = https://github.com/stella-emu/stella/releases/download/$(STELLA_VE
 STELLA_LICENSE = GPL-2.0+
 STELLA_LICENSE_FILES = Copyright.txt License.txt
 
-STELLA_DEPENDENCIES = sdl2 libpng zlib
+STELLA_DEPENDENCIES = sdl2 zlib
 
 STELLA_CONF_OPTS = \
 	--host=$(GNU_TARGET_NAME) \
 	--prefix=/usr \
 	--with-sdl-prefix=$(STAGING_DIR)/usr
 
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+STELLA_CONF_OPTS += --enable-png
+STELLA_DEPENDENCIES += libpng
+else
+STELLA_CONF_OPTS += --disable-png
+endif
+
 # The configure script is not autoconf based, so we use the
 # generic-package infrastructure
 define STELLA_CONFIGURE_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
