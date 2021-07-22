Return-Path: <SRS0=/mEu=MO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B4DC4338F
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 19:26:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D969560EB5
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 19:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D969560EB5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB21E405C9;
	Thu, 22 Jul 2021 19:26:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lw15_5Mh-rgR; Thu, 22 Jul 2021 19:26:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5FBE405CA;
	Thu, 22 Jul 2021 19:26:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C6BD41BF324
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 19:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6A10400BD
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 19:26:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hG7jQAEuJytf for <buildroot@lists.busybox.net>;
 Thu, 22 Jul 2021 19:26:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6CF50401AD
 for <buildroot@buildroot.org>; Thu, 22 Jul 2021 19:26:26 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id o5so302059ejy.2
 for <buildroot@buildroot.org>; Thu, 22 Jul 2021 12:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lKt3E+PKbqkmqhkqetoode3vIkVBkQY3sy1Nt8VxikI=;
 b=UBr6b1AAXxgTh46+87pPKtypRIowKMlLmmcKKLbyGRg9aZBmIOsaUa/Lro4ed1yY/m
 /jgpKtOZ90muFfA/x9cfdXURkdpRphlvKAycJBW8CY4dP3i/FaFXI+1T1EQtVSl98xZF
 n7YBvy8OzVFPSpxgWfDIeRffps1yAPZmn41RIPMHuxerxRVB3tgYUEwYsOTylRuXAHZ3
 A9BJ3yL5d44tX07AoS847tP8O2WoEAIGUSztlBKpEyN015CNhmIBXxEF5RrfloE3i1uE
 ktBkwbqu6nbwFhIsHOZlGH8XNnKfz7C1z+AiwBm3a5Gq90pRslqACTPDKrreiHujuXGY
 TNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=lKt3E+PKbqkmqhkqetoode3vIkVBkQY3sy1Nt8VxikI=;
 b=U9mP6812aLbbPdJ7BIhH+FbHwUnwLkdliwhd2jQJ2jhWm7odr7DDbHOCuGzzjtrT+D
 gfnC7gpiiYjBWudspc6/j5VIHN/RhtHyTEXtn4l+HDEI0sb3zulptw9Xo1rtN+y/hCke
 cPH4/lZUCBgMy40C5gSiUYH5hxoxT9M2dvf1tW4TS8pk+IrJ8mEupWbwaRQFfpMdt2VO
 unVghdln5SnfZO0a5uoIfWONQcNv8wMmI7Pwr0nWJCn8uO21zt39jaWVESg9uOPkmVyz
 qRDRCANo+mN4of8FNTntWrqZz/JagLPLs5ZNQTXU4ObI1h9+0/nUf7CxQA2WyRkCY/ZJ
 JOtw==
X-Gm-Message-State: AOAM531+0r7DNJORKwBzKWyyg/SgbvyfPjKu7ZJw87zSCF2hD0iyg8EY
 kUZYVi3o51jd361dpWhTbUZvizEL1Iv2gPFd
X-Google-Smtp-Source: ABdhPJzVBxHTHR0L2Rm7Wgd7CNWRAhbTDpteOT2TNvv3m1MLc7n6DEVNKEIOxQlyv/12Wtiqz8kfFQ==
X-Received: by 2002:a17:906:2f15:: with SMTP id
 v21mr1291241eji.220.1626981984403; 
 Thu, 22 Jul 2021 12:26:24 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id u9sm9557530eje.31.2021.07.22.12.26.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 12:26:24 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20210721171538.592498-1-thomas.petazzoni@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <f3047763-02cf-cfca-b42f-c40f913ff1c9@mind.be>
Date: Thu, 22 Jul 2021 21:26:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210721171538.592498-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH] docs/website: mention mailing list archives
 at lore.kernel.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 21/07/2021 19:15, Thomas Petazzoni wrote:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  docs/website/support.html | 11 +++++++----

 Any particular reason to skip the links in docs/manual/resources.txt and
docs/website/contribute.html ?

</snark>


 Regards,
 Arnout

>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/website/support.html b/docs/website/support.html
> index eef969d461..97ca296836 100644
> --- a/docs/website/support.html
> +++ b/docs/website/support.html
> @@ -45,11 +45,14 @@
>  		  <img class="img-responsive" src="images/email.png" style="max-width:50px; margin-bottom:10px;">
>  		</div>
>  		<div class="col-sm-11">
> -		  <p>The <a href="/lists/buildroot/">mailing list</a> is for discussion and
> +		  <p>The mailing list is for discussion and
>  		    development.  You can subscribe by visiting
> -		    <a href="http://lists.buildroot.org/mailman/listinfo/buildroot">this page</a>.
> -		    Only subscribers to the Buildroot mailing list are allowed to post
> -		    to this list.</p>
> +		    <a href="http://lists.buildroot.org/mailman/listinfo/buildroot">this
> +		    page</a>.  Only subscribers to the Buildroot
> +		    mailing list are allowed to post to this
> +		    list. Archives are available
> +		    from <a href="/lists/buildroot/">Mailman</a>
> +		    and <a href="https://lore.kernel.org/buildroot/">lore.kernel.org</a>.
>  
>  		  <h4>Search the List Archives</h4>
>  		  <p>Please search the mailing list archives before asking questions on the mailing
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
