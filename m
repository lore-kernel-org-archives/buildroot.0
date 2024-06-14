Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1E4C27C6E
	for <buildroot@archiver.kernel.org>; Fri, 14 Jun 2024 20:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7054414B8;
	Fri, 14 Jun 2024 20:54:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nWkjGGpFzXbz; Fri, 14 Jun 2024 20:54:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A4B24097F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A4B24097F;
	Fri, 14 Jun 2024 20:54:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F9E41BF326
 for <buildroot@lists.busybox.net>; Fri, 14 Jun 2024 20:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DCF76060C
 for <buildroot@lists.busybox.net>; Fri, 14 Jun 2024 20:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nBG5O1E06hTS for <buildroot@lists.busybox.net>;
 Fri, 14 Jun 2024 20:54:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C1F9A60732
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1F9A60732
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C1F9A60732
 for <buildroot@buildroot.org>; Fri, 14 Jun 2024 20:54:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6D27813F879;
 Fri, 14 Jun 2024 22:54:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 14 Jun 2024 22:54:00 +0200
Date: Fri, 14 Jun 2024 22:54:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <Zmyt6DHL6Km2pj_i@landeda>
References: <cover.1718382114.git.yann.morin.1998@free.fr>
 <cea1e19d0c970055e04dbdbcfd7f1c74d2f4d694.1718382114.git.yann.morin.1998@free.fr>
 <Zmx-y2XW4ygziuh0@landeda>
 <CADvTj4q7pj+omVnVUgyA1OPX5+wvY9v18qi=8VVJ61SuUFQ+ow@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4q7pj+omVnVUgyA1OPX5+wvY9v18qi=8VVJ61SuUFQ+ow@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718398442;
 bh=iTfiocJ4TehaXfGpqS4/FZBBaVXQfZ27/0KNSJmMITU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MU0oZczOq3R37c6WKqcTzBhF+9sSjRnA8v10M8WvsNNtrY/TzeKjIMAkpBxDUeMF1
 rQxXJhox+I5qEMy2M4EtBgFokqBqZ+iAzCZ3MP+YttAwzk0MHLz5STxlvgqwU9uTG2
 6NQ/ECmBQcbrKSdM3iDaqOxOUZ/TAnZt5JHTe5osHZh/YzI3CA+shYnDblDSJQ62qe
 6Tre7oyGjGtJjKS1v9MQWjbw/Yz6g6UbeLw6fhoX7dNTMdIw4gWxM9TtPSzVjNtq5H
 MWKV+7k7dhAG0I/TARAA+eeB2In8dGFGgkDYRNzZKJxW/B4cYm6VT7ihZSFlkr1ECu
 qbNFC0QAF+1nA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MU0oZczO
