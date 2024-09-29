Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C90CF6497
	for <buildroot@archiver.kernel.org>; Sun, 29 Sep 2024 09:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 960F940521;
	Sun, 29 Sep 2024 09:25:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6firsQVQEWmF; Sun, 29 Sep 2024 09:25:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 403EB40544
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 403EB40544;
	Sun, 29 Sep 2024 09:25:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 879FC1BF36A
 for <buildroot@lists.busybox.net>; Sun, 29 Sep 2024 09:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75E3240609
 for <buildroot@lists.busybox.net>; Sun, 29 Sep 2024 09:25:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pd2mjP7fn2pE for <buildroot@lists.busybox.net>;
 Sun, 29 Sep 2024 09:25:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1189040021
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1189040021
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1189040021
 for <buildroot@buildroot.org>; Sun, 29 Sep 2024 09:25:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 3CC88B0053E;
 Sun, 29 Sep 2024 11:24:41 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:49298])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 29 Sep 2024 11:24:41 +0200
MIME-Version: 1.0
Date: Sun, 29 Sep 2024 11:24:41 +0200
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <87jzf5h12z.fsf@dell.be.48ers.dk>
References: <20240911171937.10842-1-ju.o@free.fr>
 <87jzf5h12z.fsf@dell.be.48ers.dk>
User-Agent: Webmail Free/1.6.9
Message-ID: <7884535cac565004d351d4d143364104@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1727601884;
 bh=/2vBfYnYze8DuDpubcQJbHv3YJpvMuTmcEIXTdPXsGM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lTNS9iHOoCtziXLLRxf4PBi1jF6OS/8U5+Wd5DXsCGgLit9ExSyOXyJ/mKHNxamrE
 ue1BtqLhlR34Micg/M7Y+skPaUt1kuG+KBbuwh3GFu+cLdxPWwBJK8v+NSsim7/YAy
 WUFiLxBql/Q4IPuN5iZNsubctkGDR+PKBcdzypfM5z9l2Wi1rx/gvIMGAzjOjT2Sjy
 6yi9fFUJiL7v6Sh+GuE1qEldGgL0xKFfVxt3Cni2D0PxY93QMFdCJ/317v97+X1e11
 HuPwIn9ulJYpWQ1G0b/PzGA3PTKPl0ogqq3l+ivM08AGrs7O4GE4LUkXZ9sCC2/23h
 I/r8zSGccOQ+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lTNS9iHO
