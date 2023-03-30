Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F77C6FD1D
	for <buildroot@archiver.kernel.org>; Thu, 30 Mar 2023 07:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB6D441DF2;
	Thu, 30 Mar 2023 07:04:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB6D441DF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZThhgJMpG_QJ; Thu, 30 Mar 2023 07:04:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7540441DF4;
	Thu, 30 Mar 2023 07:04:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7540441DF4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 163A61BF334
 for <buildroot@lists.busybox.net>; Thu, 30 Mar 2023 07:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E298E615AA
 for <buildroot@lists.busybox.net>; Thu, 30 Mar 2023 07:03:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E298E615AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id al9KPab9m3hD for <buildroot@lists.busybox.net>;
 Thu, 30 Mar 2023 07:03:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 839D961599
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 839D961599
 for <buildroot@buildroot.org>; Thu, 30 Mar 2023 07:03:56 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id i9so17989021wrp.3
 for <buildroot@buildroot.org>; Thu, 30 Mar 2023 00:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680159834;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=10Wpz0MD4o0vXyz1/YMOMb7s2TjOCWhj6j4E7Avjg3c=;
 b=8MSvQ1vrfPc8DTZCsiVw2ec3mTdsvPuzrFJX2hOUZCyw+b2HtMezQWd8sb58aOiSzX
 pNywI0oiAiiD8q7dRFnR8d7deyCGHMd9/6dKqj328uHe3EVY+SX/k9ejf41WVcGFHiwj
 bKXVXDU6pFu9ZhDiYqkkOsgfO8m8nEctL+MAK9nqHGoZ6rUI9x4yBwKIlqKVxt6FabYx
 dpRa9hNSnJT4g9HbiFip13JqvPuyi+1szg1CTevcl3KsFq/JTT3jLQwiXPSR5XGf3KN7
 K+m7H6d1QIJ40j93QwhTFFzpxv5ysh/pDvKSbgPbi7rfgjXQ8fsDCyRRzs6ws4eoR2R/
 kkFg==
X-Gm-Message-State: AAQBX9fFyJjmU60V8RDJl89BZ+dEf6/ZXDPIkBdN4dupQuWTFPvCzkp2
 1f3LjyfDcVAb2b307LnktIA8Cg==
X-Google-Smtp-Source: AKy350bA8G3IBdqqYTzIwKsO+jnpT2f5cMOG9WP5Ya+t2hkxS5H5k/Ff/OeUtO2OKZbw6sjTNU0HVw==
X-Received: by 2002:adf:ef91:0:b0:2ce:a8ee:173a with SMTP id
 d17-20020adfef91000000b002cea8ee173amr16606308wro.68.1680159834026; 
 Thu, 30 Mar 2023 00:03:54 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a5d560f000000b002dcca59e14asm15519735wrv.74.2023.03.30.00.03.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 00:03:53 -0700 (PDT)
Message-ID: <84821597-4e34-2e1c-99f5-4d03bdda0d45@mind.be>
Date: Thu, 30 Mar 2023 09:03:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: Florian Fainelli <f.fainelli@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230326130937.56650-1-f.fainelli@gmail.com>
 <20230328202533.GD3204460@scaer>
 <c7968ace-cfbb-1c54-bdde-083a37423686@mind.be>
 <20230329105022.6137bf1a@windsurf>
 <ffed7523-6dbe-6d61-03e7-57cdbc732097@mind.be>
 <20230329112855.6110cf8d@windsurf>
 <f4e1e805-4ab0-e187-8001-c5cfa9c0be00@gmail.com>
