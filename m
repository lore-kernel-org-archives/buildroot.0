Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 749EDC0218C
	for <buildroot@archiver.kernel.org>; Wed, 22 Jan 2025 19:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E65C80FAC;
	Wed, 22 Jan 2025 19:48:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f5fCfe0i21Oq; Wed, 22 Jan 2025 19:48:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DDE081E0F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DDE081E0F;
	Wed, 22 Jan 2025 19:48:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EDF80F08
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 19:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE753406EE
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 19:48:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h151NkRHDMfg for <buildroot@buildroot.org>;
 Wed, 22 Jan 2025 19:48:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8E686402DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E686402DE
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E686402DE
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 19:48:12 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:9ec0:69a:15a1:6506] (unknown
 [IPv6:2a01:e0a:12:eba0:9ec0:69a:15a1:6506])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 512E3C01B2;
 Wed, 22 Jan 2025 20:48:09 +0100 (CET)
Message-ID: <45a12c90-095a-4333-82df-ef7648749a91@grenoble.cnrs.fr>
Date: Wed, 22 Jan 2025 20:48:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, Michael Walle <mwalle@kernel.org>,
 Buildroot development <buildroot@buildroot.org>
Cc: Chris Packham <judge.packham@gmail.com>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Sergey Matyukevich <geomatsi@gmail.com>
References: <93f83afb-6987-441c-8e06-dab4d43b828f@grenoble.cnrs.fr>
 <D6UG5Z1HUN9N.GWVHB4L823ZC@kernel.org>
 <5576c173-c1a6-4c85-91dc-b8a6b0a54ba6@smile.fr>
Content-Language: en-US
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <5576c173-c1a6-4c85-91dc-b8a6b0a54ba6@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1737575289;
 bh=H4l+43ru87XQQcqOgfiq9JdCWPFEo7QsHkwceJBbN+8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BUbJd4n7/fppCSTkIfD1g4GlYTRMDOb1Jf/6y8cSSlcOTPHxBWgzmJ8LzU7/oRWUk
 1IhOKarJ2xF52R8QpqIzq/59WHnTGLZuianqPJZ+Te5xtGEiegygxLA+1l/qXY0LNo
 6cXKvogBA5HqNy2Lz8GRrXfOM7QO6QxXDMMrMTU4Tq6ytC+kBzGHJtqpqSTgI0dGHw
 DNsuHuwLLpVkIdw1M3JHSuajk3KkS+Pwy356olkQPejBN7Esg07ZVto8GXHmC4Q0/N
 IHyMdMXvSrgRKimU9xyygr/SeIHxDarwvVmsru3oa8W1AH3cl9sZa8PQLJerXjUDU/
 dnYJV+NJ0vEBQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=BUbJd4n7
