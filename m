Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26243D609A6
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 15:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBA5B827A8;
	Tue, 16 Dec 2025 15:13:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7GqP3GtIU3Fs; Tue, 16 Dec 2025 15:13:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C309B826F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765897998;
	bh=omGBgbgnje/wU0OWYwPXe8aEf05LDbmVcYDi3MCKSLU=;
	h=References:In-Reply-To:Date:To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=soL1CZxP2ak8yY7GfJ+ZwTHWoIKBFyq40VaktW6N/44BElPq2Timlr5v+d8ZwUm0w
	 bu9sM0nDFVJuK1vbgS1cPiPZr7qng////mKuUqqoUtQZMPsxAV5qxrHtmfgrCq3AUX
	 tZjetIRYOFz8E2HolRa1sH5y5gCqfaK5WkWejUAiktrQFEj5/tgJ9I2fzNtTa01aPm
	 U5g7b5j4FROgR19flC2Dx5n3XmsP0bYX3dkwQE+kLBKBEXppL1PF24B1xUVhagznBM
	 NNc9qwn2oyHPqNl6leVCVSANIsv3JkvIpD6w6SNx3DxP+pvl6jQRSIRED5yt7cqweU
	 n5J2YLy4u17xw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C309B826F5;
	Tue, 16 Dec 2025 15:13:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C9DE6370
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 15:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B94F440D29
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 15:13:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s4oMYhWj90pC for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 15:13:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4FC5440D26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FC5440D26
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4FC5440D26
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 15:13:16 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5959187c5a9so4433503e87.1
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 07:13:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765897993; x=1766502793;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6y3RswpfZeIQJSvdSslfYCPEkC+UIUtOxlG8LGO6eUU=;
 b=B2zhgOLO5jLVIJJ9xXu0XKfPgs7bBgkudgP1m91SwPS6+HSqiFz8U05IlQ+jlczfb0
 sVPWQC/JTtesfChliUaPiob5WnDOEVQ0uMclKXv+XBlu9mOcncKoXTU2rr8D8rWQ1OQV
 ttNz/aJrXEd5WkteuRHmaxKN/qTaKPeyDr2hPBHlfeaVkc6cmQR9+IeamhvMe+7g66v5
 RN5VaWUOqjRt/KEopeLhpHPscTAWnQ37IsYrWm26bh8MvB/fj0zW9mI+k6DN4Ui37B4s
 S8jtfMyKG6Uq1KDFQTmR6DWobpvUfea9fPlyCDSeRHyth/h+A8RVzF/9Q3EINS/3jk9x
 rw0Q==
X-Gm-Message-State: AOJu0YymAyhSQ6y4ygD8GD/ILQHcB5wn97pA7ST86NSPgWMCkanJ59pC
 UB9V4314wcU5zjwnfEy0BFtfy1H+tdw7OLhiLPSdI+69Ji3rPhVm3FAE9zQVqvLJ99oXzG1hoiM
 aS9aSGzhWv+IADBEwuOKbj8Lz1estooCgqg==
X-Gm-Gg: AY/fxX4AAM+Q3V8KmEtmaFGpPqnsKm3gG/ULbItW3Tsrdslcbb3ICsd6OZ6QnNWnLJG
 WyrAeSk4okoag9ExhFBR/rT2mYIOwTiAj/674hUM/WbcS7QPfauJ3OWIUAX5kl0ULgCaaXAFkeH
 7UknZ7YiMQ3mYbZE+9+ranhDgY3kBU4z7zr+QsgTqg1zyu3uZ5Zwk5bYCqNn77KNoiL71tcii19
 9q3Dl8H65iaxuRowniv9jJAClUXb6WduUGLOiaYfZSKcHNndFY3K5+/hPm8hlAfSQMZLR6L
X-Google-Smtp-Source: AGHT+IHM8oOdnWFufRV+qS4aKsso+hAaGHpofdxdDT4s6X1k9rInLj/02WHzRRL3MQFvbbusNA1E3SlJ+kcrZKrJy6U=
X-Received: by 2002:a05:6512:3f09:b0:598:ee6c:1172 with SMTP id
 2adb3069b0e04-598faa229a3mr5177838e87.9.1765897992814; Tue, 16 Dec 2025
 07:13:12 -0800 (PST)
