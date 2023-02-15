Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C797C636D4
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 21:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6AD681FBE;
	Wed, 15 Feb 2023 21:15:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6AD681FBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hJFWHgOwRpyS; Wed, 15 Feb 2023 21:15:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E45481F5C;
	Wed, 15 Feb 2023 21:15:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E45481F5C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 68F591BF3A0
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42C9381446
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:15:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42C9381446
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IEFu4Lf29pml for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 21:15:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C6FC81432
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C6FC81432
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 21:15:22 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id jg8so256173ejc.6
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 13:15:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2qla3I38Um9KyOiSqJ/CWLddVIevOf7oSdnPt5xUHIo=;
 b=VfJpcPqtOp6Y/5yNM0OEw3Y6yKW0LSU3+hj7Gvz60+IHMpYvAME08QaKL8yHASBluZ
 taq5TMLsI2/VLySQbAw4m7I+8NJIAt2YQcdFNh9gvVueH5kCNdDmtGW+7sTv67wUC4kK
 0n1Kj1F8GOJhkDnsKktIi1dKgY8K1S/Fk1brAmMNAi8LMNOxShEy/+wJ6/Bm5vcLfqQw
 iqqaNFCzU8M5tQimBkEO5tkfauAmX8l/DJ+gervCrWIf0FXJuHpYQ534XgBIkiDyfNE2
 PNOBz4OUQjK0fOZIx0Y3pPidJQjImsZ+imKtF/+UU2WwGDkB3Aejj3+kJqFSkly2dS4O
 B6sA==
X-Gm-Message-State: AO0yUKUIKr0vLown71xnxbmZzyoEJnkHVjzZT0IqvOboLaC613Sxzqx/
 8C0JJz8hFp238nBixsKZFJgpC/FWp2qJKc94
X-Google-Smtp-Source: AK7set8B3lvkdvex1NdqfU3lBDKwEFveBqZ3AbgPvdRPbL3hYPQaX+mROg1uIkAgde9Ze4cpay0AuQ==
X-Received: by 2002:a17:906:2c14:b0:8b1:239b:addd with SMTP id
 e20-20020a1709062c1400b008b1239badddmr4070988ejh.5.1676495720402; 
 Wed, 15 Feb 2023 13:15:20 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a170906b00100b0087862f45a29sm10196979ejy.174.2023.02.15.13.15.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 13:15:19 -0800 (PST)
Message-ID: <3210b93a-49ea-4be4-143c-fd6f578d3435@mind.be>
Date: Wed, 15 Feb 2023 22:15:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Stefan Agner <stefan@agner.ch>, buildroot@buildroot.org
References: <12a7772dc9c30d31bc4dd7a4e15ca12425c14834.1676297701.git.stefan@agner.ch>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <12a7772dc9c30d31bc4dd7a4e15ca12425c14834.1676297701.git.stefan@agner.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2qla3I38Um9KyOiSqJ/CWLddVIevOf7oSdnPt5xUHIo=;
 b=M4HyfmprMOOjo8b3BdXoWGy5Lfcf5VXMchlYk0TGd0gSsbo/p2ZQwQIb1tccWg9HHU
 fX6wRBq93sbjHqSDOSvjUcL5zFwsbU+8jizwmirsF8QLH76KbRuB8WIRJLIOja58D0ia
 bDMhZcPXPgFzr/2j5+ORlvpfaV4zn8VtJai3N5H1PARAgGxY+lTwbT4uRKf2lxIF+w4T
 bVOADV4eafvyq9ycVBdkHqduTLciGLhhHhG5t5bQzQbXy/hgiasHDsRR4MTSVPZCy5GY
 4h0j0lK1N/NgndXcP+ntwzcsje0+HIIftqNU5OG90nM8xzEDZbJB1YC9mhj/l6fgqHJb
 brGQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=M4Hyfmpr
Subject: Re: [Buildroot] [PATCH] package/pkg-golang: disable version control
 information
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
Cc: Anisse Astier <anisse@astier.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/02/2023 15:15, Stefan Agner wrote:
> By default go tries to include version control (VCS) information in
> binaries. Since Buildroot separates version control from the build
> process it is sensible to disable this behavior.
> 
> This avoids build errors when building with a git repository higher
> up in the tree owned by root. In this case the go build system
> calls `git status --porcelain` which returns with an error:
> fatal: detected dubious ownership in repository at '/build'
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/pkg-golang.mk | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
> index cdc67b32c0..da9c9a21ac 100644
> --- a/package/pkg-golang.mk
> +++ b/package/pkg-golang.mk
> @@ -45,7 +45,8 @@ $(2)_BUILD_OPTS += \
>   	-modcacherw \
>   	-tags "$$($(2)_TAGS)" \
>   	-trimpath \
> -	-p $$(PARALLEL_JOBS)
> +	-p $$(PARALLEL_JOBS) \
> +	-buildvcs=false
>   
>   # Target packages need the Go compiler on the host at download time (for
>   # vendoring), and at build and install time.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
