Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5493CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 16:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DF814002D;
	Sun,  7 Apr 2024 16:03:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uuyyEy5bz-le; Sun,  7 Apr 2024 16:03:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 167CD410CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 167CD410CA;
	Sun,  7 Apr 2024 16:03:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9A9171BF2CC
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 16:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87B8F82040
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 16:03:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kERlfB5Q_zxe for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 16:03:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4BC2B8203E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BC2B8203E
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4BC2B8203E
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 16:03:17 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-415446af364so27090525e9.0
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 09:03:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712505796; x=1713110596;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3maXZKIWCOGMpntgxjuaZmPnAOAaq1UMosfB9mYyF2k=;
 b=oSvGbJAGReOC9ZAr/m9o8NzHMk7kyv+QBMaWreuLoSjTMnnsIsBh5sX8ebZtZHlQo9
 pEDiNTMHoSXBc1vLQ9yv+kFbc7fF6YMGCrxt3u7QQgDz+7RJgXsqWpn73PkSbziqyafj
 +9I2X9YF9LvtKG+9aIq4qfnvFHdSngJFkH2shRprxBpqhxNHSyixSJrgRvlwUALh15WW
 g8a+UuaRfXWDVYCMMT+EMwtuz9/v0C/N9ZqgBvLSn1+4GLq4oblKcEYwaUrAfKBt2cqM
 ZC2/RRBo1TTjDItdred2GSV/sepba1kA33xA0eVGpLKC78PXm4IPIeRCkC3TIGp4hgRZ
 HMYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6rqMLmsfWwnTB9PT5ztAKVq+Jn6ltPivzljON7JBl/4zmrpgQYr61/+dWAPdoUqKq0OcqE8vCm4pPPH5KLANH45ns5vB0uw==
X-Gm-Message-State: AOJu0YyBurlZUADRfyxljI+gNi964f07rowf+Sg0dNIcodC+WI24lihY
 f+r8Lp1SouHkkDbfyhDvWimDtaBZsPCWSgmjy9tLqCx5oVnbAXVh70G7ARoC4IQ=
X-Google-Smtp-Source: AGHT+IGanYGwr6StVKPMjSqoKnMbU9WrvUoM3qlTIG/q+Up//lJdTcx+NzEYbxlCfO4kDJIlQt0Cyw==
X-Received: by 2002:a5d:410e:0:b0:343:d7fe:96f8 with SMTP id
 l14-20020a5d410e000000b00343d7fe96f8mr6126414wrp.19.1712505795943; 
 Sun, 07 Apr 2024 09:03:15 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 c8-20020adfe748000000b00343a0e2375esm6906581wrn.27.2024.04.07.09.03.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 09:03:15 -0700 (PDT)
Message-ID: <597fe4d9-17ba-45e5-9208-cdd1a4359dfc@mind.be>
Date: Sun, 7 Apr 2024 18:03:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sen Hastings <sen@hastings.org>, buildroot@buildroot.org
References: <20240305093334.2233237-1-sen@hastings.org>
Content-Language: en-GB
In-Reply-To: <20240305093334.2233237-1-sen@hastings.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712505796; x=1713110596; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3maXZKIWCOGMpntgxjuaZmPnAOAaq1UMosfB9mYyF2k=;
 b=IYNxmpqUrCTPu1LTtuuFtIntox3jxdmyHXukRCLlpa2bQX5coEgmFi7yifh5imOu/T
 gaLXEGSiFGuHCx8kOch9bMhxTzvaitlihnr0jtH3uzN6z5gfWYLqtyktLbcq/JqKbmPA
 N67NUM744cu9Xe5SHHBieDpY7NP3LregvPhj5BppplELYCG1MrLeBXEjf16WLQApJRc/
 vDDIzHd+1APlbPqYnvpiHLv6oPUXervNpknSga0acnRsa5rKLAgr7gsydo1NEK/bwTuL
 hjtChl/y0+QfCNMV07cuMUyayIUrWN5LdBjgQ60hMoQqxQn1ThpITcA5d0iILOJr3XaS
 nKfw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IYNxmpqU
Subject: Re: [Buildroot] [PATCH v2 1/1] support/scripts/pkg-stats:
 fix/improve git hash sorting
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



On 05/03/2024 10:33, Sen Hastings wrote:
> sortGrid()'s handling of git hashes and other large hex numbers
> has been inconsistent, they can be detected as strings or numbers
> depending on what type of character they start with.
> This patch fixes the behaviour by using a regex to capture everything
> that looks like a big hex number and treat it as a string.
> This means when you sort by current version ascending all the version
> strings with big hex numbers should show up first, sorted 0-9,a-f.
> 
> First we check for a string length >= 39, and then apply a regex
> to return an array with every char from that string that matched
> the regex. If the length of this array is still >= 39 we can assume
> we are looking at something containing a git hash.
> 
> The reason why the length is defined as ">= 39" and not "40" or
> "39 or 40" is twofold:
> 
> Firstly, 39 was chosen as a minimum to match stuff with 39 char git
> hashes, like the rockchip-mali package.
> 
> Secondly, there is no max because we actually want to catch not
> just explicitly git hashes, but any verson string with big gnarly
> hex numbers in it.
> Stuff like: "1.4.2-168-ged3039cdbeeb28fc0011c3585d8f7dfb91038292"
> 
> Why? Well, the idea is less about git hashes and sorting
> and more about grouping similarly formatted version strings.
> 
> It would be impossble (or at least annoyingly complicated) and of
> dubious utility to get a real sequential sort out of the
> current version column, so the attempt here is to at the very
> least collect all the similarly formatted things together.
> 
> This isn't perfect, but it's a (arguably) more useful sorted
> output than before.
> 
> A demo is available here:
> https://sen-h.codeberg.page/pkg-stats-demos/@pages/fix-improve-git-hash-sorting.html
> 
> Signed-off-by: Sen Hastings <sen@hastings.org>

  Applied to master, thanks.

  That said, sorting by version is of no practical value, because the versions 
of different packages bear absolutely no relation with each other. So maybe it's 
more useful to disable the sorting entirely in the Current version, Latest 
version, and CPE ID columns.

  Regards,
  Arnout

> ---
> Changes v1 -> v2:
>    - more detailed commit log (requested by Yann E. MORIN)
> ---
>   support/scripts/pkg-stats | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 3295eb7a48..4dc1857a9e 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -741,6 +741,7 @@ addedCSSRules.forEach(rule => styleSheet.insertRule(rule));
>   function sortGrid(sortLabel){
>   	let i = 0;
>   	let pkgSortArray = [], sortedPkgArray = [], pkgStringSortArray = [], pkgNumSortArray = [];
> +	const git_hash_regex = /[a-f,0-9]/gi;
>   	const columnValues = Array.from(document.getElementsByClassName(sortLabel));
>   	const columnName = document.getElementById(sortLabel);
>   	let lastStyle = document.getElementById("sort-css");
> @@ -765,7 +766,9 @@ function sortGrid(sortLabel){
>                   pkgSortArray.push(sortArr);
>           });
>           pkgSortArray.forEach((listing) => {
> -                if ( isNaN(parseInt(listing[1], 10)) ){
> +                if ( listing[1].length >= 39 && listing[1].match(git_hash_regex).length >= 39){
> +                        pkgStringSortArray.push(listing);
> +		} else if ( isNaN(parseInt(listing[1], 10)) ){
>                           pkgStringSortArray.push(listing);
>                   } else {
>                           listing[1] = parseFloat(listing[1]);
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
