Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BB4C54FC6
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 09:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6357C605CF;
	Sun,  1 Sep 2024 09:04:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GuBoahcZQPNf; Sun,  1 Sep 2024 09:04:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DA526068B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DA526068B;
	Sun,  1 Sep 2024 09:04:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E01591BF4E2
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 09:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDF7680BE5
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 09:04:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h2pcxxSi-Ybj for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 09:04:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5EA980B93
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5EA980B93
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 09:04:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B271F868AC; Sun,  1 Sep 2024 09:04:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Sep 2024 10:46:53 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: c47d8b072663f9afe447d4730ab2ec5c3676cb25
X-Git-Newrev: fa4f1e6110a8f3255670a84b070093823de714db
X-Patchwork-Hint: ignore
Message-Id: <20240901090452.B271F868AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/elfutils: fix
 build on microblaze
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

commit: https://git.buildroot.net/buildroot/commit/?id=fa4f1e6110a8f3255670a84b070093823de714db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Fix the following build failure on microblaze:

dwelf_elf_begin.c:62:1: error: symver is only supported on ELF platforms
   62 | OLD_VERSION (dwelf_elf_begin, ELFUTILS_0.175)
      | ^~~~~~~~~~~
dwelf_elf_begin.c:62:1: error: symver is only supported on ELF platforms

Fixes:
 - http://autobuild.buildroot.org/results/5ca2aa5c76415690ad4a85837ba47e7bcfbdbcbc

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8ef2bb44379e4763682199ad2ecfd23d51cbacc0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/elfutils/elfutils.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 4d8cc43342..8738af7751 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -45,6 +45,10 @@ ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 ELFUTILS_CONF_OPTS += --disable-symbol-versioning
 endif
 
+ifeq ($(BR2_microblaze),y)
+ELFUTILS_CONF_OPTS += --disable-symbol-versioning
+endif
+
 # disable for now, needs "distro" support
 ELFUTILS_CONF_OPTS += --disable-libdebuginfod --disable-debuginfod
 HOST_ELFUTILS_CONF_OPTS += --disable-libdebuginfod --disable-debuginfod
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
