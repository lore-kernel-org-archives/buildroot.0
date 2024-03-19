Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A450C6FD1F
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 16:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68F4881F26;
	Tue, 19 Mar 2024 16:36:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DpV6Z_xB3j4z; Tue, 19 Mar 2024 16:36:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4AB181F1C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4AB181F1C;
	Tue, 19 Mar 2024 16:36:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 27A821BF836
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 16:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA87140CA1
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 16:36:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ckbenxj3jXsU for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 16:36:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1CE540C28
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1CE540C28
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 16:36:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DCFCD82D13; Tue, 19 Mar 2024 16:36:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 19 Mar 2024 17:34:05 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: a9c9fe8d4ade2c2906d1c2f0b28968808050e96f
X-Git-Newrev: 3a3d7886485fc3128d928beb4960219caef2ad0f
X-Patchwork-Hint: ignore
Message-Id: <20240319163621.DCFCD82D13@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/libva: fix build
 with gcc 4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=3a3d7886485fc3128d928beb4960219caef2ad0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Fix the following build failure with gcc 4.8 raised since bump to
version 2.20.0 in commit e926c83928e08c0ecd6cd4383e1cca151a8a4d2c and
https://github.com/intel/libva/commit/4f5a4345fc9f92565763ca22026891475e3cf835:

../va/va.c: In function 'va_new_opendriver':
../va/va.c:695:9: error: 'for' loop initial declarations are only allowed in C99 mode
         for (unsigned int i = 0; i < num_drivers; i++)
         ^
../va/va.c:695:9: note: use option -std=c99 or -std=gnu99 to compile your code

Fixes: e926c83928e08c0ecd6cd4383e1cca151a8a4d2c
 - http://autobuild.buildroot.org/results/b9dbd104fa05c59883d87f74e6522c55620a4252

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d4fdd78a7207935c24427bbe736c443f0ad2a745)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libva/libva.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index 9e9d5d698c..4481be9e7b 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -10,6 +10,7 @@ LIBVA_LICENSE = MIT
 LIBVA_LICENSE_FILES = COPYING
 LIBVA_INSTALL_STAGING = YES
 LIBVA_DEPENDENCIES = host-pkgconf libdrm
+LIBVA_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
 
 # libdrm is a hard-dependency
 LIBVA_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
