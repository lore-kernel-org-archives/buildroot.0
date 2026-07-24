Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62EBC531F9
	for <buildroot@archiver.kernel.org>; Fri, 24 Jul 2026 14:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E03C60BA5;
	Fri, 24 Jul 2026 14:13:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1WM87qdLYuqn; Fri, 24 Jul 2026 14:13:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F88660B9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784902436;
	bh=BYf7DlyYhUfx0nB5OLRUPq9S9QAphr3SA42ZUhcHczQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hXOpV0M3AsAub1+KXeDJZRFVkMb4u9XkNYvTzQ8nsnWPLpfqhYw+e4jAmYiBz2Ekb
	 AVYyvipvmGiJmraO8UhZJnZb1Kcn7JSTMMX/yieolOMZna/T1Hz8Mg5ps8hGEYv1I6
	 sJnD4G/ziSxdpFQmOyEz6VLAV4YU+nwuStPInxjHgTsIQhs6a718C0OVXA3d25I8RL
	 p3YVqtnHi/a7Fax3UNQBGovyLuENb0VzlQlPAYGQk0x/Egw1H3TGIDSXVMRgwFooKX
	 N9yj3HOLKiG/gMqnNdeXvMts9DrHstmUrfHFUkepDI1qDyNzd+ttEFj3g6drSJQCTB
	 +Ux/keTGyp5Cw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F88660B9C;
	Fri, 24 Jul 2026 14:13:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D9DCA490
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 14:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C052240B39
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 14:13:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dOqUsEMzLg6e for <buildroot@buildroot.org>;
 Fri, 24 Jul 2026 14:13:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D57040B41
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D57040B41
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 14:13:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 620788A516; Fri, 24 Jul 2026 14:13:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 24 Jul 2026 15:20:21 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 948312c2ea5e34c291a73d6a577f32bb45326786
X-Git-Newrev: b55c4f1a5c6f0afcb5f936d0e60f463305dff365
X-Patchwork-Hint: ignore
Message-Id: <20260724141311.620788A516@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/bitcoin: Fix
 build without SSP
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b55c4f1a5c6f0afcb5f936d0e60f463305dff365
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
(cherry picked from commit ed51b4b691592a24b2650b24539400e7a1a099f8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
