Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4A6CD1288
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 18:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C60A404EB;
	Mon,  1 Apr 2024 18:39:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wcNrOSx8cIo7; Mon,  1 Apr 2024 18:39:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9670404EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9670404EE;
	Mon,  1 Apr 2024 18:39:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C32991BF28E
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 18:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDCDE81185
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 18:39:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fwUbcKfB1PNk for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 18:39:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 87CDB8109C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87CDB8109C
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 87CDB8109C
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 18:38:58 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4156a29ff70so4944225e9.3
 for <buildroot@buildroot.org>; Mon, 01 Apr 2024 11:38:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711996737; x=1712601537;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OlUf9DIF5mMaBgZtNnlbQCW8skMijGTvvTch3hpa20U=;
 b=q+rG2J0TBph6Jqei6eBcip0YXcLH/NXSM4E1B+UpJQoMHNYAh6IX1BNrsNF9bbJQoj
 x4OLGcTCfy4nsSlFBOgWhSWXL+k062JMLx2xgS6zdx8FnefIcjqszJsDL0FFiXBgyodB
 Zox7dKXrbqxrG6dDUBar1vlq6d1Ok3sBsdGhKp1p5kTKuxC3UoGWZN8jsvKK8wNqeqXg
 FYgamf8ivPgWIFvXdr+h9Kue1j75SktwAUBGhKwkxU7w8WX5ThbQRbiA5hyL/cdmj3oL
 naMFoWLCHzpljcAfjL1hUe2R+Ao2nUfUBALEZkPh2rVvpMJnQbWNM13lkPA6xoxZQ8Ya
 wPAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhAFWG2aaRWRpHg4XU/aVNRbb9gs6y036L3XBmGR/uiigoFkMgsJhdiKTPNM4zsSaLFHmR6mQwVYsL7hnnTr3M17GOWpZ/3Q==
X-Gm-Message-State: AOJu0YxHsdlXVHqgZz9oZzd1KHGIJ2aUpW3jzIu7G8yiTK2ouBOggQH/
 or84oJqvq3oyjbpuVcyQaHMotnCTHcYJIzFvy+Fh+bNYPOmiOHrcf89o3YzIvQ+kYcZ3gNT6CPQ
 Q
X-Google-Smtp-Source: AGHT+IHo3tOMH5bMTH48KbTmEFM8XvtbRb4ZduTxsbT11HSiZvGxitg1FEtSKUM+txtMunvMkgW6Ag==
X-Received: by 2002:a05:600c:1c02:b0:414:7e73:1f8c with SMTP id
 j2-20020a05600c1c0200b004147e731f8cmr7022717wms.37.1711996736923; 
 Mon, 01 Apr 2024 11:38:56 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 fm12-20020a05600c0c0c00b004156a55592fsm2610084wmb.6.2024.04.01.11.38.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Apr 2024 11:38:56 -0700 (PDT)
Message-ID: <03d6dfc8-3a39-45eb-bdca-7f1654fab9a3@mind.be>
Date: Mon, 1 Apr 2024 20:38:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patricia Holden <pholden@nklabs.com>, buildroot@buildroot.org
References: <CAJ6EmCfd_TZwz3=RKequ=1t1-2Q5FbHENkcrPTu0ebwMEWq_HA@mail.gmail.com>
Content-Language: en-GB
In-Reply-To: <CAJ6EmCfd_TZwz3=RKequ=1t1-2Q5FbHENkcrPTu0ebwMEWq_HA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711996737; x=1712601537; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OlUf9DIF5mMaBgZtNnlbQCW8skMijGTvvTch3hpa20U=;
 b=Bw1wVqP45r1goDW8x+xRjSEwbZP9wampg1R3Wi1zBUJAxA5uhJt/SQ1Q4IUG7rqn/q
 5m5PaOJM9j4Hx1Aq2cK1+DqPitlsLexW7o6fanyB17SXBIr2Xdz8xXMctz0RA7mF/jUa
 bOGxp/mTE/HOAltbHYzLJ7qNgU1FpXnTbo0dIm/JqW762+c8HrBf7a4lkLVM161FzaUZ
 Y/xZYZdoYiDzzeoUWSiOlRKbI0PPBsaFBzBEfPaFOSPQrkLC4k64CnwK4HHZEsmvV4hO
 GJ+C3XbE87I/Cies/05sAFs7HYdxRzpo8AK+miVj/5X5e91oAaY7seNFyrmqXpsMpw+X
 Y1fQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Bw1wVqP4
