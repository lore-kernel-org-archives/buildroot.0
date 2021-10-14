Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E352FC433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 16:53:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E5196101D
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 16:53:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4E5196101D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A93E835B1;
	Thu, 14 Oct 2021 16:53:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9LXnC1bQswfy; Thu, 14 Oct 2021 16:53:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64619835A7;
	Thu, 14 Oct 2021 16:53:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF4F61BF575
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 16:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AEE47405BF
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 16:53:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OKYVUSMkZvBv for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 16:53:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B8A1B405BA
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 16:53:10 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id n8so29566810lfk.6
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 09:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PSv3VmwoCgzFtMFssAwkaMiWX9Hq8Hfk1+pn+4D1RVI=;
 b=PGPaa1xM+OgkZlh9eCu43poo3awrdjn3M1nF1FgoDuoF2bt19kQmlMEe0UytmZ6NKm
 DVFIapzlAAFnzPjlzBPXkcqmpzzeNgyh/0zIQoJuWtxUO7VwNrxoHgK54d0saRC9YSBF
 Z7gAqgXUXHW+H/Ob7EfHI0FuTxvKC7zeUK0IkVGfNcT9weC3BKahuED3/vpvOAqtXJhD
 q3wUpBJTYwexW9rEKkjoybtYysy0dTF4fQoxzAXU6xHcCotfSoNuiTyAxWca8L7nVjPR
 jbcb2uRXMrqBfA/6luFPYsE0SgppFyMWh2J60Qv4tgut4ZV7m5zmWEUNZ5Gm/xmDIAcV
 Eoag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PSv3VmwoCgzFtMFssAwkaMiWX9Hq8Hfk1+pn+4D1RVI=;
 b=3R6Um4ALKoWaERK6UiW/G4DqbJljwXFYedzufenFNAYiagOXJzqDBBqnhKTb2Awy3M
 izIxW0R9irwiAUd0yXleu+4a7i44dicp0DkwhYBA/+11gpUWvZDp2QuiASMiUWFyP0Eu
 dUsp/ez2xnBSdtb1cA/u7RbKN9eq8bSTubqBqbNtYgpmtrnxx54pKe4wMNbPSSfq6Jkx
 5HrwrbR7srfWIGGt6Hutm2SdC9xb627O1D5QnpC6Awm2Ekg/2Jm8rMgh5CLCL0CkEK7m
 HLfShq34AeVcCQJlHfWd6KiWyVmQaf7bDJx+zX00MxVVeqDtN3vnoGSrI+HEThhMdGhu
 2WDg==
X-Gm-Message-State: AOAM530enHnhD95/YNZtpzcKbrHm3VPEeVA5m/oT/oCCcIABWofw+m7B
 gSu7pugYm053FItwHKWoPi5lnfI9IEypa1VWgMuQkRAOFak=
X-Google-Smtp-Source: ABdhPJz/gQjYWM+X8wZW9ZdpelwRPZlTH6XmMZ0hJoENg4YsrMClbTCJcTucDASgGbCi5devBl5uDRk82bWquWjvzWY=
X-Received: by 2002:a2e:a170:: with SMTP id u16mr7221870ljl.108.1634230388528; 
 Thu, 14 Oct 2021 09:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <20211014160824.2154396-1-fontaine.fabrice@gmail.com>
 <20211014184100.615d5d90@bootlin.com>
