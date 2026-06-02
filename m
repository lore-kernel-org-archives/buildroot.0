Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9033CD6E57
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 19:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3CF2828D1;
	Tue,  2 Jun 2026 19:51:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XXE9XliTOBY9; Tue,  2 Jun 2026 19:51:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC501828E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780429873;
	bh=eNC4URZL/YH0x4mpCrjgH5PxeitHQxNFRt1MciU745s=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Yr1974ZqaOknvb90msHHuRTUCpOLmdxrEtBxnhGUPvTUK4lpAJYlHgM2Jhavw5duu
	 /AynO0CUzWabGGtfqHyia3cXDFYrw8Cr0l9lTpjr9k0H8o47kISVJkYpDfD+IGaYC5
	 4OKyws+OjdBqiqjIr9elvjmRQnnrj2lYazRyFBUJKhCWbFpamRcI/TO2Dub644lbDG
	 hPp7gP/5rU3TzBo64R6liFm9t9/bLfqSkmpgDd/IgdtEVFl7QuKrAk38y3ca7PzdwN
	 ASWk/w9JW4nuzSJQTI3RMoqrv/SJUUEXoYLPY9h7lxv7JOGjrRwVeqJDUmmfEYei8f
	 u2oPJYaEgHFMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC501828E3;
	Tue,  2 Jun 2026 19:51:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FA02372
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 19:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C32D828E3
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 19:51:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y5WKHq1hB2Cg for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 19:51:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5B5D7828D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B5D7828D1
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B5D7828D1
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 19:51:12 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4904fd4f6aeso99947785e9.2
 for <buildroot@buildroot.org>; Tue, 02 Jun 2026 12:51:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780429870; x=1781034670;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oCY/VyLcAGWjGRcf4a/+xeo2qc9+geM2pvBL45e4Z3g=;
 b=nZwewSjKJU/Q66PK8jfXxGdwYew95lAOH2UaXSUVDWN9zKWghXTB/EQnRhwPbolWmf
 uRLLb59XnEzk8pff2VAQAMfv33NplAbzZxG20y5IWWSLd77Q7xRJ3WlKoH79E56gHKBp
 x7fRu7QJNOhiYhvVtYRCYcZPs/j6Jg+Z/2r+WwEgKAqQTuOvJp2yyeEFbELNwy6Pfw1z
 n1awFloJ7hcvKrpCAtGV8TwNPUqKsWAev3cIhee+eDav0SwLZn9ZN1B8SYhKQmJO7FPo
 TV6pW6znvHriDeaWB4DYliWt9Grk2tucRWW2C6K/eoGZC2Eb3VREhipituxK1wXjqeRN
 02og==
X-Forwarded-Encrypted: i=1;
 AFNElJ/a1Dqmi+tZR2kLD5XJIzyWLIWQhGlLmrpWfDloVAN8pjD8Nv5YMCk+Q3cHkltlwNSltzZ4jCAktQA=@buildroot.org
X-Gm-Message-State: AOJu0YxMfyVY+xTClWT7GWMGjGnqKTSCYYEAoZKeTAlu/dessbohWvwK
 Bi/844LmWn/BoYGbfSIkUaRLX2KP1b6bGW11oWjf0J6EIj9bmyRWmOaI+/u57ZXS1okbPe7mzUG
 dVcLg
X-Gm-Gg: Acq92OEXUPSh03Lred+sY+oJa4KkJA8kIQnxa4yoF4lEMP9QDLr4gsA7z855FmbgJu2
 QS7AN6SJ4oWcyeJdu8RJDJggF0Uiy6tfa5TNgfA7OoIT/UM3DaQxs9ogDp6gV28667nrsZRi7Qa
 4kCErr3GzKdMf8kospO+VwfMa3BF/m9k3iBSyEQ8SbC3DNlfRmAAicWEGqdVfjDQG5JpkUhXOky
 3HCm+GrgZUllTQdkDrayXIlo3Cn75IpL5yoiLVfgkoU/imESB8Y+KICsbuTJTt439GktYTrj2FD
 Ew6GugPIh4Zz2xuLesuS+V3q4E+VgNK+aaB72qKVDB+kKVdDiLm+2pLsUyBJXFylxrrm/Ka/5Ib
 +D6IV2kOSwQveCTlxQV4vlsot0poiv+SBKagpRdpClCvYD6cyCUPGjFADczc7OUsw5rzZOjzCVL
 xLxjTW7y3v+zA8c3jlezEn9BVwbB6ZsLcb9gad9evmIbdI+XvfUV0rqEn47DFz/LOmzsNHrWNw8
 k0sLm2/FOf7qRMPVYO8ppkwdtqa57rLDt+/hUnnAkVzawgx0/Hwf38/D+ziYWUWrbUUIZEG9/uv
X-Received: by 2002:a05:600c:4e92:b0:490:6869:46d2 with SMTP id
 5b1f17b1804b1-490b5d44845mr5496165e9.0.1780429870139; 
 Tue, 02 Jun 2026 12:51:10 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b0e8efeesm77227295e9.15.2026.06.02.12.51.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 12:51:09 -0700 (PDT)
Message-ID: <062df6d4-e237-47c2-add2-735cc507cd77@smile.fr>
Date: Tue, 2 Jun 2026 21:51:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@rnout.be>, buildroot@buildroot.org
References: <20260601192855.1901119-1-arnout@rnout.be>
 <2215c159-8dc8-4fbe-a061-315848517d6b@rnout.be>
