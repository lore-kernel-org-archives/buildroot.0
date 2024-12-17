Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97ABAE7717F
	for <buildroot@archiver.kernel.org>; Tue, 17 Dec 2024 18:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5187581E7B;
	Tue, 17 Dec 2024 18:43:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ZiNoSqGhqLr; Tue, 17 Dec 2024 18:43:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4ED7F81E84
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4ED7F81E84;
	Tue, 17 Dec 2024 18:43:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CE28BCE
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 18:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A87944155F
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 18:43:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0x617QWGh4Gl for <buildroot@buildroot.org>;
 Tue, 17 Dec 2024 18:43:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C9E87404A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9E87404A4
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C9E87404A4
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 18:43:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 5E40178050C;
 Tue, 17 Dec 2024 19:43:06 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:33108])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 17 Dec 2024 19:43:06 +0100
MIME-Version: 1.0
Date: Tue, 17 Dec 2024 19:43:06 +0100
From: Julien Olivain <ju.o@free.fr>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Sergey Matyukevich <geomatsi@gmail.com>
In-Reply-To: <Z2FMyLInGBpM5lFq@debian>
References: <20241216090421.2867204-1-vincent.stehle@arm.com>
 <847d9076e7ae8227d486d9ef1fe08bb0@free.fr> <Z2FMyLInGBpM5lFq@debian>
User-Agent: Webmail Free/1.6.9
Message-ID: <b969d87c4f76804160fc449e9a2b782f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734460988;
 bh=afV7/5xGLPqTmDL7h5nztqxBTyRbBPztn8pk4Lx2gd4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hQZr4olxTZjQ0SpB/GALFOGNAY/v76rJcHoNMJ9t7icy4t7dSCvmCRq+6UcyG/y/C
 abGRMOzOdljn+ObjnmFgOxadL2q7FLwUWvBmRWaHzhDyNhMDtI7T5T1XrjbxycjCT1
 H+7RwYnk3DqXxqvVu4JwU2moE8/XTSglt1TFbU+h+dDFPWTxk5A39Wn3cga8QS1pCr
 jN8KNLsMpSJXVJCDNFYPBxYZuaZ+uZiBNwIWNNLPwN4Bsr2sqxAq/ocF41DKanfSVX
 v0urakc/kF8lHvk2Th6thJKztBNl0qmZMs6ElZsnTB0N+0/uYFEQ+hL2CySCMKLQfu
 QLUpLoVkbe0Tg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=hQZr4olx
Subject: Re: [Buildroot] [PATCH] boot/arm-trusted-firmware: bump to v2.12
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

