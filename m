Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22256C4167B
	for <buildroot@archiver.kernel.org>; Fri,  1 Dec 2023 20:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C703340217;
	Fri,  1 Dec 2023 20:04:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C703340217
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1e1GJJJegg_R; Fri,  1 Dec 2023 20:04:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BD5C43784;
	Fri,  1 Dec 2023 20:04:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BD5C43784
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A1EAD1BF2C0
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 20:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79ACC43761
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 20:03:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79ACC43761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E9aezwhlTHqE for <buildroot@lists.busybox.net>;
 Fri,  1 Dec 2023 20:03:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF66341A01
 for <buildroot@buildroot.org>; Fri,  1 Dec 2023 20:03:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF66341A01
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D6F708770A; Fri,  1 Dec 2023 20:03:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 1 Dec 2023 20:59:56 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 7867302a726d559b2ca14fba9dbfa707c449e8f2
X-Git-Newrev: a17063e8ca72f69d119bcdd9c87067caf6a9dfdf
X-Patchwork-Hint: ignore
Message-Id: <20231201200348.D6F708770A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/erlang: disable
 for uclibc, fix glibc-build
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
Content-Type: multipart/mixed; boundary="===============0430500802572375870=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0430500802572375870==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a17063e8ca72f69d119bcdd9c87067caf6a9dfdf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Commit 2cfa86a54882(package/erlang: bump version to 26.0.2) added a
patch to restore building on uClibc.

However, that patch is not upstream, and has been rejected:

    https://github.com/erlang/otp/pull/7500

    Please open a PR to https://github.com/asmjit/asmjit instead and we
    will get the fix next time we sync with upstream. We do not want
    theirs and our implementation to diverge.

Furthermore, it happens to work on uClibc, because uClibc does not
expose sys/auxv.h, but it fails to work on glibc, because the define is
not propagated to "sub-trees", and thus is never defined where it is
checked for, even when sys/auxv.h is available. This causes build
failures such as:

    asmjit/core/cpuinfo.cpp: In function ‘void asmjit::_abi_1_10::detectHWCaps(CpuInfo&, long unsigned int, const LinuxHWCapMapping*, size_t)’:
    asmjit/core/cpuinfo.cpp:840:24: error: ‘getauxval’ was not declared in this scope
      840 |   unsigned long mask = getauxval(type);
          |                        ^~~~~~~~~
    asmjit/core/cpuinfo.cpp: In function ‘void asmjit::_abi_1_10::detectARMCpu(CpuInfo&)’:
    asmjit/core/cpuinfo.cpp:972:21: error: ‘AT_HWCAP’ was not declared in this scope
      972 |   detectHWCaps(cpu, AT_HWCAP, hwCapMapping, ASMJIT_ARRAY_SIZE(hwCapMapping));
          |                     ^~~~~~~~
    asmjit/core/cpuinfo.cpp:973:21: error: ‘AT_HWCAP2’ was not declared in this scope
      973 |   detectHWCaps(cpu, AT_HWCAP2, hwCapMapping2, ASMJIT_ARRAY_SIZE(hwCapMapping2));
          |                     ^~~~~~~~~

Yet, sys/auxv.h was detected at configure time:

    checking for sys/auxv.h... yes

This defconfig is enough to reproduce the error:

    BR2_aarch64=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
    BR2_PACKAGE_ERLANG=y

Since upstream refused the patch, and there is no fix that was submitted
to the actual upstream (asmjit), drop the rejectred patch, and disable
for uClibc: the patch is incorrect, and we can't fix a build issue on
uClibc by introducing another on glibc.

Fixes:
    http://autobuild.buildroot.org/results/fc1/fc19bad2263bdfacea594217d5ddfde0e27895b1/
    http://autobuild.buildroot.org/results/114/11416d81d5b27fc0627b335a971154c088d5754a/

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Bernd Kuhls <bernd@kuhls.net>
Cc: Maxim Kochetkov <fido_max@inbox.ru>

Changes v1 -> v2:
  - update comment when unavailable

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit fb72418160417e9e872f626c356f898bff49cf48)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../erlang/0001-erts-check-for-sys-auxv.h.patch    | 44 ----------------------
 package/erlang/Config.in                           |  5 ++-
 2 files changed, 3 insertions(+), 46 deletions(-)

diff --git a/package/erlang/0001-erts-check-for-sys-auxv.h.patch b/package/erlang/0001-erts-check-for-sys-auxv.h.patch
deleted file mode 100644
index af4b66d05d..0000000000
--- a/package/erlang/0001-erts-check-for-sys-auxv.h.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From ede1e17794c2caf091e810bdfa49040c75f513eb Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Sat, 15 Jul 2023 18:36:48 +0200
-Subject: [PATCH] erts: check for sys/auxv.h
-
-Upstream: https://github.com/erlang/otp/pull/7500
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- erts/configure.ac                     | 2 +-
- erts/emulator/asmjit/core/cpuinfo.cpp | 2 ++
- 2 files changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/erts/configure.ac b/erts/configure.ac
-index a63d391fb3..9d3e338633 100644
---- a/erts/configure.ac
-+++ b/erts/configure.ac
-@@ -1655,7 +1655,7 @@ AC_CHECK_HEADERS(fcntl.h limits.h unistd.h syslog.h dlfcn.h ieeefp.h \
-                  sys/socket.h sys/sockio.h sys/socketio.h \
-                  net/errno.h malloc.h arpa/nameser.h libdlpi.h \
- 		 pty.h util.h libutil.h utmp.h langinfo.h poll.h sdkddkver.h \
--                 elf.h)
-+                 elf.h sys/auxv.h)
- 
- AC_CHECK_MEMBERS([struct ifreq.ifr_hwaddr], [], [],
- 	[#ifdef __WIN32__
-diff --git a/erts/emulator/asmjit/core/cpuinfo.cpp b/erts/emulator/asmjit/core/cpuinfo.cpp
-index fb2acfc09b..d8b72697ab 100644
---- a/erts/emulator/asmjit/core/cpuinfo.cpp
-+++ b/erts/emulator/asmjit/core/cpuinfo.cpp
-@@ -15,8 +15,10 @@
- 
- // Required by `getauxval()` on Linux.
- #if defined(__linux__)
-+#if defined(HAVE_SYS_AUXV_H)
-   #include <sys/auxv.h>
- #endif
-+#endif
- 
- //! Required to detect CPU and features on Apple platforms.
- #if defined(__APPLE__)
--- 
-2.39.2
-
diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index d3fe0dbec1..724f91123b 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -15,11 +15,11 @@ config BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
 	# erlang needs host-erlang
 	depends on BR2_PACKAGE_HOST_ERLANG_ARCH_SUPPORTS
 
-comment "erlang needs a toolchain w/ dynamic library, threads, wchar"
+comment "erlang needs a glibc or musl toolchain w/ dynamic library, threads, wchar"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_USE_WCHAR
+		|| !BR2_USE_WCHAR || BR2_TOOLCHAIN_USES_UCLIBC
 
 config BR2_PACKAGE_ERLANG
 	bool "erlang"
@@ -27,6 +27,7 @@ config BR2_PACKAGE_ERLANG
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	depends on BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
 	select BR2_PACKAGE_ZLIB
 	help

--===============0430500802572375870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0430500802572375870==--
