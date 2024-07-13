Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDADC3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 14:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FBAE405EF;
	Sat, 13 Jul 2024 14:41:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mTenyKeRYiCD; Sat, 13 Jul 2024 14:41:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E7A24068B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E7A24068B;
	Sat, 13 Jul 2024 14:41:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0C0821BF41B
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB7BC4068B
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:41:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t7yC3aBjzyF4 for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 14:41:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3C79A405EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C79A405EF
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C79A405EF
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:41:07 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-36799fb93baso1613403f8f.0
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 07:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720881665; x=1721486465;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H/Dex/KxrQ93/ns4xmqFxq9Izc7j7iRaqzBjNKU4Ng0=;
 b=M0bQWOszAnb9LL5jHY65/7eU4XP7Ck5Lxqi6Ij8+5glL8AtEA9mMq7C5f57OW20Nsy
 XFU/nx5/+UkfRsC8JxTTR6Gr89nEcsRROUaYgwR8WhbUhNYDvwahDsVRu1ivpK7RHpXN
 mT5cysOIaioelmKiKh6O4R6kx5hRqtBUSyDYdaotUyMjOnanMIt6AqCR6xnAfuRWwKW2
 e1i29tmQWNVjCjULDdCknh4WpwzMLRc2lZRYEz+n8eE8DiywdQJXSIH80YSIHJt0cCvO
 BdBbU2huAgm9XYedvUClJP2rWBgPEoqKaACWpXhAB9ZU9QWAF4WI+slutrQgVADtOjWb
 9S+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXExnujxQblDr2Y4nsEeG9WDUVG6OOJ8oHwnQmvfPBjn0vNg6sBdjb75HXTazn3IU2M8+qi4M8/P0Fi89E5mdasPI6mlatUw==
X-Gm-Message-State: AOJu0Yzm8cy8bpTdzRmrLDtq7h9wYHV5kpBZG9omgCkevHRIwMH1Ngjb
 Qm2MlghUo5d3sOemZnPZd/JIvyugKMbiRfDNqVn1vGbPBZL4IFys6szqXtf662eRwhrACYRQXb4
 mQNs=
X-Google-Smtp-Source: AGHT+IGdcC+PKdspUbxyJNLFo3oNRFcMe6qxbQtXWpfDVvhRO+XnlgQjIhb+jQMnUdgBp+WElHz5aQ==
X-Received: by 2002:a05:6000:bcb:b0:367:8120:73ea with SMTP id
 ffacd0b85a97d-367ceadc95fmr8524593f8f.67.1720881664923; 
 Sat, 13 Jul 2024 07:41:04 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:f9c8:f443:ffd:1bed?
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680db04731sm1554524f8f.112.2024.07.13.07.41.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Jul 2024 07:41:04 -0700 (PDT)
Message-ID: <5353f029-3242-494c-9bb5-697ed6a33004@smile.fr>
Date: Sat, 13 Jul 2024 16:41:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Artur Rojek <contact@artur-rojek.eu>, buildroot@buildroot.org
References: <20240504195407.1409466-1-contact@artur-rojek.eu>
 <937192bf-d334-4bab-8cf3-95f91551984b@smile.fr>
 <77440104c6241b07805b375493b8f3004f3e567b.camel@physik.fu-berlin.de>
Content-Language: en-US
In-Reply-To: <77440104c6241b07805b375493b8f3004f3e567b.camel@physik.fu-berlin.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720881665; x=1721486465; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H/Dex/KxrQ93/ns4xmqFxq9Izc7j7iRaqzBjNKU4Ng0=;
 b=BdC6fhhEutvVSuP9OMiwsL8VwWh3kfOhy7SyyvoQobVTm6TSyKIefE3tWsw4bWXqao
 95gqlHbB4cfNFw9m+qYUFspYotwEgA4WcaK4d8pPO+hCpgCXnxcTmj3Oxz2JykxlpBKl
 lwT+1VDYNI+noNPaMzmNQswmg7ncG9owN848w=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=BdC6fhhE
