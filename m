Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B21C04FFE
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 13:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39CBC407A7;
	Wed,  8 May 2024 13:27:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GtelQwF-onmh; Wed,  8 May 2024 13:27:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96C0940238
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96C0940238;
	Wed,  8 May 2024 13:27:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A39891BF33A
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 13:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C8F5822EF
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 13:27:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bYWrpE00OmFq for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 13:27:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.249;
 helo=lelv0142.ext.ti.com; envelope-from=p-bhagat@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 31E88822CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31E88822CF
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31E88822CF
 for <buildroot@buildroot.org>; Wed,  8 May 2024 13:27:39 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 448DRcgS034058;
 Wed, 8 May 2024 08:27:38 -0500
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 448DRcxj105418
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 8 May 2024 08:27:38 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 May 2024 08:27:38 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 May 2024 08:27:38 -0500
Received: from [172.24.227.38] (ula0502350.dhcp.ti.com [172.24.227.38])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 448DRZGF105387;
 Wed, 8 May 2024 08:27:36 -0500
Message-ID: <ec09f285-7b3c-45ca-91c1-d965b112b479@ti.com>
Date: Wed, 8 May 2024 18:57:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andreas Dannenberg <dannenberg@ti.com>, Bryan Brattlof <bb@ti.com>
References: <20240429092326.3247116-1-p-bhagat@ti.com>
 <20240430145448.yhg6r64ohsfofeqv@bryanbrattlof.com>
 <20240506180110.c2fz34ezrvzuzf6z@dasso>
Content-Language: en-US
In-Reply-To: <20240506180110.c2fz34ezrvzuzf6z@dasso>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1715174858;
 bh=QioLSrCIE/XJM4GByMddlKEwlhc6XGzGTfSBkfb61FY=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=VJAO7mjFzE8bMSBoV3NfRJPZT1deSqPjgzE9NSgKHRINIUunE6JB1Ua6DqjImffDv
 j3GwSk9lmUa8dEFWPdP6NjiVZsuwhUuQF5amyFJCcyFsH8TKXUk9KNuSG8Rf/qMoUa
 pcJGCgxmZpoUfLP0nf/A5BKX+hlRHWoQ/Z2tDBPQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=VJAO7mjF
Subject: Re: [Buildroot] [RFC,
 1/1] configs/am62x-sk: Add fragment for TI tree integration
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
From: Paresh Bhagat via buildroot <buildroot@buildroot.org>
Reply-To: Paresh Bhagat <p-bhagat@ti.com>
Cc: Chirag Shilwant <c-shilwant@ti.com>, Gyan Gupta <g-gupta@ti.com>,
 Xuanhao Shi <X15000177@gmail.com>, Syed Mohammed Khasim <khasim@ti.com>,
 buildroot@buildroot.org, Sai Sree Kartheek Adivi <s-adivi@ti.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQW5kcmVhcywgQnJ5YW4KCk9uIDA2LzA1LzI0IDIzOjMxLCBBbmRyZWFzIERhbm5lbmJlcmcg
