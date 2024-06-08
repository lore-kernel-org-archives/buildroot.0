Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D422C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 19:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48B1280FA6;
	Sat,  8 Jun 2024 19:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cfRgOw9a4zpC; Sat,  8 Jun 2024 19:18:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1DCB84D5D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1DCB84D5D;
	Sat,  8 Jun 2024 19:18:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 96EE81BF407
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2AC9416AD
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tSuqMwwxpRhI for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 19:15:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB1F641790
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB1F641790
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 19:15:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D671A7FC58; Sat,  8 Jun 2024 19:15:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 21:07:24 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 73075706e9769e8db238258c8a1b756e179930d3
X-Git-Newrev: 1b93db30fa48135d892b8c3bdb381ba1b688b287
X-Patchwork-Hint: ignore
Message-Id: <20240608191502.D671A7FC58@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libffi: fix host
 build failure
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
Content-Type: multipart/mixed; boundary="===============7976231163500471502=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7976231163500471502==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1b93db30fa48135d892b8c3bdb381ba1b688b287
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Host build fails on updated Arch Linux desktop.

My current /usr/bin/gcc version is 14.1.1 20240522, where
implicit-function-declaration cause build to fail:

2024-06-05T07:03:20 libtool: compile:  /home/roy/hymatek/connexi-touchpanel-firmware/mxxf1/output/host/bin/ccache /usr/bin/gcc -DHAVE_CONFIG_H -I. -I.. -I. -I../include -Iinclude -I../src -I/home/roy/hymatek/connexi-touchpanel-firmware/mxxf1/output/host/include -Wall -O2 -I/home/roy/hymatek/connexi-touchpanel-firmware/mxxf1/output/host/include -fexceptions -c ../src/tramp.c  -fPIC -DPIC -o src/.libs/tramp.o
2024-06-05T07:03:20 ../src/tramp.c: In function ‘ffi_tramp_get_temp_file’:
2024-06-05T07:03:20 ../src/tramp.c:262:22: error: implicit declaration of function ‘open_temp_exec_file’ [-Wimplicit-function-declaration]
2024-06-05T07:03:20 262 |   tramp_globals.fd = open_temp_exec_file ();
2024-06-05T07:03:20 |                      ^~~~~~~~~~~~~~~~~~~

Patch from master was added to fix build.

Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...4-Forward-declare-open_temp_exec_file-764.patch | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/package/libffi/0004-Forward-declare-open_temp_exec_file-764.patch b/package/libffi/0004-Forward-declare-open_temp_exec_file-764.patch
new file mode 100644
index 0000000000..341a2e4e43
--- /dev/null
+++ b/package/libffi/0004-Forward-declare-open_temp_exec_file-764.patch
@@ -0,0 +1,49 @@
+From ce077e5565366171aa1b4438749b0922fce887a4 Mon Sep 17 00:00:00 2001
+From: serge-sans-paille <serge.guelton@telecom-bretagne.eu>
+Date: Thu, 2 Feb 2023 14:46:29 +0000
+Subject: [PATCH] Forward declare open_temp_exec_file (#764)
+
+It's defined in closures.c and used in tramp.c.
+Also declare it as an hidden symbol, as it should be.
+
+Co-authored-by: serge-sans-paille <sguelton@mozilla.com>
+Upstream: https://github.com/libffi/libffi/pull/764
+Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
+---
+ include/ffi_common.h | 4 ++++
+ src/tramp.c          | 4 ++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/include/ffi_common.h b/include/ffi_common.h
+index 2bd31b0..c53a794 100644
+--- a/include/ffi_common.h
++++ b/include/ffi_common.h
+@@ -128,6 +128,10 @@ void *ffi_data_to_code_pointer (void *data) FFI_HIDDEN;
+    static trampoline. */
+ int ffi_tramp_is_present (void *closure) FFI_HIDDEN;
+ 
++/* Return a file descriptor of a temporary zero-sized file in a
++   writable and executable filesystem. */
++int open_temp_exec_file(void) FFI_HIDDEN;
++
+ /* Extended cif, used in callback from assembly routine */
+ typedef struct
+ {
+diff --git a/src/tramp.c b/src/tramp.c
+index 7e005b0..5f19b55 100644
+--- a/src/tramp.c
++++ b/src/tramp.c
+@@ -39,6 +39,10 @@
+ #ifdef __linux__
+ #define _GNU_SOURCE 1
+ #endif
++
++#include <ffi.h>
++#include <ffi_common.h>
++
+ #include <stdio.h>
+ #include <unistd.h>
+ #include <stdlib.h>
+-- 
+2.45.1
+

--===============7976231163500471502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7976231163500471502==--
