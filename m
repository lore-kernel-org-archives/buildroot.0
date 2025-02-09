Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9667AC02199
	for <buildroot@archiver.kernel.org>; Sun,  9 Feb 2025 08:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 597EF605F1;
	Sun,  9 Feb 2025 08:59:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E_01aAsZPrBB; Sun,  9 Feb 2025 08:59:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 686AF605F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 686AF605F9;
	Sun,  9 Feb 2025 08:59:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FAF6C2
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 08:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53161605F1
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 08:59:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id brlmEQSm6iIs for <buildroot@buildroot.org>;
 Sun,  9 Feb 2025 08:59:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C7B3605F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C7B3605F9
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 08:59:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B46B86F80; Sun,  9 Feb 2025 08:59:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 9 Feb 2025 09:56:43 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: e4f86df5f40a7eea047d130c158c14795d166417
X-Git-Newrev: 37e2cdc87ef3b3fc854f003c9ff9f882d2ee4d1d
X-Patchwork-Hint: ignore
Message-Id: <20250209085926.7B46B86F80@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/heimdal: add
 missing dependencies on flex/bison
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=37e2cdc87ef3b3fc854f003c9ff9f882d2ee4d1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

As host-heimdal is only used by samba4, and samba4 already depends on
host-flex and host-bison, the build issue fixed by this commit is not
directly visible, but can be reproduced by doing "make host-heimdal"
for example in our official Buildroot Docker container:

/home/thomas/projets/buildroot/outputs/foo/build/host-heimdal-f4faaeaba371fff3f8d1bc14389f5e6d70ca8e17/missing: line 81: flex: command not found
WARNING: 'flex' is missing on your system.
         You should only need it if you modified a '.l' file.
         You may want to install the Fast Lexical Analyzer package:
         <https://github.com/westes/flex>
make[4]: *** [Makefile:753: lex.c] Error 127

[...]

updating lex.yylex.c
../../ylwrap: line 176: -d: command not found
make[4]: *** [Makefile:756: parse.c] Error 127

Fix this by adding the missing dependencies.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 44e739d031c8c5ed70a8ea513ff95dc8780a2a0f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/heimdal/heimdal.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
index 155cb66e1f..f6c52f63aa 100644
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -6,7 +6,7 @@
 
 HEIMDAL_VERSION = f4faaeaba371fff3f8d1bc14389f5e6d70ca8e17
 HEIMDAL_SITE = $(call github,heimdal,heimdal,$(HEIMDAL_VERSION))
-HOST_HEIMDAL_DEPENDENCIES = host-e2fsprogs host-ncurses host-pkgconf host-libxcrypt
+HOST_HEIMDAL_DEPENDENCIES = host-e2fsprogs host-ncurses host-pkgconf host-libxcrypt host-flex host-bison
 HOST_HEIMDAL_AUTORECONF = YES
 HEIMDAL_INSTALL_STAGING = YES
 # static because of -fPIC issues with e2fsprogs on x86_64 host
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
