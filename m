Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACF1CD484A
	for <buildroot@archiver.kernel.org>; Fri, 22 Sep 2023 18:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88503614E7;
	Fri, 22 Sep 2023 18:06:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88503614E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gc3LW9vsUnrI; Fri, 22 Sep 2023 18:06:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FC79610DB;
	Fri, 22 Sep 2023 18:06:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FC79610DB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 805971BF3EE
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 18:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 672674198C
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 18:06:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 672674198C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ym_P2Z9BO97p for <buildroot@lists.busybox.net>;
 Fri, 22 Sep 2023 18:06:39 +0000 (UTC)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3813441985
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 18:06:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3813441985
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2c124adf469so43636841fa.0
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 11:06:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695405996; x=1696010796;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qKt/Jt1IDQ1wpG/qnNBaOnRiHiwzrWNiUrp0rwKIPqs=;
 b=FJBOMKRiK3G0z+cxnyu7li9cD0iXMu8MLsdARNUHPOAYa0VaQ7CBUyDh9dL7ve2yYX
 NNwGqe2lV77R3ilArtXTgZbTgnw/vUjH44+2FNmhdr5IsDA4XJcqko3D+DTS9GBE8r1i
 aXjozHZBUbQeVDeR8xCSJkI4VDKSorL/9h1yjjMaK+DK3CJqaQ4vFHx3vuJ3H6IOD1fl
 HgdWkDoMRzse1qdp5ndTItoSPDzBn9tfx1C8Oxq7N4jNXOEeM+O41IeEeYD4y5qNCasF
 42W8kQBctclamdpaH1GaxGwK1f3+a456jzoF+/zH/J3JAzWCJVUI/Zj0D5WHFsSQX2/H
 2Qkw==
X-Gm-Message-State: AOJu0Yz/nZpcVts5geI3bNSS//sXIbCIA9bsU7GjyW5EcLBtzEQxjNOO
 zzbm0KXlZJR8LLFUazEJlFqXeg==
X-Google-Smtp-Source: AGHT+IEBv95LH47Com/9nB4rrpLlGgCla+1b+0Sw/lC97i7oTUfwV1Fk8hji04lNzv1hH1N2FIjeYg==
X-Received: by 2002:a05:6512:110f:b0:503:778:9ad2 with SMTP id
 l15-20020a056512110f00b0050307789ad2mr326346lfg.19.1695405996565; 
 Fri, 22 Sep 2023 11:06:36 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 n9-20020aa7d049000000b0051e0be09297sm2577650edo.53.2023.09.22.11.06.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Sep 2023 11:06:35 -0700 (PDT)
Message-ID: <b1e281d7-cc67-f18d-052e-fafe96b7d601@mind.be>
Date: Fri, 22 Sep 2023 20:06:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20230917104124.192919-1-ju.o@free.fr>
In-Reply-To: <20230917104124.192919-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1695405996; x=1696010796; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qKt/Jt1IDQ1wpG/qnNBaOnRiHiwzrWNiUrp0rwKIPqs=;
 b=K02viIyAO2eYbj4Dpan/0zEptag2viEYFZf6S9/MSIymw3+JrSgta1RAVvwfEtzmr7
 KBM0NqkdWAEUuD1Cau3S6OMLlmyWNefz5vlyRQCor3P4GpybuPmAdDQWTB4UXcT9ZzvC
 MYrR+c7L4AkP/QTTxx1vGH8yoOYb9eNQXEKVfq7FwGdT2HWbzM6qPcURt5elvx6tj6YX
 UCwaPqGdVqdvKWdFYEOZr1Wl8ZKCc4YsvhKs1HehAVKvqqngCndRgb01ESF3+paAkd+c
 QciHSSZKs2nCaVDVkpO8GjRrDlJ9sj3gBweDL9SrFo00whJ0fuQXmzADggJQhKCHLRHV
 U7jg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=K02viIyA
Subject: Re: [Buildroot] [PATCH 1/1] package/tcllib: bump to version 1.21
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
Cc: Davide Viti <zinosat@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/09/2023 12:41, Julien Olivain wrote:
> For change log, see:
> https://core.tcl-lang.org/tcllib/doc/tcllib-1-21/support/releases/history/README-1.21.txt
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Patch tested on branch master at commit 9584c80 with commands:
> 
>      make check-package
>      ...
>      0 warnings generated
> 
>      cat > tcllib.config <<EOF
>      BR2_PACKAGE_TCL=y
>      BR2_PACKAGE_TCLLIB=y
>      EOF
>      utils/test-pkg -c tcllib.config -p tcllib
>      ...
>      6 builds, 2 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> ---
>   package/tcllib/tcllib.hash | 4 ++--
>   package/tcllib/tcllib.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/tcllib/tcllib.hash b/package/tcllib/tcllib.hash
> index fb80841998..fe0ece238e 100644
> --- a/package/tcllib/tcllib.hash
> +++ b/package/tcllib/tcllib.hash
> @@ -1,5 +1,5 @@
> -# From https://core.tcl-lang.org/tcllib/uv/tcllib-1.20.SHA256
> -sha256  199e8ec7ee26220e8463bc84dd55c44965fc8ef4d4ac6e4684b2b1c03b1bd5b9  tcllib-1.20.tar.xz
> +# From https://core.tcl-lang.org/tcllib/uv/tcllib-1.21.SHA256
> +sha256  10c7749e30fdd6092251930e8a1aa289b193a3b7f1abf17fee1d4fa89814762f  tcllib-1.21.tar.xz
>   
>   # Locally computed:
>   sha256  38e1f556213f4008cfd280457af57c76a1fe043dc026ece1c704c09b5f6e865c  license.terms
> diff --git a/package/tcllib/tcllib.mk b/package/tcllib/tcllib.mk
> index 0f60eb8aca..1f2b575b29 100644
> --- a/package/tcllib/tcllib.mk
> +++ b/package/tcllib/tcllib.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -TCLLIB_VERSION = 1.20
> +TCLLIB_VERSION = 1.21
>   TCLLIB_SOURCE = tcllib-$(TCLLIB_VERSION).tar.xz
>   TCLLIB_SITE = http://downloads.sourceforge.net/project/tcllib/tcllib/$(TCLLIB_VERSION)
>   TCLLIB_LICENSE = TCL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
