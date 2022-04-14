Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585F7C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 20:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08AF0418EF;
	Thu, 14 Apr 2022 20:02:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TSLAJOk8CSx3; Thu, 14 Apr 2022 20:02:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3818418EB;
	Thu, 14 Apr 2022 20:02:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 19EF11BF290
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07A5340142
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:02:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BQ2hu8RZFg80 for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 20:02:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0AF264013E
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 20:02:18 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id u18so7722304eda.3
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 13:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=loiLgF9ryy/IkZyyv1ADa/3Y4yozcRlAtIdnTls0v2s=;
 b=XmzP/H0QpzKMRSmOelQ6P2GZY5VH/jJrZ6dck4c6WvCIN4ZGTrN3nvOlsG1KYqlEsq
 DocFQkGfUU+68QVmNsPziwduozPPDtVZMnRVWM6I7NegoUs9J//80R8BjiodS+AnaFmL
 XgS2q/n5wzfClonolJlpFqeAG1yZx3qy2nRB/HFqqn+tyRFoNg8Y7EeZnje6z4NUSlEN
 01KZ1IFRXiSulQLbJqdiNURKVnvQcbKxYdSekEaYdbZlaktGsQyERX61ZOao4j78iFdE
 i2oDr91uv82KkxLJQ7Dz3+AwI6JMmHcZ7XTemzs3Tha6n6GeShqxuBjC5x5dbRuBQlGR
 rybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=loiLgF9ryy/IkZyyv1ADa/3Y4yozcRlAtIdnTls0v2s=;
 b=7xpDmn3L8G7LSaksGnKEknIR3fisvktV6BFlEpqcuzEI50cgROwBpVZUbw5E9oyvkt
 YKaGtcjGVcP76yjZbf+/mZDp14aA1sWJarxTwlE+H45/iNDk5zJkE2ZscDRj6HVdQgCF
 m8bq3x59DS1DgKEVP71sm+BxMyU/NVPsCr6pkOevQ9gShacV2vpmLW8f6il2+Nnc1ZFF
 JUkyhl/4C75vMGFeTAZUchoCObHYtH/wJGmAbRSYwqWfLsmzylyMJuF5wCsmULOfyG8Q
 7pBcl0v+LGGUC+HJ7qbB58BVb8BeYYzwJpVou+tB3EjPJCvIbtdPBuH35aVsSYZ1o2tc
 605A==
X-Gm-Message-State: AOAM531Oc/XHJIls7Ucb4SvwhT3SJXcatObJNtt24Iv/AWiDxEYSUk+o
 yp5S19w/1uVwjb/vujVGtneqXg==
X-Google-Smtp-Source: ABdhPJxw0G6GDf3DllBPUshbR3Q7XHgoVHRZ2II73RSWLCGTYuVy0PVOqXMZVB05CAKVRH0Plr7dGg==
X-Received: by 2002:a05:6402:1d4a:b0:419:7c50:dcbf with SMTP id
 dz10-20020a0564021d4a00b004197c50dcbfmr4765682edb.340.1649966537332; 
 Thu, 14 Apr 2022 13:02:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a170906284b00b006e108693850sm941980ejc.28.2022.04.14.13.02.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 13:02:16 -0700 (PDT)
