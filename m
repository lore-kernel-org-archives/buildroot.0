Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86F3C25B76
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 13:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C525A4011D;
	Mon,  3 Jun 2024 13:47:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Fo2tnMcGK_f; Mon,  3 Jun 2024 13:47:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DA1840AB2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DA1840AB2;
	Mon,  3 Jun 2024 13:47:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7474E1BF3DE
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 13:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61D4F4097B
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 13:47:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9d9q8Mu5HOuE for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 13:47:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 154A740434
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 154A740434
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 154A740434
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 13:47:29 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-52b87e8ba1eso4260415e87.3
 for <buildroot@buildroot.org>; Mon, 03 Jun 2024 06:47:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717422447; x=1718027247;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=19vLrzrYuK/c9EIjyCWHDBimn/4oAKvFwV4oRcIyP2I=;
 b=EcLqx/oHcOxF5pSGbuBTy/Kpg9/VBBa6C7NH8uVJnEEvdeAKGbXPrpyXerEZJdYJ9F
 0dAdGaIdC98vL49QPK/kmmjoZydwV3r4/R84SuUupvpxfWUEHZkdOXAKfdBEZbTPPGOt
 WEv1x/MFKLbwlpw5KUe57RMtTWzjG1TUU8QKO520dpD0bHx+qddH/kEDhwZplI9lClDx
 1jaOHYfVnINvla8ptj1Lw2jUJKhg7EWu6/foDs0jy48n6cBYktHKtIz3BwRE2qsXAc81
 +3GO+IDLtdGbbSPJ+G4eu6P3VS6KY9EWzkPCcR3Bv5R0OISZw1QWUYVSGjYICQHApiK6
 m6kw==
X-Gm-Message-State: AOJu0Yx0CXPU3TxnZzPdo71n1J/rRr7wUoC2wQcHTMxOVemfXfj9t5yG
 SK4Waub2njKIUHJJSECmMHROxSYB9TcRQ5Z/7TJnTWuikfsT+vkceks1oUYnFNM0rL73bqO96f9
 xqmGmUBhbq+9ITyi9+78kJOVFawB6vsS6
X-Google-Smtp-Source: AGHT+IE5wTd62uqIng7ol1dT4+P0/sz2Ks4KTrELmxVlHatSZaWsWqf5wacBFGnHlsWf9AtIP0ZOzm6NNvSnAyTz9gY=
X-Received: by 2002:a05:6512:3e24:b0:52b:8455:fb1f with SMTP id
 2adb3069b0e04-52b895609e6mr9664010e87.10.1717422446273; Mon, 03 Jun 2024
 06:47:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240603134358.3504092-1-yegorslists@googlemail.com>
In-Reply-To: <20240603134358.3504092-1-yegorslists@googlemail.com>
Date: Mon, 3 Jun 2024 15:49:53 +0200
Message-ID: <CAGm1_kuqeDTv3Kdy4GCb754g47RJu8H5z9Ltp2qou=3EkQfTvA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1717422447; x=1718027247; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=19vLrzrYuK/c9EIjyCWHDBimn/4oAKvFwV4oRcIyP2I=;
 b=l206KWJLDrgNyFB4cZTyb3+WL7sbaTXYmA6jpwYzGc64SWjOFpSbIjc5AUvUvZX8aD
 DGt5xv4XEdWtZCLIEiHhVmxvE64qusnMvkFimsohPuwVuxHy4V6NrC55fCitie1MXOpE
 bKudjldiMMkRs/OTIugq95r+mWSGkEgTFJBK+Zqfyne0z6z2lls8DxXiaABRWT1nFXCj
 HSKQPo3A6GCBCXff4qDpD/apVJfhPL9jLfMr/XM5zuySlbYjNz3Ej2tpeDgMiaVg+dar
 0nykd1OHTqYrKhVLenjphVgTi3qqEpaookydIjne6KVHT11G6cLeBwJUR/LwR6ylihdY
 cRng==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=l206KWJL
