Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D88AC25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 14:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0810615DB;
	Sat,  8 Jun 2024 14:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k6IF97IaFYDf; Sat,  8 Jun 2024 14:02:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A94AC607DE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A94AC607DE;
	Sat,  8 Jun 2024 14:02:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 120FC1BF863
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 14:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA439607C3
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 14:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XEqJsUtD_lOO for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 14:01:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E215A607AB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E215A607AB
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 14:01:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE7ED7FB95; Sat,  8 Jun 2024 14:01:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 15:59:01 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 019e0d31cd47503ae1912200eba70bf640b755a7
X-Git-Newrev: cc7bffeb59ce539977ec150e7abdd654c42f9d88
X-Patchwork-Hint: ignore
Message-Id: <20240608140142.DE7ED7FB95@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/lua-cffi: fix
 or1k build
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

commit: https://git.buildroot.net/buildroot/commit/?id=cc7bffeb59ce539977ec150e7abdd654c42f9d88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fix the following or1k build failure raised since bump to version 0.2.2
in commit 079d992b271240fc1776a2855299955043774280:

In file included from /home/buildroot/autobuild/run/instance-0/output-1/host/or1k-buildroot-linux-uclibc/sysroot/usr/include/lua.hpp:6,
                 from ../src/lua.hh:23,
                 from ../src/parser.hh:4,
                 from ../src/ffilib.cc:7:
../src/ffilib.cc: In static member function 'static void ffi_module::setup(lua_State*)':
../src/ffilib.cc:1616:28: error: expected ')' before 'FFI_ARCH_NAME'
 1616 |         lua_pushliteral(L, FFI_ARCH_NAME);
      |                            ^~~~~~~~~~~~~

Fixes: 079d992b271240fc1776a2855299955043774280
 - http://autobuild.buildroot.org/results/4e14753732c5b6fe8ba9ecc4050ffb35f471c428

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9b07b4bf6d6091ad13cbfcec77b73994f4682e3c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-src-platform.hh-fix-or1k-build.patch      | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/lua-cffi/0001-src-platform.hh-fix-or1k-build.patch b/package/lua-cffi/0001-src-platform.hh-fix-or1k-build.patch
new file mode 100644
index 0000000000..35d023df44
--- /dev/null
+++ b/package/lua-cffi/0001-src-platform.hh-fix-or1k-build.patch
@@ -0,0 +1,39 @@
+From 2294e61b057215bf089b1d1c482a5dcbcad6b414 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 23 May 2024 17:50:18 +0200
+Subject: [PATCH] src/platform.hh: fix or1k build
+
+Fix the following or1k build failure raised since version 0.2.2 and
+https://github.com/q66/cffi-lua/commit/27755f61e4c625dff951302bade4ad07e3609ca5:
+
+In file included from /home/buildroot/autobuild/run/instance-0/output-1/host/or1k-buildroot-linux-uclibc/sysroot/usr/include/lua.hpp:6,
+                 from ../src/lua.hh:23,
+                 from ../src/parser.hh:4,
+                 from ../src/ffilib.cc:7:
+../src/ffilib.cc: In static member function 'static void ffi_module::setup(lua_State*)':
+../src/ffilib.cc:1616:28: error: expected ')' before 'FFI_ARCH_NAME'
+ 1616 |         lua_pushliteral(L, FFI_ARCH_NAME);
+      |                            ^~~~~~~~~~~~~
+
+Fixes: 27755f61e4c625dff951302bade4ad07e3609ca5
+ - http://autobuild.buildroot.org/results/4e14753732c5b6fe8ba9ecc4050ffb35f471c428
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/q66/cffi-lua/commit/2294e61b057215bf089b1d1c482a5dcbcad6b414
+---
+ src/platform.hh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/platform.hh b/src/platform.hh
+index 84e0a89..dab1e76 100644
+--- a/src/platform.hh
++++ b/src/platform.hh
+@@ -192,7 +192,7 @@
+ #  endif
+ #elif defined(__OR1K__)
+ #  define FFI_ARCH FFI_ARCH_OR1K
+-#  define FFO_ARCH_NAME "or1k"
++#  define FFI_ARCH_NAME "or1k"
+ #elif defined(__riscv) || defined(__riscv__)
+ #  if __riscv_xlen == 32
+ #    define FFI_ARCH FFI_ARCH_RV32
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
