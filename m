Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	URI_NOVOWEL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F302BC433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 21:43:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D5FA60FD7
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 21:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D5FA60FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38A7D400D2;
	Fri,  3 Sep 2021 21:43:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g-Q8jUdKHC6i; Fri,  3 Sep 2021 21:43:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2647D40159;
	Fri,  3 Sep 2021 21:43:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1E5DA1BF389
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 21:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A7AD60677
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 21:43:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wd6PAa5830h5 for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 21:43:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 43FF06066E
 for <buildroot@buildroot.org>; Fri,  3 Sep 2021 21:43:03 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id bq28so931255lfb.7
 for <buildroot@buildroot.org>; Fri, 03 Sep 2021 14:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gdumsZxSCFhbW90Qb82bNIXF7IN7Yx4HogVTZpGotsw=;
 b=p8kL7B5I1F8DWiLWrtQEZcW8Q+K6cCjN169CdOMVcZnY59YXMhNUQwCgqw++0qWxIb
 r7sYjJh3ILreFIRteq0kf7rX9+1ubUkgxYUSmH9A5OV4cfjrjeRIHbKEUsnOd1mobcVf
 6ffLecpSMLo+L5MguBAKLexAv4FEA4of5WjWF814AwjMLxD64gxyrs5xss/yYobVWLx1
 zxriaWZiW7urrJ9OqSv0r8fIb7W2nSBW2NU/p67jhyfuUDNDib38eyEvtebNMOwXKO3S
 AjNsoSo2qeVAHVUkQ/ZdRBomHU/mh7HoBwfmAz3+rwKQHFH5zjyWWXMpYzNLTaOqvPIx
 CcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gdumsZxSCFhbW90Qb82bNIXF7IN7Yx4HogVTZpGotsw=;
 b=eum0hyWAjbTb6zjbkaX+0ekmMkzWkSGUSTEcR2V7zJIDTQIC8xrRRNlkVYEe8Ko4EM
 hp0tRJoL6f2XMSB2fnSFhrW1gZ3RnAqA44dluQbNyHFqG90jwuTh/CBi5OK6sXXl/J5N
 K0w68oJDRL3CH6DQJEpHHdAZIMBsJ5wuhlPnF1+AB7WBqSzyenLTGefhd+S03bx3JwRo
 UoMNlJYGiN7ixMHRowHk14U3pu7cwn1jYXB6lQuircPL3KSZS2J3uWlh0JpDqnNmyKe5
 0BLRuGrAsG4ek+n4C6oJrEOqwQmQX6htay8AxCIi6CPkt9/T9qazDJzJZR9BXtadJHwR
 +qxA==
X-Gm-Message-State: AOAM530if9TA/5m5wel+mUdENtiBZ5ZNfSDRE4B9MJAaPSdSpGOddNZB
 6Eqh7OEP5jzAnECNGcO0125aRQVe8Qn2vZ9vBsw=
X-Google-Smtp-Source: ABdhPJx1ZfXu9drwEk9p4I5ivH9XxJebK9dn/DVFpPiYqQ/+xVvScM2ShKEvkD9DC2sy95SIgfEpEqrOdQ+Q7x/2UbQ=
X-Received: by 2002:ac2:46d3:: with SMTP id p19mr657135lfo.689.1630705381022; 
 Fri, 03 Sep 2021 14:43:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210902162024.2201056-1-fontaine.fabrice@gmail.com>
 <93396db0-96b3-faa4-2b62-2301b14300df@mind.be>
In-Reply-To: <93396db0-96b3-faa4-2b62-2301b14300df@mind.be>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 3 Sep 2021 23:42:49 +0200
Message-ID: <CAPi7W81qk717BmHjc3-bFNei9cnyb+4p8B26GSTcn-rv2bqVQA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/fstrcmp: fix musl static build
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

