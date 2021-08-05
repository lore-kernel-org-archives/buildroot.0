Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BA3AC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 15:55:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B19361131
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 15:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B19361131
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 500284036E;
	Thu,  5 Aug 2021 15:55:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qS4dP7jHuGFQ; Thu,  5 Aug 2021 15:55:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87DAE403A8;
	Thu,  5 Aug 2021 15:55:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 055771BF471
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 15:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6CE060767
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 15:55:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FrjRoG4MCuUZ for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 15:55:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1568C6069D
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 15:55:24 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id e19so10362263ejs.9
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 08:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zDSe1YSeGhnsqcqiiHdNmwKCmumfSZa6WfTfBzFpeME=;
 b=aP0L76AZggW0QfLx4HKwEt1N/dZzkqZJYnUEdcTV5cB473Gwi2imBUQ01zr9/QEy5Z
 yKcZ8IfihUk9BZHITnCK3JlvZtRAEAws1lcLKlOMAzCr6mpuHBb3ZxIbHwUk52L3HS4i
 eT9n/MiCigNbL36kFzlsjcvpd0jXn0ogncrWND3P79F924/It3zbE5EtxGIiJNrR2vsQ
 b7gcRc+OanIfqWgSdHFls1TyRVXnF3x9zogqDIHlWtdj/eHh5vy3IFkiyQNTsflSFg/X
 NxzhSgfd6Jq+pRPLBBfX/WaAGy5p3/q4CvGRkagqMrCLuk/qM0aJwCeGN/k9omi219B1
 R3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=zDSe1YSeGhnsqcqiiHdNmwKCmumfSZa6WfTfBzFpeME=;
 b=gO3fmDjjO00AiA4jJcUpwumniXIlhQHfANKLTGTilsN4J1xb9mTX7PNZxHANqVs+mR
 NaSLBZxIx+ZU3k1DHMZJCyq/1F4g0k8q2JHKwlx9e7gUWgXf16eArScP0P/yL936GARO
 RNXNLg5cRVUst1eIkzLTYbUgH5vWEbEuu7hEP0v7hK2m8N/bYaefKfrwwbap8QRtjcOm
 0R/vuBI7fwD6xMoKj1ca+ANpxNEg0w4j3KctyH6CL1aJ41o/dXgl2ed2Lwl1BQ7BkjSP
 jJTi37v59NJGOIFDWgNB/FE2Mtx5reWKDf2fMJLpkw6RRjA9L+BKHyGH5gVTD5UBTNaW
 IDIg==
X-Gm-Message-State: AOAM530zoTrOCy3OOSH1BN9YTRlhiXSNJ1+0XNcCjadw95VqjIl3dVZF
 m8VjPD1d+f/2vAr4OIENSFYvEEW5YheIKDSA3vg=
X-Google-Smtp-Source: ABdhPJwjsdkxIq3a6wO1zvGB/CCAZUAE4slUyaHF/DKucvPQ79C2Ny0jcPsrxBLKyB5YZC1AhGf9yg==
X-Received: by 2002:a17:906:b7d2:: with SMTP id
 fy18mr5669900ejb.0.1628178922923; 
 Thu, 05 Aug 2021 08:55:22 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id fi23sm1813254ejc.83.2021.08.05.08.55.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 08:55:22 -0700 (PDT)
To: Jacques Samoun <jacques.samoun33@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
References: <CACaKL1xhm-6xZFX3Qk27pbZbKiJJ6cN8TMgvhXJnEny5EVri_A@mail.gmail.com>
 <e59ce01b-a6cc-3904-98bd-70418088591d@mind.be>
 <CACaKL1wAxCZptaDqUxWdpx4VZTDisRRsOOvDC76HACjwg44kmA@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <5e535c6f-c555-6e3f-fcd9-21d0aa7e4021@mind.be>
Date: Thu, 5 Aug 2021 17:55:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CACaKL1wAxCZptaDqUxWdpx4VZTDisRRsOOvDC76HACjwg44kmA@mail.gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] Common header files / code between packages
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

