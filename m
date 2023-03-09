Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BC0C61DA4
	for <buildroot@archiver.kernel.org>; Thu,  9 Mar 2023 21:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E18182249;
	Thu,  9 Mar 2023 21:54:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E18182249
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZQPU2rSvgki7; Thu,  9 Mar 2023 21:54:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72C0082254;
	Thu,  9 Mar 2023 21:54:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72C0082254
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8CFDF1BF366
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 21:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6761640448
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 21:54:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6761640448
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V7-umJvOIh4M for <buildroot@lists.busybox.net>;
 Thu,  9 Mar 2023 21:54:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1136440278
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1136440278
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 21:54:32 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id cw28so12880972edb.5
 for <buildroot@buildroot.org>; Thu, 09 Mar 2023 13:54:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678398871;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iEXySGCOmdi8apwQTaX2Ml3YOORtAAyAFzFP45OpUQ0=;
 b=alNJ/rOWAg51djN7lndLh4e0+0r99LoB0iXtRvsDCsFDmR7LsGCQ34Iy3y2YyyOoFx
 8J9qw17cb+npK/d1AgKKyh1nLEQf0Es6q23qrQ6vPoPRjgTK68o4h5hsHesRa9o0ab/5
 h6wyD2v/iXh3RYV0bAM7U92EzGGupNsv3XkbGt4rLw6YvH4Cy+NegyazRXphfEChZ4aV
 8wYVo7UgoKrhRz7AD1aGXzroZkvWHgATtW1tN0dl8ybl+ahywqcUav2ba+ja19JUFwD4
 EM69eohse/rkUGeUNbNrTfggFWWSqcOEe0QAgHedfmddlmhO0AlOL3uKbmoBNYFYTNkX
 fyEw==
X-Gm-Message-State: AO0yUKVhaPYlsk5ZUVyubsp488+U/YcboD0Rh4tNMEJJGt5fXs52FcSD
 kZytrBepg4a73mOqCjlM2Ou1BNCIOwJdWkZX5Zc=
X-Google-Smtp-Source: AK7set/w4Tcm+TebNr8OrMkLybmOm1wg18puqUYcOZ1PREDvg1nqx8m4gesdQ2MhP5FwqX8dRYSOMA==
X-Received: by 2002:a17:906:3c56:b0:8ae:f19f:609e with SMTP id
 i22-20020a1709063c5600b008aef19f609emr25243378ejg.66.1678398870847; 
 Thu, 09 Mar 2023 13:54:30 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a170906074300b008de345f4f9asm66554ejb.49.2023.03.09.13.54.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 13:54:30 -0800 (PST)
Message-ID: <a38e4cdf-fa74-74a2-eab0-1e63923c5fc0@mind.be>
Date: Thu, 9 Mar 2023 22:54:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-GB
To: Joel Carlson <joelsoncarl@gmail.com>, buildroot@buildroot.org
References: <20230102071522.3229935-1-JoelsonCarl@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230102071522.3229935-1-JoelsonCarl@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1678398871;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iEXySGCOmdi8apwQTaX2Ml3YOORtAAyAFzFP45OpUQ0=;
 b=JkLnlD2dVNu/AYZebtTG4dYG6OQdMZzJjiMaT53HbdB+/neOwEukg2ViUof09bvx89
 6GjSSUyQ9SeIGeorcLpXI9VMsoH3CgK0MAVepgPDYCPb1kV+nK497u9CuQ904fETqH3W
 /qGaNha+2E94I3WbpoU3AqS3OtkIlK63bGGYFg4xCswy1/AwCWzdPKZcwAyS2husqGV3
 SiXhGKHp2xcpwuQTIYW0d/JkOL2hRrOU8Ew/wNeFRUDWnslaaKISgx8YIRSYXQMWBr67
 rTmF7IElRKc//rvA7C5Dho4ndWCb8ttG70OOSSlh9gTfuWjiF3pYCWabKWOeO8VmjoQq
 G96A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JkLnlD2d
Subject: Re: [Buildroot] [PATCH 1/1] package/cmocka: don't allow building
 for Thumb1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/01/2023 08:15, Joel Carlson wrote:
> The cmocka package checks if a toolchain supports the
> -fstack-clash-protection compiler flag, and if it does automatically
> uses it. That flag is not supported by GCC for Thumb1 builds (at least
> as of both GCC 11 and GCC 12). So disallow building cmocka for Thumb1.
> Building for ARM or Thumb2 is fine.
> 
> As an example in GCC 12.2.0, within the file gcc/config/arm/arm.cc, the
> error occurs in the thumb1_expand_prologue() call:
> 
>      /* If we have a frame, then do stack checking.  FIXME: not implemented.  */
>      if ((flag_stack_check == STATIC_BUILTIN_STACK_CHECK
>           || flag_stack_clash_protection)
>          && size)
>        sorry ("%<-fstack-check=specific%> for Thumb-1");
> 
> An example build error output:
> /tmp/instance-7/output-1/build/cmocka-1.1.5/src/cmocka.c: In function 'c_strmatch.part.0':
> /tmp/instance-7/output-1/build/cmocka-1.1.5/src/cmocka.c:539:1: sorry, unimplemented: '-fstack-check=specific' for Thumb-1
>    539 | }
>          | ^
> 
> Fixes:
> http://autobuild.buildroot.net/results/4044b3a71d3130d934c7a7c0c5badfabb2a97030/

  Instead of adding an arch exception, have you tried (conditionally) adding 
-DWITH_STACK_CLASH_PROTECTION=OFF to CMOCKA_CONFIGURE_OPTS? I think that that 
should bypass the check.

  Regards,
  Arnout

> 
> Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
> ---
>   package/cmocka/Config.in | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/cmocka/Config.in b/package/cmocka/Config.in
> index cf49d0f6be..6cadaa616a 100644
> --- a/package/cmocka/Config.in
> +++ b/package/cmocka/Config.in
> @@ -1,6 +1,7 @@
>   config BR2_PACKAGE_CMOCKA
>   	bool cmocka
>   	depends on !BR2_STATIC_LIBS
> +	depends on !BR2_ARM_INSTRUCTIONS_THUMB
>   	help
>   	  cmocka is an elegant unit testing framework for C with support
>   	  for mock objects. It only requires the standard C library,
> @@ -11,5 +12,5 @@ config BR2_PACKAGE_CMOCKA
>   
>   	  https://cmocka.org
>   
> -comment "cmocka needs a toolchain w/ dynamic library"
> -	depends on BR2_STATIC_LIBS
> +comment "cmocka needs a toolchain w/ dynamic library, and can't be built for Thumb1"
> +	depends on BR2_STATIC_LIBS || BR2_ARM_INSTRUCTIONS_THUMB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
