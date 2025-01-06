Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D77DE77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 08:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 256BB8101B;
	Mon,  6 Jan 2025 08:29:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UV5V387Jv-Gv; Mon,  6 Jan 2025 08:29:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FD2A80EE6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FD2A80EE6;
	Mon,  6 Jan 2025 08:29:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B0526B
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 08:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55ACC6068D
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 08:29:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7hgUJ7Koy5R4 for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 08:29:00 +0000 (UTC)
X-Greylist: delayed 964 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 06 Jan 2025 08:28:58 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0C8A4605BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C8A4605BD
Received-SPF: Pass (sender SPF authorized) identity=helo;
 client-ip=2a02:2350:5:501::1; helo=mailrelay2-3.pub.mailoutpod2-cph3.one.com;
 envelope-from=ayoub.zaki@embetrix.com; receiver=<UNKNOWN> 
Received: from mailrelay2-3.pub.mailoutpod2-cph3.one.com
 (mailrelay2-3.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:501::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C8A4605BD
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 08:28:58 +0000 (UTC)
X-HalOne-ID: 0536a98e-cc06-11ef-8c4e-09b8706f39fe
Received: from [IPV6:2a02:3102:8c10:a0:efeb:4f3d:be45:589a]
 (dynamic-2a02-3102-8c10-00a0-efeb-4f3d-be45-589a.310.pool.telefonica.de
 [2a02:3102:8c10:a0:efeb:4f3d:be45:589a])
 by mailrelay2.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
 id 0536a98e-cc06-11ef-8c4e-09b8706f39fe;
 Mon, 06 Jan 2025 08:12:50 +0000 (UTC)
Message-ID: <590d2a3a-7e0c-4286-8d05-164632d474b5@embetrix.com>
Date: Mon, 6 Jan 2025 09:12:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20250102133358.226719-1-ayoub.zaki@embetrix.com>
Content-Language: en-US
From: Ayoub Zaki <ayoub.zaki@embetrix.com>
In-Reply-To: <20250102133358.226719-1-ayoub.zaki@embetrix.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1736151171; x=1736755971; 
 d=embetrix.com; s=rsa1;
 h=content-transfer-encoding:content-type:in-reply-to:from:references:to:subject:
 mime-version:date:message-id:from;
 bh=bcW7DD8qk0QIoORjW17/y4YTMnDcx1+Ov2OurrZfshM=;
 b=Hq1NN0Xh1SaNskqmk4J82EG3FzFBK5JaqfOJXmd8ZLmqSgXdmbx6fkHXsjlve48k8HiGjkSOhGUCB
 Dz32UO8ccqniHo/I0iUk2/LHCru0m5/LjFIVlD7onO13QxBoyR8Y+owb0Ms3omwVCEUCAZUJjaXB3F
 /8wC1v2T7i7IDanz+MvU2HV6mX5RmUjmgeMgtzX+eWHTUEoaIVnfj7em4PWNVGpOMDmzzmZ9rYLkRn
 uK5jqlIS+YKBV4p+UhKdTbqlVa4UrVeYYcY4deVQPIAsULYkxEe9hbumPJ0Beaa/5+Ag8RJEujjQwg
 1wY7tX9SFRJrFLC1LJumes+vdx6VbRQ==
X-Mailman-Original-DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 t=1736151171; x=1736755971; 
 d=embetrix.com; s=ed1;
 h=content-transfer-encoding:content-type:in-reply-to:from:references:to:subject:
 mime-version:date:message-id:from;
 bh=bcW7DD8qk0QIoORjW17/y4YTMnDcx1+Ov2OurrZfshM=;
 b=GpOlyfo/diaMxk6vDlxFe3YxVAlau5bG/vhF6me0+lCQFbxsvybrqlfGGAg1ajDRZTCC0t9osIyAu
 FCR1M2qBw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=embetrix.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=embetrix.com
 header.i=@embetrix.com header.a=rsa-sha256 header.s=rsa1 header.b=Hq1NN0Xh; 
 dkim=pass header.d=embetrix.com header.i=@embetrix.com header.a=ed25519-sha256
 header.s=ed1 header.b=GpOlyfo/
Subject: Re: [Buildroot] [PATCH v2] package/bmap-writer: add initial package
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

SGVsbG8sCgpQbGVhc2UgbGV0IG1lIGtub3cgaWYgdGhlcmUgYXJlIGFueSBmdXJ0aGVyIHN0ZXBz
IEkgbmVlZCB0byB0YWtlIG9yIAphZGRpdGlvbmFsIGlucHV0IHJlcXVpcmVkIHRvIG1vdmUgZm9y
d2FyZCB3aXRoIHRoaXMgcGF0Y2guCgpUaGFuayB5b3UhCgoKT24gMDIuMDEuMjUgMTQ6MzMsIEF5
b3ViIFpha2kgd3JvdGU6Cj4gU2lnbmVkLW9mZi1ieTogQXlvdWIgWmFraSA8YXlvdWIuemFraUBl
bWJldHJpeC5jb20+Cj4gLS0tCj4gICBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMyArKysKPiAgIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICB8ICAx
ICsKPiAgIHBhY2thZ2UvYm1hcC13cml0ZXIvQ29uZmlnLmluICAgICAgICB8IDE3ICsrKysrKysr
KysrKysrKysrCj4gICBwYWNrYWdlL2JtYXAtd3JpdGVyL0NvbmZpZy5pbi5ob3N0ICAgfCAxMCAr
KysrKysrKysrCj4gICBwYWNrYWdlL2JtYXAtd3JpdGVyL2JtYXAtd3JpdGVyLmhhc2ggfCAgMyAr
KysKPiAgIHBhY2thZ2UvYm1hcC13cml0ZXIvYm1hcC13cml0ZXIubWsgICB8IDEzICsrKysrKysr
KysrKysKPiAgIDYgZmlsZXMgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKQo+ICAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IHBhY2thZ2UvYm1hcC13cml0ZXIvQ29uZmlnLmluCj4gICBjcmVhdGUgbW9kZSAx
MDA2NDQgcGFja2FnZS9ibWFwLXdyaXRlci9Db25maWcuaW4uaG9zdAo+ICAgY3JlYXRlIG1vZGUg
MTAwNjQ0IHBhY2thZ2UvYm1hcC13cml0ZXIvYm1hcC13cml0ZXIuaGFzaAo+ICAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IHBhY2thZ2UvYm1hcC13cml0ZXIvYm1hcC13cml0ZXIubWsKPgo+IGRpZmYgLS1n
aXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwo+IGluZGV4IDM4MWJjOWY0OTAuLjJlNjZlM2Q4
YTcgMTAwNjQ0Cj4gLS0tIGEvREVWRUxPUEVSUwo+ICsrKyBiL0RFVkVMT1BFUlMKPiBAQCAtMzQ0
NywzICszNDQ3LDYgQEAgRjoJcGFja2FnZS9xdWF6aXAvCj4gICBGOglwYWNrYWdlL3NoYXBlbGli
Lwo+ICAgRjoJcGFja2FnZS9zaW1wbGUtbWFpbC8KPiAgIEY6CXBhY2thZ2UvdGluYy8KPiArCj4g
K046CUF5b3ViIFpha2kgPGF5b3ViLnpha2lAZW1iZXRyaXguY29tPgo+ICtGOglwYWNrYWdlL2Jt
YXAtd3JpdGVyLwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2UvQ29u
ZmlnLmluCj4gaW5kZXggMTdmNDU4ZWVlOC4uM2I0YWY1ZjdlYiAxMDA2NDQKPiAtLS0gYS9wYWNr
YWdlL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvQ29uZmlnLmluCj4gQEAgLTIxNSw2ICsyMTUs
NyBAQCBtZW51ICJGaWxlc3lzdGVtIGFuZCBmbGFzaCB1dGlsaXRpZXMiCj4gICAJc291cmNlICJw
YWNrYWdlL2F1ZnMtdXRpbC9Db25maWcuaW4iCj4gICAJc291cmNlICJwYWNrYWdlL2F1dG9mcy9D
b25maWcuaW4iCj4gICAJc291cmNlICJwYWNrYWdlL2JtYXAtdG9vbHMvQ29uZmlnLmluIgo+ICsJ
c291cmNlICJwYWNrYWdlL2JtYXAtd3JpdGVyL0NvbmZpZy5pbiIKPiAgIAlzb3VyY2UgInBhY2th
Z2UvYnRyZnMtcHJvZ3MvQ29uZmlnLmluIgo+ICAgCXNvdXJjZSAicGFja2FnZS9jaWZzLXV0aWxz
L0NvbmZpZy5pbiIKPiAgIAlzb3VyY2UgInBhY2thZ2UvY3Bpby9Db25maWcuaW4iCj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvYm1hcC13cml0ZXIvQ29uZmlnLmluIGIvcGFja2FnZS9ibWFwLXdyaXRl
ci9Db25maWcuaW4KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmQ2
NWVkYTkxOGMKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9ibWFwLXdyaXRlci9Db25m
aWcuaW4KPiBAQCAtMCwwICsxLDE3IEBACj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9CTUFQX1dSSVRF
Ugo+ICsJYm9vbCAiYm1hcC13cml0ZXIiCj4gKwlkZXBlbmRzIG9uIEJSMl9JTlNUQUxMX0xJQlNU
RENQUAo+ICsJZGVwZW5kcyBvbiBCUjJfVVNFX1dDSEFSCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0Vf
TElCQVJDSElWRQo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQlhNTDIKPiArCWhlbHAKPiArCSAg
Ym1hcC13cml0ZXIgaXMgYSBjb21tYW5kLWxpbmUgdXRpbGl0eSBkZXNpZ25lZCB0byBlZmZpY2ll
bnRseSB3cml0ZQo+ICsJICBkaXNrIGltYWdlcyB0byBzdG9yYWdlIGRldmljZXMgdXNpbmcgYmxv
Y2sgbWFwcGluZyAoQk1BUCkuIEl0IHNlcnZlcwo+ICsJICBhcyBhIGxpZ2h0d2VpZ2h0IGFsdGVy
bmF0aXZlIHRvIHRoZSBZb2N0byBCTUFQIHRvb2wsIHNwZWNpZmljYWxseSBmb3IKPiArCSAgZW1i
ZWRkZWQgc3lzdGVtcy4gVW5saWtlIHRoZSBZb2N0byBCTUFQIHRvb2wsIGJtYXAtd3JpdGVyIGlz
IEMrKyBiYXNlZCwKPiArCSAgZG9lcyBub3QgcmVxdWlyZSBQeXRob24sIGFuZCBmb2N1c2VzIHNv
bGVseSBvbiB3cml0aW5nIGFuIGltYWdlLgo+ICsKPiArCSAgaHR0cHM6Ly9naXRodWIuY29tL2Vt
YmV0cml4L2JtYXAtd3JpdGVyCj4gKwo+ICtjb21tZW50ICJibWFwLXdyaXRlciBuZWVkcyBhIHRv
b2xjaGFpbiB3LyBDKyssIHdjaGFyIgo+ICsJZGVwZW5kcyBvbiAhQlIyX1VTRV9XQ0hBUiB8fCAh
QlIyX0lOU1RBTExfTElCU1REQ1BQCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvYm1hcC13cml0ZXIv
Q29uZmlnLmluLmhvc3QgYi9wYWNrYWdlL2JtYXAtd3JpdGVyL0NvbmZpZy5pbi5ob3N0Cj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5kNWJmZDYyZjBhCj4gLS0tIC9k
ZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvYm1hcC13cml0ZXIvQ29uZmlnLmluLmhvc3QKPiBAQCAt
MCwwICsxLDEwIEBACj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9IT1NUX0JNQVBfV1JJVEVSCj4gKwli
b29sICJob3N0IGJtYXAtd3JpdGVyIgo+ICsJaGVscAo+ICsJICBibWFwLXdyaXRlciBpcyBhIGNv
bW1hbmQtbGluZSB1dGlsaXR5IGRlc2lnbmVkIHRvIGVmZmljaWVudGx5IHdyaXRlCj4gKwkgIGRp
c2sgaW1hZ2VzIHRvIHN0b3JhZ2UgZGV2aWNlcyB1c2luZyBibG9jayBtYXBwaW5nIChCTUFQKS4g
SXQgc2VydmVzCj4gKwkgIGFzIGEgbGlnaHR3ZWlnaHQgYWx0ZXJuYXRpdmUgdG8gdGhlIFlvY3Rv
IEJNQVAgdG9vbCwgc3BlY2lmaWNhbGx5IGZvcgo+ICsJICBlbWJlZGRlZCBzeXN0ZW1zLiBVbmxp
a2UgdGhlIFlvY3RvIEJNQVAgdG9vbCwgYm1hcC13cml0ZXIgaXMgQysrIGJhc2VkLAo+ICsJICBk
b2VzIG5vdCByZXF1aXJlIFB5dGhvbiwgYW5kIGZvY3VzZXMgc29sZWx5IG9uIHdyaXRpbmcgYW4g
aW1hZ2UuCj4gKwo+ICsJICBodHRwczovL2dpdGh1Yi5jb20vZW1iZXRyaXgvYm1hcC13cml0ZXIK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9ibWFwLXdyaXRlci9ibWFwLXdyaXRlci5oYXNoIGIvcGFj
a2FnZS9ibWFwLXdyaXRlci9ibWFwLXdyaXRlci5oYXNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
PiBpbmRleCAwMDAwMDAwMDAwLi5jNTljN2E5MWNiCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3Bh
Y2thZ2UvYm1hcC13cml0ZXIvYm1hcC13cml0ZXIuaGFzaAo+IEBAIC0wLDAgKzEsMyBAQAo+ICsj
IExvY2FsbHkgY2FsY3VsYXRlZAo+ICtzaGEyNTYgIDk0ZmRhODQyMGZhODIyNTZiZmQwMWE3NmRm
ZjE4YWUyM2M2YmU5YmUwM2NiNjQxZjk4NDUxNjRlOTMyNmRlNjAgIGJtYXAtd3JpdGVyLTAuMC4z
LnRhci5nego+ICtzaGEyNTYgIDhiMWJhMjA0YmI2OWEwYWRlMmJmY2Y2NWVmMjk0YTkyMGY2YmIz
NjFiMzE3ZGJhNDNjN2VmMjlkOTYzMzJiOWIgIExJQ0VOU0UKPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9ibWFwLXdyaXRlci9ibWFwLXdyaXRlci5tayBiL3BhY2thZ2UvYm1hcC13cml0ZXIvYm1hcC13
cml0ZXIubWsKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmJiZTRl
YjEwNzgKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9ibWFwLXdyaXRlci9ibWFwLXdy
aXRlci5tawo+IEBAIC0wLDAgKzEsMTMgQEAKPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAr
Iwo+ICsjIGJtYXAtd3JpdGVyCj4gKyMKPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiArCj4g
K0JNQVBfV1JJVEVSX1ZFUlNJT04gPSAwLjAuMwo+ICtCTUFQX1dSSVRFUl9TSVRFID0gJChjYWxs
IGdpdGh1YixlbWJldHJpeCxibWFwLXdyaXRlciwkKEJNQVBfV1JJVEVSX1ZFUlNJT04pKQo+ICtC
TUFQX1dSSVRFUl9MSUNFTlNFID0gR1BMLTMuMAo+ICtCTUFQX1dSSVRFUl9MSUNFTlNFX0ZJTEVT
ID0gTElDRU5TRQo+ICtCTUFQX1dSSVRFUl9ERVBFTkRFTkNJRVMgPSBob3N0LXBrZ2NvbmYgbGli
YXJjaGl2ZSBsaWJ4bWwyCj4gKwo+ICskKGV2YWwgJChjbWFrZS1wYWNrYWdlKSkKCk1pdCBmcmV1
bmRsaWNoZW4gR3LDvMOfZW4gLyBLaW5kIHJlZ2FyZHMKCi0tIApBeW91YiBaYWtpCkVtYmVkZGVk
IFN5c3RlbXMgQ29uc3VsdGFudAoKVmFpaGluZ2VyIFN0cmHDn2UgMi8xCkQtNzE2MzQgTHVkd2ln
c2J1cmcKCk1vYmlsZSAgIDogKzQ5MTc2NjI5MDE1NDUKRW1haWwgICAgOiBheW91Yi56YWtpQGVt
YmV0cml4LmNvbQpIb21lcGFnZSA6IGh0dHBzOi8vZW1iZXRyaXguY29tClZBVCBOby4gIDogREUz
MTM5MDI2MzQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
