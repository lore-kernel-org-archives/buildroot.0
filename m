Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A7CC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 19:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F8AD84698;
	Fri, 12 Jul 2024 19:23:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i8y2m-rygBFh; Fri, 12 Jul 2024 19:23:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56D2B8469E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56D2B8469E;
	Fri, 12 Jul 2024 19:23:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C06A1BF279
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08D6A400FF
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:23:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o0pqXhh2hlMN for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 19:23:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=rgallaispou@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C407B4000B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C407B4000B
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C407B4000B
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 19:23:43 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4266ea6a488so18567665e9.1
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 12:23:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720812222; x=1721417022;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bbILCh8pkxqsy6eXLzRJGguiFtuYP9YdzOSotY487dU=;
 b=dMC4Btd+z00fcs23wO+7KUdrOgdq3QBKezAORQWckx67n55RAgx+N1GRg1c1+r1MG/
 gtUXA/aj/kXaS4xFCLujAUehh3YrnCdu3iUtX583tbWt4RbKJDTlmns4QLAtwKxhdx9P
 a7zqDJtEjcSntd28mzXiwlAQh6GW3r2kuDAoDwLDLgYXKpBV0t81nKR9HjoT2i892RNZ
 /Jy+snOK1GpQd1qbk9Huk/f91g2csO+vRVXAIPWIS0KDJGUmWaxHCaGs35WczNXubIJV
 tj1xyeEmYWWu02HxYhucffex1uURKCdm1ihVQTZxlbhwHTiSuXUvix4kO8FU+cHRruWR
 cHjQ==
X-Gm-Message-State: AOJu0Yx7n3t96Mi5bsh1rWMVzwG2ti8hcAizpoNYgyuG/MQkYHK49lh3
 GDyFBQgw4CLwuTQXRO0WImQ3USWPxPYVDZ6xBO0fcG3kw1DE282OOr5MBw==
X-Google-Smtp-Source: AGHT+IG6pXI3bGGb+Zj5hBIpMBuzmMAefhz1ZOCLqDxH4aj0Bn1UhP4urhexJxAeBopViOwJ0G5Tng==
X-Received: by 2002:a05:600c:42d3:b0:426:5520:b835 with SMTP id
 5b1f17b1804b1-426706c6486mr90877615e9.5.1720812221453; 
 Fri, 12 Jul 2024 12:23:41 -0700 (PDT)
Received: from ?IPV6:2001:861:3385:e20:6384:4cf:52c5:3194?
 ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f25942csm31801735e9.15.2024.07.12.12.23.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 12:23:41 -0700 (PDT)
Message-ID: <28de63ff-7351-45d5-a0d0-4bb696b5728e@gmail.com>
Date: Fri, 12 Jul 2024 21:23:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240712182712.216799-1-rgallaispou@gmail.com>
 <20240712211157.13910779@windsurf>
