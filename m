Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDDEC76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 08:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2199960E74;
	Mon, 10 Apr 2023 08:43:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2199960E74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MI9-7CrHyXTb; Mon, 10 Apr 2023 08:43:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41CB360B43;
	Mon, 10 Apr 2023 08:43:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41CB360B43
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7CC221C3B02
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 08:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 564E240195
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 08:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 564E240195
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9hn3vGRAIR08 for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 08:43:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DAB340017
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4DAB340017
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 08:43:26 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 g74-20020a9d12d0000000b006a131458abfso478528otg.2
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 01:43:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681116205; x=1683708205;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MSSvA4LzAe4xXjan9F0PiiT8WfMuAQo3hiXiq1lE70w=;
 b=tg6F4gEKB8djKmTG7cbcluEJuIgubhwJD3zam4WcfWKglQ+HhFTHJe/s9WJAzkD6rs
 SzOghjlAysLCGyh+ZqheU2m2XrYCgciHlL5NT2fLT04dPlFHEiw4wiZdIbFX/zCBkv2Q
 cejJZgLZYrE1La5J5IFFxt0s0mXnYq2h7jfKIW7HquHDHth73vy4Kdo17He0a6c3LT8h
 K9DdV38pe2Dj5c2yvlinXj6QG/jbtI104fq8sIODycjZQ0HN53yf6Z1EmVzHL2E4HXhn
 yx3LpneSfW8u4c3Yr0BsCFAMAuS7GMj7pM2sGWCxdvgy44HxeFZByMifND4L4vCA35oh
 cFwQ==
X-Gm-Message-State: AAQBX9fw+rLI8vbR59EAKtcOwNhWNyiiMs/wu+uY7rEkfLk8P5sBjb3l
 uPMxYW/IlRKOu2gYj+lZ0YQTyu7fP5eFLsaKnJLMjG/jC7MaCw==
X-Google-Smtp-Source: AKy350ZfxQ7NwWurrgjsd082QwCToGJ0jctxorbDho5l2zgi9uZebAnHwgMnvmd/n8fzv8PhKcbsHVDbABD1+XwLQXU=
X-Received: by 2002:a9d:4b01:0:b0:694:7e05:e240 with SMTP id
 q1-20020a9d4b01000000b006947e05e240mr2764805otf.1.1681116205279; Mon, 10 Apr
 2023 01:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220724214743.2324998-1-james.hilliard1@gmail.com>
 <14cb1bdd-82c2-d114-48df-e03f014d044d@mind.be>
In-Reply-To: <14cb1bdd-82c2-d114-48df-e03f014d044d@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 10 Apr 2023 02:43:14 -0600
Message-ID: <CADvTj4rZmLddVDLpmLNxc7zVjimJSFRn_QkM7UDVcw=WbShk+Q@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681116205; x=1683708205;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MSSvA4LzAe4xXjan9F0PiiT8WfMuAQo3hiXiq1lE70w=;
 b=jwv2dgrYED39JW4ONOkGwJVcM4F0NnVqwEhmhSih5OD/lzq6e6eVzaIvJ9Dv0+5/kT
 VIDXmoFY824wfsNLQHu+seBe7n1yMo8y9GaO3gBoem13Cuz2g+ixMnNCr/NnK/rBrmB9
 xHiObGy59ITtvnroto6/rPR1EdWRfRUr90zA7t0PqZdaW98+MLcgQ0IndTJF0Baa/9kV
 dqQlwSQtITqagt48iW8uEw+DuZEDZ1m6o51NNgBoK/tmn0j21S7tQ5xkR/Lbf6nYzAyK
 Bz+wZrQJm93J+AWt2k2H7/BOj6k1EY49uvK7HMAA5+aE2UmwpynBLDmm2+ESDN1n+hJA
 3flA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jwv2dgrY
