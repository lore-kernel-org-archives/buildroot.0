Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73710C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:33:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42C7D600D0
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 42C7D600D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18C1560784;
	Sat,  4 Sep 2021 18:33:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pvA-E-CSdk3T; Sat,  4 Sep 2021 18:33:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F06D6077D;
	Sat,  4 Sep 2021 18:33:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF7801BF95A
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45510400E5
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XP5gOXwbe6lz for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 18:25:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7140C401E3
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 18:25:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3A05B8834A; Sat,  4 Sep 2021 18:23:53 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 22:10:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 838bc2c0fb37a3fb9b6137694413961b49b24e67
X-Git-Newrev: 60f7c478e4682eb6d562b1f38fbfa44ce4b37675
X-Patchwork-Hint: ignore
Message-Id: <20210904182353.3A05B8834A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcap: fix build failure due to
 unessesary patch
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=60f7c478e4682eb6d562b1f38fbfa44ce4b37675
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure which is raised since bump
to version 2.52 in commit 38b0759432070f7a57c0fab84d44a07caead6f06

	Applying 0001-Permit-compilation-with-std-c89.patch using patch:
	patching file Makefile
	Reversed (or previously applied) patch detected!  Skipping patch.
	1 out of 1 hunk ignored -- saving rejects to file Makefile.rej
	patching file libcap/cap_test.c
	Reversed (or previously applied) patch detected!  Skipping patch.
	1 out of 1 hunk ignored -- saving rejects to file libcap/cap_test.c.rej
	patching file psx/psx.c
	Reversed (or previously applied) patch detected!  Skipping patch.
	1 out of 1 hunk ignored -- saving rejects to file psx/psx.c.rej
	patching file tests/exploit.c
	Reversed (or previously applied) patch detected!  Skipping patch.
	2 out of 2 hunks ignored -- saving rejects to file tests/exploit.c.rej
	patching file tests/libcap_launch_test.c
	Reversed (or previously applied) patch detected!  Skipping patch.
	1 out of 1 hunk ignored -- saving rejects to file tests/libcap_launch_test.c.rej
	patching file tests/uns_test.c
	Reversed (or previously applied) patch detected!  Skipping patch.
	1 out of 1 hunk ignored -- saving rejects to file tests/uns_test.c.rej

Problem is because patch was integrated into package repo

Fixes:
http://autobuild.buildroot.net/results/2f619b233e2cfb4d7eeb3cc178c849c74d11f2ca/
Signed-off-by: Illia Bitkov <illia.bitkov@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-Permit-compilation-with-std-c89.patch     | 123 ---------------------
 1 file changed, 123 deletions(-)

diff --git a/package/libcap/0001-Permit-compilation-with-std-c89.patch b/package/libcap/0001-Permit-compilation-with-std-c89.patch
deleted file mode 100644
index 0219f09f52..0000000000
--- a/package/libcap/0001-Permit-compilation-with-std-c89.patch
+++ /dev/null
@@ -1,123 +0,0 @@
-From 06ec53d0c9fcddcc071a0e07731e6c83238400e6 Mon Sep 17 00:00:00 2001
-From: "Andrew G. Morgan" <morgan@kernel.org>
-Date: Mon, 21 Jun 2021 17:46:43 -0700
-Subject: Permit compilation with -std=c89.
-
-Tested with
-
-  make COPTS="-O2 -std=c89" clean all test sudotest
-
-This addresses the issue reported by Byron Stanoszek:
-
-  https://bugzilla.kernel.org/show_bug.cgi?id=213541
-
-Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
-
-[Retrieved from:
-https://git.kernel.org/pub/scm/linux/kernel/git/morgan/libcap.git/commit/?id=06ec53d0c9fcddcc071a0e07731e6c83238400e6]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- Makefile                   | 1 +
- libcap/cap_test.c          | 1 +
- psx/psx.c                  | 2 +-
- tests/exploit.c            | 9 +++++++--
- tests/libcap_launch_test.c | 6 +++---
- tests/uns_test.c           | 3 ++-
- 6 files changed, 15 insertions(+), 7 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 9666bf0..984d502 100644
---- a/Makefile
-+++ b/Makefile
-@@ -68,6 +68,7 @@ endif
- distcheck:
- 	./distcheck.sh
- 	$(MAKE) DYNAMIC=yes clean all test sudotest
-+	$(MAKE) DYNAMIC=no COPTS="-O2 -std=c89" clean all test sudotest
- 	$(MAKE) PAM_CAP=no CC=/usr/local/musl/bin/musl-gcc clean all test sudotest
- 	$(MAKE) clean all test sudotest
- 	$(MAKE) distclean
-diff --git a/libcap/cap_test.c b/libcap/cap_test.c
-index c9e83de..a717217 100644
---- a/libcap/cap_test.c
-+++ b/libcap/cap_test.c
-@@ -79,4 +79,5 @@ int main(int argc, char **argv) {
- 	exit(1);
-     }
-     printf("cap_test PASS\n");
-+    exit(0);
- }
-diff --git a/psx/psx.c b/psx/psx.c
-index 12dbbc5..90dcc50 100644
---- a/psx/psx.c
-+++ b/psx/psx.c
-@@ -229,7 +229,7 @@ static void psx_syscall_start(void) {
-     psx_tracker.psx_sig = SIGSYS;
- 
-     psx_confirm_sigaction();
--    psx_do_registration(); // register the main thread.
-+    psx_do_registration(); /* register the main thread. */
- 
-     psx_tracker.initialized = 1;
- }
-diff --git a/tests/exploit.c b/tests/exploit.c
-index 28bac88..814337c 100644
---- a/tests/exploit.c
-+++ b/tests/exploit.c
-@@ -16,6 +16,10 @@
-  * to execute arbitrary code. As such, if all but one thread drops
-  * privilege, privilege escalation is somewhat trivial.
-  */
-+
-+/* as per "man sigaction" */
-+#define _POSIX_C_SOURCE 200809L
-+
- #include <pthread.h>
- #include <signal.h>
- #include <stdio.h>
-@@ -148,7 +152,8 @@ int main(int argc, char **argv) {
-     if (greatest_len != 1) {
- 	printf("exploit succeeded\n");
- 	exit(1);
--    } else {
--	printf("exploit failed\n");
-     }
-+
-+    printf("exploit failed\n");
-+    exit(0);
- }
-diff --git a/tests/libcap_launch_test.c b/tests/libcap_launch_test.c
-index 6cbfc43..5286979 100644
---- a/tests/libcap_launch_test.c
-+++ b/tests/libcap_launch_test.c
-@@ -199,10 +199,10 @@ int main(int argc, char **argv) {
-     cap_free(final);
-     cap_free(orig);
- 
--    if (success) {
--	printf("cap_launch_test: PASSED\n");
--    } else {
-+    if (!success) {
- 	printf("cap_launch_test: FAILED\n");
- 	exit(1);
-     }
-+    printf("cap_launch_test: PASSED\n");
-+    exit(0);
- }
-diff --git a/tests/uns_test.c b/tests/uns_test.c
-index 41aa0a6..d8f5415 100644
---- a/tests/uns_test.c
-+++ b/tests/uns_test.c
-@@ -115,7 +115,8 @@ int main(int argc, char **argv)
-     }
-     close(fds.from[0]);
- 
--    for (int i=0; i<2; i++) {
-+    int i;
-+    for (i=0; i<2; i++) {
- 	char *map_file;
- 	if (asprintf(&map_file, file_formats[i], pid) < 0) {
- 	    perror("allocate string");
--- 
-cgit 1.2.3-1.el7
-
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
