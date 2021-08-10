Return-Path: <SRS0=7M6N=NB=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8812C4338F
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 19:13:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 398686101E
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 19:13:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 398686101E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=essensium.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC1DA40267;
	Tue, 10 Aug 2021 19:13:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4xu2akrKTnc2; Tue, 10 Aug 2021 19:13:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04E0F4026E;
	Tue, 10 Aug 2021 19:13:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C3A221BF951
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 19:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B203A402E1
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 19:13:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=essensium.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FYkRs5Cm7Q5R for <buildroot@lists.busybox.net>;
 Tue, 10 Aug 2021 19:13:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 670E5400C6
 for <buildroot@buildroot.org>; Tue, 10 Aug 2021 19:13:37 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id yk17so37346545ejb.11
 for <buildroot@buildroot.org>; Tue, 10 Aug 2021 12:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=U3YCMNn1FzB49jkCGrP2l/HDN63lMjyX0n0N5soC2kQ=;
 b=KbWUIjDN92vpSE/NVpLOaqTdHRl5E4qeZ7jxoD0V6zOl2GhruP+gpU18vgdmWgqO6A
 WBvDYyjrqqtT1MMVA9vAqCJeASzSI6vhpNovVU6JPngLtwqkt1dEogx8XoiTRA8IOf+h
 CIoPwLNiYtA81g+7h3wdiAACgdQuWwNj1jJy2kQo5MZ4G1/p3IVt4YLJTY8tEjTu5723
 orWOd23t8XG0zykCgWZNb3HIysGktLZLRsZrDsBb1tHHxXSQD5U45FQttuYK/Qq+KWlF
 +KAFVDo5xIVqT/o18xQW81merEpCWbF0k7yKBVs/eR5zrxUB6KuAKCwlbrokZhdZ1TyV
 usCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U3YCMNn1FzB49jkCGrP2l/HDN63lMjyX0n0N5soC2kQ=;
 b=c318sJdWK2+mLD9XWgPn6aFBsaiaE9TqUvBnd3R07CSeL0m0oHx5IB8CZqSpBYnqXC
 SqUOKol4f1G3vv6wWlOdVIiBwbMlQktI7NZQ4T1gJtpw0C2WCO4C6B23KyIf5UxPeoEq
 lM3X+3lI5+OmkjiX8sBS4suYn0tRzpST7gDR+++SH6s8PjJgz0TouDKVw/gatbQrNsue
 6+I+QMKgjx2GDSoz40e9Nd9MX4JI3+BIHkg6ZfLS9QvDF4P10r2K5SC7Z6jvhcQ9AqJR
 qvxIAeJyAqYhbkYfdOAndcoqSxOHV6bb7u+R2rOW6Jy3Nz3DA/9O7nd0TFn/bMdrzAh+
 wj9A==
X-Gm-Message-State: AOAM532RjfGn+bSnZpp/qzjRfeTTNVhXcAPnlfNaDQD4SdFQ3cySY3Py
 qozZB1AdtxvsUGm6rlmHkvJFvw==
X-Google-Smtp-Source: ABdhPJwoEpKyUvNDkVfs0RvaK6mR4sbs+uVWOKJxd4DiA5au6Z8VtcijxhY90KlcBlvNL41+p/TeLg==
X-Received: by 2002:a17:906:498b:: with SMTP id
 p11mr26915eju.295.1628622815474; 
 Tue, 10 Aug 2021 12:13:35 -0700 (PDT)
Received: from ?IPv6:2a02:a03f:6bfb:d00:7eb0:c2ff:fef4:f493?
 ([2a02:a03f:6bfb:d00:7eb0:c2ff:fef4:f493])
 by smtp.gmail.com with ESMTPSA id k18sm926934edo.62.2021.08.10.12.13.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 12:13:35 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20200207150327.4335-1-raphael.melotte@essensium.com>
 <20210805214416.5c2dc2c9@windsurf>
From: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@essensium.com>
Message-ID: <de2de613-bc44-c764-42f1-50ba1a541585@essensium.com>
Date: Tue, 10 Aug 2021 21:13:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210805214416.5c2dc2c9@windsurf>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pydns: new package.
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8sCgpPbiA4LzUvMjEgOTo0NCBQTSwgVGhvbWFzIFBldGF6em9uaSB3cm90ZToKPiBUaGFu
a3MgYSBsb3QgZm9yIHRoaXMgY29udHJpYnV0aW9uLCBidXQgdW5mb3J0dW5hdGVseSB0aGlzIHB5
ZG5zIG1vZHVsZQo+IGhhcyBub3QgYmVlbiB1cGRhdGVkIG9yIHNlZW4gYSByZWxlYXNlIHNpbmNl
IDIwMTIuIFRoaXMgbWVhbnMgaXQgaGFzCj4gYmFzaWNhbGx5IG5ldmVyIHNlZW4gYSByZWxlYXNl
IHNpbmNlIFB5dGhvbiAzLnggd2FzIGEgdGhpbmcsIHNvIGl0Cj4gZG9lc24ndCBtYWtlIGEgbG90
IG9mIHNlbnNlIHRvIGFkZCBzdWNoIGFuIHVubWFpbnRhaW5lZCBwaWVjZSBvZgo+IHNvZnR3YXJl
IHRvIEJ1aWxkcm9vdC4gU28gdW5mb3J0dW5hdGVseSwgd2UgYXJlIGdvaW5nIHRvIHJlamVjdCB0
aGlzCj4gcGF0Y2guCgpJbmRlZWQgaXQgbWFrZXMgc2Vuc2UsIEknbGwgdGFrZSBpdCBpbnRvIGFj
Y291bnQgbmV4dCB0aW1lLgoKVGhhbmtzLAoKUmFwaGHDq2wKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
