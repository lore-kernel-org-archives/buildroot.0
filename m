Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57542D2F32D
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2608E83F98;
	Tue, 13 Jan 2026 19:41:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MbbquAaDeRuo; Tue, 13 Jan 2026 19:41:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA93983F70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333301;
	bh=ueAgUfaQ/BpyhGCt6X8pWgfXRGItTlx7zrHTjZoGlb4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=h5ajIaIWoCLS7gS3uNz7VClzRJAGWgbK2IL4mghnHeOkVQ7B4wsE0A2IAWDdfO1r+
	 kqMR0sagH7/jlOQcIXMGjkbhY2Y8aintmJvpJRB3fc/wY7NyodmM1HEfO/lnoZfGU6
	 uGQqrnNG/3qLbZ7pQ1JXFf2UChedg0eYvMAIeAsZbWEksEbvbsamloeTkgkeCzq/LY
	 K/EzOJWYTqWMbsOXGa0qL38Lm/5gr4Mx+7PpnQufWnwwBY8Y50P8zhKCkjtUdq0EoW
	 FkX3gRBfZYrF2XZxQKog5TD/k2WFx6tb5p0JIGcGyFduiQuP9SK4orDm7Fpfkb73VZ
	 LQQdfxZqHvB3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA93983F70;
	Tue, 13 Jan 2026 19:41:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D95C231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4832782C8F
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N08Q4exYYBcK for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29DAB82CAC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29DAB82CAC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27BF981385; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:56:30 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 0475b9df92b16658b2d8bd1319ac05627765dc7e
X-Git-Newrev: e97f1cfe3573b221ddb26e8744da00c702e86206
X-Patchwork-Hint: ignore
Message-Id: <20260113194034.27BF981385@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/atf: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=e97f1cfe3573b221ddb26e8744da00c702e86206
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Buildroot commit d6c3257e931ed256e3ebcd78938f6146bba8586f bumped the
package from 0.21 to 0.23. Upstream release 0.22 includes commit
https://github.com/freebsd/atf/commit/d7c7c53c0626ab59a62aa4efcf05323b3621baa9
which uses CLOCK_MONOTONIC without including time.h.

Fixes:
https://autobuild.buildroot.net/results/41b/41b25ee8e66e34323eca011e4b5fe479ece9ed76/

Two minimal defconfigs to reproduce the build error:

BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
BR2_PTHREADS_NONE=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_ATF=y

BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
BR2_PTHREADS_NONE=y
BR2_GCC_VERSION_13_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_ATF=y

All defconfigs of the build errors recorded by the buildroot autobuilders
contain BR2_PTHREADS_NONE=y.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit cf383d3e13e7963eca8e1c3aefe2512e9b5ef81c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../atf/0001-atf-check.cpp-include-time.h.patch    | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/atf/0001-atf-check.cpp-include-time.h.patch b/package/atf/0001-atf-check.cpp-include-time.h.patch
new file mode 100644
index 0000000000..359172c0e6
--- /dev/null
+++ b/package/atf/0001-atf-check.cpp-include-time.h.patch
@@ -0,0 +1,33 @@
+From 67e7d350a15aff88c151b1fc838dac83d35be955 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 22 Nov 2025 23:47:41 +0100
+Subject: [PATCH] atf-check.cpp: include time.h
+
+Fixes build error with gcc 14 as reported by the buildroot autobuilders:
+https://autobuild.buildroot.net/results/41b/41b25ee8e66e34323eca011e4b5fe479ece9ed76/build-end.log
+
+atf-sh/atf-check.cpp: In function 'useconds_t get_monotonic_useconds()':
+atf-sh/atf-check.cpp:183:24: error: 'CLOCK_MONOTONIC' was not declared in this scope
+
+Upstream: https://github.com/freebsd/atf/commit/67e7d350a15aff88c151b1fc838dac83d35be955
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ atf-sh/atf-check.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/atf-sh/atf-check.cpp b/atf-sh/atf-check.cpp
+index 1354e3a..94da413 100644
+--- a/atf-sh/atf-check.cpp
++++ b/atf-sh/atf-check.cpp
+@@ -30,6 +30,7 @@ extern "C" {
+ #include <limits.h>
+ #include <signal.h>
+ #include <stdint.h>
++#include <time.h>
+ #include <unistd.h>
+ }
+ 
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