Subject: Re: [Buildroot] [PATCH 1/1] boot/grub2: needs host-python3
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
Cc: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ZXIsIEFsbCwKCk9uIDIxLzA5LzIwMjQgMTA6MTgsIFBldGVyIEtvcnNnYWFyZCB3cm90
ZToKPj4+Pj4+ICJKdWxpZW4iID09IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+IHdyaXRl
czoKPiAKPiAgPiBXaGVuIHRoZSBidWlsZCBob3N0IGRvZXMgbm90IGhhdmUgYSBQeXRob24gaW50
ZXJwcmV0ZXIgaW5zdGFsbGVkLAo+ICA+IGhvc3QtZ3J1YjIgaXMgZmFpbGluZyB0byBjb25maWd1
cmUgZHVlIHRvIHRoaXMgbWlzc2luZyBpbnRlcnByZXRlci4KPiAgPiBOb3RlIHRoYXQgaG9zdC1n
cnViMiBpcyB0aGUgZmlyc3QgcGFja2FnZSB0byBmYWlsIGJlY2F1c2UgaXQgaXMgYQo+ICA+IGRl
cGVuZGVuY3kgb2YgZ3J1YjIuIFRoZSBncnViMiB0YXJnZXQgcGFja2FnZSBoYXMgdGhlIHNhbWUg
Cj4gZGVwZW5kZW5jeQo+ICA+IHJlcXVpcmVtZW50Lgo+IAo+ICA+IFRoZSBpc3N1ZSBjYW4gYmUg
cXVpY2tseSByZXByb2R1Y2VkIG9uIGEgaG9zdCB3aXRob3V0IFB5dGhvbiB3aXRoIAo+IHRoZQo+
ICA+IGNvbW1hbmRzOgo+IAo+ICA+ICAgICBjYXQgPDxFT0YgPi5jb25maWcKPiAgPiAgICAgQlIy
X2FhcmNoNjQ9eQo+ICA+ICAgICBCUjJfVEFSR0VUX0dSVUIyPXkKPiAgPiAgICAgQlIyX1RPT0xD
SEFJTl9FWFRFUk5BTD15Cj4gID4gICAgIEVPRgo+ICA+ICAgICBtYWtlIG9sZGRlZmNvbmZpZwo+
ICA+ICAgICBtYWtlIGdydWIyCj4gCj4gID4gZ3J1YjIgYXV0b3Rvb2xzIGNvbmZpZ3VyZS5hYyBz
ZWFyY2ggZm9yIGEgUHl0aG9uIGludGVycHJldGVyIHNpbmNlCj4gID4gdXBzdHJlYW0gY29tbWl0
IFsxXSA4YjQ2Nzg0NGUgInB5dGhvbjogVXNlIEFNX1BBVEhfUFlUSE9OIHRvIAo+IGRldGVybWlu
ZQo+ICA+IGludGVycHJldGVyIGZvciBnZW50cGwucHkiLCBmaXJzdCBpbmNsdWRlZCBpbiBncnVi
IHYyLjA0IHJlbGVhc2VkCj4gID4gb24gMjAxOS0wNy0wNC4gRm9yIHJlZmVyZW5jZSwgZ3J1YjIg
aGFzIGJlZW4gdXBkYXRlZCB0byB0aGF0IHZlcnNpb24KPiAgPiBpbiBjb21taXQgWzJdIGVhN2Vj
NDFjICJib290L2dydWIyOiBidW1wIHRvIHZlcnNvbiAyLjA0Ii4KPiAKPiAgPiBUaGlzIGNvbW1p
dCBmaXhlcyB0aGUgaXNzdWUgYnkgYWRkaW5nIHRoZSBob3N0LXB5dGhvbjMgZGVwZW5kZW5jeSB0
bwo+ICA+IGhvc3QtZ3J1YjIgYW5kIGdydWIyLgo+IAo+ICA+IEZpeGVzOgo+IAo+ICA+ICAgICBj
aGVja2luZyBmb3IgYSBQeXRob24gaW50ZXJwcmV0ZXIgd2l0aCB2ZXJzaW9uID49IDIuNi4uLiBu
b25lCj4gID4gICAgIGNvbmZpZ3VyZTogZXJyb3I6IG5vIHN1aXRhYmxlIFB5dGhvbiBpbnRlcnBy
ZXRlciBmb3VuZAo+IAo+ICA+IFsxXSAKPiBodHRwczovL2dpdC5zYXZhbm5haC5nbnUub3JnL2dp
dHdlYi8/cD1ncnViLmdpdDthPWNvbW1pdGRpZmY7aD04YjQ2Nzg0NGUxMTE3MDA3N2M4Y2E3Mjdj
MzlkMmJkMzZlZWI1ZjA4Cj4gID4gWzJdIAo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qu
b3JnL2J1aWxkcm9vdC8tL2NvbW1pdC9lYTdlYzQxY2Y2NGU4NmE2OTJhYzQ1ZTBkMDEyYzZlODE5
OWVmMTEwCj4gCj4gID4gUmVwb3J0ZWQtYnk6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVo
bGVAYXJtLmNvbT4KPiAgPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVl
LmZyPgo+IAo+IEdpdmVuIHRoYXQgaXQgYXBwYXJlbnRseSBkb2Vzbid0IG5lZWQgYW55IHNwZWNp
YWwgcHl0aG9uIG1vZHVsZXMgY291bGQKPiB3ZSB1c2UgJChCUjJfUFlUSE9OM19IT1NUX0RFUEVO
REVOQ1kpIGluc3RlYWQgdG8gb25seSBidWlsZCBweXRob24zIGlmCj4gbm90IGF2YWlsYWJsZSBv
biB0aGUgaG9zdCAvIG9sZGVyIHRoYW4gMy40PwoKWWVzLCBJIGNvbmZpcm0gdGhhdCBmb3Igbm93
LCB0aGVyZSBpcyBubyBzcGVjaWZpYyBweXRob24gbW9kdWxlCnJlcXVpcmVtZW50LCBhbmQgUHl0
aG9uIDMuNCBzaG91bGQgYWxzbyBiZSBzdWZmaWNpZW50LiBTbyB3ZSBjb3VsZApzd2l0Y2ggdG8g
QlIyX1BZVEhPTjNfSE9TVF9ERVBFTkRFTkNZIHRvIHNhdmUgdGhlIHRpbWUgb2YgdGhlIGhvc3QK
cHl0aG9uIGJ1aWxkLgoKVGhlIHNhbWUgY29tbWVudCBhcHBsaWVzIHRvIHRoZSBMaW51eCBrZXJu
ZWwuCgpTaW5jZSB0aG9zZSBwYXRjaGVzIHdlcmUgcmVjZW50bHkgbWVyZ2VkIGluIFsxXSBhbmQg
WzJdLCBJJ2xsIHByb3Bvc2UKZm9sbG93dXAgcGF0Y2hlcyBhcyBhbiBpbXByb3ZlbWVudC4KCj4g
LS0KPiBCeWUsIFBldGVyIEtvcnNnYWFyZAoKQmVzdCByZWdhcmRzLAoKSnVsaWVuLgoKWzFdIApo
dHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvODZiYjFi
MjM2MGJkYWVkMDY5Y2QwODc1NDFmNGVkYWQxZDVjZTkyNQpbMl0gCmh0dHBzOi8vZ2l0bGFiLmNv
bS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC9hYmNlNGEyYjM2NTI3NmE3ZmEwODFk
MzI3Mjg5ZTVlNmQ4YmRjYTdlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
