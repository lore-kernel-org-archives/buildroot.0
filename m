Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D8DC433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 18:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32A71401AD;
	Thu, 16 Dec 2021 18:20:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YST6VAfx8TbJ; Thu, 16 Dec 2021 18:20:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 006264017B;
	Thu, 16 Dec 2021 18:20:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6224F1BF36F
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F5F261040
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:20:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SBmT42-pL5kR for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 18:20:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 31C7C60FD6
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 18:20:09 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id y13so90021470edd.13
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 10:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Imc57o3zXO6WpsnNPmmxiJXZUkPUwEuUZpnV03WXQuc=;
 b=CXF2guXK3JeGp0evDC3K1aEq5J/LTmHpvjZ4gtFu91SkPmBCyVZmB35jLfdtFxjJpr
 Wh1Zad4+GR8aXWm06ojxfp3iryBGVk7dr79+8+lsTZbGOdol6aFOKmcNl3UqG5i4bE8A
 eoxDPWT5VCNlzhtS+jLNDRFUw3uIOcUiq2Uowet9icW3ojNyllEPIw11fL8fYVl9UaDz
 UAX/rbJIj1TvCFJj7hW+Ir07sEXvYzLJVGQKbeYJwFLDEfYHw9/8tHHpNMzetCm/mdqn
 U2fNQvvP9IyAVikKyNthXmsMvIhPBrRrjscjPH5zeQEukZJLIK8BKRdWxeIryl0P0DmT
 iUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Imc57o3zXO6WpsnNPmmxiJXZUkPUwEuUZpnV03WXQuc=;
 b=o9aeDP53Eh3XHSXvO24MOhbQ8Mo+GLJ6UcmSz5owpa/4PwhiGB0cKkf3zYfZkR9FGI
 m6fFbAvx0sB8ZcsXGaA5Zz4XSIluuIMuHbuGmhtiqWUlwGBZTqLxV1U6/THCHhuQJgac
 jP6aa2MWcvwJ/nvqfvDNbFxRE8Pj93sTEn1dWpa8kFHgu7NmTrPbWppjulRLpm2niQE3
 CsWPfarcU72EIkvmRtuXCsKKMW+teIlbnkfSPMgH/a3Bm3O1JPGWsWABQhj8nrklnfvJ
 5m9ff3+86Qea74HoFxnYkdwRe5381rSZpQt38blDuC5DFB0/dlJHeRcL/RCEl92OBDHB
 dGWQ==
X-Gm-Message-State: AOAM533iPsnMwYLfvVbSnVY4Ev9lTZ44n0KtTMIr7ALjIJ5aVlTzhsFT
 HA1d0uKIcSkZBMM+ZjUxfaXQ/O0iKACBtg==
X-Google-Smtp-Source: ABdhPJwbQLmPHT+6HjvPJIE4OdyAu0Lp5AJRMonRuat8+CSnxrZYvEa1xkDpkE/7QsypVjIHv2YeNg==
X-Received: by 2002:a05:6402:280c:: with SMTP id
 h12mr18213989ede.370.1639678807312; 
 Thu, 16 Dec 2021 10:20:07 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id jg38sm320626ejc.154.2021.12.16.10.20.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 10:20:06 -0800 (PST)
