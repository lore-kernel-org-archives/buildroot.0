Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A13CD1288
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 12:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3A6A81947;
	Mon,  1 Apr 2024 12:09:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AR1vPesgqP-W; Mon,  1 Apr 2024 12:09:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04E6A81DE9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04E6A81DE9;
	Mon,  1 Apr 2024 12:09:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D59A31BF2CD
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 12:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C03E481947
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 12:09:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EjxHj5tC9aUp for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 12:09:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D68F981DE9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D68F981DE9
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 12:09:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B3A18844C0; Mon,  1 Apr 2024 12:09:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 1 Apr 2024 14:08:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b5680f53d60acf8ff6010082f873438a39bd5d97
X-Git-Newrev: 9139159d3917d8d5f1db0c7e84562c0ba4922048
X-Patchwork-Hint: ignore
Message-Id: <20240401120922.B3A18844C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zic: fix host compile (needs
 CC/HOST_CONFIGURE_OPTS set)
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

commit: https://git.buildroot.net/buildroot/commit/?id=9139159d3917d8d5f1db0c7e84562c0ba4922048
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

zic needs CC defined since version bump to 2024a, and upstream commit
c3ebd8e98846 (make Makefile more compatible with POSIX).

Use HOST_CONFIGURE_OPTS which contains the appropriate host CC setting,
as well as our host CFLAGS and LDFLAGS.

Fixes:

  c99 -O1   -c -o zic.o zic.c
  make[2]: c99: No such file or directory

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[yann.morin.1998@free.fr: reword commit log, refer to upstream commit]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/zic/zic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index 95fa1eaa96..8abcec9360 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -12,7 +12,7 @@ ZIC_LICENSE = Public domain
 ZIC_LICENSE_FILES = LICENSE
 
 define HOST_ZIC_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) zic
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) zic
 endef
 
 define HOST_ZIC_INSTALL_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
