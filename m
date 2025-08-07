Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D86C87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CD6140541;
	Thu,  7 Aug 2025 18:24:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hfYYQoiBSGK2; Thu,  7 Aug 2025 18:24:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 592F040546
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 592F040546;
	Thu,  7 Aug 2025 18:24:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5620010A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B19180C3A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:23:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZgikMMX6HyxM for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:23:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C76F280D36
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C76F280D36
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C76F280D36
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:23:56 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-455b00339c8so8948365e9.3
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:23:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591035; x=1755195835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PLMNTQggPDR5IakA6sYXb6bmUS1kqk42mAo4X0SgiKA=;
 b=TNwe2cG48W5BmnD4cej8pl4k3m72jlIBdgPHSRFgNbs14mfFVYyI4OeXcGs10Xup0K
 AoEjErXiEyxKMhS9lUk8EJwtxBvImu9qB6kIqHQbKy+32fucTPvEjRdLZ2SWIdpfdhYY
 S3ovcK+ryOBvTILhh5x0s5addGBs1WKHiwCEAgDSGP+3w2+oIrA5PJju9z4sHOvdNkTr
 ejBe3n1giM47Hnx8RI86twgTKMxXDUYbUAPSNZs03KUFWlSZ5XeZQ/bY6SrZUzG8uCRj
 ZRZ7DzfAY7c9LsXruPKkElV3kyNTDRIXTIRVSELjI6V4rMbkAg2NUWyWIIsGSCLzvy86
 aJaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpE0EjwJxjMvX1rU9XBtMwt1y01iR/BlxkvWtDYwFBPT5XGh2AQNxPC1V/4YSd+DO/b9gEi10hrMA=@buildroot.org
X-Gm-Message-State: AOJu0YwQsyMeiAtEj763Js4fjXlQLqEtyLn83Ar6F8LNo49buN/uDJeX
 voy1UrJirsaSVL4Ej/3+COfgrFrvcqV7YS/fCBsVQO3yktM4EVuQC/+5+kqcoKwbrGY=
X-Gm-Gg: ASbGnctp/pKXcnlsWC8a8982FsmziCR19gfLBNhuw9kzqixkg+wMvv/OTMMVkZl+5dD
 F9COBLZI9we+mzSubVOJbHOAb1KchXJ/97quuN9pKryx5606Yh4V3TEcfUlAJ0Zf+uBCRV/wqtB
 QBsUcQuGUI5tBv4YXK0p+JMNwbdxe3k3euYUWePkKC1ZvvbsiqvUvPVkFgHqOgCLp+bREwI9MO+
 isSX8iA7NqpW1gPWIzF9d8P7zv52T88vpVjyIrKZ0wED8RvGvolqxSDm4TNV7fdPrlcFnyQX8nk
 RKoDt18ZRvtLnQBbGN5XuLhKPWzgnsXaeAZ5c/OZ/Z3KKnuvcaxngb2q+CIJRSOByy0DGr7d8db
 KbilgbLP5W2J72Q==
X-Google-Smtp-Source: AGHT+IH8OiyNbml3okmKrg0aPYIeE9aV2exkqs2MzVa915YSAqfUB01TajgLowgUo07IBT/PkcQsIw==
X-Received: by 2002:a05:600c:3585:b0:456:18f3:b951 with SMTP id
 5b1f17b1804b1-459f3f2a65bmr13559155e9.15.1754591034899; 
 Thu, 07 Aug 2025 11:23:54 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459ded356b9sm172898535e9.12.2025.08.07.11.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:23:54 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:23:52 +0200
Message-ID: <20250807182354.723750-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250620221850.2465031-1-fiona.klute@gmx.de>
References: <20250620221850.2465031-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591035; x=1755195835; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PLMNTQggPDR5IakA6sYXb6bmUS1kqk42mAo4X0SgiKA=;
 b=iD23emuFRP+x+MtfTUAfeprflMaCdeA/0ybfd9EAWMY84iQsS9j/4E9EfosbciSpiv
 bUNmwBcxGUazd6fGdbBsBqVrfIDjpAJ59Mz/sOYtr8EwJ6y+NlpKty8jLKXZx4s8Xgj9
 ggsqmtgmWXSDt8qw5Hlu7dBmpyJSmTiW+ihUiTkmdw0CXS42S6qYhKW+ou5gvWBepbv2
 XjJMwQ8MGW+D/+aByO+lZGH61gV60qOVeVHFZ5oh7q5Rp10vZp5P66LSFLMMsH7+oVAv
 JbRwjvvklITgComobXH4Xaw7xYzTzdBIXDundqSDP6kDIMJ2taKmcl0RhS60QstMrC/Y
 pHPw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=iD23emuF
