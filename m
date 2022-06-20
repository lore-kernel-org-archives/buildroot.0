Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 968CDC43334
	for <buildroot@archiver.kernel.org>; Mon, 20 Jun 2022 19:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DA9860FF0;
	Mon, 20 Jun 2022 19:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DA9860FF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pLlCw1nl8dW0; Mon, 20 Jun 2022 19:01:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F7C460FE8;
	Mon, 20 Jun 2022 19:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F7C460FE8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A5F421BF28A
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 19:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 851636100D
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 19:01:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 851636100D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iMwMetoMU5_d for <buildroot@lists.busybox.net>;
 Mon, 20 Jun 2022 19:01:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B686A60FE8
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B686A60FE8
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 19:01:06 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id g26so1526740ejb.5
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 12:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Z5rwpgG245EN0Ka2if4asqJUPGVTFVgUMoHB52OIt+Q=;
 b=4LT5XtJHpNldSh+pj6B8TUlczuG1LeMGf93EppgKNzZwpKUXkorHeEn/QfATet7w8O
 Cm7VtTWbIt6zp7FwKx+kd/iWqPTm2QJMgX0hlvjKfqThpuq4yv1nPpN+P46BXWl55FVA
 8fzZLkDoFWuVPcvw8S75gPXJmTKvvqL7GtUTk2bOng57svHj6ACIsJ/uWQORxhDbCw0R
 Oyq2K1wA2o6/JdL2+maR3/sJwkFT4qwVjVfx3CHu/a9cGvKfGJROzGN4oDggLJ26PFjj
 JlMFv5HCRrrIUei4T6iDW8+1kTkMJ7HHlsRDXEto5s61MagKdudS5fuC5nRHq92FqET6
 xXsA==
X-Gm-Message-State: AJIora9PoUlQ3y7cOlmUx25M2fd0iim5KEgWwFYGFnhg5yIY1Kg0uQQS
 yn02tLUsIMU33J6BOdsT9HVINg==
X-Google-Smtp-Source: AGRyM1vumRsqAaVwmXhSF9itps/7+9r9nBBdR/XVSD5W35WzMkz2htfdsKxbcpLJ6SlPDa80nRFMGQ==
X-Received: by 2002:a17:907:6d15:b0:711:d2d8:4818 with SMTP id
 sa21-20020a1709076d1500b00711d2d84818mr22155420ejc.336.1655751664828; 
 Mon, 20 Jun 2022 12:01:04 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b0071cbc7487e0sm5744088ejx.71.2022.06.20.12.01.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 12:01:04 -0700 (PDT)
Message-ID: <23895d34-c08e-94c3-f5bd-9856331e1417@mind.be>
Date: Mon, 20 Jun 2022 21:01:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220322232224.2842266-1-james.hilliard1@gmail.com>
 <20220322232224.2842266-4-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220322232224.2842266-4-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Z5rwpgG245EN0Ka2if4asqJUPGVTFVgUMoHB52OIt+Q=;
 b=Xk9RNzM8f/xdp0PpnqqY7BUrMU0QIXIkqjiPyt1vCQEahFSePjnyohCTyPS+0PgB6O
 YsWDIHBXexoC+L3aesaXPFvhFyRqVUs2kSUOD8EO+1fpgfrIxpbtLZc9elCMBisfD9gT
 Rh0I8adEUV3DijI0STvu3AOglqeoacCHTzSFciCfBVkaYVJU00/FIbWwJQAShlhvU6gx
 L6H5PLbpQ9f151L3DAG5nakMzONaJxNiLliH2VpLh4F87lQFUTGv65fKwLJjw7md8Ums
 Mp6SZnL25NZRHiEJWxwCwtjRzx/1nOlZqPfp5GP2XuxlMXSNvgqxQwTcJoejx9FRe+Yj
 GyfA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Xk9RNzM8
Subject: Re: [Buildroot] [PATCH v12 04/11] package/spirv-llvm-translator:
 new package
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/03/2022 00:22, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   .../spirv-llvm-translator.hash                 |  3 +++
>   .../spirv-llvm-translator.mk                   | 18 ++++++++++++++++++
>   2 files changed, 21 insertions(+)
>   create mode 100644 package/spirv-llvm-translator/spirv-llvm-translator.hash
>   create mode 100644 package/spirv-llvm-translator/spirv-llvm-translator.mk
> 
> diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.hash b/package/spirv-llvm-translator/spirv-llvm-translator.hash
> new file mode 100644
> index 0000000000..e6f9de3cad
> --- /dev/null
> +++ b/package/spirv-llvm-translator/spirv-llvm-translator.hash
> @@ -0,0 +1,3 @@
> +# locally calculated
> +sha256  a121579379ac3c7b63294b5274e0c4787b76003c89f7702a651384c3915464e9  spirv-llvm-translator-llvm_release_110.tar.gz

  This hash didn't match, so I updated it. However, could you save the file you 
have locally and compare it with the current version that is provided by github?

> +sha256  e3bc36440fc927c62d5cc24efeefe225a14d4e34ffeb0c92e430625cce9ee444  LICENSE.TXT
> diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.mk b/package/spirv-llvm-translator/spirv-llvm-translator.mk
> new file mode 100644
> index 0000000000..fcc482027c
> --- /dev/null
> +++ b/package/spirv-llvm-translator/spirv-llvm-translator.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# spirv-llvm-translator
> +#
> +################################################################################
> +
> +SPIRV_LLVM_TRANSLATOR_VERSION = llvm_release_110
> +SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,$(SPIRV_LLVM_TRANSLATOR_VERSION))
> +SPIRV_LLVM_TRANSLATOR_LICENSE = Apache-2.0 with exceptions

  The license is actually NCSA...

  Regards,
  Arnout

> +SPIRV_LLVM_TRANSLATOR_LICENSE_FILES = LICENSE.TXT
> +HOST_SPIRV_LLVM_TRANSLATOR_DEPENDENCIES = host-clang host-llvm
> +HOST_SPIRV_LLVM_TRANSLATOR_CONF_OPTS = \
> +	-DLLVM_BUILD_TOOLS=ON \
> +	-DLLVM_DIR=$(HOST_DIR)/lib/cmake/llvm \
> +	-DLLVM_SPIRV_BUILD_EXTERNAL=YES \
> +	-DLLVM_SPIRV_INCLUDE_TESTS=OFF
> +
> +$(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
