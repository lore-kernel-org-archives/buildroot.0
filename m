Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0640AC433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:16:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70465611CC
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 70465611CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33ACA40805;
	Wed, 13 Oct 2021 19:16:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MKw6Pw-P5pbR; Wed, 13 Oct 2021 19:16:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A24A407FA;
	Wed, 13 Oct 2021 19:16:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6FA6A1BF372
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5EDFA407FA
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:16:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jqjCe6B3xqPJ for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 19:16:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 327F5407D9
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 19:16:46 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id d3so14346365edp.3
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 12:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=O0L/JqcmQVOaz5ynk3DmUE7suJuF8Bk4Nqw5/JtrKpQ=;
 b=TUXvRvgWDF+lhCAA1Ak/ixH91Dbh2HN4MYSghlT+kvEmBaED1yCAnoYF49lPuULviG
 uW3OvygMoTlOz5FkffG3imrJ8Y7iE5v7n5CSZsZiQf2AUTFP6iLSwPOZomVl4saIiQ+Y
 q+RCu2h9qZF88Pz+hfT5frrTDJJueeGJALJ/QL3s7csynClGmhmOf7E6k46rGlFfTQVC
 EDPC91CakgQtHNJSl3+stUgCzyVEByOGW2xtFdyUcadNuPC89LW6ns2ScWmdOTr16gsc
 kz+eY1mvZ0esdXblAfjEMwNxiCpORDipraekgRAeZ3F1VUqLgWe7bgij+QrioJBf2rUQ
 OcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=O0L/JqcmQVOaz5ynk3DmUE7suJuF8Bk4Nqw5/JtrKpQ=;
 b=DXbjhpOsUKttteSpTA97wwMiDlnoAD0GaoWN1zG6OyKcRikzOuh6mlRNZ1cqMRxF/k
 HAca/UjjAq+72xpNF8reF53RvZH+1qMuuBNTy1L7jX3FjdKCubuxm21yclvKR183eEEZ
 bNIaSPmLmyccUb39uUcgqU6HZ0p8AeFaJtWzrgSGgpC0qSrn8WRhiYfcmrnb7ih8Xayz
 gq4ztleuSdZauk96l4r2BjV+haMpJ40rPYPoJl5f1kZRf85jy3UP2NDe7Z+ElqJPyr2t
 q/J58AOIRZTIeTBK2wucUiS/1SH9WVKAxJ3j0494uZItq5KsaRAUL4Alde46WF5bo01u
 5l4g==
X-Gm-Message-State: AOAM530awkrUdsNcVHqC/47Tm4ysN6PeCJPwBw35Vjrx97Wf2mmnUJzg
 lWSTLTKOyRVQIDBScdoCbTpO8z6bFNisjAA3
X-Google-Smtp-Source: ABdhPJxcM6u8lUjc87r8IeOQmGGPsiKY9Fl8AYfmLSzk9iQCfkDPb3Y/5MY6AtPyg5/bmoHACem1RA==
X-Received: by 2002:a05:6402:485:: with SMTP id
 k5mr1711323edv.257.1634152605333; 
 Wed, 13 Oct 2021 12:16:45 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id os19sm311886ejb.16.2021.10.13.12.16.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 12:16:45 -0700 (PDT)
Message-ID: <f567bf06-351b-a168-d62a-99f41fec5361@mind.be>
Date: Wed, 13 Oct 2021 21:16:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
From: Arnout Vandecappelle <arnout@mind.be>
To: Chris Dimich <chris.dimich@boundarydevices.com>, buildroot@buildroot.org
References: <20211006204135.2813745-1-chris.dimich@boundarydevices.com>
 <20211006204135.2813745-6-chris.dimich@boundarydevices.com>
 <2ccce449-d453-f50c-7310-c898b5ab5f0b@mind.be>
