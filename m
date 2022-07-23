Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB33C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 16:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 571994241D;
	Sat, 23 Jul 2022 16:56:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 571994241D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Anmgxgk_pTBE; Sat, 23 Jul 2022 16:56:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D93194242B;
	Sat, 23 Jul 2022 16:56:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D93194242B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4CD4D1BF31A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2770460F5D
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:56:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2770460F5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IknQt6qpf0TL for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 16:56:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C724E60ECE
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C724E60ECE
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 16:56:39 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id l15so6296008wro.11
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 09:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=32rwg48kaSlBpL1uRhAToYJiNlel10zbY7rDGFv9skc=;
 b=EEHDNk2iPigGqiNLLkyE9bdPf6VpPpDgEpSHLwpSBDCDQVdpOUHal4Zg5x8qRe04vK
 9x2nMDXdcpdZ/lUsDaYLqQ2So9pOboR99Y+0TfxLa1oDRIo4BOvNJ4PF3YwTFHh7Ej6H
 vo5fAkYOdRTKNQpYrP7dSL6ptYeqarj1ZRHIpOFZSzkvoo01f0JtaXGpKoo8GOTQig7f
 rUTB2x/WZa6XtmgALsHJwhwAf/FnyyZDSd2JaUXuBd8I+Cs+dCGszZMXKB1cEZi9NQTn
 j/uwQB8ok1EJG0l2jS7ipUILcczxzMEQHLo1Ga/lLshZUAPB4ca7kvveLxRZA9Iwd8nc
 5Hbg==
X-Gm-Message-State: AJIora/vaO1aCQH0eKW+bGU3g91xWc2V5DRvtaR78xfHgwQDeHCaBHz8
 UrnFhYVV98ylhfJezzde7tDG1Q==
X-Google-Smtp-Source: AGRyM1tK0Plnt6yIrzx8cOZ0JtlsC/5yWXKeeMfAxlQboyQAYfO2rFOSD2iH1/mYv5u1hbQbSIF42g==
X-Received: by 2002:adf:e312:0:b0:21e:5d66:e0f1 with SMTP id
 b18-20020adfe312000000b0021e5d66e0f1mr3023467wrj.428.1658595397768; 
 Sat, 23 Jul 2022 09:56:37 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 d12-20020adf9c8c000000b0021e1a801e30sm7444922wre.22.2022.07.23.09.56.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 09:56:37 -0700 (PDT)
Message-ID: <e4770b70-f07d-d4d1-8a1a-7a3ad5fe82c3@mind.be>
Date: Sat, 23 Jul 2022 18:56:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220615170854.3997869-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220615170854.3997869-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=32rwg48kaSlBpL1uRhAToYJiNlel10zbY7rDGFv9skc=;
 b=W1x2zB+fwgSsZjArmM3lQ2Oy46l+tfxXpbz5gnVJt+4WvVXv1hFzW0tLFuLQ89bYVq
 UA6lhh5K0REUruPDEKwklbWzM1qSVlkam9DNJ7wXn++Emq320Umyse8ap2KF4VTM740g
 RC3qn2x/KlCmba1QwxQ99XCT8lV8DV00gWaN5f/Poh+8DvTT24OFg2/TZa/NAjgeuabw
 76cf67e3bWRyl4xwjJ6ThAKRemH3mp5LedJUjf3d9Bc2u+Cn9kJq+uU8FKKIe5Rj2VKS
 LGueMN1WMhZxobwGLNhdjbBKSUsS0cZS2YPkjFvpuKUaCcTcU2FyLf0sX1y0UfOn79l3
 JWsQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=W1x2zB+f
Subject: Re: [Buildroot] [PATCH 1/1] docs/manual: fix patchwork URL
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/06/2022 19:08, Fabrice Fontaine wrote:
> http://patchwork.buildroot.org is redirecting to
> https://bugs.busybox.net so replace it by
> https://patchwork.ozlabs.org/project/buildroot/list/ as already done in
> docs/website/contribute.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   docs/manual/contribute.txt | 18 +++++++++++-------
>   docs/manual/resources.txt  |  2 +-
>   2 files changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
> index bf2aed6b51..e588c69be6 100644
> --- a/docs/manual/contribute.txt
> +++ b/docs/manual/contribute.txt
> @@ -418,7 +418,8 @@ editing the commit message. Below the +Signed-off-by+ section, add
>   +---+ and your changelog.
>   
>   Although the changelog will be visible for the reviewers in the mail
> -thread, as well as in http://patchwork.buildroot.org[patchwork], +git+
> +thread, as well as in
> +https://patchwork.ozlabs.org/project/buildroot/list/[patchwork], +git+
>   will automatically ignores lines below +---+ when the patch will be
>   merged. This is the intended behavior: the changelog is not meant to
>   be preserved forever in the +git+ history of the project.
> @@ -470,19 +471,22 @@ $ git format-patch -v4 -M -s -o outgoing origin/master
>   ---------------------
>   
>   When you provide a new version of a patch, please mark the old one as
> -superseded in http://patchwork.buildroot.org[patchwork]. You need to
> -create an account on http://patchwork.buildroot.org[patchwork] to be
> +superseded in
> +https://patchwork.ozlabs.org/project/buildroot/list/[patchwork]. You
> +need to create an account on
> +https://patchwork.ozlabs.org/project/buildroot/list/[patchwork] to be
>   able to modify the status of your patches. Note that you can only change
>   the status of patches you submitted yourself, which means the email
> -address you register in http://patchwork.buildroot.org[patchwork] should
> +address you register in
> +https://patchwork.ozlabs.org/project/buildroot/list/[patchwork] should
>   match the one you use for sending patches to the mailing list.
>   
>   You can also add the +--in-reply-to <message-id>+ option when
>   submitting a patch to the mailing list. The id of the mail to reply to
>   can be found under the "Message Id" tag on
> -http://patchwork.buildroot.org[patchwork].  The advantage of
> -*in-reply-to* is that patchwork will automatically mark the previous
> -version of the patch as superseded.
> +https://patchwork.ozlabs.org/project/buildroot/list/[patchwork]. The
> +advantage of *in-reply-to* is that patchwork will automatically mark
> +the previous version of the patch as superseded.
>   
>   [[reporting-bugs]]
>   === Reporting issues/bugs or getting help
> diff --git a/docs/manual/resources.txt b/docs/manual/resources.txt
> index e90a49b2ab..68b7eb9062 100644
> --- a/docs/manual/resources.txt
> +++ b/docs/manual/resources.txt
> @@ -68,4 +68,4 @@ review comments in a clean and concise web interface, it can be useful
>   for all Buildroot developers.
>   +
>   The Buildroot patch management interface is available at
> -http://patchwork.buildroot.org[].
> +https://patchwork.ozlabs.org/project/buildroot/list/[].
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
