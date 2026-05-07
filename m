Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127B4CD3442
	for <buildroot@archiver.kernel.org>; Thu,  7 May 2026 08:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B981B60881;
	Thu,  7 May 2026 08:34:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PeNxdNtZzdqE; Thu,  7 May 2026 08:34:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDE4160AB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778142884;
	bh=sNhlPQpQh72bZzYClmJYq1rc356dR5/4R4z6BA8QVaM=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=TiRwjgKGunVpj63dsjgVdpGokJS/MavO0eHJOjuEgXNC/7J3z+bRrmTWiY5PwOLDd
	 PnpPCRvMkxOw6iMyG6ox7IMwwYvZFRFuBWi02yKE01VsxjnzQ5unypyswqR2rfv8nH
	 xaxc0BQdtx9J1/4oyZtLbjiiC3h/rlz33x9ZTgtHMxQOlpIxtlWtAZ5L6yVErNzy9t
	 s1NyUUPpCo8ujN3w06186+EcvcI8RufrNIDHhrbMl7TMaZoaUpFIaDS9WurnNpfzgx
	 0qmB9x/Hx0GUGy3vAhTAkXWmTVwr1HRAqII7j6orvTDmd9RAwCFCmjsyth8QCPfLXs
	 RdJSvziG2HiOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDE4160AB8;
	Thu,  7 May 2026 08:34:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9EFAA280
 for <buildroot@buildroot.org>; Thu,  7 May 2026 08:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 848DE4107C
 for <buildroot@buildroot.org>; Thu,  7 May 2026 08:34:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yaaMpSc51QTR for <buildroot@buildroot.org>;
 Thu,  7 May 2026 08:34:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0B48740C1C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B48740C1C
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B48740C1C
 for <buildroot@buildroot.org>; Thu,  7 May 2026 08:34:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 25BEAB97C2C7; Thu,  7 May 2026 10:34:37 +0200 (CEST)
Message-ID: <b8636103-f323-4345-9e10-ecc8c976497b@rnout.be>
Date: Thu, 7 May 2026 10:34:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
References: <20260426153334.1026982-1-fiona.klute@gmx.de>
 <5db0b73a-7fed-403f-bc7d-22411a71735d@rnout.be>
 <325e5bfb-48f8-40e9-b1c6-6081dfec116a@gmx.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <325e5bfb-48f8-40e9-b1c6-6081dfec116a@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1778142879; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=HDiNqPxqAkOtdaw5tn2QbIoik0tUJWMyK8QZ5NPbpU0=;
 b=eRzqz0AlyNTF52lpBya2Uvcr7nildW40A3LeGxu18twnbgVlbp55zCw+dOdLsdKKzwWsBM
 gcigARgW3iWIjnJn43jwqs0OJkNLVctmOK61A6QQUstirovolE0S7WqHTfkbljsGEigZN7
 WRAMJciXPfg6nVZG1RdQwF4jqJMZ+gTiz3IJLC8TYaXtEh0po35URsP5JrDxva7ZfMyU3k
 IVUt4U7Uh71E7QfZdg0sReRhKLrXfLZFQczgVZ65rvV5dSmxKZMQbvjj9kmb+vikmsOLSq
 f3yj/zBM4wk0aXkloNQSCWN7Rb0JNBN2lAZnVBLr7SDuJkL1Tg0eARg15nIU0Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=eRzqz0Al
