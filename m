Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF6AC9830D
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 719FA60E3A;
	Fri, 25 Sep 2026 14:45:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jYcM77XkKGDh; Fri, 25 Sep 2026 14:45:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 71DAC60DDD
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347534;
	b=GdAIaaBOxLOtU6tDaMBJoJ5J5VFBKdTb1UngHbs/2EXhCi4sHPGNQU3uyL10VkxQR5YA
	 xMupHxM1rvfpHaVfFUs/1+Hlkz84Dm9hyMt8kJy+kk1zHiI8UUvHNJnBTK2XPwZxZwBJL
	 3/0Wc0m5qTgESSzuGkoQPw+Zed3GtdOfhxRwBRMLzHOfGazyYYeOKReGGxL/9mxzaYNpv
	 nEn44PHFouXKrAknnIOYEFUlkRP1DmtwqKCjaVlkQa+PBoWk23GS7hvOWDdrh6ofmH21S
	 XBZFIU9zvyggj8QuI++uaVjZsPpRFuCUcAUWEjLrnwU8Ad4v9nQKKdEBpyDSAlxoa7w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347534;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=fsWE3dD4AJfuXSh1zfg6FPQDZRQ1KFaWTx1CSw060l0=;
	b=kaqMVilawa922DqOURywCzJpnM7qTEoKNpqJnTb86BnsTll8RtXbcyIsPSZpBD4yqCoV
	 KoXoeZyjJRoMEEqRhE2yO0giOmVrCO13c8KaxkRF8+nqVeuyjFW14IieUSZrscRxK+ndY
	 fE0ypvhxTcYE+un0eJRjaYnGMxOdSrjvb3mJUlp4O0mXfK3bWhnwcDdv4Wcql1Z1WnEpW
	 tBwr0Bx0QSYyTIBxVAAp7Z+gqkJAkZVX3VneHZA5JnYoq43tbZHF50zuMdMOFQKrvI6Lf
	 3gdclZLuahq1LPArnPa7XCd244Dl0jao2s18VI0Pq8Nll2Y0kuXuU7NsW7lXK+baj2A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347534;
	bh=fsWE3dD4AJfuXSh1zfg6FPQDZRQ1KFaWTx1CSw060l0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZKEfPLh5sh6F+ShMdRMp4OSilx6/VB42Ag2xy1/rZd2II231alBHeQThjXLoAGsZu
	 p44tLHoql6IfGCV92YaCReYgfHYqgJciyMPNx74VQVsGawoZLYJVoLx2jdkY8mZjEW
	 IdKohzF8TZf6+mG5nKLGRGbbEgRWOVrJXHo7J9JxSVcwl8JS7qFhHfhu270hh8T67X
	 LDxJmzM/Kos9NbyM+l5lw97gsOKV4u4kW/YsOPtUPqFWEww1dlb+p/IJdKhGagH+cp
	 FToWHzMqA9VeiZfv01c9CtZNCoZ95bUDOfJ9tUNMIip5v7dHA7l9A3wGlwt8gIwwcJ
	 9ZXs8VNyCxthQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71DAC60DDD;
	Fri, 25 Sep 2026 14:45:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 886B0334
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A36A60E34
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id icw1pfHEN1O2 for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:45:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1B2CF60E07
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347528;
 b=kyhlPBfPSPVSOQbZCyfJcxO8L9InD8s6LXdmgxIsCGNEJ/PE/gAxLLZc8HVIOVae00xZ
 6aSy4T1GO/Wkgrv0ZDSxRGHiljdlLOCtLHxH/v+quv8iYCiHRbFohTyfm0ucrHZKBUUGg
 u/oR7BzZYP0px1rl8Zajk1K61gjD6fOVbGPsaqkdOYYmYntDmAqFfGuDb9ZfYDI5g16sH
 iCNqsNfoS1JOeDCoOR/z3DW8NoztsEe76/NTLptrkpXwAwbqCq/T0OcJ4A08maJlRf3gk
 +rK0n7ouZIKGtYoJxjlhB6Uqv+levFMcvEb02Llue4lsGm0bTvzzo/6QNNW9ulzwzKA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347528;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=sK2b5eCE5daqxtkclwhG3opP9VekyKdU/u4IevmFES8=;
 b=rQZZb6wxxrANLZvUTu3d5detNC+1pxm2T36pTTl2TGaEM3fiIYiEB/IHGPtO9A/q8z66
 yBsxHGR0qdF0QmLiW5wSnRIXz/WPqaTZmYzwXCWlQJ49q8O1MF4SuKqkS7baFVJqEKT4+
 fEOkXXTTvd9KhO02wldpcHD7UNhS8Lw8VY8I0mN5u+3qX9BCkr2mSS74wcJT3kMgMozmO
 0AFURfaxzMJpjUeyXgmV285PMGYAZXqii0nP9CK+kkQjbJuaKPkUXPTvY4XaAP5GNALSy
 rIPjDWDnI4//M3Yun37bHExIqdv5IhZoBeb1d5tBjloJzRhmlbM69gQensdxZpVOVVA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Qb6QCqrw; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::10; helo=mail-wr2-x10.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [IPv6:2a00:1450:4864:30::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B2CF60E07
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:27 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-4843c3ea1f6so542723f8f.0
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:45:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347526; x=1790952326;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=sK2b5eCE5daqxtkclwhG3opP9VekyKdU/u4IevmFES8=;
 b=S2zCk9x3b+Mzq6AVqnGegtSUJAYKiEK/B705uKRwNx/xztOgJ+zEQlPOVqtF222MH/
 FnQtSUfuRGJqel7Oi3APHN39kKnvRLrB4F2rXPVujv7q5gOE2odleQ7IYaPQnbjxxzBB
 ANwUjuxFPApZNVmE8/kHyxGL0u1pUcyNoTF1xlU4dmWqFo31VacVO0Ok+rvjQx8x6Q07
 f8bu5Ga/7ZWyMlJJYrh5SRYhss7KtF/50nlwB0i58g7l0UijMei+1LoqTQOS3s3ROtxz
 xMb2N0MFeXGq9vrf6FSXUytrUf0Zq9JVK8WwRN1U0LwjNPI6uIdMNJkt/TYTpO6/Kcbl
 9CiA==
