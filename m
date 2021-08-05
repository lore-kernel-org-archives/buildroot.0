Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3CD3C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 16:17:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25BAA60F58
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 16:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 25BAA60F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1CB460871;
	Thu,  5 Aug 2021 16:17:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vgz4P9lhG8KT; Thu,  5 Aug 2021 16:17:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 002D360ADB;
	Thu,  5 Aug 2021 16:17:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 177521BF574
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 16:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1426A405E9
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 16:17:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n7VfLD4ZkN8l for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 16:17:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E4FEF405E0
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 16:17:04 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id
 k38-20020a05600c1ca6b029025af5e0f38bso6733576wms.5
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 09:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bIfH6J4LeZJJtkbTwihvvAGbhud438iHom3AZyimgeI=;
 b=f4fonPkr6KgS/FGiTz/VU+WuYlHv2cw4sh942JveYrIFUnlwoFxa/NIq6XzlWExz6+
 HfPI6YkgP2JXKInf3AJS1g5HM5VujXJKjZmUjGPi7DIJ/r0qvmgvJv7nQrtIVxjFBING
 BSZPx0z7NpZhV3TEEE3zmhOxG/LrkJvLJYwA/y6XeQzZRmCpTdDlnjSAdDHe1TwUoa7B
 J3sq1GlrzF5xX5z1BivP6g47v+/UVCknB5sBsOGvyJguxZaV6BDVxp66d4DihUW4qRmD
 3hhpIhynenLsmofQh3Mv72T5jdb/rnffXjqAtJ7KQd7OnFcDwpvTptV+umOdkRqbr81B
 w+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bIfH6J4LeZJJtkbTwihvvAGbhud438iHom3AZyimgeI=;
 b=iiNaqXtL/84bwEzCzCiGtvVg1+pdMjw/H15n/OAid7wfEqmc7B0bJoYXHXgKYpL8Mb
 dwgemU1O41yrBd83hkfHXoCPQrw96e82PY/jQLaxt0Gh54kNVabV3n3xo8FBos2MWi3h
 p6OtuSbSbzSQiiQNR4phnAEoVseMDhwHZ5ZjsR/wMzQIDIam/x+RDwhi6LRjlrEgEtzP
 7BIEFPlUyq5U8V3nYEs4YoPVM5DAOqUU91oCZbJolLs91BvVgkqipQEyP7zR98iF0GUo
 4sQlX7nBBU9N5bZSbCyBlz5lOUEgoxY+cKjFaj+IExCpphPb+MYl7z5foNQGafT48Eod
 9wvg==
X-Gm-Message-State: AOAM533T6s4o1GH5jaX4SV7DQQ2Zziqvip4vwmFDKmfyyAS10W+4llfS
 4weul1ulf+0Sf1Z9CGnbLbIy5tqZh7r+L27euG8=
X-Google-Smtp-Source: ABdhPJwp38zoNh0/XV9xcLKV77XNCZVVOoKhzU97aecweHbFkOhJ3dPd6fN5dJm0bvRFrdDaQ4Pwfw==
X-Received: by 2002:a7b:c932:: with SMTP id h18mr5828002wml.152.1628180222887; 
 Thu, 05 Aug 2021 09:17:02 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-81imx1hcj9kuonvus06.18120a2.ip6.access.telenet.be.
 [2a02:1811:c06:d300:a112:27e5:4992:2446])
 by smtp.gmail.com with ESMTPSA id p5sm7393000wrd.25.2021.08.05.09.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 09:17:02 -0700 (PDT)
From: illia.bitkov@mind.be
To: buildroot@buildroot.org
Date: Thu,  5 Aug 2021 18:16:53 +0200
Message-Id: <20210805161653.2213689-1-illia.bitkov@mind.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libcap: fix build failure due to
 unessesary patch
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
Cc: Illia Bitkov <illia.bitkov@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

From: Illia Bitkov <illia.bitkov@mind.be>

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
---
 ...0001-Permit-compilation-with-std-c89.patch | 123 ------------------
 1 file changed, 123 deletions(-)
 delete mode 100644 package/libcap/0001-Permit-compilation-with-std-c89.patch

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
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
