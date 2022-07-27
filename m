Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB2C8C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 14:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A5FB41573;
	Wed, 27 Jul 2022 14:37:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A5FB41573
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zsSA7edSoFo0; Wed, 27 Jul 2022 14:37:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04EA4408BB;
	Wed, 27 Jul 2022 14:37:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04EA4408BB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D64361BF4E4
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B137C60AEB
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:37:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B137C60AEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vDti_WR_3uuG for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 14:37:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51F8B60E02
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51F8B60E02
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 14:37:07 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id u5so24598129wrm.4
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 07:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kNLGugeZMf7Zf8J93bzmhkenCkd2iGr8fj5uIRojbPE=;
 b=dPJHEUgJopBTB24pXL/n7YMfcmSUApxfYJ+EI9xECOqKXxj+gEnnQ/4umQaI300fmu
 jQlG+LhPv72Vfa7eDHRUWrn34fi+PRwr0pIxq4JoOcdiy5N/a8hkIKmW0va7tqob4r1b
 XKTOWBCIx2dIv7vtN1UUp2aFcxOrfPp2xRRS3oh8og/N47f53JiIMrgbLUyJDiN8OFuc
 ODUiamr5LgELHb6B33MZY7uWezYqqE0TXoAJ/bRObgMNqEzGXy3aUrKr1M6ZfLkdtaF8
 Svf3T0R6ShPktl7UPkph6KBTGuwAoV9SOS0X8nUzoqe3jAVeptF/mZGopqVCAQdHh44K
 jgpg==
X-Gm-Message-State: AJIora/TZhOZihLm7tOZXiV+ilCu/l9NcN+h0vjjEGH+lWcwbYUvOyKB
 smIt5eyyfcTKFH8b9+wy6aXIXg==
X-Google-Smtp-Source: AGRyM1sU5UvWYSAkE0msA0r4Hb0wLlGlPi1/YmHQixTxv/nq9OTsM56G/uq5fmJpsmTMQmdcxA1jdw==
X-Received: by 2002:adf:e282:0:b0:21e:5546:5a26 with SMTP id
 v2-20020adfe282000000b0021e55465a26mr14860171wri.77.1658932625298; 
 Wed, 27 Jul 2022 07:37:05 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:86bb:8231:62d7:1874?
 ([2a01:cb19:8acf:5600:86bb:8231:62d7:1874])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a056000105200b0021e4f446d43sm16938023wrx.58.2022.07.27.07.37.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 07:37:04 -0700 (PDT)
Message-ID: <d4239aa4-467b-944b-9718-ff72b4501736@smile.fr>
Date: Wed, 27 Jul 2022 16:37:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: fr
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1658919469.git.yann.morin.1998@free.fr>
 <9c2e1f0723c547650772cfc43cf2c291fdc5abab.1658919469.git.yann.morin.1998@free.fr>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <9c2e1f0723c547650772cfc43cf2c291fdc5abab.1658919469.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=kNLGugeZMf7Zf8J93bzmhkenCkd2iGr8fj5uIRojbPE=;
 b=0vEZGQ2A/+aDdw+dXhBmwUxXGZedcJFAh741FsUmcMk8ksfFbF6/B5toB+aZU8vc6E
 ndPCKVAb5TWOMof+g3/YjR8b5aeiLpPlQTfeIwqwlP1SuE3/MSTrUpdIngZ9MOgtIC/J
 ulCJpBq85mYic9eO0uSbaVDHPm6bpWgRPzZbykXOldD0SEyqEFREXseYoyU9xba4CblL
 iwY38u3lttrBeKBGnfXpRo73c6pvS1d17GFlrp+ECwv3jo5RpbWQQuYjo8lJ9RXxGxQt
 DSjyV3TnxaZEjA6MRqDvLAsOvSuFfnPNDVA74eE27f9MQmIMOgZYntmn4+/nMYONJ2xp
 DYJA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=0vEZGQ2A
