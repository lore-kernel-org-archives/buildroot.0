Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE4ACFD364
	for <buildroot@archiver.kernel.org>; Tue, 25 Nov 2025 09:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF9DB61091;
	Tue, 25 Nov 2025 09:25:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u3b9qszaf7TM; Tue, 25 Nov 2025 09:25:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5065660F40
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5065660F40;
	Tue, 25 Nov 2025 09:25:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 041C4E4
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 09:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA12E82E4C
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 09:25:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vwIJOapK-ohb for <buildroot@buildroot.org>;
 Tue, 25 Nov 2025 09:25:47 +0000 (UTC)
Received-SPF: Pass (sender SPF authorized) identity=helo;
 client-ip=2a02:2350:5:505::1;
 helo=mailrelay-egress18.pub.mailoutpod2-cph3.one.com;
 envelope-from=ayoub.zaki@embetrix.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 428CA82E29
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 428CA82E29
Received: from mailrelay-egress18.pub.mailoutpod2-cph3.one.com
 (mailrelay-egress18.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:505::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 428CA82E29
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 09:25:43 +0000 (UTC)
X-HalOne-ID: b390f614-c9e0-11f0-a640-85eb291bc831
Received: from [IPV6:2a02:3102:8c10:1ae0:234:c48:2d33:cb5a]
 (dynamic-2a02-3102-8c10-1ae0-0234-0c48-2d33-cb5a.310.pool.telefonica.de
 [2a02:3102:8c10:1ae0:234:c48:2d33:cb5a])
 by mailrelay5.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
 id b390f614-c9e0-11f0-a640-85eb291bc831;
 Tue, 25 Nov 2025 09:25:38 +0000 (UTC)
Message-ID: <70b1ba81-5a44-4cb7-a148-fe3aaef9253f@embetrix.com>
Date: Tue, 25 Nov 2025 10:25:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@rnout.be>,
 Peter Korsgaard <peter@korsgaard.com>
Cc: Lance Fredrickson <lancethepants@gmail.com>, buildroot@buildroot.org
References: <1c677011-9c6e-483c-ab4f-93480d7fdd69@embetrix.com>
 <CABwKrPDNVLCLJHg7Nvxne+03RtZXXpO_H-iKquAe7hchiMf3pg@mail.gmail.com>
 <076df85a-3775-4854-875a-f76662318e35@embetrix.com>
 <87bjl7rpct.fsf@dell.be.48ers.dk>
 <47cd1e1f-98da-4758-ab64-1223642582a2@rnout.be>
Content-Language: en-US
From: Ayoub Zaki <ayoub.zaki@embetrix.com>
In-Reply-To: <47cd1e1f-98da-4758-ab64-1223642582a2@rnout.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1764062739; x=1764667539; 
 d=embetrix.com; s=rsa1;
 h=content-transfer-encoding:content-type:in-reply-to:from:references:cc:to:
 subject:mime-version:date:message-id:from;
 bh=H9wPL6Qdrh1Z3/uvj2IFLvpFIjmx3kk4pqGcdW3UARE=;
 b=ra9YxBPM0keRjHugw3nkyyUVCypARC7fjgPsyrV0cj5ReIkiQdb+/7/6hTyaSJn5+rgcJjxmamizu
 5/HFITUM4KiMtNvg1/S0iJnnQOImkxRLncZBLY1ovxLcMDHtosusM457vYc7jO+z8r/8exdkvUSLSg
 WdoLuqkayzgVUnR3mSOvyS9dMpTpZR1OpHmhJW9gEGttbW/C/KcAfbfOfgF8LSraO4kHl0T1rVGphH
 cWhSWqkOaStCPbfwSzmReb90YBm43rrABI4nY8VZKjhdLUrWT3/XSzB9cSscDoDNVusNURTJRrWG9W
 cBpEIzhrtmRjcHtfPIAu+zlff0VRuOQ==
X-Mailman-Original-DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 t=1764062739; x=1764667539; 
 d=embetrix.com; s=ed1;
 h=content-transfer-encoding:content-type:in-reply-to:from:references:cc:to:
 subject:mime-version:date:message-id:from;
 bh=H9wPL6Qdrh1Z3/uvj2IFLvpFIjmx3kk4pqGcdW3UARE=;
 b=xlywdDM5K6NNNRSwUx0TjU9SCPgyS0JArGHXFEvD0MGat5b54DsMiCXIbKwxWa+3taqAAhegzpBju
 UntGzrwDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=embetrix.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=embetrix.com
 header.i=@embetrix.com header.a=rsa-sha256 header.s=rsa1 header.b=ra9YxBPM; 
 dkim=pass header.d=embetrix.com header.i=@embetrix.com header.a=ed25519-sha256
 header.s=ed1 header.b=xlywdDM5
Subject: Re: [Buildroot] override a core package from BR2_EXTERNAL
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

Y3JlYXRlIGEgbmV3IHBhY2thZ2Ugd2l0aCBkaWZmZXJlbnQgbmFtZSB3b24ndCB3b3JrIHNpbmNl
IHRoZXJlIGFyZSAKZGVwZW5kZW5jaWVzLgoKb25lIHdheSB0byBzb2x2ZSB0aGlzIG1heWJlIGlz
IHRvIGludHJvZHVjZSBhIG1hc2tpbmcgbWVjaGFuaXNtIGluc2lkZSAKdGhlIGNvcmUgcGFja2Fn
ZSBsaWtlIGluIHlvY3RvLgoKT24gMTEvMjQvMjUgMjI6MDksIEFybm91dCBWYW5kZWNhcHBlbGxl
IHdyb3RlOgo+Cj4KPiBPbiAxMi8xMS8yMDI1IDIxOjAyLCBQZXRlciBLb3JzZ2FhcmQgd3JvdGU6
Cj4+Pj4+Pj4gIkF5b3ViIiA9PSBBeW91YiBaYWtpIDxheW91Yi56YWtpQGVtYmV0cml4LmNvbT4g
d3JpdGVzOgo+Pgo+PiDCoCA+IHRoYW5rcywgYnV0IHRoaXMgaXMgTk9UIHdoYXQgSSdtIGxvb2tp
bmcgZm9yLCBJIGhhdmUgcmVxdWlyZW1lbnQgdG8KPj4gwqAgPiBoYXZlIGEgY29tcGxldGUgb2xk
ZXIgdmVyc2lvbiBvZiBhIGNvcmUgcGFja2FnZS4KPj4KPj4gwqAgPiBJIGRpZCBhwqAgcmV2ZXJz
ZSBwYXRjaCBmb3IgdGhlIHBhY2thZ2UgYnV0IHRoaXMgaXMgdWdseSBhbmQgbG9vayAKPj4gZm9y
IGEKPj4gwqAgPiBjbGVhbmVyIHdheSB0byBkbyBpdC4KPj4KPj4gVGhlcmUgaXNuJ3QgcmVhbGx5
IGFueSBzdXBwb3J0ZWQgd2F5IHRvIGRvIHNvLiAoU2lnbmlmaWNhbnRseSkgY2hhbmdpbmcKPj4g
dGhlIHZlcnNpb24gb2YgYSBwYWNrYWdlIGNvdWxkIGFsc28gbWVhbiBhIGNoYW5nZSBpbiAodG9v
bGNoYWluKQo+PiBkZXBlbmRlbmNpZXMsIHNvIHRoZSBlYXNpZXN0IGlzIHByb2JhYmx5IHRvIGZv
cmsgYnVpbGRyb290IGFuZCBkbyB5b3VyCj4+IHR3ZWFrcyBpbiBhIGN1c3RvbSB0cmVlLgo+Cj4g
wqBJZiBpdCdzIChhbG1vc3QpIGEgbGVhZiBwYWNrYWdlLCB5b3UgY2FuIGFsc28gY3JlYXRlIGEg
bmV3IHBhY2thZ2UgCj4gd2l0aCBhIGRpZmZlcmVudCBuYW1lLCBlLmcuIHZsYzIyNCBpZiB5b3Ug
bmVlZCBhbiBvbGRlciB2ZXJzaW9uIG9mIAo+IHZsYywgb3IgbGlib3BlbnNzbDEgaWYgeW91IG5l
ZWQgYW4gb2xkZXIgdmVyc2lvbiBvZiBsaWJvcGVuc3NsLiBCdXQgCj4gZm9yIG9wZW5zc2wgdGhp
cyBpcyBnb2luZyB0byBiZSBhIHByb2JsZW0sIHNpbmNlIHlvdSBjYW4ndCBpbnN0YWxsIAo+IGxp
Ym9wZW5zc2wxIGFuZCBsaWJvcGVuc3NsMyBzaWRlLWJ5LXNpZGUsIHNvIHlvdSdyZSBhbHNvIGdv
aW5nIHRvIGhhdmUgCj4gdG8gbWFrZSBjb3BpZXMgb2YgYWxsIHBhY2thZ2VzIHRoYXQgZGVwZW5k
IG9uIGxpYm9wZW5zc2wuLi4gQnV0IG9mIAo+IGNvdXJzZSwgc29tZSBvZiB0aG9zZSBwYWNrYWdl
cyBwcm9iYWJseSBkb24ndCBidWlsZCB3aXRoIG9wZW5zc2wxIGFueSAKPiBtb3JlLi4uCj4KPiDC
oFRoZXJlJ3MgYSByZWFzb24gd2UgZG9uJ3Qgc3VwcG9ydCB0aGlzLiBJdCdzIGEgaGFyZCBwcm9i
bGVtLiBUbyBzb2x2ZSAKPiB0aGlzIHdlbGwgeW91IG5lZWQgc29tZXRoaW5nIGxpa2UgTml4IG9y
IEd1aXguCj4KPgo+IMKgUmVnYXJkcywKPiDCoEFybm91dAo+Ck1pdCBmcmV1bmRsaWNoZW4gR3LD
vMOfZW4gLyBLaW5kIHJlZ2FyZHMKCi0tIApBeW91YiBaYWtpCkVtYmVkZGVkIFN5c3RlbXMgQ29u
c3VsdGFudAoKVmFpaGluZ2VyIFN0cmHDn2UgMi8xCkQtNzE2MzQgTHVkd2lnc2J1cmcKCk1vYmls
ZSAgIDogKzQ5MTc2NjI5MDE1NDUKRW1haWwgICAgOiBheW91Yi56YWtpQGVtYmV0cml4LmNvbQpI
b21lcGFnZSA6IGh0dHBzOi8vZW1iZXRyaXguY29tClZBVCBOby4gIDogREUzMTM5MDI2MzQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
