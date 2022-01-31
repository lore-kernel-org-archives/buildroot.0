Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5C8C433EF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 20:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEB1040135;
	Mon, 31 Jan 2022 20:38:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nsOwRFnVzDor; Mon, 31 Jan 2022 20:38:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F8D64016F;
	Mon, 31 Jan 2022 20:38:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AA9441BF36A
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 20:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98586813C0
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 20:38:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ip_8Dekhe7Gd for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 20:38:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 795EC813BB
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 20:38:11 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id n10so29235710edv.2
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 12:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ufBoAgPPYuAmb2Ekf046ipnBZFe5nGgoig6IoS7VEGA=;
 b=Z1tmLjSrvqENRWhkfgEwggfIgS8VZ9MfIh+sG7oMKVfsAFIhApvmriyZCC7OltQu/Y
 S9yJkRVg+tt4Z9vEVEg13G8afganmuWCR9RdgWNY7NHv6UigkRtMcBkb9ZvhC06QVsdk
 MC6lzU43q1k8xg2aMxX8sl8116MapUP4JJmEaWp2WVXpTOmSgHiNFR5kJqGLc63Qq84s
 dcLs63lCFBY42xTilpYyqvq58BQe2Na175s3rEKvQyRQ5Jbtq/gpy3dwy3/nj3P2taCS
 PHhGD8KGSWaKRpVlr2CvZhYYe3JiYuM9MvuTB8i3o6gyGZLxl7ZmTkopSMDBEjleQER2
 uSDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ufBoAgPPYuAmb2Ekf046ipnBZFe5nGgoig6IoS7VEGA=;
 b=Yc2LlTnkHgTGQ1pictfWDGk4iRPwwbhJODtXcctSrd6YVR7a9C+qmgSyDPijaYlAGE
 9QaJisNPi0dsuzpDFvPEWmJMnf1DbwKCDqNqH1KJ8xslKGQiTmQ+xEOUvTXxB/RTDQSg
 dAffe88PeaUiCha7p+o2dYLaSjR9thk3fNQ8zHZ8H1VHKqxvjRaXEeYud5vjhpdm6eZK
 u8fMZ3BstV1uNmv8IDVnG2n7CoEyeMUOLg/3ecvcMSVyWSNVf7Nn0CnevQ6GQX2pI6rm
 2GlBFESIaEl6WOZS90C/x8XO0QsoiVnJ5qxoaEZmgsznnfacs3BHarnyWTdM5NAy/pyF
 A5mA==
X-Gm-Message-State: AOAM533BlqjyQVGl2F1GZzSUV6hV34HgZn+v5y5KlaBi3R2J6p9CecJH
 sFUz5wJG2gXzrjKejTrotxVj7Q==
X-Google-Smtp-Source: ABdhPJxHkOP3cPdICVMB+bw20mycGZbXsZomPOf6Tf4efkZ4Qa/UoVZpYQDgyCBku7DrCF//n6M35Q==
X-Received: by 2002:a05:6402:4305:: with SMTP id
 m5mr22033821edc.342.1643661489639; 
 Mon, 31 Jan 2022 12:38:09 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id h6sm13723105ejx.164.2022.01.31.12.38.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 12:38:09 -0800 (PST)
Message-ID: <527fd8d5-6c7e-aa10-06ba-e634ba3c600d@mind.be>
Date: Mon, 31 Jan 2022 21:38:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Thomas De Schampheleire <patrickdepinguin@gmail.com>,
 buildroot@buildroot.org
References: <20210303150451.7963-1-patrickdepinguin@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210303150451.7963-1-patrickdepinguin@gmail.com>
Subject: Re: [Buildroot] [PATCHv2 1/2] utils/size-stats-compare: clarify
 meaning of variables in print_result
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/03/2021 16:04, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> print_result is juggling with entry[x][y] which is not very readable.
> While a better solution would be to use a class and reference named
> attributes, that would require some bigger changes in the script.
> 
> Instead, make a minimal improvement by assigning the entry[x][y] values to
> intermediate variables. Store them in a dict for easy usage from a format
> string.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

  Series applied to master, thanks.

  It's a bit silly that this has to take a year, but it is what it is...

  Regards,
  Arnout

> ---
> v2: new patch
> 
>   utils/size-stats-compare | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/utils/size-stats-compare b/utils/size-stats-compare
> index a3d7f250c6..de67b72587 100755
> --- a/utils/size-stats-compare
> +++ b/utils/size-stats-compare
> @@ -77,9 +77,16 @@ def print_results(result, threshold):
>       # list_result is a list of tuples: (name, (flag, size difference))
>   
>       for entry in sorted(list_result, key=lambda entry: entry[1][1]):
> -        if threshold is not None and abs(entry[1][1]) <= threshold:
> +
> +        data = dict(
> +            name=entry[0],
> +            action=entry[1][0],
> +            size=entry[1][1],
> +        )
> +
> +        if threshold is not None and abs(data['size']) <= threshold:
>               continue
> -        print('%12s %7s %s' % (entry[1][1], entry[1][0], entry[0]))
> +        print('{size:12d} {action:7s} {name}'.format(**data))
>   
>   
>   # main #########################################################################
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
