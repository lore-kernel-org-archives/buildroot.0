Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66B7CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 602BD40956;
	Sat, 10 Oct 2026 09:22:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZhGDy6nO7eQG; Sat, 10 Oct 2026 09:22:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5FEFD4096C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624157;
	b=J9OSRjmvpntGfW7UeSdvtsF06RykwrJeenk5yVSilOa/NWkFMrhgQZMWS1KR0wPBlGaj
	 aBkCuVkohfLDLTYk8gVODi1mN0a+o5BpFLRLhRdC+s/i3qjJgtLrCSN3u/Xj46ptPY+kx
	 wXdCCSfoUVM85wcSsOeVNgjaMQLw60zeasXWGoPLdDjZqcRqwbrPAS30hXbEO4ZAiDYKL
	 fIa3xLTModcOtNB1QX5E4SXg5ErroMnLYQTEIJCDEKZWbzYMOjaei+sGY7hiOEPeNTRAH
	 4Zrl10xz/h2mVfQ/T2+J051JCWTGnOK2fF4EHgWzre4lQlMXWD466WpHNud2V5uhQHQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624157;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=C76xKapZTZnnytdJKIBqtrk3KmMD+hNtsr60fc4Zoo8=;
	b=oOciEsgIYW0c5IoeltPHjgC1WU2iyA6TYcpk0uGUI5ZQkc2Zi2qLK32CrIb1A8dRdw3R
	 y+xjHIwOXNDwE25ErBoPwaDvFRV6liCdIf+KOvKrnjwMyBgQMf5BIoGuqYAplqcDMumJO
	 J6e4ULy2p6DoBT4auo4TIVE7w6GUZXmcmyu2lqFLHY/JSRTgrPmRN6ajv7dzkifWtDeXD
	 qRuxAenUETmZunqjC5hwBVoiyfvocRUP14oV8eZJPwX774BkQc9rSdyqUXLGXHeKYkNmK
	 +03pzJ+hsMfjqnQulaPzwUL8+VH6UHKqsfjm3/OQ1bGnXwdn36AAJrOvrzg/T/kBbZg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624157;
	bh=C76xKapZTZnnytdJKIBqtrk3KmMD+hNtsr60fc4Zoo8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=T2oujUBpR9g93sUtKIOZxkZjb2agQI1Ofx9PinRzDGFi7piAhml3mYOza8oC6SzGz
	 ekoexIdyclvoEwkCOqjALpoZkIA5FPNLR1/GgoWscFiS/D4/bXxu+eMgOVtkCt1y0F
	 mZmJf+KMvNzSP8/gIBoZe+AIIeU0EWFz6+FONPVjs1PGKC5334La52t4rp4JVcUJJy
	 BZ9BrJ6/3T9su2ahbJfhFtWm8p3zEPTjYMoJ1Ops+nYrMiJ7qxGTYvbyIC/O1MwpXJ
	 /AKsk2+AiKpRFfFCFjtA3lI58ZsB5kUkmnM93phcoqn+pA9X6d08eaw6gMa38Kt+zl
	 VLrF+7OlfjHAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FEFD4096C;
	Sat, 10 Oct 2026 09:22:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 42C1D356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25EB94010A
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:22:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NuhdV9tC7Y_J for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:22:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org EDDF4400CC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624140;
 b=VRFhOMHxkpVoz75/PlH9ANweOaPeY0R7ATy3WTzkIqmG/vpIqiy9Z2yj8YmX5wAof+di
 o17c80A2MITxBY4VoiGdpwXvDCBOiIrTHe/x+SxqcLTAZc5J8r70ENn+9Rbjy1RzoTYVD
 eDvWXxKhuDioSnv4MBTmE0zX6QRukNrXZcY6mmpXpQj0FHag/5OFm9Ng/DepADwLDxyqh
 BlIR18DKsQLoz5gPjjHYtZFDdUbu1sfsKb+p5ZEGMFzcHdVh6bfqrJx7BeLXZwu3F4Wab
 b3StrOewTpg17s+QWFiXWxFhPiZBtQcpuEhXRQ0gsz/7UUIkIlIk9JYbYDFm8yv/RsA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624140;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=xFd3OuFAir1dDKIikpNhnaO2fWFz+RYJMvyzJkKwV10=;
 b=Ump+eRZFusuuPrFRou0fIitVxm/t8iKXaURiT49/a6960xgdgb46iLP9ox7PLAP5H7xY
 3pv+fQfzau/h+6H9sicd5hTKApnVh4eKGel6llcXpVjLgVlGeZLm1qwYo5dJNqzjHL5fY
 DI8pti+Myu+V9FpI5jMm41DkNyHXK0U84P9eO7JZK2kSpWhFHvn0tSUrjh3beX5QSM0zT
 rqn66HOB3VpJByXzDSNrA90PNJc2zlVj8WnjoMRJk8rvGKhDknJrGwE76SW4ncXUZVsf4
 W9ma40c9U5ODpeVybZOUV749S/+rYLYKi+97c40+bAVPt2o0VAMHSHrEJO9M9ABybUA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=VgOuok2h; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EDDF4400CC
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:22:19 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4a180fbeef5so4431675e9.1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 02:22:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791624137; x=1792228937;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xFd3OuFAir1dDKIikpNhnaO2fWFz+RYJMvyzJkKwV10=;
 b=17dzuR+miRL63bBfXqCvGKT4GJKBk1iHWxgJmcs3fngLRmDfVTGeqaADZqDCFCFclq
 qbD7sW3g/+Qs/9zyIG4sLAU8vUInegfHpD1T8N6PtgJvhIlOB6ZtxKb31BOWF1mb7e33
 oViK+xGLO1ZK6gooCEtFSehvs8vpbK4JNWJaheGwiaclfZr8RcGiX3mYo4sNZ+VeAEXF
 QmwkmfT6VFDulFSNWCcfOLgvFcRi9rv6utWXqoJoo88G4VJDpLG/fQdmgnLful79UL6E
 6oRNDMQ0n5AVRBrMBJ39Kjvnu1rqetDfv5BfIf3eDRLnOQSwB3FBAgqvy0gjGI4uVvCK
 9xdw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzbbjnTjc4kkqzGY657aXxIF22rNj3qEQ3rf/U55u/dMKW9Uq3oyJMDoLrjhEiLYzgqR3WmozrUZ+U=@buildroot.org
