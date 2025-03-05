Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6813C19F32
	for <buildroot@archiver.kernel.org>; Wed,  5 Mar 2025 21:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70EF040563;
	Wed,  5 Mar 2025 21:05:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IGBP1m3MZXhE; Wed,  5 Mar 2025 21:05:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A3E540644
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A3E540644;
	Wed,  5 Mar 2025 21:05:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 63B2A95F
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 21:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47C0160EC1
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 21:05:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hfXhTAfoi0ts for <buildroot@buildroot.org>;
 Wed,  5 Mar 2025 21:05:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1927560BF9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1927560BF9
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1927560BF9
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 21:05:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id D9CE119F59C;
 Wed,  5 Mar 2025 22:05:26 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 05 Mar 2025 22:05:26 +0100
MIME-Version: 1.0
Date: Wed, 05 Mar 2025 22:05:26 +0100
From: Julien Olivain <ju.o@free.fr>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Cc: Buildroot development <buildroot@buildroot.org>
In-Reply-To: <310eae0e-6e47-45a9-a35a-184211d1dcbe@grenoble.cnrs.fr>
References: <310eae0e-6e47-45a9-a35a-184211d1dcbe@grenoble.cnrs.fr>
User-Agent: Webmail Free/1.6.10
Message-ID: <fca5f92a41186df235bcf35c7722f18f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741208728;
 bh=4dtBv2JfbPf1WpjXw5eTf2om2RYwLqS9ILXKSUGC4r4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=myEEdPUoE6Ets8DeTGjYMfe5dNTCVgYJTU2V3g4Ms+uBAn3ghU+RApdPvuehCCfIb
 8jZO8WWgPpFeWWM8mOgeL2N/WSIxoFfHxvj83FJPN6W+AmulpCpFFVx4ycPrFh+muU
 g5kzK846UGQjCJ6X9U9jXGh5aNOSmmepCUXwEtJnYuXUGMEPSH61PizLn2JRCKLeV2
 jpw1cMkin2iuHCFxve5gmfyx4veKSorVXquol9zQc+gUuDbUJWiM0EK/cRzxrgRAqY
 5pIpefoRA+NvzWd7W6Cgr4o5sI41Xs7cc2dyPdz0G0I6qhtXnBa8ROUhvhMnPhfaRy
 RbzcFVkT6P1AQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=myEEdPUo
