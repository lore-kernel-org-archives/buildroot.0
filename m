Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86996C44521
	for <buildroot@archiver.kernel.org>; Sun, 19 Jul 2026 11:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A9F160624;
	Sun, 19 Jul 2026 11:34:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EnOpbmV4xKuU; Sun, 19 Jul 2026 11:34:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43B106062C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784460885;
	bh=i0svVjCOUNJOqTVSaHSZKtxALwmxDPLAAtzYy/H0cfs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qskV2Ua/Gat8VqycRtkN8mvwP0FmAdEdSZpeZvl1OXme8pzxfMSUWszY++3id/I6d
	 i+Ny7db5LyhKb8oZBqTHugZ5DSmWQDrHNSfsTiKoyTvCcSfZJgbcEpx7w0xPvO97Q1
	 NuATuRYWpXKR5oSjDVChzCturziPDaqqiOM1t3RWmxwVi8Z61/W4bSIcdyqzZ+tS08
	 f4V2enW0AHCUSNxZowKCUBKWWj1P2YlZPV2VOpCaempo6hh4ZmpEsSw/rCF13Kbc0c
	 wGk1wKsEBEYvzt2344PdQUifrjWTNIdyPgcR+A7umQt++msiu9FH2HLKpbPuAjz7Ac
	 CmNgj/JeTSGsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43B106062C;
	Sun, 19 Jul 2026 11:34:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D9F62320
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 11:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB7BD6062C
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 11:34:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EK9unARY5jnn for <buildroot@buildroot.org>;
 Sun, 19 Jul 2026 11:34:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7745460624
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7745460624
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 11:34:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E53188F81; Sun, 19 Jul 2026 11:34:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Jul 2026 13:08:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f8eeb68b129f93ce40bf66929d5980560426b2cd
X-Git-Newrev: ed51b4b691592a24b2650b24539400e7a1a099f8
X-Patchwork-Hint: ignore
Message-Id: <20260719113404.3E53188F81@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bitcoin: Fix build without SSP
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ed51b4b691592a24b2650b24539400e7a1a099f8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit fabcd7c8cc44e7e03c68bfcd2b4e2d10331a93f6 bumped the
package from 28.0 to 30.0 which includes upstream commit
https://github.com/bitcoin/bitcoin/commit/a01cb6e63ff3940f0773b37e2fe1e148f17acad9
that was first included in version 29.0 and added among others
-fstack-protector-all to cxx_flags guarded with a new configure option
ENABLE_HARDENING which default to ON.

This commit causes build errors with toolchains with SSP support:

[ 44%] Linking CXX executable ../bin/bitcoin
/home/autobuild/autobuild/instance-40/output-1/host/lib/gcc/i686-buildroot-linux-musl/15.2.0/../../../../i686-buildroot-linux-musl/bin/ld:
 CMakeFiles/bitcoin.dir/bitcoin.cpp.o:
 in function `fs::PathToString(fs::path const&)':
bitcoin.cpp:(.text+0x4c):
 undefined reference to `__stack_chk_fail_local'

Upstream later removed the forementioned configure option with commit
https://github.com/bitcoin/bitcoin/commit/00ba3ba30341a9073049125334f176d6c05d1b54
that was first included in version 30.0 so we need to remove
-fstack-protector-all from CMakeLists.txt.

Fixes:
https://autobuild.buildroot.net/results/093/093253c79fed1c5b93decc3124e9ef4622168efe/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...akeLists.txt-Don-t-force-fstack-protector.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/bitcoin/0002-CMakeLists.txt-Don-t-force-fstack-protector.patch b/package/bitcoin/0002-CMakeLists.txt-Don-t-force-fstack-protector.patch
new file mode 100644
index 0000000000..40370d1bf7
--- /dev/null
+++ b/package/bitcoin/0002-CMakeLists.txt-Don-t-force-fstack-protector.patch
@@ -0,0 +1,30 @@
+From 4d33b5bcc924c9271c40a19796f8316ba6aaa276 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 18 Jul 2026 08:10:21 +0200
+Subject: [PATCH] CMakeLists.txt: Don't force -fstack-protector
+
+This allows the environment to decide whether SSP should be used or
+not, for example to support toolchains that don't have SSP support.
+
+Upstream: N/A Buildroot specific
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 892f30d94b..93ccbf71ec 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -532,7 +532,6 @@ else()
+   unset(cxx_supports_fortify_source)
+ 
+   try_append_cxx_flags("-Wstack-protector" TARGET core_interface SKIP_LINK)
+-  try_append_cxx_flags("-fstack-protector-all" TARGET core_interface)
+   try_append_cxx_flags("-fcf-protection=full" TARGET core_interface)
+ 
+   if(MINGW)
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
