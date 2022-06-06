Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE777C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 18:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D29240912;
	Mon,  6 Jun 2022 18:01:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U3AjYaknRU-D; Mon,  6 Jun 2022 18:01:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F2BE408B1;
	Mon,  6 Jun 2022 18:01:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 55CC51BF386
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 18:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 533A383EDC
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 18:01:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xfE7pEPXK_po for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 18:01:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 15D5E83EDB
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 18:01:19 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id o10so19861665edi.1
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 11:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=3W0r0qhV5yQ38lnFKLeExTiTru4/UeVsvWskfe3jfdI=;
 b=RwBk0AEYhVd/ySybWq3hkId4DGPo6UJj5j2+aQI6zzFYSq3QtM2kzJIelbWO30/4bc
 6ru9E9+AjWQ3uKOoyS2V2poDSQl+wCqdtbUxoarPTJtVvsyM41ICGzWLJ+/MP9a8VDGb
 RV3nBCZC+oNupPGLxCMZWiK2xbOqJ7CotYz6q0ArPuMtYfrQC6fgE05thSJYDIBvHKDx
 dVQdmm6pZntmUVPqeEN4ICYjzL3Fuy41DHzffDCajyGjHIQJ1tQRuYum86r/+3QZpT97
 w87pOgQSvfxq/WPsadRZ741nEqslVC+mI30306+TONJEqEO4lGeh0YfsDxnKZ1ODhnLn
 1oAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=3W0r0qhV5yQ38lnFKLeExTiTru4/UeVsvWskfe3jfdI=;
 b=V8Jp1GArgXrhr4vteS+aiNU06H8ZUBBV7Q8bvhvQRBlDMTs05CRiEqZfHgOLxfdy/b
 kXqDnK2o0fjGf0LFvSmaW7Gu/egKSambptIb4cw+iwEvhkUW0NTdc3O/hQFPHCxBnJh+
 2OOtKpNlLIKJbG5n1EE0xNn/wf6xpJOHOqiqZNMDODMRxXyF2AhfK2g6UrsUQ3Tn22vl
 EkIxLwNqr3j9+3IUzHHTJEXmsmUJMab/cvzTvvkNQivqHX7WFt6L0QcFmr7eneAYDwJc
 9b4CFHyP0EGedTF/L3wZr8lnEw6WDX04/jg2s18J1R4ZjqKIx21glWEbJbW+kIkzAtzK
 HWcA==
X-Gm-Message-State: AOAM5313DFVQw9EZRqLxprev+D0QtO+huwjJwSMRO4X+2zvjK6fU0cyX
 +aRfjTH8dzVFoodJaceuALQaBQ==
X-Google-Smtp-Source: ABdhPJyOQm7woQI7gUJyqYrxNTraPwxqt0X9hb98lkbYZqR8Kiti1Ku7Vl5l/znKpPM2kNboINyfiA==
X-Received: by 2002:a05:6402:21a:b0:431:5c52:82bb with SMTP id
 t26-20020a056402021a00b004315c5282bbmr7399507edv.70.1654538477941; 
 Mon, 06 Jun 2022 11:01:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ch30-20020a0564021bde00b004314bb65e7fsm3056105edb.41.2022.06.06.11.01.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 11:01:17 -0700 (PDT)
Message-ID: <7d99a90c-2560-7aec-c28a-8e2616108332@mind.be>
Date: Mon, 6 Jun 2022 20:01:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
From: Arnout Vandecappelle <arnout@mind.be>
To: Roger Knecht <rknecht@pm.me>, buildroot@buildroot.org
References: <20220604124523.22056-1-rknecht@pm.me>
 <92da4b94-b41c-c9c0-1ad1-394417374f3a@mind.be>
