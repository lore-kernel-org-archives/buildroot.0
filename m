Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB75EDEBF1
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 21:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4B7C408FC;
	Tue,  3 Mar 2026 21:29:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LVMPH0sU0_A8; Tue,  3 Mar 2026 21:29:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD8CB40904
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772573358;
	bh=7UpLCD8eKSPfSBS+tZFtwiSuGFz6otRzyalAa6xcSkI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iFbwCudQEQRmiFZENBqKXyLAg0UQW0mneYDuCtCGB4Fh7qngwTeOVYKt2TLUKbvOd
	 vJIKX2dSpKpPJDAUT9mt/2hqjilcItpuPwnoHaX0jVDmTnYjjr/cIHuiUqCqV6Goix
	 zn5731OCXH/2wJOOXbKo3gzh+QwDSdQyOgs4xM7dMN32Ai1NpxNYPzHJqCGoJpj7pc
	 /B6Orjm0csh37bQ0xJNeISiJQEAkIEZyCXNsaDRIU1KFKA2ywyIMgWeKuzYkYMHxC/
	 Tt/wX0GzdjGDwKLE4sWfhhPlG1tgQ6247m9OoarxYCw6VxfCGZlSA9TPSEX1UPQ4nG
	 TGJsDdpzOpKAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD8CB40904;
	Tue,  3 Mar 2026 21:29:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 342011EB
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 21:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2460A8144C
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 21:29:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zvbUAWsux6Np for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 21:29:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E85CC81448
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E85CC81448
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E85CC81448
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 21:29:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AE691B97B4A1; Tue,  3 Mar 2026 22:29:12 +0100 (CET)
Message-ID: <434c54dd-ef43-4410-92cb-d504f695ef20@rnout.be>
Date: Tue, 3 Mar 2026 22:29:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: John Ernberg <john.ernberg@actia.se>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Cc: Jonas Blixt <jonas.blixt@actia.se>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jacob Chen <chenhao37@lixiang.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20241227160622.1654822-1-john.ernberg@actia.se>
 <961e39e7-8a98-4780-b847-c799dac04442@rnout.be>
 <206cc0fa-3213-4bb3-8494-8b9577d5b00a@actia.se>
Content-Language: en-GB, fr-BE
In-Reply-To: <206cc0fa-3213-4bb3-8494-8b9577d5b00a@actia.se>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1772573354; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=L8XFmhojecyqJP0pZ33ddEl7nmWpxX8JoktL7pcQfK4=;
 b=IljT9/5BM/+ahPLKjapsHJeNBuO84w9Dpr2uPoL7dxjhQoyRB/KdP9PsFmrno21LnonFQ5
 yG3FbYKRKTGZK46TJRoNkZ3e8QRxBVQsZlhV6DrCU6iJX+OWCU8TUUjiKqz75tVCYOa0Oj
 NIndvxA9p9EP+V/Kk2P80X97Ga6IBX+ybxHOebJDOV3k7fYP5+JGQ+I0rcKIkTzycJVflO
 9ACerFL2cvxH/ry+zvkJlTKKq3eqrrAsNJA9FKshhtxqR0dUjxBOwpvPqWlIGRAL8rmLs2
 8bT1y/9o91eQE8NZmxFLugxx3QDHzju7m404a2TID2djFECwo2UbYj5CMCsKoA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=IljT9/5B
Subject: Re: [Buildroot] [PATCH v2] package/pkg-utils: Prevent per-package
 syncing stale deps
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

