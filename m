Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3679AFF8855
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 19:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 015174047B;
	Tue,  5 May 2026 19:44:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ki5nA7P_7Z46; Tue,  5 May 2026 19:44:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E51B404FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778010247;
	bh=Nb1RQqUfM1LRz0y7/rZZr4BCDxG1TmzdmnyQcEm2ito=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LbCgltI79VaLoJYbPJfbwLjoK2kqzBK0Ws1qwTFo5V4YbBf+t1P32OQQpDoxnE/YR
	 iqAACPXa1DCwbscG+a3apl/9iUEd4HPneUu9s98XLUWK0apodphcxah+nrRimXb3O4
	 mqN4mSLJ3l/KuyorzpkJyr5VbgDrwrpQ/I87QJ+ZFBRyiQQh4EETysQgAnt1O4SROf
	 c4QiKwlJ4I0yUHj7WBggDuVhyoN+vKa1jLMoH+ZZ53Nf3hkaUNoqEW0gMx1AqQAMz3
	 pn64sAuZBXj7sZw5VO0+oM/JHGouPI/9qeGSmThZL8+huMjVS2e8hyqpDSDjFLBsjd
	 zx+6PnxcN1HCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E51B404FF;
	Tue,  5 May 2026 19:44:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 248DD2A8
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 168AC81395
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:44:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LnPtP2MayF_h for <buildroot@buildroot.org>;
 Tue,  5 May 2026 19:44:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 53CE481370
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53CE481370
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 53CE481370
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:44:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D2DEDB97C2C8; Tue,  5 May 2026 21:44:02 +0200 (CEST)
Message-ID: <33f70702-9c51-4713-8ad5-dba6d1d15f3e@rnout.be>
Date: Tue, 5 May 2026 21:44:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>
References: <20260426153334.1026982-1-fiona.klute@gmx.de>
 <20260426153334.1026982-3-fiona.klute@gmx.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260426153334.1026982-3-fiona.klute@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1778010243; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=zigWQ7oTL2BL520wM2SNGW2xXlZgeQwFInHpQ74Dl8o=;
 b=CRGzSO18PLWsfkT4HcQ4WNnuSd/Mj65DAJha3XawPJAUbE7ZfAwFFD+wCpeqGng7IASsgZ
 v2IOMCtdM9oS+VI5TAo36RbHR+orOjcKGqNWNtQ6YWoM8pKRj+PLnFOo/D/NzygYQyPm6Z
 coqI3jn4Ktv/HaO4qXzZU/vdnTj/GKxAuopPa9IItGuommSkwtGzjz/OCIDub6Wx6d5IC+
 d1YXRoKe3AZSZr1v8uurVN9dnZwd6kMvA+/nD7W4GMOO7W9aAWaRlUcftO5e24oLdwVXOA
 asQC2eFGp1lyBK1xT5wsnflR01m/a0cL0mJwMmHw/wE45AFTllfsTqxrv5CUbg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=CRGzSO18
Subject: Re: [Buildroot] [PATCH v2 2/6] support/scripts/pkg-stats: format
 upstream URL info consistently in HTML
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/04/2026 17:33, Fiona Klute via buildroot wrote:
> Use only one of the classes for "error" or "warning" status so they
> look different, and format the error/warning text for both. Do not
> make the text a link if the URL is None.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

  Applied to master, thanks.

> ---
>   support/scripts/pkg-stats | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index efb85a7405..a87bb23a8e 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -1057,14 +1057,19 @@ def dump_html_pkg(f, pkg):
>       div_class = ["centered upstream_url data"]
>       div_class.append(f'_{pkg_css_class}')
>       url_str = pkg.status['url'][1]

  It looks like this could have been used below instead of repeating 
pkg.status['url'][1]. But I'm too lazy to test so I left it unchanged.

  Regards,
  Arnout

> -    if pkg.status['url'][0] in ("error", "warning"):
> -        div_class.append("missing_url")
> -    if pkg.status['url'][0] == "error":
> -        div_class.append("invalid_url")
> -        url_str = f"""<a href="{pkg.url}">{pkg.status['url'][1]}</a>"""
> -    else:
> +    if pkg.status['url'][0] == "ok":
>           div_class.append("good_url")
>           url_str = f'<a href="{pkg.url}">Link</a>'
> +    else:
> +        if pkg.status['url'][0] == "warning":
> +            div_class.append("missing_url")
> +        else:
> +            # "error" status
> +            div_class.append("invalid_url")
> +        if pkg.url is not None:
> +            url_str = f"""<a href="{pkg.url}">{pkg.status['url'][1]}</a>"""
> +        else:
> +            url_str = pkg.status['url'][1]
>       f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)}">{url_str}</div>\n')
>   
>       # CVEs

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