Organization: Essensium/Mind
In-Reply-To: <2ccce449-d453-f50c-7310-c898b5ab5f0b@mind.be>
Subject: Re: [Buildroot] [PATCH 06/12]
 package/freescale-imx/imx-vpu-hantro-vc: add package
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gary Bisson <bisson.gary@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDEzLzEwLzIwMjEgMjE6MDcsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Cj4KPiBP
biAwNi8xMC8yMDIxIDIyOjQxLCBDaHJpcyBEaW1pY2ggd3JvdGU6Cj4+IGkuTVggVkM4MDAwRSBF
bmNvZGVyIGxpYnJhcnkuIEludGVuZGVkIGZvciB0aGUgaS5NWCA4TSBQbHVzIHByb2Nlc3Nvci4K
Pj4KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgRGltaWNoIDxjaHJpcy5kaW1pY2hAYm91bmRhcnlk
ZXZpY2VzLmNvbT4KPgo+IMKgQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCiDCoEkgZm9yZ290
OiBwbGVhc2UgYWRkIHlvdXJzZWxmIHRvIHRoZSBERVZFTE9QRVJTIGZpbGUgWzFdIGZvciB0aGlz
IHBhY2thZ2UuIApUaGlzIHdheSwgeW91J2xsIGdldCBhbiBlLW1haWwgaWYgdGhlIHBhY2thZ2Ug
ZmFpbHMgaW4gdGhlIGF1dG9idWlsZGVycywgb3Igd2hlbiAKYSBuZXcgdmVyc2lvbiBpcyByZWxl
YXNlZCBpZiB0aGUgcGFja2FnZSBpcyByZWdpc3RlcmVkIG9uIHJlbGVhc2UtbW9uaXRvcmluZy5v
cmcuCgoKIMKgUmVnYXJkcywKIMKgQXJub3V0CgpbMV0gaHR0cHM6Ly9idWlsZHJvb3Qub3JnL2Rv
d25sb2Fkcy9tYW51YWwvbWFudWFsLmh0bWwjREVWRUxPUEVSUwoKPgo+IMKgUmVnYXJkcywKPiDC
oEFybm91dAo+Cj4+IC0tLQo+PiDCoCBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvQ29uZmlnLmluwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMSArCj4+IMKgIC4uLi9mcmVlc2NhbGUtaW14
L2lteC12cHUtaGFudHJvLXZjL0NvbmZpZy5pbiB8IDEzICsrKysrKysrKysKPj4gwqAgLi4uL2lt
eC12cHUtaGFudHJvLXZjL2lteC12cHUtaGFudHJvLXZjLmhhc2jCoCB8wqAgNCArKysKPj4gwqAg
Li4uL2lteC12cHUtaGFudHJvLXZjL2lteC12cHUtaGFudHJvLXZjLm1rwqDCoMKgIHwgMjUgKysr
KysrKysrKysrKysrKysrKwo+PiDCoCA0IGZpbGVzIGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKykK
Pj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtdnB1LWhh
bnRyby12Yy9Db25maWcuaW4KPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IAo+PiBwYWNrYWdlL2Zy
ZWVzY2FsZS1pbXgvaW14LXZwdS1oYW50cm8tdmMvaW14LXZwdS1oYW50cm8tdmMuaGFzaAo+PiDC
oCBjcmVhdGUgbW9kZSAxMDA2NDQgCj4+IHBhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtdnB1LWhh
bnRyby12Yy9pbXgtdnB1LWhhbnRyby12Yy5tawo+Pgo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9m
cmVlc2NhbGUtaW14L0NvbmZpZy5pbiBiL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9Db25maWcuaW4K
Pj4gaW5kZXggYmVkZDA1YTQ3MS4uNGE0MjM3ZmI0MiAxMDA2NDQKPj4gLS0tIGEvcGFja2FnZS9m
cmVlc2NhbGUtaW14L0NvbmZpZy5pbgo+PiArKysgYi9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvQ29u
ZmlnLmluCj4+IEBAIC0xMTUsNiArMTE1LDcgQEAgc291cmNlICJwYWNrYWdlL2ZyZWVzY2FsZS1p
bXgvaW14LXZwdXdyYXAvQ29uZmlnLmluIgo+PiDCoCBzb3VyY2UgInBhY2thZ2UvZnJlZXNjYWxl
LWlteC9maXJtd2FyZS1pbXgvQ29uZmlnLmluIgo+PiDCoCBzb3VyY2UgInBhY2thZ2UvZnJlZXNj
YWxlLWlteC9pbXgtc2MtZmlybXdhcmUvQ29uZmlnLmluIgo+PiDCoCBzb3VyY2UgInBhY2thZ2Uv
ZnJlZXNjYWxlLWlteC9pbXgtc2Vjby9Db25maWcuaW4iCj4+ICtzb3VyY2UgInBhY2thZ2UvZnJl
ZXNjYWxlLWlteC9pbXgtdnB1LWhhbnRyby12Yy9Db25maWcuaW4iCj4+IMKgIGlmIChCUjJfUEFD
S0FHRV9GUkVFU0NBTEVfSU1YX1BMQVRGT1JNX0lNWDUxIHx8IAo+PiBCUjJfUEFDS0FHRV9GUkVF
U0NBTEVfSU1YX1BMQVRGT1JNX0lNWDUzKQo+PiDCoCBzb3VyY2UgInBhY2thZ2UvZnJlZXNjYWxl
LWlteC9ncHUtYW1kLWJpbi1teDUxL0NvbmZpZy5pbiIKPj4gwqAgc291cmNlICJwYWNrYWdlL2Zy
ZWVzY2FsZS1pbXgvbGliejE2MC9Db25maWcuaW4iCj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2Zy
ZWVzY2FsZS1pbXgvaW14LXZwdS1oYW50cm8tdmMvQ29uZmlnLmluIAo+PiBiL3BhY2thZ2UvZnJl
ZXNjYWxlLWlteC9pbXgtdnB1LWhhbnRyby12Yy9Db25maWcuaW4KPj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMC4uOWFlMTM5NTUwYQo+PiAtLS0gL2Rldi9udWxsCj4+
ICsrKyBiL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtdnB1LWhhbnRyby12Yy9Db25maWcuaW4K
Pj4gQEAgLTAsMCArMSwxMyBAQAo+PiArY29tbWVudCAiaW14LXZwdS1oYW50cm8tdmMgbmVlZHMg
YW4gaS5NWC1zcGVjaWZpYyBMaW51eCBrZXJuZWwgdG8gYmUgYnVpbHQiCj4+ICvCoMKgwqAgZGVw
ZW5kcyBvbiAhQlIyX0xJTlVYX0tFUk5FTAo+PiArCj4+ICtjb21tZW50ICJpbXgtdnB1LWhhbnRy
by12YyBuZWVkcyBhbiBpLk1YIHBsYXRmb3JtIHdpdGggSGFudHJvIFZQVSIKPj4gK8KgwqDCoCBk
ZXBlbmRzIG9uIEJSMl9MSU5VWF9LRVJORUwKPj4gK8KgwqDCoCBkZXBlbmRzIG9uICFCUjJfUEFD
S0FHRV9GUkVFU0NBTEVfSU1YX0hBU19WUFVfSEFOVFJPCj4+ICsKPj4gK2NvbmZpZyBCUjJfUEFD
S0FHRV9JTVhfVlBVX0hBTlRST19WQwo+PiArwqDCoMKgIGJvb2wgImlteC12cHUtaGFudHJvLXZj
Igo+PiArwqDCoMKgIGRlcGVuZHMgb24gQlIyX0xJTlVYX0tFUk5FTAo+PiArwqDCoMKgIGRlcGVu
ZHMgb24gQlIyX1BBQ0tBR0VfRlJFRVNDQUxFX0lNWF9IQVNfVlBVX0hBTlRSTwo+PiArwqDCoMKg
IGhlbHAKPj4gK8KgwqDCoMKgwqAgaS5NWCBWQzgwMDBFIEVuY29kZXIgbGlicmFyeS4gSW50ZW5k
ZWQgZm9yIHRoZSBpLk1YIDhNIFBsdXMgcHJvY2Vzc29yLgo+PiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9mcmVlc2NhbGUtaW14L2lteC12cHUtaGFudHJvLXZjL2lteC12cHUtaGFudHJvLXZjLmhhc2gg
Cj4+IGIvcGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC12cHUtaGFudHJvLXZjL2lteC12cHUtaGFu
dHJvLXZjLmhhc2gKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMC4u
YWFkZjViMTIxZgo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL3BhY2thZ2UvZnJlZXNjYWxlLWlt
eC9pbXgtdnB1LWhhbnRyby12Yy9pbXgtdnB1LWhhbnRyby12Yy5oYXNoCj4+IEBAIC0wLDAgKzEs
NCBAQAo+PiArIyBMb2NhbGx5IGNvbXB1dGVkOgo+PiArc2hhMjU2IGQ1ZWZhZTQ4NGM0MjcxYzA5
ODI4NmQwMDc1OTBkNmJmNDBjMjcyZDRmMzU3MDJmZjY1NjI1ZjIzNjI3MTVhYjMgCj4+IGlteC12
cHUtaGFudHJvLXZjLTEuNC4wLmJpbgo+PiArc2hhMjU2IGVhNTg2MzZiZjM0ZjU4OTA0OGZjZDQ2
ZTM4NDk3YzQ3MjI5ZmRlODQ5OGRmMDg2ZmY1ZmI1MmY5ZWY4ZTE1ZWUgQ09QWUlORwo+PiArc2hh
MjU2IDUwMDk5ZTI4M2NmZDMwN2Y4NGYxNTlhZWIxYTZmNDYyMzUxMzIwMjczZGJjZGI4MGQ3ZjJj
OWRiMDQ5NGI3MWMgRVVMQQo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9mcmVlc2NhbGUtaW14L2lt
eC12cHUtaGFudHJvLXZjL2lteC12cHUtaGFudHJvLXZjLm1rIAo+PiBiL3BhY2thZ2UvZnJlZXNj
YWxlLWlteC9pbXgtdnB1LWhhbnRyby12Yy9pbXgtdnB1LWhhbnRyby12Yy5tawo+PiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwMDAwLi5iMDdlMTE2Njc0Cj4+IC0tLSAvZGV2
L251bGwKPj4gKysrIGIvcGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC12cHUtaGFudHJvLXZjL2lt
eC12cHUtaGFudHJvLXZjLm1rCj4+IEBAIC0wLDAgKzEsMjUgQEAKPj4gKyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIAo+Pgo+PiArIwo+PiArIyBpbXgtdnB1LWhhbnRyby12Ywo+PiArIwo+PiArIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMgCj4+Cj4+ICsKPj4gK0lNWF9WUFVfSEFOVFJPX1ZDX1ZFUlNJ
T04gPSAxLjQuMAo+PiArSU1YX1ZQVV9IQU5UUk9fVkNfU0lURSA9ICQoRlJFRVNDQUxFX0lNWF9T
SVRFKQo+PiArSU1YX1ZQVV9IQU5UUk9fVkNfU09VUkNFID0gaW14LXZwdS1oYW50cm8tdmMtJChJ
TVhfVlBVX0hBTlRST19WQ19WRVJTSU9OKS5iaW4KPj4gK0lNWF9WUFVfSEFOVFJPX1ZDX0RFUEVO
REVOQ0lFUyA9IGxpbnV4Cj4+ICsKPj4gK0lNWF9WUFVfSEFOVFJPX1ZDX0xJQ0VOU0UgPSBOWFAg
U2VtaWNvbmR1Y3RvciBTb2Z0d2FyZSBMaWNlbnNlIEFncmVlbWVudAo+PiArSU1YX1ZQVV9IQU5U
Uk9fVkNfTElDRU5TRV9GSUxFUyA9IEVVTEEgQ09QWUlORwo+PiArSU1YX1ZQVV9IQU5UUk9fVkNf
UkVESVNUUklCVVRFID0gTk8KPj4gKwo+PiArZGVmaW5lIElNWF9WUFVfSEFOVFJPX1ZDX0VYVFJB
Q1RfQ01EUwo+PiArwqDCoMKgICQoY2FsbCAKPj4gRlJFRVNDQUxFX0lNWF9FWFRSQUNUX0hFTFBF
UiwkKElNWF9WUFVfSEFOVFJPX1ZDX0RMX0RJUikvJChJTVhfVlBVX0hBTlRST19WQ19TT1VSQ0Up
KQo+PiArZW5kZWYKPj4gKwo+PiArZGVmaW5lIElNWF9WUFVfSEFOVFJPX1ZDX0lOU1RBTExfVEFS
R0VUX0NNRFMKPj4gK8KgwqDCoCAkKElOU1RBTEwpIC1EIC1tIDA3NTUgJChARCkvdXNyL2xpYi9s
aWJoYW50cm9fdmM4MDAwZS5zbyAKPj4gJChUQVJHRVRfRElSKS91c3IvbGliL2xpYmhhbnRyb192
YzgwMDBlLnNvCj4+ICvCoMKgwqAgJChJTlNUQUxMKSAtRCAtbSAwNzU1ICQoQEQpL3Vzci9saWIv
bGliaGFudHJvX3ZjODAwMGUuc28uMSAKPj4gJChUQVJHRVRfRElSKS91c3IvbGliL2xpYmhhbnRy
b192YzgwMDBlLnNvLjEKPj4gK2VuZGVmCj4+ICsKPj4gKyQoZXZhbCAkKGdlbmVyaWMtcGFja2Fn
ZSkpCj4+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