IEhpIEphY3F1ZXMsCgogUGxlYXNlIHJlcGx5IHdpdGggdGhlIGxpc3QgaW4gQ2MuIFRoZSBmZWVk
YmFjayBtYXkgYmUgdXNlZnVsIGZvciBvdGhlcnMgYXMgd2VsbC4KCgpPbiAwNS8wOC8yMDIxIDE0
OjQ2LCBKYWNxdWVzIFNhbW91biB3cm90ZToKPiBUaGFua3MgQXJub3V0LAo+IAo+IHRoaXMgc2Vl
bXMgZGVmaW5pdGVseSBhIGJldHRlciB3YXkuwqAKPiAKPiBDYW4gaSBhc2sgYSBzdWJzaWRpYXJ5
wqBvbmU6IHdoYXQgaWYgeW91IHdhbnQgdG8gc2hhcmUgc29tZSBjb2RlIHBhY2thZ2UuCj4gRm9y
IGV4YW1wbGUsIGkgY3JhZnRlZCBhIHNwZWNpYWxpemVkIGJ1ZmZlcnMgcGFja2FnZSAoMSBDIGZp
bGXCoCsgMSBoZWFkZXIgZmlsZSkuCj4gCj4gQm90aCB0aGUgdXNlciBzcGFjZSBwYXJ0IGFuZCB0
aGXCoCBkcml2ZXIgdXNlIHRoaXMgc2FtZSBjb2RlIChhcyB0aGV5IHNoYXJlCj4gYnVmZmVycyBh
bmQgaGFuZGxlIHRoZW0gaW4gYSBjb25zdW1lci9wcm9kdWNlciBtb2RlKS4KPiBNeSBjdXJyZW50
IGFwcHJvYWNoIGlzIGp1c3QgdGhhdCBlYWNoIHBhY2thZ2UgZ2V0cyBhIGNvcHkgb2YgdGhpcyBj
b2RlLCB0aGVuIGl0Cj4gaXMgYnVpbHQuCj4gRG8geW91IGZlZWwgdGhpcyBpcyB0aGUgcmlnaHQg
YXBwcm9hY2ggPwoKIFNoYXJpbmcgY29kZSBiZXR3ZWVuIHBhY2thZ2VzIGlzIG5vcm1hbGx5IGRv
bmUgYnkgbWFraW5nIGl0IGEgbGlicmFyeSBhbmQKaW5zdGFsbGluZyBpdCB0byBTVEFHSU5HX0RJ
Ui4gSG93ZXZlciwgdGhpcyBpcyBub3QgcG9zc2libGUgZm9yIHNoYXJpbmcgY29kZQpiZXR3ZWVu
IHRoZSBrZXJuZWwgKG1vZHVsZSkgYW5kIHVzZXJzcGFjZSwgYmVjYXVzZSB0aGUgY29tcGlsZXIg
b3B0aW9ucyBmb3IKYnVpbGRpbmcgaXQgZm9yIHRoZSBrZXJuZWwgYXJlIGRpZmZlcmVudCBmcm9t
IHRoZSBvbmVzIHVzZWQgZm9yIHVzZXJzcGFjZS4KCiBIb3dldmVyLCB5b3UgY291bGQgY29tcGls
ZSBpdCB0d2ljZSBhcyBwYXJ0IG9mIHRoZSBrZXJuZWwgbW9kdWxlIGJ1aWxkOiBvbmNlIGFzCnBh
cnQgb2YgdGhlIGtlcm5lbCBtb2R1bGUsIGFuZCBvbmNlIG1vcmUgKHByb2JhYmx5IGluIGEgZGlm
ZmVyZW50IE1ha2VmaWxlKSB0bwpjcmVhdGUgdGhlIGxpYnJhcnkuIFRoZW4geW91IGluc3RhbGwg
dGhhdCBsaWJyYXJ5IGFuZCBpdCBjYW4gYmUgdXNlZCBieSB0aGUKdXNlcnNwYWNlIHBhY2thZ2Uu
CgogSXQncyBub3QgZXhhY3RseSB0cml2aWFsIHRvIGRvIHRoaXMgKG5vdCByZWFsbHkgZGlmZmlj
dWx0IGVpdGhlciB0aG91Z2gpLiBTbyBpZgp0aGlzIGlzIGEgcHJpdmF0ZSBwYWNrYWdlLCB5b3Ug
bWF5IGJlIGJldHRlciBvZmYganVzdCBjb3B5aW5nIGl0LCBvciBzaGFyaW5nIGl0CnRocm91Z2gg
ZS5nLiBhIGdpdCBzdWJtb2R1bGUuIE9yIGV2ZW4ganVzdCB1c2luZyBpdCBmcm9tIHRoZSBvdGhl
cidzIGJ1aWxkCmRpcmVjdG9yeSwgbGlrZSB5b3Ugc3VnZ2VzdGVkIGJlZm9yZS4gVWdseSBidXQg
aXQgd29ya3MgOi0pCgogUmVnYXJkcywKIEFybm91dAoKCj4gCj4gSmFjcXVlcwo+IAo+IAo+IE9u
IFRodSwgQXVnIDUsIDIwMjEgYXQgMToxNSBQTSBBcm5vdXQgVmFuZGVjYXBwZWxsZSA8YXJub3V0
QG1pbmQuYmUKPiA8bWFpbHRvOmFybm91dEBtaW5kLmJlPj4gd3JvdGU6Cj4gCj4gCj4gCj4gICAg
IE9uIDA1LzA4LzIwMjEgMDk6MTUsIEphY3F1ZXMgU2Ftb3VuIHdyb3RlOgo+ICAgICA+IEhlbGxv
LAo+ICAgICA+Cj4gICAgID4gbXkgZGV2ZWxvcG1lbnQgY29uc2lzdHMgb2YgYSBrZXJuZWwgZHJp
dmVyIGFuZCBhbiBjb21wYW5pb24gdXNlciBzcGFjZSBsYXllci4KPiAgICAgPiBUaGV5IGFyZSBi
dWlsZCBlYWNoIGluIDIgc2VwYXJhdGUgcGFja2FnZXMuIFVzaW5nIGV4dGVybmFswqB0cmVlIGJ1
aWxkLgo+ICAgICA+Cj4gICAgID4gVGhlIHByb2JsZW0gaXMsIGkgd291bGQgbGlrZSB0byBzaGFy
ZSBzb21lIGluY2x1ZGUgZmlsZXMgYmV0d2VlbiBib3RoCj4gICAgID4gcGFja2FnZcKgKGtlcm5l
bCBkcml2ZXIgYW5kIHVzZXIgc3BhY2UgbGF5ZXIpLgo+ICAgICA+IFNvIGZhciwgaSBzb2x2ZWQg
dGhhdCBieSBhZGRpbmcgYSBjb21tb24gZm9sZGVyIGNvbnRhaW5pbmcgdGhlIGluY2x1ZGUgZmls
ZXMsCj4gICAgID4gYW5kIG1ha2luZyBpdCBwYXJ0IG9mIGVhY2ggcGFja2FnZSwgc28gaXQgYnVp
bGRzIE9LLgo+IAo+ICAgICDCoEkgdGhpbmsgYSBtb3JlIGNvbW1vbiB3YXkgaXMgZm9yIHRoZSBr
ZXJuZWwgbW9kdWxlIHBhY2thZ2UgdG8gYWxzbyBpbnN0YWxsIHRoZQo+ICAgICBzaGFyZWQgaW5j
bHVkZSBmaWxlcyAodG8gJChTVEFHSU5HX0RJUikvdXNyL2luY2x1ZGUvbGludXgpLiBjcnlwdG9k
ZXYtbGludXggaXMKPiAgICAgYW4gZXhhbXBsZSBvZiB0aGF0Lgo+IAo+ICAgICDCoEl0J3MgZXZl
biBwb3NzaWJsZSB0byBtYWtlIHRoZSBrZXJuZWwgbW9kdWxlIHBhY2thZ2UgYnVpbGQgdGhlIGtl
cm5lbCBtb2R1bGUKPiAgICAgb25seSBpZiBhIGtlcm5lbCBpcyBidWlsdCwgYW5kIG1ha2UgaXQg
dG8gaW5zdGFsbCB0aGUgaGVhZGVycyByZWdhcmRsZXNzIG9mCj4gICAgIHdoZXRoZXIgYSBrZXJu
ZWwgaXMgYnVpbHQuIFRoYXQgd2F5LCB5b3UgY2FuIGhhdmUgYSBidWlsZHJvb3QgY29uZmlndXJh
dGlvbiB0aGF0Cj4gICAgIG9ubHkgYnVpbGRzIHRoZSB1c2Vyc3BhY2Ugd2l0aG91dCBrZXJuZWwu
IGZ3dHMgaXMgYW4gZXhhbXBsZSBvZiB0aGF0IChpdCBkb2Vzbid0Cj4gICAgIGluc3RhbGwgaGVh
ZGVycyB0aG91Z2gpLgo+IAo+IAo+IAo+ICAgICA+Cj4gICAgID4gTm93LCBhIHRoaXJkIHBhY2th
Z2UsIHdob3NlIGNvZGUgaXMgY29tcGxldGVseSBvdXRzaWRlIHRoZSBmaXJzdCAyIGlzIHdpbGxp
bmcKPiAgICAgPiBhbHNvIHRvIHVzZSB0aGlzIGluY2x1ZGUgZmlsZS4gVGhlIG9ubHkgd2F5IGkg
Zm91bmQgc28gZmFyLCBpcyB0byBwdXQgZXhwbGljaXQKPiAgICAgPiByZWxhdGl2ZSBwYXRoIHJl
ZmVycmluZyBmcm9tIG9uZSBwYWNrYWdlIHRvIHRoZSBvbmUgb3RoZXIsIGJ1dCB0aGlzIGlzIHVn
bHkuCj4gICAgID4gTW9yZW92ZXIsIHRoZSBwYXRoIGRlcGVuZHMgb24gdGhlIHZlcnNpb24gb2Yg
dGhlIHBhY2thZ2VzLCBzbyBjYW4gYnJlYWsKPiAgICAgZWFzaWx5Lgo+ICAgICA+IFRoZXJlIG11
c3QgYmUgYSBiZXR0ZXIgd2F5IChTVEFHSU5HwqBESVIgPynCoCBidXQgaSBjb3VsZG4ndCBmaW5k
Lgo+IAo+ICAgICDCoEluc3RhbGwgdGhlIGhlYWRlcnMgdG8gJChTVEFHSU5HX0RJUikvdXNyL2lu
Y2x1ZGUvbGludXggKG9yIC91c3IvaW5jbHVkZSBpZgo+ICAgICB0aGF0IGlzIG1vcmUgYXBwcm9w
cmlhdGUpLgo+IAo+IAo+ICAgICDCoFJlZ2FyZHMsCj4gICAgIMKgQXJub3V0Cj4gCj4gICAgID4K
PiAgICAgPiBDYW4gYW55Ym9keSBnaXZlIG1lIGFuIGhpbnQgPwo+ICAgICA+IFRoYW5rcywKPiAg
ICAgPiBKYWNxdWVzCj4gICAgID4KPiAgICAgPgo+ICAgICA+Cj4gICAgID4KPiAgICAgPgo+ICAg
ICA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gICAg
ID4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+ICAgICA+IGJ1aWxkcm9vdEBidXN5Ym94Lm5ldCA8
bWFpbHRvOmJ1aWxkcm9vdEBidXN5Ym94Lm5ldD4KPiAgICAgPiBodHRwOi8vbGlzdHMuYnVzeWJv
eC5uZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiAgICAgPGh0dHA6Ly9saXN0cy5idXN5
Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdD4KPiAgICAgPgo+IApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidXN5Ym94Lm5ldApodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
