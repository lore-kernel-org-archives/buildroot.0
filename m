Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CD8C982D1
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 19:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B99A80A5A;
	Wed, 16 Sep 2026 19:10:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id afx5iV1JAT7C; Wed, 16 Sep 2026 19:10:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DB20E80A91
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789585816;
	b=TQVyStQ1gEX8E89xIrbhHFYLxFhHiQP9FrkCKsGguXaIucsW6o+tRP4ufa3rWS1PC+hl
	 2c3IOGwx43aEi/Y3BEg8d7TxMzdbn84oHBfBF+qFwxeXCn+IOJYAABPooiSHl5fAVYv8Q
	 fpa060m09orqxRm3o6mF60iek0niZ8kJWSSzOCIXponmbwasl6V1H+EsViWdFJEhKxPeb
	 VeA2dKs+pUPGAdSSUa++Ta0bO2zVnOopfnTFVjaH2V8d2oRIdSgDtW+FZRQFLCdbb/3pA
	 21JtWKOEwSY5ArolE1Z6NfRyG1y46Z/sujnN6D+BKG4JVQ39F1H89cqVIZSJWn5H5zA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789585816;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=A28OSgBu5AostvRV+pkxVrjIJoKQU3a7zszi4dr1KAw=;
	b=dgN8GNtijKR4pwKjzCPWo/WvUcsalc8qXDZ/IR1tMY4P/jai2Hx/j+E0+kFYafePtpAE
	 FPhcjMK/cp0z3oAt5SM0rdT2xwzmVfkBRuOaPOk4EkVLTFmC392OOpU/ApL5OhvNY/iaM
	 f+9o4LwrE445X7L+oTW6baMJMcDtV0AK3sf4gPGOxJcMWlxzn2czeRrVGk5CP7S7PzfH5
	 Hl7SA1h9GVHAPWcBHCfhes272i/JDNHIi+tzh4cOI07OFPJmYs/fgOQlk4IXjJLJw4UUA
	 SakTZpd/AHOQgKTujJUGz7Y2Kw09zYjX1tJ7OoLNi3tLDSE++XPP02FhT8XdMlHUr4A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789585816;
	bh=A28OSgBu5AostvRV+pkxVrjIJoKQU3a7zszi4dr1KAw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gD2/QFZOPPOrnJaXu0Le60DhGY0InS6FCw9QYlpxt3Z3R+SU1th/NddJcvjprGMT9
	 ujsIxUjOhcx/DWEnw4hG/dlO1iWz7IABhc8cFalfTYVhiaALZvH3cjxjh49tmB9p6n
	 oA+oNDLRSCGED0pChSfwQa+ZbcHT8Qnl660nVd/QeeIUfnRGSY75VT+XjSXnFnwYW4
	 gXWLCCr4teVVcuamYNWrb4HcI3kUbjMZMQGC+mG4G22LN19SMcHetMDYy72qnhlSPI
	 sGrbL+czJLGeMVrC/GdPjHi+6v3znYB4d/51dc+xlVIPPvdu0iPuVXdWqLxD6CeodI
	 H8Xat4jewbQvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB20E80A91;
	Wed, 16 Sep 2026 19:10:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9ABBB7AD
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CD528085C
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:10:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OSjig5Y6TqrG for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 19:10:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 89EDB80A5A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789585809;
 b=oLHPo0b31lITzXCDoF7oOy+Er0XqLOsma0mYUBC6MyPINscm9KfmMVwkw2Ypq0u+r9Qt
 BLw+eTutg8s7A/HKv2bWV9eD691D5uzkFUYmqk5bQbkd4O5EwkWNeI7UbhGe99pBcJz49
 JwljNgBr6an/vccYbMGjhPqRAR9z9HHEKWS3BdkfEI3dNPAg6QzduCvpCNmGKlaQYL5de
 tDTQD3fMCF8Rr3xbkvnCJttgHWVgBbKcrpDZvdsjhS8rLb4vEajRj+aTgPQb0gWHBJ5PZ
 +6BUUGdmfDqS0rgQ5/FoOpTC8/UzGMflZ4tEjtwRHe1yq2v7yW3xtv/y1MhPVdLK8RQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789585809;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ufGuudzpxlpbmdgqLNmkdT+IiGZiE+bi31iKBHJ9Dtc=;
 b=PBUAkYDoKLZ4kqxr6xRc5U1kW4GeKKkGIWvde3S8gBMlG/EWIXBVtSAUultl3F3EzBMY
 R2Z+R/eZVHWjkNeaB9j9ZS9YL5dr34NQoqwKq4OuM//V8Zzf7d5VCXzD3guvRRp3ZncfT
 dVyD2Ghw096TRsAKhuH+aCzlsGm2GEk3ay+iSo+b43IP3gLG1aMOzcEjqEm29/6GoLE+g
 e3xkWcAGv3yHZINFTdOelecvWmQmiW5MSZBWIQ+g4OWJItuSQ54u/9vnmoraqHhL0zOfm
 ZV4dMu7SUIJM9C9HpCDO78ck3ExwmywuAQbMHnGB+L0BHZTyVJHb8uu3qynn2iRgFZg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89EDB80A5A
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:10:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1DA8496864; Wed, 16 Sep 2026 19:09:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 21:09:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 885055fe7805c617a551b15b5624c93043cf9293
X-Git-Newrev: edd3a015cd90441291d2b5513c71e2eabf682e24
X-Patchwork-Hint: ignore
Message-Id: <20260916190903.1DA8496864@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lttng-tools: bump version to 2.16.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5260332666554308764=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5260332666554308764==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/edd3a015cd90441291d2b5513c71e2eabf682e24
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://git.lttng.org/?p=lttng-tools.git;a=blob_plain;f=ChangeLog;hb=72dcc536523727343cb23e2a0fefd41044511d16

