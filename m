Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3542C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 08:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 799FA40D76;
	Fri, 16 May 2025 08:32:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e0ECSj2j4Zm8; Fri, 16 May 2025 08:32:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9599040D69
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9599040D69;
	Fri, 16 May 2025 08:32:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B8B44185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 08:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E78C831DA
 for <buildroot@buildroot.org>; Fri, 16 May 2025 08:32:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vUHG4lNQovOR for <buildroot@buildroot.org>;
 Fri, 16 May 2025 08:32:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.167.52;
 helo=mail-lf1-f52.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 72E5F8333E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72E5F8333E
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 72E5F8333E
 for <buildroot@buildroot.org>; Fri, 16 May 2025 08:32:37 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-549b159c84cso2123487e87.3
 for <buildroot@buildroot.org>; Fri, 16 May 2025 01:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747384355; x=1747989155;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iKvjtVXz9eGeKwrejUewyq3hnkksmYBHOsO3C1Tl+Ok=;
 b=to/kaN9Knz1NLHQnSberBnR5bEZGKOrc+1p4Yy2eCmdOjRByqAKuIfkSU8BCxy7qSn
 oe06vVqyajGboGoQNxdf7jGq17xvBybmFvPJ23PlUTJGiPPX6INwM/xdjtvpQCPCKjsD
 7mEuP5Nn4L4qkCDJWqD15SikdLwWVsomxpDks4OMvZJW4ndnuRPqiIPe0zBAvjOCH0ur
 p1N6091VOJ++W9HHm33nNa95gIfgw+fi2goXDRAZNpe0QRMYU0lkqb09LI4cES54f50k
 lIU7iaCyQVl/wKAZwxRe+9F8uHByHUWpH6eWq1Tjs1TtuOShbe3SQoD6BOq7TSde1rNu
 JMLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUML1KqaWRoENiTavaYEcEZR+n7iWk+3JiaL5XqjFmrJwp72B19MeK3pfdp7S33nMdZkw7AH5LS2pI=@buildroot.org
X-Gm-Message-State: AOJu0YxWwhB22MxefWUjv0VRttYk7quduT91+BcjHxTn4hG7l2SbH011
 W6oKlZ8EKPEw/kAkLL7deabGsu9ekVyjVXXVyLbhGIHfT7meE7m/hXrK1HeZ2+7Y
X-Gm-Gg: ASbGncvtboxLvhsIQQjTD5Y+hE2uNd3hEv5tRWJ1i1XXjtaxJweOKF+NPcrsAC7gYQc
 /HR0nnGXCwBheLdGa+Jt4rMOMmq4r8C/n5WnO9Ntg+g0DWM/LdNBpTJgZmTcP5WiagebOHjU/kF
 dBk735llR5Z8gACWqgaeZF/PN2KxCRv/BV3QFRWYHl66PRlwrGK2ZTx5WAeng/wjtmbEbOUrJBd
 wP3igu7eHxLpG7g7HW1HnRfSzD/Csv/jYerzS1ZK5eHMBw0mioHX9IzWlkaC6C5MbFvP/Y4SrUX
 SlNhDAtxi8Zwhm1YqZFnC3TmEGtorBgRMpl0MZTJsMKdJX3R7Trlb+Ff/sEiBiJdMRtrEjpdB8O
 3A33liDy0bn+niJhR
X-Google-Smtp-Source: AGHT+IFFaYnaJvDli2ofgUL3rOgV0Bg17hp/9W4IANDv1dLt0BPD0DMMWnLhEH3PwwUbMQCyjm8oKA==
X-Received: by 2002:a05:6512:2601:b0:54d:663b:bdaa with SMTP id
 2adb3069b0e04-550e9906da4mr373074e87.47.1747384354463; 
 Fri, 16 May 2025 01:32:34 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com.
 [209.85.208.175]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e8be810dsm264395e87.157.2025.05.16.01.32.34
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 01:32:34 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-30bf7d0c15eso16665171fa.0
 for <buildroot@buildroot.org>; Fri, 16 May 2025 01:32:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWeIjd1osxYP/67CHwkxXR0gp+nf3zxBFoHit4ghJ9zGDp3hXfRzwkoYeVZ+Uz7nwipwM4Tl2xECUo=@buildroot.org
X-Received: by 2002:a2e:ae13:0:b0:30b:bf4e:f6fa with SMTP id
 38308e7fff4ca-328096cee4amr4550371fa.17.1747384354085; Fri, 16 May 2025
 01:32:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250516072047.3667158-1-thomas@devoogdt.com>
 <87o6vtc7fy.fsf@dell.be.48ers.dk>
In-Reply-To: <87o6vtc7fy.fsf@dell.be.48ers.dk>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Fri, 16 May 2025 10:32:21 +0200
X-Gmail-Original-Message-ID: <CACXRmJg8nU272ZGuOsNOZcEWgV3sSrxoPwHJVTuraYAamQ1acQ@mail.gmail.com>
X-Gm-Features: AX0GCFu6aY5eSSYqHGd-Watq9IcOZmPnKQr2VLUrPv6mD2CJABtzhPGi1NOptPk
Message-ID: <CACXRmJg8nU272ZGuOsNOZcEWgV3sSrxoPwHJVTuraYAamQ1acQ@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH v1] package/fluent-bit: bump to 4.0.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,


Thanks for applying the patch.

I should have mentioned it a bit more clearly, but
https://patchwork.ozlabs.org/project/buildroot/patch/20250516070520.3454317-1-thomas@devoogdt.com/
is needed to fix compilation on toolchains without C++ support. What
do you think about that patch?


Kind regards,

Thomas Devoogdt


Op vr 16 mei 2025 om 09:59 schreef Peter Korsgaard <peter@korsgaard.com>:
>
> >>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:
>
>  > News:
>  > - https://fluentbit.io/announcements/v4.0.1/
>  > - https://fluentbit.io/announcements/v4.0.2/
>
>  > Other remarks:
>  > - Drop the FLB_UNICODE_ENCODER option, as it is no longer needed. [1]
>
>  > - Added support for FLB_OUT_PGSQL.
>
>  > - Compile against the buildroot provided zstd package. [2]
>
>  > - Dropped some patches as they are obsolete. (We use the buildroot packages for them.)
>  >    - 0003-lib-nghttp2-CMakeLists.txt-do-not-require-a-CXX-comp.patch
>  >    - 0004-lib-luajit-cmake-CMakeLists.txt-do-not-require-a-CXX.patch
>  >    - 0006-lib-zstd-only-enable-CXX-support-if-tests-are-requir.patch
>
>  > - Synced the other patches with their upstream equivalent.
>
>  > [1] https://github.com/fluent/fluent-bit/commit/92de130cead75f66bd565496947263168d2d5c37
>  > [2] https://github.com/fluent/fluent-bit/commit/5f409f55ec667b525716be4afd54b5485c9d55c1
>
>  > Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
>
> Committed, thanks.
>
> --
> Bye, Peter Korsgaard
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
