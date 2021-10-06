Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 555E6C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:24:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8C66611C1
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D8C66611C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CE6F40789;
	Wed,  6 Oct 2021 19:24:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LN_zLN1JXREK; Wed,  6 Oct 2021 19:24:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A1E04078D;
	Wed,  6 Oct 2021 19:24:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 835B51BF350
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73875825E8
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:24:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id exwOacWemjGl for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 19:24:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F3C28258A
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 19:24:10 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id d8so13835452edx.9
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 12:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=WnM4mmhGr07XX+LCex+o7b4In89Pn/eJVXgIKPWyv6U=;
 b=RvaGC7vF/trSjwlICmgYBQKWAjxlqcm6sGoY2Fq9goy68B9ldluivEnRK+Lrd2k8/w
 Umlk1+7Y8vD+vHPke5djBniU0WgSSB0pptczctvQz+VnujF3Oa72GAk58Nfl8xY7Lxta
 RQTyIFhn3j2ynfuEsWNF7G9SdVOyZJQkuvKtgHxtjZhIS5swPjABjz/NlfWasuOgXUAe
 Ggf4Za6lEVEVtHItae7VbvlmwTPZeIvZE+Xz/51FkJGRLsW+yHp7tKeEcgLwemOEdUXh
 im0z1J+fTZwaBjSjm8lQc0CSvf9xHqmUbd94tnV6UH73SCBYPvgeznxsRXKr8TeTEZSe
 OWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=WnM4mmhGr07XX+LCex+o7b4In89Pn/eJVXgIKPWyv6U=;
 b=Rix1kxAXTaduYND2dF4p7C6S+LYYJOkIXcFSH8cD2O2+KQdFs33JZ0pilXwvQZjL9X
 M//VRDamrN6QPjv7IqNh0/QwzcC+fof8pUyArCoNglm5GDrnFFutviHW+EV1Ba3Whl23
 AUMxKoFDSn/B9UpStrFhQuZMbvRP/N7TVP7FFTdfabkOKMNiqWV3tXVrClwlkBmYKBiy
 4TrgjQN0fxQ/jbg1APdgu2n0smm5XlrPKx4HDbVuw/LJKUBOjQo9hzYN1AvDPAnWtUJI
 kIzE7f5cPNmtzHKZNNRgY2IUTKf1ht8Gx95VGiwLeYc+IM7P5kvLcIfyMzYT2R9SoSAq
 Tftw==
X-Gm-Message-State: AOAM5333PIiHw0t3UjUKy3yRjX4smB18ut8R8UsDX6s+WVszqdQg50A5
 SYuRLCcfEiPplyK9cOXenR1CWw==
X-Google-Smtp-Source: ABdhPJwv8j1qEYHDbi/WnwFTP7Eoac/tLiBLGe4hzSJ3esICaDlsElyZpgq7fVOgRzY46Ut4Xp3LWA==
X-Received: by 2002:a05:6402:143b:: with SMTP id
 c27mr58249edx.224.1633548248455; 
 Wed, 06 Oct 2021 12:24:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id di4sm10381635edb.34.2021.10.06.12.24.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 12:24:08 -0700 (PDT)
Message-ID: <dacf4e3d-fd13-f1e8-2768-a39af12f50f6@mind.be>
Date: Wed, 6 Oct 2021 21:24:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20210922210959.3604227-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210922210959.3604227-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH v2] package/ffmpeg: fix build on mips
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/09/2021 23:09, Giulio Benetti wrote:
> mips_32 is not supported by ffmpeg and it tries to build with loongson3
> SIMD support that leads to build failure due to:
> /tmp/ccFO2LRa.s: Assembler messages:
> /tmp/ccFO2LRa.s:15314: Error: opcode not supported on this processor: mips32 (mips32) `dmult $2,$6'
> /tmp/ccFO2LRa.s:15316: Error: opcode not supported on this processor: mips32 (mips32) `dsrl $2,$2,32'
> 
> So let's --disable-asm to prevent using those unsupported opcodes for every
> mips architecture according to Arnout.
> 
> Fixes:
> http://autobuild.buildroot.net/results/f01/f01d9cedec8e1b371308d0f7af561a75883fa27c/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/ffmpeg/ffmpeg.mk | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
> index 8ff8ea8c6c..b3ce4c0656 100644
> --- a/package/ffmpeg/ffmpeg.mk
> +++ b/package/ffmpeg/ffmpeg.mk
> @@ -507,10 +507,8 @@ else
>   FFMPEG_CONF_OPTS += --enable-mipsfpu
>   endif
>   
> -# Fix build failure on "addi opcode not supported"
> -ifeq ($(BR2_mips_32r6)$(BR2_mips_64r6),y)
> +# Fix build failure on several missing assembly instructions
>   FFMPEG_CONF_OPTS += --disable-asm
> -endif
>   endif # MIPS
>   
>   ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
