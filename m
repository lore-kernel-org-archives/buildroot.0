Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B8ACCD199
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 14:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E08F40680;
	Fri, 17 Oct 2025 14:12:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p8LLE8jB7-Aq; Fri, 17 Oct 2025 14:12:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 781324065D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 781324065D;
	Fri, 17 Oct 2025 14:12:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3953E972
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 14:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F94440642
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 14:12:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WOt1vcr-dud7 for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 14:12:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 69EE74035D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69EE74035D
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 69EE74035D
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 14:12:37 +0000 (UTC)
Received: from [192.168.109.49] (unknown [61.8.138.85])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 7A35E2C80CFD;
 Fri, 17 Oct 2025 16:12:34 +0200 (CEST)
Message-ID: <a4c335e6-b2e3-487d-b6d8-60318059b195@bubu1.eu>
Date: Fri, 17 Oct 2025 16:12:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>,
 buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20251009152813.1690704-1-vincent.stehle@arm.com>
Content-Language: en-US
In-Reply-To: <20251009152813.1690704-1-vincent.stehle@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1760710354; bh=761D+ZTqUtsZSlQFRqBmM+YkAetHqNGI8+uUUlaK8NI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=KMz6PhOEJ7uPFGiFgjwSEVuqGfCaT5ufboLLsmzKSsTMsPc9sns3RV75jQGCKjgya
 G1mkND28tazPoyxFusGyNLPX413DXKtORfz4cG4l9mdbXn4q+spjfiSZoNbfFI/ufT
 oIBWSICPjssPfL9ADuMui955tQPH+ed4olaNBLBV0ZiCmqUhOj6uuO4Xk59CtqO4ZF
 k+tcch3+tgCgpYTla1p4686FSK4OHoTfQisojua45mfKUEb7OYna0SnIdidZLcw2Wk
 w1lq8Z3tJR0kCcl9x12s/XPazBe0z//7cspVXa15VeS/vv49cSdCj1eW8CHVeSEx71
 KTneWAYkIsy+w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=KMz6PhOE