MIME-Version: 1.0
References: <20251215140634.2955955-1-yegorslists@googlemail.com>
In-Reply-To: <20251215140634.2955955-1-yegorslists@googlemail.com>
Date: Tue, 16 Dec 2025 16:13:05 +0100
X-Gm-Features: AQt7F2qfKjxf8UFS3RSXXvWJeo1bLseDQ04c-WkV6c2wZP9v1Qk6CtwYVumhzek
Message-ID: <CAGm1_kurP=wmUeC7uAAU6CO7pf9dW5zt-tc6ZB9u-HjS=9uVug@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1765897993; x=1766502793; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6y3RswpfZeIQJSvdSslfYCPEkC+UIUtOxlG8LGO6eUU=;
 b=RQyqKnddrXbk9M8tcP7oS0WIP1OkysWe1nWy0bTlsr6KjHw8SbnbGLb774wb08NqAy
 iXJvEJDfNBTFc9M845jquDrzpJf+VE/I2BLRwJZj5jCNma4JihtsDm6Yfy8hLcjNSZCc
 r2rqc5laQyucIcg1lrbXkItYqZO73vojHHi2TQApseuQ+9zRguEm6p5rU3RnHh7USGFP
 W1vJVnQfxF+gN6t/cqYLsf0asslmf5l+bj5YqlzIE/2cp31yzN3ZH5jVH5I0TJLMITKf
 RPRBH3PSORzkDuqmUOCKzcwAOhyVnZdeMyrGX8G/givyE26I2FDggayaSYSwuoLml3eb
 5t9w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RQyqKndd
