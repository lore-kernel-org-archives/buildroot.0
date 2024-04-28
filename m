Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB66C4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 14:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BAFB40514;
	Sun, 28 Apr 2024 14:22:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NKVoiYN4NUue; Sun, 28 Apr 2024 14:22:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08F7640520
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08F7640520;
	Sun, 28 Apr 2024 14:22:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 41FFA1BF5B4
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 14:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2ED64401DD
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 14:22:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h_vkbJPLwlEh for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 14:22:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B66740025
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B66740025
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 14:22:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 55EA985E62; Sun, 28 Apr 2024 14:22:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 28 Apr 2024 16:17:49 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 39643530f54e8ef0b7dc685b5a2259bf5935df63
X-Git-Newrev: b300a1ed8548c96fd1448d1a9c819f443d15e341
X-Patchwork-Hint: ignore
Message-Id: <20240428142249.55EA985E62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/zic: fix host
 compile (needs CC/HOST_CONFIGURE_OPTS set)
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

commit: https://git.buildroot.net/buildroot/commit/?id=b300a1ed8548c96fd1448d1a9c819f443d15e341
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
(cherry picked from commit 9139159d3917d8d5f1db0c7e84562c0ba4922048)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
