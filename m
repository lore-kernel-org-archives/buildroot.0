Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACA6C27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 19:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A4EE403EB;
	Sat, 15 Jun 2024 19:55:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zS3k9nvOdbqn; Sat, 15 Jun 2024 19:55:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02A3D4060E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02A3D4060E;
	Sat, 15 Jun 2024 19:55:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 02A3B1BF306
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 19:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F08AE4044D
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 19:55:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pGwcgkuAIuLR for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 19:55:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04A2F403EB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04A2F403EB
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 19:55:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E0ABE84F18; Sat, 15 Jun 2024 19:55:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Jun 2024 21:55:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ddc46ee1a2024ec9eb38718e34ab9aca38a7302b
X-Git-Newrev: 106e43e3036f4c71419c698445ab979e3f32007a
X-Patchwork-Hint: ignore
Message-Id: <20240615195532.E0ABE84F18@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/execline: fix uclibc build
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

commit: https://git.buildroot.net/buildroot/commit/?id=106e43e3036f4c71419c698445ab979e3f32007a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following uclibc build failure raised since bump to version
2.9.5.1 in commit 42fad03182ed53de8003b66d50e893f42b72145e and
https://github.com/skarnet/execline/commit/6dfe54be869c117676dcc004400ac68096945531:

src/execline/eltest.c: In function 'eltest_run':
src/execline/eltest.c:366:31: error: 'struct stat' has no member named 'st_mtim'; did you mean 'st_mtime'?
  366 |       return timespec_cmp(&st.st_mtim, &st.st_atim) > 0 ;
      |                               ^~~~~~~
      |                               st_mtime

Fixes: 42fad03182ed53de8003b66d50e893f42b72145e
 - http://autobuild.buildroot.org/results/64bf2928f36e07332052854cbaaa7a6f8f347e29

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/execline/execline.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/execline/execline.mk b/package/execline/execline.mk
index 842ded6b88..b3d2d98216 100644
--- a/package/execline/execline.mk
+++ b/package/execline/execline.mk
@@ -12,6 +12,7 @@ EXECLINE_INSTALL_STAGING = YES
 EXECLINE_DEPENDENCIES = skalibs
 
 EXECLINE_CONF_OPTS = \
+	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
 	--prefix=/ \
 	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
 	--with-include=$(STAGING_DIR)/include \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
