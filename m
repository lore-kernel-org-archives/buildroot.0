Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D3A8C77B70
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 13:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31CFD403D6;
	Sun,  9 Apr 2023 13:32:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31CFD403D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MVs0U-PdZoOK; Sun,  9 Apr 2023 13:32:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D9044014E;
	Sun,  9 Apr 2023 13:32:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D9044014E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 283651BF82D
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 13:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05B1041725
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 13:32:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05B1041725
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IJORPRcEqt_N for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 13:32:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB8F0416A9
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB8F0416A9
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 13:32:25 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id ga37so7297709ejc.0
 for <buildroot@buildroot.org>; Sun, 09 Apr 2023 06:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681047144;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oK5IK+BouXttFSztfkszaHbrhHHW9TNnPyVpOOVHxrg=;
 b=OomDmfEBSjv5VSfTbI2DBznKKbjSskBSRtzPufNqnzx4RhbpeUbVW2R2nr4XPq3ThL
 Jhhdvaqo22PJXyEB6c3FckTW8Mx3azVi4DS+R0ZKKiWPtZ4n0erlVYFFWlLXeC3+wM1+
 5xpGc4a/YxyQGDl4cb+0N9Tv2kdlywMcBIMEutlFqzzfGWfhwg0jTmKzbjoH60I9aFBX
 mO+N3orYnrpSWDU5ZPE4I5WT5mzFEEiC9myymIVj0+ANknKp6N/LCMTDWNBUwd7DSPwP
 aLwza53a5sK2uflrEh6aGX7lYH0TIWXUiVaczegPzOkzqLlj3fVEL5PAfsVyWdH1LVok
 9YHg==
X-Gm-Message-State: AAQBX9eagbpA9M6MDOW+8GbRjXIYt5n6APkeFJLwi47X4QsXd1IYFla+
 VTd96P0u20nZKdysjfVdHUzaOwyC9usF+rGL17U=
X-Google-Smtp-Source: AKy350ZUhlIKI01lzojgwwv11HHWtWwxpc5cA8457IZ5Iko9PSb1e924FKaFwVBjJqju/Nqubf60Og==
X-Received: by 2002:a17:906:ecf2:b0:948:b300:6e9a with SMTP id
 qt18-20020a170906ecf200b00948b3006e9amr5044293ejb.32.1681047143954; 
 Sun, 09 Apr 2023 06:32:23 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 oz15-20020a170906cd0f00b008d53ea69227sm4164733ejb.224.2023.04.09.06.32.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Apr 2023 06:32:23 -0700 (PDT)
Message-ID: <f1e9f2e0-84f5-f052-b260-a4f285583968@mind.be>
Date: Sun, 9 Apr 2023 15:32:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20230408184559.84189-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230408184559.84189-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681047144;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oK5IK+BouXttFSztfkszaHbrhHHW9TNnPyVpOOVHxrg=;
 b=J0cztF0gOYo/xt+VKXLhRBlps67EEojo0CK8XnIZvJY8NioKk/nTJAyIlGQJRU5tCS
 Enh8AEMo1cH44UtR1GMAyCQCnCzPPLvkBEFUdkIJUU6R941sq+craUNisx1CmT0LU9eJ
 eAApUjpKfqvbGl0t4vZyCKrpTlrNOMagQbSkw1ceU9PSwzpqMxphrc5A6HL/ONnaxlcE
 fKn2YBoTy3gq88rAsbSjKy40EhvdGiowdThLUxey9SaX0Qal+ZN0IrHM2YAT1iVTSjNY
 mBVe7nRaVns4CNb4kNyN+VMHV1Tr+LxPCIP90UiHTtp9BdMjlx4csDGu3mjv1PcEdTLS
 IG1Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=J0cztF0g
Subject: Re: [Buildroot] [PATCH] package/matio: fix build failure due to gcc
 bug 99410
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/04/2023 20:45, Giulio Benetti wrote:
> The matio package exhibits gcc bug 99410 when built for the Nios2
> architecture with optimization enabled, which causes a build failure.
> 
> As done for other packages in Buildroot work around this gcc bug by
> setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_99410=y.
> 
> Fixes:
> http://autobuild.buildroot.net/results/971/9714160b80a0d1a01983d29af38a95049c07b4d3/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/matio/matio.mk | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/package/matio/matio.mk b/package/matio/matio.mk
> index 5e09f4e6ce..2ba9c8f568 100644
> --- a/package/matio/matio.mk
> +++ b/package/matio/matio.mk
> @@ -15,6 +15,14 @@ MATIO_INSTALL_STAGING = YES
>   # va_copy()
>   MATIO_CONF_ENV = ac_cv_va_copy=yes
>   
> +MATIO_CFLAGS = $(TARGET_CFLAGS)
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_99410),y)
> +MATIO_CFLAGS += -O0
> +endif
> +
> +MATIO_CONF_ENV += CFLAGS="$(MATIO_CFLAGS)"
> +
>   # mat73 require hdf5 (not available), extented-sparse take 2KB
>   MATIO_CONF_OPTS = --disable-mat73 --enable-extended-sparse
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
