Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A874EC433FE
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 18:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4441A408F6;
	Wed, 23 Feb 2022 18:51:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NktaP8dvAdqh; Wed, 23 Feb 2022 18:51:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC300408F1;
	Wed, 23 Feb 2022 18:51:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 445EB1BF5F5
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 18:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31DE8415B1
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 18:51:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QhbskbF3B4aW for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 18:51:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE39F415B2
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 18:51:23 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id hw13so54109679ejc.9
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 10:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=rICshUhnsv+tmW98ypxjZtlY9wug2ZYttw1mvAjt2mY=;
 b=RW1KDhcSSUMA2VUSyfYd2Luz51iK9ECqTK1WFlXeD/jUmkX3thrIIjvU2xhhFnSh4v
 QTkPaVVxJhVBHoceFMY3DYdmijMI7ye+mzSU5fhmOSrQajUWNt0A3pRv57NV/CL2/h48
 cALytLbuNq/n7YQUJ41f2bcvx42eVw47Mv178Mp+0DTxPIRUwqeDahiOy8HTMHStrYFy
 MMo8s85BE4skwrUNyaFnEa12e9dGodGQpO8lVaXYS/Bwn1QNF/YIS3xDcq8yhLmMmyJy
 J1eRdU8menhpVljqQVrtRdzQPBmTEU6i2iOfFe5YyyZVH43azcdDyied/XAc2cUlbtGL
 PHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=rICshUhnsv+tmW98ypxjZtlY9wug2ZYttw1mvAjt2mY=;
 b=5/hn+0VylVU7tB7VitltOUWF3p5BorLdW2PU7a2DJPnB6zsurCWtUIQDgJc5adHPmA
 f9ENh3BSqhEimfWefuqgZwZEhJr+gJKnzDXgcn2ooA4dKvvWBPbK9NdvIytEsgw7xdCr
 8p8ux7XL95DdujlyVTzqPUwyu3A6wXTk/arwsMrUUUI4fCcXPtDNaHipzS48gl590KuP
 pvHPI+8vEIV4UH49f4Gct0/J7CvYLRLLPKh2kUaq7Mgop3XgHjfsip6XhBYJ2BwVNZbS
 TV1swK32SOVgsN5pxJgiuR95svyaW7mg8ertKSiIfo2QBg9ZqvZWemg6rQpAaNAc6n0p
 3Dig==
X-Gm-Message-State: AOAM531dNEODHyIXjPZ6JDamQcj27u/Q5VYwY6UOCd8jxjG3wLiwHtqF
 TH9F+6bswxmQb8Jd5NV/wF82XOZ54ZlWbA==
X-Google-Smtp-Source: ABdhPJye+bQlcV0b57G02xA+3J75e0OLS5JIndo8Uu07Ucj5Anws6Z6BHnOidnJPm5flz28yvNs31A==
X-Received: by 2002:a17:906:b201:b0:6b5:58c8:e43c with SMTP id
 p1-20020a170906b20100b006b558c8e43cmr771478ejz.441.1645642281782; 
 Wed, 23 Feb 2022 10:51:21 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id z9sm302231edc.2.2022.02.23.10.51.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 10:51:21 -0800 (PST)
