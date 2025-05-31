Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFD8C5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 17:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66D16409F3;
	Sat, 31 May 2025 17:05:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sIJOVWPNyhJr; Sat, 31 May 2025 17:05:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAA5B40AA8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAA5B40AA8;
	Sat, 31 May 2025 17:05:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 33DB5117
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2577040AA8
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:05:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id myq8sdIYdje9 for <buildroot@buildroot.org>;
 Sat, 31 May 2025 17:05:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=stefan.nickl@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 44BEB409F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44BEB409F3
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 44BEB409F3
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:05:21 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a375d758a0so2517959f8f.0
 for <buildroot@buildroot.org>; Sat, 31 May 2025 10:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748711119; x=1749315919;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MNagHLdpYbVMuLWRKY01THty6z9ikv0FH2J7oe19yM8=;
 b=HbwTpJu2vDyvuQ6WCmMLVJep6MRLGWHXKmqvOm1IVp8MtkE4fXP9yS1u0u5GObd9KX
 X2HJ65s/QuxcWWx6GcBkuzZqK5WI49X7luG0gsXVVEadaUnsN3XPrHvtgx+JKgnT1enP
 1+A8e8SaSUVa5GosBEZ0JzFzpRK7RmzNVYw+gifXbo4w4FSQjISiG1vRZjViFVVRo8q1
 6tYljYC6JzrCoMEjHUfIxXBjOiWegja8S2+TW7a4kDY05HaYazVfAz6OZ8VVZych3r0X
 pT5vztFFC2J4Dpqw58p9EcpqeQcomVutQCYVgy5RNJp0IPBN4tCk2QeY08LkMEtQnrjJ
 gFuA==
X-Gm-Message-State: AOJu0YwGjWhkH8AprVRZVozQ0ppCCDhvgp05yP/0YJI3ZtoVk6WWXU+d
 +N0Mhq0dIok9qxB05bg0U30o0sVQMqaJPXSvFzPyPQIdutTRM71Q/2wudkU20A==
X-Gm-Gg: ASbGncuQ9icPchclbK/zL0Wi3YYnmhyFAUXLoWwbnbHoa4SPn42apmgphc0Ub1oOWNd
 qP9HieIradsCmWaLSsbjFn3A1Q0dKnNEgj+SkcFjqnv5gdQwL8GNnxFNIy1M33oaXgXUkbyfFdm
 IDh5DULYu5LpTRsy2Gu21AbGEIDDzK3jesPdeT/Fwfg+/ke/vnC571shwK8twnmQigf+ABPcFf2
 g6tajHik/msquOYMLfgsOfCw++f8RJ2SqwhiPT07mkrJyCd4UXwLa3CSeXdgWtNfJeCsu2zRybS
 H5vpmheo/i4oxIA40t27WgfYMhxOBsji3G2EQSQx9vI5cc9f++GOuIRPXtws+JVaiB7Egvi3qVP
 /AYbHdB94pG+TRXXBE9rDx5NczCbzQSIckpSjKPMh6btbFd+lMYh+/9+atWfd3FQa7Xm2Wj6is7
 huXckt1a5gnQ==
X-Google-Smtp-Source: AGHT+IHVK891G5sArNVrWkx0hVIBm6sLrhq/RrHcwEx031dg6JUvpdbSE/+zQgzhtKf2bLwZXxJSgA==
X-Received: by 2002:a05:6000:40ca:b0:3a4:f72a:b18a with SMTP id
 ffacd0b85a97d-3a4fe18708dmr2020025f8f.26.1748711119112; 
 Sat, 31 May 2025 10:05:19 -0700 (PDT)
