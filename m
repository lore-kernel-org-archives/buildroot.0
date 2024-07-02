Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9C0C3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F2F3813B7;
	Tue,  2 Jul 2024 07:47:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bcVuoA7ggP7v; Tue,  2 Jul 2024 07:47:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55AA281FD9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55AA281FD9;
	Tue,  2 Jul 2024 07:47:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 85AC71BF365
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 806A96078C
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:47:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vikQZHy5-OFF for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:47:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5969E60670
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5969E60670
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5969E60670
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:47:40 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-36786081ac8so165759f8f.0
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 00:47:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719906458; x=1720511258;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PFC1S9ALJbnDspnwkFsXipvKkhJZWOwTldwAz9gbRE0=;
 b=EL5kqIKwEuTvD312zGDxCJ9R5SlUc5zpzHhMucBuPOeOahj1t2BGpfFXG0ZJEdqos0
 yJkWbG9DXgAtPu0t9MEnbboIQEDQG/SbSCrrTo8G8Fso3agkhufoTnPaM9y+l8w9veMR
 xTorvuU+GAkdy8PHsD2KHAiwTtJAcOjGFdmdftL1j+ihoQvgWsX7+XwpzovDaXo9heOA
 ytwLw9DxA1wVZE6oSQu1W9JvYlNqExDoFVIe+cPdoR2fih4Jbu2j2ZZ9XnTG2q+hqUG5
 QfQ1SyytalC9GCbDfaLIrY/KKbXSah7OFu9QuPG0GgMsHpMLHGSgTSXmLDnK0XpQADuJ
 3+kQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdBlCLOLfYBkIS5L4niinEAlnqbV7gNMytr7ZaPN+YUm1sKhKqYONPVx+MJmC+EhVqNESKP8L0YZMEX40i4XiZA4V0e65IZw==
X-Gm-Message-State: AOJu0YzfPap6U1diK5KRYvVyEOjTQic30Jw2znNfYpiW+J7hlnCabM2u
 yuSe6MwcfBJCAtQkm3fwOsaVhyImbv6O16w/b3suX0Rzr3ERWZyWv8Aiz0afvjQ=
X-Google-Smtp-Source: AGHT+IFjijmJZCyHGsWtYrWAmv3pJFu4tqvakMCYSg7rJFos0HnvDQFBI3KNL8TDIoCj/xzcAM1bdw==
X-Received: by 2002:a5d:5912:0:b0:367:8982:a9aa with SMTP id
 ffacd0b85a97d-3678982aa66mr388004f8f.64.1719906458439; 
 Tue, 02 Jul 2024 00:47:38 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36788e37b53sm909766f8f.45.2024.07.02.00.47.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 00:47:38 -0700 (PDT)
Message-ID: <6068a616-ffde-4918-a0cc-f00968639744@mind.be>
Date: Tue, 2 Jul 2024 09:47:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240701200208.1797634-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240701200208.1797634-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719906458; x=1720511258; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PFC1S9ALJbnDspnwkFsXipvKkhJZWOwTldwAz9gbRE0=;
 b=BMc1LlZMreme31XvvErQZINsprr77Oj3QZyRHiwAf8JRttvaKWXUxPAJQWinLVPPIV
 I/49qJBQrmeUz9yIXU++Zp6E5yksHT8xuP033gbFybQ9qeLTVKTVzdNMiWtmRVwJYRTg
 oqBbMR2YwAxE/hnXIVha4pgF1mwLLvO9A8EsXDzvhHWROKpxXxBp9GRowtyLVYHUg0MN
 5J/E081xsCpnkqmf7UFM/+S2e0Qk53oDLpSnBOtOxuLbgKZInNcVhNHaAh+p9HdiRBcP
 F4hzQOintlGWZH4x2Xon3peUEMfanrR4DP9BoNPYCHHOMO5rHFIEUiKYr98xSPhCjI3n
 121w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BMc1LlZM
Subject: Re: [Buildroot] [PATCH 1/1] package/python-uvicorn: bump to version
 0.30.1
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/07/2024 22:02, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-uvicorn/python-uvicorn.hash | 4 ++--
>   package/python-uvicorn/python-uvicorn.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-uvicorn/python-uvicorn.hash b/package/python-uvicorn/python-uvicorn.hash
> index f002304c3d..318fc65e21 100644
> --- a/package/python-uvicorn/python-uvicorn.hash
> +++ b/package/python-uvicorn/python-uvicorn.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/uvicorn/json
> -md5  88b8d2090026fff2bca6f9f561a07ecb  uvicorn-0.29.0.tar.gz
> -sha256  6a69214c0b6a087462412670b3ef21224fa48cae0e452b5883e8e8bdfdd11dd0  uvicorn-0.29.0.tar.gz
> +md5  a000939f41470e55bad5cec475489b4c  uvicorn-0.30.1.tar.gz
> +sha256  d46cd8e0fd80240baffbcd9ec1012a712938754afcf81bce56c024c1656aece8  uvicorn-0.30.1.tar.gz
>   # Locally computed sha256 checksums
>   sha256  efe1acf3e62fb99c288b0ec73e5a773b7268ef4320fe757ea994214e4b63c371  LICENSE.md
> diff --git a/package/python-uvicorn/python-uvicorn.mk b/package/python-uvicorn/python-uvicorn.mk
> index 04ec4b20d2..092c640abd 100644
> --- a/package/python-uvicorn/python-uvicorn.mk
> +++ b/package/python-uvicorn/python-uvicorn.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_UVICORN_VERSION = 0.29.0
> +PYTHON_UVICORN_VERSION = 0.30.1
>   PYTHON_UVICORN_SOURCE = uvicorn-$(PYTHON_UVICORN_VERSION).tar.gz
> -PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/49/8d/5005d39cd79c9ae87baf7d7aafdcdfe0b13aa69d9a1e3b7f1c984a2ac6d2
> +PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/37/16/9f5ccaa1a76e5bfbaa0c67640e2db8a5214ca08d92a1b427fa1677b3da88
>   PYTHON_UVICORN_SETUP_TYPE = pep517
>   PYTHON_UVICORN_LICENSE = BSD-3-Clause
>   PYTHON_UVICORN_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
