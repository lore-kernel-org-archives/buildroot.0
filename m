Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978A2C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 20:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C744741710;
	Wed,  1 May 2024 20:53:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1d67HoSSoazC; Wed,  1 May 2024 20:53:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6305D4016B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6305D4016B;
	Wed,  1 May 2024 20:53:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C69731BF400
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B17CD80BDB
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:53:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bC5TeAOXkfqi for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 20:53:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 91F8F80BCC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91F8F80BCC
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 91F8F80BCC
 for <buildroot@buildroot.org>; Wed,  1 May 2024 20:53:51 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-34db9a38755so1109618f8f.1
 for <buildroot@buildroot.org>; Wed, 01 May 2024 13:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714596829; x=1715201629;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q38+rkE2RLywfzZDhyj5WkG2rVCabzOeVLo5KR9oyJI=;
 b=ivAkvlpjO7+TYgPxiqziqRIdVFFfaZNVTp8PWotirCGXQTHRMlsVWTBo9XC4s8re61
 SZKXxxrqBUL9aV2umrrMltRIgKVyN5hl988q0GNeqTZUnDM6I8vAcjn3ZvQHGaYzCjE+
 3/l3tBNhoLaA1vCak+s4Yg135vsGq24Pln8LgUnHRZy77Gc0gBD86zH2YfwwSxzcQRha
 bPBo8xsrLRfAUp0Fvq5EtDLwlG19uRP9Lp1dDphBta3R6SrZq9F5a25i/QnV1lR2VuDJ
 hthvdjK/ySkJWQ/9gDAQa+GKYIduFzB3zeKmOM1+wKb6RcupP49FzCMhSmBjOyAZWJHs
 pHXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVikQNYUk4HCOKEwEd1jRIHWHur1Nq0HgbsNEF3gaoe/qjZEfOG4fxznoaQT3fPbgxpiGAZyFIj+pr+Xig+t9k6DVOjvBUzBg==
X-Gm-Message-State: AOJu0Yw0ftSjM3DAqkb3t6Ge/YFPkxoF0hrmMomhDyiz6pLVoicuB67t
 hP+0HO62Rjlqwq6eqWDRaOQhovuoi6Xtl4ZmDn8idKv/S08/CfdkKpsftyxpkHw=
X-Google-Smtp-Source: AGHT+IGts35YpGI81nOxPk8KKxRDhJQwH3FSAsBezpj2VVUQGleoWlie3g3xZ/aVuABeYPe1mBmtEQ==
X-Received: by 2002:a5d:46d0:0:b0:34d:1b4c:d014 with SMTP id
 g16-20020a5d46d0000000b0034d1b4cd014mr3213181wrs.57.1714596828971; 
 Wed, 01 May 2024 13:53:48 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 p1-20020adfcc81000000b0034d8c60c10bsm4559371wrj.92.2024.05.01.13.53.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 May 2024 13:53:48 -0700 (PDT)
Message-ID: <fc1cd1f1-de23-44a5-b27f-471d468445df@mind.be>
Date: Wed, 1 May 2024 22:53:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1714243078.git.yann.morin.1998@free.fr>
 <41552f4a1dc68983bb3edfd6a2b466581f5f91e5.1714243078.git.yann.morin.1998@free.fr>
Content-Language: en-GB
In-Reply-To: <41552f4a1dc68983bb3edfd6a2b466581f5f91e5.1714243078.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1714596829; x=1715201629; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q38+rkE2RLywfzZDhyj5WkG2rVCabzOeVLo5KR9oyJI=;
 b=WjUKM1S//pXctX6019TAEjwDFLk0/+wWjLdImJkOSAb8FD/icXUndvb/bp9+VdN/jk
 E+SIM+3L07dylUVlY/U6i6FHtNFYxz2h21XSm2nTkEPtARDxyjaN7iooRzyFHHXwKe0C
 tzh9nBt4BogCv1vDYF8Q5L2KaaK2/zHUwNCMtiixwfaehGZh57WflYCx1lOUtQuwJuRl
 vzBxt7oBomKisgI4h9uMSmle5r0CMKfy+1XULzA4hXb7Ix30DpOEXiirUePigxY7rCqM
 CEsXlgSrryzIAylo7zxNxIhUnAPR4OlQzO05ygXzdos5vtdC1acJqGROikO2/oIlips0
 Si/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=WjUKM1S/
Subject: Re: [Buildroot] [PATCH 06/15 v2] package/luajit: use the git
 download for known-reproducible tarball
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
Cc: Francois Perrad <fperrad@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/04/2024 20:37, Yann E. MORIN wrote:
> Since version 2.1, LuaJIT follows a rolling-release scheme, which means
> that any commit is as good as any other; LuaJIT uses the comitter's UNIX
> timestamp as its semver patch level. It uses the git-attribute
> export-subst for the .relver file that contains the %ct placeholderfor
> git-archive to expand it.
> 
> We have had various instances of GitHub changing the way it generates
> archives on the fly, and although it is hard to foresee a way the UNIX
> timestamp could change (it's clearly defined as the number of seconds
> elapsed since 1970-01-01T00:00:00Z), it's not inconceivable that GitHub
> may decide to no longer expand the export-subst attributes in the
> future...

  Although I don't really disagree with the principle, I think we should instead 
stop using github-generated tarballs entirely. Or, put differently: I think the 
risk of a github-generated tarball to change hash for _other_ reasons is much 
higher than that it would stop expanding export-subst.

  So I will not apply this patch of the series.

  Regards,
  Arnout

> 
> To avoid any confusion, and to be future-proof, switch over to using the
> git download helper, which now has support for handling export-subst in
> a reproducible way. Drop the post-extract hooks as they are not needed.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Francois Perrad <fperrad@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>   package/luajit/luajit.hash | 2 +-
>   package/luajit/luajit.mk   | 3 ++-
>   2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/luajit/luajit.hash b/package/luajit/luajit.hash
> index 578bb7a3e2..da243d8c2a 100644
> --- a/package/luajit/luajit.hash
> +++ b/package/luajit/luajit.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  b518721280390e4cec1af30f6819d86756ce4234d82410a55a4e121855f64e08  luajit-41fb94defa8f830ce69a8122b03f6ac3216d392a.tar.gz
> +sha256  df50bfe78919691ce9a630c8312386a8cb6ca49f327922a833e77656e82ef6c6  luajit-41fb94defa8f830ce69a8122b03f6ac3216d392a-br2.tar.gz
>   
>   # Locally calculated
>   sha256  1130331ac861a4b4520e9c8ad0814efdc6f1e79ea55ea9c460c73733d13ccb5f  COPYRIGHT
> diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
> index 693e22630b..6b1c6b3386 100644
> --- a/package/luajit/luajit.mk
> +++ b/package/luajit/luajit.mk
> @@ -5,7 +5,8 @@
>   ################################################################################
>   
>   LUAJIT_VERSION = 41fb94defa8f830ce69a8122b03f6ac3216d392a
> -LUAJIT_SITE = $(call github,LuaJIT,LuaJIT,$(LUAJIT_VERSION))
> +LUAJIT_SITE = https://github.com/LuaJIT/LuaJIT
> +LUAJIT_SITE_METHOD = git
>   LUAJIT_LICENSE = MIT
>   LUAJIT_LICENSE_FILES = COPYRIGHT
>   LUAJIT_CPE_ID_VENDOR = luajit
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
