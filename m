Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48603C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 12:43:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB96E60F8F
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 12:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB96E60F8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68D4F40269;
	Sat, 11 Sep 2021 12:43:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wWX-LFDCguSQ; Sat, 11 Sep 2021 12:43:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BA4040120;
	Sat, 11 Sep 2021 12:43:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A972C1BF31A
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 12:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98F7860757
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 12:43:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ETXcsQoCiHfT for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 12:43:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2DE7B60629
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 12:43:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6c4a:f4f1:e14a:6e93])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id EAB0AB0056A;
 Sat, 11 Sep 2021 14:43:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631364206;
 bh=IeBRkRGwsMEua3fjKsvfOB+ZrBvNfclKy6ImZnk6BNs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y9E5l7SajR4skg9X8s1FySJB1zEeGpzrI5McgS11AnSm4wDGSWsc8kCS2vaYoR6TF
 ABKNMqMBMLEFZbyhFn25z47t6bd2GGpU/Hwkh7V5pG2T+IZVoMXhK0r84wiisC92CS
 vLEPJp1gsIMeOaVoGW4nxLA7F4/3Ncd3kWNbx4EHzzJeVljUPWM8Otr9JeLYg3E2Bv
 LeyQuZjTPdhPTzJZMurib14VqIMN2lG708viaJpPSbUme5jkHMLRb0HjVPC7zjqTi3
 v/OgdrY00awl8p2JexB2p+pX8WOUWWl01hnlPaGTjPOyaBiMsQHmI5eI5lLqi+82m6
 Y0t2ZbdGcxMCA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 11 Sep 2021 14:43:21 +0200
Date: Sat, 11 Sep 2021 14:43:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210911124321.GL1053080@scaer>
References: <20210910205923.632114-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210910205923.632114-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/autofs: fix build with glibc >=
 2.34
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fabrice, All,

