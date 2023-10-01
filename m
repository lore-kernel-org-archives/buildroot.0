Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C547CE748E9
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 16:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AB7D80E71;
	Sun,  1 Oct 2023 16:09:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AB7D80E71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bu51qdKCokrV; Sun,  1 Oct 2023 16:09:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C43C581004;
	Sun,  1 Oct 2023 16:09:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C43C581004
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A086A1BF5A0
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A71581004
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:09:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A71581004
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WUmIi2je7E32 for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 16:09:53 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E70B80E71
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 16:09:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E70B80E71
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-406619b53caso18692185e9.1
 for <buildroot@buildroot.org>; Sun, 01 Oct 2023 09:09:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696176591; x=1696781391;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pHuPzAOe9GaOcSXIXWvNhRnpGhbpk1Tq4a9pNKsBr1w=;
 b=txwDtyQXs6iK2VD1/oIl5+IzSNMs+FUHfMB5oE01oBhU6K68fdtpwjTwiIjAy6wjlB
 inHjUxgMFunyYot38G2BJ2cjEG3LMD/sypHeCVs1ilvhBJKbyrP0yI7o1jcqeGa7E9Pa
 PCMKHpgN8ix0VxBBJXGj+3LFkANqu41LjR717DuAXCpQJ+iVh4pC8S3JXVXdmV35YRHQ
 4E2rvnxs+He8blTiE2hm1A0Ql/zWs6RxvYICpb0Vh4q8vO37/dmTAp4pMZoQH9qiocZ2
 aKC9/pxuTlwxhy1tOrc26HkN/VGV/A8UMn6rYFZy/vQXnL+jt/dqVqqLu5fu78OId9w1
 jjrA==
X-Gm-Message-State: AOJu0YyKYho/IBeJ+VELpPJFN2Hgm29Rt7kQlIBsmYrhXVefF5ICG3qw
 ZxCzm4y0682WPj2K3fknKzBdZQ==
X-Google-Smtp-Source: AGHT+IFiSjTXr9u3Isse6XZpweBH2WzGqo5NJFWpP7HUBb5ZrUCqSmdKjvXqu/12hHchqSwo2r6Wcg==
X-Received: by 2002:a7b:cbc6:0:b0:405:75f0:fd31 with SMTP id
 n6-20020a7bcbc6000000b0040575f0fd31mr7778405wmi.31.1696176591407; 
 Sun, 01 Oct 2023 09:09:51 -0700 (PDT)
Received: from ?IPV6:2a01:cb04:4ad:b00:5ddb:2bcd:94e3:5264?
 (2a01cb0404ad0b005ddb2bcd94e35264.ipv6.abo.wanadoo.fr.
 [2a01:cb04:4ad:b00:5ddb:2bcd:94e3:5264])
 by smtp.gmail.com with ESMTPSA id
 3-20020a05600c020300b004063cced50bsm5556274wmi.23.2023.10.01.09.09.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Oct 2023 09:09:50 -0700 (PDT)
Message-ID: <e21a20c2-9639-4608-4a4e-d9131e31318f@mind.be>
Date: Sun, 1 Oct 2023 18:09:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20221016193014.3384022-1-james.hilliard1@gmail.com>
In-Reply-To: <20221016193014.3384022-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696176591; x=1696781391; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pHuPzAOe9GaOcSXIXWvNhRnpGhbpk1Tq4a9pNKsBr1w=;
 b=EXraALHi94DXfZIvNK54SL0DTi4qXXGybXHKDjLkOSQvGQfZmEKskTC6qtdLBNeoom
 XmfctxM8MSHhVR2USztC6oDKm/Y+Zrhwu+tBED8MMyeOwBr/VTGdzomcQnbC2Rh16/6y
 QPNQJaVegUV9/xV3wF0BDAZ3PIeW4+XzQQBJA5emZR3RtGsXOvccFgUEqVGvEeDEsmnz
 aANWRd7K/r7145IZbw+sFcoaNUOFQTjyk05rEJxYUHE/8MJLzXwJOenYwcZdlDcHHk6w
 tTFqUvLjF8J09DKqGeHAKMR1A2cqy9TNXF2IOpZwNhMuHWL4HXR7lRcqHfYb/NOmELNV
 kvew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EXraALHi
Subject: Re: [Buildroot] [PATCH v2 1/1] package/Makefile.in: set
 --shuffle=none for MAKE1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/10/2022 21:30, James Hilliard wrote:
> Make 4.4 introduces a shuffle mode which randomizes prerequisites
> in order to better flush out issues with parallel builds, as this
> mode randomizes prerequisites even when using -j1 builds we must
> also explicitely mark parallel incompatible builds by setting
> --shuffle=none which disables goals prerequisites randomization
> for the parallel incompatible package when running in shuffle mode.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master with a slightly extended commit message, thanks.

  Regards,
  Arnout

> ---
> Changes v1 -> v2:
>    - use --shuffle=none to disable shuffle for MAKE1
> ---
>   package/Makefile.in | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 43d214bcbe..c69c201c46 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -17,7 +17,9 @@ else
>   PARALLEL_JOBS := $(BR2_JLEVEL)
>   endif
>   
> -MAKE1 := $(HOSTMAKE) -j1
> +# Only build one job at a time, *and* to not randomise goals and
> +# prerequisites ordering in make 4.4+
> +MAKE1 := $(HOSTMAKE) -j1 $(if $(findstring --shuffle,$(MAKEFLAGS)),--shuffle=none)
>   override MAKE = $(HOSTMAKE) \
>   	$(if $(findstring j,$(filter-out --%,$(MAKEFLAGS))),,-j$(PARALLEL_JOBS))
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