Subject: Re: [Buildroot] [PATCH 1/1] package/lrzsz: fix build with musl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gbGliL2xvbmctb3B0aW9ucy5jIGZhaWxlZCB0byBjb21waWxlIHdpdGgg
bXVzbCBmb3IgdGhlIHNhbWUgcmVhc29uCj4gMDAwMi1saWItbG9uZy1vcHRpb25zLmMtaW5jbHVk
ZS1zdGRsaWIuaC5wYXRjaCB3YXMgYWRkZWQgdG8gZml4LAo+IGV4aXQoKSBiZWluZyB1bmRlZmlu
ZWQuIFRoZSBmaXggaXMgdGhlIHNhbWUgYXMgd2VsbDogaW5jbHVkZSBzdGRsaWIuaC4KPiAKPiBG
aXhlczogYjY3ODRhMWYxZiAoInBhY2thZ2UvbHJ6c3o6IGZpeCBidWlsZCB3aXRoIEdDQyA+PSAx
NC54IikKPiBTaWduZWQtb2ZmLWJ5OiBGaW9uYSBLbHV0ZSA8ZmlvbmEua2x1dGVAZ214LmRlPgoK
QXBwbGllZCB0byAyMDI1LjAyLnggJiAyMDI1LjA1LnguIFRoYW5rcwoKPiAtLS0KPiBUaGlzIGNv
bXBpbGVzIHdpdGggdUNsaWJjLW5nLCB0b28gKHdpdGhvdXQgZXZlbiBhIHdhcm5pbmcsIEkgZGlk
bid0Cj4gdGVzdCBhdCBydW50aW1lKSwgc28gSSdtIG5vdCBzdXJlIHdoYXQgdGhvc2UgIm5vbi1H
TlUgQyBsaWJyYXJpZXMiCj4gd2hlcmUgdGhpbmdzIGJyZWFrIGFyZS4gVGhlcmUgYXJlIHNpbWls
YXIgY29tbWVudHMgYWxsIG92ZXIgdGhlIGdldG9wdAo+IGNvZGUsIHNvIHdpdGggdGhlIGFnZSBv
ZiB0aGUgY29kZSBtYXliZSB3YXkgb3V0ZGF0ZWQgb25lcywgb3IKPiBub24tTGludXggcGxhdGZv
cm1zLgo+IAo+ICAuLi4vMDAwMi1saWItbG9uZy1vcHRpb25zLmMtaW5jbHVkZS1zdGRsaWIuaC5w
YXRjaCAgICAgfCAxMCArKystLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDcgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHJ6c3ovMDAwMi1s
aWItbG9uZy1vcHRpb25zLmMtaW5jbHVkZS1zdGRsaWIuaC5wYXRjaCBiL3BhY2thZ2UvbHJ6c3ov
MDAwMi1saWItbG9uZy1vcHRpb25zLmMtaW5jbHVkZS1zdGRsaWIuaC5wYXRjaAo+IGluZGV4IDYy
MjkxMTRlMGEuLmYwNTMyYmQwMzYgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9scnpzei8wMDAyLWxp
Yi1sb25nLW9wdGlvbnMuYy1pbmNsdWRlLXN0ZGxpYi5oLnBhdGNoCj4gKysrIGIvcGFja2FnZS9s
cnpzei8wMDAyLWxpYi1sb25nLW9wdGlvbnMuYy1pbmNsdWRlLXN0ZGxpYi5oLnBhdGNoCj4gQEAg
LTE1LDYgKzE1LDggQEAgbG9uZy1vcHRpb25zLmM6NzA6MTE6IGVycm9yOiBpbXBsaWNpdCBkZWNs
YXJhdGlvbiBvZiBmdW5jdGlvbiDigJhleGl04oCZCj4gIAo+ICBVcHN0cmVhbTogaHR0cHM6Ly9n
aXRodWIuY29tL1V3ZU9oc2UvbHJ6c3ovcHVsbC80Cj4gIFNpZ25lZC1vZmYtYnk6IFRob21hcyBQ
ZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Cj4gK1tGaW9uYTogcmVtb3Zl
IGNvbmRpdGlvbmFsIG9uIF9fR05VX0xJQlJBUllfXyB0byBmaXggYnVpbGQgd2l0aCBtdXNsXQo+
ICtTaWduZWQtb2ZmLWJ5OiBGaW9uYSBLbHV0ZSA8ZmlvbmEua2x1dGVAZ214LmRlPgo+ICAtLS0K
PiAgIGxpYi9sb25nLW9wdGlvbnMuYyB8IDkgKysrKysrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspCj4gQEAgLTIzLDE4ICsyNSwxMiBAQCBkaWZmIC0tZ2l0IGEvbGliL2xv
bmctb3B0aW9ucy5jIGIvbGliL2xvbmctb3B0aW9ucy5jCj4gIGluZGV4IDc2Yjk3OTYuLjE5Yzg0
ZTAgMTAwNjQ0Cj4gIC0tLSBhL2xpYi9sb25nLW9wdGlvbnMuYwo+ICArKysgYi9saWIvbG9uZy1v
cHRpb25zLmMKPiAtQEAgLTIyLDYgKzIyLDE1IEBACj4gK0BAIC0yMiw2ICsyMiw5IEBACj4gICAj
ZW5kaWYKPiAgIAo+ICAgI2luY2x1ZGUgPHN0ZGlvLmg+Cj4gICsKPiAtKy8qIFRoaXMgbmVlZHMg
dG8gY29tZSBhZnRlciBzb21lIGxpYnJhcnkgI2luY2x1ZGUKPiAtKyAgIHRvIGdldCBfX0dOVV9M
SUJSQVJZX18gZGVmaW5lZC4gICovCj4gLSsjaWZkZWYJX19HTlVfTElCUkFSWV9fCj4gLSsvKiBE
b24ndCBpbmNsdWRlIHN0ZGxpYi5oIGZvciBub24tR05VIEMgbGlicmFyaWVzIGJlY2F1c2Ugc29t
ZSBvZiB0aGVtCj4gLSsgICBjb250YWluIGNvbmZsaWN0aW5nIHByb3RvdHlwZXMgZm9yIGdldG9w
dC4gICovCj4gICsjaW5jbHVkZSA8c3RkbGliLmg+Cj4gLSsjZW5kaWYJLyogR05VIEMgbGlicmFy
eS4gICovCj4gICsKPiAgICNpbmNsdWRlIDxnZXRvcHQuaD4KPiAgICNpbmNsdWRlICJsb25nLW9w
dGlvbnMuaCIKPiAtLSAKPiAyLjUwLjAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
