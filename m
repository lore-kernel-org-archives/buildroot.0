Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC2FC87FCB
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 17:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CE9E80C8E;
	Sat,  9 Aug 2025 17:56:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YiScEnsKcvYF; Sat,  9 Aug 2025 17:56:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C89F580C70
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C89F580C70;
	Sat,  9 Aug 2025 17:56:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 230B61D3
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 17:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F233B402D7
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 17:56:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bnNYjXgTzbmB for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 17:56:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B021F403AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B021F403AD
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B021F403AD
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 17:56:12 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-af934d7c932so428812466b.3
 for <buildroot@buildroot.org>; Sat, 09 Aug 2025 10:56:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754762171; x=1755366971;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FmhDUwRyr6xPNCKZdg5ffnI6Nj9ZjhSCN5/KVjl1ESg=;
 b=UQKIj6qH39/fY47KjCKcczq94P5Vh9aFMVKK0/2dDEy14qh5pjghhgIEWi5J8GKz/5
 vnFFjLMpKuJF3GCrVIdhmsobNhmws4x7KhGYtqV1/hwVBT4VfBxeZKEyCgKMr7uehsZu
 aFy3W/XhTgBOCBJYm0zxrcHfC1BKDJrwApn1Ec95kwerPFdEgFwKCaKv9ltSoAgbnG5M
 heGHOXqLE9UlzZ5ZXRKOuEx5XFU09HjvzQoyqtqsqoqJ6JPys0O8uhQ7ElQsvccdTaqS
 JdL5k2ODISzm0Hy652b3CrCTeECZa4ZIwAGNg1pCDWmV7xaXGNx0iOVMt6V6HqHczyCg
 D6UQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoDu6lwk+7FiCfJWpn2e76doaVy7r1wZ1igbEfFXgm1du8u8xG1HwqnV/CcaS5iiPI8cydFFvGxiw=@buildroot.org
X-Gm-Message-State: AOJu0YzfcDNJJFRi7YY4/33pWjsEKVGcOmWdqbd7Qr2xfoFh/AOmqKQu
 Ubq9FvQoLGgyfvTedddhPSo+/tWAj8dRoNODmlbkmgoEo+AdDVD9H4O7ClWGlke7xF2vAVaO3GS
 QOZo5
X-Gm-Gg: ASbGncvwADwmTD4xsg1xS+43jCHJZ0cfpU2iq/vlDNsJzR32vWxJbSdIrOHiz/6wGwB
 LFq+t1mmgDglQNfW9Y5dbNOSrwuyOFlUk8hy0cPGm4nk4Mge9rYuwHRjPGK7YHuxOI8lwZs/AFy
 Y+PEnPFB0JpN3Ap9oEHMtDMVDqI07+tFkwr3YOF74NAtRr+e3CH+BaL7QM+Xeyox4g9DCrvFa+K
 bYbLWL3+tz12E1Gr/3dfDuy6vsfSuPCoPGn68rrYUEOmWjX43hO/VBGXUI9k61XLG8byDtsbgAY
 Nu2dYnSaFMVN8X8G2NtAQj3iMF1fnBu3s00QiSntUyZF7br0vuA+upSqbco7X0tmCd7AgUHMP8V
 kQj67qYisRJzFnqdAeI9CZTOV
X-Google-Smtp-Source: AGHT+IGPDCE0JumvUrOMYmIyGwaGnmkVIS2uWKawTWx1pLk6n5bwJlM92R0T6SGpbT7YlbxId2U2qw==
X-Received: by 2002:a17:907:da4:b0:af9:3d0a:f38f with SMTP id
 a640c23a62f3a-af9c6086b26mr690739666b.0.1754762170633; 
 Sat, 09 Aug 2025 10:56:10 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a3792sm1688735866b.50.2025.08.09.10.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 10:56:10 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Thomas Perale via buildroot <buildroot@buildroot.org>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat,  9 Aug 2025 19:56:09 +0200
Message-ID: <20250809175609.315576-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <87h5yhq39c.fsf@dell.be.48ers.dk>
References: <87h5yhq39c.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754762171; x=1755366971; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FmhDUwRyr6xPNCKZdg5ffnI6Nj9ZjhSCN5/KVjl1ESg=;
 b=RFx4wPHc54K40UgggiTyUSyNFYeYoAUqLyqn4OgJi+kpkKfc19rZk66TK1KFCysg9B
 ZsmzrU6hAkeZgoH3MJbiGlRzaGE9/kJAyEGsiULqnZUela0A1WZErap//CHWR4VRM76c
 maVECCmykie1AvyubG5wHjgZ4zpVuDLE4p1yZfngUTroaN4USQtpAr1YRTT9jS2FseUm
 VMa61KMTIUvcE/IdL39jm/LlUYCDXZP3tQIm7FR+Dnd4FXXdDN4H3rM9055rnztRwMqg
 ZL60VsIaCa+svzUga+1x9GnLPtw7n6Lpym9XdVtZ/xCZrIU4fgTH24x+z99EWhreLTHl
 bhoQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RFx4wPHc
Subject: Re: [Buildroot] [PATCH] package/libapparmor: fix build w/ musl
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
> >>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:
> 
>  > When building the libapparmor package with musl the following error
>  > would appear:
> 
>  > ```
>  > test_multi.c: In function 'main':
>  > test_multi.c:27:30: error: implicit declaration of function 'basename' [-Wimplicit-function-declaration]
>  >    27 |         printf("File: %s\n", basename(argv[1]));
>  >       |                              ^~~~~~~~
>  > test_multi.c:27:24: warning: format '%s' expects argument of type 'char *', but argument 2 has type 'int' [-Wformat=]
>  >    27 |         printf("File: %s\n", basename(argv[1]));
>  >       |                       ~^     ~~~~~~~~~~~~~~~~~
>  >       |                        |     |
>  >       |                        |     int
>  >       |                        char *
>  >       |                       %d
>  > make[3]: *** [Makefile:466: test_multi_multi-test_multi.o] Error 1
>  > ```
> 
>  > This error can be reproduced with the following:
> 
>  > ```
>  > cat >.config <<EOF
>  > BR2_aarch64=y
>  > BR2_TOOLCHAIN_EXTERNAL=y
>  > BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
>  > BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_BLEEDING_EDGE=y
>  > BR2_PACKAGE_LIBAPPARMOR=y
>  > EOF
>  > make olddefconfig
>  > make libapparmor
>  > ```
> 
>  > On musl libc the function `basename` is provided by included libgen.h.
>  > This error has been addressed upstream in [1] by re-defining the
>  > function `basename`.
> 
>  > Also, `libapparmor.mk` refered to patch 0001 which has been removed in
>  > [2] so I removed that reference. The autoreconf is still needed.
> 
> Please don't mix multiple changes in a single commit. It is not right
> away obvious to me why autoreconf would be needed if we don't patch any
> of the build files, so I have dropped this change for now and committed.
> 
> Please send a separate patch for the autoreconf issue with a description
> of why it is needed.

Peter,

I sent a follow-up regarding your remark here https://patchwork.ozlabs.org/project/buildroot/patch/20250809175417.315091-1-thomas.perale@mind.be/

Best Regards,
PERALE Thomas

> 
> -- 
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
