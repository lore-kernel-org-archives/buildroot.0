Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA7F4C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 13:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6619A61003;
	Sat, 23 Jul 2022 13:56:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6619A61003
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d5b-orSRyaAy; Sat, 23 Jul 2022 13:56:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6852560FF8;
	Sat, 23 Jul 2022 13:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6852560FF8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B6B9A1BF859
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F7DD84955
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F7DD84955
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4CjO9l7LCXVf for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 13:56:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B213684943
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B213684943
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 13:56:27 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id h8so9960771wrw.1
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 06:56:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EG1QDwrsn9Vn25EqCFQGJrFruyZYD4Q7ar+ffOOFaKQ=;
 b=DHo1Jxt424RenNxwtEClWWM01cxyaIYzGLzD0V+jNK5mmR3043v9/wfTh0/Ikoy3XZ
 R9m8FacVZUK4pH8io38gqdnI4gmf2WCOMtHT2SJiRsqzceVGO9a6Vh2nsv9E+mt9gfIQ
 k23NXN00EVNYM3Bp97TIE8Xux4B/YHv0EUplUSdZfRDj+ArrXb9Xapb4FEFa/RQmB4m5
 AfzN1sGrbmtfEM162krB6q3jYw9OK5Atjqr7Mn9d9V5yUF+IP74ZmSAvRuiuHH5Y2kY0
 dLxd3qYh64OjadqPO51OXBfydW9GRxmWdah4wXhN+MJoTpK5S5wYZMfwnOjBJyZDUlMl
 cxVw==
X-Gm-Message-State: AJIora8Q//x3EMZ5BHTPz1hOVJ2+SPV3Dz94M7PzM2gqxO/GwPr8uxqB
 yVijq45zBE/NM3l4zwjtULHJnw==
X-Google-Smtp-Source: AGRyM1vPGQZw6SIdst+2cClMwfXRRC0url/5Kyr64Zzyy968HdM31+MuPIzuvsUbMETHuBazO9FtUA==
X-Received: by 2002:a05:6000:156f:b0:21d:887f:8ddf with SMTP id
 15-20020a056000156f00b0021d887f8ddfmr2941146wrz.534.1658584585733; 
 Sat, 23 Jul 2022 06:56:25 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c358c00b0039c96b97359sm8658885wmq.37.2022.07.23.06.56.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 06:56:25 -0700 (PDT)
Message-ID: <0d28b898-b7aa-2823-380b-60da6e375d03@smile.fr>
Date: Sat, 23 Jul 2022 15:56:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Abel Bernabeu <abel@x-silicon.com>, buildroot@buildroot.org
References: <20220704085552.3499243-1-abel@x-silicon.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220704085552.3499243-1-abel@x-silicon.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=EG1QDwrsn9Vn25EqCFQGJrFruyZYD4Q7ar+ffOOFaKQ=;
 b=y370NUv3YuWJZiJpsE3+S2JQ3RU842/SeqTgrvX7CeoU+GhXJiWsiaNVWjBNWUTplB
 fYcyNT0xga5o2okhPSogg69JIPKPCsiop2NguyhkZnQr2vfaljIldPHXOuKXSwLxhAhG
 /TeN9PcVWC8p+PbSalwqdlRlM6z418WcrE1VgFMrA8YfuqzwA9nQCAnFMTX81Yb2/r4Z
 nA33dN5ScdXCyGT4Gy745O58mRPdQU4L1y+3efqpruxNRoECYogUGceumWe6VFjh676x
 +Oj1f4PKI+HL3MUWOdhXEoK/HSRqnm0KZxEQO3PBYTtH1BWQg4WfG+qerj7lkR+WWBQc
 vqbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=y370NUv3
