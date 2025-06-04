Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40380C5B543
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDC7B60C14;
	Wed,  4 Jun 2025 18:24:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a65nyyaEbydL; Wed,  4 Jun 2025 18:24:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2126960E0B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2126960E0B;
	Wed,  4 Jun 2025 18:24:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 50914DA
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36D4D83300
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:24:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RuDnCSKh5xtE for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:24:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4E8D580E18
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E8D580E18
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E8D580E18
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:24:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2A3131C010A; Wed,  4 Jun 2025 20:24:53 +0200 (CEST)
Message-ID: <f549ed2d-4cc4-4e79-8125-02d66d3b64c7@rnout.be>
Date: Wed, 4 Jun 2025 20:24:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
Cc: Daniel Price <daniel.price@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>
References: <20250517160320.3291319-1-peter@korsgaard.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250517160320.3291319-1-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749061493; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=kH2lk9VGCxMjVxnc7F5QuVJnv2JwMn6JJJ/V/HqaylI=;
 b=G9+ory14lXeZWhM2B/DgVW2sjtajgBepxdQVntyCR5YaXJjaEDsqHP7eTJ3oeSBVkCSa1c
 O7rdMNPIR5uyqxBFSSieAymDk2Y1nCfPNIPynCxY04BwkhG1Yf+Cb+TJfMnt934msvWPWh
 VaWP9hMPSBBC5y4XLWDKHS45skJXHjGNB9GxLpAg0RwBlPbrWnAhuasx4qkaihzi64BHOk
 /lH2Zv0U63mOWgb7PyIt+5DX7t4KS9LDWz6UA0QbjJ7dd6CeGzadYg6OgnPnRsYmX3RsRm
 xdjWZdtWwSYFbu2T0Igypfz41ICNg2DZP234hGDgZO+3ky9m3kJsmf/6kMjoaQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=G9+ory14
Subject: Re: [Buildroot] [PATCH] package/nodejs: security bump to version
 22.15.1
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



On 17/05/2025 18:03, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> - CVE-2025-23166: Improper error handling in async cryptographic operations
>    crashes process
> 
> - CVE-2025-23165: Corrupted pointer in node::fs::ReadFileUtf8(const
>    FunctionCallbackInfo<Value>& args) when args[0] is a string
> 
> https://nodejs.org/en/blog/vulnerability/may-2025-security-releases
> 
> Update the license hash for the addition of zstd 1.5.6 (BSD-3-Clause):
> https://github.com/nodejs/node/commit/f9f611fb584ca2ace35df2669204e7de6a92ea26
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/nodejs/nodejs.hash | 14 +++++++-------
>   package/nodejs/nodejs.mk   |  2 +-
>   2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
> index 6d2bdfb704..e087d8a7f9 100644
> --- a/package/nodejs/nodejs.hash
> +++ b/package/nodejs/nodejs.hash
> @@ -1,8 +1,8 @@
> -# From https://nodejs.org/dist/v22.13.1/SHASUMS256.txt.asc
> -sha256  0a237c413ccbab920640438bf6e1a32edb19845bdc21f0e1cd5b91545ce1c126  node-v22.13.1-linux-arm64.tar.xz
> -sha256  f2be8dca2a7a518f6d187aa4b18abbeeafd71096a6d95f73f4d8bc0f8d2394ea  node-v22.13.1-linux-armv7l.tar.xz
> -sha256  377a7a1ea66f39251e1657f419e9404d526fcca9910620d0ecf0a870c6308f6b  node-v22.13.1-linux-ppc64le.tar.xz
> -sha256  0d2a5af33c7deab5555c8309cd3f373446fe1526c1b95833935ab3f019733b3b  node-v22.13.1-linux-x64.tar.xz
> -sha256  cfce282119390f7e0c2220410924428e90dadcb2df1744c0c4a0e7baae387cc2  node-v22.13.1.tar.xz
> +# From https://nodejs.org/dist/v22.15.1/SHASUMS256.txt.asc
> +sha256  f4ae8ddf7487dfaf7da92fef463ee55cc29d8772d62891361dc3fc8b8e469205  node-v22.15.1-linux-arm64.tar.xz
> +sha256  6947386b4c8373b625c6a49b5571bf2226dac7c7b560a9a561a1f81bf71a25ef  node-v22.15.1-linux-armv7l.tar.xz
> +sha256  da07858c6404dbe7c627bd7baea33c7825640652ad24468a6feb23c770cf7ce4  node-v22.15.1-linux-ppc64le.tar.xz
> +sha256  7dca2ab34ec817aa4781e2e99dfd34d349eff9be86e5d5fbaa7e96cae8ee3179  node-v22.15.1-linux-x64.tar.xz
> +sha256  c19f0177d21c621746625e5f37590bd0d79a72043b77b53784cba5f145e7263e  node-v22.15.1.tar.xz
>   # Locally calculated
> -sha256  9d72cce9b104ecb67feb8af38618511685190ae5a119cc0488ecae66b221000d  LICENSE
> +sha256  1ae62e2015784ba438db7b04ebd33f3c4ff3efdb824c111c4ececd99945fd52d  LICENSE
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index 752971c4a6..310face2d2 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   # _VERSION, _SOURCE and _SITE must be kept empty to avoid downloading anything
> -NODEJS_COMMON_VERSION = 22.13.1
> +NODEJS_COMMON_VERSION = 22.15.1
>   NODEJS_COMMON_SOURCE = node-v$(NODEJS_COMMON_VERSION).tar.xz
>   NODEJS_COMMON_SITE = http://nodejs.org/dist/v$(NODEJS_COMMON_VERSION)
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