TGUgdmVuLiAzIHNlcHQuIDIwMjEgw6AgMjA6NTMsIEFybm91dCBWYW5kZWNhcHBlbGxlIDxhcm5v
dXRAbWluZC5iZT4gYSDDqWNyaXQgOgo+Cj4KPgo+IE9uIDAyLzA5LzIwMjEgMTg6MjAsIEZhYnJp
Y2UgRm9udGFpbmUgd3JvdGU6Cj4gPiBGaXggdGhlIGZvbGxvd2luZyBtdXNsIHN0YXRpYyBidWls
ZCBmYWlsdXJlIHJhaXNlZCBiZWNhdXNlIGhvc3QgbGlidG9vbAo+ID4gaXMgbm90IHBhdGNoZWQg
dG8gbWFuYWdlICItc3RhdGljIiBhcyAiLWFsbC1zdGF0aWMiLiBTbyBpbnN0ZWFkIG9mIHVzaW5n
Cj4gPiBob3N0IGxpYnRvb2wsIHBhdGNoIGNvbmZpZ3VyZS5hYyB0byBhZGQgYSBjYWxsIHRvIExU
X0lOSVQgd2hpY2ggd2lsbAo+Cj4gIFdvdWxkbid0IGl0IG1ha2UgbW9yZSBzZW5zZSB0byBqdXN0
IGFwcGx5IG91ciBidWlsZHJvb3QtbGlidG9vbC12Mi40LjQucGF0Y2ggdG8KPiBob3N0LWxpYnRv
b2w/CkkgdHJpZWQgdGhpcyBhcHByb2FjaCBidXQgdGhpcyByZXN1bHQgaW4gYnVpbGQgZmFpbHVy
ZXMgZm9yIGFsbCBob3N0CnBhY2thZ2VzIHN1Y2ggYXMgaG9zdC1saWJmZmkgb246Cgo+Pj4gaG9z
dC1saWJmZmkgMy40LjIgUGF0Y2hpbmcgbGlidG9vbApwYXRjaGluZyBmaWxlIC9ob21lL2ZhYnJp
Y2UvYnVpbGRyb290L291dHB1dC9idWlsZC9ob3N0LWxpYmZmaS0zLjQuMi9sdG1haW4uc2gKUmV2
ZXJzZWQgKG9yIHByZXZpb3VzbHkgYXBwbGllZCkgcGF0Y2ggZGV0ZWN0ZWQhICBBc3N1bWUgLVI/
IFtuXQo+Cj4gIFJlZ2FyZHMsCj4gIEFybm91dAo+Cj4gPiByZXN1bHQgaW4gbHQtbWFpbi5zaCBi
ZWluZyBjb3BpZWQgKGFuZCBzbyBsaWJ0b29sIHBhdGNoIGJlaW5nIGFwcGxpZWQpOgo+ID4KPiA+
IC9ob21lL2J1aWxkcm9vdC9hdXRvYnVpbGQvaW5zdGFuY2UtMi9vdXRwdXQtMS9ob3N0L2Jpbi9s
aWJ0b29sIC0tbW9kZT1saW5rIC0tdGFnPUNDIC9ob21lL2J1aWxkcm9vdC9hdXRvYnVpbGQvaW5z
dGFuY2UtMi9vdXRwdXQtMS9ob3N0L2Jpbi9hcm0tYnVpbGRyb290LWxpbnV4LW11c2xlYWJpaGYt
Z2NjIC1EX0xBUkdFRklMRV9TT1VSQ0UgLURfTEFSR0VGSUxFNjRfU09VUkNFIC1EX0ZJTEVfT0ZG
U0VUX0JJVFM9NjQgLURfTEFSR0VGSUxFX1NPVVJDRSAtRF9MQVJHRUZJTEU2NF9TT1VSQ0UgLURf
RklMRV9PRkZTRVRfQklUUz02NCAgLU9zIC1nMCAgLXN0YXRpYyAtV2FsbCAtV2V4dHJhIC1Xc2hh
ZG93IC1vIGJpbi90ZXN0X3VzZXIgXAo+ID4gICAgICAgdGVzdF91c2VyL21haW4ubG8gbGliL2xp
YmZzdHJjbXAubGEgLXN0YXRpYwo+ID4gY2htb2QgYStyeCBiaW4vdGVzdF9wcmVsdWRlCj4gPiBs
aWJ0b29sOiBsaW5rOiAvaG9tZS9idWlsZHJvb3QvYXV0b2J1aWxkL2luc3RhbmNlLTIvb3V0cHV0
LTEvaG9zdC9iaW4vYXJtLWJ1aWxkcm9vdC1saW51eC1tdXNsZWFiaWhmLWdjYyAtRF9MQVJHRUZJ
TEVfU09VUkNFIC1EX0xBUkdFRklMRTY0X1NPVVJDRSAtRF9GSUxFX09GRlNFVF9CSVRTPTY0IC1E
X0xBUkdFRklMRV9TT1VSQ0UgLURfTEFSR0VGSUxFNjRfU09VUkNFIC1EX0ZJTEVfT0ZGU0VUX0JJ
VFM9NjQgLU9zIC1nMCAtV2FsbCAtV2V4dHJhIC1Xc2hhZG93IC1vIGJpbi90ZXN0X3VzZXIgdGVz
dF91c2VyL21haW4ubyAgbGliLy5saWJzL2xpYmZzdHJjbXAuYQo+ID4gbGlidG9vbDogbGluazog
L2hvbWUvYnVpbGRyb290L2F1dG9idWlsZC9pbnN0YW5jZS0yL291dHB1dC0xL2hvc3QvYmluL2Fy
bS1idWlsZHJvb3QtbGludXgtbXVzbGVhYmloZi1nY2MgLURfTEFSR0VGSUxFX1NPVVJDRSAtRF9M
QVJHRUZJTEU2NF9TT1VSQ0UgLURfRklMRV9PRkZTRVRfQklUUz02NCAtRF9MQVJHRUZJTEVfU09V
UkNFIC1EX0xBUkdFRklMRTY0X1NPVVJDRSAtRF9GSUxFX09GRlNFVF9CSVRTPTY0IC1PcyAtZzAg
LVdhbGwgLVdleHRyYSAtV3NoYWRvdyAtbyBiaW4vZnN0cmNtcCBmc3RyY21wL21haW4ubyAgbGli
Ly5saWJzL2xpYmZzdHJjbXAuYQo+ID4gL2hvbWUvYnVpbGRyb290L2F1dG9idWlsZC9pbnN0YW5j
ZS0yL291dHB1dC0xL2hvc3QvbGliL2djYy9hcm0tYnVpbGRyb290LWxpbnV4LW11c2xlYWJpaGYv
MTAuMy4wLy4uLy4uLy4uLy4uL2FybS1idWlsZHJvb3QtbGludXgtbXVzbGVhYmloZi9iaW4vbGQ6
IC9ob21lL2J1aWxkcm9vdC9hdXRvYnVpbGQvaW5zdGFuY2UtMi9vdXRwdXQtMS9ob3N0L2xpYi9n
Y2MvYXJtLWJ1aWxkcm9vdC1saW51eC1tdXNsZWFiaWhmLzEwLjMuMC9saWJnY2MuYShfZHZtZF9s
bngubyk6IGluIGZ1bmN0aW9uIGBfX2FlYWJpX2xkaXYwJzoKPiA+IC9ob21lL2J1aWxkcm9vdC9h
dXRvYnVpbGQvaW5zdGFuY2UtMi9vdXRwdXQtMS9idWlsZC9ob3N0LWdjYy1maW5hbC0xMC4zLjAv
YnVpbGQvYXJtLWJ1aWxkcm9vdC1saW51eC1tdXNsZWFiaWhmL2xpYmdjYy8uLi8uLi8uLi9saWJn
Y2MvY29uZmlnL2FybS9saWIxZnVuY3MuUzoxNDk5OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBy
YWlzZScKPiA+Cj4gPiBGaXhlczoKPiA+ICAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9y
Zy9yZXN1bHRzL2ZmYmVlMTJmMTNlM2Q2YzE4MGQ4ODkxYTQyOGM2YzQ5MDE2MzA4M2QKPiA+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWls
LmNvbT4KPiA+IC0tLQo+ID4gIHBhY2thZ2UvZnN0cmNtcC8wMDAyLWFkZC1MVF9JTklULnBhdGNo
IHwgMjggKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICBwYWNrYWdlL2ZzdHJjbXAvZnN0
cmNtcC5tayAgICAgICAgICAgICB8ICA0ICsrLS0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDMwIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2th
Z2UvZnN0cmNtcC8wMDAyLWFkZC1MVF9JTklULnBhdGNoCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvZnN0cmNtcC8wMDAyLWFkZC1MVF9JTklULnBhdGNoIGIvcGFja2FnZS9mc3RyY21wLzAw
MDItYWRkLUxUX0lOSVQucGF0Y2gKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAw
MDAwMDAwMDAwLi5jYzU1YWU0OGM5Cj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9wYWNrYWdl
L2ZzdHJjbXAvMDAwMi1hZGQtTFRfSU5JVC5wYXRjaAo+ID4gQEAgLTAsMCArMSwyOCBAQAo+ID4g
K2FkZCBMVF9JTklUCj4gPiArCj4gPiArQWRkIExUX0lOSVQgc28gbHQtbWFpbi5zaCB3aWxsIGJl
IGNvcGllZCBhbmQgcGF0Y2hlZCB0byBmaXggbXVzbCBzdGF0aWMgYnVpbGQKPiA+ICsKPiA+ICtT
aWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNv
bT4KPiA+ICsKPiA+ICtkaWZmIC1OdXJhIGZzdHJjbXAtMC43LkQwMDEub3JpZy9jb25maWd1cmUu
YWMgZnN0cmNtcC0wLjcuRDAwMS9jb25maWd1cmUuYWMKPiA+ICstLS0gZnN0cmNtcC0wLjcuRDAw
MS5vcmlnL2NvbmZpZ3VyZS5hYyAgICAgICAyMDIxLTA5LTAyIDE1OjIwOjM4LjAzMzIwODA4NCAr
MDIwMAo+ID4gKysrKyBmc3RyY21wLTAuNy5EMDAxL2NvbmZpZ3VyZS5hYyAgICAyMDIxLTA5LTAy
IDE1OjM3OjA4LjYyNTgzNzY4OCArMDIwMAo+ID4gK0BAIC01Myw2ICs1Myw3IEBACj4gPiArIGRu
bCEgQUNfQUREX0NGTEFHUygtV2Vycm9yKQo+ID4gKyBkbmwhIEFDX0FERF9DRkxBR1MoWy1XbCwt
LWFzLW5lZWRlZF0pCj4gPiArCj4gPiArK0xUX0lOSVQKPiA+ICsgQUNfQ0hFQ0tfUFJPR1MoTElC
VE9PTCwgbGlidG9vbCkKPiA+ICsKPiA+ICsgaWYgdGVzdCAteiAiJExJQlRPT0wiCj4gPiArZGlm
ZiAtTnVyYSBmc3RyY21wLTAuNy5EMDAxLm9yaWcvTWFrZWZpbGUuaW4gZnN0cmNtcC0wLjcuRDAw
MS9NYWtlZmlsZS5pbgo+ID4gKy0tLSBmc3RyY21wLTAuNy5EMDAxLm9yaWcvTWFrZWZpbGUuaW4g
ICAgICAgIDIwMjEtMDktMDIgMTU6MjA6MzguMDMzMjA4MDg0ICswMjAwCj4gPiArKysrIGZzdHJj
bXAtMC43LkQwMDEvTWFrZWZpbGUuaW4gICAgIDIwMjEtMDktMDIgMTU6Mzg6MzguNjIyODMyOTI5
ICswMjAwCj4gPiArQEAgLTM0LDYgKzM0LDcgQEAKPiA+ICsgIwo+ID4gKyAjIGRpcmVjdG9yeSBj
b250YWluaW5nIHRoZSBzb3VyY2UKPiA+ICsgIwo+ID4gKyt0b3BfYnVpbGRkaXIgPSBAc3JjZGly
QAo+ID4gKyBzcmNkaXIgPSBAc3JjZGlyQAo+ID4gKyBWUEFUSCA9IEBzcmNkaXJACj4gPiArCj4g
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9mc3RyY21wL2ZzdHJjbXAubWsgYi9wYWNrYWdlL2ZzdHJj
bXAvZnN0cmNtcC5tawo+ID4gaW5kZXggOWM0MjE1OWFmYi4uOWI2NDE5YWUzZiAxMDA2NDQKPiA+
IC0tLSBhL3BhY2thZ2UvZnN0cmNtcC9mc3RyY21wLm1rCj4gPiArKysgYi9wYWNrYWdlL2ZzdHJj
bXAvZnN0cmNtcC5tawo+ID4gQEAgLTEwLDggKzEwLDggQEAgRlNUUkNNUF9TSVRFID0gaHR0cHM6
Ly9zb3VyY2Vmb3JnZS5uZXQvcHJvamVjdHMvZnN0cmNtcC9maWxlcy9mc3RyY21wLyQoRlNUUkNN
UF8KPiA+ICBGU1RSQ01QX0xJQ0VOU0UgPSBHUEwtMy4wKwo+ID4gIEZTVFJDTVBfTElDRU5TRV9G
SUxFUyA9IExJQ0VOU0UKPiA+ICBGU1RSQ01QX0lOU1RBTExfU1RBR0lORyA9IFlFUwo+ID4gLUZT
VFJDTVBfREVQRU5ERU5DSUVTID0gaG9zdC1saWJ0b29sCj4gPiAtRlNUUkNNUF9DT05GX0VOViA9
IExJQlRPT0w9IiQoSE9TVF9ESVIpL2Jpbi9saWJ0b29sIgo+ID4gKyMgV2UncmUgcGF0Y2hpbmcg
Y29uZmlndXJlLmFjCj4gPiArRlNUUkNNUF9BVVRPUkVDT05GID0gWUVTCj4gPgo+ID4gIEZTVFJD
TVBfTUFLRV9PUFRTID0gYWxsLWJpbiBsaWJkaXIvcGtnY29uZmlnL2ZzdHJjbXAucGMKPiA+Cj4g
PgpCZXN0IFJlZ2FyZHMsCgpGYWJyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGxpc3RzLmJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