On 2021-09-10 22:59 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure with glibc >= 2.34:
> 
> In file included from /tmp/instance-0/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/include/bits/local_lim.h:81,
>                  from /tmp/instance-0/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/include/bits/posix1_lim.h:161,
>                  from /tmp/instance-0/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/include/dirent.h:233,
>                  from automount.c:22:
> automount.c:87:37: error: initializer element is not constant
>    87 | size_t detached_thread_stack_size = PTHREAD_STACK_MIN * 144;
>       |                                     ^~~~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/0c8ab8968b2adf6a5f8eeab00ce388968fa1c1d5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...7-use-default-stack-size-for-threads.patch | 124 ++++++++++++++++++
>  1 file changed, 124 insertions(+)
>  create mode 100644 package/autofs/0001-autofs-5-1-7-use-default-stack-size-for-threads.patch
> 
> diff --git a/package/autofs/0001-autofs-5-1-7-use-default-stack-size-for-threads.patch b/package/autofs/0001-autofs-5-1-7-use-default-stack-size-for-threads.patch
> new file mode 100644
> index 0000000000..f63c399fdc
> --- /dev/null
> +++ b/package/autofs/0001-autofs-5-1-7-use-default-stack-size-for-threads.patch
> @@ -0,0 +1,124 @@
> +From 91edcc55c681dac41d2213b498ec6450aee22d9f Mon Sep 17 00:00:00 2001
> +From: Ian Kent <raven@themaw.net>
> +Date: Mon, 26 Jul 2021 13:18:38 +0800
> +Subject: autofs-5.1.7 - use default stack size for threads
> +
> +autofs uses PTHREAD_STACK_MIN to set the stack size for threads it
> +creates.
> +
> +In two cases it is used to reduce the stack size for long running
> +service threads while it's used to allocate a larger stack for worker
> +threads that can have larger memory requirements.
> +
> +In recent glibc releases PTHREAD_STACK_MIN is no longer a constant
> +which can lead to unexpectedly different stack sizes on different
> +architectures and the autofs assumption it's a constant causes a
> +compile failure.
> +
> +The need to alter the stack size was due to observed stack overflow
> +which was thought to be due the thread stack being too small for autofs
> +and glibc alloca(3) usage.
> +
> +Quite a bit of that alloca(3) usage has been eliminated from autofs now,
> +particularly those that might be allocating largish amounts of storage,
> +and there has been a lot of change in glibc too so using the thread
> +default stack should be ok.
> +
> +Signed-off-by: Ian Kent <raven@themaw.net>
> +
> +[Retrieved (and updated to drop CHANGELOG update) from:
> +https://git.kernel.org/pub/scm/linux/storage/autofs/autofs.git/commit/?id=91edcc55c681dac41d2213b498ec6450aee22d9f]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + CHANGELOG          |  1 +
> + daemon/automount.c | 29 -----------------------------
> + daemon/state.c     |  6 +-----
> + lib/alarm.c        |  6 +-----
> + 4 files changed, 3 insertions(+), 39 deletions(-)
> +
> +diff --git a/daemon/automount.c b/daemon/automount.c
> +index 23235a7..d743235 100644
> +--- a/daemon/automount.c
> ++++ b/daemon/automount.c
> +@@ -84,7 +84,6 @@ static size_t kpkt_len;
> + /* Attributes for creating detached and joinable threads */
> + pthread_attr_t th_attr;
> + pthread_attr_t th_attr_detached;
> +-size_t detached_thread_stack_size = PTHREAD_STACK_MIN * 144;
> + 
> + struct master_readmap_cond mrc = {
> + 	PTHREAD_MUTEX_INITIALIZER, PTHREAD_COND_INITIALIZER, 0, NULL, 0, 0, 0, 0};
> +@@ -2620,34 +2619,6 @@ int main(int argc, char *argv[])
> + 		exit(1);
> + 	}
> + 
> +-#ifdef _POSIX_THREAD_ATTR_STACKSIZE
> +-	if (pthread_attr_setstacksize(
> +-			&th_attr_detached, detached_thread_stack_size)) {
> +-		logerr("%s: failed to set stack size thread attribute!",
> +-		       program);
> +-		if (start_pipefd[1] != -1) {
> +-			res = write(start_pipefd[1], pst_stat, sizeof(*pst_stat));
> +-			close(start_pipefd[1]);
> +-		}
> +-		release_flag_file();
> +-		macro_free_global_table();
> +-		exit(1);
> +-	}
> +-#endif
> +-
> +-	if (pthread_attr_getstacksize(
> +-			&th_attr_detached, &detached_thread_stack_size)) {
> +-		logerr("%s: failed to get detached thread stack size!",
> +-		       program);
> +-		if (start_pipefd[1] != -1) {
> +-			res = write(start_pipefd[1], pst_stat, sizeof(*pst_stat));
> +-			close(start_pipefd[1]);
> +-		}
> +-		release_flag_file();
> +-		macro_free_global_table();
> +-		exit(1);
> +-	}
> +-
> + 	info(logging, "Starting automounter version %s, master map %s",
> + 		version, master_list->name);
> + 	info(logging, "using kernel protocol version %d.%02d",
> +diff --git a/daemon/state.c b/daemon/state.c
> +index 5156bb2..5df0561 100644
> +--- a/daemon/state.c
> ++++ b/daemon/state.c
> +@@ -1177,12 +1177,8 @@ int st_start_handler(void)
> + 	status = pthread_attr_init(pattrs);
> + 	if (status)
> + 		pattrs = NULL;
> +-	else {
> ++	else
> + 		pthread_attr_setdetachstate(pattrs, PTHREAD_CREATE_DETACHED);
> +-#ifdef _POSIX_THREAD_ATTR_STACKSIZE
> +-		pthread_attr_setstacksize(pattrs, PTHREAD_STACK_MIN*4);
> +-#endif
> +-	}
> + 
> + 	status = pthread_create(&thid, pattrs, st_queue_handler, NULL);
> + 
> +diff --git a/lib/alarm.c b/lib/alarm.c
> +index f27e13c..1631a9b 100755
> +--- a/lib/alarm.c
> ++++ b/lib/alarm.c
> +@@ -270,12 +270,8 @@ int alarm_start_handler(void)
> + 	status = pthread_attr_init(pattrs);
> + 	if (status)
> + 		pattrs = NULL;
> +-	else {
> ++	else
> + 		pthread_attr_setdetachstate(pattrs, PTHREAD_CREATE_DETACHED);
> +-#ifdef _POSIX_THREAD_ATTR_STACKSIZE
> +-		pthread_attr_setstacksize(pattrs, PTHREAD_STACK_MIN*4);
> +-#endif
> +-	}
> + 
> + 	status = pthread_condattr_init(&condattrs);
> + 	if (status)
> +-- 
> +cgit 1.2.3-1.el7
> +
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
