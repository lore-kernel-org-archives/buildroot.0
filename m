Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C18CA0EE4
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B15F80E10;
	Thu, 14 Aug 2025 20:31:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jVTOaf-Hqcai; Thu, 14 Aug 2025 20:31:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A376180DB4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A376180DB4;
	Thu, 14 Aug 2025 20:31:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 211C41BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08825402F8
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AStUMi14jikJ for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:31:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1E7CE4022A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E7CE4022A
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E7CE4022A
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:49 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6188b657bddso2531549a12.1
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:31:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755203508; x=1755808308;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+75c8L0NRXuHXkAi1hgrF+Zi2SzA8Xc8oUprTd3x/QM=;
 b=Ci4JmTWs1U2bU6/uSOQXvq9oJAwdXegNjSs4PmMhiPnams5ANapbuxgdqiTFJv6VY8
 gdwxj2m/C2ZhyP6Q3bwp7C28qpVT+t3jzTlcZelrkmRmAAavCAlmUNXQGJEA/r56aD2p
 qnhbI4ULX9r22ASdceiQj813TXK1FARoVobxxoCic36peMATVxA0dz7vdpGe57XJS7q8
 kH2HjUVhjLun8U3RncNBoNdZ1LAvm7G1lRR58C2h6WZePjBY1S2h5FNn+AsZn4PFHTLD
 rplA07pwyH+/JMzsHy/wOM2KBxhuRN+aTMlxuUxdRj+Aju3XlAQ1Xxv2yoQhAVW+KA4M
 +Y2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaAjCfpW4v6WLuHfexCXzqWLN8L181uW+ERnHkxzunb05bKkY5icy25knPzZ1z0Hc1+4qBI6nqkAU=@buildroot.org
X-Gm-Message-State: AOJu0Yz9nCLWP8vcKEVKfaVIu1PtHbYHaOyDcjeBfheCcFwbPm2zDoPW
 GCLE4FBS0V9rz5bIbDLk/09R2K9J+/9EXNnd0Xz6R7pTwi8HLk6Ofqr2SAfYKxeAtkk2/Jutzuk
 DIX1DpPA=
X-Gm-Gg: ASbGncu+Dy/TuZjsTILDwhRycQ+yNuBDYD+xKqvlcDQNPErQdbf/XDU4MoBxI1iRe7Z
 8ITYXbrQH4Rvq6Zhz1LihRWJXTH5V+tAjOW9AuXQyw8Kj7wjergDMztx2wGNeHO1dBdRXwCv87z
 gLRcYzadm3CaZhDCK5Z0OHLR7FA/nsDkGpEfD+kpr0xzaY/HagRkvOJP3+bIU6LNBx07iNGD3Gk
 6f2P/oqC6mrreiN51bY12gootX9ayjbShk+CRyIcv3J1Vk7bVAIG4PPswBrbFShMWqte0sQn3rD
 3dTX2mdHrFCY6TMBUjeoj/NHznL1wqzcIKJC8Z7ICqfgwVQqiYsMu9bC1fU9rVwbiyJgeHvSw+/
 l8ZbIu0rDO6FnlA==
X-Google-Smtp-Source: AGHT+IHC2EhnxZcbblcpH6S978aLl1tsctBbTWisKsvtBKSlo4PNdRdZgY+LbAMLdBGdBwWkNK6z7g==
X-Received: by 2002:a17:907:1c95:b0:ae0:d78a:2366 with SMTP id
 a640c23a62f3a-afcb93940efmr499884666b.4.1755203508118; 
 Thu, 14 Aug 2025 13:31:48 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a38aasm2657128666b.37.2025.08.14.13.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 13:31:47 -0700 (PDT)
To: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 14 Aug 2025 22:31:46 +0200
Message-ID: <20250814203146.2815354-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716093401.1213358-4-fabien.lehoussel@smile.fr>
References: <20250716093401.1213358-4-fabien.lehoussel@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755203508; x=1755808308; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+75c8L0NRXuHXkAi1hgrF+Zi2SzA8Xc8oUprTd3x/QM=;
 b=elsnyBdqc7MaQ6uFKY94OcRwT9AnuGJ3C5KQhpzB4OMIpjMqJLXX8jJ9YpbSYUNfHZ
 NRiPp8FxVShdKzoq8owRvDcypoI6MXBZCqNzn6kVcoXNQu3hrEGHLzKqmv7ZPBWyXTwb
 I2T9KspNFC+EIH6HiAkbbDVDFmSv4RqGSNFqrCwXtWIpADl+1FhNcAkjNrccV5TEu1Zn
 nHpJZBaGTZzzMSwFSHKna7mEkgTOMGZrgm7r68vq8SLnoNDHb3xApuiwNdxg6FiPWvBi
 MxMsHePXtIV+Pgl1FUmURwI7FMEo6kdjbLtqJ3rbZa2I/xBwAEpi1lQPZEqVXTeYG03h
 Hz8Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=elsnyBdq
Subject: Re: [Buildroot] [PATCH v2 4/5] utils/generate-cyclonedx: add
 project name and version options
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

In reply of:
> Options used to customize the project name and version in the generated SBOM metadata.
> Sets buildroot generate-cyclonedx as a tool in the metadata section
> 
> Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  utils/generate-cyclonedx | 27 ++++++++++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index d3acf755e1..d28750735f 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -278,6 +278,11 @@ def main():
>      parser.add_argument("-o", "--out-file", nargs="?", type=argparse.FileType("w"),
>                          default=sys.stdout)
>  
> +    parser.add_argument("--project-name", type=str, default="buildroot",
> +                        help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
> +    parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
> +                        help="Specify the project version to use in the SBOM metadata (default: builroot version)")
> +
>      parser.add_argument("--no-host-packages", default=False, action='store_true',
>                          help="This option excludes host packages from the CycloneDX output")
>  
> @@ -300,11 +305,27 @@ def main():
>          "specVersion": f"{CYCLONEDX_VERSION}",
>          "metadata": {
>              "component": {
> -                "bom-ref": "buildroot",
> -                "name": "buildroot",
> +                "bom-ref": args.project_name,
> +                "name": args.project_name,
> +                "version": args.project_version,
>                  "type": "firmware",
> -                "version": f"{BR2_VERSION_FULL}",
>              },
> +            "tools": {
> +                "components": [
> +                    {
> +                        "type": "application",
> +                        "name": "Buildroot generate-cyclonedx",
> +                        "version": f"{BR2_VERSION_FULL}",
> +                        "licenses": [
> +                            {
> +                                "license": {
> +                                    "id": "GPL-2.0"
> +                                }
> +                            }
> +                        ]
> +                    }
> +                ],
> +            }
>          },
>          "components": [
>              cyclonedx_component(name, comp) for name, comp in filtered_show_info_dict.items()
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
