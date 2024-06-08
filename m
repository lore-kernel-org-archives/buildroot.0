Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1BDC25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 13:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A4E084255;
	Sat,  8 Jun 2024 13:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pT7HRB9jH-Cc; Sat,  8 Jun 2024 13:09:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBA90841E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBA90841E4;
	Sat,  8 Jun 2024 13:09:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4305F1BF41A
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 13:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3BA92402B1
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 13:08:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gvbWoDMG3jxs for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 13:08:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AF35402D0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1AF35402D0
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 13:08:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1748E8135D; Sat,  8 Jun 2024 13:08:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 15:07:22 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 46871affea6c39b212735fcb1f91312318357e73
X-Git-Newrev: 862aeb78303c7eb8b82e73ade65b6cf4308d2e58
X-Patchwork-Hint: ignore
Message-Id: <20240608130852.1748E8135D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libvncserver:
 correct WITH_THREADS=ON/OFF logic
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

commit: https://git.buildroot.net/buildroot/commit/?id=862aeb78303c7eb8b82e73ade65b6cf4308d2e58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Commit ee59023794f5540e5 (package/libvncserver: bump to version 0.9.12)
changes the package from autotools to cmake and accidently inverted the
threads logic.

The reason this was not noticed is that the build system verifies if threads
support works and otherwise disables it even when -DWITH_THREADS=ON is
passed, E.G.  for a nothread configuration:

cmake ... -DWITH_THREADS=ON ...
..
-- Performing Test CMAKE_HAVE_LIBC_PTHREAD
-- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Failed
-- Looking for pthread_create in pthreads
-- Looking for pthread_create in pthreads - not found
-- Looking for pthread_create in pthread
-- Looking for pthread_create in pthread - not found

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7b3c0b19d4d587f52546ac92386e8a890022bb24)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvncserver/libvncserver.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index 3a15a82d08..082f838f12 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -22,7 +22,7 @@ LIBVNCSERVER_CONF_OPTS += \
 	-DWITH_SDL=OFF \
 	-DWITH_TESTS=OFF
 
-ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 LIBVNCSERVER_CONF_OPTS += -DWITH_THREADS=ON
 else
 LIBVNCSERVER_CONF_OPTS += -DWITH_THREADS=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
