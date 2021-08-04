Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8789C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:16:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5101660F94
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5101660F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22CE783BEA;
	Wed,  4 Aug 2021 20:16:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pNrDb6VFk0c0; Wed,  4 Aug 2021 20:16:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67F7683BE3;
	Wed,  4 Aug 2021 20:16:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C4E361BF5DC
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3E7083B88
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:16:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QidDCKqCHfDh for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 20:16:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA3F683B29
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 20:16:54 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id oz16so5543668ejc.7
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 13:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q1dc10vjGtgNHRUPPDh+0frrv28J3DReW1xUeQTvuuE=;
 b=fs2EF/FGMl5kUp9b7q3dnKC2VOwGKF2VLDjorejtNG9uYMKjrHpW/XIqr7cPHId4yc
 ZIBQab21hqhWWZ4mWVOCqLRW5/Da01WkSSReNmtRhVyCn4K62ooCDCRPOipOsV5FxH13
 UGLySi6kxrfaDe6bir40ZWzMqwA/DBt4cETJvrciU6vTJzTpAMJqwwGkUvmCncybSTSB
 Q6PcdH4v3bSLKj1rQFd7kaBUYM4Ilk28xCqZmMU4ORIdLjpQsPk9tGCUPfaT2cEJjzlE
 qZLJIAQE24Yrv1n8CyjYFux2WRbfvLlBKHLtO9jznfD1pCo+BN3ZyTDbVf7NLVzT6BGb
 4oLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Q1dc10vjGtgNHRUPPDh+0frrv28J3DReW1xUeQTvuuE=;
 b=tSj8fW/oz9edN9Lyqt0RjClrpq9a6Nfmqxw2I2IxiA8d/MhOc6dXT3bfT4ZBjVPHXc
 MlaVn0pApuIMz+0gyERbyfSRhUYIoFY1vl/51aOZ4cij1Hkshb6qw8evNrWSFs5ENUBY
 teyt92wqBum5yq/hyx8cP0QAGBVvLiFhaZZF1Ah/5kzdpwxUEqq51rounDk2y37ngnz1
 2mpcHSU32JMWq19Vm61d7KD6RCGrkQCmq/dV4q/KP+L7Tdr6UcY67TY1Vg5MoQhnuald
 QIdpBGcnBnxCk/+QiaYClSplX3kA9Q8guZZ71Nz0RNdP+LT69anMIxiojIyNlAWWOXRN
 CXVA==
X-Gm-Message-State: AOAM532edethSa4HnaENh0pfVeTXFO6QXH69f49Xe24gb7mYAzDldLSl
 BIfVA7sbOHkgBpmk47Ect6+kJo3vlTvxCEYqprA=
X-Google-Smtp-Source: ABdhPJyu2fOoCIxS3aeCDF1ox0MZRNnQR3UoibwBXvaj0ljDxGY07RKK4eItYBgCC387+PcIqK7mVg==
X-Received: by 2002:a17:906:138d:: with SMTP id
 f13mr977918ejc.34.1628108212754; 
 Wed, 04 Aug 2021 13:16:52 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id w6sm1324355edd.22.2021.08.04.13.16.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 13:16:52 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210803135041.4090636-1-fontaine.fabrice@gmail.com>
 <a660a2ce-35b3-6c07-1432-64808fda5002@mind.be>
 <CAPi7W81uM9Trn3vW6gF9QmVo7+8NjN04K5wEo2J9ieHdKOE7GA@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <d21daf51-a3ad-2ca6-d110-0687c9d62d20@mind.be>
Date: Wed, 4 Aug 2021 22:16:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPi7W81uM9Trn3vW6gF9QmVo7+8NjN04K5wEo2J9ieHdKOE7GA@mail.gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/libodb-mysql: fix build with
 gcc 11
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
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

