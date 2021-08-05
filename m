Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F33C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:11:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADCB660EC0
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ADCB660EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74AE7405AF;
	Thu,  5 Aug 2021 20:11:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dVlZi8dg6zz1; Thu,  5 Aug 2021 20:11:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A613040574;
	Thu,  5 Aug 2021 20:11:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F0D761BF3FD
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEE2D400CD
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:11:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k7HZMvyK-d3e for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 20:11:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5DFFC40287
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 20:11:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:70be:8b43:5d22:5801])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 586E8B0053D;
 Thu,  5 Aug 2021 22:11:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1628194301;
 bh=VQUrqfCgVajORLSfH7JFnkQeC2Z1f/Lptf4a3IZF9c0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KyPwug6TAr6RLximHDvmoc5SLGM076hi65p6hB/LqvCY26ylATfxOYBhPEyX3CSMz
 rV+0l4zAgrcJeZUvaEWW8sQvob0FB6fvWkVsSV7ed6hsapOSN4mW12WNYRbvdAgAm0
 4m4XFNB/4aV8tZdQxuPECP7PcMxURCllwrhvUrryH0YJFBDXKlpr3F8rVnzCY8eZ1D
 s1CoifHoMuGiILNyKo5F01nLcX3uXXhrSEDxWnFay1K0f6gTpRk1W+lL1lBEeLJDju
 dY4KIq+q29zQJJS7fPm1npSIcyTucJ7dJo8NjSl0FNF5r1hPvdvoczGe0oCIrjPxQd
 gLbFscQv2IESA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 05 Aug 2021 22:11:37 +0200
Date: Thu, 5 Aug 2021 22:11:37 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: illia.bitkov@mind.be
Message-ID: <20210805201137.GP27036@scaer>
References: <20210805161653.2213689-1-illia.bitkov@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210805161653.2213689-1-illia.bitkov@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libcap: fix build failure due
 to unessesary patch
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Illia, All,

