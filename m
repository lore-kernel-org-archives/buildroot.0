Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A66FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 16:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFEE260FE0;
	Sat, 23 Jul 2022 16:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFEE260FE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XF6P4Se5W22E; Sat, 23 Jul 2022 16:52:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A966660F5D;
	Sat, 23 Jul 2022 16:51:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A966660F5D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 94D331BF31A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7ADA142309
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7ADA142309
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 52_fpY2lBpTF for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 16:51:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBB2D418A9
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EBB2D418A9
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 16:51:55 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id m17so10052683wrw.7
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 09:51:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=E/Imz0a1ipOd6bDnf2zZ1/UxrbkM17VF8trGorWjxoI=;
 b=mc7N6L+bg6+b8F2zbh4lUj5cqnu7tbsYnRrb+Jq7kvrXT7HAtB6PxZgHsvkYMqEXzD
 /dBL0rv6TJtPGhHnh7BNT5VYSdO6RmF+WkCso9KTjqOVDOloRzfJYmVMajQkJHMmoV/3
 L8xWEFyZDHQcbJMDVD9d5ep2RangawJ0NktNNpJtetsfeiHhZFIyL3t902AGhqXwEPYz
 RK5SfbcS7xPys9MrQpIJEF9v6jo4wC7JzprpUAMgmSLDo7/HU1MBqQDHTFAlxE4RsD3a
 KTvItpygzaxaR7qJ+3AkGjUic7QsF5UeFbL2nszaVrdl8LeInlWAfj6UwmDQysrKrkXz
 GhjA==
X-Gm-Message-State: AJIora8G1A5jveVn/UPfDpIcpYU9C78Hkh2HQIJE+UGsQlGwrQvzU2pj
 +mfeMcJdu/hZUMX+GXdzZT5mOoVN2QvjLA==
X-Google-Smtp-Source: AGRyM1sQeQx7Huo7vUFIPBR/qntlpIlpXR4NvEX0zNUx0mAYVGnCHdQ4KYZLhmhCA6s/ho7GtjlyUQ==
X-Received: by 2002:a05:6000:15c3:b0:21d:9f5a:df83 with SMTP id
 y3-20020a05600015c300b0021d9f5adf83mr3289624wry.360.1658595113967; 
 Sat, 23 Jul 2022 09:51:53 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 v13-20020a5d4a4d000000b0021dff3cf67asm7323189wrs.10.2022.07.23.09.51.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 09:51:53 -0700 (PDT)
Message-ID: <435cc8ad-60fb-04e9-ff3b-78a3fda3f2ab@mind.be>
Date: Sat, 23 Jul 2022 18:51:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: =?UTF-8?Q?Andr=c3=a9_Zwing?= <nerv@dawncrow.de>, buildroot@buildroot.org
References: <20220607131851.57232-1-nerv@dawncrow.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220607131851.57232-1-nerv@dawncrow.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=E/Imz0a1ipOd6bDnf2zZ1/UxrbkM17VF8trGorWjxoI=;
 b=KNR/3vlVXg8A+41pThVMU4NPdGFTKjGwDbQ4wXWzcYu0oT36gdkLhOrTk1mbzMaEvj
 RDxo4RNMAni3vjhmcPMo+LkDG9nlXrhvvELuOCfVZl5i7db0Aycpt0LOGGrWVspMTzE2
 ZcONOaYA+WkcKuGKtyDaJHyykTak+6ptYlvVsIfZBbZ+8RbfyFhrBOITmFhHP1op98Yf
 IwJ/AD2l4anQdfw77VpGq5hHrC2hNfp30rXSI1pn6KftPp2i6yjJGu5EcKsQ1lnOYOll
 hsDRtf8OsbtP/Gu155LhOJcxu+XEVfzPCtTjGEBNfMvx/cOjajJrAzqGU8P1LewwXirK
 LagA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KNR/3vlV
Subject: Re: [Buildroot] [PATCH] package/wine: bump to version 7.0
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