Message-ID: <d72476bc-aab8-d8ef-896e-0100e70ec2e7@mind.be>
Date: Wed, 23 Feb 2022 19:51:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220221172900.1937856-1-fontaine.fabrice@gmail.com>
 <20220221200044.GA2166282@scaer>
 <CAPi7W81diotLJ8DgiPtQgwQ0trhOmSSt806X-=XNjj5=cM8wWA@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CAPi7W81diotLJ8DgiPtQgwQ0trhOmSSt806X-=XNjj5=cM8wWA@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/re2: fix build with gcc <= 5
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyMS8wMi8yMDIyIDIzOjA1LCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOgo+IFlhbm4sCj4g
Cj4gTGUgbHVuLiAyMSBmw6l2ci4gMjAyMiDDoCAyMTowMCwgWWFubiBFLiBNT1JJTiA8eWFubi5t
b3Jpbi4xOTk4QGZyZWUuZnI+IGEgw6ljcml0IDoKPj4KPj4gRmFicmljZSwgQWxsLAo+Pgo+PiBP
biAyMDIyLTAyLTIxIDE4OjI5ICswMTAwLCBGYWJyaWNlIEZvbnRhaW5lIHNwYWtlIHRodXNseToK
Pj4+IEZpeCB0aGUgZm9sbG93aW5nIGJ1aWxkIGZhaWx1cmUgd2l0aCBnY2MgPD0gNSByYWlzZWQg
c2luY2UgYnVtcCB0bwo+Pj4gdmVyc2lvbiAyMDIyLTAyLTAxIGluIGNvbW1pdCBkMmNmOTFlMGM2
YTA4MjI2MWNjN2ViYjA2ZGZkYmQ3YmMyYzI5NTZmCj4+PiBhbmQKPj4+IGh0dHBzOi8vZ2l0aHVi
LmNvbS9nb29nbGUvcmUyL2NvbW1pdC9hMDIyY2MwYzU1YjA1MTk2MjlkNjRkNzc1ZTdhNTE5NWFm
MzRhNDc3Cj4+Pgo+Pj4gLi9yZTIvc3BhcnNlX2FycmF5Lmg6MjY2OjM3OiB3YXJuaW5nOiBkZWZh
dWx0ZWQgYW5kIGRlbGV0ZWQgZnVuY3Rpb25zIG9ubHkgYXZhaWxhYmxlIHdpdGggLXN0ZD1jKysx
MSBvciAtc3RkPWdudSsrMTEKPj4+ICAgU3BhcnNlQXJyYXk8VmFsdWU+OjpTcGFyc2VBcnJheSgp
ID0gZGVmYXVsdDsKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo+
Pj4gLi9yZTIvc3BhcnNlX2FycmF5Lmg6IEluIGNvcHkgY29uc3RydWN0b3IgJ3JlMjo6U3BhcnNl
QXJyYXk8VmFsdWU+OjpTcGFyc2VBcnJheShjb25zdCByZTI6OlNwYXJzZUFycmF5PFZhbHVlPiYp
JzoKPj4+IC4vcmUyL3NwYXJzZV9hcnJheS5oOjI3MzozOiBlcnJvcjogJ2NvcHlfbicgaXMgbm90
IGEgbWVtYmVyIG9mICdzdGQnCj4+PiAgICAgc3RkOjpjb3B5X24oc3JjLnNwYXJzZV8uZGF0YSgp
LCBzcmMubWF4X3NpemUoKSwgc3BhcnNlXy5kYXRhKCkpOwo+Pj4gICAgIF4KPj4+Cj4+PiBGaXhl
czoKPj4+ICAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy84ZWJiYWM2
N2YzMmZlMjQ0MTZhMWY3MmFhZDBhZmQ0MmI1NjdiNDAzCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTog
RmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4+PiAtLS0KPj4+
ICAgcGFja2FnZS9yZTIvcmUyLm1rIHwgMTUgKysrKysrKysrKy0tLS0tCj4+PiAgIDEgZmlsZSBj
aGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL3JlMi9yZTIubWsgYi9wYWNrYWdlL3JlMi9yZTIubWsKPj4+IGluZGV4IDQx
MzkyY2IxNzkuLmNjNWZlZDcxZmEgMTAwNjQ0Cj4+PiAtLS0gYS9wYWNrYWdlL3JlMi9yZTIubWsK
Pj4+ICsrKyBiL3BhY2thZ2UvcmUyL3JlMi5tawo+Pj4gQEAgLTEwLDIwICsxMCwyNSBAQCBSRTJf
TElDRU5TRSA9IEJTRC0zLUNsYXVzZQo+Pj4gICBSRTJfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UK
Pj4+ICAgUkUyX0lOU1RBTExfU1RBR0lORyA9IFlFUwo+Pj4KPj4+ICtSRTJfTUFLRV9PUFRTID0g
XAo+Pj4gKyAgICAgJChUQVJHRVRfQ09ORklHVVJFX09QVFMpIFwKPj4+ICsgICAgIENYWEZMQUdT
PSIkKFRBUkdFVF9DWFhGTEFHUykgLXN0ZD1jKysxMSIgXAo+Pj4gKyAgICAgcHJlZml4PS91c3IK
Pj4KPj4gSXMgdGhlcmUgYSByZWFzb24gdG8gaGF2ZSAncHJlZml4JyBiZSBzZXQgZHVyaW5nIHRo
ZSBidWlsZCwgaW5zdGVhZCBvZgo+PiBqdXN0IHRoZSBpbnN0YWxsIHN0ZXBzPwo+IEkgdGhvdWdo
dCBpdCB3YXMgYmV0dGVyIHRvIGhhdmUgaXQgaW4gYSBzaW5nbGUgcGxhY2UgYnV0IEknbGwgc2Vu
ZCBhIHYyLgoKICBBY3R1YWxseSwgaW4gZ2VuZXJhbCBpdCBpcyBwb3NzaWJsZSB0aGF0IHRoZSBw
cmVmaXggaXMgdXNlZCBkdXJpbmcgdGhlIGJ1aWxkIAp0byBoYXJkY29kZSBzb21lIHBhdGhzLiBO
b3QgaW4gdGhpcyBjYXNlIEkgdGhpbmssIGJ1dCBpdCdzIGdvb2QgcHJhY3RpY2UgdG8ga2VlcCAK
dGhlc2Ugb3B0aW9ucyBpZGVudGljYWwgZHVyaW5nIHRoZSBidWlsZCBhbmQgaW5zdGFsbCBzdGVw
cy4gVGhlIG9ubHkgb25lIHRoYXQgCnNob3VsZCBub3QgYmUgdGhlcmUgaW4gYnVpbGQgaXMgREVT
VERJUi4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4+Cj4+IFJlZ2FyZHMsCj4+IFlhbm4gRS4gTU9S
SU4uCj4+Cj4+PiAgIGRlZmluZSBSRTJfQlVJTERfQ01EUwo+Pj4gLSAgICAgJChUQVJHRVRfTUFL
RV9FTlYpICQoTUFLRSkgJChUQVJHRVRfQ09ORklHVVJFX09QVFMpIFwKPj4+ICsgICAgICQoVEFS
R0VUX01BS0VfRU5WKSAkKE1BS0UpICQoUkUyX01BS0VfT1BUUykgXAo+Pj4gICAgICAgICAgICAg
ICAgLUMgJChARCkgJChpZiAkKEJSMl9TVEFUSUNfTElCUyksc3RhdGljKQo+Pj4gICBlbmRlZgo+
Pj4KPj4+ICAgZGVmaW5lIFJFMl9JTlNUQUxMX1NUQUdJTkdfQ01EUwo+Pj4gLSAgICAgJChUQVJH
RVRfTUFLRV9FTlYpICQoTUFLRSkgJChUQVJHRVRfQ09ORklHVVJFX09QVFMpIFwKPj4+IC0gICAg
ICAgICAgICAgREVTVERJUj0iJChTVEFHSU5HX0RJUikiIHByZWZpeD0vdXNyIC1DICQoQEQpIFwK
Pj4+ICsgICAgICQoVEFSR0VUX01BS0VfRU5WKSAkKE1BS0UpICQoUkUyX01BS0VfT1BUUykgXAo+
Pj4gKyAgICAgICAgICAgICBERVNURElSPSIkKFNUQUdJTkdfRElSKSIgLUMgJChARCkgXAo+Pj4g
ICAgICAgICAgICAgICAgJChpZiAkKEJSMl9TVEFUSUNfTElCUyksc3RhdGljLWluc3RhbGwsaW5z
dGFsbCkKPj4+ICAgZW5kZWYKPj4+Cj4+PiAgIGRlZmluZSBSRTJfSU5TVEFMTF9UQVJHRVRfQ01E
Uwo+Pj4gLSAgICAgJChUQVJHRVRfTUFLRV9FTlYpICQoTUFLRSkgJChUQVJHRVRfQ09ORklHVVJF
X09QVFMpIFwKPj4+IC0gICAgICAgICAgICAgREVTVERJUj0iJChUQVJHRVRfRElSKSIgcHJlZml4
PS91c3IgLUMgJChARCkgXAo+Pj4gKyAgICAgJChUQVJHRVRfTUFLRV9FTlYpICQoTUFLRSkgJChS
RTJfTUFLRV9PUFRTKSBcCj4+PiArICAgICAgICAgICAgIERFU1RESVI9IiQoVEFSR0VUX0RJUiki
IC1DICQoQEQpIFwKPj4+ICAgICAgICAgICAgICAgICQoaWYgJChCUjJfU1RBVElDX0xJQlMpLHN0
YXRpYy1pbnN0YWxsLGluc3RhbGwpCj4+PiAgIGVuZGVmCj4+Pgo+Pj4gLS0KPj4+IDIuMzQuMQo+
Pj4KPj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+
PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+Pj4g
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4+
Cj4+IC0tCj4+IC4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0t
LS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCj4+IHwgIFlhbm4gRS4gTU9SSU4gIHwg
UmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5
OiB8Cj4+IHwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBB
SUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8Cj4+IHwgKzMzIDU2MSAwOTkgNDI3IGAtLS0t
LS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8
Cj4+IHwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJ
TCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cj4+ICctLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCj4g
QmVzdCBSZWdhcmRzLAo+IAo+IEZhYnJpY2UKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