Subject: Re: [Buildroot] [PATCH v2 1/1] package/pkg-cargo: ensure
 host/target rustflags are properly split
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCBBcHIgOSwgMjAyMyBhdCAxOjM44oCvUE0gQXJub3V0IFZhbmRlY2FwcGVsbGUgPGFy
bm91dEBtaW5kLmJlPiB3cm90ZToKPgo+Cj4KPiBPbiAyNC8wNy8yMDIyIDIzOjQ3LCBKYW1lcyBI
aWxsaWFyZCB3cm90ZToKPiA+IFNldCBIT1NUX0xERkxBR1MgUlVTVEZMQUdTIHZpYSB0aGUgaG9z
dC1jb25maWcgZmVhdHVyZSwgc2VlOgo+ID4gaHR0cHM6Ly9kb2MucnVzdC1sYW5nLm9yZy9uaWdo
dGx5L2NhcmdvL3JlZmVyZW5jZS91bnN0YWJsZS5odG1sI2hvc3QtY29uZmlnCj4KPiAgIEl0J3Mg
bm90IGNsZWFyIHRvIG1lICp3aHkqIHRoaXMgc2hvdWxkIGJlIGNoYW5nZWQuIFdoYXQgaXNzdWUg
aXMgZml4ZWQgYnkgaXQ/CgpUaGVyZSdzIHBvdGVudGlhbGx5IGFuIGlzc3VlIHdoZXJlIHRhcmdl
dCBydXN0ZmxhZ3MgZ2V0IHBhc3NlZCB0byB0aGUKaG9zdCBidWlsZCBzY3JpcHQgYXJ0aWZhY3Qg
YnVpbGQgSSB0aGluay4KCj4KPiA+IFdlIGhhdmUgdG8gZW5hYmxlIHRoaXMgbmlnaHRseSBmZWF0
dXJlIGZpcnN0IHVzaW5nOgo+ID4gQ0FSR09fVU5TVEFCTEVfSE9TVF9DT05GSUc9InRydWUiCj4g
Pgo+ID4gU2VwYXJhdGVseSBzZXQgdGFyZ2V0IFJVU1RGTEFHUyBmb3IgdGhlIHRhcmdldCB0cmlw
bGUgc3BlY2lmaWMgZW52Cj4gPiB2YXJpYWJsZS4KPgo+ICAgVGhpcyBwYXJ0IGlzIGFsc28gbm90
IGVudGlyZWx5IGNsZWFyIHRvIG1lLiBJc24ndCB0aGF0IHRoZSBzYW1lIHRoaW5nIHdoZW4KPiBj
cm9zcy1jb21waWxpbmcgKGxpa2UgaXQncyB0aGUgY2FzZSBpbiBhdXRvdG9vbHMgb3IgbWVzb24p
PyBPciBhcmUgbm9uLXNwZWNpZmljCj4gUlVTVEZMQUdTIGFsc28gYXBwbGllZCB0byBob3N0IGJ1
aWxkcyB3aGVuIGNyb3NzLWNvbXBpbGluZz8KClRoZXJlJ3MgY29uc2lzdGVuY3kgaXNzdWVzIGlu
IGhvdyBydXN0ZmxhZ3MgZ2V0IGFwcGxpZWQgd2l0aCBidWlsZCBzY3JpcHRzLCB0aGlzCmFwcHJv
YWNoIHNob3VsZCBlbnN1cmUgcnVzdGZsYWdzIGFyZSBleHBsaWNpdGx5IHNldCBmb3IgdGhlIGNv
cnJlY3QgaG9zdC90YXJnZXQKYnVpbGQgYXJ0aWZhY3RzLgoKU29tZSBtb3JlIGRldGFpbHM6Cmh0
dHBzOi8vZ2l0aHViLmNvbS9ydXN0LWxhbmcvY2FyZ28vcHVsbC8xMDM5NQoKPgo+ID4gTW92ZSBS
VVNURkxBR1MgZm9yIGhvc3QgYnVpbGRzIHRvIEhPU1RfUEtHX0NBUkdPX0VOViBzbyB0aGF0IHRo
ZXkKPiA+IGFyZSBzZXQgZm9yIGhvc3QgY2FyZ28gYnVpbGRzIHdoaWNoIHVzZSBweXRob24gaW5m
cmFzdHJ1Y3R1cmUuCj4KPiAgIFRoaXMgbWFrZXMgc2Vuc2UuIEkgdGhlcmVmb3JlIGFwcGxpZWQg
anVzdCB0aGlzIGJpdCwgdGhlIHJlc3Qgb2YgdGhlIHBhdGNoCj4gc2hvdWxkIGdldCBhIGJpdCBt
b3JlIGNsYXJpZmljYXRpb24uCj4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFy
ZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gQ2hhbmdlcyB2MSAtPiB2
MjoKPiA+ICAgIC0gYWRkIFJVU1RGTEFHUyB0byBIT1NUX1BLR19DQVJHT19FTlYKPiA+IC0tLQo+
ID4gICBwYWNrYWdlL3BrZy1jYXJnby5tayB8IDE1ICsrKysrKysrKystLS0tLQo+ID4gICAxIGZp
bGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS9wa2ctY2FyZ28ubWsgYi9wYWNrYWdlL3BrZy1jYXJnby5tawo+ID4g
aW5kZXggZjdlM2YzOTUwMy4uMWMxMDU3NjJmOCAxMDA2NDQKPiA+IC0tLSBhL3BhY2thZ2UvcGtn
LWNhcmdvLm1rCj4gPiArKysgYi9wYWNrYWdlL3BrZy1jYXJnby5tawo+ID4gQEAgLTMyLDcgKzMy
LDEwIEBAIFBLR19DT01NT05fQ0FSR09fRU5WID0gXAo+ID4gICAjIHVzaW5nIG5pZ2hseSBmZWF0
dXJlcyBvbiBzdGFibGUgcmVsZWFzZXMsIGkuZSBmZWF0dXJlcyB0aGF0IGFyZSBub3QKPiA+ICAg
IyB5ZXQgY29uc2lkZXJlZCBzdGFibGUuCj4gPiAgICMKPiA+IC0jIENBUkdPX1VOU1RBQkxFX1RB
UkdFVF9BUFBMSUVTX1RPX0hPU1Q9InRydWUiICJlbmFibGVzIHRoZSBuaWdodGx5Cj4gPiArIyBD
QVJHT19VTlNUQUJMRV9IT1NUX0NPTkZJRz0idHJ1ZSIgZW5hYmxlcyB0aGUgaG9zdCBzcGVjaWZp
Ywo+ID4gKyMgY29uZmlndXJhdGlvbiBmZWF0dXJlCj4KPiAgIFRoaXMgaXMgYWxzbyBub3QgcmVh
bGx5IGNsZWFyLiBJIHRoaW5rIGl0IGlzIG5lZWRlZCBmb3IgdGhlCj4gQ0FSR09fSE9TVF9SVVNU
RkxBR1MgYW5kIENBUkdPX1RBUkdFVF94eHhfUlVTVEZMQUdTIHZhcmlhYmxlcyB0byB0YWtlIGVm
ZmVjdCwgaXMKPiB0aGF0IGNvcnJlY3Q/CgpOZWVkZWQgdG8gdW5nYXRlIGFueXRoaW5nIHVuZGVy
IENBUkdPX0hPU1RfeHh4IGxpa2UgQ0FSR09fSE9TVF9SVVNURkxBR1MgQUZBSVUuCgo+Cj4gPiAr
Iwo+ID4gKyMgQ0FSR09fVU5TVEFCTEVfVEFSR0VUX0FQUExJRVNfVE9fSE9TVD0idHJ1ZSIgZW5h
YmxlcyB0aGUgbmlnaHRseQo+ID4gICAjIGNvbmZpZ3VyYXRpb24gb3B0aW9uIHRhcmdldC1hcHBs
aWVzLXRvLWhvc3QgdmFsdWUgdG8gYmUgc2V0Cj4gPiAgICMKPiA+ICAgIyBDQVJHT19UQVJHRVRf
QVBQTElFU19UT19IT1NUPSJmYWxzZSIgaXMgYWN0dWFsbHkgc2V0dGluZyB0aGUgdmFsdWUKPiA+
IEBAIC00MSw5ICs0NCwxMSBAQCBQS0dfQ09NTU9OX0NBUkdPX0VOViA9IFwKPiA+ICAgUEtHX0NB
UkdPX0VOViA9IFwKPiA+ICAgICAgICQoUEtHX0NPTU1PTl9DQVJHT19FTlYpIFwKPiA+ICAgICAg
IF9fQ0FSR09fVEVTVF9DSEFOTkVMX09WRVJSSURFX0RPX05PVF9VU0VfVEhJUz0ibmlnaHRseSIg
XAo+ID4gKyAgICAgQ0FSR09fVU5TVEFCTEVfSE9TVF9DT05GSUc9InRydWUiIFwKPiA+ICAgICAg
IENBUkdPX1VOU1RBQkxFX1RBUkdFVF9BUFBMSUVTX1RPX0hPU1Q9InRydWUiIFwKPiA+ICAgICAg
IENBUkdPX1RBUkdFVF9BUFBMSUVTX1RPX0hPU1Q9ImZhbHNlIiBcCj4gPiAgICAgICBDQVJHT19C
VUlMRF9UQVJHRVQ9IiQoUlVTVENfVEFSR0VUX05BTUUpIiBcCj4gPiArICAgICBDQVJHT19IT1NU
X1JVU1RGTEFHUz0iJChhZGRwcmVmaXggLUMgbGluay1hcmdzPSwkKEhPU1RfTERGTEFHUykpIiBc
Cj4gPiAgICAgICBDQVJHT19UQVJHRVRfJChjYWxsIFVQUEVSQ0FTRSwkKFJVU1RDX1RBUkdFVF9O
QU1FKSlfTElOS0VSPSQobm90ZGlyICQoVEFSR0VUX0NST1NTKSlnY2MKPiA+Cj4gPiAgICMKPiA+
IEBAIC01MSwxMSArNTYsMTMgQEAgUEtHX0NBUkdPX0VOViA9IFwKPiA+ICAgIyBhbmQgc2hvdWxk
IGJlIHJlbW92ZWQgd2hlbiBmaXhlZCB1cHN0cmVhbQo+ID4gICAjCj4gPiAgIGlmZXEgKCQoTk9S
TUFMSVpFRF9BUkNIKSxhcm0pCj4gPiAtICAgICBQS0dfQ0FSR09fRU5WICs9IFJVU1RGTEFHUz0i
LUNsaW5rLWFyZz0tV2wsLS1hbGxvdy1tdWx0aXBsZS1kZWZpbml0aW9uIgo+ID4gKyAgICAgUEtH
X0NBUkdPX0VOViArPSBcCj4gPiArICAgICAgICAgICAgIENBUkdPX1RBUkdFVF8kKGNhbGwgVVBQ
RVJDQVNFLCQoUlVTVENfVEFSR0VUX05BTUUpKV9SVVNURkxBR1M9Ii1DbGluay1hcmc9LVdsLC0t
YWxsb3ctbXVsdGlwbGUtZGVmaW5pdGlvbiIKPgo+ICAgS2luZCBvZiB0YW5nZW50aWFsIHRvIHRo
aXMgY2hhbmdlOiB3b3VsZCBpdCBtYWtlIHNlbnNlIHRvIGhhdmUgYSAkKFBLRylfUlVTVEZMQUdT
PwoKSSdtIG5vdCBzdXJlLCBJJ20gbm90IGF3YXJlIG9mIGFueSBzcGVjaWZpYyBpc3N1ZXMgbmVl
ZGluZyBwYWNrYWdlIHNwZWNpZmljCnJ1c3RmbGFncy4KCj4KPgo+ICAgUmVnYXJkcywKPiAgIEFy
bm91dAo+Cj4gPiAgIGVuZGlmCj4gPgo+ID4gICBIT1NUX1BLR19DQVJHT19FTlYgPSBcCj4gPiAt
ICAgICAkKFBLR19DT01NT05fQ0FSR09fRU5WKQo+ID4gKyAgICAgJChQS0dfQ09NTU9OX0NBUkdP
X0VOVikgXAo+ID4gKyAgICAgUlVTVEZMQUdTPSIkKGFkZHByZWZpeCAtQyBsaW5rLWFyZ3M9LCQo
SE9TVF9MREZMQUdTKSkiCj4gPgo+ID4gICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ID4gICAj
IGlubmVyLWNhcmdvLXBhY2thZ2UgLS0gZGVmaW5lcyBob3cgdGhlIGNvbmZpZ3VyYXRpb24sIGNv
bXBpbGF0aW9uIGFuZAo+ID4gQEAgLTEyOCw3ICsxMzUsNiBAQCBlbHNlICMgaWZlcSAoJCg0KSx0
YXJnZXQpCj4gPiAgIGRlZmluZSAkKDIpX0JVSUxEX0NNRFMKPiA+ICAgICAgIGNkICQkKCQkKFBL
RylfU1JDRElSKSAmJiBcCj4gPiAgICAgICAkJChIT1NUX01BS0VfRU5WKSBcCj4gPiAtICAgICAg
ICAgICAgIFJVU1RGTEFHUz0iJCQoYWRkcHJlZml4IC1DIGxpbmstYXJncz0sJCQoSE9TVF9MREZM
QUdTKSkiIFwKPiA+ICAgICAgICAgICAgICAgJCQoSE9TVF9DT05GSUdVUkVfT1BUUykgXAo+ID4g
ICAgICAgICAgICAgICAkJChIT1NUX1BLR19DQVJHT19FTlYpIFwKPiA+ICAgICAgICAgICAgICAg
JCQoJCgyKV9DQVJHT19FTlYpIFwKPiA+IEBAIC0xNjksNyArMTc1LDYgQEAgaWZuZGVmICQoMilf
SU5TVEFMTF9DTURTCj4gPiAgIGRlZmluZSAkKDIpX0lOU1RBTExfQ01EUwo+ID4gICAgICAgY2Qg
JCQoJCQoUEtHKV9TUkNESVIpICYmIFwKPiA+ICAgICAgICQkKEhPU1RfTUFLRV9FTlYpIFwKPiA+
IC0gICAgICAgICAgICAgUlVTVEZMQUdTPSIkJChhZGRwcmVmaXggLUMgbGluay1hcmdzPSwkJChI
T1NUX0xERkxBR1MpKSIgXAo+ID4gICAgICAgICAgICAgICAkJChIT1NUX0NPTkZJR1VSRV9PUFRT
KSBcCj4gPiAgICAgICAgICAgICAgICQkKEhPU1RfUEtHX0NBUkdPX0VOVikgXAo+ID4gICAgICAg
ICAgICAgICAkJCgkKDIpX0NBUkdPX0VOVikgXApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
