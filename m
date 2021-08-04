Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83431C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:25:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AE4E61029
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:25:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3AE4E61029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFB1740164;
	Wed,  4 Aug 2021 20:25:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1rmCUwo9NCSO; Wed,  4 Aug 2021 20:25:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B64CC40595;
	Wed,  4 Aug 2021 20:25:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B25251BF5DC
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A16AD83AF1
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:25:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8_W-gTMatAUF for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 20:25:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2CCFB83AD3
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 20:25:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8405:26f6:b20a:5f5])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4638E13FC4F;
 Wed,  4 Aug 2021 22:24:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1628108664;
 bh=PR5QVJSS8aHtwTsFbfBNp9yFm56EAemcqh1ZomL6Z7Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hVUG3pN/vO8iPnMI/wg3dveYpdHwGGzOkRBjjqbkZGsX+RLum8ty2Gkregxc5NcTF
 jb2PZvcI/SXokZgs60k+BH7g5Jt/iRJn1Nk0iPXXBfqfsEkv4dBYBekMogq7zRtfxM
 UDlt9babiewmTpMbC2ONAvq4REhGGO/k6cRWon/HXUPEybJ0whqxVVHj780tkZWlYP
 jA+iuM5HZwVeBni+wvNTvnIP4FXnD8JY5uNr9tRw738aslS+ZN6ead7H0szCn2akQj
 4/JZ2wnO3JZDW7wTd0Z9od0SaerSirGEwqVFBWEHyIzHySqGeA5sXO31qKVZgXQjOl
 ikejFJafcJdMA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 04 Aug 2021 22:24:15 +0200
Date: Wed, 4 Aug 2021 22:24:15 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20210804202415.GJ27036@scaer>
References: <20210802211040.2535969-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210802211040.2535969-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/python3: add patch to fix highly
 parallel builds
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Thomas, All,

On 2021-08-02 23:10 +0200, Thomas Petazzoni spake thusly:
> Highly parallel host-python3 builds sometimes fail with:
> 
> Exception in thread Thread-1:
> Traceback (most recent call last):
>   File "/tmp/instance-3/output-1/host/lib/python3.9/threading.py", line 973, in _bootstrap_inner
>     self.run()
>   File "/tmp/instance-3/output-1/host/lib/python3.9/concurrent/futures/process.py", line 317, in run
>     result_item, is_broken, cause = self.wait_result_broken_or_wakeup()
>   File "/tmp/instance-3/output-1/host/lib/python3.9/concurrent/futures/process.py", line 376, in wait_result_broken_or_wakeup
>     worker_sentinels = [p.sentinel for p in self.processes.values()]
>   File "/tmp/instance-3/output-1/host/lib/python3.9/concurrent/futures/process.py", line 376, in <listcomp>
>     worker_sentinels = [p.sentinel for p in self.processes.values()]
> RuntimeError: dictionary changed size during iteration
> 
> During the compile_all.py step of host-python3. This issue is reported
> upstream at https://bugs.python.org/issue43498, and while not yet
> fixed upstream, a PR was proposed with a possible fix for it. Seems
> the PR seems reasonable, let's give it a chance and see if it improves
> the situation.
> 
> Hopefully Fixes:
> 
>   http://autobuild.buildroot.net/results/ae6c4ab292589a4e4442dfb0a1286349a9bf4d29/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

It seems reasonable enough that we can have a shot at it in the
autobuilders.

Note that it has been reported that this is not necessarily 100%
bullet-proof, so we may still see some failures, but the situation
should be muh, much better now.

Thanks!

Regards,
Yann E. MORIN.

> ---
>  ...teration-error-in-_ExecutorManagerTh.patch | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/python3/0036-Fix-dictionary-iteration-error-in-_ExecutorManagerTh.patch
> 
> diff --git a/package/python3/0036-Fix-dictionary-iteration-error-in-_ExecutorManagerTh.patch b/package/python3/0036-Fix-dictionary-iteration-error-in-_ExecutorManagerTh.patch
> new file mode 100644
> index 0000000000..fbe44c7753
> --- /dev/null
> +++ b/package/python3/0036-Fix-dictionary-iteration-error-in-_ExecutorManagerTh.patch
> @@ -0,0 +1,29 @@
> +From 331966be70c371b268a4fcce9e97280cd869f137 Mon Sep 17 00:00:00 2001
> +From: Jakub Kulik <kulikjak@gmail.com>
> +Date: Mon, 15 Mar 2021 08:49:28 +0100
> +Subject: [PATCH] Fix dictionary iteration error in _ExecutorManagerThread
> +
> +[Thomas: Taken from upstream pull request
> +https://github.com/python/cpython/pull/24868, which is aimed at fixing
> +https://bugs.python.org/issue43498]
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + Lib/concurrent/futures/process.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Lib/concurrent/futures/process.py b/Lib/concurrent/futures/process.py
> +index 90bc98bf2ec..e3b36dff572 100644
> +--- a/Lib/concurrent/futures/process.py
> ++++ b/Lib/concurrent/futures/process.py
> +@@ -373,7 +373,7 @@ class _ExecutorManagerThread(threading.Thread):
> +         assert not self.thread_wakeup._closed
> +         wakeup_reader = self.thread_wakeup._reader
> +         readers = [result_reader, wakeup_reader]
> +-        worker_sentinels = [p.sentinel for p in self.processes.values()]
> ++        worker_sentinels = [p.sentinel for p in self.processes.copy().values()]
> +         ready = mp.connection.wait(readers + worker_sentinels)
> + 
> +         cause = None
> +-- 
> +2.31.1
> +
> -- 
> 2.31.1
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
