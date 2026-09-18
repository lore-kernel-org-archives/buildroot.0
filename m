Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7368CC982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D69E40D15;
	Fri, 18 Sep 2026 13:08:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lBQrPlNxl0G2; Fri, 18 Sep 2026 13:08:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org EBE3440C8F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736931;
	b=ouQ/sm5JjtDV9cUG2pB3oCYNnQrLhI8vgZiSUUEqRQvPudef+g0YPMCzXKwulBXPc3ZZ
	 PmfU3+AV69L5lT8n89lsemF32NUf9/q5470LT35W+lhYe9gZpANHJ0tU9pZ1S0gAahdIP
	 dlh6D8V9V9+uOiooYod4hyntNSjCs5sgzT5Ad7GLJ5xnnDJZA9FKOSIaYEwRApk7P0z8z
	 WOTNQnjb2mQI8HhD0OL3Upzr6ctFYPfsFToC3A4q0UbfpCDIQM5Gce0NHLkGnPnYQuqr7
	 DwUHwCi2HZWWZe24Eqm3zSOCfbdIAXnIQ1/HdvBPGtBdWetrRVZOrjYr1yV+BRTAPHw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736931;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fQpaUxacELR+Wk9yfsQcl5Pp/dGEuUF2R4uq+6y/V5g=;
	b=NQVWQ2DXgEuGo/dt3fiYSUjrV1UrBuVrTiOWz8CrRE1k1qKKfl/WXRMgZPnPIo7jUE56
	 vAsgLLvaSBJ7qu6Ti18eo98UvIm4qT0ZL365NM6CS1uMypZxucNJ3wl3rD6171Kz6idmz
	 Rz2h+6j7TnS/7SXH5CKhBwkzijOmqSd+Uvg2EipLjLLyEgXd8aIkDjSvCnpVu1EzqtZMb
	 8cwTj+idEoGugGO0jpck9G++293/Pp8s+jSHeVF0QS2Sl+/lniC9YNuCv8RiW1hTs+PRq
	 n20fPZ0JDdnb138h4IfNiB6oYOL32KIDpLf55CkpM15S/3RCnCIwwt1RsnZ5DwzOt6Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736931;
	bh=fQpaUxacELR+Wk9yfsQcl5Pp/dGEuUF2R4uq+6y/V5g=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EYw8+Qzut7spC1HFWaTR70R3Y7H/jyBQzAWaeXD/sX5JuGTaPnRqiIVKwPHXvPPE2
	 tIovM3qzMj16Y2+dkkHks5p6eBwvu24vjWWkYEYmHOCgikTJMoWeavvfxy2sxQfJcy
	 EnGmHPQgGhUcqU1JyxSbkeMxJFsD12XQY4ZfQg3vkQ25acRAGdMxXXL7VFE1gGisXW
	 JWnVJ7N4/ImGBn/U2HkJmdNQB3Go8cSRSgY17fSkyTi1OvGOxnZvx9ytckUMyVLOUE
	 jc35/6N+HBFS5+o+w6s9pKAj5pg7WnItk129aIdfOEGQKI5B2rM4VcEG2Jt6teyTug
	 tzgnyfMQE7Wmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBE3440C8F;
	Fri, 18 Sep 2026 13:08:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 221E5224
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 056A560F40
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:08:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NCx6x2My7P6X for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:08:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D36FE60DD1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736918;
 b=fUrS2vaob731+2jQvvw5i0gLCxRH3AF0D9qorVRqOpeJd20TaXDyd84rXxFHNfcECuA3
 goQfpVn//9fy/RNcUuswEB3mHyfI1Oeeszy5/Z4h/Tz1R8nyB5cUM1pld8zWiPFjwXmUK
 MYQ513//7cKWklFW0sI8RGRNXmctx1iAPW9rv1EX/8tF0n3h28r9fsa+Rjc5bpIY1Fkjm
 mn5yf8Fs5sDVBm0j77ZVYCcbduVfcmzAA9nTvhZHDGpkw5hGkxoWxbq3mKnv/Wf7qoGFm
 CuaEdncOco3o/bOAEUw6eqXJdPVPgITwaiJvhXgDn4PTmkShVir3htE9vDE68cwJRNg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736918;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=erCoUCiQoT9Fb7IVrLdojp565YxhKuYnT8mZctRSWwo=;
 b=HB66wo8LI2K3h7pNC3rqwfjhvmo7usoBF+CI6cVjP1nlNU7DYdsE3mVSk7HeUzf4YtTH
 tIfQ0koF5V/YxWtzboTEYI+V1lgholXMJX/pk0FLSVuGC3F0RIJ/OlHz1YJxNpMlgas7Z
 CH67p+wr3BRxUEfKY4ZjVtUqU+2Q1FVZx1KSDKNmCrkY9FinuscBZS+iVGhN+6XtnjDtJ
 3oAt1bI8nC0zfVL7mZaLQkYjtjFuTdxC+qosWlK8HlJhtsrfhP0AwEQNIMIOsIyLUxYFq
 VQ7XTl6Ph5/7BGCtvzxyYdOUjAvw0LI+QzAVXCxNwU7X9FeCGRCvA4e+kujwWOYBS6w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=YzYdTNga; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D36FE60DD1
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:08:37 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49cd5462b69so4175185e9.1
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 06:08:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789736915; x=1790341715;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=erCoUCiQoT9Fb7IVrLdojp565YxhKuYnT8mZctRSWwo=;
 b=f+OzazOnkjvg13D5nadS/I871N7PWanZbk30dTdazc+/Dy+zLHEYqStq84ezem4sLr
 w4cQpxuVt0vgqN47EPxZXu9iQUR/Ek9PgXdBYpxXeLISqVntohl/OqUXDOBR7PmiBrSM
 RRtLCMiCPe9nQCRKpHSsPkjlqM5Ln8XP8sQDb3HtMvHIx1hmVZ7kHjTmY1AEK3ZH44o8
 Z7KymSBjTxJRhrBSGNwKyi0R2dC4z1S0H3Acp5H6vniC1dFlUCjcJq+RFDOp/7Z2SdSI
 ko8GBkmrRqHeiJvjFJVqKgK0Ub9IyVehotVpkltJk4PRZWKYKu5NXACSe17KK83QZzJZ
 Z8lw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxkdnMUC9aGQPhD5SAjCJgI9tDv6P19ppXDI9fWB1VLq8mlqIpNtCpyN5M93nISB0SF3X7vULkX9+w=@buildroot.org
