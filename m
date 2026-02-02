Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D206BE7DF13
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 17:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FA72407B9;
	Mon,  2 Feb 2026 17:37:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3iVjMIm2vw4C; Mon,  2 Feb 2026 17:37:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C65D74081D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770053860;
	bh=WzGzkKQA67ZMsvT4F0I7bMs6MnWnJsxzyQotbd51mf4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fi/o8ZLyM6M66/2Or4Ujibby7xuiLrgpRYIUE1/V5y3SoQL8v4sUojdYih/6WSSZk
	 6i8e6Q8lImSJ7mkWztkQtXErpxsr8KAGcTmDEOPhS8QV04ohm/uyTQxxpHsULBbZHp
	 RDYZB5qodhKFk8kL+iVle/inBL5S/9McqNoTdbqtFW1HnvnNLCVF3nmALW2yRTipDO
	 /+5l/MFGi5eJYx/WxC+TuF+/rghzDtQSuCqMiXWKlnkEdFd2I+NXsc6AKb3G3kk3pU
	 L6FtXqGKb/c9i1h/aNaWCLJERV322ld4Dyg9jBY0YkAHt9WUgeCf7+FVS62P+yprA4
	 GL0+/VURDXgzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C65D74081D;
	Mon,  2 Feb 2026 17:37:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A95E149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDD1D82660
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:37:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KwPYn1rlKq2t for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 17:37:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A73E38254D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A73E38254D
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:37:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 95900863FE; Mon,  2 Feb 2026 17:37:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 18:28:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 86eb131c763a38eea9b2407ad99219847a1088ba
X-Git-Newrev: 9a1a71be21e6c45383800824863b75cb08b029a8
X-Patchwork-Hint: ignore
Message-Id: <20260202173737.95900863FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/berkeleydb: fix non-threaded build
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

commit: https://git.buildroot.net/buildroot/commit/?id=9a1a71be21e6c45383800824863b75cb08b029a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building berkeleydb is broken with a non-threaded toolchain with gcc >=
14.x:

../src/rep/rep_method.c:1740:25: error: implicit declaration of function
 '__repmgr_get_nsites'; did you mean '__rep_get_nsites'?
 [-Wimplicit-function-declaration]
 1740 |                 return (__repmgr_get_nsites(env, n));

According to src/repmgr/repmgr_util.c, line 503+, the function
'__repmgr_get_nsites' mentioned in the gcc error message "may only be
called after threads have been started".
This source file repmgr_util.c belongs to REPMGR_OBJS according to
dist/Makefile.in, line 249+, which is, according to dist/configure.ac,
line 956, only build if thread support is present.

In a non-threaded build '__repmgr_get_nsites' does not exist causing the
build error.

To fix the build error we disable replication for non-threaded
toolchains.

Using gcc 13.x the build error does not occur, tested with this
defconfig:

BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
BR2_PTHREADS_NONE=y
BR2_GCC_VERSION_13_X=y
BR2_PACKAGE_BERKELEYDB=y

Using this minimal gcc 14.x-based defconfig

BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
BR2_PTHREADS_NONE=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_PACKAGE_BERKELEYDB=y

the build error can be reproduced.

The oldest build error of this kind, afaics, dates back to 2024-06-13:
https://autobuild.buildroot.net/results/e0d/e0d6bdbef01bee277b0da83605b2906af876058a/

Fixes:
https://autobuild.buildroot.net/results/792/792ed942d17bb8d00cd321536a102f6dd63b6a8a/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/berkeleydb/berkeleydb.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index 6c487400ae..46838ca85c 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -45,6 +45,7 @@ define BERKELEYDB_CONFIGURE_CMDS
 		--with-pic \
 		--enable-o_direct \
 		$(if $(BR2_TOOLCHAIN_HAS_THREADS),--enable-mutexsupport,--disable-mutexsupport) \
+		$(if $(BR2_TOOLCHAIN_HAS_THREADS),--enable-replication,--disable-replication) \
 	)
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
