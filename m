Return-Path: <SRS0=vKZi=NQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F7BFC432BE
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 19:43:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAA50610A7
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 19:43:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DAA50610A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A973F8246D;
	Wed, 25 Aug 2021 19:43:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0e__QwihAI80; Wed, 25 Aug 2021 19:43:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 271F082477;
	Wed, 25 Aug 2021 19:43:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 24B851BF588
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 19:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D96C407E9
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 19:43:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ME86ZhJFGIeW for <buildroot@lists.busybox.net>;
 Wed, 25 Aug 2021 19:43:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E910F407DC
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 19:43:24 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id p15so642274ljn.3
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 12:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Zl8U9TFpi/6OEwJzfpVfUr/BcKuIvWnfnk//Hj/wqig=;
 b=dnl3gWS3cFAyz0p4phUmcp6EEioKLE5LJqEVwlo2e0NH+UlrwvG9HOUXHJKPoFwXsK
 hcHPkFqzjACwEVEVHz+sBu9v2ylmMvyaUqWa1osz7Gh48Gr2vhXzjYTGXZ37GLIh+Ys2
 rq+H47AUfxQjryIjbRRds9TYyByAJ+m2jC0uRwc+f/xzqMIqNqOahTo8GeziNNzBgra+
 +EmFgZKvj2nLugqIeVB4h0sX9gk5ShIExfjMQNdW8TPY7esqfIMiIA+5ITYbuR91y+C5
 iq/GODI/mQ2aABtIOhCPdKuuFTj+KLZl4WZbzUX2n/L3t0TqGvILsTXckTNq6bqM68EN
 gF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Zl8U9TFpi/6OEwJzfpVfUr/BcKuIvWnfnk//Hj/wqig=;
 b=ithBTMxKCWmw5o7D8jHYvxgUns0zkm8drPO+o6O2xBKTbPkp4sbQIacVON6pzkntKD
 kM2Z9wmMRy83jCxlT61TPH+ACb7g/BidTYaxtYoRqIUITyVigOXU1VOzUUAOqm4n2Zrx
 GHHWtQNWY4Nye5Xc76AzoZx7kdD5Xswcm1kiQQYL4ka+oaa5GCPf6M1OoAdi18AdMMC6
 NH8SHE4/7nUrZE7gDCoCTEGIcLwdfZCxs4Aft0eYhxR+gA5EdRSqnsRHsBxorax6WGnN
 eD+TxVCBfV0clNYxm0fGWq9IW/xHqPF0pBPSCCo06Fss3UTf5VNxqMZ79nuun6kb3lmC
 D6Rg==
X-Gm-Message-State: AOAM5328iJ9l5mSWuCmY2Dt2VJJyQSfk7WoVRFDSmwYYwmyls3GAOv+B
 SWLYp7ZaejLLKTscANVBTx0mz0StnzXbWmWnJwU=
X-Google-Smtp-Source: ABdhPJwsgPk97SHQsYNbCSMCtoaBgoKlgZGG8CguxF1SwlPt5RUMO4QriVYegL+j6HLQMJdvGKsGVaSQcECIvO+gt2M=
X-Received: by 2002:a05:651c:10ba:: with SMTP id
 k26mr9071854ljn.319.1629920602718; 
 Wed, 25 Aug 2021 12:43:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210822085740.1770451-1-fontaine.fabrice@gmail.com>
 <d726dd48-a452-e75b-b7f8-6fe4ec6eab26@mind.be>
In-Reply-To: <d726dd48-a452-e75b-b7f8-6fe4ec6eab26@mind.be>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 25 Aug 2021 21:43:11 +0200
Message-ID: <CAPi7W806-W1S3e9vBZxGGo8a7JTjWpPFqLrDVn2eCC4pEofbRw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/ushare: fix build without msgfmt
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