Subject: Re: [Buildroot] [PATCH 5/6] package/python-pydantic-core: bump for
 fixes with python 3.12
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SmFtZXMsIEFsbCwKCk9uIDIwMjQtMDYtMTQgMTI6MDMgLTA2MDAsIEphbWVzIEhpbGxpYXJkIHNw
YWtlIHRodXNseToKPiBPbiBGcmksIEp1biAxNCwgMjAyNCBhdCAxMTozM+KAr0FNIFlhbm4gRS4g
TU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPiA+IE9uIDIwMjQtMDYtMTQg
MTg6MjEgKzAyMDAsIFlhbm4gRS4gTU9SSU4gc3Bha2UgdGh1c2x5Ogo+ID4gPiBUaGUgcGFja2Fn
ZSBpcyBub3QgeWV0IGF2YWlsYWJsZSBvbiBQeVBJLCBzbyBnbyBmZXRjaCBpdCBhdCB0aGUgc291
cmNlLgo+ID4gQW5kIGV2ZW4gdGhvdWdoIGl0IG5vdyBpcyBvbiBQeVBJLCBJIGFtIHN0aWxsIG9m
IHRoZSBvcGluaW9uIHRoYXQsIHdoZW4KPiA+IHRoZSBvZmZpY2lhbCB1cHN0cmVhbSByZXBvIGlz
IHVzYWJsZSBhcy1pcywgaXQgaXMgYmV0dGVyIHRvIHVzZSB0aGUKPiA+IHNvdXJjZXMgZnJvbSB0
aGVyZSB0aGFuIGZyb20gdGhlIHBhY2thZ2Ugb24gUHlQSSwgZm9yIHdoaWNoIHdlIGhhdmUgbm8K
PiA+IHdheSB0byBrbm93IGhvdyBpdCBoYXMgYmVlbiBnZW5lcmF0ZWQuIFdlIHNob3VsZCBvbmx5
IHJlbHkgb24gZmV0Y2hpbmcKPiA+IGZyb20gUHlQSSB0aG9zIHBhY2thZ2VzIGZvciB3aGljaCB0
aGUgdXBzdHJlYW0gc291cmNlcyBhcmUgbm90IGVub3VnaAo+ID4gKGUuZy4gbmVlZHMgaGVhdnkg
dG9vbGluZyB0aGF0IHdlIGxhY2spLgo+IAo+IEknbSBub3Qgc3VyZSB3aHkgaXQgd291bGQgbWFr
ZSBzZW5zZSB0byBwcmVmZXIgZ2l0IHNvdXJjZXMgZm9yIFB5UGkKPiBwYWNrYWdlcyB3aGVuIHdl
IHByZWZlciByZWxlYXNlIHRhcmJhbGxzIGZvciBub24tUHlQaSBwYWNrYWdlcwoKRm9yIGdpdC1o
b3N0ZWQgcGFja2FnZXMgd2hlcmUgdGhlcmUgaXMgdGhlIHBvc3NpYmlsaXR5IHRvIHVzZSBhIHJl
bW90ZWx5CmdlbmVyYXRlZCB0YXJiYWxsLCBJIHN0aWxsIHRoaW5rIChhbmQgYWx3YXlzIHNhaWQg
c28pIHRoYXQgaXQgd2FzIGFuCmVycm9yIHRvIGRvIHNvLiBJbmRlZWQsIHdlIGhhdmUgYWxyZWFk
eSBoYWQgYXQgbGVhc3QgdGhyZWUga25vd24gY2FzZXMKd2hlcmUgdGhlIHJlbW90ZSBmb3JnZSBh
Y3R1YWxseSBjaGFuZ2VkIHRoZSB3YXkgdGhlIGFyY2hpdmVzIHdlcmUKZ2VuZXJhdGVkLCBhbmQg
X3RoYXRfIGJyb2tlIG91ciBoYXNoZXMgKGFzIHdlbGwgYXMgZXZlcnlib2R5IGVsZXNlJ3MpOwph
bmQgd2UgYXJlIGF0IHRoZSBtZXJjeSBvZiBzdWNoIGNoYW5nZXMgaW4gdGhlIGZ1dHVyZS4gRXZl
biBpZiBhIGZvcmdlCmRvZXMgbm90IGNoYW5nZSBpdHMgdGFyYmFsbCBnZW5lcmF0aW9uIG1lY2hh
bmlzbSwgaXQgaXMgc3RpbGwgcG9zc2libGUKdGhhdCBhcmNodmllIGdlbmVyYXRlZCBieSBnaXQg
Y2hhbmdlOyBvbmUgc3VjaCBjYXNlIGlzIHdoZW4gYSByZXBvc2l0b3J5CmFocyBhIGZpbGUgaGFz
IHRoZSBnaXQgYXR0cmlidXRlIGV4cG9ydC1zdWJzdCBhbmQgdXNlcyB0aGUgJWgKKGFiYnJldmlh
dGVkIGNvbW1pdCBoYXNoKSBwbGFjZWhvbGRlciwgd2hlcmUgZ2l0IG1heSBkZWNpZGUgdG8gaW5j
cmVhc2UKdGhlIGxlbmd0aCBvZiB0aGUgc2hvcnQgaGFzaCB0byBhdm9pZCBjb2xsaXNpb24gd2hl
biB0aGUgcmVwb3NpdG9yeQpncm93cy4uLgoKSW5zdGVhZCwgd2Ugc2hvdWxkIGhhdmUgYWx3YXlz
IHVzZWQgZ2l0LWNsb25lIGFuZCByZWx5IG9uIG91ciBhcmNoaXZlCmhlbHBlcnMuIFRydWUgdGhh
dCB3ZSBkaWQgY2hhbmdlIHRoZW0sIGFuZCB0aGF0IHdlIGhhZCB0byBpbnRyb2R1Y2UKYXJjaHZp
ZSBmb3JtYXQgdmVyc2lvbnMsIGJ1dCBmb3IgYSBnaXZlbiB2ZXJzaW9uIG9mIEJ1aWxkcm9vdCwg
aXQgd2FzCnBlcmZlY3RseSBzdGFibGUuCgo+IGFzCj4gUHlQaSBzZGlzdCB0YXJiYWxscyBhcmUg
ZWZmZWN0aXZlbHkgcmVsZWFzZSB0YXJiYWxscy4KCkV4Y2VwdCB3aGVuIHRoZXkgYXJlIG5vdCwg
YmVhdXNlIHRoZXkgc3RpbGwgbmVlZCB0byBiZSB2ZW5kb3JlZCB3aGVuCnRoZXkgaGF2ZSBydXN0
IGNvZGUgaW4gdGhlcmUuIEJ1dCB0aGF0J3Mgbm90IHRoZSBhY3R1YWwgaXNzdWUgSSBoYXZlLi4u
CgpTb21lIGhhdmUgYWxzbyBoYWQgdmFyaW91cyBtYW5nbGluZyBkb25lLCBhbmQgdGh1cyBvbmUg
aGFzIG5vIGlkZWEgaG93CnRoZSBvZmZpY2lhbCBzb3VyY2UgcmVwb3NpdG9yeSBjYW4gYmUgdXNl
ZCB0byBnZW5lcmF0ZSB0aGUgInNkaXN0IiBhbmQKdGhlbiB5b3UgbWlnaHQgZ2V0IGluIGxlZ2Fs
IHRyb3VibGUgYmVjYXVzZSB3aGF0IHlvdSBiZWxpZXZlIGlzIHNvdXJjZQppcyBhY3R1YWxseSBu
b3Qgc291cmNlIGJ1dCBnZW5lcmF0ZWQgY29kZSBmb3Igd2hpaGNoIHRoZSBhY3R1YWwgc291cmNl
CmlzIG5vdCBhdmFpYWxibGUsIGFuZCB0aGVuIHlvdSBtaWdodCBnZXQgaW4gYnJlYWNoIG9mIHRo
ZSBsaWNlbnNlIHdoZW4KeW91IGRpc3RyaWJ1dGUgdGhhdC4uLgoKVGhhdCBpcyBhbHNvIHRydWUg
Zm9yIG90aGVyIHRhcmJhbGxzLCBhcyB5b3UgbWVudGlvbiwgYnV0IHRoaXMgaXMgbXVjaApsZXNz
IG9mdGVuIHRoZSBjYXNlOyB0aGUgb25seSByZWxlYXNlIHRhcmJhbGwgZm9yIGFuIGF1dG90b29s
cyBwYWNrYWdlCnRoYXQgSSByZW1lbWJlciBvZiwgdGhhdCBoYWQgc3VjaCBhbiBpc3N1ZSwgd2Vy
ZSBhIGZldyBiaW51dGlscyB2ZXJzaW9ucwp3ZXJlIHRoZXkgaW5jbHVkZWQgYSBnZW5lcmF0ZWQg
ZmlsZSB3aXRob3V0IGl0cyBzb3VyY2UsIGFuZCB0aGF0IHdhcyBhbgpvdmVyc2lnaHQsIG5vdCBk
b25lIG9uIHB1cnBvc2UsIGFuZCB0aGV5IGZpeGVkIGl0ICh0aGF0IGNhdXNlZCBxdWl0ZSBhCm1l
c3MpLi4uCgo+IE9uZSBhZHZhbnRhZ2UgdG8gdXNpbmcgUHlQaSByZWxlYXNlcyBpcyB5b3UgYXZv
aWQgaXNzdWVzIHdpdGggaGFzaCdzCj4gY2hhbmdpbmcgZHVlLgoKV2hlbiB3ZSBjaGFuZ2Ugb3Vy
IGRvd25sb2FkIGhlbHBlcnMsIHdlIGFyZSByZXNwb25zaWJsZSBmb3IgdGhlIGNoYW5nZQppbiBo
YXNoZXMsIHNvIHdlIGNhbiBwbGFuIGZvciBpdC4gQXMgSSBzYWlkIGFib3ZlLCBmb3IgYSBnaXZl
biB2ZXJzaW9uCm9mIEJ1aWxkcm9vdCwgdGhlbiBhcmNoaXZlcyBhcmUgcmVwcm9kdWNpYmxlOyBp
dCdzIG9ubHkgd2hlbiBfd2VfIGRlY2lkZQp0byBjaGFuZ2Ugb3VyIGhlbHBlcnMgdGhhdCB3ZSBo
YXZlIHRvIHVwZGF0ZSB0aGUgaGFzaGVzLiBBRkFJQ1MsIHRoZXIKZWlzIG5vdGhpbmcgdGhhdCB3
b3VsZCBwcmV2ZW50IGEgcGFja2FnZXIgdG8gcHVzaCBhbiB1cGRhdGVkIGFyY2hpdmUgdG8KcmVw
bGFjZSBhbiBleGlzdGluZyBvbmUgb24gUHlQSSwgdGh1cyBhY3R1YWxseSBicmVha2luZyB0aGUg
aGFzaCB3aXRob3V0CmFueSByZXNvcnQgb24gb3VyIHNpZGUgdG8gd29rcmthcm91bmQgdGhhdC4K
CkFzIEkgc2FpZCBlYXJsaWVyLCB0aGUgb25seSBjYXNlIHdoZXJlIGl0IHdvdWxkIGJlIGFuIGFj
Y2VwdGJsZQpsYXN0LXJlc29ydCwgd291bGQgYmUgd2hlbiB0aGUgYXJjaGl2ZSBvbiBQeVBJIGNv
bnRhaW5zIF9hZGRpdGlvbmFsXwpkYXRhIHRoYXQgd2FzIGdlbmVyYXRlZCB3aXRoIGhlYXZ5IHRv
b2xpbmcgdGhhdCB3ZSBsYWNrIChhbmQgY2FuJ3QKZWFzaWx5IHBhY2thZ2UgaW4gQnVpbGRyb290
KS4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4K
fCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9O
IHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVz
aWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYx
IDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAg
VGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAv
IFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0t
LS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
