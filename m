Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC54C433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 20:08:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB1CC611AE
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 20:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DB1CC611AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94DE4605B1;
	Tue, 19 Oct 2021 20:08:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qVJTIiZfLJCH; Tue, 19 Oct 2021 20:08:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4D9460886;
	Tue, 19 Oct 2021 20:08:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F35781BF476
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 20:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E28CF82FCE
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 20:08:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id whk6JThETED6 for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 20:08:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7DFDE82FA9
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 20:08:16 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id y12so19343436eda.4
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 13:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=HfDKMcU2K6RhqNC/UoY5+/WsbLwYfTJPXQvUydKh5vI=;
 b=htukwBTszUBZe49fheqVNY6CfKVB5lW5/L3WYU7DKuNykkkzh2ulXCXLXSsVvZa4vY
 mLkwALaciaf/B5pUlCOo5tzPo+G4X5np5Eo97ElOJp/JDS65G6rOsM8NxwhEU8aUy0ps
 Z1Zr4ZXX77rtm3l8VZz+4XWPXaz2SH3XQBfiV3xcEXmx5B12zK0puI9h0+gvizcowTTs
 dXE0zTob9VPwTqZq5ZXOuVCRpzb0Hnd56+xiRl42m0nQzlzbFWIOODPYsG1Ah+FLkDBp
 W3Q+vPHlFvDwpiNUrg1wM6MvBZQtZ9APJVZR6383ZOfWA2EMeZzHpYdh3Q3NCR7ll97V
 60/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=HfDKMcU2K6RhqNC/UoY5+/WsbLwYfTJPXQvUydKh5vI=;
 b=nzckwZ66qymwwanlXyL0enkWIC4xW9i0c20gpW/m/vJ9EurWRyuKLV2j9yNxLHF3JM
 oMJYPzuem0+IlWUttz3x1ulgr7UzaCYOpsvFwzgnX38vbmngChLsSHfZ/k9mdQst6LaT
 ejfvQnmjEjSAFNowReRIAeZd1XIw2VF3JF/PYKNCg+8b4LAO/dRgavnHJ16BQtWpDbnI
 X6xajHhEAOLLD8FpCONkbe6T1gsBNV1mv3YPfTjbeAQ3FKRi2HxoBe53YzK78Ocn3R7O
 12iGU7WS+g1NlSn9eNCeXSyfjYwcP+MWwhabIjJn5GddY0kh8gt9mjfZCKRy1UQtUBsP
 /bbw==
X-Gm-Message-State: AOAM530zI3bVkoXTN/jhST/wceaTkg9YDtI2Z8s3m8F+FuQwx5V34k7b
 Wp6y5ikXwmOGyKdpyk1ovvbjrUUUzRCJ6U2f
X-Google-Smtp-Source: ABdhPJyGhvK82v5ZZ3QdhSI5cszlsNjTYhPgpSGXxe2Aq9J+a0ap7l+SBaJwXq6LfOV1COciyyr8Ow==
X-Received: by 2002:a05:6402:520b:: with SMTP id
 s11mr57245846edd.123.1634674094519; 
 Tue, 19 Oct 2021 13:08:14 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id r19sm29241edt.54.2021.10.19.13.08.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 13:08:14 -0700 (PDT)
Message-ID: <d9f46497-5365-0364-b9d2-739178c5a5fc@mind.be>
Date: Tue, 19 Oct 2021 22:08:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: =?UTF-8?Q?K=c3=b6ry_Maincent?= <kory.maincent@bootlin.com>
References: <20211005145205.27617-1-kory.maincent@bootlin.com>
 <20211005174223.6efc9aa0@windsurf>
 <20211006110928.332bf2fe@kmaincent-XPS-13-7390>
 <100bf5a9-f9ff-d71d-783b-49d0c86087fc@mind.be>
 <20211019112006.76dfeec5@kmaincent-XPS-13-7390>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211019112006.76dfeec5@kmaincent-XPS-13-7390>