Subject: Re: [Buildroot] [PATCH] utils/brmake: filter output for parallel
 build
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVmluY2VudCwKCk9uIDEwLzkvMjUgMTc6MjgsIFZpbmNlbnQgU3RlaGzDqSB3cm90ZToKPiBX
aGVuIGJ1aWxkaW5nIGluIHBhcmFsbGVsIHdpdGggcGVyLXBhY2thZ2UgZGlyZWN0b3JpZXMKPiAo
QlIyX1BFUl9QQUNLQUdFX0RJUkVDVE9SSUVTPXkpLCBicm1ha2Ugb3V0cHV0IGlzIG9mdGVuIGdh
cmJsZWQ6Cj4gCj4gICAgMjAyNS0xMC0wOFQxODozOToxMCA+Pj4gaG9zdC1kdGMgMS43LjIgQnVp
bGRpbmcKPiAgICAyMDI1LTEwLTA4VDE4OjM5OjExIGNoZWNraW5nIGZvciBzdGRpbnQuaC4uLiA+
Pj4gaG9zdC1kdGMgMS43LjIgSW5zdGFsbGluZyB0byBob3N0IGRpcmVjdG9yeQo+ICAgIDIwMjUt
MTAtMDhUMTg6Mzk6MTIgY2hlY2tpbmcgZm9yIGxpbWl0cy5oLi4uID4+PiBob3N0LWdtcCA2LjMu
MCBJbnN0YWxsaW5nIHRvIGhvc3QgZGlyZWN0b3J5Cj4gCj4gUmVtb3ZlIHRoZSBzcHVyaW91cyBz
dHJpbmcgYmV0d2VlbiB0aGUgdGltZXN0YW1wIGFuZCB0aGUgIj4+PiIgbWFya2VyIHRvCj4gZml4
IHRoaXMuCgpBZnRlciB0ZXN0aW5nIHRoaXMgY2hhbmdlIGZvciBhIGZldyBkYXlzIG5vdywgSSBo
YXZlIHR3byBzbGlnaHRseSBvZGQgCnRoaW5ncyB0byByZXBvcnQ6CgpJIGhhdmUgc2VlbiB0aGUg
Zm9sbG93aW5nIHRoaW5nIGhhcHBlbiBvbmNlIGR1cmluZyBhIENJIHJ1biwgd2hlcmUgMiBvZiAK
dGhlIGxpbmVzIHdoZXJlIHRydW5jYXRlZCBpbiB0aGUgbWlkZGxlIG9mIHRoZSB0aW1lc3RhbXAu
IEkgaGF2ZSBsb29rZWQgCnRocm91Z2ggYSBidW5jaCBvZiBidWlsZCBsb2dzIG5vdyBidXQgaGF2
ZW4ndCBzZWVuIHRoaXMgYWdhaW4sIHNvIG5vdCAKc3VyZSBpZiB0aGF0J3MgYW4gYWN0dWFsIHBy
b2JsZW0gd2UgbmVlZCB0byBjYXJlIGFib3V0CgoyMDI1LTEwLTE0VDEwOjI4OjAxID4+PiBbc29t
ZXRoaW5nXQoyMDIKMjAyNS0xMC0xNFQxMDoyODowMSA+Pj4gW21vcmUgdGhpbmdzXQpbLi4uIGxv
dHMgb2Ygc3R1ZmYgaW4gYmV0d2Vlbl0KMjAyNS0xMC0xCgoKQW5kIHNlY29uZGx5LCBhbHNvIGlu
IENJOgpUaGUgIkRvbmUgaW4gWG1pbiBZcyIgdGV4dCB0aGF0IGlzIHByaW50ZWQgaW4gdGhlIGVu
ZCBpcyBzdGlsbCBhbHdheXMgCmRpc3BsYXllZCBpbiB0aGUgbWlkZGxlIG9mIGEgbGluZSBkdXJp
bmcgdGhlIGVuZCBvZiB0aGUgYnVpbGQgb3V0cHV0OgoKMjAyNS0xMC0xN1QwODo1MjoyOCA+Pj4g
b3dmcyAzLjJwNCBJbnN0YWxsaW5nIHRvIHN0YWdpbmcgZGlyZWN0b3J5CjIwMjUtMTAtMTdUMDg6
NTI6MjkgPj4+IG93ZnMgMy4ycDQgRml4aW5nIGxpYnRvb2wgZkRvbmUgaW4gN21pbiAzN3MKaWxl
cwoyMDI1LTEwLTE3VDA4OjUyOjMwID4+PiBvd2ZzIDMuMnA0IEluc3RhbGxpbmcgdG8gdGFyZ2V0
CjIwMjUtMTAtMTdUMDg6NTI6MzggPj4+IHB5dGhvbi1weWRhbnRpYy1jb3JlIDIuMzMuMiBJbnN0
YWxsaW5nIHRvIHRhcmdldAoyMDI1LTEwLTE3VDA4OjUyOjUyID4+PiBlMmZzcHJvZ3MgMS40Ny4y
IEJ1aWxkaW5nClsuLi5dCgpBZGRpbmcgdGhlIC0tdW5idWZmZXJlZCBhcmd1bWVudCB0byB0aGUg
ZmluYWwgc2VkIGNhbGwsIGZpeGVzIHRoYXQuCgoKPiBXZSBuZWVkIHNvbWUgZXh0cmEgY2FyZSB0
byBwcmVzZXJ2ZSB0aGUgcHJlY2VkaW5nICJ0ZXJtIGJvbGQiIHNwZWNpYWwKPiBjaGFyYWN0ZXJz
IHNlcXVlbmNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5z
dGVobGVAYXJtLmNvbT4KPiBDYzogWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUu
ZnI+Cj4gLS0tCj4gICB1dGlscy9icm1ha2UgfCAzICsrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS91dGlscy9icm1h
a2UgYi91dGlscy9icm1ha2UKPiBpbmRleCBhNGI5ZTdmYTcxLi4yYTc0ZDU4MTY3IDEwMDc1NQo+
IC0tLSBhL3V0aWxzL2JybWFrZQo+ICsrKyBiL3V0aWxzL2JybWFrZQo+IEBAIC0xMiw3ICsxMiw4
IEBAIG1haW4oKSB7Cj4gICAgICAgICAgICAgICAgcHJpbnRmICIlKCVZLSVtLSVkVCVIOiVNOiVT
KVQgJXNcbiIgLTEgIiR7bGluZX0iCj4gICAgICAgICAgICBkb25lIFwKPiAgICAgICAgICAgIHx0
ZWUgLWEgYnIubG9nIFwKPiAtICAgICAgICAgfGdyZXAgLS1jb2xvdXI9bmV2ZXIgLUUgJz4+PicK
PiArICAgICAgICAgfGdyZXAgLS1saW5lLWJ1ZmZlcmVkIC0tY29sb3VyPW5ldmVyIC1FICc+Pj4n
IFwKPiArICAgICAgICAgfHNlZCAtRSAncy9eKFswLTlUOi1dezE5fSkgW1s6cHJpbnQ6XV0qKC4q
Pj4+ICkvXDEgXDIvJwo+ICAgICAgICAgICkKPiAgICAgICByZXQ9JHs/fQo+ICAgCgoKTWFyY3Vz
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