SGkgVmluY2VudCwKCk9uIDE3LzEyLzIwMjQgMTE6MDQsIFZpbmNlbnQgU3RlaGzDqSB3cm90ZToK
PiBPbiBNb24sIERlYyAxNiwgMjAyNCBhdCAxMDowODo0NlBNICswMTAwLCBKdWxpZW4gT2xpdmFp
biB3cm90ZToKPj4gSGkgVmluY2VudCwKPj4gCj4+IE9uIDE2LzEyLzIwMjQgMTA6MDQsIFZpbmNl
bnQgU3RlaGzDqSB3cm90ZToKPj4gPiBVcGRhdGUgdHJ1c3RlZC1maXJtd2FyZS1hIHZlcnNpb24g
dG8gdjIuMTIgYW5kIGFkZCBhIGhhc2ggZmlsZQo+PiA+IGFjY29yZGluZ2x5Lgo+PiA+Cj4+ID4g
Q29tcGFyZWQgdG8gdjIuMTEsIHRoZSBsaWNlbnNlIGhhcyBjaGFuZ2VkIHdpdGggdGhlIGFkZGl0
aW9uYWwgbWVudGlvbgo+PiA+IG9mCj4+ID4gZmlsZXMgZnJvbSB0aGUgcHlkZXZpY2V0cmVlIHBy
b2plY3QgdW5kZXIgQXBhY2hlIDIuMCBsaWNlbnNlLgo+PiA+IEFzIHdlIG9ubHkgZG9jdW1lbnQg
dGhlIG1haW4gbGljZW5zZSBvZiBURi1BLCBCU0QtMy1DbGF1c2UsIHRoaXMgY2hhbmdlCj4+ID4g
aGFzCj4+ID4gbm8gaW1wYWN0IGZvciB1cy4KPj4gPgo+PiA+IFNpZ25lZC1vZmYtYnk6IFZpbmNl
bnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KPj4gPiBDYzogRGljayBPbHNzb24g
PGhpQHNlbnppbGxhLmlvPgo+PiA+IENjOiBTZXJnZXkgTWF0eXVrZXZpY2ggPGdlb21hdHNpQGdt
YWlsLmNvbT4KPj4gCj4+IFRoYW5rcyBmb3IgdGhlIHBhdGNoIChhbmQgdGhlIGV4dGVuZGVkIHRl
c3RpbmcpLiBJIGFwcGxpZWQgdG8gbWFzdGVyLgo+IAo+IEhpIEp1bGllbiwKPiAKPiBUaGFua3Mg
Zm9yIGhhbmRsaW5nIHRoYXQuCj4gCj4+IEkgcmVtb3ZlZCB0aGUgaGFzaCBmaWxlIGZvciB2Mi4x
MSwgc2luY2UgaXQgaXMgbm8gbG9uZ2VyIG5lZWRlZAo+PiBoZXJlLiBJIGFsc28gc2VlIHRoYXQg
YXJtX2Z2cF9lYmJyX2RlZmNvbmZpZyB1c2VzIFRGLUEgdjIuMTEgWzFdCj4+IGJ1dCBpdHMgcGF0
Y2ggZGlyZWN0b3J5IFsyXSBkb2VzIG5vdCBpbmNsdWRlIGFuIGVudHJ5IGZvciBpdC4KPj4gSSBi
ZWxpZXZlIGl0IHdhcyBtaXNzaW5nIGFuZCB3YXMgdXNpbmcgdGhlIGhhc2ggZmlsZSBJIHJlbW92
ZWQuCj4+IFRoaXMgZGVmY29uZmlnIG1pZ2h0IGJlIGJyb2tlbiBub3cuIENvdWxkIHlvdSBkb3Vi
bGUgY2hlY2sgdGhhdAo+PiBwbGVhc2U/IFlvdSBtaWdodCBuZWVkIHRvIGFkZCBiYWNrIGEgaGFz
aCBmaWxlIGluIHlvdXIgYm9hcmQKPj4gcGF0Y2ggZGlyZWN0b3J5IChldmVuIGlmIGl0J3MgZm9y
IGFuIHVwZGF0ZWQgdjIuMTIgdmVyc2lvbikuCj4gCj4gVGhhbmtzIGZvciBwb2ludGluZyB0aGF0
IG91dCEKPiAKPiBJIHNlZSBub3Qgb25lIGJ1dCB0d28gZGVmY29uZmlncyB1c2luZyBURi1BIHYy
LjExIHdpdGhvdXQgYQo+IGNvcnJlc3BvbmRpbmcgaGFzaCBmaWxlIG5vdzoKPiAKPiAgIGFybV9m
dnBfZWJicl9kZWZjb25maWcKPiAgIHJvY2twcm82NF9kZWZjb25maWcKPiAKPiBJIHdpbGwgc2Vu
ZCBwYXRjaGVzIHRvIGFkZCBoYXNoIGZpbGVzIHRvIGJvdGggc29vbi4KPiAKPiBGb3J0dW5hdGVs
eSBJIHRoaW5rIHRoZXJlIGlzIG5vIHVyZ2VuY3ksIGFzIHdpdGggdGhvc2UgZGVmY29uZmlncyBU
Ri1BCj4gZG9lcyBpbmRlZWQgc3RpbGwgZXh0cmFjdCBmaW5lIGFuZCBhbGwgd2UgZ2V0IGZvciBu
b3cgaXMgYSB3YXJuaW5nOgo+IAo+ICAgV0FSTklORzogbm8gaGFzaCBmaWxlIGZvciBhcm0tdHJ1
c3RlZC1maXJtd2FyZS12Mi4xMS1naXQ0LnRhci5nego+IAo+IFRoaXMgaXMgYXJndWFibHkgYSBi
aXQgb2YgYSBzdXJwcmlzaW5nIGJlaGF2aW91ciB3aGVuIHdlIGhhdmUKPiBCUjJfRE9XTkxPQURf
Rk9SQ0VfQ0hFQ0tfSEFTSEVTPXkuLi4KCkkgYWdyZWUsIHRoaXMgYmVoYXZpb3IgaXMgc3VycHJp
c2luZy4gSXQgaXMgYSBjb3JuZXIgY2FzZSBvZiB0aGUKY2hlY2staGFzaCBzY3JpcHQgYW5kIGFy
bS10cnVzdGVkLWZpcm13YXJlIHdoaWNoIGlzIHRoZSBvbmx5IHBhY2thZ2UKZGVmaW5pbmcgc2Vw
YXJhdGUgaGFzaCBmaWxlcywgcGVyIHBhY2thZ2UgdmVyc2lvbi4KCldlJ2xsIHNlZSBob3cgd2Ug
Y2FuIGltcHJvdmUgdGhhdCBzcGVjaWZpYyBwb2ludC4KCj4gQmVzdCByZWdhcmRzLAo+IFZpbmNl
bnQuCj4gCj4+IAo+PiBCZXN0IHJlZ2FyZHMsCj4+IAo+PiBKdWxpZW4uCj4+IAo+PiBbMV0gCj4+
IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2Jsb2IvbWFzdGVy
L2NvbmZpZ3MvYXJtX2Z2cF9lYmJyX2RlZmNvbmZpZyNMMjAKPj4gWzJdIAo+PiBodHRwczovL2dp
dGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS90cmVlL21hc3Rlci9ib2FyZC9hcm0v
ZnZwLWViYnIvcGF0Y2hlcwoKVGhhbmtzIGZvciBkb3VibGUgY2hlY2tpbmchCgpKdWxpZW4uCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
