Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A56C02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 10:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98ACE6006A;
	Tue,  4 Feb 2025 10:46:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Re4Hk40daSlY; Tue,  4 Feb 2025 10:46:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A398560608
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A398560608;
	Tue,  4 Feb 2025 10:46:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 802F8185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 10:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6271C40112
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 10:46:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zk2oX-0t1Orr for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 10:46:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9B929400F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B929400F2
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B929400F2
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 10:46:49 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4361c705434so39939805e9.3
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 02:46:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738666007; x=1739270807;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EBoF6j55W0qiA4drIf7937sxHpTWG2ppr/GmdONw1nw=;
 b=qIBtMg0t0WXafrcAmpaOrJP3OY7CUBBaDz0sxZuuiJvE+eZQR90N7UrP4Pnp8W7AMU
 XIWb13oewl3Cj6/Gnv1bwtIIRt+YrwVsaMSZvKPIOCM1Rz8VPUIc2MHTLiLp1vcbAkjG
 V4w/UzV2pQQ+YdIp+lYPfdQvdpxyrkgorNySlCRP+VDr1lwkL5CRvEpTs8+BgVJyWUib
 0Q8T79limqyvfS/uzW7xaZJfSZbc9z8nEqhMrptm9rHKA/TUAaz5YrjsbFzP/7NzytQ5
 Vw6ByEX6bfI4sAE3OCAbrLuqJwkST90pa0G9OsL7r2HAw2EvS9I3+tDV4h1AdmjseHr9
 KhNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXl/z7ABYkFvVoRzHh4xDlY/raMgxqh1Dwgxidh07C+l6Z/tjzHggbJ3lGBne/l/YgkO2CwDB3hgA0=@buildroot.org
X-Gm-Message-State: AOJu0YwJF/gqh16qM3mESGBOZ1FMQ0YaQtL3y6UaWqZAJc458gaAg5kg
 Js5Ed+dKlPr7twiNbuj3BC6yORXJqbyt7rygox2HDNnXldMOL6ZbuyWwhEISxMg=
X-Gm-Gg: ASbGncuwToIi+L+q3+SqzRlfV9WuoRNbNj+zE6eVisr9HcDcxrR7nYxv8kz5mp2kBwD
 OQYcs9QX6iLirgo0pQDvPn3Dpat5cNEwjI/injLxT2+/RdP5ZbnELKFVZqPASs0UWdAnKae+c8w
 shdBXc6SxRhjnQQItA8fpfUW3a8E0U2V6hzDGvmX39tolMiAF2IPX9UqMOTJTEUEwHTKHRQnugm
 KLOWofsogCpzNPgfHjqsnRy4K3G7x0wfudZQopzG4AwAFG5tzISRALnMfJn5+2mwsaP+9iBM9DY
 z3bRZXOJtG+3WQJbpKlBqh1t0/y3qbDFufGxn4cs1SijYDM=
X-Google-Smtp-Source: AGHT+IHuMiTU+GQyQBwVoDJ506tNPt6XL20MJYswEkMfvNO4ggJuKpBv4/kXHhFRy9SCp4HExQUghw==
X-Received: by 2002:a05:600c:154f:b0:434:a367:2bd9 with SMTP id
 5b1f17b1804b1-438dc3ca79fmr246570645e9.14.1738666007135; 
 Tue, 04 Feb 2025 02:46:47 -0800 (PST)
Received: from [172.16.2.111] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1cf853sm15232033f8f.84.2025.02.04.02.46.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 02:46:46 -0800 (PST)
Message-ID: <097abee3-9e7a-4f27-af91-a1ddcf017596@mind.be>
Date: Tue, 4 Feb 2025 11:46:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20250128170954.2441486-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20250128170954.2441486-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738666007; x=1739270807; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EBoF6j55W0qiA4drIf7937sxHpTWG2ppr/GmdONw1nw=;
 b=Znay/TWaztX7FtR9Wd/fftm9VAyxZN80XGyXGRzE5HLaVfYDJnOKFLjR8kpPc5vTwx
 cGDEGj5yMmqSooSx+PvC4pcxD4xmHBdNwLlNcg2xi6Uq4HWybsCRtUnm0cGklfAvfaz4
 TKP43iGyyBE7ttwo8MWrjq0TyNmGg95ELD30ALsRCAtvU/m70uV2zL0Dv685aU4Wbn+r
 xIKgNsrFvK5jpMdFqFuso+/oRYkvrz+C1NKvW/1O7zMgA3FSuqVtg6rwtXc1K3Vl3Lu2
 3lJFTqhTnqdtPU1KYOwQWanYJIWPOS3Rd+kAtGKmGBQF2334+iEQ57eZ4Phazazo/DLn
 owrQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Znay/TWa
Subject: Re: [Buildroot] [PATCH 1/1] package/python-google-api-core: bump to
 version 2.24.1
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 28/01/2025 18:09, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-google-api-core/python-google-api-core.hash | 4 ++--
>   package/python-google-api-core/python-google-api-core.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-google-api-core/python-google-api-core.hash b/package/python-google-api-core/python-google-api-core.hash
> index 43bf50a5f2..0e85aaba63 100644
> --- a/package/python-google-api-core/python-google-api-core.hash
> +++ b/package/python-google-api-core/python-google-api-core.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/google-api-core/json
> -md5  5e5fbe5e5e6b14b9243b74055b8a50b4  google_api_core-2.24.0.tar.gz
> -sha256  e255640547a597a4da010876d333208ddac417d60add22b6851a0c66a831fcaf  google_api_core-2.24.0.tar.gz
> +md5  f7cd117d2933fb5874fd5162f60cd720  google_api_core-2.24.1.tar.gz
> +sha256  f8b36f5456ab0dd99a1b693a40a31d1e7757beea380ad1b38faaf8941eae9d8a  google_api_core-2.24.1.tar.gz
>   # Locally computed sha256 checksums
>   sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/python-google-api-core/python-google-api-core.mk b/package/python-google-api-core/python-google-api-core.mk
> index d79d0eb749..f772dbf46d 100644
> --- a/package/python-google-api-core/python-google-api-core.mk
> +++ b/package/python-google-api-core/python-google-api-core.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_GOOGLE_API_CORE_VERSION = 2.24.0
> +PYTHON_GOOGLE_API_CORE_VERSION = 2.24.1
>   PYTHON_GOOGLE_API_CORE_SOURCE = google_api_core-$(PYTHON_GOOGLE_API_CORE_VERSION).tar.gz
> -PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/81/56/d70d66ed1b5ab5f6c27bf80ec889585ad8f865ff32acbafd3b2ef0bfb5d0
> +PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/b8/b7/481c83223d7b4f02c7651713fceca648fa3336e1571b9804713f66bca2d8
>   PYTHON_GOOGLE_API_CORE_SETUP_TYPE = setuptools
>   PYTHON_GOOGLE_API_CORE_LICENSE = Apache-2.0
>   PYTHON_GOOGLE_API_CORE_LICENSE_FILES = LICENSE

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