d3JvdGU6Cj4gT24gVHVlLCBBcHIgMzAsIDIwMjQgYXQgMDk6NTQ6NDhBTSAtMDUwMCwgQnJ5YW4g
QnJhdHRsb2YgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPj4gT24gQXByaWwgMjksIDIwMjQgdGh1cyBz
YXlldGggUGFyZXNoIEJoYWdhdCB2aWEgYnVpbGRyb290Ogo+Pj4gVGhpcyBjb21taXQgaW50cm9k
dWNlcyBhIG5ldyBmcmFnbWVudCBjb25maWcgYWltZWQgYXQgaW50ZWdyYXRpb24gb2YgVEkgdHJl
ZXMKPj4+IGludG8gdGhlIGV4aXN0aW5nIGNvbmZpZ3VyYXRpb24gZm9yIGFtNjJ4LXNrLiBUaGUg
ZnJhZ21lbnQgY29uZmlnIGlzIGRlc2lnbmVkCj4+PiB0byBiZSBtZXJnZWQgd2l0aCB0aGUgY3Vy
cmVudCB0aV9hbTYyeF9za19kZWZjb25maWcsIGVuYWJsaW5nIHRyYW5zaXRpb24gZnJvbQo+Pj4g
bWFpbmxpbmUgdG8gVEkgdmVyc2lvbnMgZm9yIFUtYm9vdCBhbmQga2VybmVsLgo+Pj4KPj4+IFRo
ZSBmcmFnbWVudCBjb25maWcgd2lsbCBiZSBtZXJnZWQgd2l0aCBleGlzdGluZyB0aV9teV9hbTYy
eF9za19kZWZjb25maWcKPj4+IHVzaW5nIG1lcmdlLWNvbmZpZy5zaCBzY3JpcHQgcHJlc2VudCBp
biBzdXBwb3J0L2tjb25maWcgdXNpbmcgZm9sbG93aW5nCj4+PiBjb21tYW5kLgo+Pj4KPj4+IC4v
c3VwcG9ydC9rY29uZmlnL21lcmdlLWNvbmZpZy5zaCBjb25maWdzL3RpX2FtNjJ4X3NrX2RlZmNv
bmZpZyBjb25maWdzL3RpX2FtNjJ4X3NrLmNvbmZpZwo+IFRoaXMgc2hvdWxkIGJlICJtZXJnZV9j
b25maWcuc2giLgpOb3RlZAo+Cj4+PiBJdCBlZmZlY3RpdmVseSBjaGFuZ2VzIHVib290IGFuZCBr
ZXJuZWwgc291cmNlIGZyb20gbWFpbmxpbmUgdmVyc2lvbiB0byBUSQo+Pj4gdmVyc2lvbiBob3N0
ZWQgaGVyZQo+Pj4KPj4+IGh0dHBzOi8vZ2l0LnRpLmNvbS9jZ2l0L3RpLWxpbnV4LWtlcm5lbC90
aS1saW51eC1rZXJuZWwvP2g9dGktbGludXgtNi4xLnkKPj4+IGh0dHBzOi8vZ2l0LnRpLmNvbS9j
Z2l0L3RpLXUtYm9vdC90aS11LWJvb3QvP2g9dGktdS1ib290LTIwMjMuMDQKPj4+Cj4+PiBGdXJ0
aGVybW9yZSwgYXMgdGktdWJvb3QgMjAyMy4wNCBpcyB1c2VkLCBrZXJuZWwgSW1hZ2UgYW5kIGR0
YiBpcyBleHBlY3RlZAo+Pj4gaW4gcm9vdGZzL2Jvb3QvIGFuZCByb290ZnMvYm9vdC9kdGIvdGkg
cmVzcGVjdGl2ZWx5LiBTbyBhZGQgYSBuZXcgcG9zdC1idWlsZAo+Pj4gc2NyaXB0IHRvIGNvcHkg
dGhlc2UgZmlsZXMgdG8gZGVzaXJlZCBsb2NhdGlvbi4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBQ
YXJlc2ggQmhhZ2F0IDxwLWJoYWdhdEB0aS5jb20+Cj4+IFRoYW5rcyBmb3IgdGhlIHBhdGNoLiBN
eSB3b3JyeSBpcyB0aGVzZSBjaGFuZ2VzIHdpbGwgb25seSBiZSBuZWVkZWQgZm9yCj4+IHRoZSBi
cmllZiB0aW1lIHRoZSA5LjIgU0RLIGlzIHJlbGV2YW50LiBUaGUgMTAuWCBTREsgaXMganVzdCBh
cm91bmQgdGhlCj4+IGNvcm5lciBhbmQgd2lsbCBicmVhayBhbGwgb2YgdGhpcyB3aXRoIGl0cyBu
ZXcgYmFzZWxpbmUuCj4+Cj4+IEl0IG1heSBiZSBlYXNpZXIgdG8ga2VlcCB0aGVzZSBjb25maWdz
IGFsbCBpbiBhIGN1c3RvbSBCUjJfRVhURVJOQUwKPj4gb3ZlcmxheSBhbmQga2VlcCBidWlsZHJv
b3QgcG9pbnRlZCB0byBwdXJlIHNvdXJjZXMgb2YgdGhlc2UgcGFja2FnZXMKPiBZZXMgUGFyZXNo
IGFsc28gZnJvbSBteSBzaWRlIHRoYW5rcyBmb3IgdGhlIGVmZm9ydCB5b3UgcHV0IGludG8gdGhp
cy4KPiBBZnRlciBzcGVuZGluZyBzb21lIG1vcmUgdGltZSBvbiB0aGlzIEkgdGVuZCB0byBhZ3Jl
ZSB3aXRoIEJyaWFuIHRoYXQKPiB0aGlzIHNob3VsZCBwcm9iYWJseSBub3QgYmUgZGlyZWN0bHkg
aW4gdGhlIG9mZmljaWFsIHRyZWUgdG8gbWluaW1pemUKPiBjaHVybiwgcGx1cyBrZWVwaW5nIHRo
ZSBvZmZpY2lhbCBCdWlsZHJvb3QgdXBzdHJlYW0tb25seSB3aWxsIG1vdGl2YXRlCj4gdXMgZXZl
biBtb3JlIHRvIG1ha2Ugc3VyZSBhbGwgb3VyIGRldmljZSBzdXBwb3J0IGdvZXMgdXBzdHJlYW0u
Li4KPgo+IEFsbCB0aGlzIGJlaW5nIHNhaWQsIHRoZXJlIGlzIGEgdmVyeSBjb21tb24gInJlYWwg
d29ybGQiIGN1c3RvbWVyIG5lZWQvCj4gcmVxdWVzdCBmb3IgYSBCdWlsZHJvb3QtYmFzZWQgc29s
dXRpb24gbW9yZSBjbG9zZWx5IGFsaWduZWQgd2l0aCBUSSdzCj4gb2ZmaWNpYWwgWW9jdG8gU0RL
cy4gSWRlYWxseSBJJ2QgbGlrZSB0byBzZWUgdXMgcHJvdmlkaW5nIHNvbWV0aGluZyB2aWEKPiBC
UjJfRVhURVJOQUwgdGhhdCBpcyB3ZWxsIG1haW50YWluZWQgKGxpa2Ugb3RoZXIgdmVuZG9ycyBw
cm92aWRlKSwgYnV0Cj4gdW50aWwgd2UgY2FuIGNsb3NlIG9uIHRoZSBiZXN0IHBhdGggZm9yd2Fy
ZCBJJ3ZlIHVwZGF0ZWQgbXkgYWxyZWFkeS0KPiBleGlzdGluZyBFMkUgRkFRIFsxXSB0byBoZWxw
IGN1c3RvbWVycyB0b2RheSBzZXR0aW5nIHVwIHN1Y2ggYSBUSSBZb2N0bwo+IFNESyB2OS4yIEJh
c2VsaW5lIEVxdWl2YWxlbnQgYnkgYWRkaW5nIGEgc2ltcGxlIHBhdGNoIHRvIHRoZSB0cmVlIGJ5
Cj4gdGhlbXNlbHZlcy4gSSBwbGFuIG9uIG1haW50YWluaW5nIHRoaXMgYXMgbmVlZGVkIHRvIGFj
Y29tbW9kYXRlIGZvciBuZXcKPiBTREsgcmVsZWFzZXMgKGFuZCBhbHNvIHNvIHBlb3BsZSBkb24n
dCBhbHdheXMgaGF2ZSB0byByZXNvbHZlIG1lcmdlCj4gY29uZmxpY3RzIHdoZW4gYXBwbHlpbmcg
dGhhdCBwYXRjaCkuCj4KPiAtLQo+IEFuZHJlYXMgRGFubmVuYmVyZwo+IFRleGFzIEluc3RydW1l
bnRzIEluYwo+Cj4gWzFdIGh0dHBzOi8vZTJlLnRpLmNvbS9zdXBwb3J0L3Byb2Nlc3NvcnMtZ3Jv
dXAvcHJvY2Vzc29ycy9mL3Byb2Nlc3NvcnMtZm9ydW0vMTIyNjgxNS9mYXEtYnVpbGRyb290LXN1
cHBvcnQtZm9yLXNpdGFyYS1hbTYyeC1hbTYyYXgtYW02MnB4LWFtNjR4LWRldmljZXMKClllcCBp
IGp1c3QgdHJpZWQgZnJhZ21lbnQgY29uZmlnIHNvIHRoYXQgaXQgYWRkcyBzdXBwb3J0IGZvciBi
b3RoIAptYWlubGluZSBhbmQgVEkgc291cmNlcyBpbiBvZmZpY2lhbCBCdWlsZHJvb3Qgd2l0aG91
dCBtYWludGFpbmluZyAKc2VwYXJhdGUgZnVsbCBmbGVkZ2VkIGNvbmZpZyBmaWxlcy4gSXQgc2Vl
bWVkIGVhc2llciBhcyB3ZSB3aWxsIG5vdCBoYXZlIAptYWtlIHNvbWUgY2hhbmdlcyB0d2ljZS4g
QnV0IHVzaW5nIEJSMl9FWFRFUk5BTMKgIHNlZW1zIHRvIGJlIHRoZSBiZXN0IAp3YXkgaWYgd2Ug
d2FudCB0byBhbGlnbiBCdWlsZHJvb3QgYnVpbGRzIHdpdGggb3VyIFNESyByZWxlYXNlcy4KCgpS
ZWdhcmRzLAoKUGFyZXNoIEJoYWdhdAoKVGV4YXMgSW5zdHJ1bWVudHMgSW5jCgo+Cj4+IH5Ccnlh
bgo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4+IGh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
