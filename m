Return-Path: <SRS0=R6N7=NW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C09AC432BE
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 15:35:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8188E61053
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 15:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8188E61053
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andin.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 513EF406C2;
	Tue, 31 Aug 2021 15:35:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uA2OMlfaL8nX; Tue, 31 Aug 2021 15:35:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A05A0406C5;
	Tue, 31 Aug 2021 15:35:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 39C461BF21A
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 15:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28AFF406C5
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 15:35:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dwyn4AlbomrK for <buildroot@lists.busybox.net>;
 Tue, 31 Aug 2021 15:35:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from dd5108.kasserver.com (dd5108.kasserver.com [85.13.130.47])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05899406D3
 for <buildroot@buildroot.org>; Tue, 31 Aug 2021 15:35:44 +0000 (UTC)
Received: from [192.168.178.25] (ipb21bd527.dynamic.kabel-deutschland.de
 [178.27.213.39])
 by dd5108.kasserver.com (Postfix) with ESMTPSA id 815725240A2E;
 Tue, 31 Aug 2021 17:35:41 +0200 (CEST)
To: Arnout Vandecappelle <arnout@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20210817083930.3718711-1-herve.codina@bootlin.com>
 <20210817083930.3718711-8-herve.codina@bootlin.com>
 <20210828224740.GS2661@scaer> <20210829133955.74d921e9@windsurf>
 <8b85fc92-b792-dccc-6258-bc6a07a03848@mind.be>
From: Andreas Naumann <dev@andin.de>
Message-ID: <a27416bf-9d89-6000-f1b0-42e4bf99e8fd@andin.de>
Date: Tue, 31 Aug 2021 17:35:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8b85fc92-b792-dccc-6258-bc6a07a03848@mind.be>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH v3 07/16] package/pkg-generic.mk: detect
 files overwritten in TARGET_DIR and HOST_DIR
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Herve Codina <herve.codina@bootlin.com>,
 Naumann Andreas <ANaumann@ultratronik.de>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGkgYWxsLAoKT24gMjkuMDguMjEgMTc6MDEsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+
