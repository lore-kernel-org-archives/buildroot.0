Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C53C3DA61
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 21:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB5B96064E;
	Thu, 18 Jul 2024 21:00:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RkhE_N43r7n3; Thu, 18 Jul 2024 21:00:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEBF1607AD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEBF1607AD;
	Thu, 18 Jul 2024 21:00:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 36A3B1BF3F9
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 21:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 309D540F3B
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 21:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EJaa56TF097F for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 21:00:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 08D8740E5D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08D8740E5D
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 08D8740E5D
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 21:00:23 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-42797bcfc77so7180115e9.2
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 14:00:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721336421; x=1721941221;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SYxZ9MW749wMMPjn0SIcycLsNVmyZI4usZqgiJJisw8=;
 b=FAsLOqh9OR/sgB/YOpeObsngDAejRsUm4gWAh1N73AqHhB1V1HJ4RgVuqzGBbv+ch2
 24acZdNOkwjlJ7lDoTPyxGNoXhtZWXTzT0ix75KOUuIUDKpReUIhL581sVL/8Q9pM3at
 u1pudMSskWk3kedxN6pSsxFmgM+Nubb24l2UXe+wLwLwzAC8T6dCPuxPCGcLP6+9jaqp
 fJDjTl++b6b+x2VRLgtjAQBbzJG04cyxdKvZga1ndy97WKz1Gtt/l0RiPTPOBCpvO//B
 upFknJS5NudItZjCgI1npG3zWwdpuLRlPKrK3eX9LkRp0JWTVoqLgH6y99aWzCGCi+C4
 3Ugg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyuSOPattqXJxFAmJ4k4XL2ssqN+myBQjKkxlASUMjMbEGZY8bfUWjS8aIpftKYp0zUSxYIyxzWTrNUtDhVfKk1UY5kj9FuQ==
X-Gm-Message-State: AOJu0Yyu0Cmp4KMV81u/yzNcJZmGM1UMtVZ6+p1AEd8wQWhPU9EZi6YU
 hBgw90G0bVrNWV3VFfp4I0PJKK62jQucKB6VDtsb0sKBX9QRMPcl1Xo1WVhM76M=
X-Google-Smtp-Source: AGHT+IGOEu+zRLOGM0AsU/16T1mkuMtF9DpWfRS/2eVtFopVVvp93Xi6XzQL/FBqjqIIo0z55Fs+/w==
X-Received: by 2002:a05:600c:35d6:b0:423:791:f446 with SMTP id
 5b1f17b1804b1-427c2cc9898mr41051485e9.7.1721336421371; 
 Thu, 18 Jul 2024 14:00:21 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d68fa9b1sm1467395e9.8.2024.07.18.14.00.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 14:00:20 -0700 (PDT)
Message-ID: <626b346a-1874-469b-bfb3-0d9286439438@mind.be>
Date: Thu, 18 Jul 2024 23:00:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Gero_Schw=C3=A4ricke?= <gero.schwaericke@posteo.de>,
 buildroot@buildroot.org
References: <20240403213135.699268-1-gero.schwaericke@posteo.de>
Content-Language: en-GB
In-Reply-To: <20240403213135.699268-1-gero.schwaericke@posteo.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721336421; x=1721941221; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SYxZ9MW749wMMPjn0SIcycLsNVmyZI4usZqgiJJisw8=;
 b=a5aJvVEUesCH1GZnjhdG7L7J9iYZ2Uog5bBg7Yyu9D9/MWZN5M0U04s4K9iptd42QB
 aEgGyTKCnXd0eSTvz5xrr6dk7EhJN5X6k1VtRusj8qDpuKLymTrGr2x4rHop8V58oKR0
 Re+kp0MYARquWbqfWooTRtqbBvH4auTk+sH5bT2B3NDzflJumSLoQ7iPdWznUpoFoyER
 cBepvbvZPeQdTVcZsviOVI1XKVdZdD/UjrwOGCH2jRincbTDbetYrBzzQeSWRg8JG8Wv
 y0CzgmuvHd2YNqsq9s8Yl9QH9eNA6hOyjpNh+vgUPpNH9cnbMW5LJT2NONjAvJuLxp1Q
 4Pgw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=a5aJvVEU