Message-ID: <850f227c-1060-285b-1e40-e0e62158d2eb@mind.be>
Date: Thu, 16 Dec 2021 19:20:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211214214223.2292967-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211214214223.2292967-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/autofs: bump to version 5.1.8
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/12/2021 22:42, Fabrice Fontaine wrote:
> Drop patch (already in version)
> 
> https://git.kernel.org/pub/scm/linux/storage/autofs/autofs.git/tree/CHANGELOG?h=release_5_1_8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...7-use-default-stack-size-for-threads.patch | 124 ------------------
>   package/autofs/autofs.hash                    |   2 +-
>   package/autofs/autofs.mk                      |   2 +-
>   3 files changed, 2 insertions(+), 126 deletions(-)
>   delete mode 100644 package/autofs/0001-autofs-5-1-7-use-default-stack-size-for-threads.patch
> 
> diff --git a/package/autofs/0001-autofs-5-1-7-use-default-stack-size-for-threads.patch b/package/autofs/0001-autofs-5-1-7-use-default-stack-size-for-threads.patch
> deleted file mode 100644
> index f63c399fdc..0000000000
> --- a/package/autofs/0001-autofs-5-1-7-use-default-stack-size-for-threads.patch
> +++ /dev/null
> @@ -1,124 +0,0 @@
> -From 91edcc55c681dac41d2213b498ec6450aee22d9f Mon Sep 17 00:00:00 2001
> -From: Ian Kent <raven@themaw.net>
> -Date: Mon, 26 Jul 2021 13:18:38 +0800
> -Subject: autofs-5.1.7 - use default stack size for threads
> -
> -autofs uses PTHREAD_STACK_MIN to set the stack size for threads it
> -creates.
> -
> -In two cases it is used to reduce the stack size for long running
> -service threads while it's used to allocate a larger stack for worker
> -threads that can have larger memory requirements.
> -
> -In recent glibc releases PTHREAD_STACK_MIN is no longer a constant
> -which can lead to unexpectedly different stack sizes on different
> -architectures and the autofs assumption it's a constant causes a
> -compile failure.
> -
> -The need to alter the stack size was due to observed stack overflow
> -which was thought to be due the thread stack being too small for autofs
> -and glibc alloca(3) usage.
> -
> -Quite a bit of that alloca(3) usage has been eliminated from autofs now,
> -particularly those that might be allocating largish amounts of storage,
> -and there has been a lot of change in glibc too so using the thread
> -default stack should be ok.
> -
> -Signed-off-by: Ian Kent <raven@themaw.net>
> -
> -[Retrieved (and updated to drop CHANGELOG update) from:
> -https://git.kernel.org/pub/scm/linux/storage/autofs/autofs.git/commit/?id=91edcc55c681dac41d2213b498ec6450aee22d9f]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - CHANGELOG          |  1 +
> - daemon/automount.c | 29 -----------------------------
> - daemon/state.c     |  6 +-----
> - lib/alarm.c        |  6 +-----
> - 4 files changed, 3 insertions(+), 39 deletions(-)
> -
> -diff --git a/daemon/automount.c b/daemon/automount.c
> -index 23235a7..d743235 100644
> ---- a/daemon/automount.c
> -+++ b/daemon/automount.c
> -@@ -84,7 +84,6 @@ static size_t kpkt_len;
> - /* Attributes for creating detached and joinable threads */
> - pthread_attr_t th_attr;
> - pthread_attr_t th_attr_detached;
> --size_t detached_thread_stack_size = PTHREAD_STACK_MIN * 144;
> -
> - struct master_readmap_cond mrc = {
> - 	PTHREAD_MUTEX_INITIALIZER, PTHREAD_COND_INITIALIZER, 0, NULL, 0, 0, 0, 0};
> -@@ -2620,34 +2619,6 @@ int main(int argc, char *argv[])
> - 		exit(1);
> - 	}
> -
> --#ifdef _POSIX_THREAD_ATTR_STACKSIZE
> --	if (pthread_attr_setstacksize(
> --			&th_attr_detached, detached_thread_stack_size)) {
> --		logerr("%s: failed to set stack size thread attribute!",
> --		       program);
> --		if (start_pipefd[1] != -1) {
> --			res = write(start_pipefd[1], pst_stat, sizeof(*pst_stat));
> --			close(start_pipefd[1]);
> --		}
> --		release_flag_file();
> --		macro_free_global_table();
> --		exit(1);
> --	}
> --#endif
> --
> --	if (pthread_attr_getstacksize(
> --			&th_attr_detached, &detached_thread_stack_size)) {
> --		logerr("%s: failed to get detached thread stack size!",
> --		       program);
> --		if (start_pipefd[1] != -1) {
> --			res = write(start_pipefd[1], pst_stat, sizeof(*pst_stat));
> --			close(start_pipefd[1]);
> --		}
> --		release_flag_file();
> --		macro_free_global_table();
> --		exit(1);
> --	}
> --
> - 	info(logging, "Starting automounter version %s, master map %s",
> - 		version, master_list->name);
> - 	info(logging, "using kernel protocol version %d.%02d",
> -diff --git a/daemon/state.c b/daemon/state.c
> -index 5156bb2..5df0561 100644
> ---- a/daemon/state.c
> -+++ b/daemon/state.c
> -@@ -1177,12 +1177,8 @@ int st_start_handler(void)
> - 	status = pthread_attr_init(pattrs);
> - 	if (status)
> - 		pattrs = NULL;
> --	else {
> -+	else
> - 		pthread_attr_setdetachstate(pattrs, PTHREAD_CREATE_DETACHED);
> --#ifdef _POSIX_THREAD_ATTR_STACKSIZE
> --		pthread_attr_setstacksize(pattrs, PTHREAD_STACK_MIN*4);
> --#endif
> --	}
> -
> - 	status = pthread_create(&thid, pattrs, st_queue_handler, NULL);
> -
> -diff --git a/lib/alarm.c b/lib/alarm.c
> -index f27e13c..1631a9b 100755
> ---- a/lib/alarm.c
> -+++ b/lib/alarm.c
> -@@ -270,12 +270,8 @@ int alarm_start_handler(void)
> - 	status = pthread_attr_init(pattrs);
> - 	if (status)
> - 		pattrs = NULL;
> --	else {
> -+	else
> - 		pthread_attr_setdetachstate(pattrs, PTHREAD_CREATE_DETACHED);
> --#ifdef _POSIX_THREAD_ATTR_STACKSIZE
> --		pthread_attr_setstacksize(pattrs, PTHREAD_STACK_MIN*4);
> --#endif
> --	}
> -
> - 	status = pthread_condattr_init(&condattrs);
> - 	if (status)
> ---
> -cgit 1.2.3-1.el7
> -
> diff --git a/package/autofs/autofs.hash b/package/autofs/autofs.hash
> index 10ca42ebed..97bc757d6b 100644
> --- a/package/autofs/autofs.hash
> +++ b/package/autofs/autofs.hash
> @@ -1,5 +1,5 @@
>   # From https://www.kernel.org/pub/linux/daemons/autofs/v5/sha256sums.asc
> -sha256  a36b268611b79b07051749870ba540b139938efc84bc0293244c483e94f9ced7  autofs-5.1.7.tar.xz
> +sha256  b33d1059855664b20eeda26f3e28ff518fb0c3d58f565570af2ae569dc73c0fd  autofs-5.1.8.tar.xz
>   
>   # Hash for license files
>   sha256  458028929f712b4795bc5adc31a1d6a2151364ce1b372ac43f613f56c8448fed  COPYING
> diff --git a/package/autofs/autofs.mk b/package/autofs/autofs.mk
> index 4c5200584f..97b1b6b3e4 100644
> --- a/package/autofs/autofs.mk
> +++ b/package/autofs/autofs.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -AUTOFS_VERSION = 5.1.7
> +AUTOFS_VERSION = 5.1.8
>   AUTOFS_SOURCE = autofs-$(AUTOFS_VERSION).tar.xz
>   AUTOFS_SITE = $(BR2_KERNEL_MIRROR)/linux/daemons/autofs/v5
>   AUTOFS_LICENSE = GPL-2.0+
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