IAo+IAo+IE9uIDI5LzA4LzIwMjEgMTM6MzksIFRob21hcyBQZXRhenpvbmkgd3JvdGU6Cj4+IEhl
bGxvIFlhbm4sCj4+IAo+PiBGaXJzdCBvZiBhbGwsIHRoYW5rcyBhIGxvdCBmb3IgcmV2aWV3aW5n
IGFuZCBtZXJnaW5nIGJpdHMgb2YgdGhpcwo+PiBwYXRjaCBzZXJpZXMsIEknbSBnbGFkIHRvIHNl
ZSB3ZSdyZSBtYWtpbmcgcHJvZ3Jlc3Mgd2l0aCB0aGUgVExQCj4+IHN0dWZmLgo+PiAKPj4gT24g
U3VuLCAyOSBBdWcgMjAyMSAwMDo0Nzo0MCArMDIwMCAiWWFubiBFLiBNT1JJTiIKPj4gPHlhbm4u
bW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPj4gCj4+PiBIb3dldmVyLCB3aGF0IHByb21wdGVk
IG1lIGZyb20gYXBwbHlpbmcgZm9yIG5vdywgaXMgdGhhdCB0aGlzCj4+PiBuZXcgZGV0ZWN0aW9u
IGlzIGEgaGFyZCBlcnJvci4KPj4+IAo+Pj4gUHJldmlvdXNseSwgY2hlY2stdW5pcS1maWxlcyB3
YXMganVzdCBlbWl0dGluZyB3YXJuaW5ncywgYnV0Cj4+PiB3b3VsZCBub3QgcHJldmVudCB0aGUg
YnVpbGQgZnJvbSBmYWlsaW5nLiBOb3csIHdpdGggdGhpcyBwYXRjaCwKPj4+IGV2ZW4gYW4gaW5u
b2N1b3VzIG92ZXJ3cml0ZSAoZS5nLiBiZWNhdXNlIGEgcG9zdC1idWlsZCBzY3JpcHQKPj4+IGRl
bGV0ZXMgdGhlIGZpbGUsIG9yIHRoZSBjb250ZW50IG9mIHRoZSBmaWxlIHJlYWxseSBkb2VzIG5v
dAo+Pj4gbWF0dGVyIGF0IHJ1bnRpbWUpLCB0aGUgYnVpbGQgd2lsbCBmYWlsLgo+Pj4gCj4+PiBJ
LmUuIGNvbmZpZ3VyYXRpb25zIHRoYXQgYXJlIGN1cnJlbnRseSB3b3JraW5nIHdpdGggUFBELCBk
ZXNwaXRlCj4+PiB0aGUgb3ZlcndyaXRlLCB3aWxsIHN1ZGRlbmx5IG5vIGxvbmdlciBidWlsZC4K
Pj4+IAo+Pj4gT1RPSCwgaWYgd2UgZG8gbm90IG1ha2UgdGhhdCBhIGhhcmQtZXJyb3IsIHdlIHdp
bGwgbmV2ZXIgZGV0ZWN0Cj4+PiBtb3N0IGlzc3VlcywgYmVjYXVzZSB1c2VycyB3aWxsIG5ldmVy
IHNwb3QgdGhvc2Ugd2FybmluZ3MgYW5kIHdpbAo+Pj4gZW52ZXIgcmVwb3J0IGlzc3VlcywgYW5k
IHRoZSBhdXRvYnVpbGRlcnMgd2lsbCBub3QgZmFpbCBhbmQgd2UKPj4+IHdpbGwgbm90IG5vdGlj
ZSBlaXRoZXIuLi4KPj4+IAo+Pj4gT25lIHNvbHV0aW9uIGlzIHRvIGFkZCBhIGNvbmZpZ3VyYXRp
b24ga25vYiB0byBtYWtlIHRoYXQgYQo+Pj4gaGFyZC1lcnJvciwgbGlrZSB3ZSBoYXZlIHRoZSBw
YXJhbm9pZCBsaWJzL2hlYWRlcnMgY2hlY2s6Cj4+PiAKPj4+IGNvbmZpZyBCUjJfUFBEX09WRVJX
UklURV9TVFJJQ1QgYm9vbCAiU3RyaWN0IGZpbGUgb3ZlcndyaXRlCj4+PiBkZXRlY3Rpb24iIGRl
cGVuZHMgb24gQlIyX1BFUl9QQUNLQUdFX0RJUkVDVE9SSUVTIGhlbHAgU2F5ICd5Jwo+Pj4gaGVy
ZSB0byB0dXJuIHRoZSBmaWxlIG92ZXJ3cml0ZSBkZXRlY3Rpb24gdG8gYSBoYXJkIGVycm9yLiBC
eQo+Pj4gZGVmYXVsdCwgb25seSB3YXJuaW5ncyB3aWxsIGJlIHByaW50ZWQuCj4+IAo+PiBXZSBo
YWQgc29tZSBkaXNjdXNzaW9uIHdpdGggSGVydsOpIGJhY2sgd2hlbiBoZSB3b3JrZWQgb24gdGhp
cywgYW5kCj4+IEkgZGlzYWdyZWVkIHdpdGggYWRkaW5nIGFuIG9wdGlvbi4gV2hlbgo+PiBCUjJf
UEVSX1BBQ0tBR0VfRElSRUNUT1JJRVM9eSwgYSBmaWxlIG92ZXJ3cml0ZSBtdXN0IGJlIGEgaGFy
ZAo+PiBlcnJvciwgYXMgdGhlIHJlc3VsdCBvZiB0aGUgYnVpbGQgaXMgaW5jb3JyZWN0IGlmIHRo
ZXJlIGlzIGFuCj4+IG92ZXJ3cml0ZS4gSXQncyBub3QgdGhlICJsYXRlc3QiIHBhY2thZ2UgdGhh
dCB3aW5zIGluIGFuIG92ZXJ3cml0ZQo+PiBzaXR1YXRpb24sIGxpa2UgaXQgZG9lcyBpbiBhIG5v
bi1QUEQgY2FzZS4KPj4gCj4+IFNvIEkgcmVhbGx5IHRoaW5rIHRoaXMgbXVzdCBiZSBhIGhhcmQg
ZXJyb3IgZm9yIFBQRCBidWlsZHMsIGFuZAo+PiBqdXN0IGEgd2FybmluZyBmb3Igbm9uLVBQRCBi
dWlsZHMuCj4+IAo+PiBZZXMsIGZvciBQUEQgYnVpbGRzLCBpdCBtZWFucyB1c2VycyB3aWxsIGdl
dCBmYWlsdXJlcywgYnV0IHRob3NlIAo+PiBmYWlsdXJlcyBhcmUgcG9pbnRpbmcgdG8gcmVhbCBw
cm9ibGVtcy4KPj4gCj4+IFNvLCBteSBwcmVmZXJlbmNlIHdvdWxkIGJlIHRvIG1lcmdlIGFzIGFu
IHVuY29uZGl0aW9uYWwgY2hlY2ssIGFuZAo+PiBzZWUgaG93IGl0IGdvZXMuIFBlcmhhcHMgdGhl
IHNpdHVhdGlvbiB3aWxsIGJlIHNvIGJhZCB0aGF0IHdlIHdpbGwKPj4gaGF2ZSB0byBtYWtlIGl0
IGNvbmRpdGlvbmFsLCBidXQgSSB3b3VsZCBwcmVmZXIgdG8gaGF2ZSBpdAo+PiB1bmNvbmRpdGlv
bmFsIGZpcnN0IGFuZCBzZWUgdGhlIGltcGFjdC4KPiAKPiBJIHdhcyBvcmlnaW5hbGx5IHdpdGgg
WWFubiwgYnV0IHRoZXNlIGFyZ3VtZW50cyBjb252aW5jZWQgdGhhdCBpdCBpcwo+IGluZGVlZCBi
ZXR0ZXIgdG8gbm90IGhhdmUgdGhlIG9wdGlvbiAoZm9yIG5vdykuCgpTbyBJJ20gb25lIG9mIHRo
b3NlIGFjdGl2ZWx5IHVzaW5nIFRMUEQgYW5kIEknbSBoYXBweSB0byBoYXZlIHRoaXMKcHJvZHVj
aW5nIGhhcmQgZXJyb3JzIHRvIGZpbmQgcG9zc2libGUgaXNzdWVzIGluIG15IGNvbmZpZ3MgYXMg
d2VsbCBhcwpoZWxwaW5nIHRvIGZpeCB0aGVtLgoKU28gSSBnYXZlIHRoaXMgYSBzcGluIGFuZCBp
bW1lZGlhdGVseSBmb3VuZCB1dGlsLWxpbnV4IHJlY29tcGlsaW5nIHNvbWUKbGlicyB3aGljaCB1
dGlsLWxpbnV4LWxpYnMgYWxyZWFkeSBpbnN0YWxsZWQuIExvb2tpbmcgZm9yIHRoZSByZWFzb24g
SQpjYW1lIHVwb24gQ2FybG9zIFNhbnRvcyBDb21taXQgOGJhZmM2ZGMgInBhY2thZ2UvdXRpbC1s
aW51eDogYnVpbGQKcHJvZ3JhbXMgYW5kIGxpYnJhcmllcyBpbiBzZXBhcmF0ZSBwYWNrYWdlcyIg
d2hlcmUgdGhlIGNvbW1pdCBtc2cgc2F5cwoiLi4uLiBJbnN0YWxsaW5nIHV0aWwtbGludXggb3Zl
cnJpZGVzIGZpbGVzIGluc3RhbGxlZCBieSB1dGlsLWxpbnV4LWxpYnMKYnV0IHRoaXMgaXMgbm90
IGEgcHJvYmxlbTogaXQncyBhbGxvd2VkIGZvciBhIHBhY2thZ2UgdG8gb3ZlcndyaXRlIGZpbGVz
CmZyb20gYW5vdGhlciBwYWNrYWdlLCBhcyBsb25nIGFzIHRoZXJlIGlzIGEgZGVwZW5kZW5jeSBi
ZXR3ZWVuIHRoZSB0d28uIgoKU28gaWYgdGhpcyBpcyBzdGlsbCB0cnVlLCB0aGUgbG9naWMgc2hv
dWxkIGJlIGNoYW5nZWQgdG8gdGFrZQpkZXBlbmRlbmNpZXMgaW50byBhY2NvdW50IGxpa2Ugc3Vn
Z2VzdGVkIGluIHRoZSBvdGhlciBkaXNjdXNzaW9uLgoKSG93ZXZlciwgdGhlIGNoZWNrIGFsc28g
Zm91bmQgYSBjb25mbGljdCB3aGVyZSBHTC9nbGV4dC5oIG9mIG1lc2EzZCBpcwpvdmVyd3JpdHRl
biBieSBnc3QxLXBsdWdpbnMtYmFzZS4gSXQgaXMgYSBkZXBlbmRlbmN5LCB0aHVzIGl0J3MKZGV0
ZXJtaW5pc3RpYywgYnV0IHN0aWxsIHdlIHByb2JhYmx5IGVuZCB1cCB3aXRoIGFuIHVuZXhwZWN0
ZWQgdmVyc2lvbgpnbGV4dC5oIGluIHRoZSBTREssIHNvIGl0J3MgbmljZSB0aGF0IHRoaW5ncyBs
aWtlIHRoaXMgYXJlIGJyb3VnaHQgdG8KYXR0ZW50aW9uLgoKTm93IHRoZSBidWlsZCBvZiBvdXIg
c3RhbmRhcmQgcXQtZGVtbyBjb25maWcgaXMgYWxtb3N0IGRvbmUgYW5kIGFub3RoZXIKY29uZmxp
Y3QgcG9wcyB1cCB3aGVuIHNvbWUga2VybmVsIG1vZHVsZXMgb2YgV2lmaS1TdGlja3MgYXJlIGlu
c3RhbGxlZC4KT2YgY291cnNlIG1vZHVsZXMuZGVwLCBtb2R1bGVzLmFsaWFzIGFuZCBzbyBvbiBh
cmUgbW9kaWZpZWQuIFRoYXQgd2lsbCAKaGF2ZSB0byBiZSB0YWtlbiBjYXJlIG9mLgoKSG93ZXZl
ciwgb25seSAzIHByb2JsZW1zIHVwIHRvIGp1c3QgYmVmb3JlIHRoZSB0YXJnZXQtZmluYWxpemUg
c3RlcC4gU28KZmFyIHRoYXQncyBub3QgdG9vIGFnZ3Jlc3NpdmUgZm9yIG1lLgoKCnJlZ2FyZHMs
CkFuZHJlYXMKCgoKPiAKPiBSZWdhcmRzLCBBcm5vdXQKPiAKPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXyBidWlsZHJvb3QgbWFpbGluZwo+IGxpc3QgYnVp
bGRyb290QGJ1c3lib3gubmV0IAo+IGh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidXN5Ym94Lm5ldApo
dHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