TGUgbWVyLiAyNSBhb8O7dCAyMDIxIMOgIDIxOjMzLCBBcm5vdXQgVmFuZGVjYXBwZWxsZSA8YXJu
b3V0QG1pbmQuYmU+IGEgw6ljcml0IDoKPgo+Cj4KPiBPbiAyMi8wOC8yMDIxIDEwOjU3LCBGYWJy
aWNlIEZvbnRhaW5lIHdyb3RlOgo+ID4gRml4IHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZSB3
aXRob3V0IC91c3IvYmluL21zZ2ZtdCByYWlzZWQgc2luY2UgdGhlCj4gPiBhZGRpdGlvbiBvZiB1
c2hhcmUgaW4gY29tbWl0IDc0MDk3ZmQ2NTkxNTQ0OTk2MTJmMjFmYWJlZGE0ZTNlN2M4ZmRiZmM6
Cj4gPgo+ID4gbWFrZVszXTogRW50ZXJpbmcgZGlyZWN0b3J5IGAvaG9tZS9idWlsZHJvb3QvYXV0
b2J1aWxkL3J1bi9pbnN0YW5jZS0zL291dHB1dC0xL2J1aWxkL3VzaGFyZS0yLjEvcG8nCj4gPiAv
dXNyL2Jpbi9tc2dmbXQgLWMgLS1zdGF0aXN0aWNzIC1vIGZyLmdtbyBmci5wbwo+ID4gbWFrZVsz
XTogL3Vzci9iaW4vbXNnZm10OiBDb21tYW5kIG5vdCBmb3VuZAo+ID4KPiA+IFRvIGZpeCB0aGlz
IGJ1aWxkIGZhaWx1cmUsIHNldCBHTVNHRk1UIHRvICQoSE9TVF9ESVIpL2Jpbi9tc2dmbXQgYW5k
Cj4gPiBkb24ndCBidWlsZCBwbyBmaWxlcyBpZiBOTFMgaXMgZGlzYWJsZWQKPiA+Cj4gPiBGaXhl
czoKPiA+ICAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzlmNmI1Yjhm
MzgzODYxMzViYWNkMmQ4ZjZlOTdjMWZlYTc3YmJlNjkKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBG
YWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4g
IC4uLi10LWJ1aWxkLXBvLWZpbGVzLWlmLU5MUy1pcy1kaXNhYmxlZC5wYXRjaCB8IDQ3ICsrKysr
KysrKysrKysrKysrKysKPiA+ICBwYWNrYWdlL3VzaGFyZS91c2hhcmUubWsgICAgICAgICAgICAg
ICAgICAgICAgfCAgNSArLQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNTEgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3VzaGFyZS8wMDAx
LURvbi10LWJ1aWxkLXBvLWZpbGVzLWlmLU5MUy1pcy1kaXNhYmxlZC5wYXRjaAo+ID4KPiA+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL3VzaGFyZS8wMDAxLURvbi10LWJ1aWxkLXBvLWZpbGVzLWlmLU5M
Uy1pcy1kaXNhYmxlZC5wYXRjaCBiL3BhY2thZ2UvdXNoYXJlLzAwMDEtRG9uLXQtYnVpbGQtcG8t
ZmlsZXMtaWYtTkxTLWlzLWRpc2FibGVkLnBhdGNoCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
ID4gaW5kZXggMDAwMDAwMDAwMC4uZjBmYTg5OTk4Zgo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysr
IGIvcGFja2FnZS91c2hhcmUvMDAwMS1Eb24tdC1idWlsZC1wby1maWxlcy1pZi1OTFMtaXMtZGlz
YWJsZWQucGF0Y2gKPiA+IEBAIC0wLDAgKzEsNDcgQEAKPiA+ICtGcm9tIDk3NzE3MTc4MWY1ZDQ5
ZTYxYjQ2YzAyNDFmYjY3Y2JiN2Q2NjY0OTggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gPiAr
RnJvbTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gPiAr
RGF0ZTogU3VuLCAyMiBBdWcgMjAyMSAxMDo0NDo0OCArMDIwMAo+ID4gK1N1YmplY3Q6IFtQQVRD
SF0gRG9uJ3QgYnVpbGQgcG8gZmlsZXMgaWYgTkxTIGlzIGRpc2FibGVkCj4gPiArCj4gPiArU2ln
bmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+
Cj4gPiArW1Vwc3RyZWFtIHN0YXR1czogaHR0cHM6Ly9naXRodWIuY29tL2RkdWdvdmljL3VTaGFy
ZS9wdWxsLzEyXQo+ID4gKy0tLQo+ID4gKyBNYWtlZmlsZSAgfCA3ICsrKysrLS0KPiA+ICsgY29u
ZmlndXJlIHwgMSArCj4gPiArIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQo+ID4gKwo+ID4gK2RpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxlCj4g
PiAraW5kZXggZWJkOGY5MS4uNjY4NmNmZCAxMDA2NDQKPiA+ICstLS0gYS9NYWtlZmlsZQo+ID4g
KysrKyBiL01ha2VmaWxlCj4gPiArQEAgLTE0LDEwICsxNCwxMyBAQCBFWFRSQURJU1QgPSBBVVRI
T1JTIFwKPiA+ICsgICAgICAgICBUSEFOS1MgXAo+ID4gKyAgICAgICAgIFRPRE8gXAo+ID4gKwo+
ID4gKy1TVUJESVJTID0gcG8gXAo+ID4gKy0gICAgICBzY3JpcHRzIFwKPiA+ICsrU1VCRElSUyA9
IHNjcmlwdHMgXAo+ID4gKyAgICAgICBzcmMgXAo+ID4gKwo+ID4gKytpZmVxICgkKE5MUykseWVz
KQo+ID4gKytTVUJESVJTICs9IHBvCj4gPiArK2VuZGlmCj4gPiArKwo+ID4gKyBhbGw6Cj4gPiAr
ICAgICBmb3Igc3ViZGlyIGluICQoU1VCRElSUyk7IGRvIFwKPiA+ICsgICAgICAgJChNQUtFKSAt
QyAkJHN1YmRpciAkQDsgXAo+ID4gK2RpZmYgLS1naXQgYS9jb25maWd1cmUgYi9jb25maWd1cmUK
PiA+ICtpbmRleCA0YTNlZmUwLi4xNjJhNzc2IDEwMDc1NQo+ID4gKy0tLSBhL2NvbmZpZ3VyZQo+
ID4gKysrKyBiL2NvbmZpZ3VyZQo+ID4gK0BAIC03MjMsNiArNzIzLDcgQEAgYXBwZW5kX2NvbmZp
ZyAiTERGTEFHUz0kTERGTEFHUyIKPiA+ICsgYXBwZW5kX2NvbmZpZyAiSU5TVEFMTD0kSU5TVEFM
TCIKPiA+ICsKPiA+ICsgYXBwZW5kX2NvbmZpZyAiREVCVUc9JGRlYnVnIgo+ID4gKythcHBlbmRf
Y29uZmlnICJOTFM9JG5scyIKPiA+ICsKPiA+ICsKPiA+ICsgZWNob2xvZyAiQ3JlYXRpbmcgJENP
TkZJR19IIC4uLiIKPiA+ICstLQo+ID4gKzIuMzIuMAo+ID4gKwo+ID4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvdXNoYXJlL3VzaGFyZS5tayBiL3BhY2thZ2UvdXNoYXJlL3VzaGFyZS5tawo+ID4gaW5k
ZXggYTRjOTcxMTYwMC4uN2M3MzU5YzM4NSAxMDA2NDQKPiA+IC0tLSBhL3BhY2thZ2UvdXNoYXJl
L3VzaGFyZS5tawo+ID4gKysrIGIvcGFja2FnZS91c2hhcmUvdXNoYXJlLm1rCj4gPiBAQCAtMTgs
OCArMTgsMTEgQEAgVVNIQVJFX0NPTkZfT1BUUyA9IFwKPiA+ICAgICAgIC0tc3lzY29uZmRpcj0v
ZXRjIFwKPiA+ICAgICAgIC0tZGlzYWJsZS1zdHJpcAo+ID4KPiA+ICtVU0hBUkVfTUFLRV9PUFRT
ID0gTERGTEFHUz0iJChUQVJHRVRfTERGTEFHUykgJChVU0hBUkVfTERGTEFHUykiCj4gPiArCj4g
PiAgaWZlcSAoJChCUjJfU1lTVEVNX0VOQUJMRV9OTFMpLCkKPiA+ICBVU0hBUkVfQ09ORl9PUFRT
ICs9IC0tZGlzYWJsZS1ubHMKPiA+ICtVU0hBUkVfTUFLRV9PUFRTICs9IEdNU0dGTVQ9IiQoSE9T
VF9ESVIpL2Jpbi9tc2dmbXQiCj4KPiAgVGhpcyBsb29rcyBmaXNoeS4uLiBJZiBOTFMgaXMgZGlz
YWJsZWQsIHRoZXJlJ3Mgbm8gZGVwZW5kZW5jeSB0aGF0IG1ha2VzIHN1cmUKPiB0aGF0IGdldHRl
eHQgaXMgYnVpbHQgYmVmb3JlIHVzaGFyZSAob3IgYXQgYWxsKS4gQ29udmVyc2VseSwgaWYgZ2V0
dGV4dCBpcwo+IGVuYWJsZWQsIHNob3VsZG4ndCB3ZSBzcGVjaWZ5IEdNU0dGTVQ/Ckl0J3MgYWxy
ZWFkeSBoYW5kbGVkIGJ5IChUQVJHRVRfTkxTX0RFUEVOREVOQ0lFUykgYXQgbGluZSA5IG9mCnVz
aGFyZS5tayBidXQgSSBjYW4gYWx3YXlzIGRlZmluZSBHTVNHRk1UIGlmIHlvdSBwcmVmZXIuCkkn
bGwgYWxzbyBzZXQgLS1lbmFibGUtbmxzIGV2ZW4gaWYgdGhpcyBpcyBub3QgbmVlZGVkIHRvIGZp
eCB0aGUgYnVpbGQKZmFpbHVyZSBhcyBOTFMgaXMgZW5hYmxlZCBieSBkZWZhdWx0Lgo+Cj4gIFJl
Z2FyZHMsCj4gIEFybm91dAo+Cj4gPiAgZW5kaWYKPiA+Cj4gPiAgZGVmaW5lIFVTSEFSRV9DT05G
SUdVUkVfQ01EUwo+ID4gQEAgLTMxLDcgKzM0LDcgQEAgZGVmaW5lIFVTSEFSRV9DT05GSUdVUkVf
Q01EUwo+ID4gIGVuZGVmCj4gPgo+ID4gIGRlZmluZSBVU0hBUkVfQlVJTERfQ01EUwo+ID4gLSAg
ICAgJChUQVJHRVRfTUFLRV9FTlYpICQoTUFLRSkgTERGTEFHUz0iJChUQVJHRVRfTERGTEFHUykg
JChVU0hBUkVfTERGTEFHUykiIC1DICQoQEQpCj4gPiArICAgICAkKFRBUkdFVF9NQUtFX0VOVikg
JChNQUtFKSAkKFVTSEFSRV9NQUtFX09QVFMpIC1DICQoQEQpCj4gPiAgZW5kZWYKPiA+Cj4gPiAg
ZGVmaW5lIFVTSEFSRV9JTlNUQUxMX1RBUkdFVF9DTURTCj4gPgpCZXN0IFJlZ2FyZHMsCgpGYWJy
aWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0cy5idXN5
Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