CgpPbiAwNy8wNi8yMDIyIDE1OjE4LCBBbmRyw6kgWndpbmcgd3JvdGU6Cj4gTXVsdGlwbGUgbGli
cmFyeSBjaGVja3MgYXJlIG9ic29sZXRlLCBlaXRoZXIgZHVlIHRvIHJlbW92YWwgb3IgZHVlIHRv
IGJ1aWx0LWluIHNvbHV0aW9ucy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyw6kgWndpbmcgPG5l
cnZAZGF3bmNyb3cuZGU+Cj4gLS0tCgpbc25pcF0KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS93aW5l
L3dpbmUuaGFzaCBiL3BhY2thZ2Uvd2luZS93aW5lLmhhc2gKPiBpbmRleCAwODNlM2RkM2ViLi45
YTdhMWMzNDJhIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uvd2luZS93aW5lLmhhc2gKPiArKysgYi9w
YWNrYWdlL3dpbmUvd2luZS5oYXNoCj4gQEAgLTEsNSArMSw1IEBACj4gICAjIExvY2FsbHkgY2Fs
Y3VsYXRlZCBhZnRlciBjaGVja2luZyBwZ3Agc2lnbmF0dXJlCj4gLXNoYTI1NiAgYjQ5MzA2NWYy
ZjgzZWU0MjljNjJlMmVjNTg2OThhM2NmNjNlZjc4NzIyZTFiMjA3NjU4MjMxNTJlODU4MmM1NiAg
d2luZS02LjAudGFyLnh6Cj4gK3NoYTI1NiAgNWI0M2UyN2Q1YzA4NWNiMThmOTczOTRlNDYxODAz
MTBkNWVlZjdjMWQ5MWM2ODk1NDMyYTM4ODliMmRlMDg2YiAgd2luZS03LjAudGFyLnh6Cj4gICAj
IExvY2FsbHkgY2FsY3VsYXRlZAo+ICAgc2hhMjU2ICBlMjM3ZmE1NjY2ODAzMGU5Mjg1NTFkZGQ2
MGYwNWRmNWZlOTU3Zjc1ZWFiODc0YmJkMDE3ZTA4NWVkNzIyZTdjICBDT1BZSU5HLkxJQgo+IC1z
aGEyNTYgIDExMTM5OGYxYmUyNWIxYWUxZjEyNDUxMmZlNjE1NjllNmI0NTU1NDA4ZTJmZWI5YmM4
MmY5ZmU1N2QzOWIzMDIgIExJQ0VOU0UKPiArc2hhMjU2ICA3YzM2MDkzMGU1MWQ1NmM4ZmExMmZl
MWRmOGVkMzQ4YWM3N2E5YWQ3M2Y5NTgyYTMwMzkxOTQ2OTM5OWIzY2U0ICBMSUNFTlNFCgogIFdo
ZW4gdGhlIGxpY2Vuc2UgaGFzaCBjaGFuZ2VzLCB5b3Ugc2hvdWxkIGV4cGxhaW4gaW4gdGhlIGNv
bW1pdCBtZXNzYWdlIHdoYXQgCmNoYW5nZWQuIFdlIHVzZSB0aGlzIHRvIGRldGVjdCBjaGFuZ2Vz
IGluIHRoZSBsaWNlbnNlICh3aGljaCBzb21ldGltZXMgZG9lcyAKaGFwcGVuISkuCgogIEluIHRo
aXMgY2FzZSwgaXQncyBqdXN0IGFuIHVwZGF0ZSBvZiBjb3B5cmlnaHQgeWVhciwgc28gSSBhZGRl
ZCB0aGF0IGFuZCAKYXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCiAgUmVnYXJkcywKICBBcm5v
dXQKCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvd2luZS93aW5lLm1rIGIvcGFja2FnZS93aW5lL3dp
bmUubWsKPiBpbmRleCBjOTI1YTU4NjMyLi41ZjRkMmVmNmUzIDEwMDY0NAo+IC0tLSBhL3BhY2th
Z2Uvd2luZS93aW5lLm1rCj4gKysrIGIvcGFja2FnZS93aW5lL3dpbmUubWsKPiBAQCAtNCw5ICs0
LDkgQEAKPiAgICMKPiAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gICAKPiAtV0lORV9WRVJT
SU9OID0gNi4wCj4gK1dJTkVfVkVSU0lPTiA9IDcuMAo+ICAgV0lORV9TT1VSQ0UgPSB3aW5lLSQo
V0lORV9WRVJTSU9OKS50YXIueHoKPiAtV0lORV9TSVRFID0gaHR0cHM6Ly9kbC53aW5laHEub3Jn
L3dpbmUvc291cmNlLzYuMAo+ICtXSU5FX1NJVEUgPSBodHRwczovL2RsLndpbmVocS5vcmcvd2lu
ZS9zb3VyY2UvNy4wCj4gICBXSU5FX0xJQ0VOU0UgPSBMR1BMLTIuMSsKPiAgIFdJTkVfTElDRU5T
RV9GSUxFUyA9IENPUFlJTkcuTElCIExJQ0VOU0UKPiAgIFdJTkVfQ1BFX0lEX1ZFTkRPUiA9IHdp
bmVocQo+IEBAIC0yMSwxMiArMjEsOSBAQCBXSU5FX0NPTkZfT1BUUyA9IFwKPiAgIAktLWRpc2Fi
bGUtd2luNjQgXAo+ICAgCS0td2l0aG91dC1jYXBpIFwKPiAgIAktLXdpdGhvdXQtY29yZWF1ZGlv
IFwKPiAtCS0td2l0aG91dC1mYXVkaW8gXAo+ICAgCS0td2l0aG91dC1nZXR0ZXh0IFwKPiAgIAkt
LXdpdGhvdXQtZ2V0dGV4dHBvIFwKPiAgIAktLXdpdGhvdXQtZ3Bob3RvIFwKPiAtCS0td2l0aG91
dC1nc20gXAo+IC0JLS13aXRob3V0LWhhbCBcCj4gICAJLS13aXRob3V0LW1pbmd3IFwKPiAgIAkt
LXdpdGhvdXQtb3BlbmNsIFwKPiAgIAktLXdpdGhvdXQtb3NzIFwKPiBAQCAtOTksMjAgKzk2LDYg
QEAgZWxzZQo+ICAgV0lORV9DT05GX09QVFMgKz0gLS13aXRob3V0LWdzdHJlYW1lcgo+ICAgZW5k
aWYKPiAgIAo+IC1pZmVxICgkKEJSMl9QQUNLQUdFX0pQRUcpLHkpCj4gLVdJTkVfQ09ORl9PUFRT
ICs9IC0td2l0aC1qcGVnCj4gLVdJTkVfREVQRU5ERU5DSUVTICs9IGpwZWcKPiAtZWxzZQo+IC1X
SU5FX0NPTkZfT1BUUyArPSAtLXdpdGhvdXQtanBlZwo+IC1lbmRpZgo+IC0KPiAtaWZlcSAoJChC
UjJfUEFDS0FHRV9MQ01TMikseSkKPiAtV0lORV9DT05GX09QVFMgKz0gLS13aXRoLWNtcwo+IC1X
SU5FX0RFUEVOREVOQ0lFUyArPSBsY21zMgo+IC1lbHNlCj4gLVdJTkVfQ09ORl9PUFRTICs9IC0t
d2l0aG91dC1jbXMKPiAtZW5kaWYKPiAtCj4gICBpZmVxICgkKEJSMl9QQUNLQUdFX0hBU19MSUJH
TCkseSkKPiAgIFdJTkVfQ09ORl9PUFRTICs9IC0td2l0aC1vcGVuZ2wKPiAgIFdJTkVfREVQRU5E
RU5DSUVTICs9IGxpYmdsCj4gQEAgLTEzNCwxMyArMTE3LDYgQEAgZWxzZQo+ICAgV0lORV9DT05G
X09QVFMgKz0gLS13aXRob3V0LXBjYXAKPiAgIGVuZGlmCj4gICAKPiAtaWZlcSAoJChCUjJfUEFD
S0FHRV9MSUJQTkcpLHkpCj4gLVdJTkVfQ09ORl9PUFRTICs9IC0td2l0aC1wbmcKPiAtV0lORV9E
RVBFTkRFTkNJRVMgKz0gbGlicG5nCj4gLWVsc2UKPiAtV0lORV9DT05GX09QVFMgKz0gLS13aXRo
b3V0LXBuZwo+IC1lbmRpZgo+IC0KPiAgIGlmZXEgKCQoQlIyX1BBQ0tBR0VfTElCVVNCKSx5KQo+
ICAgV0lORV9DT05GX09QVFMgKz0gLS13aXRoLXVzYgo+ICAgV0lORV9ERVBFTkRFTkNJRVMgKz0g
bGlidXNiCj4gQEAgLTE1NSwyOSArMTMxLDYgQEAgZWxzZQo+ICAgV0lORV9DT05GX09QVFMgKz0g
LS13aXRob3V0LXY0bDIKPiAgIGVuZGlmCj4gICAKPiAtaWZlcSAoJChCUjJfUEFDS0FHRV9MSUJY
TUwyKSx5KQo+IC1XSU5FX0NPTkZfT1BUUyArPSAtLXdpdGgteG1sCj4gLVdJTkVfREVQRU5ERU5D
SUVTICs9IGxpYnhtbDIKPiAtV0lORV9DT05GX0VOViArPSBYTUwyX0NPTkZJRz0kKFNUQUdJTkdf
RElSKS91c3IvYmluL3htbDItY29uZmlnCj4gLWVsc2UKPiAtV0lORV9DT05GX09QVFMgKz0gLS13
aXRob3V0LXhtbAo+IC1lbmRpZgo+IC0KPiAtaWZlcSAoJChCUjJfUEFDS0FHRV9MSUJYU0xUKSx5
KQo+IC1XSU5FX0NPTkZfT1BUUyArPSAtLXdpdGgteHNsdAo+IC1XSU5FX0RFUEVOREVOQ0lFUyAr
PSBsaWJ4c2x0Cj4gLVdJTkVfQ09ORl9FTlYgKz0gWFNMVF9DT05GSUc9JChTVEFHSU5HX0RJUikv
dXNyL2Jpbi94c2x0LWNvbmZpZwo+IC1lbHNlCj4gLVdJTkVfQ09ORl9PUFRTICs9IC0td2l0aG91
dC14c2x0Cj4gLWVuZGlmCj4gLQo+IC1pZmVxICgkKEJSMl9QQUNLQUdFX01QRzEyMykseSkKPiAt
V0lORV9DT05GX09QVFMgKz0gLS13aXRoLW1wZzEyMwo+IC1XSU5FX0RFUEVOREVOQ0lFUyArPSBt
cGcxMjMKPiAtZWxzZQo+IC1XSU5FX0NPTkZfT1BUUyArPSAtLXdpdGhvdXQtbXBnMTIzCj4gLWVu
ZGlmCj4gLQo+ICAgaWZlcSAoJChCUjJfUEFDS0FHRV9PUEVOQUwpLHkpCj4gICBXSU5FX0NPTkZf
T1BUUyArPSAtLXdpdGgtb3BlbmFsCj4gICBXSU5FX0RFUEVOREVOQ0lFUyArPSBvcGVuYWwKPiBA
QCAtMjI4LDEzICsxODEsNiBAQCBlbHNlCj4gICBXSU5FX0NPTkZfT1BUUyArPSAtLXdpdGhvdXQt
c2RsCj4gICBlbmRpZgo+ICAgCj4gLWlmZXEgKCQoQlIyX1BBQ0tBR0VfVElGRikseSkKPiAtV0lO
RV9DT05GX09QVFMgKz0gLS13aXRoLXRpZmYKPiAtV0lORV9ERVBFTkRFTkNJRVMgKz0gdGlmZgo+
IC1lbHNlCj4gLVdJTkVfQ09ORl9PUFRTICs9IC0td2l0aG91dC10aWZmCj4gLWVuZGlmCj4gLQo+
ICAgaWZlcSAoJChCUjJfUEFDS0FHRV9IQVNfVURFVikseSkKPiAgIFdJTkVfQ09ORl9PUFRTICs9
IC0td2l0aC11ZGV2Cj4gICBXSU5FX0RFUEVOREVOQ0lFUyArPSB1ZGV2Cj4gQEAgLTM0OSwyMyAr
Mjk1LDE3IEBAIEhPU1RfV0lORV9DT05GX09QVFMgKz0gXAo+ICAgCS0tZGlzYWJsZS13aW4xNiBc
Cj4gICAJLS13aXRob3V0LWFsc2EgXAo+ICAgCS0td2l0aG91dC1jYXBpIFwKPiAtCS0td2l0aG91
dC1jbXMgXAo+ICAgCS0td2l0aG91dC1jb3JlYXVkaW8gXAo+IC0JLS13aXRob3V0LWZhdWRpbyBc
Cj4gICAJLS13aXRob3V0LWN1cHMgXAo+ICAgCS0td2l0aG91dC1kYnVzIFwKPiAgIAktLXdpdGhv
dXQtZm9udGNvbmZpZyBcCj4gICAJLS13aXRob3V0LWdwaG90byBcCj4gICAJLS13aXRob3V0LWdu
dXRscyBcCj4gLQktLXdpdGhvdXQtZ3NtIFwKPiAgIAktLXdpdGhvdXQtZ3NzYXBpIFwKPiAgIAkt
LXdpdGhvdXQtZ3N0cmVhbWVyIFwKPiAtCS0td2l0aG91dC1oYWwgXAo+IC0JLS13aXRob3V0LWpw
ZWcgXAo+ICAgCS0td2l0aG91dC1rcmI1IFwKPiAgIAktLXdpdGhvdXQtbGRhcCBcCj4gICAJLS13
aXRob3V0LW1pbmd3IFwKPiAtCS0td2l0aG91dC1tcGcxMjMgXAo+ICAgCS0td2l0aG91dC1uZXRh
cGkgXAo+ICAgCS0td2l0aG91dC1vcGVuYWwgXAo+ICAgCS0td2l0aG91dC1vcGVuY2wgXAo+IEBA
IC0zNzQsMTAgKzMxNCw4IEBAIEhPU1RfV0lORV9DT05GX09QVFMgKz0gXAo+ICAgCS0td2l0aG91
dC1vc3MgXAo+ICAgCS0td2l0aG91dC1wY2FwIFwKPiAgIAktLXdpdGhvdXQtcHVsc2UgXAo+IC0J
LS13aXRob3V0LXBuZyBcCj4gICAJLS13aXRob3V0LXNhbmUgXAo+ICAgCS0td2l0aG91dC1zZGwg
XAo+IC0JLS13aXRob3V0LXRpZmYgXAo+ICAgCS0td2l0aG91dC11c2IgXAo+ICAgCS0td2l0aG91
dC12NGwyIFwKPiAgIAktLXdpdGhvdXQtdmtkM2QgXAo+IEBAIC0zODgsMTIgKzMyNiwxMCBAQCBI
T1NUX1dJTkVfQ09ORl9PUFRTICs9IFwKPiAgIAktLXdpdGhvdXQteGluZXJhbWEgXAo+ICAgCS0t
d2l0aG91dC14aW5wdXQgXAo+ICAgCS0td2l0aG91dC14aW5wdXQyIFwKPiAtCS0td2l0aG91dC14
bWwgXAo+ICAgCS0td2l0aG91dC14cmFuZHIgXAo+ICAgCS0td2l0aG91dC14cmVuZGVyIFwKPiAg
IAktLXdpdGhvdXQteHNoYXBlIFwKPiAgIAktLXdpdGhvdXQteHNobSBcCj4gLQktLXdpdGhvdXQt
eHNsdCBcCj4gICAJLS13aXRob3V0LXh4Zjg2dm0KPiAgIAo+ICAgJChldmFsICQoYXV0b3Rvb2xz
LXBhY2thZ2UpKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
