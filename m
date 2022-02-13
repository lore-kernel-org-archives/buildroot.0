Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC3DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 15:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C3C6400AF;
	Sun, 13 Feb 2022 15:22:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c2k83uZOOPTX; Sun, 13 Feb 2022 15:22:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2052D40116;
	Sun, 13 Feb 2022 15:22:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E80751BF3F2
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E52CF402F3
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:21:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YR2g66M2_Jbn for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 15:21:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 06005402E7
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 15:21:41 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id p9so9715460ejd.6
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 07:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=eMRVwr2/okEHjMynOmSg9EoMiCnxW+sCzJYlyyFW61A=;
 b=ciSOvpDAsUOO7/MNjoNADKeqg5EVXYdaM72MS3Hamcld5OkBQvhMF7VeI/0EBeY40W
 TxYmEh1DGgPhQ7Wpx+KcjtmOXzse1FNKYOkf38/o/aYvXdM0IOv6GYH1XWIhSiyMCtbN
 rNW+1yPjuYtS28sw8ZaCU/A8HJcessV0Qzt0HuJWdReHLvh9Y01LJn/qJVVw4tHnZvX8
 zDZ9VqU9ZpJgN95dDmoJmWl0lsnMdBl0zCwshaSQswozV8q+ZolO1uvLndO2VMuxLti6
 frUDGTVPIuKL07CYtgGs9pdPSG0UdzvSgVvvckF9s608V2TarI7tUYpzStyHFSxDUCjq
 JpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=eMRVwr2/okEHjMynOmSg9EoMiCnxW+sCzJYlyyFW61A=;
 b=pEjVyArFBw3YC8y/kXtzK2mtyPxAbeMOSdZSxzj9T+QmaNdTVCuQKbrk5SpM6wo1cG
 nceCUuMy1fzMw9yIOg39pprLrkG1SHPmE62XUf/zFyE7NMLZJtGxJsP5EpU7x+oqvNgm
 1MolOGVRBC/OQyHk/9DPEsVjtF3hpUSt/EVaPf95Li4IMm4Jc+Z3NMH7u2p+oR5j+ujI
 j+30pGybKtfJtc9VerP0VQN8xibmaQwV4eTPBnY+tGStFccfFh/LtpTr5YarZ1P8enk7
 2I0c+GF74aG4fuvUn14O2mhGfGTtaJLfCViQcOIRU/A/Su2E6ZRhDP6wlOfSv2+1I9Wh
 UulA==
X-Gm-Message-State: AOAM532TuGWHJK6fUEmpw7jp7wO6P0oLMiqnCjsZggSwswBLPraXJ2T2
 n7UZ+dFerFtKX7fDIdlaVRunzw==
X-Google-Smtp-Source: ABdhPJyb6ST8YKq05BjKOxOvgKbqzg2GWI/ZbwdkWP1t7vQde+YfpC4fQ495IGLXaRpmfIO/fshyjw==
X-Received: by 2002:a17:907:2d8b:: with SMTP id
 gt11mr8320258ejc.569.1644765700256; 
 Sun, 13 Feb 2022 07:21:40 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id r10sm9766524ejy.148.2022.02.13.07.21.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 07:21:39 -0800 (PST)
Message-ID: <052f34a5-6ae9-2cb4-e4b0-b6549beaf14a@mind.be>
Date: Sun, 13 Feb 2022 16:21:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220205145039.439160-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220205145039.439160-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/mpdecimal: fix build without
 threads
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/02/2022 15:50, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump to version 2.5.1 in
> commit 995c093d6a3e8042110d6a8d96fdc7ad65a557c4:
> 
> /home/peko/autobuild/instance-0/output-1/per-package/mpdecimal/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: cannot find -lpthread
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/b20c090f2ac5ea6d1c761820763037b87bde137a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/mpdecimal/mpdecimal.mk | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/package/mpdecimal/mpdecimal.mk b/package/mpdecimal/mpdecimal.mk
> index 25c12c08b1..aa322df340 100644
> --- a/package/mpdecimal/mpdecimal.mk
> +++ b/package/mpdecimal/mpdecimal.mk
> @@ -11,6 +11,9 @@ MPDECIMAL_LICENSE = BSD-2-Clause
>   MPDECIMAL_LICENSE_FILES = LICENSE.txt
>   MPDECIMAL_CONF_OPTS = LD="$(TARGET_CC)"
>   
> +# threads are only needed for tests
> +MPDECIMAL_MAKE_OPTS = MPD_PTHREAD=
> +
>   # On i386, by default, mpdecimal tries to uses <fenv.h> which is not
>   # available in musl/uclibc. So in this case, we tell mpdecimal to use
>   # the generic 32 bits code, which is anyway the one used on ARM,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
