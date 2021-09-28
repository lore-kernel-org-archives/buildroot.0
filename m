Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE33C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 07:43:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 679EA610FC
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 07:43:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 679EA610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 396E440409;
	Tue, 28 Sep 2021 07:43:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 77DOViXZYU1G; Tue, 28 Sep 2021 07:43:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A93ED403B9;
	Tue, 28 Sep 2021 07:43:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9F0E31BF27C
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 07:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 867A440163
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 07:43:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VkDbSuIcNpFa for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 07:43:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4DB80403B9
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 07:43:40 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id y28so88415697lfb.0
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 00:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=Qbnjrgu4dGaVUBlx1902jJe0JGQAmFWwJecCKsvYlCQ=;
 b=E2IbAit1GDMIZd2YNEHu9J61vTpO1+iRSsZSo9MoVHNPEahUeGZygQwWETZAF8TrIe
 ixEathUJsmLbm9Mey5FVWqJqBkohjS/IEhkNqJGZVTHxHAFkKFu8nqujxEx6yhTcRp6X
 VZ3aweeBxiPb7AEfVtHacxBfKc507XXPjN+1S99o6iJbc/kF3ZUuScTH+Dl8r/vUh2oJ
 QowsUhhb36stELp9F3TsH5NnEdX+L9aZ9fP8jDu7dC3wfjaSgwmGORYAFhTT4z7vKffE
 0PMUMVKPa3isOyasHKRS0CyHYRrHv3lhSb/eNGg891fsPUJCFC8giNjOx64nPl89JuIl
 D7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Qbnjrgu4dGaVUBlx1902jJe0JGQAmFWwJecCKsvYlCQ=;
 b=w/RoZ0hn/SlT5G3R4LexSq/bzG9BrzL1jkw7nHK2asnX+QFnaydkthEI46vTdew1qS
 ZxnPgCwpr5OKt//OcsvMnsbHRk+EG49DH6y8Rq8UPJnZIoxraxyli5F10Sa1sQNvO6FL
 tWTiCIOEXPrpdl+Jr5ux77eEa5eK+0kK3wAxc/SqJRHYzIaybqZVITmyLkyKXTHFDAyC
 0zOJ7F60HYbnqkkfGcT/u3iXGSQLAivYKSwdj+O2cbZwkBl8Lu84lCO+MsQIHMIMeE9L
 so6uvMm1XwjwUCHGHXXpxS5VVvFAZmWaQzJRhjuZyooIXgy/pd8jk7YpHcDd7A58ESGV
 +ofA==
X-Gm-Message-State: AOAM530gvrBJ2/RHWGnUFa2xrLKKaG3lP/6/W2kBfYPYUEqEdGGZnYZ+
 dZzV49tobZY7Oh9OluZQmY4=
X-Google-Smtp-Source: ABdhPJxQSpGTpUNsaRYRyTaosN/5WQ2vEMxrUse5uZn7oikuNfWwQcZXuvy2LsqREZBgO8gj8cnj5Q==
X-Received: by 2002:ac2:4c51:: with SMTP id o17mr4255335lfk.478.1632815017819; 
 Tue, 28 Sep 2021 00:43:37 -0700 (PDT)
Received: from wbg (h-158-174-22-41.NA.cust.bahnhof.se. [158.174.22.41])
 by smtp.gmail.com with ESMTPSA id h4sm1837726lft.184.2021.09.28.00.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 00:43:37 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
In-Reply-To: <a275f09f-0ece-a6f9-f440-8d8659a3b5dd@mind.be>
References: <20210830153056.3176678-1-troglobit@gmail.com>
 <20210830153056.3176678-3-troglobit@gmail.com>
 <a275f09f-0ece-a6f9-f440-8d8659a3b5dd@mind.be>
Date: Tue, 28 Sep 2021 09:43:35 +0200
Message-ID: <87v92l2li0.fsf@gmail.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 2/3] package/smcroute: add sysv init
 script
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Sep 11, 2021 at 16:33, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 30/08/2021 17:30, Joachim Wiberg wrote:
>  This is not how we usually write our start scripts, but I like it!

Thank you, I wasn't sure it would pass inspection :)

>> +{
>> +    start-stop-daemon -q -p "$PIDFILE" "$@"
>  Can't you pass the -x here as well (which makes sure that you actually kill the
> intended daemon in stop() and not some other random process that happens to have
> the same PID)?

Huh, from the usage text of start-stop-daemon it wasn't clear to me if
-x was reserved only for starting.  Thanks for alerting me to this!

>  Anyway, I applied as is.

Thanks, I'll push another bump later today, for the v2.5.3 release,
which will include a fix for -x as well.

Cheers
 /Joachim
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
