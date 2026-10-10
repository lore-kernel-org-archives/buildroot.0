Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF43CA6004
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 05:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8355B40902;
	Sat, 10 Oct 2026 05:35:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IC_4SrKTHEgV; Sat, 10 Oct 2026 05:35:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 376E640920
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791610540;
	b=LJY6QZFnXCBUkegULkGaBgNDqXoQYZcTspXoAxf580CADSwM9nWpGoLRAqgDwR1M4gQ9
	 mZQrGwbZkE2OXjTRkv3HLWHUpzgo9qsEM9xZzWbkWN5GBFVm9l+o8WAPMIth0MBai6GB4
	 lG519pMa4qX/RyHI30wYuvxavlChSrR4NVWctY+OA0kD+zQ/UWG6tVHxz9PZ4vqlYye26
	 V3HiTaIwPMHO2v9wOKFwkqozmo7zrTUBuqC4+zOCIwfw9+vocesM0wayy+fHRHAqEfdEz
	 rAg2q0mXjKjThDxejcIRXgrV+dj62H38ctfOdM0nuopCR0mpxgxUyQRLXlgE5171//A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791610540;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=BPWo+rHFSE/xqd///xRJENS3hbR1m4U8ghzEDJNEtP4=;
	b=iV3q0wC3LVvG1zbeeD/jNVdWW/Oy3DDdZw7nOfzd5YGuy3kpKaLPPby+6x4/kYOD6PiL
	 k3+I99p6Z2tBGbq3NdjVvIIjzPJi0aIr1uU1aBcqUoifACM0OoS3+B+n6YAq+vbcRgDRH
	 HalOoRoBJ98M0v8Ytx19SYJboRcIrKrtvY4VQ+FeV8Um7GM/htBC/+ykusqjExQvWjkE+
	 759azFT3vxeJBcKk6FShW6Z6QJwfpavuP+iVv7KxEsFipki5Q5yDP2GBdErZihsiw88Mj
	 ut7T+7XQXs5J5HUQOfbkk1a9d5TKaIhRqrHK2J2e822sZYLKJ8fAvTYOFj0EI4RaIqA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791610540;
	bh=BPWo+rHFSE/xqd///xRJENS3hbR1m4U8ghzEDJNEtP4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JNaRjdbWqzf4DsVdibTs/+jv31MbECBbF5bTuJ8lDCpeT8B3Ayuj3l8aqQVfz5VoQ
	 q6VCJ+aNSni734AIwSzurwkmxCAn/8gnxz3lUYlRiG62E1N95YNLl1iQj6sc0yT6qO
	 pb0T6R6NaTVWu8svCy1NFGnJ9ZznHmMRN57iOyi6C7UP/3c1c4idXA8JzzeV4GvBO5
	 ftPoTqfvhXu3LhCTfogWlQZGhV4+fbQd6yiN3j3uTgmV9UHDW/IYlosG96ydHhGr+s
	 TbtlwnMz7O54uq1rV6vMCBW771E6gcW27YpDyinDuMdCS7S0IEIanmMWpKhSYRYe5d
	 rzHTXbvWrXX1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 376E640920;
	Sat, 10 Oct 2026 05:35:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 05207380
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 05:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EAC0F60672
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 05:35:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hmfvdqpgqivt for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 05:35:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8BFD86061E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791610532;
 b=W7CwHh0PxssDa2i2FgpQTZJwMma7cYDLdZyJAasgITE7oLcRIoncwB2Ml9rQNdBOhfzn
 Qq1psAz0/cjon0Uyu8eY5Occm1ov0D8u0LWjZgE8lyS7b5gZ/TAV9GYhZjwv5ZuMyarpR
 o6+Oth4DDAQOJIVYNlZ0GgR41V6PCr8K5JmMMg7y+JTOtejPKSRMSLYD5/eCw2eDKeiHJ
 pgq5UuYABfIUjGAVaBHVlZb9TCbEAtXm5adnIMBFc2B/3A9UQKu85X28Wj9E+pz0ZK3b/
 T8cFg3gPatViKAH7kaRz/872UziqzqgEkfOVCHRZ7ehidHrsTf/z1FmhQdRLxMSihpQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791610532;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=s+p4oSKI18XuJXllL28xlUwlAK7rnvTBQPRBZiCEyRc=;
 b=NxxUKYM6R9nfDPg274qnQL2wrKmaKmDUvV7x1oDwIAC9jjee4QOiNgmpJUoUtHN7PhH/
 sTTDosdEjcIqY3VE56lrTeX68SPyHXg/EW0wx6imKCo0nasFA2Wn15rEu9rySKcVk9Yx2
 iihiJsief3FYDFOl0qem3AgeWzMPYg3LCEoQd5GZG9I18iNHPxrR6J3V5cyqzVk2afDSk
 L42TltueAEQzXyySsvB8zsQzg4EtSV6bPihIsA98Z98zCBHTqsh/MtMVINwJgON1gKb2W
 XlKj/WQdYhAo3Ngq/ukJFgTz7cuZR1bL9p3kFvVsuHPTtkWYw/ZueScHgtdintRQzLg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BFD86061E
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 05:35:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F9C98C5E8; Sat, 10 Oct 2026 05:34:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 07:33:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 161391871082c9d363d7a4ff25d68b8f6fda9807
X-Git-Newrev: e7a95699a72f72ff76b9f017c0daafa1913c3422
X-Patchwork-Hint: ignore
Message-Id: <20261010053414.6F9C98C5E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/igt-gpu-tools: bump version to 2.6
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
Content-Type: multipart/mixed; boundary="===============3932424864439307133=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3932424864439307133==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e7a95699a72f72ff76b9f017c0daafa1913c3422
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.x.org/archives/xorg-announce/2026-September/003745.html