Received: from ?IPv6:2003:d1:973f:f600:2879:4b00:19d2:def9?
 (p200300d1973ff60028794b0019d2def9.dip0.t-ipconnect.de.
 [2003:d1:973f:f600:2879:4b00:19d2:def9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4f009f865sm8462658f8f.81.2025.05.31.10.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 May 2025 10:05:18 -0700 (PDT)
Message-ID: <f20a8e9711025d8cebb71b8b0d93ece783e9be50.camel@gmail.com>
From: Stefan Nickl <stefan.nickl@gmail.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Date: Sat, 31 May 2025 19:05:17 +0200
In-Reply-To: <CACXRmJjfEMb4zGfoWxbDLsV4aw7a3cp+PiJXRuE9kdfKYUmOcQ@mail.gmail.com>
References: <CACXRmJjfEMb4zGfoWxbDLsV4aw7a3cp+PiJXRuE9kdfKYUmOcQ@mail.gmail.com>
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748711119; x=1749315919; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=MNagHLdpYbVMuLWRKY01THty6z9ikv0FH2J7oe19yM8=;
 b=GYype4fGyC+OOoSuKtp1QEdGtzYOsSMK5t46R5j2q2GOc911bKdpO5Th3kDOhfXRi7
 CJXsdTteE0opSKvujPyC8WyoOou/lM9cmTcGEPkEpaJF5g83W33nh/2w7I9MbrsL+xK2
 c3786yGyYRCDMLRnIJNc6M4E6usM/t8hqTImLsgdjy5EGZygY8kBprRW+PbIhfBzq8th
 jXn4UQmJuR3QIrDNaDghFpjBviEI8xQrfoE9V72xnTuZwFSzdDIV/Yw4TLUVexN6RHdG
 PWZKVDH6wXHgBI0tAF9uw3T1YFcQH5jD85rDl0L9z/sbj3SWAhRC4EdTSSZkeLKWU0n+
 8Z6Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GYype4fG
Subject: Re: [Buildroot] [PATCH 1/1] Add gh site method for GitHub cli
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCAyMDI1LTA1LTMxIGF0IDA5OjQ1ICswMjAwLCBUaG9tYXMgRGV2b29nZHQgd3JvdGU6
Cj4gPiA+IFRoZSBtYWluIGFkdmFudGFnZSBpcyB0aGF0IGl0IGFsc28gd29ya3MgZm9yIHByaXZh
dGUgR2l0SHViCj4gPiA+IHJlcG9zaXRvcmllcyBhZnRlciBsb2dnaW5nIGluIHdpdGggImdoIGF1
dGggbG9naW4iLgo+IAo+IElmIHlvdSBoYXZlIHRvIGNhbGwgImdoIGF1dGggbG9naW4iIG9uIHlv
dXIgc2VydmVyLCB3aHkgZG9uJ3QgeW91Cj4gY2FsbCAiZ2ggYXV0aCBzZXR1cC1naXQiLiBUaGlz
IGNvbW1hbmQgd2lsbCByZWdpc3RlciBhIGhlbHBlciBzY3JpcHQKPiB0byB5b3VyIGdsb2JhbCBn
aXQgY29uZmlndXJhdGlvbiwgZG9pbmcgZXhhY3RseSB3aGF0IHlvdSB3YW50LiBOYW1lbHkKPiBh
ZGRpbmcgdGhlIHJlbGV2YW50IGhlYWRlcnMgdG8geW91ciBnaXQgaHR0cHMgY2FsbHMuwqAKPiAK
PiBodHRwczovL2NsaS5naXRodWIuY29tL21hbnVhbC9naF9hdXRoX3NldHVwLWdpdAoKVGhhbmtz
IGZvciB0aGUgYWR2aWNlLCBidXQgd2hhdCBJIHJlYWxseSB3YW50IGlzIGEgY2Fub25pY2FsIGFy
Y2hpdmUKZG93bmxvYWQgKGFuZCBJIHRoaW5rIHRoZSBjb3JvbGxhcmllcyB0byB0aGF0IHdpdGgg
Z2l0aHViIGhhdmUgYmVlbgpzdWZmaWNpZW50bHkgZGlzY3Vzc2VkIGJlZm9yZSkgaW5zdGVhZCBv
ZiBnaXQgY2xvbmUuCgpSZWd1bGFyICJGT09fU0lURSA9ICQoY2FsbCBnaXRodWIuLi4pIiwgbm8g
ZXhwZW5zaXZlIGxvY2FsIGNsb25lCm9wZXJhdGlvbiwgbm8gYnIxL2dpdDQvZ2l0NSBmaWxlcyBl
dGMuCgpDaGVlcnMsIFN0ZWZhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