X-Gm-Message-State: AFuF++lifgyqHpPlG59bREUItyVVgTUdjCWGXqrdJx2kKkAGpFTMa4bi
 r/D+iDtMk5tP62ZdhJkKjFJir+1ZN12qd59Ii1MzPEkTMHxBNXSLV411bN11F5sxVrc=
X-Gm-Gg: AYBFou0K4kesC2cOEX90NDx89jU3e11T+i3j3OQ9Nkl1bGu5nAuwqEuxgORz9Z0bka9
 MQpVn2x0eVcftrXP/FeC2usBczZfk/QgTl+K809cBpbwguM7Zf1HG7UzTIgPJ93KVoBZQdvvNQo
 ofkuCMQuBlSgM5U5RMUNUsxw3szkWjsaJaP3Jg/8xVTJeXxKeB8e8uZphf0Tbgj0o/uIRyHWdod
 qf6lJ+99U/baOrnYOudcq72X9rLl4ftvLZYhBSmXUZ6oWiwuEgrGn54+fHJZlrG4RiKWpITyVwH
 vLvDxdjUlq8XPEFsP9NFTl0bWdSSeENGH+JbF681aODkG1Mc//i2rYKfSuuMY/C3xqCZoBzqtIu
 gGeoYyHa9Yt1Ri3yBxQjKjV3f+nkpPVi1A5VVDAM/CpJ9vV/w9Jy1xPUZjvtJBSdusjCVIlnTrA
 prP1MKrRIvPQwO2E/eIHzb0V0fWM8nvQtXMEHKwzcqUyJkgSOZCFeOgJ0oaTEss+gf
X-Received: by 2002:a05:600c:354e:b0:49e:65ac:eb5f with SMTP id
 5b1f17b1804b1-49fc5726c2cmr64214475e9.10.1789736915457; 
 Fri, 18 Sep 2026 06:08:35 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fc7ceb92asm56307235e9.6.2026.09.18.06.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 06:08:35 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 18 Sep 2026 15:08:34 +0200
Message-ID: <20260918130834.162435-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913175756.1702319-1-thomas.petazzoni@bootlin.com>
References: <20260913175756.1702319-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/falcosecurity-libs: drop
 meaningless selects
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> BR2_PACKAGE_FALCOSECURITY_LIBS selects BR2_PACKAGE_HOST_GRPC and
> BR2_PACKAGE_HOST_PROTOBUF, neither of which exists. These selects are
> anyway not needed, so drop them.
> 
> Fixes: a15e35c4ebc52f29f65372c8e86cefa874aa4aaf ("falcosecurity-libs: add new package")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2026.08.x. Thanks

> ---
>  package/falcosecurity-libs/Config.in | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/falcosecurity-libs/Config.in b/package/falcosecurity-libs/Config.in
> index 9e6c2d0227..9d9cbd12aa 100644
> --- a/package/falcosecurity-libs/Config.in
> +++ b/package/falcosecurity-libs/Config.in
> @@ -14,8 +14,6 @@ config BR2_PACKAGE_FALCOSECURITY_LIBS
>  	select BR2_PACKAGE_ELFUTILS
>  	select BR2_PACKAGE_GRPC
>  	select BR2_PACKAGE_GTEST
> -	select BR2_PACKAGE_HOST_GRPC
> -	select BR2_PACKAGE_HOST_PROTOBUF
>  	select BR2_PACKAGE_JQ
>  	select BR2_PACKAGE_JSONCPP
>  	select BR2_PACKAGE_LIBB64
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