Removed patches which are included in this release.

Added patch 0001 to fix musl build error which would be introduced by
this bump:
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/d4fa11371a9bb8a0bc73aa205033ea13143d843c

Musl build error was reported upstream:
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/work_items/211

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...01-lib-igt_platform_filter-Fix-musl-build.patch | 83 ++++++++++++++++++++++
 ..._gpu_frequency-include-limits.h-to-fix-mu.patch | 36 ----------
 ...-xe_madvise-Fix-the-type-for-sighandler_t.patch | 46 ------------
 package/igt-gpu-tools/igt-gpu-tools.hash           |  6 +-
 package/igt-gpu-tools/igt-gpu-tools.mk             |  2 +-
 5 files changed, 87 insertions(+), 86 deletions(-)

diff --git a/package/igt-gpu-tools/0001-lib-igt_platform_filter-Fix-musl-build.patch b/package/igt-gpu-tools/0001-lib-igt_platform_filter-Fix-musl-build.patch
new file mode 100644
index 0000000000..2184349648
--- /dev/null
+++ b/package/igt-gpu-tools/0001-lib-igt_platform_filter-Fix-musl-build.patch
@@ -0,0 +1,83 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
+Date: Thu, 8 Oct 2026 13:14:35 +0200
+Subject: [PATCH] lib/igt_platform_filter: Fix musl build
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When using musl C libs, stdout/stderr are read-only vars and
+compilation reports errors, for example:
+
+../lib/igt_platform_filter.c: In function ‘igt_platform_filter_dump_to_file’:
+../lib/igt_platform_filter.c:551:16: error: assignment of read-only variable ‘stdout’
+  551 |         stdout = f;
+
+Also man stdout points out:
+Since the symbols stdin, stdout, and stderr are specified to be
+macros, assigning to them is nonportable.
+
+As this function do not have any user, just remove it.
+
+Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
+Cc: Jesse Zhang <jesse.zhang@amd.com>
+Reported-by: Bernd Kuhls <bernd@kuhls.net>
+Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/work_items/211
+Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
+Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
+Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
+
+Upstream: https://patchwork.freedesktop.org/patch/758622/?series=175702&rev=2
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/igt_platform_filter.c | 33 ---------------------------------
+ 1 file changed, 33 deletions(-)
+
+diff --git a/lib/igt_platform_filter.c b/lib/igt_platform_filter.c
+index 15b4e9690..9ccc0eadc 100644
+--- a/lib/igt_platform_filter.c
++++ b/lib/igt_platform_filter.c
+@@ -527,39 +527,6 @@ void igt_platform_filter_dump(void)
+ 	igt_info("═══════════════════════════════════════════════════════════════════\n\n");
+ }
+ 
+-/**
+- * igt_platform_filter_dump_to_file:
+- * @filename: Path to output file
+- *
+- * Dump platform filtering configuration to a file.
+- *
+- * Returns: 0 on success, -1 on error
+- */
+-int igt_platform_filter_dump_to_file(const char *filename)
+-{
+-	FILE *old_stdout;
+-	FILE *f;
+-
+-	f = fopen(filename, "w");
+-	if (!f) {
+-		igt_warn("Failed to open %s for writing\n", filename);
+-		return -1;
+-	}
+-
+-	/* Redirect stdout to file */
+-	old_stdout = stdout;
+-	stdout = f;
+-
+-	igt_platform_filter_dump();
+-
+-	/* Restore stdout */
+-	stdout = old_stdout;
+-	fclose(f);
+-
+-	igt_info("Platform filter configuration dumped to: %s\n", filename);
+-	return 0;
+-}
+-
+ /**
+  * igt_platform_filter_is_initialized:
+  *
+-- 
+2.47.3
+
diff --git a/package/igt-gpu-tools/0001-tools-intel_gpu_frequency-include-limits.h-to-fix-mu.patch b/package/igt-gpu-tools/0001-tools-intel_gpu_frequency-include-limits.h-to-fix-mu.patch
deleted file mode 100644
index 1d818dcc22..0000000000
--- a/package/igt-gpu-tools/0001-tools-intel_gpu_frequency-include-limits.h-to-fix-mu.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 48a177958a9ecff8f7cee379affb2f35984b58a9 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Fri, 10 Jul 2026 20:34:01 +0200
-Subject: [PATCH] tools/intel_gpu_frequency: include limits.h to fix musl build
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes build error seen with musl-based toolchains:
-
-../tools/intel_gpu_frequency.c:90:19: error:
- ‘PATH_MAX’ undeclared (first use in this function)
-   90 |         char path[PATH_MAX];
-
-Upstream: https://patchwork.freedesktop.org/patch/739159/?series=170207&rev=1
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- tools/intel_gpu_frequency.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tools/intel_gpu_frequency.c b/tools/intel_gpu_frequency.c
-index 6316c2e58..7df7f331d 100644
---- a/tools/intel_gpu_frequency.c
-+++ b/tools/intel_gpu_frequency.c
-@@ -25,6 +25,7 @@
- #include <dirent.h>
- #include <fcntl.h>
- #include <getopt.h>
-+#include <limits.h>
- #include <stdio.h>
- #include <time.h>
- #include <unistd.h>
--- 
-2.47.3
-
diff --git a/package/igt-gpu-tools/0002-tests-intel-xe_madvise-Fix-the-type-for-sighandler_t.patch b/package/igt-gpu-tools/0002-tests-intel-xe_madvise-Fix-the-type-for-sighandler_t.patch
deleted file mode 100644
index 7ee34b1fc8..0000000000
--- a/package/igt-gpu-tools/0002-tests-intel-xe_madvise-Fix-the-type-for-sighandler_t.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From e807c4cd97c3e9bbbd89026cf9ed0b16b02ef397 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Fri, 10 Jul 2026 20:35:22 +0200
-Subject: [PATCH] tests/intel/xe_madvise: Fix the type for sighandler_t
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-__sighandler_t is private interface in glibc so its
-better to not use it, as an aside fixes build with musl
-
-Patch was inspired by
-https://lists.gnu.org/r/bug-time/2025-03/msg00000.html
-
-Fixes build error seen with musl-based toolchains:
-
-../tests/intel/xe_madvise.c: In function ‘test_dontneed_after_mmap’:
-../tests/intel/xe_madvise.c:400:48: error: ‘__sighandler_t’ undeclared
- (first use in this function); did you mean ‘sighandler_t’?
-  400 |          old_sigsegv = signal(SIGSEGV, (__sighandler_t)sigtrap);
-
-Upstream: https://patchwork.freedesktop.org/patch/739160/?series=170207&rev=1
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- tests/intel/xe_madvise.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
-index 3d36be941..a33a08630 100644
---- a/tests/intel/xe_madvise.c
-+++ b/tests/intel/xe_madvise.c
-@@ -397,8 +397,8 @@ static void test_dontneed_after_mmap(int fd)
- 		char *ptr = (char *)map;
- 		int sig;
- 
--		old_sigsegv = signal(SIGSEGV, (__sighandler_t)sigtrap);
--		old_sigbus = signal(SIGBUS, (__sighandler_t)sigtrap);
-+		old_sigsegv = signal(SIGSEGV, (sighandler_t)sigtrap);
-+		old_sigbus = signal(SIGBUS, (sighandler_t)sigtrap);
- 
- 		sig = sigsetjmp(jmp, 1); /* savemask=1: save/restore signal mask */
- 		switch (sig) {
--- 
-2.47.3
-
diff --git a/package/igt-gpu-tools/igt-gpu-tools.hash b/package/igt-gpu-tools/igt-gpu-tools.hash
index f0c6ceff2f..3759846675 100644
--- a/package/igt-gpu-tools/igt-gpu-tools.hash
+++ b/package/igt-gpu-tools/igt-gpu-tools.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2026-June/003710.html
-sha256  bf5ee5cc1e2b92c456d626b7986be9e2d18b4765cd06c28c1ab449200c1ce5e2  igt-gpu-tools-2.5.tar.xz
-sha512  0da8f56a76bb79186da95545be63b8fa82c93edfe9b5fe6ffe43017deb792601545bba292c516b525e1e29087e9b048751df4875d8a7a64e265bac943bf6be81  igt-gpu-tools-2.5.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2026-September/003745.html
+sha256  5d5190debfec0ee1728430897f243d0afa271856c2cb5834a23b23f08be8d06e  igt-gpu-tools-2.6.tar.xz
+sha512  7b06f2aa9c1e4cc87092625d9b8eae946dcb7ac4b0a77534d4f49a880a071fba85fdb9e519e6a9d3cedeeb5181c8d6051a9a3ecd27c7b667d389008752102fe2  igt-gpu-tools-2.6.tar.xz
 
 # Hash for license file:
 sha256  1b7e266857b05808660f42369a4a797459d7b7bec7245e378aa28a8db2f213da  COPYING
diff --git a/package/igt-gpu-tools/igt-gpu-tools.mk b/package/igt-gpu-tools/igt-gpu-tools.mk
index cbbbc74a4c..ec956449d1 100644
--- a/package/igt-gpu-tools/igt-gpu-tools.mk
+++ b/package/igt-gpu-tools/igt-gpu-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IGT_GPU_TOOLS_VERSION = 2.5
+IGT_GPU_TOOLS_VERSION = 2.6
 IGT_GPU_TOOLS_SOURCE = igt-gpu-tools-$(IGT_GPU_TOOLS_VERSION).tar.xz
 IGT_GPU_TOOLS_SITE = https://www.x.org/releases/individual/app
 IGT_GPU_TOOLS_LICENSE = MIT

--===============3932424864439307133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3932424864439307133==--
