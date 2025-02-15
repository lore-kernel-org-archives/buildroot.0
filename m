Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D80BC02198
	for <buildroot@archiver.kernel.org>; Sat, 15 Feb 2025 02:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 057F5408C9;
	Sat, 15 Feb 2025 02:52:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ohnUdOYiy5u; Sat, 15 Feb 2025 02:52:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F41304082D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F41304082D;
	Sat, 15 Feb 2025 02:52:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1869372
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 02:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12E384087E
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 02:52:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6kWRQ_Md2y4G for <buildroot@buildroot.org>;
 Sat, 15 Feb 2025 02:52:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 078434082D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 078434082D
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 078434082D
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 02:52:04 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-30918c29da2so19138141fa.0
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 18:52:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739587922; x=1740192722;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lI0tJOtiERrJFVj0/dwJP/194Zkub1r7fPimNcM8jz0=;
 b=dhxFRvzF4RqM6JxzHhWJHjnB6i2/rVJWIQJvAjRQWUo4dmYJ8Xf2stOAxXXNiN49U4
 7dEIDgZ2ukqFOOWlQtguTOJ/XIXXXebmOZXVi8eMI93z9jRYuvQ/0FAo84oFbNGzIwOt
 d1dH1+BzvPqoFwcp5yxKkKuNbTmYDOK8jPweSC9/Tb1T4J+KdsW9lOawk8yWu5QkJSPm
 81FPA5UYVn9dJXtDoXezXIeNcJJf1z4sJB2o0Sq6A8wHaIgiZo/xl6c5pq9WrFAlie8v
 IzqxJs20l1IS4mZdR0zRYrrz7t9tNkbSsqKy08T9TV9yNDRL/6ZKoJkpEJkqnLsoEun0
 OCgg==
X-Gm-Message-State: AOJu0Yw8p9xH+3Vfr5PUwseiNF9HcQW1QLA4YdGkgAJ1pKhz4c06uTWz
 y6GN2eAeGbc4noaAGk8g4/n7O3cirAgMuiEvnYlKA3I8EBMuqZ+CRsjbv9FF0V+bbzb6Hpgob7m
 b6aLAjkurHsWMfa10p4gNYFEKzAw=
X-Gm-Gg: ASbGncsYQ+IYd7fytHpF28J2H4W2+jxFV3L1LizDpIdjh6WNYNvCfDbym1W6J0v3Si5
 ZrRitO9bA2nui69bgHVes3DnShp9kdlE/9HRVmOIa7QNfkpRE2SQcb/4gSP3xXE2ToOeTlmm32g
 ==
X-Google-Smtp-Source: AGHT+IHFkoInY7MG7vqOfBTtT8oSojlGdTohnp45REAAuKh0PQr/Q9fioaSS1sflgkVUXTD9FOC+h+1dUeNawYUanQ0=
X-Received: by 2002:a2e:b60d:0:b0:308:fedf:8c26 with SMTP id
 38308e7fff4ca-30927a429fdmr6023011fa.7.1739587922150; Fri, 14 Feb 2025
 18:52:02 -0800 (PST)
MIME-Version: 1.0
References: <20250214021416.392363-1-fancp2007@gmail.com>
 <20250214074235.917242-1-fancp2007@gmail.com>
 <Z68NsSRTlm0aGSi4@waldemar-brodkorb.de>
In-Reply-To: <Z68NsSRTlm0aGSi4@waldemar-brodkorb.de>
From: Scott Fan <fancp2007@gmail.com>
Date: Sat, 15 Feb 2025 10:51:50 +0800
X-Gm-Features: AWEUYZkYAXgKQ53ld4SRITEdRxpK2u9hDHw3i9-EMv_9lfw_ndlarCycc9alC84
Message-ID: <CAFkzVZZzU+HQQ33Uun0c4fPu5HtLVbkQNF8xX4a0mq+Zc39mDg@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>, Bernd Kuhls <bernd@kuhls.net>,
 Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739587922; x=1740192722; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lI0tJOtiERrJFVj0/dwJP/194Zkub1r7fPimNcM8jz0=;
 b=Ie+tthF7803cBssMeqTKwW9cFbjjiOKE7xWKCIXZl3fdqHxNOVpSqSmR7f2gemAga1
 Fx2uUBRIM4PX2VljjLOSVghfn58EUyBrEHciufSMfNStO3k2DRHEkbxRXgKHwWLmGMZ3
 nmbSZddc4pMqwpR1M1po6UP5/qRGCIIuaxcN/YZuTrWIBV8VWozRVj0j+Pjw4/t7/+wJ
 nAeNl2c+uuYmHwpKWIlEcva2cqZGucBbbPLmCjvpR+z5Fz1kI2zzgyTG7A2rXm+JxaZB
 E/DKDjoyAAt2suveYvgl2mTWFdgul2kTzQ2+6kwBmOXrJfctZjAXxeVG9o6fjJylx79S
 bBlA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Ie+tthF7
Subject: Re: [Buildroot] [PATCH v2] package/sqlite: fix configure options
 for readline/editline support
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSnVsaWVuLAoKT24gRnJpLCBGZWIgMTQsIDIwMjUgYXQgNTozMuKAr1BNIFdhbGRlbWFyIEJy
b2Rrb3JiIDx3YnhAb3BlbmFkay5vcmc+IHdyb3RlOgo+Cj4gV29ya3Mgbm93LiBZb3UgY2FuIGFk
ZCBhCj4gVGVzdGVkLWJ5OiBXYWxkZW1hciBCcm9ka29yYiA8d2J4QG9wZW5hZGsub3JnPgoKUGxl
YXNlIGNvbnNpZGVyIGl0LCB0aGFua3MuCgpTY290dCBGYW4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
