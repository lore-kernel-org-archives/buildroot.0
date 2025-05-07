Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4A2C3ABBF
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 21:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73F746059B;
	Wed,  7 May 2025 21:04:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i06hCCAbKpTm; Wed,  7 May 2025 21:04:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B017461303
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B017461303;
	Wed,  7 May 2025 21:04:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B3D8615A
 for <buildroot@buildroot.org>; Wed,  7 May 2025 21:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99D9840E1C
 for <buildroot@buildroot.org>; Wed,  7 May 2025 21:04:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gyf6GCOg0vgr for <buildroot@buildroot.org>;
 Wed,  7 May 2025 21:04:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com;
 envelope-from=charlie@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A30EC40E19
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A30EC40E19
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A30EC40E19
 for <buildroot@buildroot.org>; Wed,  7 May 2025 21:04:23 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-736c1138ae5so363922b3a.3
 for <buildroot@buildroot.org>; Wed, 07 May 2025 14:04:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746651863; x=1747256663;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5sIpiD94UQDE0USDW37XQmODQ/CJ2tebum2gA3DGDJA=;
 b=xVm9fuxQEXMtYVB/s95xMbs50FSLfFnGPZ2LAs9AUm5/4CZKAGglfeB++05vaNW9FA
 ipyIR9uLS54MuAEnbVVuH7udhoOTWb7a10ORQyaXTRpx8BoGJRX6L8zYtoK/HIFOoZ7X
 Cu3xXz0ZKB3mE4CrbzA0euHwugLmiZDNYw41dZtTYh0G1KaKMdlZXofnIns9zjbO40Qr
 3zswCJhSxaYAv3HTvqgx7XSUAnxG9mzljVkgZgRTYKmuGQp0n+dQX2bxAjatw9pVGzpb
 0bkzvv0s0FwVUFixov1PPa/1W3Mi1mphuKJbulNrsnDYwOVh3ItFuL4bO71WJJqXV3DK
 t57A==
X-Gm-Message-State: AOJu0YwhR6i6uEi8Vj7KogBHWKU46OQBPxHtlWNNfEkWhIjlSeoSf7Ls
 AsuCQgQ4e9fkNJGFU2o/iT+9SXViyIqQJs46EWVcnjrb0yRnpnuWrzkRlwhFRjI=
X-Gm-Gg: ASbGncutXpOCv+v7pU1ZTOeIKi8vwmo3w1PfghAoXQOaQOU3lDRE8f00pkWxAzt7quG
 cRHDozetJF49QLTJ4hCEcKAI5HPCvjSsn6WsmHWGD+QqQtAVMrX7OrZldW6n4oxOVvBdtfIDx/T
 gTF5aBs38pq6qFeCDAxNCDLs2dr+DG6Es4cUFmH7PPL+djMAAkq2srBKWMNRRnEvfNKf1XOJ+tD
 RPxm2ZBQbT0bJ07xUiiaAMiqo1oMTocQIeq9x2k8+m/wDS4zJWV381/9akFFMRbKhqya2dE4wz9
 0o7IHzkR8GO5Ese4vm+4uXLpGpF7H7YlkQZ0
X-Google-Smtp-Source: AGHT+IGmDz6fZaJcHbbbuoRYdbyIGxny3ygkR5Axa2EVpV+oFww7z0BppexjAuyrHuBAFo4sGMGh8A==
X-Received: by 2002:a05:6a20:c88e:b0:1fd:f8eb:d232 with SMTP id
 adf61e73a8af0-2148be01d8amr7664817637.24.1746651862914; 
 Wed, 07 May 2025 14:04:22 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:a06c:2581:5189:32ce])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7405902105bsm12138841b3a.97.2025.05.07.14.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 14:04:22 -0700 (PDT)
Date: Wed, 7 May 2025 14:04:20 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <aBvK1Pf4hj1qz1Os@ghost>
References: <20250424-fix_gmp_c23-v3-1-e3e984bd4254@rivosinc.com>
 <fa9fcbd29adc8179f90f3b2eaaf118e5@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fa9fcbd29adc8179f90f3b2eaaf118e5@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746651863; x=1747256663;
 darn=buildroot.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5sIpiD94UQDE0USDW37XQmODQ/CJ2tebum2gA3DGDJA=;
 b=P4L/iT8UL54DQaXpYXeX8bvQv2MyffY7+aBf+hzQ1PkZXXYYB/S/s0tX6vaPImNFSO
 gMVHqLFnZz6U6Q8lCJT2pCMtUT/l1qMWJ6FplqBE18gsYF7d/HyUnbSadnRVZHcweQMC
 uK9M7n9D7CpjqGyQKIrP0fq02D7No0glMsO2IR9yvpDXpSEjgBoznY/huFS5PdaVx72r
 Or5iggRF/MIxXSkJkxJw2xU4/WcvaGN/OpXBBvH2JWJxo3s629iSxRQ967Yyt52dyfGM
 WUm+2lY/yPB7aXdbqIKiTm0/ElIazEpvG/XJQ28yEiHpiPmCXvxuN7wo+/wODHYVNvqx
 bHqw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=P4L/iT8U
Subject: Re: [Buildroot] [PATCH v3] package/gmp: Fix for c23
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, May 07, 2025 at 10:23:24PM +0200, Julien Olivain wrote:
> Hi Charlie,
> 
> On 25/04/2025 00:49, Charlie Jenkins wrote:
> > GMP will not build for a C compiler configured for c23 because its
> > autoconf scripts use deprecated function prototypes. Include an upstream
> > patch that fixes this issue.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> 
> I'm sorry I missed your patch. I wrote an apply a similar one at:
> https://gitlab.com/buildroot.org/buildroot/-/commit/31569bcc1b0762636d704baad0b35fc37aedb386
> I'll mark it as "superseded".
> 
> On my side, my main motivation was to quickly fix host-gmp with gcc,
> which was at that time generating a lot of build failures. I also
> applied the fix for the target package.

No worries, thank you!

- Charlie

> 
> Best regards,
> 
> Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
