Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC32C2BD09
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 11:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B22960E0B;
	Thu, 27 Jun 2024 11:16:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OlluB1NElVFX; Thu, 27 Jun 2024 11:16:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05FA160E28
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05FA160E28;
	Thu, 27 Jun 2024 11:16:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BA38B1BF297
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 11:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7A89812F1
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 11:16:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ud_RnIya42k for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 11:16:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.239;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1099E80F93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1099E80F93
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1099E80F93
 for <buildroot@busybox.net>; Thu, 27 Jun 2024 11:16:25 +0000 (UTC)
Received: from unknown (HELO opfedv1rlp0h.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 13:16:23 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0h.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Jun 2024 13:16:23 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 13:16:21 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Thu, 27 Jun 2024 13:16:20 +0200
From: yann.morin@orange.com
X-IronPort-AV: E=Sophos;i="6.08,269,1712613600"; d="scan'208";a="159760283"
Date: Thu, 27 Jun 2024 13:16:20 +0200
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <Zn1KBKfTGwI+jsXt@tl-lnx-nyma7486-2>
References: <20240612135727.11811-1-ps.report@gmx.net>
 <20240612135727.11811-5-ps.report@gmx.net>
 <ZnqUPBAcDbB7ND64@tl-lnx-nyma7486-2>
 <Znql0FCAPG8jP+Lx@tl-lnx-nyma7486-2>
 <20240626103623.7d7412c0@gmx.net> <ZnxsxFK_KDUDM652@landeda>
 <20240627095029.2d1fa5c0@gmx.net> <20240627102606.7de6b9cd@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240627102606.7de6b9cd@gmx.net>
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX301.corporate.adroot.infra.ftgroup
 (10.115.26.10) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1719486985; x=1751022985;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=+p1fhv6wuApn19g9ZArtUQXjr+NYU4eqZ++vH8C5+gk=;
 b=YteNstFtaw8V3YyZIb1nTXimJql/4qy1RPvbgQS7Xy48BIf85BlN8kNd
 vhNjAKtN3aMfB/hJSSqmO1KI+B5oPVTWDLw4Ta5tivYj+DghK+UgysZrR
 6EAATIG9WsjWw0N6pPs8YKWkVzG8jGGtPwKYAZrnL8cA4UX+jsPWooiZH
 Nn01IpguGZuv3XKttj2bP8PuMxEKBPvh2+RrK6oSPLABR1cerivKZGDIm
 pMedZrYWZKhAULq2TKHFQe8qJAzElIQYVrM/2hjw5MSS8tiCZzM9QbVkG
 vsiH40cd8WKNt8uUqeN1e6HF48xkz6jdWvUiIUoWMom0XnA1Nt7rHaFP0
 A==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=YteNstFt
Subject: Re: [Buildroot] [PATCH v2 5/5] package/xz: convert to cmake build
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
Cc: buildroot@busybox.net, Samuel Martin <s.martin49@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UGV0ZXIsIEFsbCwKCk9uIDIwMjQtMDYtMjcgMTA6MjYgKzAyMDAsIFBldGVyIFNlaWRlcmVyIHNw
YWtlIHRodXNseToKPiBPbiBUaHUsIDI3IEp1biAyMDI0IDA5OjUwOjI5ICswMjAwLCBQZXRlciBT
ZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+IHdyb3RlOgo+ID4gPiBBbnl3YXksIEkgaGF2ZSBu
b3cgcmV2ZXJ0ZWQgdGhhdCBwYXRjaCwgYXMgaXQgd2FzIGV4cG9zaW5nIGFub3RoZXIgaXNzdWUK
PiA+ID4gd2l0aCBob3N0LXB5dGhvbjMgKGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3Jn
L2J1aWxkcm9vdC8tL2lzc3Vlcy81KQpbLS1TTklQLS1dCj4gVGhlIGZvbGxvd2luZyBxdWljayBw
YXRjaCBzb2x2ZXMgdGhlIGhvc3QteHogYW5kIGhvc3QtcHl0aG9uMyBidWlsZCBmYWlsdXJlcwo+
IGZvciBtZToKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS94ei94ei5tayBiL3BhY2thZ2UveHov
eHoubWsKPiBpbmRleCBiMjJiOTY4NDlkLi5iMjJjY2FjODVmIDEwMDY0NAo+IC0tLSBhL3BhY2th
Z2UveHoveHoubWsKPiArKysgYi9wYWNrYWdlL3h6L3h6Lm1rCj4gQEAgLTEyLDcgKzEyLDcgQEAg
WFpfTElDRU5TRSA9IFB1YmxpYyBEb21haW4sIEJTRC0wLUNsYXVzZSwgR1BMLTIuMCssIEdQTC0z
LjArLCBMR1BMLTIuMSsKPiAgWFpfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcgQ09QWUlORy4wQlNE
IENPUFlJTkcuR1BMdjIgQ09QWUlORy5HUEx2MyBDT1BZSU5HLkxHUEx2Mi4xCj4gIFhaX0NQRV9J
RF9WRU5ET1IgPSB0dWthYW5pCj4gCj4gLVhaX0NPTkZfT1BUUyA9IFwKPiArWFpfQ09NTU9OX0NP
TkZfT1BUUyA9IFwKCkkgdGhpbmsgX0NPTU1PTl9DT05GX09QVFMgaXMgdG8gYmUgYXZvaWRlZDog
aXQgaXMgZWFzeSB0byBhZGQvcmVtb3ZlCm9wdGlvbnMgZnJvbSB0aGF0IGxpc3QsIHRoYXQgYWZm
ZWN0cyBib3RoIGJ1aWxkcywgYnV0IHdlIGRvbid0IHdhbnQgdG8KZG8gdGhhdCBtb3N0IG9mIHRo
ZSB0aW1lLgoKTG9va2luZyBhdCBhIGZldyBvdGhlciBwYWNrYWdlcywgd2UgbGVhdmUgdGhlIGhv
c3Qgb3B0aW9ucyB0byBhIGJhcmUKbWluaW11bSwgd2hpbGUgdGhlcmUgYXJlIG1vcmUgb3B0aW9u
cyBzcGVjaWZpZWQgZm9yIHRoZSB0YXJnZXQuCgpJbiB0aGlzIGNhc2UsIEkgc2VlIHRoYXQgaGUg
ZW4vZGVjb2RlciBsaXN0IGlzIGluZGVlZCBwcm9iYWJseSBzaGFyYWJsZSwKYnV0IEkgdGhpbmsg
SSdkIHB1dCBpdCBpbiBhIHZhcmlhYmxlIG9mIGl0cyBvd246CgogICAgWFpfQ09ERVJTID0gbHpt
YTE7bHptYTI7ZGVsdGE7eDg2O3Bvd2VycGM7aWE2NDthcm07YXJtdGh1bWI7YXJtNjQ7c3BhcmM7
cmlzY3YKICAgIFhaX0NPTkZfT1BUUyA9IFwKICAgICAgICAtREVOQ09ERVJTPSIkKFhaX0NPREVS
UykiIFwKICAgICAgICAtRERFQ09ERVJTPSIkKFhaX0NPREVSUykiIFwKICAgICAgICAuLi4KCiAg
ICBIT1NUX1haX0NPTkZfT1BUUyA9IFwKICAgICAgICAtREVOQ09ERVJTPSIkKFhaX0NPREVSUyki
IFwKICAgICAgICAtRERFQ09ERVJTPSIkKFhaX0NPREVSUykiIFwKICAgICAgICAuLi4KCkJ1dCBk
byB3ZSBfaGF2ZV8gdG8gcGFzcyB0aGF0IGxpc3QgYXQgYWxsPyBDYW4ndCB3ZSBqc3V0IHRlbGwg
eHogdG8KZW5hYmxlIGFsbCBvZiB0aGVtPyBIb3cgY2FuIHdlIGRldGVjdCB0aGF0IGEgY29kZXIg
aXMgbm8gbG9uZ2VyIHZhbGlkCmFuZCBzaG91bGQgYmUgcmVtb3ZlZD8KCklmIEkgbG9vayBhdCB0
aGUgcmVwb3NpdG9yeQoKICAgIGh0dHBzOi8vZ2l0aHViLmNvbS90dWthYW5pLXByb2plY3QveHov
YmxvYi92NS42LjIvQ01ha2VMaXN0cy50eHQjTDY5MwoKICAgIHNldChFTkNPREVSUyAiJHtTVVBQ
T1JURURfRklMVEVSU30iIENBQ0hFIFNUUklORyAiRW5jb2RlcnMgdG8gc3VwcG9ydCIpCgpTbyBp
dCB3b3VsZCBzZWVtIHRoZSBkZWZhdWx0IGlzIHRvIGVuYWJsZSBldmVyeXRoaW5nLCBhbmQgd2Ug
c2hvdWxkIGp1c3QKZHJvcCB0aGUgb3B0aW9uLCBubz8KCj4gIAktREVOQ09ERVJTPSJsem1hMTts
em1hMjtkZWx0YTt4ODY7cG93ZXJwYztpYTY0O2FybTthcm10aHVtYjthcm02NDtzcGFyYztyaXNj
diIgXAo+ICAJLURERUNPREVSUz0ibHptYTE7bHptYTI7ZGVsdGE7eDg2O3Bvd2VycGM7aWE2NDth
cm07YXJtdGh1bWI7YXJtNjQ7c3BhcmM7cmlzY3YiIFwKPiAgCS1ETUFUQ0hfRklOREVSUz0iaGMz
O2hjNDtidDI7YnQzO2J0NCIgXAo+IEBAIC0yNSw4ICsyNSw5IEBAIFhaX0NPTkZfT1BUUyA9IFwK
PiAgCS1ERU5BQkxFX1NNQUxMPU9GRiBcCj4gIAktREVOQUJMRV9TQU5EQk9YPU9OIFwKPiAgCS1E
Q1JFQVRFX1haX1NZTUxJTktTPU9OIFwKPiAtCS1EQ1JFQVRFX0xaTUFfU1lNTElOS1M9T04gXAo+
IC0JLURCVUlMRF9TSEFSRURfTElCUz1PRkYKPiArCS1EQ1JFQVRFX0xaTUFfU1lNTElOS1M9T04K
PiArCj4gK1haX0NPTkZfT1BUUyA9ICQoWFpfQ09NTU9OX0NPTkZfT1BUUykKPiAKPiAgaWZlcSAo
JChCUjJfU1lTVEVNX0VOQUJMRV9OTFMpLHkpCj4gIFhaX0NPTkZfT1BUUyArPSAtREVOQUJMRV9O
TFM9T04KPiBAQCAtNDIsMTEgKzQzLDExIEBAIGVuZGlmCj4gCj4gICMgd2UgYXJlIGJ1aWx0IGJl
Zm9yZSBjY2FjaGUKPiAgSE9TVF9YWl9DT05GX09QVFMgPSBcCj4gLQkkKFhaX0NPTkZfT1BUUykg
XAo+IC0JLURFTkFCTEVfTkxTPU9OIFwKPiArCSQoWFpfQ09NTU9OX0NPTkZfT1BUUykgXAo+ICsJ
LURFTkFCTEVfTkxTPU9GRiBcCgpCdXQgdGhlIHJlYWwgcXVlc3Rpb24gaXM6IHdoeSBkb2VzIGl0
IHNvbWV0aW5lcyB3b3JrLCBhbmQgc29tZXRpbWVzIG5vdD8KVGhpcyBuZWVkcyB0byBiZSBleHBh
aW5lZCBhbmQgdHJhY2VkIGluIHRoZSBjb21taXQgbG9nLgoKT24gbXkgRjM5LCBhbmQgb24gQXJu
b3V0J3MgRjQwLCBhcyB3ZWxsIGFzIG9uIHlvdXIgc3lzdGVtLCBpdCB3YXMKd29ya2luZy4gV2hh
dCBjaGFuZ2VkIGluIHRoZSByZWZlcmVuY2UgYnVpbGQgZW52aXJvbm1lbnQgdGhhdCBjYXVzZXMg
dGhlCmJ1aWxkIHRvIGZpYWw/IE9uIElSQywgQXJub3V0IGhhZCBhIHN1Z2dlc3Rpb246ICJJIGd1
ZXNzIHlvdSBoYXZlCmxpYmludGwtZGV2IG9yIHNvbWV0aGluZyBpbnN0YWxsZWQgdGhlcmU/IgoK
SW4gYW55IGNhc2UsIEkgYmVsaWV2ZSBzdWNoIGEgY29udmVyc2lvbiBjYW4gb25seSBiZSBkb25l
IG9uY2UgdXBzdHJlYW0KY29uaXNkZXJzIHRoZSBjbWFrZSBidWlsZHN5c3RlbSBjb21wbGV0ZSBh
bmQgb2ZmaWNpYWwsIHdoaWNoIGl0CmN1cnJlbnRseSBkb2VzIG5vdC4KClRoYW5rIHlvdSBmb3Ig
dGVzdGluZyBvbiB5b3VyIHNpZGUgYXMgd2VsbCEg8J+RjQoKSW4gdGhlIG1lYW50aW1lLCBJIGhh
ZCBzdGFydGVkIGEgdGVzdCBpbiB0aGUgYmFja2dyb3VuZCwgYnVpbGRpZyB0aG9zZQpjb25maWd1
cmF0aW9uczoKCiAgLSBnbGliYywgbm8gTkxTCiAgLSBnbGliYywgTkxTCiAgLSBtdXNsLCBubyBO
TFMKICAtIG11c2wsIE5MUwogIC0gdUNsaWJjLU5HLCBubyBOTFMKICAtIHVDbGliYy1ORywgTkxT
CgpBbGwgNiBjb21iaW5hdGlvbnMgeWllbGQgYSBjb25maWd1cmF0aW9uIHdoZXJlIHh6ICh0aGUg
dGFyZ2V0IHZhcmlhbnQpCmJ1aWxkcyBzdWNjZXNzZnVsbHkuIFNvIGl0IHNlZW1zIE5MUz1PTi9P
RkYgd29ya3MgT0sgZm9yIHRoZSB0YXJnZXQuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiAg
CS1ERU5BQkxFX1RIUkVBRFM9T04gXAo+ICAJLURDTUFLRV9DX0NPTVBJTEVSX0xBVU5DSEVSPSIi
IFwKPiAtCS1EQ01BS0VfQ1hYX0NPTVBJTEVSX0xBVU5DSEVSPT0iIgo+ICsJLURDTUFLRV9DWFhf
Q09NUElMRVJfTEFVTkNIRVI9IiIKPiAKPiAgJChldmFsICQoY21ha2UtcGFja2FnZSkpCj4gICQo
ZXZhbCAkKGhvc3QtY21ha2UtcGFja2FnZSkpCj4gCj4gUmVnYXJkcywKPiBQZXRlcgo+IAo+IAo+
ID4KPiA+IE1heWJlIGFsdGhvdWdoIHJldmVydGluZyAncGFja2FnZS94ejogZXhwbGljaXRseSBz
cGVjaWZ5IGFsbCBhdXRvY29uZiBvcHRpb25zJwo+ID4gKGFuZCAncGFja2FnZS94ejogZW5hYmxl
IHllYXIyMDM4IG9wdGlvbicpIGFzIEkgdXNlZCB0aGUgc2FtZQo+ID4gJ0hPU1RfWFpfQ09ORl9P
UFRTID0gJChYWl9DT05GX09QVFMpLi4uJyBwYXR0ZXJuIGhlcmU/Cj4gPgo+ID4gUmVnYXJkcywK
PiA+IFBldGVyCj4gPgo+IAo+IFsuLi5dCj4gCgotLSAKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIF9fX19fX19fX19fXwouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0t
LS0tLS0tLS0tLS06ICAgICAgIF8gICAgOi0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBN
T1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAgICBfXy8gKSAgIHwgLyJcIEFTQ0lJIFJJQkJP
TiB8CnwgICAgICAgICAgICAgICAgIHwgU29mdHdhcmUgIERlc2lnbmVyIHwgIF8vIC0gLycgICB8
IFwgLyBDQU1QQUlHTiAgICAgfAp8ICszMyA2MzguNDExLjI0NSAnLS0tLS0tLS0tLS0tLS0tLS0t
LS06IChfICAgIGAtLSwgfCAgWCAgQUdBSU5TVCAgICAgIHwKfCB5YW5uLm1vcmluIChhdCkgb3Jh
bmdlLmNvbSAgICAgICAgICAgfF89IiAgICAsLS0nIHwgLyBcIEhUTUwgTUFJTCAgICB8CictLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLTpfX19fX18vX19fX186LS0tLS0tLS0t
LS0tLS0tLS0tJwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fDQpDZSBtZXNzYWdlIGV0IHNlcyBwaWVjZXMgam9pbnRlcyBwZXV2ZW50IGNvbnRlbmly
IGRlcyBpbmZvcm1hdGlvbnMgY29uZmlkZW50aWVsbGVzIG91IHByaXZpbGVnaWVlcyBldCBuZSBk
b2l2ZW50IGRvbmMNCnBhcyBldHJlIGRpZmZ1c2VzLCBleHBsb2l0ZXMgb3UgY29waWVzIHNhbnMg
YXV0b3Jpc2F0aW9uLiBTaSB2b3VzIGF2ZXogcmVjdSBjZSBtZXNzYWdlIHBhciBlcnJldXIsIHZl
dWlsbGV6IGxlIHNpZ25hbGVyDQphIGwnZXhwZWRpdGV1ciBldCBsZSBkZXRydWlyZSBhaW5zaSBx
dWUgbGVzIHBpZWNlcyBqb2ludGVzLiBMZXMgbWVzc2FnZXMgZWxlY3Ryb25pcXVlcyBldGFudCBz
dXNjZXB0aWJsZXMgZCdhbHRlcmF0aW9uLA0KT3JhbmdlIGRlY2xpbmUgdG91dGUgcmVzcG9uc2Fi
aWxpdGUgc2kgY2UgbWVzc2FnZSBhIGV0ZSBhbHRlcmUsIGRlZm9ybWUgb3UgZmFsc2lmaWUuIE1l
cmNpLg0KDQpUaGlzIG1lc3NhZ2UgYW5kIGl0cyBhdHRhY2htZW50cyBtYXkgY29udGFpbiBjb25m
aWRlbnRpYWwgb3IgcHJpdmlsZWdlZCBpbmZvcm1hdGlvbiB0aGF0IG1heSBiZSBwcm90ZWN0ZWQg
YnkgbGF3Ow0KdGhleSBzaG91bGQgbm90IGJlIGRpc3RyaWJ1dGVkLCB1c2VkIG9yIGNvcGllZCB3
aXRob3V0IGF1dGhvcmlzYXRpb24uDQpJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGVtYWlsIGlu
IGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSB0aGlzIG1lc3NhZ2Ug
YW5kIGl0cyBhdHRhY2htZW50cy4NCkFzIGVtYWlscyBtYXkgYmUgYWx0ZXJlZCwgT3JhbmdlIGlz
IG5vdCBsaWFibGUgZm9yIG1lc3NhZ2VzIHRoYXQgaGF2ZSBiZWVuIG1vZGlmaWVkLCBjaGFuZ2Vk
IG9yIGZhbHNpZmllZC4NClRoYW5rIHlvdS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
