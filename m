Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5485EF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 708F6615FA;
	Fri, 13 Feb 2026 19:37:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b4lwdGzDu7Z9; Fri, 13 Feb 2026 19:37:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6ABF9615F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011464;
	bh=KOFzEw9+iuRLYoWE8IQEzoNBtgReDC3XOeSDfNRy0FY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kxSogF2PdZtyZi2omgFIl6tqV+i/8GGoUMSR3RPHRIHS9IxT2vn5NLm5ZR1IpQ2Zy
	 GqA3EHkmkuSDlHgQpUvUA5zUHoVA3fDh7osI4vtA7eohuHkbgkZxtiBp4v0PC7dWly
	 VPRtpf0KVudXjWlgRkNWzt5IEXBkEHAWvp0XHK8OtuDUgSOwtL9OuA2KEAfb5nOTL3
	 2VKt/vgErNyYPJFUNIQsQ46/jyhL1KvWjGX6SvmXQsGn80GP5JEo0xdQfXOsY3do7v
	 5XAl7SW8/DxAG+qQmfrbgeWo7Y7yDgzhBO/xk+m+YcKOLcghd/lNh6lUrRL5jxxbE0
	 ZVIA6BLedmV2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6ABF9615F7;
	Fri, 13 Feb 2026 19:37:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 29E2C283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC163412F2
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7_KvFzqx97NA for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A35B5412C3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A35B5412C3
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 98BC386D69; Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:24:39 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 308c7de0213eb3a5f640faf62daf7241b8301be4
X-Git-Newrev: cbb1f48a643c6427f25a4d0e188d263073fe0e8e
X-Patchwork-Hint: ignore
Message-Id: <20260213193701.98BC386D69@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/berkeleydb: fix
 non-threaded build
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cbb1f48a643c6427f25a4d0e188d263073fe0e8e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

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
(cherry picked from commit 9a1a71be21e6c45383800824863b75cb08b029a8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
