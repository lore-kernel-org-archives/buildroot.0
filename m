Return-Path: <SRS0=PVMq=MM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 697E2C07E95
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 21:01:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23487610A0
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 21:01:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23487610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E143A4037F;
	Tue, 20 Jul 2021 21:01:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gN5WMy0L85Qn; Tue, 20 Jul 2021 21:01:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB1AD40396;
	Tue, 20 Jul 2021 21:01:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 121551BF45A
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 21:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 012B882CA3
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 21:01:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iA9L9jO-TdN4 for <buildroot@lists.busybox.net>;
 Tue, 20 Jul 2021 21:01:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A317882C2E
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 21:01:43 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id c15so3823235wrs.5
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 14:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4LAfPmWRcYZm/3PHwXzaQRRb8b8IXn8XU0pK0u7HFnA=;
 b=XUB6bZCQeC0+Nyhacv4m7B5KD/tcRAnBjOhI8nKzbBjlgHVE2hUVN/eYgC/kAFsszz
 eo3mrt3wmywwwh/gT05EyOcWf8aUvFkPUErIZBa2FzbkWTvIgB/PLnbQX6+ygtjYqdtJ
 mU4mUUd2+8MZ/AMkXlSOlxtIsK0ECJiizhwSKfzp+RxRLJTF7oAkfD1aWVJ8iJlDYuqd
 FuwnA5RisHyoKCYIN/qIOaj3r494uGDVNJcFG2akQiUhZwoL61wog4g9XPlHR2+OWc5I
 51LLeAGgSNPUE4BFiB/NYYFEnJ6IeERyy3zdIw6AUTGMV0zep8LumEGyuUJb1jj36Kua
 M7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4LAfPmWRcYZm/3PHwXzaQRRb8b8IXn8XU0pK0u7HFnA=;
 b=cOf5B+0efafkKYAg+5XHhwbJQIwadxVebswvWv/GvVzbQssENHGX6viPsEz6g8wtQr
 B6I9arscj2HPcbh9xWNmNc7Dp1b4exr67qfYlTfoIAP0ckeoH7Eu1mgGe3o/jOZ23lBV
 qoJUHqmyS9m9MmEpPLi5vczpnKNyIDc+7woOegLH14TpZ9b5li9hY8qILL1wOG+NpfIz
 ftiInWMCcS2TK8s3OMIOahAx5p1Hkcg8FDm4fdy41V8aV0TazzW7L+prKEZOUtsu5PW+
 UVUWmaVGIUGF79pGMqn3+9MNLKEpTiEDfDRRykVW4qAGUOsyo3fzq/y2KmNFS9UE6iOM
 cXBg==
X-Gm-Message-State: AOAM533mvcSxaKo8hKqUp3ZAivZsIAjAr9bIBCaRu5gEcywGql0pgDoC
 GRn7bkh16iV3KiYE2dG+M8DUzvaQLhf4lQ==
X-Google-Smtp-Source: ABdhPJy8uZtiGHF1pkIKp3pd0yUgb44Nnqr1CDrykG0tIyPoJop/qwVRk4mMwxBYmBum2ZH6vwRDTw==
X-Received: by 2002:adf:edd1:: with SMTP id v17mr37134277wro.276.1626814901550; 
 Tue, 20 Jul 2021 14:01:41 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id d18sm24496479wrw.7.2021.07.20.14.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 14:01:41 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 23:01:34 +0200
Message-ID: <20210720210134.90010-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libcap: fix build with gcc 4.8
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>
Message-ID: <20210720210134.N-gZto63rMpqoi6mM1q3oe7T_dd-cE-3vbz3bJMnnqk@z>

Fix the following build failure with gcc 4.8 which is raised since bump
to version 2.51 in commit bef89e381d0d698053a026d6a8cb0ded260bd074:

uns_test.c: In function 'main':
uns_test.c:118:5: error: 'for' loop initial declarations are only allowed in C99 mode
     for (int i=0; i<2; i++) {
     ^

Fixes:
 - http://autobuild.buildroot.org/results/9e67bdd540bb7779a13e27c55114a561c12b289a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...0001-Permit-compilation-with-std-c89.patch | 123 ++++++++++++++++++
 1 file changed, 123 insertions(+)
 create mode 100644 package/libcap/0001-Permit-compilation-with-std-c89.patch

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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