On 2021-08-05 18:16 +0200, illia.bitkov@mind.be spake thusly:
> From: Illia Bitkov <illia.bitkov@mind.be>
> 
> Fix the following build failure which is raised since bump
> to version 2.52 in commit 38b0759432070f7a57c0fab84d44a07caead6f06
> 
> 	Applying 0001-Permit-compilation-with-std-c89.patch using patch:
> 	patching file Makefile
> 	Reversed (or previously applied) patch detected!  Skipping patch.
> 	1 out of 1 hunk ignored -- saving rejects to file Makefile.rej
> 	patching file libcap/cap_test.c
> 	Reversed (or previously applied) patch detected!  Skipping patch.
> 	1 out of 1 hunk ignored -- saving rejects to file libcap/cap_test.c.rej
> 	patching file psx/psx.c
> 	Reversed (or previously applied) patch detected!  Skipping patch.
> 	1 out of 1 hunk ignored -- saving rejects to file psx/psx.c.rej
> 	patching file tests/exploit.c
> 	Reversed (or previously applied) patch detected!  Skipping patch.
> 	2 out of 2 hunks ignored -- saving rejects to file tests/exploit.c.rej
> 	patching file tests/libcap_launch_test.c
> 	Reversed (or previously applied) patch detected!  Skipping patch.
> 	1 out of 1 hunk ignored -- saving rejects to file tests/libcap_launch_test.c.rej
> 	patching file tests/uns_test.c
> 	Reversed (or previously applied) patch detected!  Skipping patch.
> 	1 out of 1 hunk ignored -- saving rejects to file tests/uns_test.c.rej
> 
> Problem is because patch was integrated into package repo
> 
> Fixes:
> http://autobuild.buildroot.net/results/2f619b233e2cfb4d7eeb3cc178c849c74d11f2ca/
> Signed-off-by: Illia Bitkov <illia.bitkov@mind.be>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...0001-Permit-compilation-with-std-c89.patch | 123 ------------------
>  1 file changed, 123 deletions(-)
>  delete mode 100644 package/libcap/0001-Permit-compilation-with-std-c89.patch
> 
> diff --git a/package/libcap/0001-Permit-compilation-with-std-c89.patch b/package/libcap/0001-Permit-compilation-with-std-c89.patch
> deleted file mode 100644
> index 0219f09f52..0000000000
> --- a/package/libcap/0001-Permit-compilation-with-std-c89.patch
> +++ /dev/null
> @@ -1,123 +0,0 @@
> -From 06ec53d0c9fcddcc071a0e07731e6c83238400e6 Mon Sep 17 00:00:00 2001
> -From: "Andrew G. Morgan" <morgan@kernel.org>
> -Date: Mon, 21 Jun 2021 17:46:43 -0700
> -Subject: Permit compilation with -std=c89.
> -
> -Tested with
> -
> -  make COPTS="-O2 -std=c89" clean all test sudotest
> -
> -This addresses the issue reported by Byron Stanoszek:
> -
> -  https://bugzilla.kernel.org/show_bug.cgi?id=213541
> -
> -Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
> -
> -[Retrieved from:
> -https://git.kernel.org/pub/scm/linux/kernel/git/morgan/libcap.git/commit/?id=06ec53d0c9fcddcc071a0e07731e6c83238400e6]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - Makefile                   | 1 +
> - libcap/cap_test.c          | 1 +
> - psx/psx.c                  | 2 +-
> - tests/exploit.c            | 9 +++++++--
> - tests/libcap_launch_test.c | 6 +++---
> - tests/uns_test.c           | 3 ++-
> - 6 files changed, 15 insertions(+), 7 deletions(-)
> -
> -diff --git a/Makefile b/Makefile
> -index 9666bf0..984d502 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -68,6 +68,7 @@ endif
> - distcheck:
> - 	./distcheck.sh
> - 	$(MAKE) DYNAMIC=yes clean all test sudotest
> -+	$(MAKE) DYNAMIC=no COPTS="-O2 -std=c89" clean all test sudotest
> - 	$(MAKE) PAM_CAP=no CC=/usr/local/musl/bin/musl-gcc clean all test sudotest
> - 	$(MAKE) clean all test sudotest
> - 	$(MAKE) distclean
> -diff --git a/libcap/cap_test.c b/libcap/cap_test.c
> -index c9e83de..a717217 100644
> ---- a/libcap/cap_test.c
> -+++ b/libcap/cap_test.c
> -@@ -79,4 +79,5 @@ int main(int argc, char **argv) {
> - 	exit(1);
> -     }
> -     printf("cap_test PASS\n");
> -+    exit(0);
> - }
> -diff --git a/psx/psx.c b/psx/psx.c
> -index 12dbbc5..90dcc50 100644
> ---- a/psx/psx.c
> -+++ b/psx/psx.c
> -@@ -229,7 +229,7 @@ static void psx_syscall_start(void) {
> -     psx_tracker.psx_sig = SIGSYS;
> - 
> -     psx_confirm_sigaction();
> --    psx_do_registration(); // register the main thread.
> -+    psx_do_registration(); /* register the main thread. */
> - 
> -     psx_tracker.initialized = 1;
> - }
> -diff --git a/tests/exploit.c b/tests/exploit.c
> -index 28bac88..814337c 100644
> ---- a/tests/exploit.c
> -+++ b/tests/exploit.c
> -@@ -16,6 +16,10 @@
> -  * to execute arbitrary code. As such, if all but one thread drops
> -  * privilege, privilege escalation is somewhat trivial.
> -  */
> -+
> -+/* as per "man sigaction" */
> -+#define _POSIX_C_SOURCE 200809L
> -+
> - #include <pthread.h>
> - #include <signal.h>
> - #include <stdio.h>
> -@@ -148,7 +152,8 @@ int main(int argc, char **argv) {
> -     if (greatest_len != 1) {
> - 	printf("exploit succeeded\n");
> - 	exit(1);
> --    } else {
> --	printf("exploit failed\n");
> -     }
> -+
> -+    printf("exploit failed\n");
> -+    exit(0);
> - }
> -diff --git a/tests/libcap_launch_test.c b/tests/libcap_launch_test.c
> -index 6cbfc43..5286979 100644
> ---- a/tests/libcap_launch_test.c
> -+++ b/tests/libcap_launch_test.c
> -@@ -199,10 +199,10 @@ int main(int argc, char **argv) {
> -     cap_free(final);
> -     cap_free(orig);
> - 
> --    if (success) {
> --	printf("cap_launch_test: PASSED\n");
> --    } else {
> -+    if (!success) {
> - 	printf("cap_launch_test: FAILED\n");
> - 	exit(1);
> -     }
> -+    printf("cap_launch_test: PASSED\n");
> -+    exit(0);
> - }
> -diff --git a/tests/uns_test.c b/tests/uns_test.c
> -index 41aa0a6..d8f5415 100644
> ---- a/tests/uns_test.c
> -+++ b/tests/uns_test.c
> -@@ -115,7 +115,8 @@ int main(int argc, char **argv)
> -     }
> -     close(fds.from[0]);
> - 
> --    for (int i=0; i<2; i++) {
> -+    int i;
> -+    for (i=0; i<2; i++) {
> - 	char *map_file;
> - 	if (asprintf(&map_file, file_formats[i], pid) < 0) {
> - 	    perror("allocate string");
> --- 
> -cgit 1.2.3-1.el7
> -
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