Organization: Essensium/Mind
In-Reply-To: <92da4b94-b41c-c9c0-1ad1-394417374f3a@mind.be>
Subject: Re: [Buildroot] [PATCH v2] configs/docker_*: add build config for
 docker images
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDA2LzA2LzIwMjIgMTQ6NTAsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+IMKgSGkg
Um9nZXIsCj4KPiBPbiAwNC8wNi8yMDIyIDE0OjQ1LCBSb2dlciBLbmVjaHQgdmlhIGJ1aWxkcm9v
dCB3cm90ZToKPj4gQnVpbGRyb290IGlzIG5vdCBvbmx5IGdyZWF0IHRvIGJ1aWxkIGVtYmVkZGVk
IHN5c3RlbXMgYnV0IGFsc28gdG8KPj4gY3JlYXRlIG1pbmltYWwgZG9ja2VyIGltYWdlcy4gQWRk
aW5nIGEgZGVmYXVsdCBjb25maWd1cmF0aW9uIGZvcgo+PiBkb2NrZXIgaW1hZ2VzIG1ha2VzIGl0
IGVhc2llciB0byB1c2UuCj4KPiDCoFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24uIEhv
d2V2ZXIsIEkgZmVlbCBpdCBhZGRzIGxpdHRsZSB0byBubyB2YWx1ZS4gCj4gVGhlIGRvY2tlciBj
b25maWd1cmF0aW9ucyBhcmUgYWJzb2x1dGVseSB0cml2aWFsLCBhbmQgdGhleSBhbHNvIGRvbid0
IGFkZCBhbnkgCj4gdGVzdGluZyBzdXJmYWNlLiBUaGlzIGNvbXBhcmVkIHRvIG90aGVyIGJvYXJk
cywgd2hpY2ggZmluZCBhIGNvbWJpbmF0aW9uIG9mIAo+IGJvb3Rsb2FkZXIsIGtlcm5lbCBhbmQg
aW1hZ2UgZ2VuZXJhdGlvbiBvcHRpb25zIHRoYXQgYWN0dWFsbHkgd29yaywgYW5kIHdoaWNoIAo+
IGFjdHVhbGx5IGRvZXMgYWRkIHRvIHRoZSB0ZXN0aW5nIHN1cmZhY2Ugc2luY2UgdGhlIGJ1aWxk
IG9mIHRoZSBrZXJuZWwgb3IgCj4gYm9vdGxvYWRlciBzb21ldGltZXMgYnJlYWtzIHdpdGggbmV3
ZXIgdG9vbGNoYWlucyBvciBob3N0IE9TZXMuCj4KPiDCoEkndmUgZGlzY3Vzc2VkIHdpdGggb3Ro
ZXIgbWFpbnRhaW5lcnMsIGFuZCB0aGV5IHNoYXJlIHRoaXMgb3Bpbmlvbi4KPgo+IMKgVGhlcmVm
b3JlLCBJIG1hcmtlZCB0aGUgcGF0Y2ggYXMgQ2hhbmdlcyBSZXF1ZXN0ZWQgaW4gcGF0Y2h3b3Jr
LgoKIMKgQXBvbG9naWVzLCBJIG1lYW50IHRoYXQgSSBtYXJrZWQgaXQgYXMgUmVqZWN0ZWQuCgoK
Pgo+Cj4+Cj4+IEhvdyB0byBidWlsZCBhIERvY2tlciBpbWFnZSB3aXRoIEJ1aWxkcm9vdDoKPj4g
JCBtYWtlIGRvY2tlcl94ODZfNjRfZGVmY29uZmlnCj4+ICQgbWFrZQo+Pgo+PiBDcmVhdGUgYSBE
b2NrZXIgaW1hZ2UgZnJvbSBCdWlsZHJvb3Qgcm9vdGZzOgo+PiAkIGRvY2tlciBpbWFnZSBpbXBv
cnQgb3V0cHV0L2ltYWdlcy9yb290ZnMudGFyIGJ1aWxkcm9vdC1pbWFnZTpsYXRlc3QKPj4KPj4g
UnVuIERvY2tlciBjb250YWluZXI6Cj4+ICQgZG9ja2VyIHJ1biAtLXJtIC1pdCBidWlsZHJvb3Qt
aW1hZ2U6bGF0ZXN0IC9iaW4vc2gKPgo+IMKgVGhpcyBwYXJ0IHNob3VsZCBiZSBpbiBhIFJFQURN
RSBmaWxlIChib2FyZC9kb2NrZXIvcmVhZG1lLnR4dCkuCgogwqBJIGFkZGVkIHRoaXMgY29tbWVu
dCBmb3IgYWR2aXNlIGluIGNhc2UgeW91IHdvdWxkIHN1Ym1pdCBvdGhlciBjb250cmlidXRpb25z
IApvZiBkZWZjb25maWdzLgoKCiDCoFJlZ2FyZHMsCiDCoEFybm91dAoKCj4KPiDCoFJlZ2FyZHMs
Cj4gwqBBcm5vdXQKPgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBLbmVjaHQgPHJrbmVjaHRA
cG0ubWU+Cj4+IC0tLQo+PiB2MjoKPj4gwqAgLSBBZGRlZCBEb2NrZXIgZGVmY29uZmlnIGZvciBB
Uk0oNjQpCj4+Cj4+IMKgIERFVkVMT1BFUlPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8IDMgKysrCj4+IMKgIGNvbmZpZ3MvZG9ja2VyX2FhcmNoNjRfZGVmY29u
ZmlnIHwgOCArKysrKysrKwo+PiDCoCBjb25maWdzL2RvY2tlcl9hcm1fZGVmY29uZmlnwqDCoMKg
wqAgfCA4ICsrKysrKysrCj4+IMKgIGNvbmZpZ3MvZG9ja2VyX3g4Nl82NF9kZWZjb25maWfCoCB8
IDggKysrKysrKysKPj4gwqAgY29uZmlncy9kb2NrZXJfeDg2X2RlZmNvbmZpZ8KgwqDCoMKgIHwg
OSArKysrKysrKysKPj4gwqAgNSBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspCj4+IMKg
IGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25maWdzL2RvY2tlcl9hYXJjaDY0X2RlZmNvbmZpZwo+PiDC
oCBjcmVhdGUgbW9kZSAxMDA2NDQgY29uZmlncy9kb2NrZXJfYXJtX2RlZmNvbmZpZwo+PiDCoCBj
cmVhdGUgbW9kZSAxMDA2NDQgY29uZmlncy9kb2NrZXJfeDg2XzY0X2RlZmNvbmZpZwo+PiDCoCBj
cmVhdGUgbW9kZSAxMDA2NDQgY29uZmlncy9kb2NrZXJfeDg2X2RlZmNvbmZpZwo+Pgo+PiBkaWZm
IC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKPj4gaW5kZXggYzMzOTU5ZmE0NS4uZWQ0
Njg2N2FmYSAxMDA2NDQKPj4gLS0tIGEvREVWRUxPUEVSUwo+PiArKysgYi9ERVZFTE9QRVJTCj4+
IEBAIC0yNDc0LDYgKzI0NzQsOSBAQCBGOsKgwqDCoCBwYWNrYWdlL2Nob2NvbGF0ZS1kb29tLwo+
PiDCoCBGOsKgwqDCoCBwYWNrYWdlL2lyc3NpLwo+PiDCoCBGOsKgwqDCoCBwYWNrYWdlL3Zuc3Rh
dC8KPj4KPj4gK046wqDCoMKgIFJvZ2VyIEtuZWNodCA8cmtuZWNodEBwbS5tZT4KPj4gK0Y6wqDC
oMKgIGNvbmZpZ3MvZG9ja2VyXyoKPj4gKwo+PiDCoCBOOsKgwqDCoCBSb21haW4gTmFvdXIgPHJv
bWFpbi5uYW91ckBnbWFpbC5jb20+Cj4+IMKgIEY6wqDCoMKgIGJvYXJkL3FlbXUvCj4+IMKgIEY6
wqDCoMKgIGNvbmZpZ3MvcWVtdV8qCj4+IGRpZmYgLS1naXQgYS9jb25maWdzL2RvY2tlcl9hYXJj
aDY0X2RlZmNvbmZpZyBiL2NvbmZpZ3MvZG9ja2VyX2FhcmNoNjRfZGVmY29uZmlnCj4+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAuLjMzNTc3MTkwYzUKPj4gLS0tIC9k
ZXYvbnVsbAo+PiArKysgYi9jb25maWdzL2RvY2tlcl9hYXJjaDY0X2RlZmNvbmZpZwo+PiBAQCAt
MCwwICsxLDggQEAKPj4gKyMgQXJjaGl0ZWN0dXJlCj4+ICtCUjJfYWFyY2g2ND15Cj4+ICsKPj4g
KyMgRmlsZXN5c3RlbQo+PiArQlIyX1RBUkdFVF9ST09URlNfVEFSPXkKPj4gKwo+PiArIyBJbml0
Cj4+ICtCUjJfSU5JVF9OT05FPXkKPj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3MvZG9ja2VyX2FybV9k
ZWZjb25maWcgYi9jb25maWdzL2RvY2tlcl9hcm1fZGVmY29uZmlnCj4+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAuLmUxNzg5MmZkZjQKPj4gLS0tIC9kZXYvbnVsbAo+
PiArKysgYi9jb25maWdzL2RvY2tlcl9hcm1fZGVmY29uZmlnCj4+IEBAIC0wLDAgKzEsOCBAQAo+
PiArIyBBcmNoaXRlY3R1cmUKPj4gK0JSMl9hcm09eQo+PiArCj4+ICsjIEZpbGVzeXN0ZW0KPj4g
K0JSMl9UQVJHRVRfUk9PVEZTX1RBUj15Cj4+ICsKPj4gKyMgSW5pdAo+PiArQlIyX0lOSVRfTk9O
RT15Cj4+IGRpZmYgLS1naXQgYS9jb25maWdzL2RvY2tlcl94ODZfNjRfZGVmY29uZmlnIGIvY29u
Zmlncy9kb2NrZXJfeDg2XzY0X2RlZmNvbmZpZwo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBp
bmRleCAwMDAwMDAwMDAwLi5lNTcxZTgxNjJhCj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvY29u
Zmlncy9kb2NrZXJfeDg2XzY0X2RlZmNvbmZpZwo+PiBAQCAtMCwwICsxLDggQEAKPj4gKyMgQXJj
aGl0ZWN0dXJlCj4+ICtCUjJfeDg2XzY0PXkKPj4gKwo+PiArIyBGaWxlc3lzdGVtCj4+ICtCUjJf
VEFSR0VUX1JPT1RGU19UQVI9eQo+PiArCj4+ICsjIEluaXQKPj4gK0JSMl9JTklUX05PTkU9eQo+
PiBkaWZmIC0tZ2l0IGEvY29uZmlncy9kb2NrZXJfeDg2X2RlZmNvbmZpZyBiL2NvbmZpZ3MvZG9j
a2VyX3g4Nl9kZWZjb25maWcKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAw
MDAwMC4uMzNiYjI1YTMwOQo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL2NvbmZpZ3MvZG9ja2Vy
X3g4Nl9kZWZjb25maWcKPj4gQEAgLTAsMCArMSw5IEBACj4+ICsjIEFyY2hpdGVjdHVyZQo+PiAr
QlIyX2kzODY9eQo+PiArQlIyX3g4Nl9pNjg2PXkKPj4gKwo+PiArIyBGaWxlc3lzdGVtCj4+ICtC
UjJfVEFSR0VUX1JPT1RGU19UQVI9eQo+PiArCj4+ICsjIEluaXQKPj4gK0JSMl9JTklUX05PTkU9
eQo+PiAtLSAKPj4gMi4xNy4xCj4+Cj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPj4gYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