X-Gm-Message-State: AFq9FYLOH7/pJHK/UpWerXKcvqTOBlhZU3lfZ+vphoNWW7mL6XXomEim
 MCcabTH699keCqCAHFnvUuH/mDhp89+IJ0xzNRHKm4QYhteMjOA0jKlZOnPg9UoM2co=
X-Gm-Gg: AYBFou1RGS1qYROCbLpIHUb1AvN3OWQKW3TJXywcmAFIK2AM7B6eX+mQtkhPkim5tZO
 TZzNNIaoOL83LAjZyK83HrUFXF1OOUNPM1QsulDnJhH+6kyikgZ+gI+81yFvDuclfZkbX8/VXLY
 7j2VgnBg41fRUYODUAmua+hWLvLQghGMnOqPJrvBXuBWg+6hK1XK2NDsHn4dPJIl5T2GCQ7h4q/
 +WDPJVdUGQJE4Rxh73dTOm2+LmKlHhaZ28jXZCPU5SHLMaiJ1G/RAgIRI0UhLU3g3z7exScl5J9
 B3W9hQ0YWq0ZJ6Np9/r284CzpoqoUiG0zsZCtzmYTKqzPhIdUhHtOwY2+YeFv8pLCgklLOcgcVb
 M1LnRYEd1nQ89lcV4WYDQGfsP0nY75Ac9pO6k4u0RvQNjgQR78SMD7RW1AHJRXA1+3G5chZFsRw
 vlhf/h7yFOEDoH0dHaz7HXZiSm6ztXYPTppu5vgdA6O5O/g9qafG6yzVNFohM73tFLjedhsel2k
 FRC9MayJuoh21mlB/hyPgWxh/090G4NE1619a2UHVyyblwMEiA19SZl+SZ7ijfiegc=
X-Received: by 2002:a05:600c:4e89:b0:4a1:96cd:2f64 with SMTP id
 5b1f17b1804b1-4a196cd312cmr12329075e9.1.1791624137408; 
 Sat, 10 Oct 2026 02:22:17 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf2e0dbsm124844375e9.11.2026.10.10.02.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 02:22:17 -0700 (PDT)
To: Preyas <preyas17@zohomail.in>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:22:16 +0200
Message-ID: <20261010092216.138245-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20251209154834.5946-1-preyas17@zohomail.in>
References: <20251209154834.5946-1-preyas17@zohomail.in>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] libseccomp: bump to 2.6.0
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
> Update to latest stable release. Refresh sha256 from upstream PGP-signed checksums. No packaging changes required.
> 
> Signed-off-by: Preyas <preyas17@zohomail.in>

Applied to 2025.02.x. Thanks

> ---
>  package/libseccomp/libseccomp.hash | 4 ++--
>  package/libseccomp/libseccomp.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libseccomp/libseccomp.hash b/package/libseccomp/libseccomp.hash
> index b80efd68f5..aaadc8424e 100644
> --- a/package/libseccomp/libseccomp.hash
> +++ b/package/libseccomp/libseccomp.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/seccomp/libseccomp/releases/tag/v2.5.5
> -sha256  248a2c8a4d9b9858aa6baf52712c34afefcf9c9e94b76dce02c1c9aa25fb3375  libseccomp-2.5.5.tar.gz
> +# From https://github.com/seccomp/libseccomp/releases/tag/v2.6.0 (PGP-signed checksum)
> +sha256  83b6085232d1588c379dc9b9cae47bb37407cf262e6e74993c61ba72d2a784dc  libseccomp-2.6.0.tar.gz
>  # Locally calculated
>  sha256  102900208eef27b766380135906d431dba87edaa7ec6aa72e6ebd3dd67f3a97b  LICENSE
> diff --git a/package/libseccomp/libseccomp.mk b/package/libseccomp/libseccomp.mk
> index 10d57bb78c..26585b1887 100644
> --- a/package/libseccomp/libseccomp.mk
> +++ b/package/libseccomp/libseccomp.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBSECCOMP_VERSION = 2.5.5
> +LIBSECCOMP_VERSION = 2.6.0
>  LIBSECCOMP_SITE = https://github.com/seccomp/libseccomp/releases/download/v$(LIBSECCOMP_VERSION)
>  LIBSECCOMP_LICENSE = LGPL-2.1
>  LIBSECCOMP_LICENSE_FILES = LICENSE
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