CgpPbiAwMy8wOC8yMDIxIDIzOjU4LCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOgo+IExlIG1hci4g
MyBhb8O7dCAyMDIxIMOgIDIzOjQ1LCBBcm5vdXQgVmFuZGVjYXBwZWxsZSA8YXJub3V0QG1pbmQu
YmU+IGEgw6ljcml0IDoKPj4KPj4KPj4KPj4gT24gMDMvMDgvMjAyMSAxNTo1MCwgRmFicmljZSBG
b250YWluZSB3cm90ZToKPj4+IEZpeGVzOgo+Pj4gIC0gTm8gYXV0b2J1aWxkZXIgZmFpbHVyZXMg
eWV0Cj4+Cj4+ICBUaGF0J3MgZXh0cmVtZWx5IHVubGlrZWx5LCB3aXRoIEphbWVzJ3MgYXV0b2J1
aWxkZXJzIHRoZXJlIHNob3VsZCBiZSBkb3plbnMKPj4gYWxyZWFkeSBhZnRlciBhIHNpbmdsZSBk
YXkuIEFyZSB5b3Ugc3VyZSB0aGF0IHRoZSBidWlsZCBmYWlscyBmb3IgdGhpcyBwYWNrYWdlPwo+
IFllcywgSSdtIHN1cmUsIEkgcmFuIGludG8gdGhpcyBmYWlsdXJlIG9uIG15IGxvY2FsIG1hY2hp
bmUuCj4gVGhlIGF1dG9idWlsZGVycyB3aWxsIHJ1biBpbnRvIGl0IGFmdGVyIGEgZmV3IGRheXMg
bm93IHRoYXQgbGlib2RiIGhhcwo+IGJlZW4gZml4ZWQgbGVzcyB0aGFuIGEgZGF5IGFnbyB3aXRo
Cj4gNjlkMmQxZDkxZTQ0ZDZiYzgwNjkwYjgyODExZDA0NDdlODFlZDMxYi4KCiAuLi4gQW5kIG5v
dyB0aGVyZSBhcmUgYXV0b2J1aWxkIGZhaWx1cmVzLgoKIFNvIEkgYWRkZWQgdGhlbSB0byB0aGUg
Y29tbWl0IG1lc3NhZ2UgYW5kIGFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgogUmVnYXJkcywK
IEFybm91dAoKPj4KPj4gIFNhbWUgZm9yIGxpYm9kYi1ib29zdC4KPj4KPj4gIFdlIGNhbiBsZXQg
dGhpcyBzb2FrIGZvciBhIGZldyBkYXlzIGFuZCBzZWUgaWYgYXV0b2J1aWxkZXIgZmFpbHVyZXMg
dHVybiB1cC4gT3IKPj4geW91IGNhbiBzaW1wbHkgY29weSZwYXN0ZSB0aGUgZXJyb3IgZnJvbSBh
IG1hbnVhbCBidWlsZC4KPj4KPj4gIFJlZ2FyZHMsCj4+ICBBcm5vdXQKPj4KPj4+Cj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4K
Pj4+IC0tLQo+Pj4gIHBhY2thZ2UvbGlib2RiLW15c3FsL2xpYm9kYi1teXNxbC5tayB8IDQgKysr
LQo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4+
Cj4+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJvZGItbXlzcWwvbGlib2RiLW15c3FsLm1rIGIv
cGFja2FnZS9saWJvZGItbXlzcWwvbGlib2RiLW15c3FsLm1rCj4+PiBpbmRleCBhOTA0MGM2NWY4
Li44OGI2ZjRjYjMxIDEwMDY0NAo+Pj4gLS0tIGEvcGFja2FnZS9saWJvZGItbXlzcWwvbGlib2Ri
LW15c3FsLm1rCj4+PiArKysgYi9wYWNrYWdlL2xpYm9kYi1teXNxbC9saWJvZGItbXlzcWwubWsK
Pj4+IEBAIC0xMiw2ICsxMiw4IEBAIExJQk9EQl9NWVNRTF9JTlNUQUxMX1NUQUdJTkcgPSBZRVMK
Pj4+ICBMSUJPREJfTVlTUUxfTElDRU5TRSA9IEdQTC0yLjAKPj4+ICBMSUJPREJfTVlTUUxfTElD
RU5TRV9GSUxFUyA9IExJQ0VOU0UKPj4+ICBMSUJPREJfTVlTUUxfREVQRU5ERU5DSUVTID0gbGli
b2RiIG15c3FsCj4+PiAtTElCT0RCX01ZU1FMX0NPTkZfRU5WID0gTElCUz1gJChTVEFHSU5HX0RJ
UikvdXNyL2Jpbi9teXNxbF9jb25maWcgLS1saWJzYAo+Pj4gK0xJQk9EQl9NWVNRTF9DT05GX0VO
ViA9IFwKPj4+ICsgICAgIENYWEZMQUdTPSIkKFRBUkdFVF9DWFhGTEFHUykgLXN0ZD1jKysxMSIg
XAo+Pj4gKyAgICAgTElCUz1gJChTVEFHSU5HX0RJUikvdXNyL2Jpbi9teXNxbF9jb25maWcgLS1s
aWJzYAo+Pj4KPj4+ICAkKGV2YWwgJChhdXRvdG9vbHMtcGFja2FnZSkpCj4+Pgo+IEJlc3QgUmVn
YXJkcywKPiAKPiBGYWJyaWNlCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0
Cmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