ICBIaSBKb2huLAoKICBbQWRkaW5nIFlhbm4gZm9yIGhvcGVmdWxseSBtb3JlIGluc2lnaHRzLl0K
Ck9uIDI3LzAyLzIwMjYgMTc6MzcsIEpvaG4gRXJuYmVyZyB3cm90ZToKPiBIaSBBcm5vdXQsCj4g
Cj4gT24gMi80LzI2IDU6MzQgUE0sIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+PiAgIMKg
SGkgSm9obiwgSm9uYXMsCj4+Cj4+IE9uIDI3LzEyLzIwMjQgMTc6MDYsIEpvaG4gRXJuYmVyZyB3
cm90ZToKPj4+IEZyb206IEpvbmFzIEJsaXh0IDxqb25hcy5ibGl4dEBhY3RpYS5zZT4KPj4+Cj4+
PiBGcm9tOiBKb25hcyBCbGl4dCA8am9uYXMuYmxpeHRAYWN0aWEuc2U+Cj4+Pgo+Pj4gVGhpcyBm
aWx0ZXJzIG91dCB0aGUgZGVwZW5kZW5jeSBpbnB1dHMgd2hlbiBzeW5jaW5nIHRoZSBwZXItcGFj
a2FnZQo+Pj4gdGFyZ2V0IGRpcmVjdG9yeSB0byBvbmx5IGluY2x1ZGUgJ3NrZWxldG9uJyBhbmQg
aXRzIGRlcGVuZGVuY2llcywgaWYKPj4+IHRoZXkgZXhpc3QuIFNpbmNlIG90aGVyIGRlcGVuZGVu
Y2llcyBhcmUgbm90IG5lZWRlZCBpbiB0aGUgdGFyZ2V0IGRpcgo+Pj4gZm9yIHN1Y2Nlc3NmdWwg
YnVpbGRpbmcgdGhleSBjYW4gYmUgaWdub3JlZCBhbmQgZGVwZW5kIG9uIHRoZSBwcGQtbWVyZ2UK
Pj4+IHRvIHBvcHVsYXRlIHRoZSBmaWxlcyBmcm9tIHRoZSBvdGhlciBwYWNrYWdlcywgdW5saWtl
IHRoZSBzdGFnaW5nIGRpcgo+Pj4gd2hpY2ggaXMgdW50b3VjaGVkIGhlcmUuCj4+Cj4+ICAgwqBJ
IG1heSBiZSBtaXNzaW5nIHNvbWV0aGluZywgYnV0IGRvZXNuJ3QgdGhpcyBicmVhayB0aGUgY29t
YmluYXRpb24gb2YKPj4gYnVzeWJveAo+PiB3aXRoIGUuZy4gYXR0cj8gVGhlIGJ1c3lib3ggaW5z
dGFsbCBzY3JpcHQgY2hlY2tzIGlmIHRoZSBmaWxlIGFscmVhZHkKPj4gZXhpc3RzIGFuZAo+PiBk
b2VzIG5vdCBjcmVhdGUgdGhlIHN5bWxpbmsgd2hlbiBpdCBkb2VzLiBidXN5Ym94IGRlcGVuZHMg
b24gYXR0ciAoYW5kCj4+IGRvemVucyBvZgo+PiBvdGhlciBwYWNrYWdlcykgZm9yIGV4YWN0bHkg
dGhhdCByZWFzb24uCj4+Cj4+ICAgwqBUaGVyZSBhcmUgb3RoZXIgcGFja2FnZXMgYXMgd2VsbCB0
aGF0IHJlbHkgb24gdGhlIHByZXNlbmNlIG9mCj4+IHNvbWV0aGluZyBpbiB0aGUKPj4gdGFyZ2V0
IGRpcmVjdG9yeS4KPiAKPiBXZSBkaWRuJ3Qgbm90aWNlIGFueSBicmVha2FnZXMgb2YgYnVzeWJv
eCwgYnV0IHdlIGFsc28gb25seSB1c2UgYWJvdXQKPiAxMCB1dGlscyBvdXQgb2YgYnVzeWJveCAo
bm9uZSBvZiB0aGVtIGFyZSBwYXJ0IG9mIHRoZSBjb25mbGljdAo+IHBhY2thZ2VzIG9uIG91ciBj
b25maWcpLgo+IAo+IEl0IGRpZCBub3QgZXZlbiBjcm9zcyBteSBtaW5kIHBhY2thZ2VzIG1pZ2h0
IGRvIHRoYXQuIFRoYW5rIHlvdSBmb3IKPiBicmluZ2luZyBpdCB1cCEKCiAgVGhlIGFubm95aW5n
IHRoaW5nIGlzIHRoYXQgd2UgZG9uJ3QgZXZlbiBfa25vd18gd2hpY2ggcGFja2FnZXMgZG8gdGhh
dC4KCiAgU29sdmluZyB0aGlzIGlzc3VlIGFjdHVhbGx5IGhhcyB0aGUgbmljZSBzaWRlIGVmZmVj
dCB0aGF0IHdlIGNhbiBoYXZlIGEgY2hlY2sgCnRoYXQgbm8gdHdvIHBhY2thZ2VzIGluc3RhbGwg
dGhlIHNhbWUgZmlsZS4gV2UgaGFkIGEgcGF0Y2ggYWRkaW5nIHN1Y2ggYSBjaGVjayAKaW4gdGhl
IGJlZ2lubmluZyBvZiBQUEQsIGJ1dCB3ZSBoYWQgdG8gZHJvcCBpdCBiZWNhdXNlIGl0IHRyaWdn
ZXJlZCB0b28gbWFueSAKZmFpbHVyZXMgdGhhdCB3ZXJlIG5vdCBlYXN5IHRvIHNvbHZlLgoKPiAo
SSBoYXZlbid0IGludmVudG9yaWVkIHdoaWNoIG90aGVyIHBhY2thZ2VzIHlldCwgd2lsbCBkbyBp
ZiBpdCBiZWNvbWVzCj4gbmVjZXNzYXJ5IGFmdGVyIGJlbG93IHBvaW50cyBjb25zaWRlcmVkKQo+
IAo+IEkgY3VycmVudGx5IHNlZSAyIHdheXMgdG8gYXBwcm9hY2ggdGhpcyBwcm9ibGVtLCBwbGVh
c2UgbGV0IG1lIGtub3cKPiB3aGF0IHlvdSB0aGluayBhYm91dCB0aGVtLgo+IAo+IDEpIFdlIG1v
dmUgc3VjaCBzdGVwcyAoc3VjaCBhcyBnZW5lcmF0aW5nIHRoZSBidXN5Ym94IGFwcGxldCBsaW5r
cykKPiAgICAgIHRvIHRoZSBUQVJHRVRfRklOQUxJWkVfSE9PS1Mgc3RhZ2UuIFRoaXMgd2lsbCBu
ZWVkIHVzIHRvIGluc3RhbGwKPiAgICAgIG1vcmUgZmlsZXMgaW50byB0YXJnZXQvIHRoYXQgd2ls
bCBuZWVkIHRvIGJlIGlnbm9yZWQgbGF0ZXIgbGlrZQo+ICAgICAgdGhlIFRBUkdFVF9ESVJfV0FS
TklOR19GSUxFIGlzIGlnbm9yZWQuCgogIEknbSBub3Qgc3VyZSB3aGF0IGV4YWN0bHkgeW91IG1l
YW4gaGVyZSwgYnV0IEkgZ3Vlc3MgdGhlIGlkZWEgaXMgImRvIHNvbWV0aGluZyAKZXhwbGljaXQg
Zm9yIGVhY2ggcGFja2FnZSB0aGF0IGNhdXNlcyBhIGNvbmZsaWN0Ii4gSSBkZWZpbml0ZWx5IGxp
a2UgdGhhdCBpZGVhIC0gCmluIGdlbmVyYWwgaW4gQnVpbGRyb290IHdlIGxpa2UgdG8gZG8gdGhp
bmdzIGV4cGxpY2l0bHkgcmF0aGVyIHRoYW4gbWFnaWNhbGx5LgoKICBTcGVjaWZpY2FsbHkgZm9y
IGJ1c3lib3gsIEkgYWN0dWFsbHkgdGhpbmsgdGhlIGFwcHJvYWNoIHNob3VsZCBiZSB0byBfcmVt
b3ZlXyAKdGhlIHN5bWxpbmtzIHRoYXQgd291bGQgbGVhZCB0byBjb25mbGljdCAoYW5kIGFsc28g
cmVtb3ZlIHRoZSBkZXBlbmRlbmNpZXMgaW4gCmJ1c3lib3gubWspLiBTbyBzb21ldGhpbmcgbGlr
ZToKCmlmZXEgKCQoQlIyX1BBQ0tBR0VfQVRUUikseSkKQlVTWUJPWF9STV9GSUxFUyArPSAvdXNy
L2Jpbi9hdHRyIC91c3IvYmluL2dldGZhdHRyIC91c3IvYmluL3NldGZhdHRyCmVuZGlmCgpkZWZp
bmUgQlVTWUJPWF9JTlNUQUxMX1RBUkdFVAoJLi4uCgkkKFJNKSAkKGFkZHByZWZpeCAkKFRBUkdF
VF9ESVIpLywkKEJVU1lCT1hfUk1fRklMRVMpKQplbmRlZgoKVGhpcyBpcyBzdGlsbCBhIGxpdHRs
ZSBiaXQgdW4tbmljZSBiZWNhdXNlIGl0IGNvdWxkIHJlcXVpcmUgY2hhbmdlcyBpbiB0aGUgCmJ1
c3lib3ggcGFja2FnZSB3aGVuIHlvdSB1cGRhdGUgYXR0ciwgYnV0IGluIHByYWN0aWNlIHRoYXQg
d2lsbCBoYXBwZW4gZXh0cmVtZWx5IApyYXJlbHkuCgoKPiAgICAgIFBhY2thZ2VzIG1heSBuZWVk
IHRvIGJlIGFibGUgdG8gZGVmaW5lIGFkZGl0aW9uYWwgZmlsZXMgdGhlbXNlbHZlcwo+ICAgICAg
dGhhdCBuZWVkIHRvIGJlIHNraXBwZWQgaW4gcm9vdGZzIGdlbmVyYXRpb24uCgogIEl0J3Mgbm90
IGp1c3Qgc2tpcHBpbmcgdGhvdWdoLiBJdCBoYXBwZW5zIGxlc3MgYW5kIGxlc3Mgbm93LCBidXQg
dGhlcmUgYXJlIAphbHNvIHBhY2thZ2VzIHRoYXQgX21vZGlmeV8gYW4gZXhpc3RpbmcgZmlsZSBh
dCBpbnN0YWxsYXRpb24gdGltZS4gVGhlIAp0cmFkaXRpb25hbCBleGFtcGxlIG9mIHRoaXMgaXMg
dXBkYXRpbmcgdGhlICJkaXJlY3RvcnkiIHdoZW4gaW5zdGFsbGluZyBpbmZvIApmaWxlcyAod2hp
Y2ggd2UgZG9uJ3QgYWN0dWFsbHkgY2FyZSBhYm91dCBiZWNhdXNlIGRvY3VtZW50YXRpb24gZ2V0
cyByZW1vdmVkIAphbnl3YXksIGJ1dCBpdCdzIGFuIGVhc3kgdG8gdW5kZXJzdGFuZCBleGFtcGxl
KS4KCiAgQW55d2F5LCB0aG9zZSBhcyB3ZWxsIGNhbiBiZSBoYW5kbGVkIG9uIGEgY2FzZS1ieS1j
YXNlIGJhc2lzIGluIApfVEFSR0VUX0ZJTkFMSVpFX0hPT0tTLgoKCj4gICAgICBMb29raW5nIGF0
IGJ1c3lib3ggaXQgbWlnaHQgbm90IGJlIGV4YWN0bHkgdHJpdmlhbCBidXQgaXQgc2hvdWxkCj4g
ICAgICBiZSBkb2FibGUuCj4gCj4gMikgSW50cm9kdWNlIDxwa2c+LXJlYnVpbGQtcmRlcGVuZHMg
YW5kIDxwa2c+LXJlY29uZmlndXJlLXJkZXBlbmRzLAo+ICAgICAgd2hpY2ggdHJpZ2dlciB0aGUg
YXBwcm9wcmlhdGUgcmVidWlsZCBvZiBhbGwgdGhlIHJkZXBlbmRzLgo+IAo+ICAgICAgVGhpcyB3
b3VsZCBiZSB0aGUgc2FtZSB0aGluZyB3ZSBkbyB0b2RheSB0byB3b3JrIGFyb3VuZCB0aGUKPiAg
ICAgIHByb2JsZW0gKG1ha2UgPHBrZz4tcmVidWlsZCAmJiBtYWtlIDxyZGVwMT4tcmVjb25maWd1
cmUgLi4uKSBidXQKPiAgICAgIGF1dG9tYXRpY2FsbHkgZnJvbSBpbnNpZGUgYnVpbGRyb290Lgo+
IAo+Pgo+Pj4gVGhpcyBzb2x2ZXMgdGhlIHByb2JsZW0gd2hlcmUgc3RhbGUgZmlsZXMgZnJvbSBk
ZXBlbmRlbmNpZXMgd2lsbAo+Pj4gbGluZ2VyIGluIHRoZSBwZXItcGFja2FnZSB0YXJnZXQgZGly
ZWN0b3JpZXMgYW5kIG1heSB1cCBpbiB0aGUgZmluYWwKPj4+IHRhcmdldCBkaXJlY3RvcnkgYWZ0
ZXIgdGhlIHBwZC1tZXJnZSwgb3ZlcndyaXRpbmcgdGhlIGZyZXNoIG9uZXMsCj4+PiBjYXVzaW5n
IHVuZWNlc3Nhcmx5IG1hbnkgcmVidWlsZCBzdGVwcyB0byBlbnN1cmUgdGhhdCB0aGUgbGF0ZXN0
Cj4+PiB2ZXJzaW9uIG9mIGEgZGVwZW5kZW5jeSBpcyBpbmNsdWRlZCBpbiB0aGUgZmluYWwgdGFy
Z2V0IGRpcmVjdG9yeS4KPj4KPj4gICDCoFllcCwgd2UncmUgYXdhcmUgb2YgdGhpcyBwcm9ibGVt
LCBhbmQgaGF2ZW4ndCBmb3VuZCBhIHNvbHV0aW9uIDotKQo+IAo+IEl0IGlzIGluZGVlZCBhIHRy
aWNreSBwcm9ibGVtLCBpdCBpcyBib3RoZXJpbmcgbWUgZW5vdWdoIHRob3VnaCB0aGF0Cj4gSSdt
IHdpbGxpbmcgdG8gd29yayBvbiBpdCBhcyBtdWNoIGFzIEkgY2FuLgoKICBJJ20gcHJldHR5IHN1
cmUgdGhlcmUgd2VyZSBvdGhlciBpc3N1ZXMgYXMgd2VsbC4gSSd2ZSB0cmllZCB0byBkaWcgaW50
byAKcmVwb3J0cyBmcm9tIHByZXZpb3VzIGRldmVsb3BlciBtZWV0aW5ncyBbMV1bMl0gYnV0IGNv
dWxkbid0IGZpbmQgYW55dGhpbmcgCmNvbmNyZXRlLiBQZXJoYXBzIFlhbm4gc3RpbGwgcmVtZW1i
ZXJzIHNvbWV0aGluZz8gSSBkbyByZW1lbWJlciB3ZSBsb29rZWQgYXQgaXQgCmluIGRlcHRoIGlu
IHRoZSBoYWNrYXRvbiBhdCBZYW5uJ3MgcGxhY2UsIGJ1dCBvZiBjb3Vyc2UgSSBkb24ndCByZW1l
bWJlciB3aGF0IAp0aGUgcHJvYmxlbSB3YXMgdGhhdCB3ZSBjb3VsZG4ndCByZXNvbHZlIGF0IHRo
ZSB0aW1lLi4uCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IAo+IEJlc3QgcmVnYXJkcyAvLyBKb2hu
IEVybmJlcmcKPiAKPj4KPj4gICDCoFJlZ2FyZHMsCj4+ICAgwqBBcm5vdXQKCgpbMV0gaHR0cHM6
Ly9lbGludXgub3JnL0J1aWxkcm9vdDpEZXZlbG9wZXJEYXlzRUxDRTIwMTcjVG9wLWxldmVsX3Bh
cmFsbGVsX2J1aWxkClsyXSAKaHR0cHM6Ly9lbGludXgub3JnL0J1aWxkcm9vdDpEZXZlbG9wZXJE
YXlzRk9TREVNMjAyMCNTdGF0dXNfb2ZfdG9wLWxldmVsX3BhcmFsbGVsX2J1aWxkX3N1cHBvcnQu
MkNfd2hlcmVfZG9fd2VfZ29fZnJvbV90aGVyZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