Subject: Re: [Buildroot] Is there an official browser patch for Buildroot?
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwMS8wNC8yMDI0IDIwOjAwLCBQYXRyaWNpYSBIb2xkZW4gd3JvdGU6Cj4gSSBmb3VuZCBh
IGZldyB0b3BpY3Mgb25saW5lIGFib3V0IGEgcGF0Y2ggZm9yIGNocm9taXVtLCBidXQgdGhleSBh
cmUgZGF0ZWQgMjAxOCAKPiBvciBvbGRlci7CoCBJcyB0aGVyZSBhbiBvZmZpY2lhbCBwYXRjaCB0
byBhZGQgdGhlIGNocm9taXVtLWJyb3dzZXIgYXMgYSBwYWNrYWdlIAo+IGZvciBCdWlsZHJvb3Q/
wqAgT3IgaG93IGFib3V0ICJtaW5pYnJvd3NlciIsIHdoaWNoIEkgaGF2ZSBhbHNvIHNlZW4gdG9w
aWNzIGluIGFuIAo+IG9ubGluZSBzZWFyY2g/CgogIEkgZG9uJ3QgdGhpbmsgdGhlcmUgaGFzIGV2
ZXIgYmVlbiBhbiBhdHRlbXB0IHRvIGF0dGVtcHQgY2hyb21pdW0gaXRzZWxmLCBidXQgCnRoZXJl
IHdhcyBhbiBhdHRlbXB0IGF0IHBhdGNoZXMgZm9yIENocm9taXVtIEVtYmVkZGVkIEZyYW1ld29y
ayAoQ0VGKS4gVGhhdCdzIApub3QgYSBicm93c2VyLCBob3dldmVyLCBqdXN0IGEgYnJvd3NlciBl
bmdpbmUuIEFuZCBhbnl3YXkgaXQgdHVybmVkIG91dCB0aGF0IApDaHJvbWl1bSAoYW5kIGZpcmVm
b3gpIGFyZSB3YXkgdG9vIGNvbXBsaWNhdGVkIHdpdGggdG9vIG1hbnkgdmVuZG9yZWQgCmRlcGVu
ZGVuY2llcyBhbmQgY3JhenkgYnVpbGRzeXN0ZW1zLgoKICBUaGVyZSBhcmUgYSBidW5jaCBvZiBh
bHRlcm5hdGl2ZSBicm93c2VyIGVuZ2luZXM6IHF0NXdlYmVuZ2luZSwgcXQ1d2Via2l0LCAKd2Vi
a2l0Z3RrLCB3cGV3ZWJraXQuCgogIFRoZXJlIGFyZSBhbHNvIGEgZmV3IHNpbXBsZSAiZnJvbnRl
bmRzIiBmb3IgdGhlc2UsIHRoYXQgYmFzaWNhbGx5IHJlbmRlciBhIApzaW5nbGUgd2VicGFnZSBh
bmQgdGhlbiBhbGxvdyB5b3UgdG8gYnJvd3NlIChzbyBubyB0aGluZ3MgbGlrZSBoaXN0b3J5LCAK
Ym9va21hcmtzLCBwbHVnaW5zLCBldGMuKTogcXQtd2Via2l0LWtpb3NrLCBxdDV3ZWJ2aWV3OyBh
bmQgYSBtb3JlIGNvbXBsZXRlIApicm93c2VyOiBtaWRvcmkuCgogIEZpbmFsbHksIHRoZXJlJ3Mg
YWxzbyB0aGUgdGV4dC1tb2RlIGJyb3dzZXIgbGlua3MsIGJ1dCBJIGRvbid0IHN1cHBvc2UgdGhh
dCAKdGhhdCBpcyB3aGF0IHlvdSdyZSBsb29raW5nIGZvci4KCgogIFJlZ2FyZHMsCiAgQXJub3V0
Cgo+IAo+IFRoYW5rcyEKPiBQYXQgSG9sZGVuLCBOSyBMYWJzCj4gCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0
Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