Subject: Re: [Buildroot] [PATCH v2 0/6] Bugfixes for pkg-stats
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
Cc: Romain Naour <romain.naour@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Marcus Hoffmann <buildroot@bubu1.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ICBbQWRkZWQgbWFpbnRhaW5lcnMgaW4gQ2MsIHNlZSB0aGUgZW5kXQoKT24gMDYvMDUvMjAyNiAx
OTo0OSwgRmlvbmEgS2x1dGUgd3JvdGU6Cj4gSGkgQXJub3V0IQo+IAo+IEFtIDA1LjA1LjI2IHVt
IDIxOjI1IHNjaHJpZWIgQXJub3V0IFZhbmRlY2FwcGVsbGU6Cj4+IMKgwqBJJ20gbWFraW5nIGFu
IGF0dGVtcHQgdG8gZ2V0IHRoaXMgc2VyaWVzIG1lcmdlZCA6LSkKPiAKPiBJIHNlZSB5b3Ugd2Vy
ZSBzdWNjZXNzZnVsLCB0aGFuayB5b3UhIDotKQo+IAo+PiDCoMKgQXMgYSBwcmVsaW1pbmFyeSBy
ZW1hcmsgdGhvdWdoOiBwa2ctc3RhdHMgcmVhbGx5IHNob3VsZCBldm9sdmUgdG8gdXNpbmcgCj4+
IHNob3ctaW5mbyBvdXRwdXQgaW5zdGVhZCBvZiBwYXJzaW5nIGZpbGVzIGl0c2VsZiAtIHRoYXQg
d291bGQgc29sdmUgdGhlIHRoaW5ncyAKPj4gbGlrZSB0aGUgaW5jb3JyZWN0IHBhdGNoZXMgYW5k
IGhhc2ggZmlsZXMuIFRoZXJlJ3Mgb25lIGJpZyBibG9ja2VyIGZvciB0aGF0IAo+PiB0aG91Z2gg
LSBwa2ctc3RhdHMgc3VwcG9zZWQgdG8gYmUgYWJsZSB0byB3b3JrIHdpdGhvdXQgYSAuY29uZmln
LCBhbmQgc2hvdy0gCj4+IGluZm8gY3VycmVudGx5IGRvZXNuJ3QuCj4gCj4gSW50ZXJlc3Rpbmch
IElzIHRoYXQgZG9jdW1lbnRlZCBzb21ld2hlcmUsIGUuZy4gaW4gbm90ZXMgZnJvbSBhIGRldmVs
b3BlciBtZWV0dXAgCj4gb3Igc29tZXRoaW5nPwoKICBObywgaXQncyBtb3JlIGEgdmliZSB0aGFu
IGEgcmVhbCBkZWNpc2lvbi4gV2hlbiBUaG9tYXMgaW50cm9kdWNlZCBzaG93LWluZm8gCmZvciB0
aGUgLWMgb3B0aW9uIG9mIHBrZy1zdGF0cyBpbiA3YTYwN2RhYjMsIHRoZSBmZWVkYmFjayB3YXMg
InRoYXQncyBncmVhdCwgd2UgCnNob3VsZCBhbHdheXMgZG8gdGhhdCIgYnV0IHRoYXQgdHVybmVk
IG91dCB0byBiZSBpbXBvc3NpYmxlIHNvIGl0IGdvdCBtZXJnZWQgYXMgaXMuCgo+IAo+IFsuLi5d
Cj4gCj4+PiBJIHNlZSBhIGJ1bmNoIG1vcmUgdGhpbmdzIHRoYXQgc2hvdWxkIGJlIGZpeGVkIChu
b3RhYmx5IHZpcnR1YWwKPj4+IHBhY2thZ2VzIHJlcG9ydGluZyBtaXNzaW5nIGxpY2Vuc2UvaGFz
aCBpbmZvIHdoZW4gdGhlcmUgc2ltcGx5IGlzCj4+PiBub25lLCBhbmQgdGhlIHBhY2thZ2UgcGFy
c2luZyBwcm9jZXNzIGl0c2VsZiksIHRoaXMgaXMgd2hhdCBJIGhhZCB0aW1lCj4+PiBmb3IuCj4+
Pgo+Pj4gT25lIHF1ZXN0aW9uIGZvciBwb3NzaWJsZSBmdXR1cmUgaW1wcm92ZW1lbnRzOiBJcyB0
aGUgSlNPTiBvdXRwdXQKPj4+IGZvcm1hdCBkb2N1bWVudGVkL2RlZmluZWQgYW55d2hlcmUsIG9y
IHNpbXBseSAid2hhdCB0aGUgc2NyaXB0Cj4+PiBwcm9kdWNlcywgc3ViamVjdCB0byBjaGFuZ2Ui
Pwo+Pgo+PiDCoMKgSWRlYWxseSBwa2ctc3RhdHMgd291bGQgaGF2ZSBkb2N1bWVudGF0aW9uLCBp
bmNsdWRpbmcgb2YgaXRzIEpTT04gb3V0cHV0LiAKPj4gQW5kIHRlc3RzIGFzIHdlbGwuIFdlIGNh
biBvbmx5IGRyZWFtLi4uCj4gSSdkIGxpa2UgYSBKU09OIHNjaGVtYSB3aXRoIGRlc2NyaXB0aW9u
cywgdGhhdCB3b3VsZCBhbHNvIGhlbHAgd2l0aCBhZGRpbmcgCj4gdGVzdHMuIDstKQo+IAo+IEkg
d2FzIGFjdHVhbGx5IHdvbmRlcmluZyBpZiBpdCdkIGJlIHBvc3NpYmxlIHRvIGFwcGx5IGZvciBh
IGdyYW50IGZvciBCdWlsZHJvb3QgCj4gd29yaywgZS5nLiB3aXRoIE5MbmV0IE5HSSBaZXJvIFsx
XS4gSXQgd291bGQgYmUgZWFzaXNlciB0byB0YWNrbGUgbGFyZ2VyIGNoYW5nZXMgCj4gdGhhdCB3
YXk6IFRoZXJlJ3MgdGhpcywgbWF5YmUga2luZCBvZiByZWxhdGVkIFNCT00gc3R1ZmYgSSB3YXMg
aW52b2x2ZWQgd2l0aCAKPiBiZWZvcmUgZm9yIGEgY2xpZW50IChsZWZ0IHVuZmluaXNoZWQvcGVu
ZGluZyBiZWNhdXNlIHRoZSBwcm9qZWN0IGVuZGVkKSwgYW5kIEkgCj4gaGF2ZSBzb21lIGlkZWFz
IGZvciBhbiBvdmVyaGF1bCBvZiB0aGUgdGVzdCBzeXN0ZW0uCj4gCj4gSWYgdGhhdCdzIGFuIG9w
dGlvbiAoYXMgaW4sIG1haW50YWluZXJzIGFwcHJvdmUgb2YgdGhlIGlkZWEpIEknZCBsaWtlIHRv
IGNvbGxlY3QgCj4gcmVxdWlyZW1lbnRzL2lkZWFzL2lzc3VlcyBhcyBiYXNlIGZvciBhIHBvc3Np
YmxlIGdyYW50IGFwcGxpY2F0aW9uLgoKICBJIHdvdWxkbid0IHNheSBubyB0byB0aGF0ISBXZSBh
Y3R1YWxseSBhbHNvIGhhdmUgc3BvbnNvcnMgdGhhdCBjb3VsZCAKY29udHJpYnV0ZSBtb3JlLiBJ
IGd1ZXNzIGl0IHdvdWxkIGhhdmUgdG8gYmUgcm91dGVkIHRocm91Z2ggdGhlIEJ1aWxkcm9vdCAK
QXNzb2NpYXRpb24gdGhlbi4KCiAgUmVnYXJkcywKICBBcm5vdXQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
