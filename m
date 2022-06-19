Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CC9C43334
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 15:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55F2560E44;
	Sun, 19 Jun 2022 15:57:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55F2560E44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YtK4quw26P2R; Sun, 19 Jun 2022 15:57:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71E6760E3B;
	Sun, 19 Jun 2022 15:57:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71E6760E3B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C1991BF32D
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9EEA408F2
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:57:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9EEA408F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KHHuStmAkp7w for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 15:57:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6335F408EA
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 15:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6335F408EA
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2604E873C4; Sun, 19 Jun 2022 15:45:30 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 17:22:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d4b47d41cac1eaedefba73589a7cee361de76d48
X-Git-Newrev: 22b7fb8a8d86ae5ba9d247e919f94f400bc225f0
X-Patchwork-Hint: ignore
Message-Id: <20220619154530.2604E873C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/procrank_linux: fix static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=22b7fb8a8d86ae5ba9d247e919f94f400bc225f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Pass TARGET_CFLAGS which will contain -static to fix the following
static build failure:

/home/buildroot/autobuild/instance-0/output-1/host/bin/sh4a-buildroot-linux-musl-gcc -Wall procrank.c -Ilibpagemap/include -Llibpagemap -lpagemap -o procrank
/home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/sh4a-buildroot-linux-musl/10.3.0/../../../../sh4a-buildroot-linux-musl/bin/ld: /home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/sh4a-buildroot-linux-musl/10.3.0/libgcc.a(unwind-dw2.o): in function `size_of_encoded_value':
/home/buildroot/autobuild/instance-0/output-1/build/host-gcc-final-10.3.0/build/sh4a-buildroot-linux-musl/libgcc/../../../libgcc/unwind-pe.h:89: undefined reference to `abort'

Fixes:
 - http://autobuild.buildroot.org/results/8eccc34c99a75501179fe93a80646cc684261ff4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/procrank_linux/procrank_linux.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/procrank_linux/procrank_linux.mk b/package/procrank_linux/procrank_linux.mk
index 7e743194fc..415a4e41b7 100644
--- a/package/procrank_linux/procrank_linux.mk
+++ b/package/procrank_linux/procrank_linux.mk
@@ -10,7 +10,8 @@ PROCRANK_LINUX_LICENSE = Apache-2.0
 PROCRANK_LINUX_LICENSE_FILES = NOTICE
 
 define PROCRANK_LINUX_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CROSS_COMPILE="$(TARGET_CROSS)"
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CROSS_COMPILE="$(TARGET_CROSS)" \
+		LOCAL_CFLAGS="$(TARGET_CFLAGS)"
 endef
 
 define PROCRANK_LINUX_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
