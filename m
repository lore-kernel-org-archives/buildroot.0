Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20FEC71159
	for <buildroot@archiver.kernel.org>; Mon, 16 Jun 2025 19:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA3C281141;
	Mon, 16 Jun 2025 19:52:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rIC7fXkOweYX; Mon, 16 Jun 2025 19:51:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF7C08113D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF7C08113D;
	Mon, 16 Jun 2025 19:51:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A864D79
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 19:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B88040B0D
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 19:51:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MPUWvvgpDFJa for <buildroot@buildroot.org>;
 Mon, 16 Jun 2025 19:51:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6D03440ACF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D03440ACF
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6D03440ACF
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 19:51:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4623E1C00D6; Mon, 16 Jun 2025 21:51:55 +0200 (CEST)
Message-ID: <77a07764-6c98-4583-91c1-0c9b5384ec22@rnout.be>
Date: Mon, 16 Jun 2025 21:51:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabien Lehoussel <fabien.lehoussel@smile.fr>, buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
References: <20250613110559.2665663-1-fabien.lehoussel@smile.fr>
 <20250613110559.2665663-3-fabien.lehoussel@smile.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250613110559.2665663-3-fabien.lehoussel@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1750103515; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=2Kqfcnw60l1gPrGWxZqBW3Z3aqeS0hUJiypxqdSGCvE=;
 b=ZuJ7P3LJaWMQ7NNKsOb54UQDVcMTxJixVMd0xthsGK+2sPl/ixfGtyPFQb6pySNZIX1Z0N
 STmWbZiACmc/E/Ux/tr1MA6U45JGMBtcqnVKJUrT+rVZIBGo/ukZToUOtQ6zpFebJkve+r
 6jY5cwj4mg4GKrR1QT9qa33HzAP9HaW8Us3+Qg7AAtxcGmvPowWDwhldby+nxbdsotOKb5
 AXqyNCSq33WaY9dC1ngDeXHmPsWmwlhivaZkVDLSuaMAojQzKM+kYOfBS1kdNKAsx9tstK
 2ATYLHC+5YC7TlZ1UL8G5w01gxkDn+/7hwvzgTIY/QAyASm9E6F2cJez/yQi7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=ZuJ7P3LJ
Subject: Re: [Buildroot] [PATCH 3/7] utils/generate-cyclonedx: move metadata
 section to top level
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



On 13/06/2025 13:05, Fabien Lehoussel via buildroot wrote:
> Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
> ---
>   utils/generate-cyclonedx | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 2c234e1a45..a069f467b6 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -301,6 +301,14 @@ def main():
>           "bomFormat": "CycloneDX",
>           "$schema": f"http://cyclonedx.org/schema/bom-{CYCLONEDX_VERSION}.schema.json",
>           "specVersion": f"{CYCLONEDX_VERSION}",
> +        "metadata": {
> +            "component": {
> +                "bom-ref": "buildroot",
> +                "name": "buildroot",
> +                "type": "firmware",
> +                "version": f"{BR2_VERSION_FULL}",
> +            },
> +        },

  I don't understand the reason for this change... I'm not saying that the 
ordering couldn't be improved, but then it should be a logical choice. This new 
ordering is not alphabetical, and also doesn't following the ordering of the 
spec (or at least, not completely, because the schema puts the $schema property 
first). Actually, that was probably the idea, to follow the ordering of the 
spec, but then please say so in the commit message, and do it for all 
properties. Perhaps also check if the other properties are ordered correctly.

  Regards,
  Arnout

>           "components": [
>               cyclonedx_component(name, comp) for name, comp in filtered_show_info_dict.items()
>           ],
> @@ -310,14 +318,6 @@ def main():
>                 for ref in filtered_show_info_dict],
>           ],
>           "vulnerabilities": cyclonedx_vulnerabilities(show_info_dict),
> -        "metadata": {
> -            "component": {
> -                "bom-ref": "buildroot",
> -                "name": "buildroot",
> -                "type": "firmware",
> -                "version": f"{BR2_VERSION_FULL}",
> -            },
> -        },
>       }
>   
>       args.out_file.write(json.dumps(cyclonedx_dict, indent=2))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
