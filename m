Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F208AC00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 17:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B3E140A96;
	Mon,  8 Aug 2022 17:01:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B3E140A96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jHmrHx2wNtVw; Mon,  8 Aug 2022 17:01:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62D1040A8C;
	Mon,  8 Aug 2022 17:01:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62D1040A8C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D2CED1BF2B3
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 17:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAE6B40A8C
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 17:01:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAE6B40A8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8OauK1GuAzIO for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 17:01:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0B0940A71
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A0B0940A71
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 17:01:36 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id kb8so17739199ejc.4
 for <buildroot@buildroot.org>; Mon, 08 Aug 2022 10:01:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=KMxGg7RLhX9j0IKLyVvgBcp4YtBKQES2lA+6IM80j24=;
 b=DB9YaIIdjtjp3Olnk/dtmpiHfLJxZogkhajJnvyI9CZClnsF0VuDihmfWkfJcTjwlu
 0mLpDCOG6BiUVYPyb/QrBdtrvjFr7cF/YuEKIy2cPd9jzI6eKqePpo+xKPSuSFpyKDUJ
 cGaKL06svtcEUjPqKbvWYO/m6l2tVH54lklO6X74JbzJDO1xpBB9oA/6pvB0lO05GXv9
 wqqpF6MFKjK6wiyUTzH3AkZuqwDK1ek6lazhEcC2vhi483JDgiLlIJkoQpntIfINzykT
 R99OAVj/InW/I6fDdiAe80QjTAjaUKEP65OfGcWEjcEZlbk20KulZ0W97PwIW3nKvj5h
 uhqQ==
X-Gm-Message-State: ACgBeo3VIy5/RVfu3fidlknY7F3v82oguqW4ivSsNw4CQEVjqseKFFOi
 cfPs1biSWWrfnMxJFfWBB7q/wQ==
X-Google-Smtp-Source: AA6agR42lypK1JOU1y5lHo5Bwu5KaGbvuuvkCasjDjdYhQ/38f6yO5+LtXP6fF4SzEuUKXguENn0AA==
X-Received: by 2002:a17:906:eec9:b0:730:8226:3915 with SMTP id
 wu9-20020a170906eec900b0073082263915mr14488416ejb.513.1659978095115; 
 Mon, 08 Aug 2022 10:01:35 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 s21-20020a170906501500b006fee7b5dff2sm56957ejj.143.2022.08.08.10.01.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 10:01:34 -0700 (PDT)
Message-ID: <a24ba1a7-b0a6-d793-3722-5216256ca8ad@mind.be>
Date: Mon, 8 Aug 2022 19:01:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: Xuanhao Shi <x-shi@ti.com>, buildroot@buildroot.org
References: <2a70bd7d-c7df-106f-e3de-fc72e5205094@ti.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <2a70bd7d-c7df-106f-e3de-fc72e5205094@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=KMxGg7RLhX9j0IKLyVvgBcp4YtBKQES2lA+6IM80j24=;
 b=LU8gm3/jDi5ef/WFUIhBS7E8BjK+Aig8Oj8LM5oh/Jvx5vRqvkveB5F3Uv9NE0NWJC
 h+WzcnR3KpREmQ+enGSSMy+9DwkiQlhg66eVIPUBIPmYDGHtLgktmpCDcCrBNwAL6A8i
 bQCtzcJs7iVD35GAty62p9xvG6YnbncqWStQ3df88Y9ujqKMEp6ZoyuAVK0u+iJJz4rr
 Z9zxiEeXIZ7/td4CRnOiO4KE4hHsjgDfgJd+NO6q95SJ+Ya/6rEXiP9fe+S9+XzpL2ne
 UXs5KyRz7TyShOaTPbAcgN0UgChp78ezW9rXnONYfaiaK4biCkQyHnlEh3OpASzOkCdf
 HNyg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LU8gm3/j
Subject: Re: [Buildroot] how to add support for custom linux-firmware
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

