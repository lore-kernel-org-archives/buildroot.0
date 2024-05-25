Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD84DC25B78
	for <buildroot@archiver.kernel.org>; Sat, 25 May 2024 06:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F01A80EAE;
	Sat, 25 May 2024 06:18:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mN1gQsqFtwrf; Sat, 25 May 2024 06:18:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5468F802B8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5468F802B8;
	Sat, 25 May 2024 06:18:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 034FF1D021F
 for <buildroot@lists.busybox.net>; Sat, 25 May 2024 06:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F14B44031C
 for <buildroot@lists.busybox.net>; Sat, 25 May 2024 06:18:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3cVwo3aro-CR for <buildroot@lists.busybox.net>;
 Sat, 25 May 2024 06:18:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF9D24028B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF9D24028B
 for <buildroot@buildroot.org>; Sat, 25 May 2024 06:18:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B4633875A0; Sat, 25 May 2024 06:18:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 25 May 2024 08:14:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ad9c8c9289772fb3cf026b214d6869ebc2b017be
X-Git-Newrev: 9b07b4bf6d6091ad13cbfcec77b73994f4682e3c
X-Patchwork-Hint: ignore
Message-Id: <20240525061835.B4633875A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-cffi: fix or1k build
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

commit: https://git.buildroot.net/buildroot/commit/?id=9b07b4bf6d6091ad13cbfcec77b73994f4682e3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