Subject: Re: [Buildroot] [PATCH 0/2] Bump Acqua boards to Linux 6.12.17
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRWRnYXIsCgpPbiAwMS8wMy8yMDI1IDIyOjQ1LCBFZGdhciBCb25ldCB3cm90ZToKPiBIZWxs
byBhbGwhCj4gCj4gVGhpcyBzZXJpZXMgYnVtcHMgdGhlIExpbnV4IGtlcm5lbCBvZiB0aGUgQWNx
dWEgQTUgYm9hcmRzIHRvIDYuMTIuMTcuCj4gVGhlIGZpcnN0IHBhdGNoIHR1cm5zIHRoZSBjdXN0
b20gRFRTIGZpbGUgaW50byBhIGtlcm5lbCBwYXRjaC4gSXQgaXMKPiBuZWVkZWQgYmVjYXVzZSBC
UjJfTElOVVhfS0VSTkVMX0NVU1RPTV9EVFNfUEFUSCBkb2VzIG5vdCB3b3JrIG9uIEFSTQo+IHdp
dGgga2VybmVscyDiiaUgNi4xMlsxXS4gV291bGQgaXQgYmUgcG9zc2libGUgdG8gbWVyZ2UgdGhp
cyBzZXJpZXMgaW50bwo+IG1hc3RlciByYXRoZXIgdGhhbiBuZXh0IHBsZWFzZT8KCkZvciB5b3Vy
IGluZm9ybWF0aW9uLCBJIG1lcmdlZCB0aGUgc2VyaWVzOgpodHRwczovL3BhdGNod29yay5vemxh
YnMub3JnL3Byb2plY3QvYnVpbGRyb290L2xpc3QvP3Nlcmllcz00NDU1ODImc3RhdGU9KgppbnRv
IG1hc3Rlci4KClNvIHRoZSBidW1wcyBpbiB0aGlzIHNlcmllcyBjYW4gYmUgcG9zdHBvbmVkIGFm
dGVyIHRoZSByZWxlYXNlCih1bmxlc3MgdGhlcmUgaXMgc29tZXRoaW5nIGVsc2UgdG8gZml4KS4K
Cj4gSSBrbm93IGl0IGlzIHByZWZlcmFibGUgdG8gc2VuZCB2ZXJzaW9uIGJ1bXBzIHByaW9yIHRv
IHRoZSByZWxlYXNlIG9mCj4gdGhlIC1yYzEuIFRoZSByZWFzb24gSSB3YWl0ZWQgaXMgYmVjYXVz
ZSBJIHdhcyBob3BpbmcgdGhhdCB0aGUKPiBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9EVFNfRElS
IHBhdGNoIHNlcmllc1syXSB3b3VsZCBiZSBtZXJnZWQgYmVmb3JlCj4gdGhlIDIwMjUuMDIgZmVh
dHVyZSBmcmVlemUuIFRoYXQgc2VyaWVzIHByb3ZpZGVzIGEgbmljZSBmaXggZm9yIHRoZQo+IGJy
b2tlbiBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9EVFNfUEFUSCBpc3N1ZS4gVW5mb3J0dW5hdGVs
eSwgaXQgZGlkbid0Cj4gbWFrZSBpdCB0byB0aGUgZmVhdHVyZSBmcmVlemUsIGFuZCB0aGlzIGlz
IHdoeSBJIGFtIHN1Ym1pdHRpbmcgdGhpcwo+IHZlcnNpb24gYnVtcCBub3cuCj4gCj4gWzFdIAo+
IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9waXBlcm1haWwvYnVpbGRyb290LzIwMjQtT2N0
b2Jlci83NjU0NjMuaHRtbAo+IFsyXSBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2pl
Y3QvYnVpbGRyb290L2xpc3QvP3Nlcmllcz00NDU1ODIKPiAKPiAtLS0KPiBFZGdhciBCb25ldCAo
Mik6Cj4gICBib2FyZC9hY21lc3lzdGVtcy9hY3F1YS1hNTogYWRkIGRldmljZSB0cmVlIGFzIGEg
a2VybmVsIHBhdGNoCj4gICBjb25maWdzL2FjbWVzeXN0ZW1zX2FjcXVhX2E1Xyo6IGJ1bXAgdG8g
TGludXggNi4xMi4xNwo+IAo+ICAuLi4vYWNxdWEtYTUvYXQ5MS1zYW1hNWQzX2FjcXVhLmR0cyAg
ICAgICAgICAgfCAzNDAgLS0tLS0tLS0tLS0tLS0tLS0KPiAgLi4uTS1kdHMtYWRkLUFjbWVzeXN0
ZW1zLUFjcXVhLUE1LWJvYXJkLnBhdGNoIHwgMzU5ICsrKysrKysrKysrKysrKysrKwo+ICAuLi4v
YWNxdWEtYTUvcGF0Y2hlcy9saW51eC9saW51eC5oYXNoICAgICAgICAgfCAgIDIgKy0KPiAgY29u
Zmlncy9hY21lc3lzdGVtc19hY3F1YV9hNV8yNTZtYl9kZWZjb25maWcgIHwgICA2ICstCj4gIGNv
bmZpZ3MvYWNtZXN5c3RlbXNfYWNxdWFfYTVfNTEybWJfZGVmY29uZmlnICB8ICAgNiArLQo+ICA1
IGZpbGVzIGNoYW5nZWQsIDM2NiBpbnNlcnRpb25zKCspLCAzNDcgZGVsZXRpb25zKC0pCj4gIGRl
bGV0ZSBtb2RlIDEwMDY0NCBib2FyZC9hY21lc3lzdGVtcy9hY3F1YS1hNS9hdDkxLXNhbWE1ZDNf
YWNxdWEuZHRzCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCAKPiBib2FyZC9hY21lc3lzdGVtcy9hY3F1
YS1hNS9wYXRjaGVzL2xpbnV4LzAwMDEtQVJNLWR0cy1hZGQtQWNtZXN5c3RlbXMtQWNxdWEtQTUt
Ym9hcmQucGF0Y2gKPiAKPiAtLQo+IDIuMzQuMQoKQmVzdCByZWdhcmRzLAoKSnVsaWVuLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
