Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75896FD8FC3
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 15:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EC8B8238B;
	Thu, 26 Feb 2026 15:17:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GkaTejJSx1HV; Thu, 26 Feb 2026 15:17:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E885822F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772119035;
	bh=ap/uAnYtpbtxkvQfcP9GaVY+Nh85N8o64NTZdRyQYm4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=btsj7viN/DjLuV5rSZOzN3BvCDarCczF9AJVukfdbeR1lZosdk36KObfdIxDIImuC
	 nAmBNRe7FOtFTJwYGbuo6hSVV914C5lEtdiChMwQThJ6VcPg4LfOJQQyoy8K6G2PnU
	 kJPGdzG8tAiHEMRohYgSF8Osm/RiN674/UbaX4PBJVTmsAYiBqZwYVhuVxw032ueZg
	 cvbdBcfUEQjLRj1GM/IkicwlRG8mmiQHXDTmOc9JUsOhuiRpTQxbJb6vWWw9yH5GFj
	 TloXsdVENMomrhcVy9oXo1SEiJEe3dU/kdD6bfcWNUnWImbUYgFtp2n0w2IkZ5lGum
	 I0g0oRzK8pFkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E885822F0;
	Thu, 26 Feb 2026 15:17:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6ABCD24E
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FABD60B4C
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:17:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VnVtDz_CymW6 for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 15:17:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 48CBC614D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48CBC614D4
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 48CBC614D4
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:17:11 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4833115090dso10310875e9.3
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 07:17:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772119030; x=1772723830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8qYBmoASltxIJgytDFexjzcWY+zlLi6fhcRG199q9fg=;
 b=sVLDXD5eJc+AXIvDe04u6pHiNdOpNGoX3skYfFnQLE8rJV3atJB08uA4olavBpVzmT
 GMd1NVoWyRKsKAjOVrWaduWrFalRMak5PegPL+wHm/GKvxW0WATr0d374sF327zn2N84
 cMUa0yf+VfH4pIzgV+U/5Sd3Ove2EILPeVSm/tzBaD+QwV7Uf9peGd/DtegmaAzzSGwK
 6FV0owGmEgyUwU97iakTYNYp0cNWomWGTB5JlBcdgXU3KEUrKC3IZ9aBsd19ARxe1Xky
 nxTgyD81DrnvLFhzQSDtfvpI7pwygkcxL6e7GWbTklHSM/Nl98u1qJAcAEpNpzKM1cNB
 Y2lA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXn/NKyYr+dhFCKnZxYB1204dBWoRktECzY7DtSCbr2gMORqZ8GV53fjqgU8fnhUYibq/tW5n5q/+0=@buildroot.org
X-Gm-Message-State: AOJu0YxpeQTMH5zSYHoZA40Gaf3pwZlHoO1QqMeYV1+QsUhrphxFax5p
 MapNON349o/FsINolWIM323so1a3Nq4nwwBnjcTUT4/d3thCH26ykhfSQOJ76/Ep4vD1qBz7BYx
 qf8Qs
X-Gm-Gg: ATEYQzz0SbCoNlb1c9siiZKWpFi5be1Y2s8bIyiRmGm0mZCLr5oAkJ2Y13IKhQgwkl5
 VsISqSeA9NFWA6MeEC9rqESFEYn3fopb2TEoifjinl6B0z24oSH9HtLlmeW549XHqv6OPGULoIY
 LMjgZpX+6uL241rMpWhLkO4zHFJBXH4Kx3FMALsBx1tJmxaMU+RkOhkI9p11W2viuLaBIa6EzAg
 Vnf1/DPTpAEhFmDIOh6u2btSBnlv3LIyregXf30aaDFcz/PqmvrFHELTl5HCT8H5ekQbpKK/yka
 AXn+xhpZpLli5OHlEVOCEwFL38adno1Pdm3IQ5tzLoRiBTVjvWTn8Hm7Qpjep0bvsgVDjITxeLV
 /a/9a9Gzo9NiM3chR0awQxuXmkLs5eFGNTlB73sc7ySLfwbbbiXU+eR0vNZ/ceLrhvkCXA92+i9
 zEqJ0ZttKm0K8/sCI=
X-Received: by 2002:a05:600c:1d1a:b0:483:361b:deff with SMTP id
 5b1f17b1804b1-483c3dc4db1mr40495005e9.14.1772119029644; 
 Thu, 26 Feb 2026 07:17:09 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfcbf794sm37876835e9.21.2026.02.26.07.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 07:17:09 -0800 (PST)
To: Martin Willi <martin@strongswan.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Feb 2026 16:17:08 +0100
Message-ID: <20260226151708.188915-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226142023.1064241-5-martin@strongswan.org>
References: <20260226142023.1064241-5-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772119030; x=1772723830; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8qYBmoASltxIJgytDFexjzcWY+zlLi6fhcRG199q9fg=;
 b=fFxbl3HqhjU5Ok7AC/ddqEulsuH6hq2+rbyEK4ipH4UuniSkAWdt+2ArZiwjr+g2Dg
 HgY1uyraRfetzlLxMaSuQcgn6Bz0j3f2PyTGkQjdvxyKF4PRSwwsbDvZ9KM3zieKCLx/
 evNFFzykK6RQUKxP2sKc5HcA5qPslsWVAygnZbpykuY/frGBiqkXokO6hI0VYqFaFqmY
 4v5C/vzzvbWvZlYU7tIyM9R3R1yAglri1rYzJaE2BZvwoD5lYa447GbTrU/MlC4s12uu
 xQSsWEclVS3GjFzvUD7ryKJAyp5+4jDQr1hpcbQ0UEB9ESka0+77YapcrnCZyu8jFClq
 +qUA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=fFxbl3Hq
Subject: Re: [Buildroot] [PATCH 4/8] utils/generate-cyclonedx: allow
 filtering host packages from SBOM
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Martin,

Thanks for your submission. I havn't had the time to check everything yet but I
think here the issue with the host package filtering is the same as this patch
[1][2] from Fabien Lehoussel.

[1] https://lore.kernel.org/r/<20260102150757.1480511-3-fabien.lehoussel@smile.fr>
[2] https://lore.kernel.org/r/<20260102160348.712155-1-thomas.perale@mind.be>

PERALE Thomas

In reply of:
> Including build dependencies in SBOMs can be useful, but some use cases prefer
> excluding them. Add --no-host to exclude host packages from the generated
> CycloneDX SBOM. Host packages are filtered via the type property from the
> show-info output, with the exception of toolchain packages identified by their
> prefix.
> 
> Signed-off-by: Martin Willi <martin@strongswan.org>

> ---
>  utils/generate-cyclonedx | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index b728e9883dec..534177bd6902 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -441,6 +441,8 @@ def main():
>                          help="Patch diff mode (default:'inline')")
>      parser.add_argument("--no-skeleton", default=False, action='store_true',
>                          help="Excludes skeleton packages from the CycloneDX output")
> +    parser.add_argument("--no-host", default=False, action='store_true',
> +                        help="Excludes host packages from the CycloneDX output")
>      parser.add_argument("--project-name", type=str, default="buildroot",
>                          help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
>      parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
> @@ -469,6 +471,11 @@ def main():
>              k: v for k, v in filtered_show_info_dict.items()
>              if not k.startswith("skeleton-")
>          }
> +    if args.no_host:
> +        filtered_show_info_dict = {
> +            k: v for k, v in filtered_show_info_dict.items()
> +            if v["type"] != "host" and not k.startswith("toolchain-")
> +        }
>  
>      cyclonedx_dict = {
>          "bomFormat": "CycloneDX",
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
