Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D37C10F1A
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 07:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53F83401CC;
	Sun, 12 May 2024 07:14:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LkgBXRtlt4rJ; Sun, 12 May 2024 07:14:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EF79402DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EF79402DC;
	Sun, 12 May 2024 07:14:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 245571BF473
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 07:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1092181F1F
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 07:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y_SNH205QJ7r for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 07:14:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A79C81F17
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A79C81F17
 for <buildroot@buildroot.org>; Sun, 12 May 2024 07:14:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3530F87047; Sun, 12 May 2024 07:14:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 09:09:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 29205bb267278591a6ff6ad54e351dec1b34d2aa
X-Git-Newrev: 880066bad68bf881cc0636cd51c177625d4fa837
X-Patchwork-Hint: ignore
Message-Id: <20240512071420.3530F87047@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dmraid: set -fPIC
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

commit: https://git.buildroot.net/buildroot/commit/?id=880066bad68bf881cc0636cd51c177625d4fa837
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add -fPIC to CFLAGS to fix the following build failure raised since
commit de6415ad9c35b2013af1f1821bcac12ba3959674:

/home/autobuild/autobuild/instance-5/output-1/host/lib/gcc/x86_64-buildroot-linux-gnu/12.3.0/../../../../x86_64-buildroot-linux-gnu/bin/ld: misc/misc.o: warning: relocation against `stdout@@GLIBC_2.2.5' in read-only section `.text'
/home/autobuild/autobuild/instance-5/output-1/host/lib/gcc/x86_64-buildroot-linux-gnu/12.3.0/../../../../x86_64-buildroot-linux-gnu/bin/ld: log/log.o: relocation R_X86_64_PC32 against symbol `stdout@@GLIBC_2.2.5' can not be used when making a shared object; recompile with -fPIC

Fixes: de6415ad9c35b2013af1f1821bcac12ba3959674
 - http://autobuild.buildroot.org/results/0349c6bfd66f5e50429e4a5cc07fb7abf2b07345

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dmraid/dmraid.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dmraid/dmraid.mk b/package/dmraid/dmraid.mk
index 9a78c2ae07..97c729aa70 100644
--- a/package/dmraid/dmraid.mk
+++ b/package/dmraid/dmraid.mk
@@ -13,7 +13,7 @@ DMRAID_MAKE = $(MAKE1)
 DMRAID_INSTALL_STAGING = YES
 DMRAID_LICENSE = GPL-2.0
 DMRAID_LICENSE_FILES = $(DMRAID_SUBDIR)/LICENSE_GPL $(DMRAID_SUBDIR)/LICENSE
-DMRAID_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)
+DMRAID_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -fPIC"
 
 DMRAID_DEPENDENCIES = lvm2
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