Subject: Re: [Buildroot] [PATCH 1/2] package/llvm: Support for RISC-V on the
 LLVM package
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Mark Corbin <mark@dibsco.co.uk>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQWJlbCwKCkxlIDA0LzA3LzIwMjIgw6AgMTA6NTUsIEFiZWwgQmVybmFiZXUgYSDDqWNy
aXTCoDoKPiBUaGUgaW5pdGlhbCBzdXBwb3J0IGZvciB0aGUgTExWTSBwYWNrYWdlIGRpZCBub3Qg
aW5jbHVkZSBSSVNDLVYsIGFuZAo+IG5lZWRlZCB0byBiZSBhZGRlZC4KCkluZGVlZCwgYXQgdGhl
IHRpbWUgTExWTSBwYWNrYWdlIHdhcyBhZGRlZCB0byBCdWlsZHJvb3QgdGhlcmUgd2FzIG5vIFJJ
U0MtVgpzdXBwb3J0IHlldC4KCj4gCj4gVGhlcmUgaXMgYSBuZXcgY29uZmlndXJhdGlvbiBwYXJh
bWV0ZXIgYWRkZWQKPiAoQlIyX1BBQ0tBR0VfTExWTV9UQVJHRVRTX1RPX0JVSUxEKSBmb3IgZGVh
bGluZyB3aXRoIHRoZSBmYWN0IHRoYXQKPiB0aGUgTExWTSB0YXJnZXQgYW5kIHRoZSBhcmNoaXRl
Y3R1cmUgaGF2ZSBkaWZmZXJlbnQgbmFtaW5nIGZvciBSSVNDLVYuCj4gV2hpbGUgdGhlIHRhcmdl
dCBmb3IgUklTQy1WIGlzICJSSVNDViIgaXJyZXNwZWN0aXZlIG9mIHRoZSBJU0EgYmVpbmcKPiAz
MiBvciA2NCBiaXRzLCB0aGUgYXJjaGl0ZWN0dXJlIGRvZXMgY29udGFpbiB0aGUgbnVtYmVyIG9m
IGJpdHMKPiBsZWFkaW5nIHRvICJyaXNjdjMyIiBhbmQgInJpc2N2NjQiLgo+IAo+IEZvciBwcmV2
aW91c2x5IHN1cHBvcnRlZCBhcmNoaXRlY3R1cmVzIHRoZSBuYW1pbmcgZm9yIHRhcmdldCBhbmQK
PiBhcmNoaXRlY3R1cmUgbWF0Y2hlZCBhbmQgdGh1cyB0aGlzIHBhcmFtZXRlciBoYWQgbm90IGJl
ZW4gbmVlZGVkLCBidXQKPiBpdCBpcyBub3cgbmVlZGVkIGZvciBSSVNDLVYuCj4gCj4gU2lnbmVk
LW9mZi1ieTogQWJlbCBCZXJuYWJldSA8YWJlbEB4LXNpbGljb24uY29tPgo+IC0tLQo+ICBwYWNr
YWdlL2xsdm0vQ29uZmlnLmluIHwgMTAgKysrKysrKysrKwo+ICBwYWNrYWdlL2xsdm0vbGx2bS5t
ayAgIHwgIDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGx2bS9Db25maWcuaW4gYi9wYWNrYWdl
L2xsdm0vQ29uZmlnLmluCj4gaW5kZXggYzE4ODdlMzZkZC4uNWYyODY0YjgwMiAxMDA2NDQKPiAt
LS0gYS9wYWNrYWdlL2xsdm0vQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9sbHZtL0NvbmZpZy5p
bgo+IEBAIC00LDEyICs0LDIyIEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9MTFZNX0FSQ0hfU1VQUE9S
VFMKPiAgCWRlZmF1bHQgeSBpZiBCUjJfeDg2XzY0Cj4gIAlkZWZhdWx0IHkgaWYgQlIyX2FhcmNo
NjQKPiAgCWRlZmF1bHQgeSBpZiBCUjJfYXJtIHx8IEJSMl9hcm1lYgo+ICsJZGVmYXVsdCB5IGlm
IEJSMl9yaXNjdgo+ICAKPiAgY29uZmlnIEJSMl9QQUNLQUdFX0xMVk1fVEFSR0VUX0FSQ0gKPiAg
CXN0cmluZwo+ICAJZGVmYXVsdCAiQUFyY2g2NCIgaWYgQlIyX2FhcmNoNjQKPiAgCWRlZmF1bHQg
IkFSTSIgaWYgQlIyX2FybSB8fCBCUjJfYXJtZWIKPiAgCWRlZmF1bHQgIlg4NiIgaWYgQlIyX2kz
ODYgfHwgQlIyX3g4Nl82NAo+ICsJZGVmYXVsdCAicmlzY3YzMiIgaWYgQlIyX3Jpc2N2ICYmICFC
UjJfQVJDSF9JU182NAo+ICsgICAgICAgIGRlZmF1bHQgInJpc2N2NjQiIGlmIEJSMl9yaXNjdiAm
JiBCUjJfQVJDSF9JU182NAoKSW5kZW50YXRpb24gaXNzdWUsIHBsZWFzZSB1c2Ugb25lIHRhYi4K
Cj4gKwo+ICtjb25maWcgQlIyX1BBQ0tBR0VfTExWTV9UQVJHRVRTX1RPX0JVSUxECj4gKwlzdHJp
bmcKPiArCWRlZmF1bHQgIkFBcmNoNjQiIGlmIEJSMl9hYXJjaDY0Cj4gKwlkZWZhdWx0ICJBUk0i
IGlmIEJSMl9hcm0gfHwgQlIyX2FybWViCj4gKwlkZWZhdWx0ICJYODYiIGlmIEJSMl9pMzg2IHx8
IEJSMl94ODZfNjQKPiArCWRlZmF1bHQgIlJJU0NWIiBpZiBCUjJfcmlzY3YKCkhhdmluZyB0byBk
dXBsaWNhdGUgQlIyX1BBQ0tBR0VfTExWTV9UQVJHRVRfQVJDSCBmb3IgdGhlIHNha2Ugb2Ygb25l
CmFyY2hpdGVjdHVyZSBpcyBhIHBpdHkuCgpNYXliZSB3ZSBjYW4gdHJ5IHRvIHVzZSAkKHN1YnN0
IC4uLikgdG8gcmVwbGFjZSByaXNjdjMyfDY0IGJ5IFJJU0NWIGJ1dCBpdCdzIG5vdApyZWFsbHkg
YSBjbGVhbiBzb2x1dGlvbiBlaXRoZXIuLi4uCgpSZXZpZXdlZC1ieTogUm9tYWluIE5hb3VyIDxy
b21haW4ubmFvdXJAc21pbGUuZnI+CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKPiAgCj4gIGNvbmZp
ZyBCUjJfUEFDS0FHRV9MTFZNCj4gIAlib29sICJsbHZtIgo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L2xsdm0vbGx2bS5tayBiL3BhY2thZ2UvbGx2bS9sbHZtLm1rCj4gaW5kZXggNDY3MDc3M2NhMy4u
ZGJmMWY3YjgxMyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xsdm0vbGx2bS5tawo+ICsrKyBiL3Bh
Y2thZ2UvbGx2bS9sbHZtLm1rCj4gQEAgLTQyLDcgKzQyLDcgQEAgSE9TVF9MTFZNX0NPTkZfT1BU
UyArPSAtRENNQUtFX0lOU1RBTExfUlBBVEg9IiQoSE9TVF9ESVIpL2xpYiIKPiAgTExWTV9UQVJH
RVRfQVJDSCA9ICQoY2FsbCBxc3RyaXAsJChCUjJfUEFDS0FHRV9MTFZNX1RBUkdFVF9BUkNIKSkK
PiAgCj4gICMgQnVpbGQgYmFja2VuZCBmb3IgdGFyZ2V0IGFyY2hpdGVjdHVyZS4gVGhpcyBpbmNs
dWRlIGJhY2tlbmRzIGxpa2UgQU1ER1BVLgo+IC1MTFZNX1RBUkdFVFNfVE9fQlVJTEQgPSAkKExM
Vk1fVEFSR0VUX0FSQ0gpCj4gK0xMVk1fVEFSR0VUU19UT19CVUlMRCA9ICQoQlIyX1BBQ0tBR0Vf
TExWTV9UQVJHRVRTX1RPX0JVSUxEKQo+ICBIT1NUX0xMVk1fQ09ORl9PUFRTICs9IC1ETExWTV9U
QVJHRVRTX1RPX0JVSUxEPSIkKHN1YnN0ICQoc3BhY2UpLDssJChMTFZNX1RBUkdFVFNfVE9fQlVJ
TEQpKSIKPiAgTExWTV9DT05GX09QVFMgKz0gLURMTFZNX1RBUkdFVFNfVE9fQlVJTEQ9IiQoc3Vi
c3QgJChzcGFjZSksOywkKExMVk1fVEFSR0VUU19UT19CVUlMRCkpIgo+ICAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