In-Reply-To: <20211014184100.615d5d90@bootlin.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 14 Oct 2021 18:51:55 +0200
Message-ID: <CAPi7W81+X=pB2npGSxx6QnAtaUvCT6-mC1ff2P9DsNpW-CROqQ@mail.gmail.com>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libdbi: needs dynamic library
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpMZSBqZXUuIDE0IG9jdC4gMjAyMSDDoCAxODo0MSwgSGVydmUgQ29kaW5hIDxoZXJ2ZS5j
b2RpbmFAYm9vdGxpbi5jb20+IGEgw6ljcml0IDoKPgo+IEhpLAo+Cj4gT24gVGh1LCAxNCBPY3Qg
MjAyMSAxODowODoyNCArMDIwMAo+IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VA
Z21haWwuY29tPiB3cm90ZToKPgo+ID4gbGliZGJpIG5lZWRzIGR5bmFtaWMgbGlicmFyeSB0byBh
dm9pZCB0aGUgZm9sbG93aW5nIGJ1aWxkIGZhaWx1cmUgcmFpc2VkCj4gPiBzaW5jZSB0aGUgYWRk
aXRpb24gb2YgdGhlIHBhY2thZ2UgaW4gY29tbWl0Cj4gPiBjNmFhYzZlYmRiYmQzODczMTEwYTll
MTlkZTE5NTdlNDljYjkzNDRlOgo+ID4KPiA+IGRiaV9tYWluLmM6ODQ6MjogZXJyb3I6ICNlcnJv
ciBubyBkeW5hbWljIGxvYWRpbmcgc3VwcG9ydAo+ID4gICAgODQgfCAjZXJyb3Igbm8gZHluYW1p
YyBsb2FkaW5nIHN1cHBvcnQKPiA+ICAgICAgIHwgIF5+fn5+Cj4gPgo+ID4gRml4ZXM6Cj4gPiAg
LSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy85Y2Q1NmE2MjVjYmQ1MmIw
YzA3MGUyZDQ2MmUwMmY1MTYxZDk2MzFkCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBG
b250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBwYWNrYWdl
L2xpYmRiaS1kcml2ZXJzL0NvbmZpZy5pbiB8IDQgKysrKwo+ID4gIHBhY2thZ2UvbGliZGJpL0Nv
bmZpZy5pbiAgICAgICAgIHwgNCArKysrCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlv
bnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJkYmktZHJpdmVycy9Db25maWcu
aW4gYi9wYWNrYWdlL2xpYmRiaS1kcml2ZXJzL0NvbmZpZy5pbgo+ID4gaW5kZXggMDg3ZTZhYWYw
ZS4uN2M1MDUzNDBjMSAxMDA2NDQKPiA+IC0tLSBhL3BhY2thZ2UvbGliZGJpLWRyaXZlcnMvQ29u
ZmlnLmluCj4gPiArKysgYi9wYWNrYWdlL2xpYmRiaS1kcml2ZXJzL0NvbmZpZy5pbgo+ID4gQEAg
LTEsOCArMSwxMiBAQAo+ID4gIGNvbmZpZyBCUjJfUEFDS0FHRV9MSUJEQklfRFJJVkVSUwo+ID4g
ICAgICAgYm9vbCAibGliZGJpLWRyaXZlcnMiCj4gPiArICAgICBkZXBlbmRzIG9uICFCUjJfU1RB
VElDX0xJQlMgIyBsaWJkYmkKPiA+ICAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9MSUJEQkkKPiA+
ICAgICAgIGhlbHAKPiA+ICAgICAgICAgVGhlIGxpYmRiaS1kcml2ZXJzIHByb2plY3QgcHJvdmlk
ZXMgdGhlCj4gPiAgICAgICAgIGRhdGFiYXNlLXNwZWNpZmljIGRyaXZlcnMgZm9yIHRoZSBsaWJk
YmkgZnJhbWV3b3JrLgo+ID4KPiA+ICAgICAgICAgaHR0cDovL2xpYmRiaS1kcml2ZXJzLnNvdXJj
ZWZvcmdlLm5ldAo+ID4gKwo+ID4gK2NvbW1lbnQgImxpYmRiaS1kcml2ZXJzIG5lZWRzIGEgdG9v
bGNoYWluIHcvIGR5bmFtaWMgbGlicmFyeSIKPiA+ICsgICAgIGRlcGVuZHMgb24gQlIyX1NUQVRJ
Q19MSUJTCj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJkYmkvQ29uZmlnLmluIGIvcGFja2Fn
ZS9saWJkYmkvQ29uZmlnLmluCj4gPiBpbmRleCBkZWQyYmM2ZTUzLi4xM2FjMzQ0ZjgyIDEwMDY0
NAo+ID4gLS0tIGEvcGFja2FnZS9saWJkYmkvQ29uZmlnLmluCj4gPiArKysgYi9wYWNrYWdlL2xp
YmRiaS9Db25maWcuaW4KPiA+IEBAIC0xLDcgKzEsMTEgQEAKPiA+ICBjb25maWcgQlIyX1BBQ0tB
R0VfTElCREJJCj4gPiAgICAgICBib29sICJsaWRiaSIKPiA+ICsgICAgIGRlcGVuZHMgb24gIUJS
Ml9TVEFUSUNfTElCUwo+ID4gICAgICAgaGVscAo+ID4gICAgICAgICBsaWJkYmkgaW1wbGVtZW50
cyBhIGRhdGFiYXNlLWluZGVwZW5kZW50IGFic3RyYWN0aW9uIGxheWVyCj4gPiAgICAgICAgIGlu
IEMsIHNpbWlsYXIgdG8gdGhlIERCSS9EQkQgbGF5ZXIgaW4gUGVybC4KPiA+Cj4gPiAgICAgICAg
IGh0dHA6Ly9saWJkYmkuc291cmNlZm9yZ2UubmV0Cj4gPiArCj4gPiArY29tbWVudCAibGliZGJp
IG5lZWRzIGEgdG9vbGNoYWluIHcvIGR5bmFtaWMgbGlicmFyeSIKPiA+ICsgICAgIGRlcGVuZHMg
b24gQlIyX1NUQVRJQ19MSUJTCj4KPgo+IEluZGVlZCwKPgo+IEFsc28gaW4gY29sbGVjdGQgQ29u
ZmlnLmluLCAiZGVwZW5kcyBvbiIgbmVlZHMgdG8gYmUgYWRkZWQKPiBhbmQgaXRzIHJlbGF0ZWQg
Y29tbWVudC4KTm9wZSwgY29sbGVjdGQgYWxyZWFkeSBkZXBlbmRzIG9uIGR5bmFtaWMgbGlicmFy
eSBzaW5jZSBjb21taXQKOTk2MGI5NTdhNjNlOGZkZDE5N2Q5Y2VmNmVhNTViMWIwNWM0MGVjMyBz
byBpdCdzIG5vdCBuZWVkZWQgdG8gYWRkCnRoaXMgZGVwZW5kZW5jeSBhIHNlY29uZCB0aW1lLgpJ
J2xsIHNlbmQgYSBwYXRjaCB0byBkcm9wIGl0IGZyb20gQlIyX1BBQ0tBR0VfQ09MTEVDVERfTk9U
SUZZX0VNQUlMLgo+Cj4gLS0tLSA4PCAtLS0tCj4gY29uZmlnIEJSMl9QQUNLQUdFX0NPTExFQ1RE
X0RCSQo+ICAgICAgICAgYm9vbCAiZGJpIgo+ICAgICAgICAgZGVwZW5kcyBvbiAhQlIyX1NUQVRJ
Q19MSUJTICMgbGliZGJpCj4gICAgICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfTElCREJJCj4gICAg
ICAgICBoZWxwCj4gICAgICAgICAgIEV4ZWN1dGVzIFNRTCBzdGF0ZW1lbnRzIG9uIHZhcmlvdXMg
ZGF0YWJhc2VzIGFuZAo+ICAgICAgICAgICBpbnRlcnByZXRzIHRoZSByZXR1cm5lZCBkYXRhLgo+
Cj4gY29tbWVudCAiZGJpIG5lZWRzIGEgdG9vbGNoYWluIHcvIGR5bmFtaWMgbGlicmFyeSIKPiAg
ICAgICAgIGRlcGVuZHMgb24gQlIyX1NUQVRJQ19MSUJTCj4gLS0tLSA4PCAtLS0tCj4KPiBIZXJ2
w6kKPgo+IC0tCj4gSGVydsOpIENvZGluYSwgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBL
ZXJuZWwgZW5naW5lZXJpbmcKPiBodHRwczovL2Jvb3RsaW4uY29tCkJlc3QgUmVnYXJkcywKCkZh
YnJpY2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