Subject: Re: [Buildroot] [PATCH v3] package/ntp: fix build with GCC 14.x
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Bernd Kuhls <bernd@kuhls.net>, yann.morin.1998@free.fr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwgQWxsLAoKT24gTW9uLCBKdW4gMywgMjAyNCBhdCAzOjQ04oCvUE0gPHllZ29yc2xpc3Rz
QGdvb2dsZW1haWwuY29tPiB3cm90ZToKPgo+IEZyb206IFllZ29yIFllZnJlbW92IDx5ZWdvcnNs
aXN0c0Bnb29nbGVtYWlsLmNvbT4KPgo+IEZpeCBwdGhyZWFkX2RldGFjaCgpIGRldGVjdGlvbiB0
aGF0IGlzIGJyb2tlbiB3aGVuIGJ1aWxkaW5nCj4gd2l0aCBHQ0MgMTQueDoKPgo+IGNoZWNraW5n
IGZvciBwdGhyZWFkX2tpbGwuLi4geWVzCj4gY2hlY2tpbmcgZm9yIHB0aHJlYWRfcndsb2NrX2Rl
c3Ryb3kgd2l0aCA8cHRocmVhZC5oPi4uLiB5ZXMKPiBjaGVja2luZyBmb3IgcHRocmVhZF9kZXRh
Y2ggd2l0aCA8cHRocmVhZC5oPi4uLiBubwo+IGNvbmZpZ3VyZTogZXJyb3I6IGNvdWxkIG5vdCBs
b2NhdGUgcHRocmVhZF9kZXRhY2goKQo+IG1ha2VbMV06ICoqKiBbcGFja2FnZS9wa2ctZ2VuZXJp
Yy5tazoyNzM6Cj4gL2hvbWUvdXNlci9idWlsZHJvb3QvYnNwLWJhcmVib3gvYnVpbGQvbnRwLTQu
Mi44cDE3Ly5zdGFtcF9jb25maWd1cmVkXQo+IEVycm9yIDEKPiBtYWtlOiAqKiogW01ha2VmaWxl
OjgyOiBfYWxsXSBFcnJvciAyCj4KPiBSZWZlcmVuY2U6IGh0dHBzOi8vYnVncy5udHAub3JnL3No
b3dfYnVnLmNnaT9pZD0zOTI2Cj4KPiBBZGRpdGlvbmFsbHksIHJlZnJlc2ggcGF0Y2ggMDAwMiB0
byBmaXggdGhlIG9mZnNldCBvZiBodW5rIDEuCj4KPiBTaWduZWQtb2ZmLWJ5OiBZZWdvciBZZWZy
ZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+Cj4gLS0tCj4gQ2hhbmdlcyB2MSAtPiB2
MjoKPiAgLSBhZGQgdXBzdHJlYW0gcmVmZXJlbmNlIChZYW5uIEUuIE1PUklOKQo+ICAtIHJld29y
ayAwMDAyIHJlZnJlc2ggcmVhc29uIChZYW5uIEUuIE1PUklOKQo+ICAtIGFkZCBlcnJvciBsb2cK
Pgo+IENoYW5nZXMgdjIgLT4gdjM6Cj4gIC0gYWRkIHByb3BlciBVcHN0cmVhbSB0YWcgdG8gdGhl
IDAwMDMtZml4LXB0aHJlYWQtZGV0YWNoLWNoZWNrLnBhdGNoCj4gICAgZmlsZQo+Cj4gIHBhY2th
Z2UvbnRwLzAwMDItbnRwLXN5c2NhbGxzLWZhbGxiYWNrLnBhdGNoICB8ICA5ICsrKystLS0KPiAg
Li4uL250cC8wMDAzLWZpeC1wdGhyZWFkLWRldGFjaC1jaGVjay5wYXRjaCAgIHwgMjYgKysrKysr
KysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL250cC8wMDAzLWZpeC1wdGhy
ZWFkLWRldGFjaC1jaGVjay5wYXRjaAo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbnRwLzAwMDIt
bnRwLXN5c2NhbGxzLWZhbGxiYWNrLnBhdGNoIGIvcGFja2FnZS9udHAvMDAwMi1udHAtc3lzY2Fs
bHMtZmFsbGJhY2sucGF0Y2gKPiBpbmRleCA1MzVmYzkzZGZkLi40NjcwNGI5ZDNmIDEwMDY0NAo+
IC0tLSBhL3BhY2thZ2UvbnRwLzAwMDItbnRwLXN5c2NhbGxzLWZhbGxiYWNrLnBhdGNoCj4gKysr
IGIvcGFja2FnZS9udHAvMDAwMi1udHAtc3lzY2FsbHMtZmFsbGJhY2sucGF0Y2gKPiBAQCAtOCwx
MCArOCwxMSBAQCBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBLbmlnaHQgPGphbWVzLmtuaWdodEByb2Nr
d2VsbGNvbGxpbnMuY29tPgo+ICAgY29uZmlndXJlLmFjIHwgNCArKy0tCj4gICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gLWRpZmYgLS1naXQgYS9j
b25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKPiAtLS0tIGEvY29uZmlndXJlLmFjCj4gLSsrKyBi
L2NvbmZpZ3VyZS5hYwo+IC1AQCAtMTUyMywxMSArMTUyMywxMSBAQCBBQ19DQUNIRV9DSEVDSygK
PiArSW5kZXg6IG50cC00LjIuOHAxNy9jb25maWd1cmUuYWMKPiArPT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ICstLS0g
bnRwLTQuMi44cDE3Lm9yaWcvY29uZmlndXJlLmFjCj4gKysrKyBudHAtNC4yLjhwMTcvY29uZmln
dXJlLmFjCj4gK0BAIC0xNDcyLDExICsxNDcyLDExIEBAIEFDX0NBQ0hFX0NIRUNLKAo+ICAgICAg
IFtudHBfY3ZfdmFyX250cF9zeXNjYWxsc10sCj4gICAgICAgWwo+ICAgICAgICAgbnRwX2N2X3Zh
cl9udHBfc3lzY2FsbHM9bm8KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9udHAvMDAwMy1maXgtcHRo
cmVhZC1kZXRhY2gtY2hlY2sucGF0Y2ggYi9wYWNrYWdlL250cC8wMDAzLWZpeC1wdGhyZWFkLWRl
dGFjaC1jaGVjay5wYXRjaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAw
MC4uODk0YjQyMmYyYwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL250cC8wMDAzLWZp
eC1wdGhyZWFkLWRldGFjaC1jaGVjay5wYXRjaAo+IEBAIC0wLDAgKzEsMjYgQEAKPiArZml4IHB0
aHJlYWRfZGV0YWNoIGNoZWNrCj4gKwo+ICtVcHN0cmVhbTogaHR0cHM6Ly9idWdzLm50cC5vcmcv
c2hvd19idWcuY2dpP2lkPTM5MjYKPiArCj4gK1NpZ25lZC1vZmYtYnk6IFllZ29yIFllZnJlbW92
IDx5ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbT4KPiArLS0tCj4gKyBzbnRwL200L29wZW5sZGFw
LXRocmVhZC1jaGVjay5tNCB8ICAgIDYgKystLS0tCj4gKyAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ICsKPiArSW5kZXg6IG50cC00LjIuOHAxNy9zbnRw
L200L29wZW5sZGFwLXRocmVhZC1jaGVjay5tNAo+ICs9PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gKy0tLSBudHAtNC4y
LjhwMTcub3JpZy9zbnRwL200L29wZW5sZGFwLXRocmVhZC1jaGVjay5tNAo+ICsrKysgbnRwLTQu
Mi44cDE3L3NudHAvbTQvb3BlbmxkYXAtdGhyZWFkLWNoZWNrLm00Cj4gK0BAIC0yNjIsMTAgKzI2
Miw4IEBAIHB0aHJlYWRfcndsb2NrX3Qgcndsb2NrOwo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZG5sIHNhdmUgdGhlIGZsYWdzCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBBQ19MSU5LX0lGRUxTRShbQUNfTEFOR19QUk9HUkFNKFtbCj4gKyAjaW5jbHVkZSA8cHRo
cmVhZC5oPgo+ICstI2lmbmRlZiBOVUxMCj4gKy0jZGVmaW5lIE5VTEwgKHZvaWQqKTAKPiArLSNl
bmRpZgo+ICstXV0sIFtbcHRocmVhZF9kZXRhY2goTlVMTCk7XV0pXSxbb2xfY3ZfZnVuY19wdGhy
ZWFkX2RldGFjaD15ZXNdLFtvbF9jdl9mdW5jX3B0aHJlYWRfZGV0YWNoPW5vXSkKPiArK3B0aHJl
YWRfdCB0aHJlYWQ7Cj4gKytdXSwgW1twdGhyZWFkX2RldGFjaCh0aHJlYWQpO11dKV0sW29sX2N2
X2Z1bmNfcHRocmVhZF9kZXRhY2g9eWVzXSxbb2xfY3ZfZnVuY19wdGhyZWFkX2RldGFjaD1ub10p
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgXSkKPiArCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgaWYgdGVzdCAkb2xfY3ZfZnVuY19wdGhyZWFkX2RldGFjaCA9IG5vIDsgdGhlbgo+IC0tCj4g
Mi4zNC4xCgpUaG91Z2ggdGhlcmUgaXMgYSBuZXcgbnRwIHJlbGVhc2UsIHRoaXMgZml4IGlzIG5v
dCBpbmNsdWRlZCBpbiBudHAtNC4yLjhwMTggOi0oCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