Added Upstream: tag to patch 0001.

Removed patch 0002 which is included in this release.

Added new patch 0002 to fix a build error on musl introduced by this
bump due to upstream commit:
https://github.com/lttng/lttng-tools/commit/968475a48be5a87139b19fddbb70b9225c5375bd

Updated license file paths according to upstream commit
https://git.lttng.org/?p=lttng-tools.git;a=history;f=LICENSES;hb=refs/heads/stable-2.16

Updated license hashes due to upstream commit
https://git.lttng.org/?p=lttng-tools.git;a=commit;h=c09078e13a4ede575724009520c37a8b8d3e68d6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 .../0001-configure.ac-add-disable-tests.patch      |  3 +-
 ....cpp-Remove-the-scope-resolution-operator.patch | 48 -------------------
 ...d-channel-memory-types.hpp-fails-to-build.patch | 55 ++++++++++++++++++++++
 package/lttng-tools/lttng-tools.hash               | 16 +++----
 package/lttng-tools/lttng-tools.mk                 | 10 +++-
 6 files changed, 73 insertions(+), 60 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 32be4c93aa..4868126fc7 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -561,7 +561,6 @@ package/ltrace/0002-sparc-add-missing-library.h-include.patch lib_patch.Upstream
 package/lttng-babeltrace/0001-tests-lib-Makefile.am-remove-unneeded-static-flag.patch lib_patch.Upstream
 package/lttng-babeltrace/0002-configure.ac-fix-popt-static-build.patch lib_patch.Upstream
 package/lttng-libust/0001-configure.ac-add-disable-tests.patch lib_patch.Upstream
-package/lttng-tools/0001-configure.ac-add-disable-tests.patch lib_patch.Upstream
 package/lua-gd/0001-Protect-declaration-of-LgdImageCreateFromPng-with-GD.patch lib_patch.Upstream
 package/lua-lunix/0001-remove-link-with-librt.patch lib_patch.Upstream
 package/lua-sdl2/0001-Do-not-reference-host-directory-for-headers.patch lib_patch.Upstream
diff --git a/package/lttng-tools/0001-configure.ac-add-disable-tests.patch b/package/lttng-tools/0001-configure.ac-add-disable-tests.patch
index 4bc9239c3d..bdf621b4ec 100644
--- a/package/lttng-tools/0001-configure.ac-add-disable-tests.patch
+++ b/package/lttng-tools/0001-configure.ac-add-disable-tests.patch
@@ -5,8 +5,9 @@ Subject: [PATCH] configure.ac: add --disable-tests
 
 Allow the user to explicitly disable tests
 
+Upstream: https://github.com/lttng/lttng-tools/pull/162 (rejected)
+
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/lttng/lttng-tools/pull/162]
 ---
  configure.ac | 3 +++
  1 file changed, 3 insertions(+)
