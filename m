Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF2DC83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 959744067A;
	Thu, 17 Jul 2025 20:38:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RtE0xMdqINKQ; Thu, 17 Jul 2025 20:38:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1B0D40CAD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1B0D40CAD;
	Thu, 17 Jul 2025 20:38:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 12A4A226
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0484B403B0
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:38:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g-ZbvUy3VuoP for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:38:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1283D40142
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1283D40142
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1283D40142
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:38:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5CD81B977A8D; Thu, 17 Jul 2025 22:38:09 +0200 (CEST)
Message-ID: <02953971-578f-4bdd-9419-c577187226f2@rnout.be>
Date: Thu, 17 Jul 2025 22:38:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Titouan Christophe <titouan.christophe@mind.be>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
References: <20250716102159.306474-1-titouan.christophe@mind.be>
 <1f135eeb-13b6-4386-b6f2-bc389bbb8944@rnout.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <1f135eeb-13b6-4386-b6f2-bc389bbb8944@rnout.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752784689; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=LRjDnlyzqMkmu9twe6j11U9X3kLvha8qJWlkonsZpJc=;
 b=hkQTxxaBGeXKtiC9FBoMlum6A5LTXeyjG5JUfXERiMOVuG9KGPR2Jc2Ggm8JnwTR3rfuOh
 0sWwl6N5yqzcpFwbtVT6FhWof4He2UgWk7lVgHL1qLJCEjq2cpD/Enx8O9biv0i6Ok4im9
 kM5swdyHlVj/S7D4z4tw6ad500vWHFTNyrrjjElHBjsEZEfFcN1q6uIGqerOAvEbL/vX0N
 SvfNaYJAuq+WSg/e6YQHTZMKpiF+w0fUiM2PnlQAU75w0dxxTFoKEqt/4ws6bDrTmqA0eD
 d2o00mn0LgJm1YmrNPIV0K/d6iguBQ3Ug7MGvr7q0+jLa34vCFYTQsRrJ/UksQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=hkQTxxaB
