Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URI_HEX,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8297CC432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 21:18:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3402A60FDC
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 21:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3402A60FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE6F78280E;
	Thu, 26 Aug 2021 21:18:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uB341Tn2uRpa; Thu, 26 Aug 2021 21:17:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3465A82849;
	Thu, 26 Aug 2021 21:17:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 129D41BF2A6
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 21:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F35B3407CA
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 21:17:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qDDk45rfmDQ4 for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 21:17:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 90D6A40646
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 21:17:51 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id u3so9133760ejz.1
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 14:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=it0wRpmTjw3ygB0Yv73xhLCmr3mvDT0Xm+TUSARHdJo=;
 b=Hwo+1CPpc20yYw4RAbHk7Qdo6esAyT/xvm+z7TRxAeFftZAFZFPmsFwPY4mNwjYdUr
 8PD0ODlnoujJ+4RUji7s/09OFg/Vybuvg1OSwkWrOIJXOOAw0cTxFzixzgaBvVqEzk8+
 JGehwSfb72ZvmV+ZU+NdjLu7Q6b7v26c0Z/VffqP4OCPMjCcfr4FQr2tcdPqzs7U59Ak
 6a3x6jvfDvmnblY30byzO27iRBSNd2de/gHsxsaO3pB2hw1PPKuP43sqxzYbSSWEyz3S
 p3Ft3b1iE6mUJXy6c5chUHsKb78K1c6TIJJF8m9+PHZU53RF4ML9o5HEUS5VaIiKoBF4
 YUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=it0wRpmTjw3ygB0Yv73xhLCmr3mvDT0Xm+TUSARHdJo=;
 b=rFjnnyUOswxpQ25LkYdV2tmK+9DkGqjkecEITJ1YJtHBV0irRNoHfQ8w0OTfVlDd7N
 1ER1aUO8fSwCeLPDXwj1kwQ+45ve+1QwYfMNSu7oEehgTwuxS/4w8vAsG2dVrrznRO3D
 Gl09J7qosh6kLufXJM9G+hnHfhDxAjETr3MCk4Ab4UVbEIruXIiduUSkfyUATwlzPMYH
 qcj4EuPO2RnNQL0DcSUfpIxIfXEkXgaFP6liZZxpOmL4haED9QTcHoAvnoa/SghA5QQF
 Kw0Dl/cBK4gJ/Gbpjf8jNYUlo/3kb3vaTjvsP7ihTLYx1rg2xS/wyB7ZwLAz9Bos+Cy6
 RNjA==
X-Gm-Message-State: AOAM531D2qtM0LeObrqFKVA9YZavBHfqvPhM5lHbpYlclWv/7VeBCayW
 YO32yAUjsrAf3fc9ExmxZ60ssdYQz8w5fw==
X-Google-Smtp-Source: ABdhPJw5QXcl85VGELKAuAYMfdwUYDuOF7Z0RHMXEGannJMQpWCAshdy7IFg5HItymUaXU0kI1Mj/A==
X-Received: by 2002:a17:906:1b08:: with SMTP id
 o8mr6326815ejg.21.1630012669824; 
 Thu, 26 Aug 2021 14:17:49 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id y20sm2265292edc.44.2021.08.26.14.17.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 14:17:49 -0700 (PDT)
To: Michael Nosthoff <buildroot@heine.tech>, buildroot@buildroot.org,
 Angelo Compagnucci <angelo@amarulasolutions.com>
References: <20210826131814.18240-1-buildroot@heine.tech>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <23f41262-5c08-0c61-85b6-b4b592010732@mind.be>
Date: Thu, 26 Aug 2021 23:17:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210826131814.18240-1-buildroot@heine.tech>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH] docs/website: use lore for ml search
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



On 26/08/2021 15:18, Michael Nosthoff via buildroot wrote:
> the nabble.com link is dead and lore has a good search.
> So use lore for the search form.
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

 Applied to master, thanks.

 There's another nabble link that is supposed to load the last mails on the
list, could be useful to replace that one as well. Though apparently the CORS
proxy that we're supposed to use is dead anyway - Angelo, maybe you can take a
look at that?

 There's also a gmane link that is supposed to point to the mailing list,
perhaps that one should be replaced by lore as well.

 Regards,
 Arnout

> ---
>  docs/website/support.html | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/docs/website/support.html b/docs/website/support.html
> index 97ca296836..90231f601c 100644
> --- a/docs/website/support.html
> +++ b/docs/website/support.html
> @@ -59,11 +59,8 @@
>  		    list, since there is a good chance someone else has asked the same question
>  		    before.</p>
>  
> -		  <form method="get" action="http://buildroot-busybox.2317881.n4.nabble.com/template/NamlServlet.jtp">
> -		    <input type="text" name="query">
> -		    <input type="hidden" name="macro" value="search_page">
> -		    <input type="hidden" name="node" value="2">
> -		    <input type="hidden" name="sort" value="date">
> +		  <form method="get" action="https://lore.kernel.org/buildroot/">
> +		    <input type="text" name="q">
>  		    <button type="submit" class="btn btn-default">Submit</button>
>  		  </form>
>  		</div>
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
