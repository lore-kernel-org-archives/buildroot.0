Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF05CA0EE9
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 21:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA02C6155E;
	Sat, 16 Aug 2025 21:05:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0PQAP66drieG; Sat, 16 Aug 2025 21:05:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4DED61557
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4DED61557;
	Sat, 16 Aug 2025 21:05:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 289BD196
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 21:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1ACD861556
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 21:05:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id di5sBUUOr5q0 for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 21:05:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C9BA6154B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C9BA6154B
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 21:05:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D87787695; Sat, 16 Aug 2025 21:05:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 16 Aug 2025 23:05:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1c61d9c12be106472f3ff91498961e520489fca0
X-Git-Newrev: 00fa6003038b4c4483f52dded1f8b9cf2fa57e5a
X-Patchwork-Hint: ignore
Message-Id: <20250816210551.6D87787695@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bash: fix build with gcc 15
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=00fa6003038b4c4483f52dded1f8b9cf2fa57e5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 6d09b25d08fe (package/bash: fix build with host GCC 15) did
apply a workaround for when the host gcc is gcc-15 (or later), but
missed the fact that the target compiler also exhibits build issues.

For the same reasons as explained in 6d09b25d08fe, don't try and fix
those issues, but just paper over the problem by using an older C
standard.

Fixes:

  https://autobuild.buildroot.net/results/1ee74d546182695d3411358f028fcce8ccbb74c3/

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: Florian Larysch <fl@n621.de>
Cc: Julien Olivain <ju.o@free.fr>
Reviewed-by: Florian Larysch <fl@n621.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bash/bash.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 2747802592..7fb43c52c0 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -26,6 +26,11 @@ BASH_CONF_ENV = \
 	bash_cv_func_sigsetjmp=present \
 	bash_cv_printf_a_format=yes
 
+# Can be dropped when bash is bumped to 5.3 or newer.
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_15),y)
+BASH_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu17"
+endif
+
 ifeq ($(BR2_HOST_GCC_AT_LEAST_15),y)
 BASH_CONF_ENV += CFLAGS_FOR_BUILD="$(HOST_CFLAGS) -std=gnu17"
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
