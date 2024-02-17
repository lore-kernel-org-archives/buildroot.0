Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887C5C48BC3
	for <buildroot@archiver.kernel.org>; Sat, 17 Feb 2024 20:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 238D282147;
	Sat, 17 Feb 2024 20:38:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tvKT7W4UATC8; Sat, 17 Feb 2024 20:38:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23E9C8336D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23E9C8336D;
	Sat, 17 Feb 2024 20:38:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6712E1BF59E
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 20:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61EC2414C7
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 20:38:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3fEPDwkZTlL4 for <buildroot@lists.busybox.net>;
 Sat, 17 Feb 2024 20:38:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 31BB5414C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31BB5414C5
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31BB5414C5
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 20:38:18 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4125cf64e24so4627645e9.3
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 12:38:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708202297; x=1708807097;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x+9tEygC6lboQ5eR592WV4o2Ffj307inmGA1MzR9hMM=;
 b=HID7u5t6VgPFdBTIidiNGew6ix5W23Fa5JU+e1QlDd4gmc87jwG4NLJA/xKYambCm5
 T5z74b3xYrWSmKyE9DbC07MM7hPbKgUbKvemK6QC5+o/rp7ENmh0+hFN+b3kK5KMJ2aw
 XjIrHl4bOb0nfwLPdIFYVJzDAXxRcyH8Be2LaUKtYOHCKFMz4nF0JkhULXgTT6Cz6C1o
 8HYhcyF3qbasW3dwCnRSI/Q1Ya2N/sGn9u4ziw/8/5dhd0AUfVEIxMGXfTBX9J+SpW6K
 hV4HBBrp9v/u4zGa1BAXVEa5ul2rm9/tSN0TpXmlIolV8HQYnRHjNxvkeC1Y0njJGZuG
 Ql2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUF3UO0XRVVHl1t02ycm0WpqtmQ4136BBWIsaK8iiabsjVkhT8KGs5OBcN0o3LTJp3r+FK/OPp1lQnRoUIiw5ud+U3BkGWshw==
X-Gm-Message-State: AOJu0YxfGaMzhw1Hyd8RLH3A6w4bUxpKulbVd1+4t/1ObzKsaBGmUK3y
 /6KmObQ/pCKrbMhdkRh26q0hkENgcjEA6z1eaysftTZonVpYjUCG
X-Google-Smtp-Source: AGHT+IEONfT8PToRowCFAJCa6J+Lj6JkYt0832h6ZqYiRAqPAtaWV5lQOibSzXjQbFO2RRMB6VzDzw==
X-Received: by 2002:a05:600c:3549:b0:411:ff38:aa13 with SMTP id
 i9-20020a05600c354900b00411ff38aa13mr6222109wmq.27.1708202296780; 
 Sat, 17 Feb 2024 12:38:16 -0800 (PST)