Content-Language: en-US, fr
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <20240712211157.13910779@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720812222; x=1721417022; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bbILCh8pkxqsy6eXLzRJGguiFtuYP9YdzOSotY487dU=;
 b=UYU1rHuqRh+/DQQwetOsfTZSa1lETo9z8MEZadqpc138wNGKTGc5yC5NvhIyjPjDkl
 lMY0RVVN2/+aos67VuD4u60b9yOi7RIjyXM4ZNboio48tOeXVP2K8c/PNv58qoLdAcDb
 GnSCxiCvomNOH7d9wQ89o5QqkbzUgPqk6BLgffOl2qiSj9y8fQohMdEGlS1rVX0CMyJG
 UuneZbXIFIeRVT+fVXpxPfFsnrvWJ0LWpIHXNSdiUwFuGB6jojGe+S+k5Q5LmKf4eKmh
 HO4cjsHdW6KJBFD28jUGEOtt4RxJ0tiHU53pep18GpNV/QViCjTQvU/NP2+yxR2wvaPe
 uCqA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UYU1rHuq
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32mp157c_dk2: bump Linux to
 6.9
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
Cc: Marleen Vos <marleen.vos@mind.be>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMTIvMDcvMjAyNCDDoCAyMToxMSwgVGhvbWFzIFBldGF6em9uaSBhIMOpY3JpdMKgOgo+IEhl
bGxvIFJhcGhhZWwsCj4gCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoLiBTZWUgYmVsb3cgYSByZXZp
ZXcuCj4gCj4gT24gRnJpLCAxMiBKdWwgMjAyNCAyMDoyNzoxMiArMDIwMAo+IFJhcGhhZWwgR2Fs
bGFpcy1Qb3UgPHJnYWxsYWlzcG91QGdtYWlsLmNvbT4gd3JvdGU6Cj4gCj4+IEJhc2UgY29uZmln
IG9uIGxhdGVzdCBrZXJuZWwgdmVyc2lvbiBhdmFpbGFibGUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IFJhcGhhZWwgR2FsbGFpcy1Qb3UgPHJnYWxsYWlzcG91QGdtYWlsLmNvbT4KPj4gLS0tCj4+ICAg
Y29uZmlncy9zdG0zMm1wMTU3Y19kazJfZGVmY29uZmlnIHwgMjAgKystLS0tLS0tLS0tLS0tLS0t
LS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkK
Pj4KPj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3Mvc3RtMzJtcDE1N2NfZGsyX2RlZmNvbmZpZyBiL2Nv
bmZpZ3Mvc3RtMzJtcDE1N2NfZGsyX2RlZmNvbmZpZwo+PiBpbmRleCBjNDg3MDViMmZiLi4wZTI2
MDQyYjkwIDEwMDY0NAo+PiAtLS0gYS9jb25maWdzL3N0bTMybXAxNTdjX2RrMl9kZWZjb25maWcK
Pj4gKysrIGIvY29uZmlncy9zdG0zMm1wMTU3Y19kazJfZGVmY29uZmlnCj4+IEBAIC0xLDMxICsx
LDE3IEBACj4+IC0jIEFyY2hpdGVjdHVyZQo+PiAgIEJSMl9hcm09eQo+PiAgIEJSMl9jb3J0ZXhf
YTc9eQo+PiAtCj4+IC0jIExpbnV4IGhlYWRlcnMgc2FtZSBhcyBrZXJuZWwsIGEgNS4xMyBzZXJp
ZXMKPj4gLUJSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNV8xMz15Cj4gCj4g
UGxlYXNlIGtlZXAgdGhlIGNvbW1lbnRzIGFuZCB0aGlzIG9wdGlvbiAoYnV0IHVwZGF0ZWQpLiBJ
dCBzZWVtcyBsaWtlCj4geW91IGRpZCBhICJtYWtlIHNhdmVkZWZjb25maWciLCB3aXRob3V0IHJl
YWxseSB3b3JyeWluZyBhYm91dCB3aGF0Cj4gY2hhbmdlZC4KPiAKSGkgVGhvbWFzLAoKVGhhbmtz
IGZvciB0aGUgcXVpY2sgcmV2aWV3LgoKSW5kZWVkLCB0aGlzIGlzIGV4YWN0bHkgd2hhdCBJIGRp
ZC4gSSAod3JvbmdseSkgZGlkIG5vdCBjb21wYXJlZCB3aXRoIApzaW1pbGFyIGNoYW5nZXMgZXZl
biB0aG91Z2ggdGhpcyB3YXMgbXkgZmlyc3QgY29udHJpYnV0aW9uIHRvIEJ1aWxkcm9vdC4KCk15
IGJhZC4KCj4+IC0KPj4gLSMgU3lzdGVtIGNvbmZpZ3VyYXRpb24KPj4gICBCUjJfUk9PVEZTX09W
RVJMQVk9ImJvYXJkL3N0bWljcm9lbGVjdHJvbmljcy9zdG0zMm1wMTU3Yy1kazIvb3ZlcmxheS8i
Cj4+ICAgQlIyX1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVD0iYm9hcmQvc3RtaWNyb2VsZWN0cm9u
aWNzL2NvbW1vbi9zdG0zMm1wMTU3L3Bvc3QtaW1hZ2Uuc2giCj4+IC0KPj4gLSMgS2VybmVsCj4+
ICAgQlIyX0xJTlVYX0tFUk5FTD15Cj4+IC1CUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9O
PXkKPj4gLUJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjUuMTMiCj4gCj4g
V2UgbmVlZCB0byBrZWVwIGFuIGV4cGxpY2l0IGtlcm5lbCB2ZXJzaW9uLCBzbyB0aGF0IGl0IGRv
ZXNuJ3QKPiBhdXRvbWF0aWNhbGx5IHVzZXMgdGhlICJsYXRlc3QiLgoKTWFrZXMgc2Vuc2UgaW4g
b3JkZXIgbm90IHRvIGludHJvZHVjZSBzeXN0ZW1hdGljIHVuY29udHJvbGxlZCBicmVha3MgaW4g
CnRoZSBzd2FybSBvZiBib2FyZHMuCgo+IAo+IEkgYmVsaWV2ZSBpdCB3b3VsZCBhbHNvIG1ha2Ug
c2Vuc2UgdG8gdXBkYXRlIFRGLUEgYW5kIFUtQm9vdCBhdCB0aGUKPiBzYW1lIHRpbWUuCj4gCj4g
Q291bGQgeW91IGZpeCB1cCB0aG9zZSBkZXRhaWxzLCBhbmQgc3VibWl0IGFuIHVwZGF0ZWQgdmVy
c2lvbj8KClllcywgSSdsbCBkbyBzb21lIHRlc3RpbmcgYmVmb3JlIGFuZCB0aGVuIHNlbmQgYSB2
Mi4KClRoYW5rcywKUmFwaGHDq2wKPiAKPiBUaGFua3MgYSBsb3QhCj4gCj4gVGhvbWFzCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