X-Gm-Message-State: AFuF++mi3I1NljY/Bn/6kLhSTF01I1MbGDNiZre5VxGJKlck+9OGkUGs
 kZy6x3B4jSGn/EGVLNr1k9dbkLnPjg8RwCNLG6oNUW7yAFt4bN3vtwji+dYmj8lgjgTvtpSm7OV
 koHm332Tjxw==
X-Gm-Gg: AYBFou0/vI+IkUQswjGdfS6rI7rqew606YBfjfob4v7SJY/Rfo0PCT1MnYxmgAmBSRL
 YtJcs6YZ5wE1lQMwQ3pyxW14Ey3jz7LcEoQwbt3JqooYVwgipYp68hjHAumyMTwQWDCUqEyUEse
 F/1P0CA252AT5zkXYOGHxDPKr7RyxMpFJl5TVjBFsjitNLsIWlE/t8OFLRk0mEmVxm2dCTos76z
 f7SH/T8CcD6HlADAK0m1vUU5mfPXMRzg57PodcZb3BrBf9kf8+kObv5yEnkuY/RdszJmZVUTcOF
 ClzmEqfcTpQ7A1uldMSx6M0IcAfoXuFtRM8GxZkBnKU1I7KIgT+12j2xNAEfndvEX3XT8GPE7tm
 P+Cn21EKiP3HTbjUhz8lQNBqqaKB8FD14sBJO15z2jjfox+n/KnW6iyCymOG9mFuzV7YtLZhfiP
 FfUF2YkFR5m+PJD55mEmx1ZNBxX12h6A1LmoL9Xyk4NoK1CIq5RgW0ynW9ArDeqPkhxNVRpwz0+
 dImViYky/UYDusrqnooCmLwDZbuA8dPLGavnb6cCfc=
X-Received: by 2002:a05:6000:3c4:b0:487:afe:c154 with SMTP id
 ffacd0b85a97d-4887169fe5dmr11718232f8f.40.1790347525831; 
 Fri, 25 Sep 2026 07:45:25 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a354c47sm7982655f8f.15.2026.09.25.07.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:45:25 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:45:23 +0200
Message-ID: <20260925144524.4097722-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915122946.1953137-2-thomas.petazzoni@bootlin.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/ndctl: propagate
 !BR2_STATIC_LIBS dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> ndctl selects kmod and keyutils, both of which depend on
> !BR2_STATIC_LIBS, but this dependency was not propagated into ndctl
> when the package was introduced. This commit fixes this issue.
> 
> Fixes: 039c1ae13ec12f7cebddf86f37080d0a1fee28e6 ("package/ndctl: new package")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2026.08.x. Thanks

> ---
>  package/ndctl/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ndctl/Config.in b/package/ndctl/Config.in
> index 708871d693..79bae61ebb 100644
> --- a/package/ndctl/Config.in
> +++ b/package/ndctl/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_NDCTL
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_USE_MMU
> +	depends on !BR2_STATIC_LIBS # kmod, keyutils
>  	select BR2_PACKAGE_INIPARSER
>  	select BR2_PACKAGE_JSON_C
>  	select BR2_PACKAGE_KEYUTILS
> @@ -19,9 +20,10 @@ config BR2_PACKAGE_NDCTL
>  
>  	  https://github.com/pmem/ndctl
>  
> -comment "ndctl needs udev /dev management, a toolchain w/ threads, headers >= 5.10"
> +comment "ndctl needs udev /dev management, a toolchain w/ threads, headers >= 5.10, dynamic library"
>  	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_PACKAGE_HAS_UDEV \
>  		|| !BR2_TOOLCHAIN_HAS_THREADS \
> -		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
> +		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 \
> +		|| BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