diff --git a/package/lttng-tools/0002-Fix-eventfd.cpp-Remove-the-scope-resolution-operator.patch b/package/lttng-tools/0002-Fix-eventfd.cpp-Remove-the-scope-resolution-operator.patch
deleted file mode 100644
index d4b46d3a5a..0000000000
--- a/package/lttng-tools/0002-Fix-eventfd.cpp-Remove-the-scope-resolution-operator.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From d94d2b90c5148c4d83f1424b6e984044f2d8191f Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Thu, 24 Jul 2025 14:35:51 +0800
-Subject: [PATCH] Fix: eventfd.cpp: Remove the scope resolution operator
-MIME-Version: 1.0
-Content-Type: text/plain; charset=utf8
-Content-Transfer-Encoding: 8bit
-
-Remove the scope resolution operator :: to fix the below build failure
-with musl.
- | ../../../sources/lttng-tools-2.14.0/src/common/eventfd.cpp:18:31: error: expected id-expression before numeric constant
- |    18 |                 int flags = ::EFD_CLOEXEC;
- |       |                               ^~~~~~~~~~~
- | ../../../sources/lttng-tools-2.14.0/src/common/eventfd.cpp:21:36: error: expected id-expression before numeric constant
- |    21 |                         flags |= ::EFD_SEMAPHORE;
- |       |                                    ^~~~~~~~~~~~~
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
-Signed-off-by: JÃ©rÃ©mie Galarneau <jeremie.galarneau@efficios.com>
-Change-Id: I405f6f15a25f7e6b7f0676093091a9e8a384739d
-
-Upstream: https://git.lttng.org/?p=lttng-tools.git;a=commitdiff;h=d94d2b90c5148c4d83f1424b6e984044f2d8191f
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/common/eventfd.cpp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/common/eventfd.cpp b/src/common/eventfd.cpp
-index d331bbe40..447520f25 100644
---- a/src/common/eventfd.cpp
-+++ b/src/common/eventfd.cpp
-@@ -15,10 +15,10 @@
- 
- lttng::eventfd::eventfd(bool use_semaphore_semantics, std::uint64_t initial_value) :
- 	file_descriptor([use_semaphore_semantics, initial_value]() {
--		int flags = ::EFD_CLOEXEC;
-+		int flags = EFD_CLOEXEC;
- 
- 		if (use_semaphore_semantics) {
--			flags |= ::EFD_SEMAPHORE;
-+			flags |= EFD_SEMAPHORE;
- 		}
- 
- 		const auto raw_fd = ::eventfd(initial_value, flags);
--- 
-2.47.3
-
diff --git a/package/lttng-tools/0002-Fix-sessiond-channel-memory-types.hpp-fails-to-build.patch b/package/lttng-tools/0002-Fix-sessiond-channel-memory-types.hpp-fails-to-build.patch
new file mode 100644
index 0000000000..87df781a61
--- /dev/null
+++ b/package/lttng-tools/0002-Fix-sessiond-channel-memory-types.hpp-fails-to-build.patch
@@ -0,0 +1,55 @@
+From e989cad2af408d93c386818cc87316b702f336b3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=A9r=C3=A9mie=20Galarneau?=
+ <jeremie.galarneau@efficios.com>
+Date: Fri, 28 Aug 2026 21:32:40 +0000
+Subject: [PATCH] Fix: sessiond: channel-memory-types.hpp fails to build with
+ musl
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+OBSERVED ISSUE
+━━━━━━━━━━━━━━
+Building 2.16.0 against musl (on Yocto) fails with:
+
+  channel-memory-types.hpp:31:59: error: 'uid_t' has not been
+  declared; did you mean 'pid_t'?
+
+CAUSE
+━━━━━
+The header uses pid_t and uid_t without including <sys/types.h>.
+With glibc, those types leak in through the other included headers.
+musl's headers are seemingly stricter and don't declare them
+transitively.
+
+SOLUTION
+━━━━━━━━
+Include <sys/types.h>.
+
+Reported-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Fixes: #1445
+Change-Id: I291522a2110d7d927f062ab0131c35ed9e793ba5
+Signed-off-by: Jérémie Galarneau <jeremie.galarneau@efficios.com>
+
+Upstream: https://github.com/lttng/lttng-tools/commit/e989cad2af408d93c386818cc87316b702f336b3
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/bin/lttng-sessiond/channel-memory-types.hpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/bin/lttng-sessiond/channel-memory-types.hpp b/src/bin/lttng-sessiond/channel-memory-types.hpp
+index 554691201..2b5fcc962 100644
+--- a/src/bin/lttng-sessiond/channel-memory-types.hpp
++++ b/src/bin/lttng-sessiond/channel-memory-types.hpp
+@@ -16,6 +16,7 @@
+ #include <chrono>
+ #include <cstdint>
+ #include <functional>
++#include <sys/types.h>
+ #include <vector>
+ 
+ namespace lttng {
+-- 
+2.47.3
+
diff --git a/package/lttng-tools/lttng-tools.hash b/package/lttng-tools/lttng-tools.hash
index a181cd6dc0..f49c47a270 100644
--- a/package/lttng-tools/lttng-tools.hash
+++ b/package/lttng-tools/lttng-tools.hash
@@ -1,10 +1,10 @@
-# From https://lttng.org/files/lttng-tools/lttng-tools-2.14.0.tar.bz2.sha256
-sha256  d8c39c26cec13b7bd82551cd52a22efc358b888e36ebcf9c1b60ef1c3a3c2fd3  lttng-tools-2.14.0.tar.bz2
+# From https://lttng.org/files/lttng-tools/lttng-tools-2.16.0.tar.bz2.sha256
+sha256  b8b3244894e49e773d4942b8899f768057974edf75c18dbb48b65bb123c7b2c7  lttng-tools-2.16.0.tar.bz2
 
 # Locally computed
-sha256  068e55c7dbe597400199aee75ac5e71bdb2ca88c4c9a4cfa8e1fbc61f933eda5  LICENSE
-sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  LICENSES/BSD-2-Clause
-sha256  7a83b1aeb460458db9a4bd521d7f237c45b1650f6e60ea5ffc71e49472454de3  LICENSES/BSD-3-Clause
-sha256  6841c85b94f9dab319356e3aaf9e969fcedad51d3aaadf665bf86f34f4186b62  LICENSES/GPL-2.0
-sha256  d72921266bc8452a8789f8a04a82755373990d00b7e0b0f1a8edb8f854e94d1c  LICENSES/LGPL-2.1
-sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  LICENSES/MIT
+sha256  7fdd1784ff7fd28680ec50aa0f198791aaf694dfbce1062021f459ee329001d7  LICENSE
+sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  LICENSES/BSD-2-Clause.txt
+sha256  7a83b1aeb460458db9a4bd521d7f237c45b1650f6e60ea5ffc71e49472454de3  LICENSES/BSD-3-Clause.txt
+sha256  aaf135472f81c5b4a0dca9367e5bb5e9750032b5bebe5442b36e4c0a47430df3  LICENSES/GPL-2.0-only.txt
+sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  LICENSES/LGPL-2.1-only.txt
+sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  LICENSES/MIT.txt
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index 9a66ede669..6f6cdedb43 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -4,12 +4,18 @@
 #
 ################################################################################
 
-LTTNG_TOOLS_VERSION = 2.14.0
+LTTNG_TOOLS_VERSION = 2.16.0
 LTTNG_TOOLS_SITE = https://lttng.org/files/lttng-tools
 LTTNG_TOOLS_SOURCE = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 LTTNG_TOOLS_INSTALL_STAGING = YES
 LTTNG_TOOLS_LICENSE = GPL-2.0, LGPL-2.1 (include/lttng/*, src/lib/lttng-ctl/*)
-LTTNG_TOOLS_LICENSE_FILES = LICENSE $(addprefix LICENSES/,BSD-2-Clause BSD-3-Clause GPL-2.0 LGPL-2.1 MIT)
+LTTNG_TOOLS_LICENSE_FILES = \
+	LICENSE \
+	LICENSES/BSD-2-Clause.txt \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/LGPL-2.1-only.txt \
+	LICENSES/MIT.txt
 LTTNG_TOOLS_DEPENDENCIES = liburcu libxml2 popt util-linux
 # We're patching configure.ac
 LTTNG_TOOLS_AUTORECONF = YES

--===============5260332666554308764==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5260332666554308764==--
