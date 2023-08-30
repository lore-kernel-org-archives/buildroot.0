Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CD7C83F01
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 20:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DB6E417E9;
	Wed, 30 Aug 2023 20:36:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DB6E417E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ngchuSSn6Ncc; Wed, 30 Aug 2023 20:36:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD3EE417DB;
	Wed, 30 Aug 2023 20:36:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD3EE417DB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 28ED61BF40B
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02153417DB
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:36:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02153417DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8LS0IgMFiD-k for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 20:36:16 +0000 (UTC)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C715417D3
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 20:36:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C715417D3
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2bceca8a41aso4214481fa.0
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 13:36:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693427774; x=1694032574;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CiLsJggW5fPJc93MiHx9YVrW4tydmtqK4Qsj2R+KkOc=;
 b=dOi252UhgMGTWEfEPQYtq6IB4e56I8PRwa21a7bo8Pn5SGPp8QUvlmU2bKRqm16N6n
 wn2fVNz6jjMwlmpPXw+1HS8Orr2XrmQo1kWz0j9e6xWI+ufETvt2BJwyMvg/7JBcdPJb
 u2/bLpqAtHow7JxVHd9hvzsgjL9j5SIhLUekqa7BnP80qZpDy3ieNIYrEQCrGfr+daDl
 Z3/keDddTtx83mjjFx607dLdT2i9WER1s6r/8LgIdip+RZiFq8eY2J5fIwUf+y1lHk9f
 plKCzNn+/8ZVxojb+oypyuiTrb8kSfr9OBfYIAMi2Nrhb/lUZMLuBYNTYIlnCMZNQ1YC
 Asxw==
X-Gm-Message-State: AOJu0YwGVDlXW7RL+PQ54RddCz0EG6lP/aUYcaWfzgmhruF2lEe4yZAk
 Y1FY1BAW+Cua/E361PrBWd06QA==
X-Google-Smtp-Source: AGHT+IFM8KAVO0d6eyfyDfqoZLQdOQRAscSDbRiy5w31BIQA42rYxtOcUOPmtYqWlc3aAiBS+ogT9w==
X-Received: by 2002:a2e:8093:0:b0:2ba:8127:a2c3 with SMTP id
 i19-20020a2e8093000000b002ba8127a2c3mr2862391ljg.34.1693427773752; 
 Wed, 30 Aug 2023 13:36:13 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a170906490a00b009a1be9c29d7sm7688868ejq.179.2023.08.30.13.36.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Aug 2023 13:36:13 -0700 (PDT)
Message-ID: <4c576534-7bd0-d1c4-61f3-a84821da3825@mind.be>
Date: Wed, 30 Aug 2023 22:36:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Daniel Lang <dalang@gmx.at>, buildroot@buildroot.org
References: <20230812192842.135682-1-dalang@gmx.at>
 <20230812192842.135682-3-dalang@gmx.at>
In-Reply-To: <20230812192842.135682-3-dalang@gmx.at>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1693427774; x=1694032574; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CiLsJggW5fPJc93MiHx9YVrW4tydmtqK4Qsj2R+KkOc=;
 b=BKHZPVuOSGyRIQ5aNe+FYpSKcErrjwHcaY311b2jmFsay2FDN9jPKxmgPzXuvAmCIT
 EOe23TEAeE7hDHIPyQe2TqgOrZCn8b/3vL34iQpR2WmGEQ6xAoRjkySrg/sbVE5l2Hvm
 7tM/v3UiSW8erMFdEx4jUpxIEe4VNIT2sOa+haPQP38YrYY5/ScypmlqEVCQzMMxrnSd
 KtTCKDHTykG2t3ItL+8UrxutMPvaXekrB24thZwZbZ0mRc4oQrhglf7Y875oi7r7mCeZ
 MRtvErJVOoGWi/0X9OjmoXq/YpeJYb6XreCryLImQivL050mseCRaNubtfe5EnZTK/UV
 w0SQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BKHZPVuO
Subject: Re: [Buildroot] [PATCH v3 3/8] support/scripts/pkg-stats: check all
 files for warnings
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
Cc: Romain Naour <romain.naour@gmail.com>, Sen Hastings <sen@phobosdpl.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/08/2023 21:28, Daniel Lang wrote:
> Instead of only checking .mk and Config.in{,.host}, check
> all files in a package directory.

  ("checking" here means "run check-package").

  I think we should instead remove the .warnings and .status['pkg-check'] fields 
entirely. It made sense back in the days, because we weren't running 
check-package in CI. Now, however, we do, so there's little point to run 
check-package as part of pkg-stats as well. On a.b.o the warnings column will 
(almost) always be all 0.

  There is the point of people using pkg-stats for their br2-external, but:

1. pkg-stats is pretty fragile so users shouldn't be too surprised b some breakage;
2. it's very easy for those users to run 'make check-package' instead.


  Do other maintainers have the same opinion?


  Regards,
  Arnout


> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>
> ---
> v2 -> v3:
> - new patch
> ---
>   support/scripts/pkg-stats | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 1ac538f5f9..c124b8a9cf 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -272,8 +272,7 @@ class Package:
>           self.status['pkg-check'] = ("error", "Missing")
>           for root, dirs, files in os.walk(pkgdir):
>               for f in files:
> -                if f.endswith(".mk") or f.endswith(".hash") or f == "Config.in" or f == "Config.in.host":
> -                    cmd.append(os.path.join(root, f))
> +                cmd.append(os.path.join(root, f))
>           o = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE).communicate()[1]
>           lines = o.splitlines()
>           for line in lines:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