Subject: Re: [Buildroot] [PATCH] package/python-aiohttp: security bump to
 v3.12.14
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNy8wNy8yMDI1IDIyOjI5LCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3cm90ZToKPiAKPiAK
PiBPbiAxNi8wNy8yMDI1IDEyOjIxLCBUaXRvdWFuIENocmlzdG9waGUgdmlhIGJ1aWxkcm9vdCB3
cm90ZToKPj4gVGhpcyBmaXhlcyB0aGUgZm9sbG93aW5nIHZ1bG5lcmFiaWxpdHk6Cj4+IC0gQ1ZF
LTIwMjUtNTM2NDM6Cj4+IMKgwqDCoMKgIEluIGFpb2h0dHAgcHJpb3IgdG8gdmVyc2lvbiAzLjEy
LjE0LCB0aGUgUHl0aG9uIHBhcnNlciBpcyB2dWxuZXJhYmxlCj4+IMKgwqDCoMKgIHRvIGEgcmVx
dWVzdCBzbXVnZ2xpbmcgdnVsbmVyYWJpbGl0eSBkdWUgdG8gbm90IHBhcnNpbmcgdHJhaWxlcgo+
PiDCoMKgwqDCoCBzZWN0aW9ucyBvZiBhbiBIVFRQIHJlcXVlc3QuIElmIGEgcHVyZSBQeXRob24g
dmVyc2lvbiBvZiBhaW9odHRwIGlzCj4+IMKgwqDCoMKgIGluc3RhbGxlZCAoaS5lLiB3aXRob3V0
IHRoZSB1c3VhbCBDIGV4dGVuc2lvbnMpIG9yCj4+IMKgwqDCoMKgIEFJT0hUVFBfTk9fRVhURU5T
SU9OUyBpcyBlbmFibGVkLCB0aGVuIGFuIGF0dGFja2VyIG1heSBiZSBhYmxlIHRvCj4+IMKgwqDC
oMKgIGV4ZWN1dGUgYSByZXF1ZXN0IHNtdWdnbGluZyBhdHRhY2sgdG8gYnlwYXNzIGNlcnRhaW4g
ZmlyZXdhbGxzIG9yCj4+IMKgwqDCoMKgIHByb3h5IHByb3RlY3Rpb25zLiBWZXJzaW9uIDMuMTIu
MTQgY29udGFpbnMgYSBwYXRjaCBmb3IgdGhpcyBpc3N1ZS4KPj4gwqDCoMKgwqAgaHR0cHM6Ly93
d3cuY3ZlLm9yZy9DVkVSZWNvcmQ/aWQ9Q1ZFLTIwMjUtNTM2NDMKPj4KPj4gU2lnbmVkLW9mZi1i
eTogVGl0b3VhbiBDaHJpc3RvcGhlIDx0aXRvdWFuLmNocmlzdG9waGVAbWluZC5iZT4KPiAKPiAg
wqBBcHBsaWVkIHRvIDIwMjUuMDIueCBhbmQgMjAyNS4wNS54LCB0aGFua3MuCgogIEdhaCwgSSBt
ZWFudCB0byBtYXN0ZXIhCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IAo+ICDCoFJlZ2FyZHMsCj4g
IMKgQXJub3V0Cj4gCj4+IC0tLQo+PiDCoCBwYWNrYWdlL3B5dGhvbi1haW9odHRwL3B5dGhvbi1h
aW9odHRwLmhhc2ggfCA0ICsrLS0KPj4gwqAgcGFja2FnZS9weXRob24tYWlvaHR0cC9weXRob24t
YWlvaHR0cC5ta8KgwqAgfCA0ICsrLS0KPj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1h
aW9odHRwL3B5dGhvbi1haW9odHRwLmhhc2ggYi9wYWNrYWdlL3B5dGhvbi0gCj4+IGFpb2h0dHAv
cHl0aG9uLWFpb2h0dHAuaGFzaAo+PiBpbmRleCBhYzEyY2FmZWVhLi4wYWE4ZGJkM2JjIDEwMDY0
NAo+PiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1haW9odHRwL3B5dGhvbi1haW9odHRwLmhhc2gKPj4g
KysrIGIvcGFja2FnZS9weXRob24tYWlvaHR0cC9weXRob24tYWlvaHR0cC5oYXNoCj4+IEBAIC0x
LDUgKzEsNSBAQAo+PiDCoCAjIG1kNSwgc2hhMjU2IGZyb20gaHR0cHM6Ly9weXBpLm9yZy9weXBp
L2Fpb2h0dHAvanNvbgo+PiAtbWQ1wqAgNzgzNWYyOGU0MWFkZjZmMDk0Njc1MzNlOGRlMGMxOTnC
oCBhaW9odHRwLTMuMTEuMTQudGFyLmd6Cj4+IC1zaGEyNTbCoCBkNmVkYzUzOGM3NDgwZmEwYTNi
MmJkZDcwNWY4MDEwMDYyZDc0NzAwMTk4ZGE1NWQxNjQ5OGUxYjQ5NTQ5YjljICAKPj4gYWlvaHR0
cC0zLjExLjE0LnRhci5nego+PiArbWQ1wqAgNGVkNjZkY2VjNjMxMDhhZTNhN2MwMWQwNDE1YjRk
ZDnCoCBhaW9odHRwLTMuMTIuMTQudGFyLmd6Cj4+ICtzaGEyNTbCoCA2ZTA2ZTEyMGUzNGQ5MzEw
MGRlNDQ4ZmQ5NDE1MjJlMTFkYWZhNzhlZjFhODkzYzE3OTkwMWI3ZDY2YWEyOWYyICAKPj4gYWlv
aHR0cC0zLjEyLjE0LnRhci5nego+PiDCoCAjIExvY2FsbHkgY29tcHV0ZWQgc2hhMjU2IGNoZWNr
c3Vtcwo+PiDCoCBzaGEyNTbCoCA5ZjgwZDBkYjdkNzU1YTk0MWRiNDU3MjE3MmMyNzBlY2JkOGYw
ODJiYTIxNWRkZDA5NTk4NTk0MmVkOTRhOWViICAKPj4gTElDRU5TRS50eHQKPj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvcHl0aG9uLWFpb2h0dHAvcHl0aG9uLWFpb2h0dHAubWsgYi9wYWNrYWdlL3B5
dGhvbi0gCj4+IGFpb2h0dHAvcHl0aG9uLWFpb2h0dHAubWsKPj4gaW5kZXggZDNlN2QxMmViNi4u
ZTUyYjZlODFjNSAxMDA2NDQKPj4gLS0tIGEvcGFja2FnZS9weXRob24tYWlvaHR0cC9weXRob24t
YWlvaHR0cC5tawo+PiArKysgYi9wYWNrYWdlL3B5dGhvbi1haW9odHRwL3B5dGhvbi1haW9odHRw
Lm1rCj4+IEBAIC00LDkgKzQsOSBAQAo+PiDCoCAjCj4+ICAgCj4+ICMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjCj4+IC1QWVRIT05fQUlPSFRUUF9WRVJTSU9OID0gMy4xMS4xNAo+PiArUFlUSE9OX0FJ
T0hUVFBfVkVSU0lPTiA9IDMuMTIuMTQKPj4gwqAgUFlUSE9OX0FJT0hUVFBfU09VUkNFID0gYWlv
aHR0cC0kKFBZVEhPTl9BSU9IVFRQX1ZFUlNJT04pLnRhci5nego+PiAtUFlUSE9OX0FJT0hUVFBf
U0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy8gCj4+IHBhY2thZ2VzLzZjLzk2
LzkxZTkzYWU1ZmQwNGQ0MjhjMTAxY2RiYWJjZTZjODIwZDI4NGQ2MWQyNjE0ZDAwNTE4ZjRmYTUy
ZWEyNAo+PiArUFlUSE9OX0FJT0hUVFBfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVk
Lm9yZy9wYWNrYWdlcy9lNi8wYi8gCj4+IGUzOWFkOTU0MTA3ZWJmMjEzYTIzMjUwMzhhM2U3YTUw
NmJlM2Q5OGUxNDM1ZTFmODIwODZlZWM0Y2RlMgo+PiDCoCBQWVRIT05fQUlPSFRUUF9TRVRVUF9U
WVBFID0gc2V0dXB0b29scwo+PiDCoCBQWVRIT05fQUlPSFRUUF9MSUNFTlNFID0gQXBhY2hlLTIu
MAo+PiDCoCBQWVRIT05fQUlPSFRUUF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRS50eHQKPiAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