CgpPbiAwNS8wOC8yMDIyIDE1OjIzLCBYdWFuaGFvIFNoaSB2aWEgYnVpbGRyb290IHdyb3RlOgo+
IEhlbGxvLAo+IAo+IEkgaGF2ZSBiZWVuIHdvcmtpbmcgb24gdHJ5aW5nIHRvIGVuYWJsZSBzdXBw
b3J0IGZvciBUSSdzIEszIGJvYXJkcyBpbiBCdWlsZHJvb3QuIAo+IFRoZSBsYXN0IHBhdGNoIHNl
cmllcyB3YXMgc3VibWl0dGVkIGhlcmU6Cj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL3Bp
cGVybWFpbC9idWlsZHJvb3QvMjAyMi1BdWd1c3QvNjQ4Mzc4Lmh0bWwKPiBXaGljaCBzaG91bGQg
ZW5hYmxlIHN1cHBvcnQgZm9yIHRoZSBBTTY0eF9TSyBib2FyZC4KPiAKPiBIb3dldmVyLCBzb21l
IG9mIHRoZSBvdGhlciBLMyBib2FyZHMgKEFNNjJ4X1NLLCBmb3IgZXhhbXBsZSkgd291bGQgcmVx
dWlyZSBzb21lIAo+IERNIGZpcm13YXJlIHRvIGJlIHBhc3NlZCB0byB1LWJvb3QgYXQgYnVpbGQt
dGltZS4gV2UgY3VycmVudGx5IGhvc3QgdGhlbSBpbiBoZXJlOgo+IGh0dHBzOi8vZ2l0LnRpLmNv
bS9jZ2l0L3Byb2Nlc3Nvci1maXJtd2FyZS90aS1saW51eC1maXJtd2FyZS8KPiAKPiBUaGlzIHJl
cG8gY29udGFpbnMgZmlybXdhcmUgdGhhdCBpcyBub3QgY3VycmVudGx5IGluIHRoZSB1cHN0cmVh
bSBsaW51eC1maXJtd2FyZSAKPiByZXBvc2l0b3J5LCBpbmNsdWRpbmcgdGhlIGFib3ZlIG1lbnRp
b25lZCBETSBmaXJtd2FyZSBhbmQgdGhlIHdpZmkgZmlybXdhcmUgZm9yIAo+IHRoZSBBTTYyeF9T
SyBib2FyZC4KPiAKPiBXaGF0IHdvdWxkIGJlIHRoZSBiZXN0IHByYWN0aWNlIHRvIGVuYWJsZSBz
dXBwb3J0IGZvciB0aGVzZSBjdXN0b20gZmlybXdhcmU/Cj4gU2hvdWxkIEkgdHJ5IHRvIHBhdGNo
IHRoZSBsaW51eC1maXJtd2FyZSBwYWNrYWdlIHRvIGVuYWJsZSBjdXN0b20gc291cmNlIAo+IChz
aW1pbGFyIHRvIFUtQm9vdCwgTGludXgga2VybmVsLCBldGMuKT8KCiAgV2UgZGVmaW5pdGVseSBk
b24ndCB3YW50IHRoaXMuCgo+IE9yIHNob3VsZCBJIGFkZCB0aGUgd2hvbGUgdGktbGludXgtZmly
bXdhcmUgYXMgYSBzZXBhcmF0ZSBwYWNrYWdlPwoKICBUaGF0J3MgYW4gb3B0aW9uLCBidXQuLi4K
Cj4gSSdtIG5vdCBzdXJlIGlmIHRoZSBzZXBhcmF0ZSBwYWNrYWdlIGlkZWEgaXMgdGhlIGJlc3Qg
cHJhY3RpY2UsIHNpbmNlIHRoaXMgcmVwbyAKPiBpcyBtYWpvcmx5wqAgbWFpbmxpbmUgbGludXgt
ZmlybXdhcmUsIGV4Y2VwdCBmb3Igc29tZSBUSS1zcGVjaWZpYyBwYXJ0cyB0aGF0IGFyZSAKPiBu
b3QgeWV0IGluIG1haW5saW5lLgoKICBUaGlzIGlzIGNlcnRhaW5seSB0cnVlLgoKICBJdCBtYWtl
cyBtZSB3b25kZXIgdGhvdWdoOiB3aHkgYXJlIHRoZXkgbm90IHlldCBtYWlubGluZT8gTm9ybWFs
bHkgCmxpbnV4LWZpcm13YXJlIGlzIHZlcnkgYWNjZXB0aW5nIG9mIG5ldyBiaW5hcmllcy4gSXMg
aXQganVzdCBiZWNhdXNlIHRoZSBkcml2ZXIgCmlzIG5vdCB5ZXQgbWFpbmxpbmU/Cgo+IEFsdGVy
bmF0aXZlbHksIGlzIGl0IGJldHRlciB0byBob3N0IHRoZXNlIG90aGVyIFRJLXNwZWNpZmljIGZp
cm13YXJlIGJpbmFyaWVzIAo+IGVsc2V3aGVyZSBpbiBhIHNlcGFyYXRhZSByZXBvIGFuZCBhZGQg
dGhhdCByZXBvIGFzIGEgcGFja2FnZSwgc2ltaWxhciB0byB3aGF0IAo+IEZyZWVzY2FsZSBkb2Vz
IGZvciB0aGUgSU1YOCBib2FyZHMuCgogIEkgdGhpbmsgdGhpcyBpcyBpbiBmYWN0IHRoZSBjbGVh
bmVzdCBhcHByb2FjaC4gSSBkb24ndCBzZWUgYW55IHJlYXNvbiB0byBmb3JrIApsaW51eC1maXJt
d2FyZS4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gCj4gQW55IGFkdmljZSB3b3VsZCBiZSBhcHBy
ZWNpYXRlZC4KPiAKPiBUaGFuayB5b3UuCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