Subject: Re: [Buildroot] [PATCH 0/4] Reintroduce SH3 support
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Paul Cercueil <paul@crapouillou.net>, Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSm9obiwgQWxsLAoKTGUgMTMvMDcvMjAyNCDDoCAxMDowNiwgSm9obiBQYXVsIEFkcmlh
biBHbGF1Yml0eiBhIMOpY3JpdMKgOgo+IEhpIFJvbWFpbiwKPiAKPiBPbiBGcmksIDIwMjQtMDct
MTIgYXQgMTc6MDkgKzAyMDAsIFJvbWFpbiBOYW91ciB3cm90ZToKPj4gSGVsbG8gQXJ0dXIsIEFs
bCwKPj4KPj4gTGUgMDQvMDUvMjAyNCDDoCAyMTo1NCwgQXJ0dXIgUm9qZWsgYSDDqWNyaXTCoDoK
Pj4+IFtSZXNlbmRpbmcgdGhpcywgYXMgdGhlIHNlcmllcyBnb3QgYm91bmNlZCBkdWUgdG8gbm90
IGJlaW5nIHN1YnNjcmliZWRdCj4+Pgo+Pj4gSGkgYWxsLAo+Pj4KPj4+IHRoaXMgc2VyaWVzIHJl
c3RvcmVzIHN1cHBvcnQgZm9yIHRoZSBTSDMgdmFyaWFudCBvZiB0aGUgU3VwZXJIIElTQSwKPj4+
IG9yaWdpbmFsbHkgcmVtb3ZlZCBpbiBlNTQzZjVhMTA0ODguIAo+Pgo+PiBJdCB3YXMgcmVtb3Zl
ZCAxMCB5ZWFycyBhZ28uCj4gCj4gVGltZSBmbGllcyA7LSkuCj4gCj4+Pgo+Pj4gVGhpcyBwYXRj
aCBzZXQgaGFzIGJlZW4gdGVzdGVkIG9uIEhQIEpvcm5hZGEgNjgwLCBhcyBwYXJ0IG9mIGEgbGFy
Z2VyCj4+PiBlZmZvcnQgdG8gZml4IGFuZCBpbXByb3ZlIHN1cHBvcnQgZm9yIHRoZSBTSDMgYXJj
aGl0ZWN0dXJlIGluIHRoZSBMaW51eAo+Pj4ga2VybmVsLgo+Pgo+PiBJcyB0aGVyZSBhbnkgYW5u
b3VuY2UgYWJvdXQgdGhpcyBlZmZvcnQ/IEhvdyBtYW55IGNvbnRyaWJ1dGlvbiB3YXMgZG9uZSBy
ZWNlbnRseQo+PiBvbiBzaDM/Cj4gCj4gSSBoYXZlIHJlY2VudGx5IHBpY2tlZCB1cCBtYWludGVu
YW5jZSBmb3IgU3VwZXJIIGluIHRoZSBMaW51eCBrZXJuZWwgc28gdGhhdCB0aGUKPiBhcmNoaXRl
Y3R1cmUgaXMgdW5kZXIgYWN0aXZlIGRldmVsb3BtZW50IGFnYWluOgo+IAo+PiBodHRwczovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9nbGF1Yml0ei9zaC1saW51eC5n
aXQvCj4gCj4gSW4gcGFydGljdWxhciwgQXJ0dXIgaGFzIG1hZGUgY29udHJpYnV0aW9ucyB0byB0
aGUgTGludXgga2VybmVsIHRvIGdldCBpdCB3b3JraW5nCj4gb24gdGhlIEpvdXJuYWRhIDY4MCBh
Z2FpbjoKPiAKPj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvdG9ydmFsZHMvbGludXguZ2l0L2xvZy8/cXQ9YXV0aG9yJnE9QXJ0dXIrUm9qZWsKPiAKPiBU
aGVyZSBpcyBhbHNvIGEgbGFyZ2UgaG9tZWJyZXcgY29tbXVuaXR5IGFyb3VuZCB0aGUgU2VnYSBE
cmVhbWNhc3Qgd2hpY2ggc3VwcG9ydHMKPiBTdXBlckg6Cj4gCj4+IGh0dHBzOi8vZGNlbXVsYXRp
b24ub3JnCj4gCj4+IFdlIGFyZSBub3Qgc3VyZSBpdCB3b3J0aCB0aGUgZWZmb3J0Lgo+IAo+IEkg
dGhpbmsgdGhlIGNoYW5nZXMgYXJlIHZlcnkgbWluaW1hbCwgc28gSSB3b3VsZG4ndCByZWFsbHkg
Y29uc2lkZXJzIHRoaXMgYXMgImVmZm9ydCIuCj4gCj4+PiBGb3IgdGhlIGludGVyZXN0ZWQsIGJv
dGggbXVzbCBhbmQgdUNsaWJjLW5nIGhhcyBiZWVuIHRlc3RlZCwgYXMgd2VsbCBhcwo+Pj4gZ2Nj
IGluIHZlcnNpb25zIDExLngsIDEyLngsIGFuZCAxMy54LCB3aXRoIGEgcmFuZ2Ugb2YgY29tbWFu
ZCBsaW5lCj4+PiB0b29scywgY29uc3RpdHV0aW5nIGEgYmFzaWMsIHlldCBxdWl0ZSBmdW5jdGlv
bmFsIHJvb3Rmcy4KPj4KPj4gQXQgbGVhc3QgeW91IHNob3VsZCBhZGQgeW91IGluIHRoZSBERVZF
TE9QRVJTIGZpbGUgZm9yIFNIMyBhbmQgcHJvdmlkZSBhCj4+IGRlZmNvbmZpZyB0byBidWlsZCBh
IHJvb3RmcyB1c2luZyB0aGlzIGFyY2hpdGVjdHVyZS4gKGEgcWVtdSBydW50aW1lIHRlc3RpbmcK
Pj4gd291bGQgYmUgZXZlbiBiZXR0ZXIpLgo+IAo+IFNvdW5kcyBnb29kLgo+IAo+PiBQYXRjaCBy
ZWplY3RlZCBpbiBQYXRjaHdvcmsuCj4gCj4gT0ssIGJ1dCBob3BlZnVsbHkgYWNjZXB0ZWQgYWZ0
ZXIgdGhlIHN1Z2dlc3RlZCBjaGFuZ2VzIDstKS4KCldpdGggb3RoZXIgQnVpbGRyb290IG1haW50
YWluZXJzIChUaG9tYXMgYW5kIEFybm91dCksIHdlIGFyZSBhZ3JlZSB0bwpyZWludHJvZHVjZSBz
aDMgYXJjaGl0ZWN0dXJlIGlmIHdlIGhhdmUgYSBkZWZjb25maWcgKHByZWZlcmFibHkgcWVtdSBm
b3IgcnVudGltZQp0ZXN0aW5nKSBhbmQgc29tZW9uZSBsaXN0ZWQgaW4gREVWRUxPUEVSUyBmaWxl
IGhlbHBpbmcgZml4aW5nIHNoMyByZWxhdGVkIGlzc3VlCmFuZCBxdWVzdGlvbi4KCkJlc3QgcmVn
YXJkcywKUm9tYWluCgoKPiAKPiBBZHJpYW4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