Subject: Re: [Buildroot] [PATCH 1/5] arch/csky: drop architecture
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
Cc: Guo Ren <ren_guo@c-sky.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwKCkxlIDI3LzA3LzIwMjIgw6AgMTI6NTgsIFlhbm4gRS4gTU9SSU4gYSDDqWNy
aXTCoDoKPiBXZSBjdXJyZW50bHkgaGF2ZSBubyBpbnRlcm5hbCBhbmQgbm8gZXh0ZXJuYWwgdG9v
bGNoYWluIGZvciBjc2t5Lgo+IFRoZSB3ZWJzaXRlIGlzIGRvd24gKG5vIGh0dHBzOi8vIGF2YWls
YWJsZSwgYW5kIHRoZSBodHRwOi8vIGluZGV4Cj4gcGFnZSBpcyA0MDQpLgo+IAo+IFRoaXMgY29t
bWl0IHJlbW92ZXMgdGhlIGFyY2hpdGVjdHVyZSBlbnRyeTsgcmVtbmFudHMgd2lsbCBiZSBkcm9w
cGVkIGluCj4gZm9sbG93dXAgY2hhbmdlcy4KClJldmlld2VkLWJ5OiBSb21haW4gTmFvdXIgPHJv
bWFpbi5uYW91ckBzbWlsZS5mcj4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBTaWduZWQt
b2ZmLWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4KPiBDYzogR3Vv
IFJlbiA8cmVuX2d1b0BjLXNreS5jb20+Cj4gQ2M6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5w
ZXRhenpvbmlAYm9vdGxpbi5jb20+Cj4gQ2M6IEFybm91dCBWYW5kZWNhcHBlbGxlIChFc3NlbnNp
dW0vTWluZCkgPGFybm91dEBtaW5kLmJlPgo+IC0tLQo+ICBDb25maWcuaW4ubGVnYWN5ICAgIHwg
IDcgKysrKysrCj4gIERFVkVMT1BFUlMgICAgICAgICAgfCAgMSAtCj4gIGFyY2gvQ29uZmlnLmlu
ICAgICAgfCAxNCAtLS0tLS0tLS0tLS0KPiAgYXJjaC9Db25maWcuaW4uY3NreSB8IDUyIC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBhcmNoL2FyY2gubWsu
Y3NreSAgIHwgMjYgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgNSBmaWxlcyBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKyksIDkzIGRlbGV0aW9ucygtKQo+ICBkZWxldGUgbW9kZSAxMDA2NDQgYXJj
aC9Db25maWcuaW4uY3NreQo+ICBkZWxldGUgbW9kZSAxMDA2NDQgYXJjaC9hcmNoLm1rLmNza3kK
PiAKPiBkaWZmIC0tZ2l0IGEvQ29uZmlnLmluLmxlZ2FjeSBiL0NvbmZpZy5pbi5sZWdhY3kKPiBp
bmRleCA5NDliY2ExY2QwLi4yNGI0MjM2YWRlIDEwMDY0NAo+IC0tLSBhL0NvbmZpZy5pbi5sZWdh
Y3kKPiArKysgYi9Db25maWcuaW4ubGVnYWN5Cj4gQEAgLTE0Niw2ICsxNDYsMTMgQEAgZW5kaWYK
PiAgCj4gIGNvbW1lbnQgIkxlZ2FjeSBvcHRpb25zIHJlbW92ZWQgaW4gMjAyMi4wOCIKPiAgCj4g
K2NvbmZpZyBCUjJfY3NreQo+ICsJYm9vbCAiY3NreSBhcmNoaXRlY3R1cmUgcmVtb3ZlZCIKPiAr
CXNlbGVjdCBCUjJfTEVHQUNZCj4gKwloZWxwCj4gKwkgIFRoZSBjc2t5IGFyY2hpdGVjdHVyZSB3
YXMgcmVtb3ZlZCwgYnkgbGFjayBvZiB0b29sY2hhaW4KPiArCSAgc3VwcG9ydC4KPiArCj4gIGNv
bmZpZyBCUjJfUEFDS0FHRV9NRVNBM0RfRFJJX0RSSVZFUl9JOTE1Cj4gIAlib29sICJtZXNhIERS
SSBpOTE1IGRyaXZlciByZW1vdmVkIgo+ICAJc2VsZWN0IEJSMl9MRUdBQ1kKPiBkaWZmIC0tZ2l0
IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKPiBpbmRleCAyNzBmYzUyZGUxLi4wNGM5NTg4ZjM0
IDEwMDY0NAo+IC0tLSBhL0RFVkVMT1BFUlMKPiArKysgYi9ERVZFTE9QRVJTCj4gQEAgLTExODIs
NyArMTE4Miw2IEBAIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRo
b25fcHliaW5kLnB5Cj4gIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0
aG9uX3B5YmluZC5weQo+ICAKPiAgTjoJR3VvIFJlbiA8cmVuX2d1b0BjLXNreS5jb20+Cj4gLUY6
CWFyY2gvQ29uZmlnLmluLmNza3kKPiAgRjoJYm9hcmQvY3NreS8KPiAgRjoJY29uZmlncy9jc2t5
XyoKPiAgCj4gZGlmZiAtLWdpdCBhL2FyY2gvQ29uZmlnLmluIGIvYXJjaC9Db25maWcuaW4KPiBp
bmRleCAxZDM4YzdhMDY1Li4xYzBjNDAwYTk4IDEwMDY0NAo+IC0tLSBhL2FyY2gvQ29uZmlnLmlu
Cj4gKysrIGIvYXJjaC9Db25maWcuaW4KPiBAQCAtNzAsMTYgKzcwLDYgQEAgY29uZmlnIEJSMl9h
YXJjaDY0X2JlCj4gIAkgIGh0dHA6Ly93d3cuYXJtLmNvbS9wcm9kdWN0cy9wcm9jZXNzb3JzL2lu
c3RydWN0aW9uLXNldC1hcmNoaXRlY3R1cmVzL2FybXY4LWFyY2hpdGVjdHVyZS5waHAKPiAgCSAg
aHR0cDovL2VuLndpa2lwZWRpYS5vcmcvd2lraS9BUk0KPiAgCj4gLWNvbmZpZyBCUjJfY3NreQo+
IC0JYm9vbCAiY3NreSIKPiAtCXNlbGVjdCBCUjJfQVJDSF9IQVNfTk9fVE9PTENIQUlOX0JVSUxE
Uk9PVAo+IC0Jc2VsZWN0IEJSMl9VU0VfTU1VCj4gLQlzZWxlY3QgQlIyX0FSQ0hfTkVFRFNfR0ND
X0FUX0xFQVNUXzkKPiAtCWhlbHAKPiAtCSAgY3NreSBpcyBwcm9jZXNzb3IgSVAgZnJvbSBjaGlu
YS4KPiAtCSAgaHR0cDovL3d3dy5jLXNreS5jb20vCj4gLQkgIGh0dHA6Ly93d3cuZ2l0aHViLmNv
bS9jLXNreQo+IC0KPiAgY29uZmlnIEJSMl9pMzg2Cj4gIAlib29sICJpMzg2Igo+ICAJc2VsZWN0
IEJSMl9VU0VfTU1VCj4gQEAgLTM3NiwxMCArMzY2LDYgQEAgaWYgQlIyX2FybSB8fCBCUjJfYXJt
ZWIgfHwgQlIyX2FhcmNoNjQgfHwgQlIyX2FhcmNoNjRfYmUKPiAgc291cmNlICJhcmNoL0NvbmZp
Zy5pbi5hcm0iCj4gIGVuZGlmCj4gIAo+IC1pZiBCUjJfY3NreQo+IC1zb3VyY2UgImFyY2gvQ29u
ZmlnLmluLmNza3kiCj4gLWVuZGlmCj4gLQo+ICBpZiBCUjJfbTY4awo+ICBzb3VyY2UgImFyY2gv
Q29uZmlnLmluLm02OGsiCj4gIGVuZGlmCj4gZGlmZiAtLWdpdCBhL2FyY2gvQ29uZmlnLmluLmNz
a3kgYi9hcmNoL0NvbmZpZy5pbi5jc2t5Cj4gZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5k
ZXggYjIwYjM5ZTIyNS4uMDAwMDAwMDAwMAo+IC0tLSBhL2FyY2gvQ29uZmlnLmluLmNza3kKPiAr
KysgL2Rldi9udWxsCj4gQEAgLTEsNTIgKzAsMCBAQAo+IC1jaG9pY2UKPiAtCXByb21wdCAiVGFy
Z2V0IEFyY2hpdGVjdHVyZSBWYXJpYW50Igo+IC0JZGVmYXVsdCBCUjJfY2s2MTAKPiAtCWhlbHAK
PiAtCSAgU3BlY2lmaWMgQ1BVIHZhcmlhbnQgdG8gdXNlCj4gLQo+IC1jb25maWcgQlIyX2NrNjEw
Cj4gLQkjIE5vdCBzdXBwb3J0ZWQgYnkgdXBzdHJlYW0gZ2NjIDw9IDksIGFuZCBoYW5kbGVkIGFz
IGEgc3BlY2lhbAo+IC0JIyBleGNlcHRpb24gaW4gcGFja2FnZS9nY2MvQ29uZmlnLmluLmhvc3QK
PiAtCWJvb2wgImNrNjEwIgo+IC0KPiAtY29uZmlnIEJSMl9jazgwNwo+IC0JYm9vbCAiY2s4MDci
Cj4gLQo+IC1jb25maWcgQlIyX2NrODEwCj4gLQlib29sICJjazgxMCIKPiAtCj4gLWNvbmZpZyBC
UjJfY2s4NjAKPiAtCWJvb2wgImNrODYwIgo+IC0KPiAtZW5kY2hvaWNlCj4gLQo+IC1jb25maWcg
QlIyX0NTS1lfRlBVCj4gLQlib29sICJFbmFibGUgRlBVIGNvcHJvY2Vzc29yIgo+IC0JZGVwZW5k
cyBvbiBCUjJfY2s4MTAgfHwgQlIyX2NrODA3IHx8IEJSMl9jazg2MAo+IC0JaGVscAo+IC0JICBZ
b3UgY2FuIHNheSBOIGhlcmUgaWYgeW91ciBDLVNLWSBDUFUgZG9lc24ndCBoYXZlIGEKPiAtCSAg
RmxvYXRpbmctUG9pbnQgQ29wcm9jZXNzb3Igb3IgaWYgeW91IGRvbid0IG5lZWQgRlBVIHN1cHBv
cnQKPiAtCSAgZm9yIHlvdXIgdXNlci1zcGFjZSBwcm9ncmFtcy4KPiAtCj4gLWNvbmZpZyBCUjJf
Q1NLWV9WRFNQCj4gLQlib29sICJFbmFibGUgVkRTUCBlbmhhbmNlZCBpbnN0cnVjdGlvbnMgQ28t
cHJvY2Vzc29yIgo+IC0JZGVwZW5kcyBvbiBCUjJfQ1NLWV9GUFUKPiAtCj4gLWNvbmZpZyBCUjJf
R0NDX1RBUkdFVF9GTE9BVF9BQkkKPiAtCWRlZmF1bHQgInNvZnQiCQlpZiAhQlIyX0NTS1lfRlBV
Cj4gLQlkZWZhdWx0ICJoYXJkIgkJaWYgQlIyX0NTS1lfRlBVCj4gLQo+IC1jb25maWcgQlIyX0FS
Q0gKPiAtCWRlZmF1bHQgImNza3kiCj4gLQo+IC1jb25maWcgQlIyX05PUk1BTElaRURfQVJDSAo+
IC0JZGVmYXVsdCAiY3NreSIKPiAtCj4gLWNvbmZpZyBCUjJfRU5ESUFOCj4gLQlkZWZhdWx0ICJM
SVRUTEUiCj4gLQo+IC1jb25maWcgQlIyX1JFQURFTEZfQVJDSF9OQU1FCj4gLQlkZWZhdWx0ICJD
U0tZIgo+IC0KPiAtIyB2aW06IGZ0PWtjb25maWcKPiAtIyAtKi0gbW9kZTprY29uZmlnOyAtKi0K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcmNoLm1rLmNza3kgYi9hcmNoL2FyY2gubWsuY3NreQo+IGRl
bGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IGZiNTlhZTIyZmQuLjAwMDAwMDAwMDAKPiAt
LS0gYS9hcmNoL2FyY2gubWsuY3NreQo+ICsrKyAvZGV2L251bGwKPiBAQCAtMSwyNiArMCwwIEBA
Cj4gLSMKPiAtIyBDb25maWd1cmUgdGhlIEdDQ19UQVJHRVRfQVJDSCB2YXJpYWJsZSBhbmQgYXBw
ZW5kIHRoZQo+IC0jIGFwcHJvcHJpYXRlIEMtU0tZIElTQSBleHRlbnNpb25zLgo+IC0jCj4gLQo+
IC1pZmVxICgkKEJSMl9jc2t5KSx5KQo+IC0KPiAtaWZlcSAoJChCUjJfY2s2MTApLHkpCj4gLUdD
Q19UQVJHRVRfQ1BVIDo9IGNrNjEwCj4gLWVsc2UgaWZlcSAoJChCUjJfY2s4MDcpLHkpCj4gLUdD
Q19UQVJHRVRfQ1BVIDo9IGNrODA3Cj4gLWVsc2UgaWZlcSAoJChCUjJfY2s4MTApLHkpCj4gLUdD
Q19UQVJHRVRfQ1BVIDo9IGNrODEwCj4gLWVsc2UgaWZlcSAoJChCUjJfY2s4NjApLHkpCj4gLUdD
Q19UQVJHRVRfQ1BVIDo9IGNrODYwCj4gLWVuZGlmCj4gLQo+IC1pZmVxICgkKEJSMl9DU0tZX0ZQ
VSkseSkKPiAtR0NDX1RBUkdFVF9DUFUgOj0gJChHQ0NfVEFSR0VUX0NQVSlmCj4gLWVuZGlmCj4g
LQo+IC1pZmVxICgkKEJSMl9DU0tZX1ZEU1ApLHkpCj4gLUdDQ19UQVJHRVRfQ1BVIDo9ICQoR0ND
X1RBUkdFVF9DUFUpdgo+IC1lbmRpZgo+IC0KPiAtZW5kaWYKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
