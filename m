Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F030C433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 20:47:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79E916058D
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 20:47:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79E916058D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E58B8278F;
	Fri, 12 Nov 2021 20:47:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pJkddk61q8ji; Fri, 12 Nov 2021 20:47:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EA658277E;
	Fri, 12 Nov 2021 20:47:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF85E1BF3AE
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 20:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF36861516
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 20:47:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4xLKv9sbNzH1 for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 20:47:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A2E2361512
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 20:47:45 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id a129so26811695yba.10
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 12:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=54tI/KbegBYzkobamIl3P0vLYVCYMu/6qamZJ3HAeSE=;
 b=oLWfNmwmoJzg/6q1UFMPMbBaESjGz9J2WpfZSEw4uW1fOtDEZt6kgI7ixBECvpja3z
 xIaMlB8s7ZgCEgeMfnbpnDyVo5CK4qfC3iFHj1MyhRiTumiSKYxo6Z1NNRzk9Ps9Qt/V
 ZkKLwXfIfbiHZA2YVozhHNbYUedfGXM+9DjBfA5xo+9tTT/CFod/uh/pBbWa2fzj6nO6
 QwX6SKKXC+Kuq87MyIbsWexNd4LAfo9MtnfQ9gSiMVms7k4lpdZteSsakePLW+N+WmlF
 82Qnz2T3MbnvMKQlHVChlINodOAN+GhxMJkP53H3+8j+DGKOooHI5vjkC2GdKm6cUeVA
 D/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=54tI/KbegBYzkobamIl3P0vLYVCYMu/6qamZJ3HAeSE=;
 b=t5V6LVFxJ3ZFlIuCoKHE5CymDp/0LX5tU+tugthfMZD39s6OJO6naEhdtg3QmK+YXO
 4i7tHIXTDnBPWRQNAwdghWEe50aNvqnIL7pbWg8/eSkmX6Xf5Oc7c+EQhoULBHmENScL
 CHVTYCYj0EYE7Uji9j/KU/FG/Gw9IfJDJXPD2obBz72nCCs8NRrYva+TvtVibAg0XAGr
 56LzKMa0JM6K3qsoPgNfGiGOiwXzVh4Br+uwL/s32saU1mgLBPf2c4Cq1qxcosMgxHhq
 3+5p91jw2Xj5cOWlFCg6oFensSqsYrVTOBFfYqmak1svqGMhS9WCtKckePJ02k/eWBlW
 doBQ==
X-Gm-Message-State: AOAM531yK7I4YNAcVSnlSHRbwH1MuIpTmS9HqXiTv2Srw1c1+Wcyt6sU
 LOaTOdZJkogRH+qO0nNO3nykJm5M8oVfyuzqkP8=
X-Google-Smtp-Source: ABdhPJwy2uvKOWR0qRxqwwBNPdUQWHzAb4823vgvpqYSl4y1tqXIA6CrDtOZL+dNADHsU2rAUJyh9+C8MjX5YPlvoAM=
X-Received: by 2002:a25:bace:: with SMTP id a14mr20046456ybk.283.1636750064630; 
 Fri, 12 Nov 2021 12:47:44 -0800 (PST)
MIME-Version: 1.0
References: <20211112185909.1324077-1-unixmania@gmail.com>
 <20211112193354.GB247986@scaer>
In-Reply-To: <20211112193354.GB247986@scaer>
From: Carlos Santos <unixmania@gmail.com>
Date: Fri, 12 Nov 2021 17:47:33 -0300
Message-ID: <CAJ4jsad6Mk8NA=ZBE4-MxH3w57oWWg-bqt3VGk-mRcLRwzVPsg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH] package/mksh: fix project URL in Config.in
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

COn Fri, Nov 12, 2021 at 4:33 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Carlos, All,
>
> On 2021-11-12 15:59 -0300, unixmania@gmail.com spake thusly:
> > From: Carlos Santos <unixmania@gmail.com>
> >
> > It's https://www.mirbsd.org/mksh.htm
>
> ... which does not support TLS 1.2, and so recent browsers whine about
> an insecure connection, like Firefox:
>
[...]
>
> And indeed, enabling TLS 1.0 and 1.1 allows the connection to succeed...
> Too bad... :-(
>
> And of course, we can't download it either, of course, but fortunately,
> there is the fallback to s.b.o :
>
>     >>> mksh 59c Downloading
>     wget --passive-ftp -nd -t 3 -O '/home/ymorin/dev/buildroot/O/build/.mksh-R59c.tgz.5iZMHq/output' 'https://www.mirbsd.org/MirOS/dist/mir/mksh/mksh-R59c.tgz'
>     --2021-11-12 20:24:00-- https://www.mirbsd.org/MirOS/dist/mir/mksh/mksh-R59c.tgz
>     Resolving www.mirbsd.org (www.mirbsd.org)... 62.138.145.52, 2001:470:1f0b:76c::1
>     Connecting to www.mirbsd.org (www.mirbsd.org)|62.138.145.52|:443...  connected.
>     OpenSSL: error:1425F102:SSL routines:ssl_choose_client_version:unsupported protocol
>     Unable to establish SSL connection.
>     wget --passive-ftp -nd -t 3 -O '/home/ymorin/dev/buildroot/O/build/.mksh-R59c.tgz.ojSduH/output' 'http://sources.buildroot.net/mksh/mksh-R59c.tgz'
>     --2021-11-12 20:24:01--  http://sources.buildroot.net/mksh/mksh-R59c.tgz
>     Resolving sources.buildroot.net (sources.buildroot.net)... 172.67.72.56, 104.26.1.37, 104.26.0.37, ...
>     Connecting to sources.buildroot.net (sources.buildroot.net)|172.67.72.56|:80... connected.
>     HTTP request sent, awaiting response... 200 OK
>
> Meh... :-(
>
> Should we switch over to using plain http instead? It is not much less
> secure than TLS 1.0 or 1.1, for which there are known and practical
> attacks, and plain http will work. Also, we do have the hashes, so we
> can at least assess the integrity and authenticity of the download.

I already reported the problem to the project owner. Waiting for a response.

-- 
Carlos Santos <unixmania@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