Subject: Re: [Buildroot] [PATCH 1/2] configs/octavo_osd32mp1_brk_defconfig:
 Add support for octavo brk board
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxOS8xMC8yMDIxIDExOjIwLCBLw7ZyeSBNYWluY2VudCB3cm90ZToKPiBIZWxsbyBBcm5v
dXQsCj4gCj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3IQo+IAo+IE9uIEZyaSwgMTUgT2N0IDIwMjEg
MjI6NDI6MTcgKzAyMDAKPiBBcm5vdXQgVmFuZGVjYXBwZWxsZSA8YXJub3V0QG1pbmQuYmU+IHdy
b3RlOgo+IAoKW3NuaXBdCj4+ICAgIFdlIGdlbmVyYWxseSBwcmVmZXIgdG8gdXNlIGFuIGluLXRy
ZWUgZGVmY29uZmlnLCB3aXRoIChpZiBuZWNlc3NhcnkpIGEKPj4gY29uZmlnIGZyYWdtZW50IHRv
IHR3ZWFrIGl0Lgo+Pgo+PiAgICBXaGVuIHVzaW5nIGFuIGluLXRyZWUgZGVmY29uZmlnLCBpdCdz
IE9LIGlmIGl0J3MgYSBsaXR0bGUgYml0IHRvbyBtdWNoCj4+IChlLmcuIGNvbnRhaW5zIGEgYnVu
Y2ggb2YgbWVoIE5GQyBzdHVmZikuCj4gCj4gT3RoZXIgc3BlY2lmaWMgc3R1ZmYgZnJvbSBTVCBs
aW51eC4gVGhleSBhcmUgdXNpbmcgbXVsdGlfdjdfZGVmY29uZmlnIHdpdGgKPiBmcmFnbWVudC0w
MS1tdWx0aXY3X2NsZWFudXAuY29uZmlnIGFuZCBmcmFnbWVudC0wMi1tdWx0aXY3X2FkZG9ucy5j
b25maWcKPiBpbi10cmVlIGRlZmNvbmZpZ3MuIEl0IGlzIGN1cnJlbnRseSBub3Qgc3VwcG9ydGVk
IGluIEJ1aWxkcm9vdCB0byB1c2UgaW4tdHJlZQo+IGZyYWdtZW50IGNvbmZpZ3VyYXRpb24gdGhl
cmVmb3JlIEkgaGF2ZSBleHRyYWN0ZWQgdGhlIGRlZmNvbmZpZyBnZW5lcmF0ZWQuCj4gSGF2ZSB5
b3UgYSBiZXR0ZXQKCiAgV2VsbCwgY29weWluZyBqdXN0IHRoZSB0d28gZnJhZ21lbnRzIGlzIGRl
ZmluaXRlbHkgYmV0dGVyIHRoYW4gY29weWluZyB0aGUgCmVudGlyZSBkZWZjb25maWcuCgogIEJ1
dCB5b3UgY2FuIHRyaWNrIHRoZSBmcmFnbWVudCBmaWxlcyB0byB3b3JrIGFmdGVyIGFsbDogdXNl
CiQoTElOVVhfRElSKS9hcmNoL2FybS9jb25maWdzL2ZyYWdtZW50LTAxLW11bHRpdjdfY2xlYW51
cC5jb25maWcuIEl0IG9ubHkgZ2V0cyAKZXZhbHVhdGVkIGFmdGVyIHRoZSBrZXJuZWwgaXMgZXh0
cmFjdGVkLCBzbyB0aGF0IHBhdGggaXMgY29ycmVjdC4KCltzbmlwXQo+Pj4+PiArQlIyX0xJTlVY
X0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9InN0bTMybXAxNTdjLW9zZDMybXAxLWJyayIKPj4+Pj4g
K0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0RUU19QQVRIPSJib2FyZC9vY3Rhdm8vYnJrL2xpbnV4
LWR0cy8qIgo+Pgo+PiAgICBJJ20gdmVyeSBzdXJwcmlzZWQgdGhhdCB0aGlzIHdvcmtzLi4uIElu
IGxpbnV4Lm1rLCB0aGVyZSdzIG5vIHdpbGRjYXJkCj4+IGV4cGFuc2lvbiBvbiB0aGUgRFRTcy4g
VGhleSB3aWxsIGJlIGNvcGllZCBiZWNhdXNlIHRoZSBzaGVsbCB3aWxsIGV4cGFuZCB0aGUKPj4g
d2lsZGNhcmQsIGJ1dCB0aGUgLm1rIGZpbGUgYWxzbyBmaWx0ZXJzIHRoZSAuZHRzIGZpbGVzIG91
dCBvZiB0aGUgbGlzdCwKPj4gY2hhbmdlcyB0aGVtIGluIC5kdGIsIGFuZCB1c2VzIHRoYXQgYXMg
YSBtYWtlIHRhcmdldCBhbmQgdG8gY29weSB0byBpbWFnZXMKPj4gYW5kIHRhcmdldC4gU2luY2Ug
dGhlcmUncyBubyAuZHRzIGFib3ZlLCB0aGUgRFRCIGxpc3Qgd2lsbCBiZSBlbXB0eS4KPj4KPj4g
ICAgU28sIGRvZXMgdGhpcyByZWFsbHkgd29yaz9zLwo+IAo+IEluIGZhY3QsIGl0IHdvcmtzIGJl
Y2F1c2UgSSBoYXZlIHNldCB0aGUgQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUUKPiBj
b25maWd1cmF0aW9uLgoKICBPaCwgdGhhdCdzIGEgbmVhdCB0cmljayEgSSBsaWtlIGl0LCBwb3Nz
aWJseSBiZXR0ZXIgdGhhbiB0aGUgd2lsZGNhcmQgYmVjYXVzZSAKbW9yZSBjb21wYWN0LiBJdCBk
b2VzIG5lZWQgdG8gYmUgZXhwbGFpbmVkLCB0aG91Z2guIFlvdSBjYW4gYWRkIGEgY29tbWVudCBp
biB0aGUgCmRlZmNvbmZpZyBmaWxlIGl0c2VsZiAoaW4gZmFjdCwgd2UgbGlrZSB0byByZW9yZGVy
IHRoZSBkZWZjb25maWcgaW4gYSBtb3JlIApsb2dpY2FsIG9yZGVyIHRoYW4gc2ltcGx5IHRoZSBv
dXRwdXQgb2YgJ21ha2Ugc2F2ZWRlZmNvbmZpZycgLSBjZnIuIGUuZy4gCmNvbmZpZ3Mvd2FycDdf
ZGVmY29uZmlnKS4KCgo+PiAgICBJZiBub3QsIGl0IG1heSBiZSBhIGdvb2QgaWRlYSB0byBwYXRj
aCBsaW51eC5tayB0byBhZGQgYSAkKHdpbGRjYXJkIC4uLikuCj4+IEJlY2F1c2UgdGhlIHNjZW5h
cmlvIHlvdSBoYXZlIGlzIHByZXR0eSB0eXBpY2FsLgo+Pgo+PiAgICBUaGVyZSBpcyBvbmUgb3Ro
ZXIgcHJvYmxlbSB3aXRoIGl0IHRob3VnaDogd2hlbiBkZXZlbG9waW5nLCB5b3UgY2FuIGVhc2ls
eQo+PiBnZXQgLm9yaWcgYW5kIC5yZWogYW5kIH4gZmlsZXMgYW5kIG90aGVyIGNyYXAgaW4gdGhh
dCBkaXJlY3RvcnkuIFNvIHBlcmhhcHMKPj4geW91IHNob3VsZCBtYWtlIGl0Cj4gCj4+ICJib2Fy
ZC9vY3Rhdm8vYnJrL2xpbnV4LWR0cy8qLmR0cyBib2FyZC9vY3Rhdm8vYnJrL2xpbnV4LWR0cy8q
LmR0c2kiCj4gCj4gSWYgSSBhZGQgJCh3aWxkY2FyZCAuLi4pIGFuZCB1c2UgdGhlICouZHRzIGFu
ZCAqLmR0c2kgSSBjYW4gcmVtb3ZlIHRoZQo+IEJSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RUU19O
QU1FIGNvbmZpZ3VyYXRpb24uIEkgd2lsbCBkbyB0aGF0IGluIFYyLgoKICBPbiB0aGUgb3RoZXIg
aGFuZCwgd2l0aCB0aGUgSU5UUkVFX0RUU19OQU1FIHRyaWNrLCBpdCBkb2Vzbid0IG1hdHRlciB0
aGF0IHRoZSAKLm9yaWcgZXRjIGFyZSB0aGVyZSAodGhleSdyZSBqdXN0IGNvcGllZCwgbm90aGlu
ZyBtb3JlKS4gU28gdGhlIGFkZGVkIGNvbXBsZXhpdHkgCm9mIHdpbGRjYXJkIGV0Yy4gaXNuJ3Qg
dGhhdCB1c2VmdWwuCgogIFRoZSBiZXN0IHNvbHV0aW9uLCBJIHRoaW5rLCBpcyBmb3IgdGhlIEJS
Ml9MSU5VWF9LRVJORUxfQ1VTVE9NX0RUU19QQVRIIG9wdGlvbiAKdG8gZ2FpbiBzdXBwb3J0IGZv
ciBkaXJlY3RvcmllcyAoaS5lLiBpZiBhIHBhdGggaW4gaXQgZW5kcyB3aXRoIGEgLywgaXQgaXMg
CndpbGRjYXJkLWV4cGFuZGVkIHRvICouZHRzICouZHRzaSkuIEJ1dCB0aGF0J3MgbW9yZSB3b3Jr
LCByZXF1aXJlcyBhIHRlc3QgaW4gCnN1cHBvcnQvdGVzdGluZywgZXRjLgoKCiAgUmVnYXJkcywK
ICBBcm5vdXQKCgoKPiAKPj4KPj4+Pj4gK0JSMl9MSU5VWF9LRVJORUxfSU5TVEFMTF9UQVJHRVQ9
eQo+Pj4+PiArQlIyX1RBUkdFVF9ST09URlNfRVhUMj15Cj4+Pj4+ICtCUjJfVEFSR0VUX1JPT1RG
U19FWFQyXzQ9eQo+Pj4+PiArQlIyX1RBUkdFVF9ST09URlNfRVhUMl9TSVpFPSIxMjBNIgo+Pgo+
PiAgICBJcyB0aGlzIG5lZWRlZD8KPiAKPiBub3QgbmVlZGVkLCBpbmRlZWQuCj4gCj4gUmVnYXJk
cywKPiBLw7ZyeQo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
