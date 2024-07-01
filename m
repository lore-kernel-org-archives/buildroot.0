Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB4CC2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 07:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D39B80DA1;
	Mon,  1 Jul 2024 07:24:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6UKR_4A2o8dW; Mon,  1 Jul 2024 07:24:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B32480DA5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B32480DA5;
	Mon,  1 Jul 2024 07:24:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BEC1F1BF340
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 07:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA6F180DA5
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 07:24:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zuGn4gn1RsxC for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 07:24:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7E3BB80DA1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E3BB80DA1
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E3BB80DA1
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 07:24:25 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-424adaa6ceeso16796565e9.1
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 00:24:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719818663; x=1720423463;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=56lkMT2a6oTlCUVW5mVfhWD030h4PNYIl6wt7rsmg0A=;
 b=BQU6w9t02wVvgun2u/l5rW4XIDr/jgJqBGOypVoCyG8E8fyJK1AT3egSGw8vjW/EhL
 N//NryRZyaZ7QUy9CBY3QBEVd4VxD0xrY5P2l/zU7MUJgpNVwzN5XRx+EcltMCBX1Sdw
 g1Sv5E5GhlN6cu1GpvMuQ60Qlaqca1v83mWY8FZY+0X2SbAQAYAoq8bmc5jzmDSVD+nF
 t+GelvwWO4MQsikXLYOJKRbYNKFF/7/435M+8iOxto0PPgH39wfjRK9RYwn38GZ83b7+
 IxoJgaZ4Y0P8GkWlrf4o+WxLZPgGadhHMczjDPveAbTUsgj4XVB5kkHqaEUe4T9kSaBZ
 jsXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3LfASHu07zPfvqHm98UseDwCrbRtdJr/Xqazc995wRIo4tAa/YnY0rbmZmAqu7yboVx6/TDq97kamImTSLLGBPT2aFM7u0g==
X-Gm-Message-State: AOJu0YyIb4MV3KB23uF2vo/uvtw6PbECQ4mG/e8f3mhl4yRBUNCngFea
 vYVKY30EoDH53EwdR1lDYeKRonoOzRNB4400N8Rk+4np8d4m2/lM5WMCLy62FHekyrysz8ieI+5
 c
X-Google-Smtp-Source: AGHT+IHVkUDuG2UTwTHQAvJxIKOFdbs0iZ863O1CcEpJkYFGySPADb3hH4ONwi0lbm8Fzm0kzLhTJg==
X-Received: by 2002:a05:600c:511c:b0:424:8e3a:d020 with SMTP id
 5b1f17b1804b1-4257a04fe36mr32611485e9.29.1719818663302; 
 Mon, 01 Jul 2024 00:24:23 -0700 (PDT)
Received: from [10.1.0.155] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4257c4e10d6sm66173785e9.30.2024.07.01.00.24.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 00:24:22 -0700 (PDT)
Message-ID: <d244f478-1960-4306-a661-6005536a3f94@mind.be>
Date: Mon, 1 Jul 2024 09:24:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: zhangdongdong@eswincomputing.com, buildroot@buildroot.org
References: <20240701024316.19646-1-zhangdongdong@eswincomputing.com>
Content-Language: en-GB
In-Reply-To: <20240701024316.19646-1-zhangdongdong@eswincomputing.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719818663; x=1720423463; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=56lkMT2a6oTlCUVW5mVfhWD030h4PNYIl6wt7rsmg0A=;
 b=Mznh0PVqOBsKbfhu84I+OFW7ghp/YN2uSUW2GNqyNcYRg/KIGIBF8Kr/qMp58lQc+B
 bBtxJzQaLlWMsVvGoVqrHiPxcl8fPHEqo0w7gDCSEnOlIJgXK6TnsQr5VoKQKZCuOfsP
 QPydWv7WMUxVIquCz7spaqiaNGoXdPg1y4lVaQfxY7l7Z06tB+2pbLB0iUs6X1Ct1D8F
 NNZcR27Op00ANUFP+pLqMOstW41TWgmezBn1NybwZu5Tu0qQLfMO7q2sO0hoA6vmlPm/
 w+kaLmI6ASsYlu8QRtkiF2wjhmcn03MBydzcxj2sOSsqTCfNPaEvkxaHFluRK/rQlmLI
 5/ug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Mznh0PVq
