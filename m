Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 600F6E95367
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 10:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C29D60A6F;
	Wed,  4 Feb 2026 10:01:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8idsFv_3cYbm; Wed,  4 Feb 2026 10:01:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3903860A96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770199261;
	bh=XFjNd5ccgHNrvJCAuYW5G8vkhSeHY8rcnYsoeaVViUA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=T0mfINTlzg8Q/4b7zBiaW3jgqjza+pCKVBARVpQ02OtMUh56wuxNgXDgZzQcfzn/8
	 XiD6+ACf8Wd4Ab5j/Vn7wH9Uj5WeUzarjSW0eAL/wl/sAhvKZufYdrzihnew8xNDlu
	 PiuE2DAvvLeZb+ZWk42r4fDGX3Zj4Gf0HxOak1C/1qFrfP3UnERd9UWB76nDKRrorG
	 4x/KNsQ9qkoOWU0tZrPGj46OLFDNdr9c9ahCTmVJRdfNSn0lUkrMbT7BXqxQSCAOym
	 FTQfXBT8TXeJEBYMnEs5STAY7RPi0HoWFv4jzgVAgsQP1+fvqM+nfQTOc53XcK3aE9
	 yTcSOSh76EY3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3903860A96;
	Wed,  4 Feb 2026 10:01:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 17ADEF4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED4CA81916
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:00:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 16RE88hB9nWe for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 10:00:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 257AF81911
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 257AF81911
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 257AF81911
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:00:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2B097B97ADD3; Wed,  4 Feb 2026 11:00:53 +0100 (CET)
Message-ID: <4cd77dd9-de62-4348-a6c2-c8cc60bc05f6@rnout.be>
Date: Wed, 4 Feb 2026 11:00:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kadambini Nema <kadambini.nema@gmail.com>, buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>
References: <20250515083640.49630-1-kadambini.nema@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250515083640.49630-1-kadambini.nema@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1770199253; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=IY/7wVseXkdw5GB6D/smZXSRN9A6fiRZtV6vyBVtcDQ=;
 b=cld3lyhvdlulepaopWLtwmxCZquLCdQ7aS79Inrekgz1RYgQj4JTCf7kcA8TAdNFBRW3kw
 oRxhEVJ7MZXff4eKalDpX37fFUcVBLBZSGQVSJHOArjPNckHU12PtZ88/DlEF8H+1zmbUk
 PKlhCvkJWku3+QDuAzIRZsqn4fRw5KBCrNeuFJPbcHKcQ3Vc3EbYQypDs3Z1fgEGpB0FZ7
 07vwpZJCzaDUENQLduyTy6RgCdy9S5N16it1oSp1fZ5PnuvtPVf0dHjs6s31uFc+b2VavU
 GrfP6ynO9+txMo7HQEgLOHqSDDbEdge0kNt2YOiIhOjEAWOogZUOaPxEyhuElQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=cld3lyhv
Subject: Re: [Buildroot] [PATCH 1/1] support/scripts/pkg-stats: add
 -N/--needs-update option
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



On 15/05/2025 10:36, Kadambini Nema wrote:
> This commit adds the -N/--needs-update option, disabled by default,
> to list only packages with newer upstream versions. All other packages
> will be excluded from the HTML or JSON output.
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

  Applied to masgter, thanks!

  Regards,
  Arnout

> ---
>   support/scripts/pkg-stats | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 46b12cd992..c22a8e724f 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -1280,12 +1280,22 @@ def parse_args():
>                           default=[])
>       parser.add_argument('-v', '--verbose', dest='verbose', action='store_true',
>                           help='Increase verbosity')
> +    parser.add_argument('-N', '--needs-update', dest='needs_update', action='store_true',
> +                        help='Only include packages with newer versions available')
>       args = parser.parse_args()
>       if not args.html and not args.json:
>           parser.error('at least one of --html or --json (or both) is required')
>       return args
>   
>   
> +def is_newer_version_available(pkg):
> +    return not (
> +        pkg.latest_version['status'] in (RM_API_STATUS_ERROR, RM_API_STATUS_NOT_FOUND) or
> +        pkg.latest_version['version'] is None or
> +        pkg.latest_version['version'] == pkg.current_version
> +    )
> +
> +
>   def __main__():
>       global cvecheck
>   
> @@ -1341,6 +1351,8 @@ def __main__():
>       if "cve" not in args.disable and args.nvd_path:
>           print("Checking packages CVEs")
>           check_package_cves(args.nvd_path, packages)
> +    if args.needs_update:
> +        packages = [pkg for pkg in packages if is_newer_version_available(pkg)]
>       print("Calculate stats")
>       stats = calculate_stats(packages)
>       if args.html:

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
