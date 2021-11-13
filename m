Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43180C43217
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 18:11:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D455761208
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 18:11:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D455761208
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CCE040173;
	Sat, 13 Nov 2021 18:11:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w5vAce-np_6s; Sat, 13 Nov 2021 18:11:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D155400BF;
	Sat, 13 Nov 2021 18:11:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F4EB1BF863
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 18:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BA7A6062B
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 18:11:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oZDYChBEtlY0 for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 18:11:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5659D60622
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 18:11:00 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id e7so10854372ljq.12
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 10:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=le0Nr3aTjSNTnYsOQYWRiFDIcohDhSdcuezC+1y41gs=;
 b=RTxViJGYuhwPWcJy085Tn1hjObE4hT1Um5PojrNok8w04NBZvBhc3PP3Bz+pDB00Ml
 +Pgp4smnbdtMrwMzlzL0Y2EPpV7/riPPWdCUG7D+3zA9lQMTntM5ejumJzI3YKbX2GRw
 kZnOq0tgY5FfSm/bypLLsIwAbT+Eo9/UcIbeulJmmKPAd6jiJti0nAz6Xocb2Tk6TT5i
 zKwkokl7Cvrkx9vKsrRxNa0euZOZUNmn/PCBTeZjD70dNmtEVoWIO/PWwl7sUkQ7xqK/
 rEjJMxkxAshDtdq2SqhsWnke7f7FjFi0s1ToG6BmWKftG+LqTwEIVmzF6ak+86YPx+v0
 ZzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=le0Nr3aTjSNTnYsOQYWRiFDIcohDhSdcuezC+1y41gs=;
 b=XQWU4q/YG9kpQso7nAX98b4PsCE4mb6ANt7isePIkgABO8C6+bEwiARq2EUzT+7s7x
 uE84dUJTx87bSbn+CRlZEMON6+QPAZnSvwMd+tv/snpX7FQ7LH8EWzQ2YdHdJyw9p98u
 sH7jULBU31pQH/z2J6U9BExYBfFE9G/M8HBqBiYDCguWFa154nSzHkMNWP7mcmonfsef
 injrshSDzwxIAadn1bAxcg3gr9xknN32dtSOv5ltG5KRwoZUF9SOoJ2WMrEJ0qMJm10+
 C4FpjKis+Xug8IypJDoGnB6ZJ1fceST6+EWRT0SOX0gP4IGjuhRop9Z7dYr8LEixTd1O
 9mVQ==
X-Gm-Message-State: AOAM5322Wcvw0zTrP1vfYXVPetNV8yfuWCPL5X1JLiQaT9l2/zGmKmW3
 1zUt0PVt7kcNwVsrCGA2YSSoXPdJKqM=
X-Google-Smtp-Source: ABdhPJwYLmdI24t0p+hD6yJD2lP0hW4uIV5wO9N1lm7JZc40mBls0vWB36RgFnBCKhXqS6ZgVQfaww==
X-Received: by 2002:a2e:5d7:: with SMTP id 206mr24840868ljf.133.1636827058034; 
 Sat, 13 Nov 2021 10:10:58 -0800 (PST)
Received: from [192.168.10.7] ([178.155.5.87])
 by smtp.gmail.com with ESMTPSA id h7sm906880lji.112.2021.11.13.10.10.57
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Nov 2021 10:10:57 -0800 (PST)
To: buildroot@buildroot.org
From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Message-ID: <d32c5762-899a-d9f9-c634-c696c1b4a4b5@gmail.com>
Date: Sat, 13 Nov 2021 21:10:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Language: ru-RU
Subject: [Buildroot] Using UUID to specify the root file system location.
 Orange pi zero
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ZGlmZiAtdSAtciAtTiBhL2JvYXJkL29yYW5nZXBpL29yYW5nZXBpLXplcm8vYm9vdC5jbWQgCmIv
Ym9hcmQvb3JhbmdlcGkvb3JhbmdlcGktemVyby9ib290LmNtZAotLS0gYS9ib2FyZC9vcmFuZ2Vw
aS9vcmFuZ2VwaS16ZXJvL2Jvb3QuY21kwqDCoMKgIDIwMjEtMTEtMTAgCjE1OjE3OjM4LjAwMDAw
MDAwMCArMDMwMAorKysgYi9ib2FyZC9vcmFuZ2VwaS9vcmFuZ2VwaS16ZXJvL2Jvb3QuY21kwqDC
oMKgIDIwMjEtMTEtMTMgCjIwOjU2OjE4LjA0NTA3NTc3OCArMDMwMApAQCAtMSw4ICsxLDEyIEBA
CiDCoHNldGVudiBmZHRfaGlnaCBmZmZmZmZmZgoKLXNldGVudiBib290YXJncyBjb25zb2xlPXR0
eVMwLDExNTIwMCBlYXJseXByaW50ayByb290PS9kZXYvbW1jYmxrMHAyIApyb290d2FpdAorcGFy
dCB1dWlkIG1tYyAwOjIgdXVpZAorc2V0ZW52IGJvb3RhcmdzIGNvbnNvbGU9dHR5UzAsMTE1MjAw
IHJvb3Q9UEFSVFVVSUQ9JHt1dWlkfSByb290d2FpdAoKIMKgZmF0bG9hZCBtbWMgMCAka2VybmVs
X2FkZHJfciB6SW1hZ2UKIMKgZmF0bG9hZCBtbWMgMCAkZmR0X2FkZHJfciBzdW44aS1oMi1wbHVz
LW9yYW5nZXBpLXplcm8uZHRiCgogwqBib290eiAka2VybmVsX2FkZHJfciAtICRmZHRfYWRkcl9y
CisKKyMgUmVjb21waWxlIHdpdGg6CisjIG1raW1hZ2UgLUMgbm9uZSAtQSBhcm0gLVQgc2NyaXB0
IC1kIGJvb3QuY21kIGJvb3Quc2NyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
