Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F278C36010
	for <buildroot@archiver.kernel.org>; Mon,  7 Apr 2025 09:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD2E540B91;
	Mon,  7 Apr 2025 09:37:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0qEtFeYcVCx7; Mon,  7 Apr 2025 09:37:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0583F40B62
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0583F40B62;
	Mon,  7 Apr 2025 09:37:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 120911DE
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 09:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02F7181C0A
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 09:37:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id McJEW4v249uR for <buildroot@buildroot.org>;
 Mon,  7 Apr 2025 09:37:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.179;
 helo=mail-lj1-f179.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 13DB981911
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13DB981911
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13DB981911
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 09:37:21 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-30bf7d0c15eso40320711fa.0
 for <buildroot@buildroot.org>; Mon, 07 Apr 2025 02:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744018639; x=1744623439;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bIUC6FlzlCcdMRVNISKHNvVt54f0cmJcUYqsuT//D2c=;
 b=WwBsiRaLdfUJTMlQZQf5J0xouOW83/rGDVt1uZ6MtXmZkyJPg8FsiPd9IeR2nrirhe
 auSoQ6KamaIdTBkgaL0uXpb4sa660/A+TR6aAUiziCx3ZnCwC67i6yQZ/yRkAzRXn5vv
 I+3aiFFRQKl8M7Ljkxjb363K7JBmNLhM/ZOzpk5QMYRBYOcJwwMnHzWqogavj7Md3wy8
 WEA3IwkB6FVfD1oOIvJZYrt4GZZQr5MdMb3aMhRx2FF4yDwBsU088vkc2KXXljJc/P2E
 VvBz0RI6hqy2qa2Qorafp+ykgGaLH5pCWMtJPVFua+11fFlZU1Ke52kexIvCPdfXMyZr
 Oesw==
X-Gm-Message-State: AOJu0YxctTN56cK6PwTEvVfzg6P4BG/T9V1Uppn4x3vlZ3vlMIdlWjwo
 R7WTnkQlEcM9iRQtkjx+lTMBGWqGD+nS3IKtAWgVpBgitP1Kl8ff8EiMO4Tm
X-Gm-Gg: ASbGnctOI/6QJybPTjMHwrpBOtVgQtdlCufR+Nk00f3DawbOLhTynPGkYWk7+FPAE04
 LVDy+19oWFsRnb4xBGsNgSIO2uMK65j8AWPAnmac2vNN7t3lUm4h86O6JNB3pOTlO4xXU+y3Bwo
 0SVZY88Qos7aTl+Y5JjWAo8h7YIjpVzedPvVGnxCn5wEmI/m1a3mpECVBNhE6c+SXsRBZHRQC4f
 1sQ6MqNJooeQx1qlkQEhmSdrF9oJ/QqU6TLA+EcQLPd69QTTJozWSBHwZUPE0mmgknXzOKR2PlX
 rnPAa5t1px7ohLJGIGO66ET9+PVA6wiQ4zzSypRO+HxmRn5yrXGM8YleTX4lwq3AdWp5E8qZwfb
 OFFU5Mg==
X-Google-Smtp-Source: AGHT+IGKua52c2xlcgPR+HVaJxZogJtI14k3gGSIH+guV17Of4q45wnnd4g7wiqg64Limz+Smg6E2A==
X-Received: by 2002:a2e:bd81:0:b0:30b:f775:bb25 with SMTP id
 38308e7fff4ca-30f0a190a9emr38418861fa.36.1744018639221; 
 Mon, 07 Apr 2025 02:37:19 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f031bcc02sm15481151fa.82.2025.04.07.02.37.18
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 02:37:18 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-54af20849bbso1429194e87.0
 for <buildroot@buildroot.org>; Mon, 07 Apr 2025 02:37:18 -0700 (PDT)
X-Received: by 2002:a05:6512:e92:b0:549:8d16:7267 with SMTP id
 2adb3069b0e04-54c2276aba5mr3268864e87.10.1744018638757; Mon, 07 Apr 2025
 02:37:18 -0700 (PDT)
MIME-Version: 1.0
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Mon, 7 Apr 2025 11:37:06 +0200
X-Gmail-Original-Message-ID: <CACXRmJiO5UkbDedd6t-GLg8+Bpk0Ff2qOG6ULT1s927zEpc8zQ@mail.gmail.com>
X-Gm-Features: ATxdqUHsZwtrZYIsRVglfQHKK4jpYnbDenJlcSUSzs0cCdNWUkGu8rf6wV4Qw90
Message-ID: <CACXRmJiO5UkbDedd6t-GLg8+Bpk0Ff2qOG6ULT1s927zEpc8zQ@mail.gmail.com>
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH] package/uclibc: update to 1.0.52
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

Hi Waldemar, All,


I see that;
- https://gitlab.com/buildroot.org/buildroot/-/commit/53eae986a5c15afd0ade74875ce96a1b70e7c53b
- https://gitlab.com/buildroot.org/buildroot/-/commit/01895663d37a821ec8d94b52f4d4384b967787e1
has been merged just after this patch, so this one has to be reworked.
(Read dropping those patches as they are upstream.)


Kind regards,

Thomas Devoogdt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
