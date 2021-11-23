Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8336CC433F5
	for <buildroot@archiver.kernel.org>; Tue, 23 Nov 2021 15:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19C4E40157;
	Tue, 23 Nov 2021 15:31:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z9Cw7FLqI6on; Tue, 23 Nov 2021 15:31:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3912240263;
	Tue, 23 Nov 2021 15:31:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A4F521BF310
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 15:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91A7E40263
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 15:31:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XRkFtyUSlJB9 for <buildroot@lists.busybox.net>;
 Tue, 23 Nov 2021 15:31:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3CF8940157
 for <buildroot@buildroot.org>; Tue, 23 Nov 2021 15:31:48 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id z5so94024299edd.3
 for <buildroot@buildroot.org>; Tue, 23 Nov 2021 07:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QYv/W9s+Ub+ACzWalEtx6orp2ScyimabwcQyS+n5/Hg=;
 b=CvczsEOvlh2DBYzA5LW2NAfPRbp3eDcFgzLW/biEcpI5MMeR6W4pVMJ2hL8yz8Ccan
 8stT3ltgNjaojpWLbyKm4/qSQejv+m43tZtxeSRHCqJklMuwdiztlhGizNpO8zYfDrln
 BPNTjVqkslsjU7PUKwZDvrRZqZJSQhlzUEBn0nBBRHvBk4mdHNSte2GY5mcinrxktdnB
 D5f9GZnSQ+AnJ0ZFLcGDkY6W7hcG0NJupBd0ZoPu6NqBYQ2dqR/qhro9VceW5i9xkNCM
 TAOQEGuutVxPCeWYSoFae0xrqBMMIjvsxdXQw/UZAPxtLWb9wfXQT+7UaPoBdktB3YFu
 7WmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QYv/W9s+Ub+ACzWalEtx6orp2ScyimabwcQyS+n5/Hg=;
 b=T4SJa+9Jm+pl4cJITgGwNbzNDhes9vy68SQhj+iQ1XqGk73AcvEFtCDTZMWbGNLtKl
 G5IUwpqhT/RM2OKJZOBsR6dqEkkVIJHdNUMRXMNuVJKpHbcSMxa/sXfX0BpL++D/5RDv
 NVttDM9f0A/8ycN2rW7/2A4jpqSNvGtCwcB7fBHMLTZl3eWZNhOsyr2npWI3fuhyU4K3
 7527bytAUGmfxCgnaqMNZd/Rb5JochX28WXagr3c9S48pq4qLkjXjK1VE1C69PXBuVTq
 JPULfzZ7PbcuJVAPgz7V0W+DcANzs3gWkjIYUZLUo3wMotBKvpyIojFD/gPoxm3WoZWt
 G2Nw==
X-Gm-Message-State: AOAM530Er9ZHyHMrFMKQYpfCMoh+l0yHnbXtmHGqiMGSXmNJAdUyOQ+O
 ZivjmGWJtQxJmv/q4aDwptzwAw==
X-Google-Smtp-Source: ABdhPJwX3pmsmdZ9eCum0daLj4C0aSbkWRULLonjhxPyaQmfRkrFFrQDojg/QgaYmYGRg0Fr5Uzm1w==
X-Received: by 2002:a05:6402:350a:: with SMTP id
 b10mr10784907edd.184.1637681506164; 
 Tue, 23 Nov 2021 07:31:46 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id i8sm6560606edc.12.2021.11.23.07.31.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 07:31:45 -0800 (PST)
Message-ID: <25af82b3-1678-9812-e9fc-1527d48ad090@mind.be>
Date: Tue, 23 Nov 2021 16:31:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Cyril Bur <cyrilbur@gmail.com>, buildroot@buildroot.org
References: <20211123121530.3714511f@camb691.localdomain>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211123121530.3714511f@camb691.localdomain>
Subject: Re: [Buildroot] [RFC PATCH] pkg-stats: Ignore make output without
 '=' character
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
Cc: luca@lucaceresoli.net, thomas.de_schampheleire@nokia.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/11/2021 13:15, Cyril Bur wrote:
> It is possible that some users of buildroot have put it in a repository
> and call into it from another Makefile such as:
> .DEFAULT:
> 	$(MAKE) O=$(abspath $(O)) -C buildroot $(@)
> 
> This technique works well except that Make tells us that it changes into
> the buildroot directory:
> make[1]: Entering directory 'buildroot'

  A better fix for this particular issue is for pkg-stats to call make with the 
--no-print-directory option.

  Regards,
  Arnout

> 
> Because this line doesn't have an equals within it, python raises a
> ValueError exception within pkg-stats.
> 
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> ---
> I have no idea if this technique fits in the buildroot philosophy
> or if buildroot even wants to accommodate this but it sure would be
> nice for me.
> 
>   support/scripts/pkg-stats | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 3992c8312a..814e6f8855 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -388,7 +388,10 @@ def package_init_make_info():
>   
>       for item in variable_list:
>           # Get variable name and value
> -        pkgvar, value = item.split("=", maxsplit=1)
> +        try:
> +            pkgvar, value = item.split("=", maxsplit=1)
> +        except ValueError e:
> +            continue
>   
>           # Strip the suffix according to the variable
>           if pkgvar.endswith("_LICENSE"):
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
