Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8E1C02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 18:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76C8E4126D;
	Mon,  3 Feb 2025 18:46:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3xJy2V5ATGB2; Mon,  3 Feb 2025 18:46:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EDCD41268
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EDCD41268;
	Mon,  3 Feb 2025 18:46:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id ABF35185
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 18:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99954820D4
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 18:46:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XGd3DkuDFMC2 for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 18:46:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ACEEA82102
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACEEA82102
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ACEEA82102
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 18:46:03 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-436249df846so32714695e9.3
 for <buildroot@buildroot.org>; Mon, 03 Feb 2025 10:46:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738608362; x=1739213162;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hhL04hcNzn6LhrKZQbQ05awk6ge9h9FRcmGLsyyaw/Y=;
 b=vHU9X+ptMDkx2IWHJl7hRkLl6PoQhK7QUE63iMP38j54mMh1gR3o/w6xhsxWp3Efbp
 i+1IQXG1yc/FzjGpX9bL5rqZnTdQtZTFpP7qUTPYXAf0WYFqct7tEuFlWUGKCe9IjKYS
 zX63IwlKksvEdk/E9N9ZvbET3VDrHezRn4LqsOcW9sqLCC4QrC7IatOs/X/pdpBLK7mZ
 yAWeeVkjEWsNi/e8q31DZCmMAPn1dcQ/lkKcND8yQmAWzgCxrNvwtMTLUviiRdYaJCBi
 N38Ux9l/z5ITt9G9S6dWzcb+fLztFk/NfqOQaPvqijvnq27TUFzcU1a3X9hOo8OY9o8f
 BBEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrwCz364N9au8ftxdCzLIXlJincwWpMe8rdlI2paQudX8pWPV3leKslR+xXCj2mJndWnXNIbX/c+A=@buildroot.org
X-Gm-Message-State: AOJu0YylwP0vwkkPAWj/uo8kf1gDOgd95Eu9qia8OVCdMfvjeS3LfZ2L
 agiWqB3j+AVEt7a+zCIZZHaPs9BgqvgF0o4hl6ceWPOamLiGzcn2ZD7mcvnkWtshlERPi2nCkYZ
 8
X-Gm-Gg: ASbGncsM2g92fe0DHy8v5bqXW+7MIgkTnsDhTHn8EwhdUi4qpdXMBR9tP9HNgEUQcCw
 NzQBeV1LkpJggkIHLdyDSC60v6aFtmcUrEYbqCDcQm8GSpg0HNb/E2HlFUCUsWr1YplNRxvrqZW
 GPV02r6wk0BAXx6g56brbQBgghJJ8nHkPGPud8pCPL0xYSQjDn9X+IXXMnBIJqzqzenhi+1pe9i
 rdlVkJmlf9J7CFSq6aKQkXcH+gP3RdhsVpwI0EEOk/KsWGe6AzqIASXNlxaFRuMEmOUT/2a7FHM
 cvt48iA/ZIm+enVxs9qZdK8zDEs5EXErSNjUeB3NxSMsJ7ebrEJuFM+j9w==
X-Google-Smtp-Source: AGHT+IHaeJoLQsR8xtXKG9WrQTbugGg25lztuhnoULZOOqL4hVgypspYcMbkMo43SC1sUZcilYYtqA==
X-Received: by 2002:a05:600c:1d07:b0:434:f219:6b28 with SMTP id
 5b1f17b1804b1-438dc40ff6fmr181514105e9.24.1738608361598; 
 Mon, 03 Feb 2025 10:46:01 -0800 (PST)
Received: from [10.11.2.38] (220.211-78-194.adsl-static.isp.belgacom.be.
 [194.78.211.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc13151sm197830575e9.1.2025.02.03.10.46.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 10:46:01 -0800 (PST)
Message-ID: <859bc274-6fa1-4a14-b61d-f7b2af36e25d@mind.be>
Date: Mon, 3 Feb 2025 19:45:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
References: <20250102100854.8937-1-adam.duskett@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20250102100854.8937-1-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738608362; x=1739213162; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hhL04hcNzn6LhrKZQbQ05awk6ge9h9FRcmGLsyyaw/Y=;
 b=a5beTxBpNDqkdhjaM2W2adp0aOJA113NfQEMgz/Z8M5FCPZfeFQKjoyqLcNP4ci5ud
 tJPeFOdy2Dcn4cGkXoRKrVbx1Jux2BWivbh08E6p6jQCBwRy+qVtFyQTRdFD61F1VGev
 bAWeIQZQTj10LR732cuYRaI5v4s2q+mdzVb1ARFKJUOSuG6OSdc3oatpRG64+7EMUKuq
 VdKW7jY1Ze/nPVOndzbl4Z3S/KOYqkoP0A2eMGVAeE3P57lsU+blt/vDAjphIsuzvtA0
 IKANJ0o2Gwwm9sWMQaTbhcfFk6OlJ7+NmVs/2i0B/t0sqEPhvpnt14R9r8fFOWuYq2IE
 xwwQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=a5beTxBp
Subject: Re: [Buildroot] [PATCH 1/5] package/depot-tools: bump to version
 58625e82c685426d441be5b422c9ad88e4867d20
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



On 02/01/2025 11:08, Adam Duskett wrote:
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

  Series applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/depot-tools/depot-tools.hash | 2 +-
>   package/depot-tools/depot-tools.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/depot-tools/depot-tools.hash b/package/depot-tools/depot-tools.hash
> index d20c3ea336..9395b254cf 100644
> --- a/package/depot-tools/depot-tools.hash
> +++ b/package/depot-tools/depot-tools.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  57c82ce07695d439ed9ea6e4dd8a7321203eea45eb3e1ea1c3f461c630dd1460  depot-tools-1b58dc68659445b1d97d8341f8158be25eab4957-git4.tar.gz
> +sha256  b4dfe43021f40b360e33a252fdb21b0bb31c9a25629b6000bff987e0e178dbc0  depot-tools-58625e82c685426d441be5b422c9ad88e4867d20-git4.tar.gz
>   sha256  984523ee987f4e8b72d61df37d8f1189a7077cd4b77e41a397e35593b297a29d  LICENSE
> diff --git a/package/depot-tools/depot-tools.mk b/package/depot-tools/depot-tools.mk
> index 4bc9d7a470..3ae0055fd6 100644
> --- a/package/depot-tools/depot-tools.mk
> +++ b/package/depot-tools/depot-tools.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -DEPOT_TOOLS_VERSION = 1b58dc68659445b1d97d8341f8158be25eab4957
> +DEPOT_TOOLS_VERSION = 58625e82c685426d441be5b422c9ad88e4867d20
>   DEPOT_TOOLS_SITE = https://chromium.googlesource.com/chromium/tools/depot_tools
>   DEPOT_TOOLS_SITE_METHOD = git
>   DEPOT_TOOLS_LICENSE = BSD-3-Clause

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