Subject: Re: [Buildroot] [PATCH v3 1/1] linux: make out-of-tree DTS work
 with newest kernels
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQnVpbHJvb3QgcGVvcGxlIQoKT24gMjAyNS0wMS0yMiwgUm9tYWluIE5hb3VyIHdyb3Rl
Ogo+IEhlbGxvIEVkZ2FyLCBNaWNoYWVsLCBBbGwsCj4gCj4gTGUgMDUvMDEvMjAyNSDDoCAyMjox
MSwgTWljaGFlbCBXYWxsZSBhIMOpY3JpdMKgOgo+PiBIaSwKPj4KPj4+IEZ1bGZpbGxpbmcgdGhp
cyBrZXJuZWwgZXhwZWN0YXRpb24gd291bGQgcmVxdWlyZSBhIG5ldwo+Pj4gY29uZmlndXJhdGlv
biBwYXJhbWV0ZXIgZm9yIHRoZSBuYW1lIG9mIHRoZSBhcHByb3ByaWF0ZSB2ZW5kb3IKPj4+IHN1
YmRpcmVjdG9yeS4KPj4KPj4gTm8sIHRoYXQgZG9lc24ndCB3b3JrLiBUaGUgdmVuZG9yIHBhcnQg
KmhhcyogdG8gYmUgaW5jbHVkZWQgaW4gdGhpcwo+PiBjb25maWcgb3B0aW9uIGFzIGl0IG1heSBj
b250YWluIGRpZmZlcmVudCBkZXZpY2UgdHJlZSAoZmlsZSBuYW1lcykuCj4+IERvbid0IGFzc3Vt
ZSB0aGUgdmVuZG9yIHBhcnQgd2lsbCBhbHdheXMgYmUgdGhlIHNhbWUgZm9yIGRpZmZlcmVudAo+
PiBkZXZpY2UgdHJlZXMuCj4+Cj4+IFNvbWVob3cgd2UgaGF2ZSB0byBzcGxpdCB0aGUgc291cmNl
IGRpcmVjdG9yeSBvZiB0aGUgT09UIGRldmljZQo+PiB0cmVlcyBhbmQgdGhlIChyZWxhdGl2ZSkg
ZGVzdGluYXRpb24gd2l0aGluIHRoZSBrZXJuZWwgdHJlZSAoZWcuCj4+ICdmcmVlc2NhbGUvZnNs
LWxzMTAyOGEtbXktZGV2aWNlLXRyZWUuZHRzJywgb3IganVzdAo+PiAnbXktZGV2aWNlLXRyZWUu
ZHRzJykuIFBsZWFzZSBrZWVwIGluIG1pbmQgdGhhdCB0aGUgZGV2aWNlIHRyZWVzCj4+IG1pZ2h0
IGFsc28gZW5kIHVwIGluIHRoZSB0YXJnZXQgZmlsZXN5c3RlbSBpbiAvYm9vdCBhbmQgdGhlc2Ug
bWlnaHQKPj4gYWxzbyBuZWVkIHRoZSB2ZW5kb3IgcHJlZml4IChzZWUgQlIyX0xJTlVYX0tFUk5F
TF9EVEJfS0VFUF9ESVJOQU1FKS4KPj4KPj4+IEl0IHdvdWxkIGFsc28gcmVxdWlyZSBjaGFuZ2lu
ZyB0aGUgcmVsYXRpdmUgcGF0aHMgdG8gaW5jbHVkZWQKPj4+IC5kdHNpIGZpbGVzLgo+Pgo+PiBZ
ZXMsIGJ1dCBJJ2QgYXJndWUsIHRoYXQgdGhlIGN1cnJlbnQgc29sdXRpb24gaXMgYnJva2VuIGlu
IHRoaXMKPj4gcmVnYXJkLiBZZXMgd2Ugc2hvdWxkbid0IGJyZWFrIHRoaW5ncywgYnV0IG5ld2Vy
IE9PVCBkZXZpY2UgdHJlZXMKPj4gc2hvdWxkIHVzZSB0aGUgc2FtZSAjaW5jbHVkZSBkaXJlY3Rp
dmVzIGFzIHRoZSBpbi10cmVlIGRldmljZSB0cmVlcwo+PiB0byBlYXNlIHNoYXJpbmcgdGhlIGZp
bGVzIGJldHdlZW4gdS1ib290LCBsaW51eCBhbmQgT09UIGV4dGVybmFsCj4+IHRyZWVzLiBBcyBv
ZiB0b2RheSwgaXQncyBub3QgKGFsd2F5cykgcG9zc2libGUgdG8gdXNlIHRoZSBzYW1lCj4+IChP
T1QpIGRldmljZSB0cmVlIGZvciB1LWJvb3QgYW5kIGxpbnV4IGluIGJ1aWxkcm9vdCwgaS5lLiBp
ZiB0aGUKPj4gYXJjaCBoYXMgc3ViZGlycyBhbmQgb25lIHVzZSB0aGUgT0ZfVVBTVFJFQU0gY29u
ZmlndXJhdGlvbiBvcHRpb24gaW4KPj4gdS1ib290Lgo+IAo+IEluZGVlZCwgdGhlICNpbmNsdWRl
IGRpcmVjdGl2ZSBzaG91bGQgYmUgdGhlIHNhbWUgYXMgZm9yIHRoZSBpbi10cmVlIGRldmljZQo+
IHRyZWVzLiBUaGUgYWNtZXN5c3RlbXNfYWNxdWFfYTVfKiBPT1QgZHRzICNpbmNsdWRlIHBhdGgg
d2FzIHVwZGF0ZWQgdG8gdXNlIHRoZQo+IHZlbmRvciBwcmVmaXggd2hpbGUgYnVtcGluZyB0byBM
aW51eCA2LjYuMTIgWzFdLCBzbyBpdCB3YXMgcHJvYmFibHkgYQo+ICJ3b3JrYXJvdW5kIiBvZiB0
aGUgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fRFRTX1BBVEggbGltaXRhdGlvbi4uLgo+IAo+IFRo
ZSBwcm9ibGVtIGlzIHRoYXQgd2UgZGVmaW5lIHRoZSBwYXRoIHRvIHRoZSBPT1QgZHRzIGZpbGUg
bGlrZSB0aGlzOgo+IAo+IEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0RUU19QQVRIPSJib2FyZC9h
Y21lc3lzdGVtcy9hY3F1YS1hNS9hdDkxLXNhbWE1ZDNfYWNxdWEuZHRzIgo+IAo+IFNvIHdlIGNh
bid0IGV4dHJhY3QgdGhlIHZlbmRvciBwcmVmaXggZnJvbSBpdCBldmVuIGlmIGl0IHdvdWxkIGxv
b2sgbGlrZSB0aGlzOgo+IAo+IEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0RUU19QQVRIPSJib2Fy
ZC9hY21lc3lzdGVtcy9hY3F1YS1hNS9kdHMvbWljcm9jaGlwL2F0OTEtc2FtYTVkM19hY3F1YS5k
dHMiCj4gCj4gTm90ZTogdGhlIHZlbmRvciBwcmVmaXggaXMgbm90IGFsd2F5cyBvbmUgc3ViLWRp
cmVjdG9yeToKPiAKPiAgIGFyY2gvYXJtL2Jvb3QvZHRzL3RpL29tYXAvZHJhNy5kdHNpCj4gICBh
cmNoL2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9nb29nbGUvZ3MxMDEuZHRzaQo+IAo+IFdlIHByb2Jh
Ymx5IG5lZWQgYSBuZXcgb3B0aW9uIHRvIHByb3ZpZGUgc29tZXRoaW5nIGxpa2UgYSBkdHMgIm92
ZXJsYXkiCj4gQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fRFRTX09WRVJMQVkgKHNpbWlsYXIgdG8g
QlIyX1JPT1RGU19PVkVSTEFZKSB0byBjb3B5IGEKPiBkdHMgZGlyZWN0b3J5IGRpcmVjdGx5IHRv
ICQoTElOVVhfQVJDSF9QQVRIKS9ib290L2R0cy8KPiAKPiAgIEJSMl9MSU5VWF9LRVJORUxfQ1VT
VE9NX0RUU19PVkVSTEFZPSJib2FyZC9hY21lc3lzdGVtcy9hY3F1YS1hNS9kdHMiCj4gCj4gICBi
b2FyZC9hY21lc3lzdGVtcy9hY3F1YS1hNS9kdHMvCj4gICDilJTilIDilIAgbWljcm9jaGlwCj4g
ICAgICAg4pSU4pSA4pSAIGF0OTEtc2FtYTVkM19hY3F1YS5kdHMKPiAKPiBEb2luZyBzbywgdGhl
IEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0RUU19QQVRIIHNob3VsZCBiZSBkZXByZWNhdGVkLgo+
IAo+IFRob3VnaHRzPwoKSSBkbyBsaWtlIHRoaXMgaWRlYS4gUXVpdGUgZWxlZ2FudC4gSXQgd291
bGQgYnJlYWsgY3VycmVudApjb25maWd1cmF0aW9ucywgYnV0IHRoZSBmaXggaXMgcmVhbGx5IGVh
c3kuCgpJIGFtIG9ubHkgYSBiaXQgd29ycmllZCBhYm91dCB0aGUgdGltaW5nLiBJdCB3b3VsZCBi
ZSBuaWNlIGlmIHRoaXMgaXNzdWUKY291bGQgYmUgZml4ZWQsIG9uZSB3YXkgb3IgYW5vdGhlciwg
YmVmb3JlIHRoZSBmZWF0dXJlIGZyZWV6ZSBvZiB0aGUKbmV4dCBCdWlsZHJvb3QgTFRTLgoKQmVz
dCByZWdhcmRzLAoKRWRnYXIuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
