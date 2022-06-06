Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F631C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 13:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3251783FBB;
	Mon,  6 Jun 2022 13:04:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QaSAvKzR3a8t; Mon,  6 Jun 2022 13:04:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8425783FA3;
	Mon,  6 Jun 2022 13:04:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D35711BF982
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A022140A07
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:03:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ChY1ZIKO2jfH for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 13:03:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE7E440A17
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 13:03:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id BFA8A86D44; Mon,  6 Jun 2022 12:52:01 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 14:54:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 41498af0df34a3ab61ce8e4f846c06bc534e6d16
X-Git-Newrev: 2cbcdbf0add46da55020eb56b5e4b974b44e958b
X-Patchwork-Hint: ignore
Message-Id: <20220606125201.BFA8A86D44@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-tools: fix tmon static build
 with uclibc
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

commit: https://git.buildroot.net/buildroot/commit/?id=2cbcdbf0add46da55020eb56b5e4b974b44e958b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Pass LDFLAGS (which will contain -static) to fix the following tmon
static build failure with uclibc:

/home/autobuild/autobuild/instance-3/output-1/host/bin/x86_64-buildroot-linux-uclibc-gcc -O3 -Wall -Wshadow -W -Wformat -Wimplicit-function-declaration -Wimplicit-int  -D VERSION=\"1.0\"   tmon.o tui.o sysfs.o pid.o  -o tmon -lm -lpthread -lpanel -lncurses
/home/autobuild/autobuild/instance-3/output-1/host/lib/gcc/x86_64-buildroot-linux-uclibc/10.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-3/output-1/host/lib/gcc/x86_64-buildroot-linux-uclibc/10.3.0/libgcc.a(unwind-dw2-fde-dip.o): in function `_Unwind_Find_FDE':
/home/autobuild/autobuild/instance-3/output-1/build/host-gcc-final-10.3.0/build/x86_64-buildroot-linux-uclibc/libgcc/../../../libgcc/unwind-dw2-fde-dip.c:469: undefined reference to `dl_iterate_phdr'

Fixes:
 - http://autobuild.buildroot.org/results/58f4cdb734b68afb02595d004e7ca19a15d1abcc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/linux-tools/linux-tool-tmon.mk.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-tools/linux-tool-tmon.mk.in b/package/linux-tools/linux-tool-tmon.mk.in
index 15931c3124..56c328c51f 100644
--- a/package/linux-tools/linux-tool-tmon.mk.in
+++ b/package/linux-tools/linux-tool-tmon.mk.in
@@ -9,6 +9,7 @@ LINUX_TOOLS += tmon
 TMON_DEPENDENCIES = host-pkgconf ncurses
 TMON_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
 	CC=$(TARGET_CC) \
+	LDFLAGS="$(TARGET_LDFLAGS)" \
 	PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
 
 ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
