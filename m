Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8558CCD1284
	for <buildroot@archiver.kernel.org>; Tue,  2 Apr 2024 14:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03D59407CE;
	Tue,  2 Apr 2024 14:50:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4v-L1TdjjTc0; Tue,  2 Apr 2024 14:50:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBD74409B3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBD74409B3;
	Tue,  2 Apr 2024 14:50:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 80EE21BF317
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 14:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6DCD260BD5
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 14:50:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T7BEid8bRHQ1 for <buildroot@lists.busybox.net>;
 Tue,  2 Apr 2024 14:50:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=gero.schwaericke@grandcentrix.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6497E60C15
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6497E60C15
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6497E60C15
 for <buildroot@buildroot.org>; Tue,  2 Apr 2024 14:50:31 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-515a81928faso6470864e87.1
 for <buildroot@buildroot.org>; Tue, 02 Apr 2024 07:50:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712069429; x=1712674229;
 h=content-transfer-encoding:content-disposition:in-reply-to
 :mime-version:references:mail-followup-to:message-id:subject:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SVU/Jx3epcsvq3ceAwaHnTb5VIe6sMM/SordwOtCd7g=;
 b=sbAjoboHdLnrc5NAzMz5qohn4qbTiVHOuTmtZdr6JM/nX9CJvO7TiiwTZu6/LvEMZ8
 A7JmmBZhaG69d1A7G/gvino7OHWj+SWmDhjZA53BEDlL1XmCFAvZilE/bZ2qVZopnIIB
 XewB9I0OZxHYozLlKYdYF438Jnj7kIqKd5TuWl71506JwVBsx/mkU73k6SE4XocSWUdX
 ymg33mVeHnuSk7Rz674yYhgfgT5K+kD1A9ngDKycsolnMSvgQIPehHfC8swbZZzdeY2E
 YN+cDeXV3hQTBxWiWnZJ/oY70V9/38SPMFGklb46HQjHjsQOOWVUQSI7W23d6Hg8HGsc
 WNsA==
X-Gm-Message-State: AOJu0YzIUPzcM61L2EWaPppbHi4UI4GPEyX8QdicebQyu+ZHbnp2L3fo
 tbroINXU3Ibc2Ao1CIbbiQKwkza2/1ZhxNZSlI1t4E68RkXFFLdAdFULOWRWoCqH4Y8l/gKplmw
 RbwthxO/Myo/Vc7C5vVhyfETkyranPUkrbJcu3U0OQXGWyYdGe83tUYN7F/2GuAdZBBUyIBaZLc
 2NBU85rxCRzkoa135RNYXE6ialLpFctdzcjLStfjW1MQ8bs3nYd6PB1A1k
X-Google-Smtp-Source: AGHT+IEvmWtbs066aGItcJHHwZc6+2DJQvIIEQQgc1x/1QY+UsWOaPQh6hdUjbj+2ftYkw/B3eJUXw==
X-Received: by 2002:a05:6512:3133:b0:515:cc64:973c with SMTP id
 p19-20020a056512313300b00515cc64973cmr8057110lfd.23.1712069428710; 
 Tue, 02 Apr 2024 07:50:28 -0700 (PDT)