Subject: Re: [Buildroot] [PATCH] .github: add github action to automate PR
 handling
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Dongdong,

On 01/07/2024 04:43, zhangdongdong@eswincomputing.com wrote:
> From: Dongdong Zhang <zhangdongdong@eswincomputing.com>
> 
> This patch updates the Buildroot repository's GitHub configuration to better
> manage incoming pull requests.
> 
> - Removed the existing pull request template that advised contributors to use
>    the mailing list for patch submissions.
> - Added a new GitHub Actions workflow (`repo-lockdown.yml`) to automatically
>    handle new pull requests.
> 
> The new workflow:
> - Triggers on new pull requests.
> - Uses the `dessant/repo-lockdown` action to:
>    - Comment on the pull request, guiding contributors to use the mailing list
>      for patch submission.
>    - Lock the pull request to prevent further discussion.
>    - Close the pull request.

  Thank you very much for this patch - that looks like an excellent plan!

  I have one question though (since I'm not super familiar with how github 
workflows work). It is possible for people to modify the workflows yaml files 
and make a pull request that can do anything. This is a risk because those 
workflows may have access to project-specific resources and abuse that to do 
some things (although I'm not entirely sure what can be done, since I'm not 
sure, I prefer to block everything). Right now, we have turned on the option 
"Require approval for all outside collaborators". In other words, the workflow 
will not run until one of the maintainers approves it.

  Of course, that kind of defeats the purpose of this automatic closing of pull 
requests, because we still have to go to the github web interface to trigger the 
workflow...

  So, is there a way to make this actually automatic without risking abuse?

  And in fact, I have a similar question about the dessant/repo-lockdown 
workflow. Is there anything stopping that workflow provider from installing a 
backdoor in all the projects that use that workflow?

  Sorry if this sounds paranoid, but xz, you know...

  Regards,
  Arnout

> 
> This change ensures that contributors are properly directed to the preferred
> method of patch submission via the mailing list, maintaining consistency and
> streamlining the review process.
> 
> Signed-off-by: Dongdong Zhang <zhangdongdong@eswincomputing.com>
> ---
>   .github/pull_request_template.md    |  6 ------
>   .github/workflows/repo-lockdown.yml | 23 +++++++++++++++++++++++
>   2 files changed, 23 insertions(+), 6 deletions(-)
>   delete mode 100644 .github/pull_request_template.md
>   create mode 100644 .github/workflows/repo-lockdown.yml
> 
> diff --git a/.github/pull_request_template.md b/.github/pull_request_template.md
> deleted file mode 100644
> index 319e67d861..0000000000
> --- a/.github/pull_request_template.md
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -Please do not submit a Pull Request via GitHub. Buildroot makes use of a
> -[mailing list](http://lists.buildroot.org/mailman/listinfo/buildroot) for patch submission and review.
> -See [submitting your own patches](http://buildroot.org/manual.html#submitting-patches) for more info.
> -
> -Thanks for your help!
> -
> diff --git a/.github/workflows/repo-lockdown.yml b/.github/workflows/repo-lockdown.yml
> new file mode 100644
> index 0000000000..a5f8bd6a93
> --- /dev/null
> +++ b/.github/workflows/repo-lockdown.yml
> @@ -0,0 +1,23 @@
> +name: 'Repo Lockdown'
> +
> +on:
> +  pull_request_target:
> +    types: opened
> +
> +permissions:
> +  pull-requests: write
> +
> +jobs:
> +  action:
> +    runs-on: ubuntu-latest
> +    steps:
> +      - uses: dessant/repo-lockdown@v4
> +        with:
> +          pr-comment: |
> +            Please do not submit a Pull Request via GitHub. Buildroot makes use of a
> +            [mailing list](http://lists.buildroot.org/mailman/listinfo/buildroot) for patch submission and review.
> +            See [submitting your own patches](http://buildroot.org/manual.html#submitting-patches) for more info.
> +
> +            Thanks for your help!
> +          lock-pr: true
> +          close-pr: true
> \ No newline at end of file
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