Content-Language: en-US
In-Reply-To: <2215c159-8dc8-4fbe-a061-315848517d6b@rnout.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1780429870; x=1781034670; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oCY/VyLcAGWjGRcf4a/+xeo2qc9+geM2pvBL45e4Z3g=;
 b=uLXbgmKxZiyVkzBAb5SjbPnFZ6xkKLnzt/V/zMVh0Srrd+N2Z3pKdCdVOiyGiOTJnX
 Xlm1Jwt8EI76K+vPka2i8UFW0UiMsOrPZtTFUD7Xa7ZA79FDP1erqD1cmewyPG2z8LBm
 qSm/oAPel60qXb6JNUoiBA3jWVnBcwEOhGUyw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=uLXbgmKx
Subject: Re: [Buildroot] [PATCH v--cc=Romain Naour <romain.naour@smile.fr>]
 support/scripts/generate-gitlab-ci-yml: use large runners for defconfigs
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMDEvMDYvMjAyNiDDoCAyMTozMSwgQXJub3V0IFZhbmRlY2FwcGVsbGUgYSDDqWNyaXTCoDoK
PiDCoExvb2tzIGxpa2UgSSdtIHN0aWxsIHRpcmVkLCBidXQgdGhpcyB0aW1lIEkganVzdCBzY3Jl
d2VkIHVwIG15IGdpdC1zZW5kLWVtYWlsCj4gY29tbWFuZCBsaW5lIDotKQoKQXQgbGVhc3QsIGl0
IHdhc24ndCBtYXJrZWQgYXMgc3BhbSA6LSkKCkJlc3QgcmVnYXJkcywKUm9tYWluCgo+IAo+IMKg
UmVnYXJkcywKPiDCoEFybm91dAo+IAo+IE9uIDAxLzA2LzIwMjYgMjE6MjgsIEFybm91dCBWYW5k
ZWNhcHBlbGxlIHdyb3RlOgo+PiBkZWZjb25maWdzIGFyZSB2ZXJ5IHVubGlrZWx5IHRvIHN1Y2Nl
c3NmdWxseSBidWlsZCBvbiBhIHNtYWxsIHJ1bm5lcgo+PiBiZWNhdXNlIHRoZXkgYnVpbGQgYSBr
ZXJuZWwgKGFuZCBvZnRlbiBhIHRvb2xjaGFpbikuIFRoZXkncmUgYWxzbyBsaWtlbHkKPj4gdG8g
YmVuZWZpdCBhIGxvdCBmcm9tIHRoZSBhZGRpdGlvbmFsIHBhcmFsbGVsaXNtIG9uIGxhcmdlciBy
dW5uZXJzLgo+Pgo+PiBGb3Igbm93LCBhbHdheXMgYnVpbGQgdGhlbSBvbiBsYXJnZSBydW5uZXJz
LiBUaGVyZSBtYXkgYmUgc29tZSBmb3Igd2hpY2gKPj4gZXZlbiB0aGUgbGFyZ2UgcnVubmVycyBk
b24ndCBoYXZlIHN1ZmZpY2llbnQgZGlzayBzcGFjZSBvciBtZW1vcnksIGJ1dAo+PiB3ZSdsbCBz
b2x2ZSB0aGF0IHdoZW4gaXQgaGFwcGVucy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQXJub3V0IFZh
bmRlY2FwcGVsbGUgPGFybm91dEBybm91dC5iZT4KPj4gLS0tCj4+IMKgIHN1cHBvcnQvc2NyaXB0
cy9nZW5lcmF0ZS1naXRsYWItY2kteW1sIHwgMiArLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3N1cHBvcnQvc2Ny
aXB0cy9nZW5lcmF0ZS1naXRsYWItY2kteW1sIGIvc3VwcG9ydC9zY3JpcHRzLwo+PiBnZW5lcmF0
ZS1naXRsYWItY2kteW1sCj4+IGluZGV4IDJhOGM5YmU1ZjUuLjQ4YzI3MmU2ZjUgMTAwNzU1Cj4+
IC0tLSBhL3N1cHBvcnQvc2NyaXB0cy9nZW5lcmF0ZS1naXRsYWItY2kteW1sCj4+ICsrKyBiL3N1
cHBvcnQvc2NyaXB0cy9nZW5lcmF0ZS1naXRsYWItY2kteW1sCj4+IEBAIC0xMjYsNyArMTI2LDcg
QEAgZ2VuX3Rlc3RzKCkgewo+PiDCoCDCoMKgwqDCoMKgIGlmIFsgLW4gIiR7ZG9fZGVmY29uZmln
c30iIF07IHRoZW4KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGZvciBjZmcgaW4gIiR7ZGVmY29uZmln
c1tAXX0iOyBkbwo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcmludGYgJyVzJXM6IHsgZXh0
ZW5kczogLmRlZmNvbmZpZ18lcyB9XG4nIFwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJp
bnRmICclcyVzOiB7IGV4dGVuZHM6IFsgLmRlZmNvbmZpZ18lcywgLnJ1bm5lci1sYXJnZSBdIH1c
bicgXAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICIke2NmZ30i
ICIke2RlZmNvbmZpZ3NfZXh0fSIgIiR7ZG9fZGVmY29uZmlnc30iCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCBkb25lCj4+IMKgwqDCoMKgwqAgZmkKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