Subject: Re: [Buildroot] [PATCH] docs/manual: promote using fixed version
 for kernel headers when contributing a board
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwMy8wNC8yMDI0IDIzOjMwLCBHZXJvIFNjaHfDpHJpY2tlIHdyb3RlOgo+IFdoZW4gdGhl
IGRlZmF1bHQgKG5ld2VzdCkga2VybmVsIGhlYWRlcnMgc2VyaWVzIGNoYW5nZXMgdGhlIGJ1aWxk
IGNhbgo+IGJyZWFrLiBFeGFtcGxlIGVycm9yIG1lc3NhZ2U6Cj4gCj4gICAgSW5jb3JyZWN0IHNl
bGVjdGlvbiBvZiBrZXJuZWwgaGVhZGVyczogZXhwZWN0ZWQgNi44LngsIGdvdCA2LjUueAo+IAo+
IEluIHRoZSBhYm92ZSBjYXNlIHRoZSBkZWZjb25maWcgdXNlZDoKPiAKPiAgICBCUjJfTElOVVhf
S0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKPiAgICBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJT
SU9OX1ZBTFVFPSI2LjUuOSIKPiAKPiBUaGUga2VybmVsIGhlYWRlcnMgd2VyZSBub3Qgc3BlY2lm
aWVkLCBzbyB0aGUgYnVpbGQgZGVmYXVsdGVkIHRvIHVzaW5nCj4gdGhlIGtlcm5lbCBzb3VyY2Vz
IGFzIGhlYWRlciBzb3VyY2UgYW5kIHRoZSBkZWZhdWx0IChuZXdlc3QpIGhlYWRlcgo+IHNlcmll
cy4gRnJvbSAuY29uZmlnOgo+IAo+ICAgIEJSMl9LRVJORUxfSEVBREVSU19BU19LRVJORUw9eQo+
ICAgIEJSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNl84PXkKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBHZXJvIFNjaHfDpHJpY2tlIDxnZXJvLnNjaHdhZXJpY2tlQHBvc3Rlby5kZT4K
PiAtLS0KPiAgIGRvY3MvbWFudWFsL2FkZGluZy1ib2FyZC1zdXBwb3J0LmFkb2MgfCA2ICsrKysr
LQo+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+
IGRpZmYgLS1naXQgYS9kb2NzL21hbnVhbC9hZGRpbmctYm9hcmQtc3VwcG9ydC5hZG9jIGIvZG9j
cy9tYW51YWwvYWRkaW5nLWJvYXJkLXN1cHBvcnQuYWRvYwo+IGluZGV4IGVmNmRiZDNjMmIuLjg1
ZmQwODE1YTggMTAwNjQ0Cj4gLS0tIGEvZG9jcy9tYW51YWwvYWRkaW5nLWJvYXJkLXN1cHBvcnQu
YWRvYwo+ICsrKyBiL2RvY3MvbWFudWFsL2FkZGluZy1ib2FyZC1zdXBwb3J0LmFkb2MKPiBAQCAt
MzIsNyArMzIsMTEgQEAgQWx3YXlzIHVzZSBmaXhlZCB2ZXJzaW9ucyBvciBjb21taXQgaGFzaGVz
IGZvciB0aGUgZGlmZmVyZW50Cj4gICBjb21wb25lbnRzLCBub3QgdGhlICJsYXRlc3QiIHZlcnNp
b24uIEZvciBleGFtcGxlLCBzZXQKPiAgICtCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9O
PXkrIGFuZAo+ICAgK0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUUrIHRvIHRo
ZSBrZXJuZWwgdmVyc2lvbiB5b3UgdGVzdGVkCj4gLXdpdGguCj4gK3dpdGguIElmIHlvdSBhcmUg
dXNpbmcgdGhlIGJ1aWxkcm9vdCB0b29sY2hhaW4gK0JSMl9UT09MQ0hBSU5fQlVJTERST09UKwo+
ICsoZGVmYXVsdCkgYWRkaXRpb25hbGx5IGVuc3VyZSB0aGF0IHRoZSBrZXJuZWwgaGVhZGVycwo+
ICsrQlIyX0tFUk5FTF9IRUFERVJTXyorIGFuZCAoaWYgYXBwbGljYWJsZSkgdGhlIGN1c3RvbSBr
ZXJuZWwgaGVhZGVycwo+ICtzZXJpZXMgK0JSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19D
VVNUT01fKisgbWF0Y2ggeW91ciBrZXJuZWwKPiArdmVyc2lvbi4KCgogIEFwcGxpZWQgdG8gbWFz
dGVyLCB0aGFua3MuIEkgc2xpZ2h0bHkgcmV3b3JkZWQgdGhlIHRleHQgc3RpbGwuCgogIFJlZ2Fy
ZHMsCiAgQXJub3V0Cgo+ICAgCj4gICBJdCBpcyByZWNvbW1lbmRlZCB0byB1c2UgYXMgbXVjaCBh
cyBwb3NzaWJsZSB1cHN0cmVhbSB2ZXJzaW9ucyBvZiB0aGUKPiAgIExpbnV4IGtlcm5lbCBhbmQg
Ym9vdGxvYWRlcnMsIGFuZCB0byB1c2UgYXMgbXVjaCBhcyBwb3NzaWJsZSBkZWZhdWx0Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