Subject: Re: [Buildroot] [PATCH] package/cmocka: disable documentation
 building
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKT24gTW9uLCBEZWMgMTUsIDIwMjUgYXQgMzowNuKAr1BNIDx5ZWdvcnNsaXN0c0Bn
b29nbGVtYWlsLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlz
dHNAZ29vZ2xlbWFpbC5jb20+Cj4KPiBjbW9ja2EgdHJpZXMgdG8gZmluZCB0aGUgRG94eWdlbiBi
aW5hcnkgYnkgZGVmYXVsdCBhbmQgaWYgc3VjY2Vzc2Z1bCwKPiBpdCB0cmllcyB0byBkb3dubG9h
ZCBzdHlsZSBzaGVldHMgYW5kIGJyZWFrcyB3aXRoIHRoZSBmb2xsb3dpbmcgbWVzc2FnZToKPgo+
IENNYWtlIEVycm9yIGF0Cj4gZG94eWdlbi1hd2Vzb21lLWNzcy1zdWJidWlsZC9kb3h5Z2VuLWF3
ZXNvbWUtY3NzLXBvcHVsYXRlLXByZWZpeC9zcmMvZG94eWdlbi1hd2Vzb21lLWNzcy1wb3B1bGF0
ZS1zdGFtcC9kb3dubG9hZC1kb3h5Z2VuLWF3ZXNvbWUtY3NzLXBvcHVsYXRlLmNtYWtlOjE2Mwo+
IChtZXNzYWdlKToKPiAgIEVhY2ggZG93bmxvYWQgZmFpbGVkIQo+Cj4gICAgIGVycm9yOiBkb3du
bG9hZGluZwo+ICdodHRwczovL2dpdGh1Yi5jb20vam90aGVwcm8vZG94eWdlbi1hd2Vzb21lLWNz
cy9hcmNoaXZlL3JlZnMvdGFncy92Mi40LjEudGFyLmd6Jwo+IGZhaWxlZAo+ICAgICAgICAgICBz
dGF0dXNfY29kZTogMQo+ICAgICAgICAgICBzdGF0dXNfc3RyaW5nOiAiVW5zdXBwb3J0ZWQgcHJv
dG9jb2wiCj4gICAgICAgICAgIGxvZzoKPiAgICAgICAgICAgLS0tIExPRyBCRUdJTiAtLS0KPiAg
ICAgICAgICAgUHJvdG9jb2wgImh0dHBzIiBub3Qgc3VwcG9ydGVkCj4KPiBjbG9zaW5nIGNvbm5l
Y3Rpb24gIy0xCj4KPiBBZGQgYSBwYXRjaCBpbnRyb2R1Y2luZyB0aGUgQlVJTERfRE9DIG9wdGlv
biB0byBwcmV2ZW50IHRoaXMgYmVoYXZpb3IuCj4gUGF0Y2ggVVJMOiBodHRwczovL2dpdGxhYi5j
b20vY21vY2thL2Ntb2NrYS8tL21lcmdlX3JlcXVlc3RzLzEwNQo+Cj4gRml4ZXM6Cj4gaHR0cHM6
Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzL2U2YTA0Y2VlOGJjMzAyOGJkOGExYTUz
NWMyODUyZTYwZjM2MmM0YmEvCj4KPiBTaWduZWQtb2ZmLWJ5OiBZZWdvciBZZWZyZW1vdiA8eWVn
b3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+Cj4gLS0tCj4gIC4uLi8wMDAxLUNNYWtlLWFkZC1CVUlM
RF9ET0Mtb3B0aW9uLnBhdGNoICAgICB8IDQzICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxl
IGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uv
Y21vY2thLzAwMDEtQ01ha2UtYWRkLUJVSUxEX0RPQy1vcHRpb24ucGF0Y2gKPgo+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL2Ntb2NrYS8wMDAxLUNNYWtlLWFkZC1CVUlMRF9ET0Mtb3B0aW9uLnBhdGNo
IGIvcGFja2FnZS9jbW9ja2EvMDAwMS1DTWFrZS1hZGQtQlVJTERfRE9DLW9wdGlvbi5wYXRjaAo+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uMjkxMzMxNWZhYgo+IC0t
LSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2Ntb2NrYS8wMDAxLUNNYWtlLWFkZC1CVUlMRF9E
T0Mtb3B0aW9uLnBhdGNoCj4gQEAgLTAsMCArMSw0MyBAQAo+ICtGcm9tIDU5N2NkM2EwODYwNWIy
ZjA0Zjg5YzgwNmQxMjNlZTE0ZjU3ZDNjYjQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gK0Zy
b206IFllZ29yIFllZnJlbW92IDx5ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbT4KPiArRGF0ZTog
TW9uLCAxNSBEZWMgMjAyNSAxNDowODozNiArMDEwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIENNYWtl
OiBhZGQgQlVJTERfRE9DIG9wdGlvbgo+ICsKPiArQnVpbGQgZG9jdW1lbnRhdGlvbiBvbmx5IGlm
IGV4cGxpY2l0bHkgZW5hYmxlZC4gU2V0IHRoZSBkZWZhdWx0IHRvIE9OIHRvCj4gK3ByZXNlcnZl
IGN1cnJlbnQgYmVoYXZpb3IuCj4gKwo+ICtVcHN0cmVhbTogaHR0cHM6Ly9naXRsYWIuY29tL2Nt
b2NrYS9jbW9ja2EvLS9tZXJnZV9yZXF1ZXN0cy8xMDUKPiArCj4gK1NpZ25lZC1vZmYtYnk6IFll
Z29yIFllZnJlbW92IDx5ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbT4KPiArLS0tCj4gKyBDTWFr
ZUxpc3RzLnR4dCAgICAgIHwgNCArKystCj4gKyBEZWZpbmVPcHRpb25zLmNtYWtlIHwgMSArCj4g
KyAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ICsKPiAr
ZGlmZiAtLWdpdCBhL0NNYWtlTGlzdHMudHh0IGIvQ01ha2VMaXN0cy50eHQKPiAraW5kZXggZTMz
YTFhOC4uZWJkY2Y0ZSAxMDA2NDQKPiArLS0tIGEvQ01ha2VMaXN0cy50eHQKPiArKysrIGIvQ01h
a2VMaXN0cy50eHQKPiArQEAgLTUzLDcgKzUzLDkgQEAgZW5kaWYgKE1JTkdXKQo+ICsgIyBjaGVj
ayBzdWJkaXJlY3Rvcmllcwo+ICsgYWRkX3N1YmRpcmVjdG9yeShpbmNsdWRlKQo+ICsgYWRkX3N1
YmRpcmVjdG9yeShzcmMpCj4gKy1hZGRfc3ViZGlyZWN0b3J5KGRvYykKPiArK2lmIChCVUlMRF9E
T0MpCj4gKysgICAgYWRkX3N1YmRpcmVjdG9yeShkb2MpCj4gKytlbmRpZiAoQlVJTERfRE9DKQo+
ICsKPiArIGlmIChDTUFLRV9QUk9KRUNUX05BTUUgU1RSRVFVQUwgUFJPSkVDVF9OQU1FKQo+ICsg
ICAgIGluY2x1ZGUoQWRkQ01vY2thVGVzdCkKPiArZGlmZiAtLWdpdCBhL0RlZmluZU9wdGlvbnMu
Y21ha2UgYi9EZWZpbmVPcHRpb25zLmNtYWtlCj4gK2luZGV4IGU2Yjg3NmYuLjEzZjFiMGIgMTAw
NjQ0Cj4gKy0tLSBhL0RlZmluZU9wdGlvbnMuY21ha2UKPiArKysrIGIvRGVmaW5lT3B0aW9ucy5j
bWFrZQo+ICtAQCAtMiwzICsyLDQgQEAgb3B0aW9uKEJVSUxEX1NIQVJFRF9MSUJTICJCdWlsZCBz
aGFyZWQgbGlicmFyaWVzIiBPTikKPiArIG9wdGlvbihXSVRIX0VYQU1QTEVTICJCdWlsZCBleGFt
cGxlcyIgT04pCj4gKyBvcHRpb24oVU5JVF9URVNUSU5HICJCdWlsZCB3aXRoIHVuaXQgdGVzdGlu
ZyIgT0ZGKQo+ICsgb3B0aW9uKFBJQ0tZX0RFVkVMT1BFUiAiQnVpbGQgd2l0aCBwaWNreSBkZXZl
bG9wZXIgZmxhZ3MiIE9GRikKPiArK29wdGlvbihCVUlMRF9ET0MgIkJ1aWxkIGRvY3VtZW50YXRp
b24iIE9OKQo+ICstLQoKSSBmb3VuZCBhIGJldHRlciBzb2x1dGlvbi4gV2lsbCBzZW5kIHYyLgoK
WWVnb3IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
