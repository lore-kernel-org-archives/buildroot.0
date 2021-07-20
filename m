Return-Path: <SRS0=PVMq=MM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD0ECC07E95
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 21:44:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DC7F60E0C
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 21:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DC7F60E0C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BD68606D9;
	Tue, 20 Jul 2021 21:44:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5feSy1whGTCm; Tue, 20 Jul 2021 21:44:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9343C605C8;
	Tue, 20 Jul 2021 21:44:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 72B821BF9B2
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 21:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3B486069A
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 21:42:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6SYSkspUbeOL for <buildroot@lists.busybox.net>;
 Tue, 20 Jul 2021 21:42:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01827605C8
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 21:42:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9264C84110; Tue, 20 Jul 2021 21:08:39 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 23:41:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fbd9566220f2812baeff5dbd727bfc30fe4e93ea
X-Git-Newrev: 8b28ba976e4032684c0e30984d246fb12a25f238
X-Patchwork-Hint: ignore
Message-ID: <20210720210839.9264C84110@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcap: fix build with gcc 4.8
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>
Message-ID: <20210720214157.xaGyhzfLFrx-ST6xPgbEfL4K37tagakE8iYor0nBNL4@z>

commit: https://git.buildroot.net/buildroot/commit/?id=8b28ba976e4032684c0e30984d246fb12a25f238
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc 4.8 which is raised since bump
to version 2.51 in commit bef89e381d0d698053a026d6a8cb0ded260bd074:

uns_test.c: In function 'main':
uns_test.c:118:5: error: 'for' loop initial declarations are only allowed in C99 mode
     for (int i=0; i<2; i++) {
     ^

Fixes:
 - http://autobuild.buildroot.org/results/9e67bdd540bb7779a13e27c55114a561c12b289a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Permit-compilation-with-std-c89.patch     | 123 +++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/package/libcap/0001-Permit-compilation-with-std-c89.patch b/package/libcap/0001-Permit-compilation-with-std-c89.patch
new file mode 100644
index 0000000000..0219f09f52
--- /dev/null
+++ b/package/libcap/0001-Permit-compilation-with-std-c89.patch
@@ -0,0 +1,123 @@
+From 06ec53d0c9fcddcc071a0e07731e6c83238400e6 Mon Sep 17 00:00:00 2001
+From: "Andrew G. Morgan" <morgan@kernel.org>
+Date: Mon, 21 Jun 2021 17:46:43 -0700
+Subject: Permit compilation with -std=c89.
+
+Tested with
+
+  make COPTS="-O2 -std=c89" clean all test sudotest
+
+This addresses the issue reported by Byron Stanoszek:
+
+  https://bugzilla.kernel.org/show_bug.cgi?id=213541
+
+Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
+
+[Retrieved from:
+https://git.kernel.org/pub/scm/linux/kernel/git/morgan/libcap.git/commit/?id=06ec53d0c9fcddcc071a0e07731e6c83238400e6]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Makefile                   | 1 +
+ libcap/cap_test.c          | 1 +
+ psx/psx.c                  | 2 +-
+ tests/exploit.c            | 9 +++++++--
+ tests/libcap_launch_test.c | 6 +++---
+ tests/uns_test.c           | 3 ++-
+ 6 files changed, 15 insertions(+), 7 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 9666bf0..984d502 100644
+--- a/Makefile
++++ b/Makefile
+@@ -68,6 +68,7 @@ endif
+ distcheck:
+ 	./distcheck.sh
+ 	$(MAKE) DYNAMIC=yes clean all test sudotest
++	$(MAKE) DYNAMIC=no COPTS="-O2 -std=c89" clean all test sudotest
+ 	$(MAKE) PAM_CAP=no CC=/usr/local/musl/bin/musl-gcc clean all test sudotest
+ 	$(MAKE) clean all test sudotest
+ 	$(MAKE) distclean
+diff --git a/libcap/cap_test.c b/libcap/cap_test.c
+index c9e83de..a717217 100644
+--- a/libcap/cap_test.c
++++ b/libcap/cap_test.c
+@@ -79,4 +79,5 @@ int main(int argc, char **argv) {
+ 	exit(1);
+     }
+     printf("cap_test PASS\n");
++    exit(0);
+ }
+diff --git a/psx/psx.c b/psx/psx.c
+index 12dbbc5..90dcc50 100644
+--- a/psx/psx.c
++++ b/psx/psx.c
+@@ -229,7 +229,7 @@ static void psx_syscall_start(void) {
+     psx_tracker.psx_sig = SIGSYS;
+ 
+     psx_confirm_sigaction();
+-    psx_do_registration(); // register the main thread.
++    psx_do_registration(); /* register the main thread. */
+ 
+     psx_tracker.initialized = 1;
+ }
+diff --git a/tests/exploit.c b/tests/exploit.c
+index 28bac88..814337c 100644
+--- a/tests/exploit.c
++++ b/tests/exploit.c
+@@ -16,6 +16,10 @@
+  * to execute arbitrary code. As such, if all but one thread drops
+  * privilege, privilege escalation is somewhat trivial.
+  */
++
++/* as per "man sigaction" */
++#define _POSIX_C_SOURCE 200809L
++
+ #include <pthread.h>
+ #include <signal.h>
+ #include <stdio.h>
+@@ -148,7 +152,8 @@ int main(int argc, char **argv) {
+     if (greatest_len != 1) {
+ 	printf("exploit succeeded\n");
+ 	exit(1);
+-    } else {
+-	printf("exploit failed\n");
+     }
++
++    printf("exploit failed\n");
++    exit(0);
+ }
+diff --git a/tests/libcap_launch_test.c b/tests/libcap_launch_test.c
+index 6cbfc43..5286979 100644
+--- a/tests/libcap_launch_test.c
++++ b/tests/libcap_launch_test.c
+@@ -199,10 +199,10 @@ int main(int argc, char **argv) {
+     cap_free(final);
+     cap_free(orig);
+ 
+-    if (success) {
+-	printf("cap_launch_test: PASSED\n");
+-    } else {
++    if (!success) {
+ 	printf("cap_launch_test: FAILED\n");
+ 	exit(1);
+     }
++    printf("cap_launch_test: PASSED\n");
++    exit(0);
+ }
+diff --git a/tests/uns_test.c b/tests/uns_test.c
+index 41aa0a6..d8f5415 100644
+--- a/tests/uns_test.c
++++ b/tests/uns_test.c
+@@ -115,7 +115,8 @@ int main(int argc, char **argv)
+     }
+     close(fds.from[0]);
+ 
+-    for (int i=0; i<2; i++) {
++    int i;
++    for (i=0; i<2; i++) {
+ 	char *map_file;
+ 	if (asprintf(&map_file, file_formats[i], pid) < 0) {
+ 	    perror("allocate string");
+-- 
+cgit 1.2.3-1.el7
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