Received: from giga-mm-1.home ([2a02:1210:8690:9300:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a05600c044a00b004122fbf9253sm6087944wmb.39.2024.02.17.12.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 12:38:16 -0800 (PST)
Message-ID: <f64510a432556f497882e84791e4e64e01630ee3.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 buildroot@buildroot.org
Date: Sat, 17 Feb 2024 21:38:22 +0100
In-Reply-To: <20240217160244.1320482-14-dario.binacchi@amarulasolutions.com>
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <20240217160244.1320482-14-dario.binacchi@amarulasolutions.com>
Autocrypt: addr=alexander.sverdlin@gmail.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.50.4 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708202297; x=1708807097; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=x+9tEygC6lboQ5eR592WV4o2Ffj307inmGA1MzR9hMM=;
 b=CvguKcEe66WhjUD+ALstmfCyj11Y76CW8GaRP66r37tUFeyiHvIbEubT+QGPmftvxz
 qyPoY8bOf2dn5/siBP9za/hsIJQCiV1BHdNFdu2xZMjZAT72rFqF0Aiueyx68hoWbzH8
 17q1tUKtkzzSFAEIHfMqLyJki4fRiQlyU/TZtjaGsfe+h2o6QkwOlInOeW/EMJuEN+L4
 VFv6b8IkT/udm6pB+FqfYZZpSGeI3f0hBw+q0UTgHNhwZo9szfUPvmprYBBxQz8HblFG
 NRbEbclk9LB5+HYT2grnhMmnfhwwnbhtWsT6CvvW/Xd7Rjzef+KqpO7nhterzElS7lwg
 4xwg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CvguKcEe
Subject: Re: [Buildroot] [PATCH v4 13/20] boot/ti-k3-r5-loader: set binman
 environment
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
Cc: michael@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRGFyaW8sCgpPbiBTYXQsIDIwMjQtMDItMTcgYXQgMTc6MDIgKzAxMDAsIERhcmlvIEJpbmFj
Y2hpIHdyb3RlOgo+IFJlY2VudCB2ZXJzaW9uIG9mIFUtQm9vdCB1c2UgYmlubWFuIHRvIHByb3Zp
ZGUgYSBtZWNoYW5pc20gZm9yIGJ1aWxkaW5nCj4gaW1hZ2VzLCBmcm9tIHNpbXBsZSBTUEwgKyBV
LUJvb3QgY29tYmluYXRpb25zLCB0byBtb3JlIGNvbXBsZXgKPiBhcnJhbmdlbWVudHMgd2l0aCBt
YW55IHBhcnRzLgo+IAo+IFRoZSBwYXRjaCBzZXQgdGhlIEJJTk1BTl9JTkRJUlMgZW52aXJvbm1l
bnQgdmFyaWFibGUgdG8gcHJvdmlkZSB0aGUKPiBkaXJlY3RvcnkgdG8gc2VhcmNoIGZvciBiaW5h
cnkgYmxvYnMgYW5kIHNlbGVjdCB0aGUgcGFja2FnZXMgcmVxdWlyZWQgYnkKPiBiaW5tYW4uCj4g
Cj4gQ28tZGV2ZWxvcGVkLWJ5OiBNaWNoYWVsIFRyaW1hcmNoaSA8bWljaGFlbEBhbWFydWxhc29s
dXRpb25zLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFRyaW1hcmNoaSA8bWljaGFlbEBh
bWFydWxhc29sdXRpb25zLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFy
aW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+CgpJIHBlcnNvbmFsbHkgZG8gbm90IHNl
ZSB3aHkgYmlubWFuIHVzYWdlIHNob3VsZCBiZSBjb25maWd1cmFibGUgYXMgaW4KaHR0cHM6Ly9w
YXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDI0MDIxMzE3Mjgx
Ny4yODcyODQ5LTExLXJvbWFpbi5uYW91ckBzbWlsZS5mci8KeW91ciBwYXRjaCBsb29rcyBzaW1w
bGVyLAoKUmV2aWV3ZWQtYnk6IEFsZXhhbmRlciBTdmVyZGxpbiA8YWxleGFuZGVyLnN2ZXJkbGlu
QGdtYWlsLmNvbT4KCj4gLS0tCj4gCj4gQ2hhbmdlcyBpbiB2NDoKPiAtIERyb3AgdGhlIEJSMl9U
QVJHRVRfVElfSzNfUjVfTE9BREVSX1VTRV9CSU5NQU4gb3B0aW9uCj4gCj4gQ2hhbmdlcyBpbiB2
MjoKPiAtIENoYW5nZSBjb21taXQgbWVzc2FnZQo+IC0gQWRkIEJSMl9UQVJHRVRfVElfSzNfUjVf
TE9BREVSX1VTRV9CSU5NQU4gb3B0aW9uCj4gLSBTZWxlY3QgcGFja2FnZXMgcmVxdWlyZWQgYnkg
YmlubWFuIGlmCj4gwqAgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfVVNFX0JJTk1BTiBpcyBl
bmFibGVkCj4gCj4gU2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hp
QGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+IC0tLQo+IMKgYm9vdC90aS1rMy1yNS1sb2FkZXIvdGkt
azMtcjUtbG9hZGVyLm1rIHwgMTMgKysrKysrKysrKysrLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEy
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYm9vdC90aS1r
My1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1rIGIvYm9vdC90aS1rMy1yNS1sb2FkZXIvdGkt
azMtcjUtbG9hZGVyLm1rCj4gaW5kZXggMGZmY2I4MjM1ZjJlLi4yYTEwMDI0YWVkYWEgMTAwNjQ0
Cj4gLS0tIGEvYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1rCj4gKysrIGIv
Ym9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1rCj4gQEAgLTM5LDcgKzM5LDEz
IEBAIFRJX0szX1I1X0xPQURFUl9ERVBFTkRFTkNJRVMgPSBcCj4gwqAJaG9zdC1wa2djb25mIFwK
PiDCoAkkKEJSMl9NQUtFX0hPU1RfREVQRU5ERU5DWSkgXAo+IMKgCWhvc3QtYXJtLWdudS10b29s
Y2hhaW4gXAo+IC0JaG9zdC1vcGVuc3NsCj4gKwlob3N0LW9wZW5zc2wgXAo+ICsJaG9zdC1weXRo
b24tYXR0cnMgXAo+ICsJaG9zdC1weXRob24tanNvbnNjaGVtYSBcCj4gKwlob3N0LXB5dGhvbi1q
c29uc2NoZW1hLXNwZWNpZmljYXRpb25zIFwKPiArCWhvc3QtcHl0aG9uLXB5eWFtbCBcCj4gKwlo
b3N0LXB5dGhvbi1yZWZlcmVuY2luZyBcCj4gKwlob3N0LXB5dGhvbi1ycGRzLXB5Cj4gwqAKPiDC
oFRJX0szX1I1X0xPQURFUl9NQUtFID0gJChCUjJfTUFLRSkKPiDCoFRJX0szX1I1X0xPQURFUl9N
QUtFX0VOViA9ICQoVEFSR0VUX01BS0VfRU5WKQo+IEBAIC00OSw2ICs1NSwxMCBAQCBUSV9LM19S
NV9MT0FERVJfS0NPTkZJR19ERVBFTkRFTkNJRVMgPSBcCj4gwqAJJChCUjJfQklTT05fSE9TVF9E
RVBFTkRFTkNZKSBcCj4gwqAJJChCUjJfRkxFWF9IT1NUX0RFUEVOREVOQ1kpCj4gwqAKPiAraWZl
cSAoJChCUjJfVEFSR0VUX1VCT09UX05FRURTX1BZTElCRkRUKSx5KQo+ICtUSV9LM19SNV9MT0FE
RVJfREVQRU5ERU5DSUVTICs9IGhvc3QtcHl0aG9uLXB5bGliZmR0Cj4gK2VuZGlmCj4gKwo+IMKg
aWZlcSAoJChCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9VU0VfREVGQ09ORklHKSx5KQo+IMKg
VElfSzNfUjVfTE9BREVSX0tDT05GSUdfREVGQ09ORklHID0gJChjYWxsIHFzdHJpcCwkKEJSMl9U
QVJHRVRfVElfSzNfUjVfTE9BREVSX0JPQVJEX0RFRkNPTkZJRykpX2RlZmNvbmZpZwo+IMKgZWxz
ZSBpZmVxICgkKEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX1VTRV9DVVNUT01fQ09ORklHKSx5
KQo+IEBAIC01OCw2ICs2OCw3IEBAIFRJX0szX1I1X0xPQURFUl9NQUtFX09QVFMgPSBcCj4gwqAJ
Q1JPU1NfQ09NUElMRT0kKEhPU1RfRElSKS9iaW4vYXJtLW5vbmUtZWFiaS0gXAo+IMKgCUFSQ0g9
YXJtIFwKPiDCoAlIT1NUQ0M9IiQoSE9TVENDKSAkKHN1YnN0IC1JLywtaXN5c3RlbSAvLCQoc3Vi
c3QgLUkgLywtaXN5c3RlbSAvLCQoSE9TVF9DRkxBR1MpKSkiIFwKPiArCUJJTk1BTl9JTkRJUlM9
JChCSU5BUklFU19ESVIpIFwKPiDCoAlIT1NUTERGTEFHUz0iJChIT1NUX0xERkxBR1MpIgo+IMKg
Cj4gwqBkZWZpbmUgVElfSzNfUjVfTE9BREVSX0JVSUxEX0NNRFMKCi0tIApBbGV4YW5kZXIgU3Zl
cmRsaW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
