Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACFB8C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 15:31:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 110A9610E5
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 15:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 110A9610E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCBAE40311;
	Sun, 17 Oct 2021 15:31:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a5npYrAkCtUU; Sun, 17 Oct 2021 15:31:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28FA0402B7;
	Sun, 17 Oct 2021 15:31:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 442A81BF2F4
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 15:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 324D881D02
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 15:31:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HSsdZaedXmIk for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 15:31:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D09C181CE9
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 15:31:37 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id a25so60352811edx.8
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 08:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=2lWGYxi0/ga0KD3girDb7oDRraLReSIxrgqu2FIq6gU=;
 b=aFlVV7wWLST3H14WOB6fbVaKdP03SUG9F2oPE4Qz1B/NyKfDgRXzhr/cKmNOglyhFg
 3SHR1CE9vIyezInEcRPOv+7IHZl84tDXN0mE25X48zqmAoxwvd1r5MnxOeAeIi1Sw9HU
 pNX6fdRD0txlJgKaiNz1jT+Al3AGg4VviPzEAH8y46AXCAMlrwCjEddNr0u5gNAqmPmz
 btBa9NpkQa/Y3leb3hlSIlQ/FmWl1FAsdRMUH4WIKGXbnNek5VZfjVphFAk9VqFRkdsW
 gy8JvbgNU1F/qRSa3koxSLWg+USvHlZWaDcPBxfEUKXxyuLWx05a8hBDxWxOPqN9/Ue8
 j0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=2lWGYxi0/ga0KD3girDb7oDRraLReSIxrgqu2FIq6gU=;
 b=CMnxvoHEQSzAUdnYL/gFP4CiK7fsR76KRNrhpw2wK+WyLzcjN98gbhKd2TIfHIIaov
 t7yrSz8VDTH10ucHaAOyxL8j2+IIcLlV+f5OvyxsueflXSVs/VHwaBYnXtJyhSgxpPxK
 vrRQzi2k86cLMrYVD1+OLxuubPu4XvjjHx2mo0oFRzy+t8IeXzl/okUVR7yd0WebQBc1
 cRoAUBH8uYdcpTuliJQW+CHDRMJmphscm5jBZJpPSCl33RdJroFRppcXiV6ZjWPTQHEi
 fRKWKKlYCNrpbaWVGGiv8IMsj+GUICsM3TRI1WNpu2kjTi5b7ErOQ5L+JZ4q2dBX5Amj
 DfTg==
X-Gm-Message-State: AOAM530+gf+DLWQLPL7PHC9S3WDSyqet40xlDBm+x7p/sbW7qzi5xsiy
 YFa/76skySh1huwKmgiIcARcyQ==
X-Google-Smtp-Source: ABdhPJxPFSYdkXMWW4wWhp9oS04TcWnwJeJabvrFVxmA3QQ+PK1H0KR4bPvOR4QbDOPRqb2FFw1szQ==
X-Received: by 2002:a17:906:1d41:: with SMTP id
 o1mr23614954ejh.232.1634484695848; 
 Sun, 17 Oct 2021 08:31:35 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d1sm8255638edk.11.2021.10.17.08.31.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Oct 2021 08:31:35 -0700 (PDT)