Received: from theia ([2a02:8109:8abb:b200:a9c1:c43:4bec:b82e])
 by smtp.gmail.com with ESMTPSA id
 x1-20020a056402414100b00568d7b0a21csm6835783eda.61.2024.04.02.07.50.28
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 07:50:28 -0700 (PDT)
Date: Tue, 2 Apr 2024 16:50:26 +0200
To: buildroot@buildroot.org
Message-ID: <20240402145026.GA886045@theia>
Mail-Followup-To: buildroot@buildroot.org
References: <20240330160244.3214733-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
In-Reply-To: <20240330160244.3214733-1-dario.binacchi@amarulasolutions.com>
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grandcentrix.net; s=google; t=1712069429; x=1712674229; darn=buildroot.org; 
 h=content-transfer-encoding:content-disposition:in-reply-to
 :mime-version:references:mail-followup-to:message-id:subject:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=SVU/Jx3epcsvq3ceAwaHnTb5VIe6sMM/SordwOtCd7g=;
 b=BOY9M5vnBbcO5U+iyGn2CwMFanCkLg3OiNA+JzpSoN7hSumxGT0bGgGiYvrvXXi9l/
 4wEERW5FnhK0WWiEZe6VAoUA+gSeLES4e2JsahVA2dAKsRS4+IS0sQTJdJnVZys2nkj4
 00s6PDxJMgHEEQhBk19eVPj0ZGQXUMzlfohCnxdSywoiGWogIxbzmrKAH07TSiR1ZV/9
 UWpbtiKvjU/srq+isZYMP3tB8EK0vZVQMNGwYcc3kxLsb5z3YjFTYpG7wAL676wlqbs9
 +UXBP4QSdu5dpEaH9EFmbTWH1z9kzfWyN2t+92MSboAIrQ0967DF0Cr39CXtVJPxO8n0
 6qQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grandcentrix.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grandcentrix.net header.i=@grandcentrix.net
 header.a=rsa-sha256 header.s=google header.b=BOY9M5vn
Subject: Re: [Buildroot] [PATCH v10 00/12] Add support for AM62x-SK HS-FS
 devices
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
From: =?utf-8?q?Gero_Schw=C3=A4ricke_via_buildroot?= <buildroot@buildroot.org>
Reply-To: Gero =?utf-8?Q?Schw=C3=A4ricke?= <gero.schwaericke@grandcentrix.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGVzdHMgcGVyZm9ybWVkOgoKKiBjb21waWxlZCB0aV9hbTYyeF9za19kZWZjb25maWcKICAqIHN1
Y2Nlc3MKKiBib290ZWQgb24gQU02MnggU0sgRVZNIChFMykKICAqIHN1Y2Nlc3MKICAqIG5vIG9i
dmlvdXMgZXJyb3JzIGluIGRtZXNnCgpUZXN0ZWQtYnk6IEdlcm8gU2Nod8Okcmlja2UgPGdlcm8u
c2Nod2Flcmlja2VAZ3JhbmRjZW50cml4Lm5ldD4KCgotLSAKCgoK4oCT4oCT4oCTCgoKZ3JhbmRj
ZW50cml4IEdtYkggfCBBIFZvZGFmb25lIENvbXBhbnnCoMK3wqBIb2x6bWFya3QgMcKgwrfCoDUw
Njc2IAoqQ29sb2duZSrCoHzCoFBob2VuaXhzZWVzdHJhc3NlIDE4wqDCt8KgNDQyNjMgKkRvcnRt
dW5kKsKgwrfCoEdlcm1hbnkKfMKgaW4gCjxodHRwczovL3d3dy5saW5rZWRpbi5jb20vY29tcGFu
eS9ncmFuZGNlbnRyaXg+IHwgcGhvbmU6ICs0OS0yMjEtNjc3LTg2MC0wIAp8wqBlbWFpbDogaGVs
bG9AZ3JhbmRjZW50cml4Lm5ldCA8bWFpbHRvOmhlbGxvQGdyYW5kY2VudHJpeC5uZXQ+CgoKZ3Jh
bmRjZW50cml4IGNhcmVzIGFib3V0wqBwcml2YWN5IAo8aHR0cHM6Ly9ncmFuZGNlbnRyaXgubmV0
L2RlL3BhZ2VzL3ByaXZhY3ltYWlsLz4KCkFtdHNnZXJpY2h0IEvDtmxuIHwgSFJCIMKgCjcwMTE5
IHwgR2VzY2jDpGZ0c2bDvGhyZXI6IE0uIEtyw7ZtZXIswqAgUi4gSMOkbmVsIHwgVVN0Li1JZE5y
LjogREUyNjYzMzM5NjkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