Message-ID: <2162fa68-22c3-444b-4690-7a6aacd899e9@mind.be>
Date: Thu, 14 Apr 2022 22:02:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220407163947.1024467-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220407163947.1024467-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: doesn't build with
 libressl
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNy8wNC8yMDIyIDE4OjM5LCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOgo+IHN5c3RlbWQg
ZG9lc24ndCBwbGFuIHRvIGZpeCB0aGUgZm9sbG93aW5nIGJ1aWxkIGZhaWx1cmUgd2l0aCBsaWJy
ZXNzbAo+IChodHRwczovL2dpdGh1Yi5jb20vc3lzdGVtZC9zeXN0ZW1kL2lzc3Vlcy8xNDkyOCkg
YW5kIEVEMjU1MTkgc3VwcG9ydAo+IGlzIHN0aWxsIG5vdCBhdmFpbGFibGUgaW4gbGlicmVzc2wK
PiAoaHR0cHM6Ly9naXRodWIuY29tL2xpYnJlc3NsLXBvcnRhYmxlL3BvcnRhYmxlL2lzc3Vlcy8z
OTMgb3BlbmVkIGZvcgo+IG1vcmUgdGhhbiAzIHllYXJzKToKPiAKPiAuLi9zcmMvaG9tZS9ob21l
ZC1tYW5hZ2VyLmM6IEluIGZ1bmN0aW9uIOKAmG1hbmFnZXJfZ2VuZXJhdGVfa2V5X3BhaXLigJk6
Cj4gLi4vc3JjL2hvbWUvaG9tZWQtbWFuYWdlci5jOjEzOTM6MzU6IGVycm9yOiDigJhFVlBfUEtF
WV9FRDI1NTE54oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlk
IHlvdSBtZWFuIOKAmEVWUF9QS0VZX0RTQTHigJk/Cj4gICAxMzkzIHwgICAgICAgICBjdHggPSBF
VlBfUEtFWV9DVFhfbmV3X2lkKEVWUF9QS0VZX0VEMjU1MTksIE5VTEwpOwo+ICAgICAgICB8ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+Cj4gICAgICAg
IHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEVWUF9QS0VZX0RTQTEKPiAKPiBG
aXhlczoKPiAgIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvNDdmMzFi
MzZmMTIzYzRiZTQ2NjFmNGZkZTJkMWY3Mzg1YzVkMGVkNQo+IAo+IFNpZ25lZC1vZmYtYnk6IEZh
YnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgoKICBBcHBsaWVkIHRv
IG1hc3RlciwgdGhhbmtzLgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAtLS0KPiAgIHBhY2thZ2Uv
c3lzdGVtZC9Db25maWcuaW4gIHwgMiArKwo+ICAgcGFja2FnZS9zeXN0ZW1kL3N5c3RlbWQubWsg
fCAyICstCj4gICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3N5c3RlbWQvQ29uZmlnLmluIGIvcGFja2FnZS9z
eXN0ZW1kL0NvbmZpZy5pbgo+IGluZGV4IGNjMDczNjU2MWUuLjAwYzgxNzE3MmQgMTAwNjQ0Cj4g
LS0tIGEvcGFja2FnZS9zeXN0ZW1kL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2Uvc3lzdGVtZC9D
b25maWcuaW4KPiBAQCAtMjM0LDYgKzIzNCw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9TWVNURU1E
X0hPTUVECj4gICAJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hFQURFUlNfQVRfTEVBU1RfNF8x
MiAjIGZzY3J5cHRfa2V5Cj4gICAJc2VsZWN0IEJSMl9QQUNLQUdFX0NSWVBUU0VUVVAKPiAgIAlz
ZWxlY3QgQlIyX1BBQ0tBR0VfT1BFTlNTTAo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX09QRU5TU0xf
Rk9SQ0VfTElCT1BFTlNTTAo+ICAgCXNlbGVjdCBCUjJfUEFDS0FHRV9VVElMX0xJTlVYX0xJQkZE
SVNLCj4gICAJaGVscAo+ICAgCSAgc3lzdGVtZC1ob21lZCBpcyBhIHN5c3RlbSBzZXJ2aWNlIHRo
YXQgbWF5IGJlIHVzZWQgdG8gY3JlYXRlLAo+IEBAIC00MTIsNiArNDEzLDcgQEAgY29uZmlnIEJS
Ml9QQUNLQUdFX1NZU1RFTURfUkFORE9NU0VFRAo+ICAgY29uZmlnIEJSMl9QQUNLQUdFX1NZU1RF
TURfUkVQQVJUCj4gICAJYm9vbCAiZW5hYmxlIHJlcGFydCBzdXBwb3J0Igo+ICAgCXNlbGVjdCBC
UjJfUEFDS0FHRV9PUEVOU1NMCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfT1BFTlNTTF9GT1JDRV9M
SUJPUEVOU1NMCj4gICAJc2VsZWN0IEJSMl9QQUNLQUdFX1VUSUxfTElOVVhfTElCRkRJU0sKPiAg
IAloZWxwCj4gICAJICBzeXN0ZW1kLXJlcGFydCBncm93cyBhbmQgYWRkcyBwYXJ0aXRpb25zIHRv
IGEgcGFydGl0aW9uIHRhYmxlLAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3N5c3RlbWQvc3lzdGVt
ZC5tayBiL3BhY2thZ2Uvc3lzdGVtZC9zeXN0ZW1kLm1rCj4gaW5kZXggOWZlZWQ5YzA4NC4uNThh
MTM3NmI1MSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3N5c3RlbWQvc3lzdGVtZC5tawo+ICsrKyBi
L3BhY2thZ2Uvc3lzdGVtZC9zeXN0ZW1kLm1rCj4gQEAgLTQ5OCw3ICs0OTgsNyBAQCBlbHNlCj4g
ICBTWVNURU1EX0NPTkZfT1BUUyArPSAtRG5zcy1yZXNvbHZlPWZhbHNlIC1EcmVzb2x2ZT1mYWxz
ZQo+ICAgZW5kaWYKPiAgIAo+IC1pZmVxICgkKEJSMl9QQUNLQUdFX09QRU5TU0wpLHkpCj4gK2lm
ZXEgKCQoQlIyX1BBQ0tBR0VfTElCT1BFTlNTTCkseSkKPiAgIFNZU1RFTURfQ09ORl9PUFRTICs9
IFwKPiAgIAktRGdudXRscz1mYWxzZSBcCj4gICAJLURvcGVuc3NsPXRydWUgXApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