Message-ID: <38990ac3-bc82-ffb7-0d19-270cd1f4f4ff@mind.be>
Date: Sun, 17 Oct 2021 17:31:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: hello rabit <hello.rabit12345@gmail.com>, buildroot@buildroot.org
References: <CA+hB-jRy--iZhTqK-bDeM4wuNfVbs7dCnpTPAL8bmpOgbjPv=Q@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CA+hB-jRy--iZhTqK-bDeM4wuNfVbs7dCnpTPAL8bmpOgbjPv=Q@mail.gmail.com>
Subject: Re: [Buildroot] MakeFile Error
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ICBIaSBIZWxsbywKCk9uIDE3LzEwLzIwMjEgMTY6MzMsIGhlbGxvIHJhYml0IHdyb3RlOgo+IEhl
bGxvLAo+IAo+IEkganVzdCBtZXJnZWQgbXkgcmVtb3RlIG9yaWdpbiB3aXRoIGJ1aWxkcm9vdCB1
cHN0cmVhbSBhbmQgYWZ0ZXIgdGhhdCBJIGFtIG5vdCAKPiBhYmxlIHRvIHdvcmsgd2l0aCBteSBi
dWlsZHJvb3QgcHJvamVjdC4gUGxlYXNlIHJlZmVyIHRoZSBmb2xsb3dpbmdzOgo+IAo+IF9Db21t
YW5kOl8gKm1ha2UgTz0uLi88ZGlyZWN0b3J5PiB4eXpfZGVmY29uZmlnKgo+IF9FcnJvcjpfICpN
YWtlZmlsZTo5NTogKioqIG1pc3Npbmcgc2VwYXJhdG9yLsKgIFN0b3AuKgo+ICptYWtlOiAqKiog
W01ha2VmaWxlOjg0OiBfYWxsXSBFcnJvciAyKgo+ICoKPiAqCj4gX1BhcnQgb2bCoCBteSBNYWtl
ZmlsZTpfCj4gKjgwICQoTUFLRUNNREdPQUxTKTogX2FsbAo+ICDCoCA4MSDCoCDCoCDCoCDCoCBA
Ogo+ICDCoCA4Mgo+ICDCoCA4MyBfYWxsOgo+ICDCoCA4NCDCoCDCoCDCoCDCoCBAdW1hc2sgJChS
RVFfVU1BU0spICYmIFwKPiAgwqAgODUgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJChNQUtFKSAt
QyAkKENBTk9OSUNBTF9DVVJESVIpIC0tbm8tcHJpbnQtZGlyZWN0b3J5IFwKPiAgwqAgODYgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJChNQUtFQ01ER09BTFMpICQoRVhUUkFN
QUtFQVJHUykKPiAgwqAgODcKPiAgwqAgODggZWxzZSAjIHVtYXNrIC8gJChDVVJESVIpIC8gJChP
KQo+ICDCoCA4OQo+ICDCoCA5MCAjIFRoaXMgaXMgb3VyIGRlZmF1bHQgcnVsZSwgc28gbXVzdCBj
b21lIGZpcnN0Cj4gIMKgIDkxIGFsbDoqCj4gKjkyIC5QSE9OWTogYWxsCj4gIMKgIDkzCj4gIMKg
IDk0ICMgU2V0IGFuZCBleHBvcnQgdGhlIHZlcnNpb24gc3RyaW5nCj4gIMKgIDk1IDw8PDw8PDwg
SEVBRAo+ICDCoCA5NiBleHBvcnQgQlIyX1ZFUlNJT04gOj0gMjAyMC4wOC4xCj4gIMKgIDk3ICMg
QWN0dWFsIHRpbWUgdGhlIHJlbGVhc2UgaXMgY3V0IChmb3IgcmVwcm9kdWNpYmxlIGJ1aWxkcykK
PiAgwqAgOTggQlIyX1ZFUlNJT05fRVBPQ0ggPSAxNjAyNTA3MDAwCj4gIMKgIDk5ID09PT09PT0K
PiAgwqAxMDAgZXhwb3J0IEJSMl9WRVJTSU9OIDo9IDIwMjEuMTEtZ2l0Cj4gIMKgMTAxICMgQWN0
dWFsIHRpbWUgdGhlIHJlbGVhc2UgaXMgY3V0IChmb3IgcmVwcm9kdWNpYmxlIGJ1aWxkcykKPiAg
wqAxMDIgQlIyX1ZFUlNJT05fRVBPQ0ggPSAxNjMwNzQ5MDAwCj4gIMKgMTAzID4+Pj4+Pj4gdXBz
dHJlYW0vbWFzdGVyCgogIFRoaXMgaXMgYSBtZXJnZSBjb25mbGljdC4gWW91IGF0dGVtcHRlZCB0
byBtZXJnZSB0aGUgbWFzdGVyIGJyYW5jaCB3aXRoIHRoZSAKMjAyMC4wOC4xIHRhZy4KCiAgSWYg
eW91IGhhdmVuJ3QgbWFkZSBhbnkgY2hhbmdlcyB5b3Vyc2VsZiwgeW91IGNhbiBqdXN0IGRvICJn
aXQgcmVzZXQgLS1oYXJkIApvcmlnaW4vbWFzdGVyIi4KCiAgSWYgeW91IGRpZCBtYWtlIGNoYW5n
ZXMgdGhhdCB5b3Ugd2FudCB0byBrZWVwLCB5b3UgaGF2ZSB0byByZXNvbHZlIHRoZSBtZXJnZSAK
Y29uZmxpY3RzLiBJZiB5b3UgaGF2ZW4ndCB5ZXQgY29tbWl0dGVkIHRoZSBjb25mbGljdHMsIHlv
dSBjYW4gc2ltcGx5IGRvICJnaXQgCnN0YXR1cyIgdG8gc2VlIHdoaWNoIGZpbGVzIGhhdmUgY29u
ZmxpY3RzLCB0aGVuIGVkaXQgdGhlbSBhbmQgcmVzb2x2ZSB0aGUgCmNvbmZsaXRzLCBhbmQgZmlu
YWxseSAiZ2l0IGFkZCAtdTsgZ2l0IGNvbW1pdCIuIEJ1dCBpZiB5b3Ugd2FudCB0byBkbyB0aGlz
LCB5b3UgCnByb2JhYmx5IG5lZWQgdG8gZG8gYSBiaXQgb2YgZ2l0IHRyYWluaW5nLgoKCgo+IEZ1
cnRoZXJtb3JlLCBJIHRyaWVkIHRvIHJlZ2lzdGVyIG15c2VsZiB3aXRoIE9GVEMgdG8gYWNjZXNz
IHRoZSBJUkMgY2hhbm5lbC4gQnV0IAo+IEkgY291bGQgbm90IGZpZ3VyZcKgb3V0IGhvdyB0byBy
ZWdpc3Rlci4KCiAgaHR0cHM6Ly93d3cub2Z0Yy5uZXQvU2VydmljZXMvCgoKICBSZWdhcmRzLAog
IEFybm91dAoKCj4gCj4gSSB2ZXJ5IGtpbmRseSByZXF1ZXN0IHlvdSB0byBwcm92aWRlIG1lIHdp
dGggdGhlIHJlcXVpcmVkIHN1cHBvcnQgKEkgYW0gbm90IGFuIAo+IGV4cGVydCBhbmQgc3RpbGwg
bGVhcm5pbmcpIGFuZMKgd2lzaCB5b3XCoGEgZ3JlYXQgZGF5IGFoZWFkIQo+IAo+IFRoYW5rc8Kg
YW5kIFJlZ2FyZHMuCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