Content-Language: en-GB
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <f4e1e805-4ab0-e187-8001-c5cfa9c0be00@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1680159834;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=10Wpz0MD4o0vXyz1/YMOMb7s2TjOCWhj6j4E7Avjg3c=;
 b=Vmfk7O7Bhu7o+MFthKLF7KlM/dLUHHClatXLluvRR6f75cUg4igVze2XB+zzbCcpJP
 UXBazH8y4K2h7VEIW8/WjV07MYFOoeQM6CF4AXK7Ww1h1sjlXmo176qK4S9yYG9JDFeU
 n4mOfGAzCB47Gi/C9gii1EssNeW4Zsk3cvwAYS2EPMAWRaRb3uP7YDqlCL80RTWgrGfG
 Zsdk1z2fvJYawC7ODu+Dbf1Zcf/BU/Ej+oKJCpVHkI9SaBdqGcXqsnRso0oZI/PdIEZE
 YKwgOOw8uGlkgHZj7IyLoBaNoYuiYi/OgHCWw3C2fR8XgLgANeCCj4VhYJ62i77U7CJG
 xISA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Vmfk7O7B
Subject: Re: [Buildroot] Indicating upstream status [was: [PATCH]
 package/bluez5_utils: Fix builds with musl-libc]
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
Cc: d.lang@abatec.at, marcin@bis.org.pl,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyOS8wMy8yMDIzIDE0OjM5LCBGbG9yaWFuIEZhaW5lbGxpIHdyb3RlOgo+IAo+IAo+IE9u
IDMvMjkvMjAyMyAyOjI4IEFNLCBUaG9tYXMgUGV0YXp6b25pIHdyb3RlOgo+PiBPbiBXZWQsIDI5
IE1hciAyMDIzIDExOjA2OjQ3ICswMjAwCj4+IEFybm91dCBWYW5kZWNhcHBlbGxlIDxhcm5vdXRA
bWluZC5iZT4gd3JvdGU6Cj4+Cj4+PiDCoMKgIFllYWgsIHRoYXQncyB3aHkgSSBwcm9wb3NlICJV
cHN0cmVhbToiIC0gaXQncyBnZW5lcmljIGVub3VnaCB0byBjb3ZlciBhbGwgb2YKPj4+IHRoZXNl
IGNhc2VzLiBUaGUgY29udGVudHMgY2FuIGJlIGZyZWVmb3JtIEkgdGhpbmssIGNoZWNrLXBhY2th
Z2Ugc2hvdWxkIGp1c3QKPj4+IGNoZWNrIHRoYXQgdGhlIFVwc3RyZWFtIHRhZyBpcyBwcmVzZW50
LiBBbmQgdGhlIGRvY3VtZW50YXRpb24gc2hvdWxkIGdpdmUKPj4+IGV4YW1wbGVzIG9mIHRoZSBm
aXZlIGNhc2VzIHlvdSBtZW50aW9uLgo+Pgo+PiBTdXJlLgo+IAo+IFlvY3RvIHVzZXMgdGhlIGZv
bGxvd2luZyBmb3JtYXQgWzFdOgo+IAo+IFVwc3RyZWFtLXN0YXR1czogKFBlbmRpbmd8U3VibWl0
dGVkfEFjY2VwdGVkfEJhY2twb3J0fERlbmllZHxJbmFwcHJvcHJpYXRlIAo+IFtyZWFzb25dKQoK
ICBUaGF0J3Mgd2hlcmUgSSBnb3QgbXkgaW5zcGlyYXRpb24gOi0pIEkganVzdCBmaW5kICJVcHN0
cmVhbS1zdGF0dXMiIGEgYml0IApsb25nLCBzbyBJIGFiYnJldmlhdGVkIGl0IHRvICJVcHN0cmVh
bSIuIEFsc28sICJTdWJtaXR0ZWQiIGFuZCAiQWNjZXB0ZWQiIGFyZSAKbm90IHJlYWxseSB1c2Vm
dWwgYmVjYXVzZSB0aGUgdXBzdHJlYW0gc3RhdHVzIGlzIGdvaW5nIHRvIGNoYW5nZSB3aGlsZSB3
ZSBkb24ndCAKY2hhbmdlIG91ciBwYXRjaC4gSW4gYWRkaXRpb24sIGEgc2ltcGxlIFVSTCB0aGVy
ZSBpcyBlbm91Z2ggaW5mb3JtYXRpb24uIFRoYXQncyAKaG93IEkgZ290IHRvOgoKRm9yIFN1Ym1p
dHRlZC9BY2NlcHRlZDoKVXBzdHJlYW06IDxQUi9tYWlsaW5nIGxpc3QvcGF0Y2h3b3JrIFVSTD4K
CkZvciBCYWNrcG9ydC9BY2NlcHRlZDoKVXBzdHJlYW06IDxjb21taXQgaGFzaD4gW3N1Ym1pdHRl
ckBlbWFpbC5hZGRyZXNzXQoKRm9yIERlbmllZDoKVXBzdHJlYW06IERlbmllZCA8UFIvbWFpbGlu
ZyBsaXN0L3BhdGNod29yayBVUkw+CgpGb3IgSW5hcHByb3ByaWF0ZToKVXBzdHJlYW06IE4vQSAr
IGV4cGxhbmF0aW9uIHdoeQoKICBPbmx5ICJQZW5kaW5nIiBpcyBhIGxpdHRsZSBpZmZ5IC0gd2Ug
anVzdCBkb24ndCB3YW50ICJQZW5kaW5nIiBwYXRjaGVzIEkgZ3Vlc3MuCgogIFJlZ2FyZHMsCiAg
QXJub3V0Cgo+IHdvdWxkIHlvdSB3YW50IHRvIGFkb3B0IHNvbWV0aGluZyBzaW1pbGFyPyBPcGVu
V3J0IHRvIHNvbWUgZXh0ZW50IGRvZXMgc29tZXRoaW5nIAo+IGxpa2UgdGhhdCBhcyB3ZWxsIGFs
dGhvdWdoIGluIGEgbGVzcyB1bmlmaWVkIGZhc2hpb24sIHNvbWV0aW1lcyB0aGUgcGF0Y2hlcyBh
cmUgCj4gcGxhY2VkIGluIGEgc3BlY2lmaWMgcGF0Y2ggZGlyZWN0b3J5IChiYWNrcG9ydC14Lnku
eiwgdXBzdHJlYW0teC55LnopIGFuZCAKPiBzb21ldGltZXMgdGhhdCBpbmZvcm1hdGlvbiBpcyBw
bGFjZWQgaW4gdGhlIHBhdGNoIGZpbGUgaXRzZWxmLgo+IAo+IFsxXTogCj4gaHR0cDovL3dpa2ku
eW9jdG9wcm9qZWN0Lm9yZy93aWtpL0Jlc3RfS25vd25fTWV0aG9kc18lMjhCS01zJTI5X2Zvcl9Q
YWNrYWdlX1VwZGF0aW5nI1BhdGNoX0NvbW1lbnRzCj4gCj4+Cj4+PiDCoMKgIFRoZSAicGF0Y2gg
dGFrZW4gZnJvbSBkb3duc3RyZWFtIiBpcyB0aGUgb25seSBvbmUgd2hpY2ggZG9lc24ndCBmaXQg
aW4gdGhlCj4+PiAiVXBzdHJlYW0iIHRoaW5nLiBCdXQgaXQncyBhbHNvIGEgc2l0dWF0aW9uIHdl
IGRvbid0IHJlYWxseSBsaWtlOiB3ZSBiYXNpY2FsbHkKPj4+IGRvbid0IHdhbnQgbG9jYWwgcGF0
Y2hlcywgYW5kIGEgcGF0Y2ggdGFrZW4gZnJvbSBzb21lIG90aGVyIGRpc3RybyBfaXNfIGEgbG9j
YWwKPj4+IHBhdGNoLgo+Pgo+PiBUaGUgcmVhbGl0eSBpcyB0aGF0IHdlIGhhdmUgc3VjaCBwYXRj
aGVzIChmb3IgZXhhbXBsZSB0byBmaXggbXVzbCBidWlsZAo+PiBpc3N1ZXMpLCBhbmQgd2Ugc29t
ZWhvdyBoYXZlIHRvIGxpdmUgd2l0aCB0aGVtLgo+Pgo+PiBUaG9tYXMKPiAKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
