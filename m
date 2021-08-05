Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C87A8C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 17:05:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 401BD60234
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 17:05:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 401BD60234
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11D1683611;
	Thu,  5 Aug 2021 17:05:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H5EVOxvI9nON; Thu,  5 Aug 2021 17:05:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C5AC83AF1;
	Thu,  5 Aug 2021 17:05:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C1DBE1BF3D7
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 17:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B145F83AF1
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 17:05:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GNS8JaSEVH6P for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 17:05:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A89EF83611
 for <buildroot@busybox.net>; Thu,  5 Aug 2021 17:05:50 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id h9so10742998ejs.4
 for <buildroot@busybox.net>; Thu, 05 Aug 2021 10:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=t7IwghQBw6BweW8d7IIzLUn+z6ah9b3wSUjs5EXJqOg=;
 b=LAWqUL1WS4rfG8r0mq1/beg8hwISn74gc5H8DF2Aom1toXcdrGh+XZjEnh/DjrKhKT
 xXZ+MfiGsLr6lru2FyC2X2z+Ec57Id5ic19n80KtVk48yGMAznumHf3dizbU8IqlHpAU
 DTkO94OkuH1bMfpNiuKw4m17Iwotv2+3uT5xVQ1C5nVRYf/UXteAFPiWRskU2x5BQuEX
 XTlBoOJnrEtifCuLNKVIcSkNAyUI6w51YqDw8e7PAdNaLDybM6RSIKU1a9UkSMOAQcKf
 0e87EVLxpJ6YnBBx4z+Qp1lf1xNo4YY0ltkmKOf+qr7kkURFjR6ZzcLpi+PSSuvyvpMD
 AFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=t7IwghQBw6BweW8d7IIzLUn+z6ah9b3wSUjs5EXJqOg=;
 b=dTrpkarmxVHh8/PD9Fzd1Zob3HN+aol2qy8JPfICuqYZge/a2JbChAqTwuzO5WG/52
 nV6vJmbG+3NlycTjiYErcK3JerPaJZq1QqIgYJJ14aFPlyBIeLmfFYSSTNMCQ8rDNmTL
 JC9wxoVBMHxyQm6lL34Ju2nryTh57l3CcOYloHj5qGSyQ4WGDJvdLXeQHL+vB7AIkMTV
 7i3k6Bi4N3URGKareJgB0pNMSxI8TE6gSvXIh/wcN1szM3NeCIWqos52VjZ4YfakkqjO
 YXTHAYL+77nedEvOPSSRzCXBfSdntKYhe49GAsD1p8Rs/W1SdglpLjBBwOCAwkCHgzmu
 kUrg==
X-Gm-Message-State: AOAM530lvjQKSJ4PmoB9TTCMWwUVdv6W6d5fIllNPwL/6ku720wXGLTE
 R2KWV0kAM6NERNnXrBkkPGJIOFuFeA6LRTpjg+0=
X-Google-Smtp-Source: ABdhPJzqU/bEoKKP24M5AgqwxsfUEQJwQxU1NU2cylTeQ9J6cTKAApCpX7ZQGWFTECxhLe7aMJKSbQ==
X-Received: by 2002:a17:907:75cd:: with SMTP id
 jl13mr5701160ejc.327.1628183148809; 
 Thu, 05 Aug 2021 10:05:48 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id v13sm1902774ejh.62.2021.08.05.10.05.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 10:05:48 -0700 (PDT)
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20210804134635.262095-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <379b58ad-76ee-8601-d5b6-8a6cdf294818@mind.be>
Date: Thu, 5 Aug 2021 19:05:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804134635.262095-1-francois.perrad@gadz.org>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v3 1/2] package/lua-lunix: fix build with
 recent gcc
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 04/08/2021 15:46, Francois Perrad wrote:
> Fixes: http://autobuild.buildroot.net/results/749a11d5289c6fec3b2f236b9073fc1ab730d090/
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/lua-lunix/0003-force-no-sysctl.patch | 32 ++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/lua-lunix/0003-force-no-sysctl.patch
> 
> diff --git a/package/lua-lunix/0003-force-no-sysctl.patch b/package/lua-lunix/0003-force-no-sysctl.patch
> new file mode 100644
> index 000000000..3467e2713
> --- /dev/null
> +++ b/package/lua-lunix/0003-force-no-sysctl.patch
> @@ -0,0 +1,32 @@
> +From d9b65e306478f5d2356ef90eab8191984534238a Mon Sep 17 00:00:00 2001
> +From: Francois Perrad <francois.perrad@gadz.org>
> +Date: Wed, 4 Aug 2021 15:27:05 +0200
> +Subject: [PATCH] force no sysctl
> +
> +Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> +---
> + lunix-rel-20170920/lunix-20170920-1.rockspec | 9 +++++++++
> + 1 file changed, 9 insertions(+)
> +
> +diff --git a/lunix-rel-20170920/lunix-20170920-1.rockspec b/lunix-rel-20170920/lunix-20170920-1.rockspec
> +index 76cafeb..e42fd34 100644
> +--- a/lunix-rel-20170920/lunix-20170920-1.rockspec
> ++++ b/lunix-rel-20170920/lunix-20170920-1.rockspec
> +@@ -35,5 +35,14 @@ build = {
> + 				};
> + 			};
> + 		};
> ++		linux = {
> ++			modules = {
> ++				["unix"] = {
> ++					defines = {nil, nil, nil;
> ++						"HAVE_SYS_SYSCTL_H=0";

 That's a really dirty way of setting a define...

 Unless this patch is accepted upstream (unlikely, given that there was no
maintainer activity on [1] since more than a month), a much better way IMHO is
to set it from the .mk file:

LUA_LUNIX_BUILD_OPTS = CFLAGS="$(TARGET_CFLAGS) -DHAVE_SYS_SYSCTL_H=0"

(This may not work though, depending on the order of the flags added by luarocks.)


 Regards,
 Arnout

> ++					};
> ++				};
> ++			};
> ++		};
> + 	};
> + }
> +-- 
> +2.30.2
> +
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
