Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7A9C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 16:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCB9B80ED5;
	Sat, 17 May 2025 16:41:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zorkBox-cfaZ; Sat, 17 May 2025 16:41:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10C4180E93
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10C4180E93;
	Sat, 17 May 2025 16:41:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9715E204
 for <buildroot@buildroot.org>; Sat, 17 May 2025 16:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C625409E9
 for <buildroot@buildroot.org>; Sat, 17 May 2025 16:41:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FyiT-jt_Yyok for <buildroot@buildroot.org>;
 Sat, 17 May 2025 16:41:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=stefan.nickl@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 51EED409D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51EED409D2
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51EED409D2
 for <buildroot@buildroot.org>; Sat, 17 May 2025 16:41:36 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a0bdcd7357so2624255f8f.1
 for <buildroot@buildroot.org>; Sat, 17 May 2025 09:41:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747500094; x=1748104894;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EzdPwil1KpdVOpx8kaMELdQlNGAi6kwQGtjO41V57sY=;
 b=EwCe/tJiXK+CDTBcrX7UaL0BtHFMAonTFhd1mxlaerXV3DdxgM/0ZmhPORFNkr9a7k
 cI1dQWl8BOTz+r2FiJ9c/ujPVdFhbfSqoTNsQfU64sMHOJVoETWxY7t8zJE2fS7kZR7Y
 aFqklI8P2S51RZOoY5qlWJNCocZUuSFpeAt0fP7DbGos8hNHKU7a5eAClpEcq7BLEgMI
 ECzt7MixVRJ2xT3NZcCNGSs71bYvhyq5kzYzw5FlfzdP7ecCdPYVF/VGhOspc2hovwx0
 NWEQrhwPhQVm9ss4hLWGao0eXM+t+wFwZJhPP/Nn+01diQczuLuwnXiakvFIh4BHu/C0
 Hk2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZ4Br3bEMe+PNxYCwMtQbRGORk4tgUn7qKSTGmEDK/toFJGd0Hg2DmC4XbnZXCo1f29ZLuNW6vT8g=@buildroot.org
X-Gm-Message-State: AOJu0YzZQv/oEz1AnsGZE91Osot1vAWI4DTZArA4s7dLewpcDwX149rb
 8z7BBpJiy/cGWh3dqR2p5pqyp7acu6P0VPbNHfr16WPYfVeBGCAu5usKoKRfDA==
X-Gm-Gg: ASbGncvQ9Exn6o2LmndgDrdnXyS+owlRh0KZ8e3xrIxy6oIq2wRG9M3JHRL8HgbnE+s
 hJhkSdR8Uro8s3H0ig7YRjzfMPixqurine0a0EKUQwu+TiNSNUErl+19ug2p2BpKAjslCTzk9dH
 bXr32fdOa6g5LedEdaYHkcqjuNfUYmynUzLy/PF2TfOWCiE4vzSNMrcBQbNmpQVVGvQrZOc+bR7
 9RAs7vnG+mDOhwKkH0IhIi6izGf0gw1oXL0pd5B8cTq43QQ/FyjQ6EWA2z+vf4ifBda4h1OXmsX
 CTuh99hUFSo+RQng4cpYB5Em0LNv7MiUWL/C5hqv1LEO452Pm32+pSfVDOP2jEQbyYyK9xav5on
 vRGyHhwRQGCwStEepJ8ztJzb5L/JAYP4kVY40iMkbKVAat84via25seJ9AcG4dSoi6FMlADOhj+
 1TOpLcAY2NFA==
X-Google-Smtp-Source: AGHT+IE1FNoBHg+y+en3hZgMLNl+CE6UBEQQqSVXuYFZxG4NYLpxvDpQECz/3e9WM8l/4kpylCeL3g==
X-Received: by 2002:a05:6000:1a8a:b0:3a1:fe77:9e3d with SMTP id
 ffacd0b85a97d-3a35c847d02mr7046895f8f.37.1747500093836; 
 Sat, 17 May 2025 09:41:33 -0700 (PDT)
Received: from ?IPv6:2003:d1:973f:f600:2879:4b00:19d2:def9?
 (p200300d1973ff60028794b0019d2def9.dip0.t-ipconnect.de.
 [2003:d1:973f:f600:2879:4b00:19d2:def9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442fd59701dsm74268225e9.35.2025.05.17.09.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 May 2025 09:41:33 -0700 (PDT)
Message-ID: <4e0cb67e1d9ab7c1316e36b92ec6b17a3e87ec31.camel@gmail.com>
From: Stefan Nickl <stefan.nickl@gmail.com>
To: Arnout Vandecappelle <arnout@rnout.be>, buildroot@buildroot.org
Date: Sat, 17 May 2025 18:41:30 +0200
In-Reply-To: <24533fc5-3cfc-4913-9921-34cbfce732cd@rnout.be>
References: <20250504163611.141654-1-Stefan.Nickl@gmail.com>
 <24533fc5-3cfc-4913-9921-34cbfce732cd@rnout.be>
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747500094; x=1748104894; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EzdPwil1KpdVOpx8kaMELdQlNGAi6kwQGtjO41V57sY=;
 b=NkKEq8nbM5tQSIc9mTxMsa+VSeMHh4i+EBiGy/hxPMIFnJra1uGnPmTAoWmVWJjbY/
 jg5IWT2zW+xSAIceXMQUsy3l2IeAeGQeh3YJMWC3Fdos/izsxnIpad4Xk44t0hRuwX/y
 rFcOMNie8fWg+VHTKc+S/KqlhT4iFYP3ooLpDRzWsMQipZr834AifZkeF3NQz/CZAxym
 VQttgAoqpdowdiZRuLMRoejMiIFwfFD1spiFLlXKyvaUuqtS//h6xvAa5O+D1V42wIFv
 ApemvZ8KpH/aGxFT1o5/Ju72rk14r/1opOXCiAmnFfEn/VBBIsXa4TOLssEfBfPcfcO1
 ySoQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NkKEq8nb
Subject: Re: [Buildroot] [PATCH 1/1] Add gh site method for GitHub cli
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCAyMDI1LTA1LTE2IGF0IDIzOjE4ICswMjAwLCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3
cm90ZToKPiBIYXZpbmcgc29tZXRoaW5nIGdpdGh1YiBzcGVjaWZpYyBpcyBub3QgdmVyeSBuaWNl
Li4uIFdlIHNob3VsZCB0aGVuCj4gYWxzbyAKPiBwcm92aWRlIHRoZSBlcXVpdmFsZW50IGZvciBn
aXRsYWIsIGJpdGJ1Y2tldCwgLi4uCgpUaGFua3MgZm9yIGxvb2tpbmcgaW50byB0aGlzLgoKVGhl
cmUncyBhIHRvb2wgaHR0cHM6Ly9naXRodWIuY29tL2dydW50d29yay1pby9mZXRjaCBidXQgSSBo
YXZlbid0CmdpdmVuIGl0IGZ1cnRoZXIgY29uc2lkZXJhdGlvbiBiZWNhdXNlIGl0IGRvZXNuJ3Qg
c2VlbSB0byBiZSBwYWNrYWdlZAppbiBGZWRvcmEgb3IgRGViaWFuLgoKPiA+IEl0IGlzIGludGVu
ZGVkIGFzIGFuIGFsdGVybmF0aXZlIHRvIHB1bGxpbmcgd2l0aCB0aGUgImdpdCIgbWV0aG9kLAo+
ID4gd2hpY2gKPiA+IGhhcyB0aGUgZHJhd2JhY2sgb2YgcmVxdWlyaW5nIHNlcGFyYXRlIHNzaCBr
ZXlzCj4gCj4gwqAgSSBndWVzcyB5b3UgbWVhbiB0aGF0IHlvdSBuZWVkIHRvIGdlbmVyYXRlIHNz
aCBrZXlzIGZvciBDST8KCk90aGVyIHBlb3BsZSBtYXkgaGF2ZSBkaWZmZXJlbnQgZXhwZXJpZW5j
ZXMsIGJ1dCBtaW5lIGlzIHRoYXQgaWYgeW91J3JlCndvcmtpbmcgd2l0aGluIGEgYmlnZ2VyIG9y
Z2FuaXphdGlvbiB5b3Ugd2FudCB0byBzdGljayB0byBodHRwcyBiZWNhdXNlCm90aGVyd2lzZSB5
b3UnbGwgYmUgY29uc3RhbnRseSBmaWdodGluZyB0aGUgYWRtaW5zIGFib3V0IGdldHRpbmcgcG9y
dAoyMiB1bmJsb2NrZWQgYW5kIGtlZXBpbmcgaXQgdGhhdCB3YXkuCgo+ID4gYW5kIHJlc3VsdGlu
ZyBpbgo+ID4gZGlmZmVyZW50IGFyY2hpdmVzIGRlcGVuZGluZyBvbiB0aGUgYnVpbGRyb290IHZl
cnNpb24sCj4gCj4gwqAgSG93IGRvZXMgZ2ggaGVscCB3aXRoIHRoYXQ/IFRoZSB0YXJiYWxscyBp
dCBwcm9kdWNlcyBhcmUgbm90Cj4gcmVwcm9kdWNpYmxlIGF0IAo+IGFsbC4uLiBUaGUgb25lcyB3
ZSB1c2UgaGFwcGVuIHRvIGJlIHRoZSBzYW1lIGFsbCB0aGUgdGltZSBiZWNhdXNlIHdlCj4gcmUt
cmVxdWVzdCAKPiB0aGVtIGFsbCB0aGUgdGltZSBzbyB0aGV5J3JlIGNhY2hlZCwgYnV0IHRoZXJl
J3MgYWN0dWFsbHkgbm8KPiBndWFyYW50ZWUgZm9yIHRoYXQuCgpJIGFncmVlIHRoYXQgaXQgaXMg
YW4gaXNzdWUsIGJ1dCB3ZSBoYXZlIGFuIGludGVybmFsIHByaW1hcnkgc2V0IHVwCnRoYXQga2Vl
cHMgY29waWVzIG9mIHRoZSBhcmNoaXZlcyBpbmRlZmluaXRlbHkuCgpPdXQgb2YgY3VyaW9zaXR5
LCBhcmUgeW91IHN1cmUgeW91J3JlIGhpdHRpbmcgR2l0SHViIHRoYXQgb2Z0ZW4/IEV2ZW4KZm9y
IHJhcmVseSB1c2VkIHBhY2thZ2VzIGNhY2hlZCBieSBzb3VyY2VzLmJ1aWxkcm9vdC5uZXQ/CgpG
cm9tIHdoZXJlIEkgc3RhbmQsIGl0J3MgbW9yZSBvZiBhIGh5cG90aGV0aWNhbCBpc3N1ZSBhcyBj
b21wYXJlZCB0bwp0aGUgcHJhY3RpY2FsIG9uZSB0aGF0IHNvbWUgdXNlcnMgYXJlIGFkZGluZyBw
YWNrYWdlcyB3aXRoICJicjEiIGhhc2hlcwp0byBvdXIgc2hhcmVkIGV4dGVybmFsIHdoaWxlIG90
aGVycyBhZGQgImdpdDQiIGhhc2hlcy4KCj4gPiBhbmQgcGFzc2luZyBhbgo+ID4gYXV0aGVudGlj
YXRpb24gdG9rZW4gb24gdGhlIHdnZXQgY29tbWFuZCBsaW5lLCB3aGljaCByaXNrcyBsZWFraW5n
Cj4gPiB0aGUKPiA+IHRva2VuIHRvIHRoaXJkLXBhcnR5IHNlcnZlcnMuCj4gCj4gwqAgV2VsbCwg
dGhhdCdzIG5vdCByZWFsbHkgYSBnb29kIHJlYXNvbiwgdGhlcmUgYXJlIGJldHRlciB3YXlzIHRv
IGRvCj4gdGhhdC4gSSd2ZSAKPiBjcmVhdGVkIGEgZG9jdW1lbnRhdGlvbiBwYXRjaCBbMV0gdG8g
ZXhwbGFpbiBpdCBhbmQgcHV0IHlvdSBpbiBDYy4KCkdvb2QgYWRkaXRpb24gdG8gdGhlIGRvY3Vt
ZW50YXRpb24sIGhvd2V2ZXIgSSd2ZSBhbHJlYWR5IHVzZWQgYWxsIHRob3NlCnRyaWNrcyBhbmQg
c3RpbGwgaGVyZSB3ZSBhcmUuCgpUaGUgLm5ldHJjIG1ldGhvZCB1bmZvcnR1bmF0ZWx5IGRvZXMg
bm90IHdvcmsgYmVjYXVzZSB0aGUgZm9yZ2VzCmdlbmVyYWxseSByZXF1aXJlIGEgdG9rZW4gaGVh
ZGVyIGluc3RlYWQgb2YgaHR0cCBiYXNpYyBhdXRoZW50aWNhdGlvbi4KQW5kIGJlY2F1c2UgR2l0
SHViIG1pZ2h0IGNoYW5nZSB0aGluZ3MgaW4gdGhlIGZ1dHVyZSwgZ29pbmcgd2l0aCB0aGUKb2Zm
aWNpYWwgY2xpIHRvb2wgc2VlbXMgbGlrZSBhIHJlbGF0aXZlbHkgc2FmZSBiZXQuCgpSZWdhcmRz
LApTdGVmYW4KCj4gWzFdIAo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9i
dWlsZHJvb3QvcGF0Y2gvMjAyNTA1MTYyMTE0MjkuNzYzMjExLTEtYXJub3V0QHJub3V0LmJlLwo+
IAo+IAo+IAo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gTmlja2wgPFN0ZWZhbi5OaWNr
bEBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+IMKgIENvbmZpZy5pbsKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8wqAgNCArKysrCj4gPiDCoCBwYWNrYWdlL3BrZy1kb3dubG9hZC5t
a8KgwqDCoMKgIHzCoCAxICsKPiA+IMKgIHN1cHBvcnQvZG93bmxvYWQvZGwtd3JhcHBlciB8wqAg
MiArLQo+ID4gwqAgc3VwcG9ydC9kb3dubG9hZC9naMKgwqDCoMKgwqDCoMKgwqAgfCA0Mwo+ID4g
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gwqAgNCBmaWxlcyBjaGFu
Z2VkLCA0OSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiDCoCBjcmVhdGUgbW9kZSAx
MDA3NTUgc3VwcG9ydC9kb3dubG9hZC9naAo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvQ29uZmlnLmlu
IGIvQ29uZmlnLmluCj4gPiBpbmRleCBkNzMwZjIwMzRiLi5jYjE3OGVlOGQyIDEwMDY0NAo+ID4g
LS0tIGEvQ29uZmlnLmluCj4gPiArKysgYi9Db25maWcuaW4KPiA+IEBAIC0xNzIsNiArMTcyLDEw
IEBAIGNvbmZpZyBCUjJfSEcKPiA+IMKgwqAJc3RyaW5nICJNZXJjdXJpYWwgKGhnKSBjb21tYW5k
Igo+ID4gwqDCoAlkZWZhdWx0ICJoZyIKPiA+IMKgIAo+ID4gK2NvbmZpZyBCUjJfR0gKPiA+ICsJ
c3RyaW5nICJHaXRIdWIgY2xpIGNvbW1hbmQiCj4gPiArCWRlZmF1bHQgImdoIgo+ID4gKwo+ID4g
wqAgY29uZmlnIEJSMl9aQ0FUCj4gPiDCoMKgCXN0cmluZyAiemNhdCBjb21tYW5kIgo+ID4gwqDC
oAlkZWZhdWx0ICJnemlwIC1kIC1jIgo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGtnLWRvd25s
b2FkLm1rIGIvcGFja2FnZS9wa2ctZG93bmxvYWQubWsKPiA+IGluZGV4IGNmNTk1OWVhOTUuLjA4
YjBkNDIwYzcgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL3BrZy1kb3dubG9hZC5tawo+ID4gKysr
IGIvcGFja2FnZS9wa2ctZG93bmxvYWQubWsKPiA+IEBAIC0xMTEsNiArMTExLDcgQEAgZGVmaW5l
IERPV05MT0FECj4gPiDCoMKgCUNWUz0iJChjYWxsIHFzdHJpcCwkKEJSMl9DVlMpKSIgXAo+ID4g
wqDCoAlHSVQ9IiQoY2FsbCBxc3RyaXAsJChCUjJfR0lUKSkiIFwKPiA+IMKgwqAJSEc9IiQoY2Fs
bCBxc3RyaXAsJChCUjJfSEcpKSIgXAo+ID4gKwlHSD0iJChjYWxsIHFzdHJpcCwkKEJSMl9HSCkp
IiBcCj4gPiDCoMKgCUxPQ0FMRklMRVM9IiQoY2FsbCBxc3RyaXAsJChCUjJfTE9DQUxGSUxFUykp
IiBcCj4gPiDCoMKgCVNDUD0iJChjYWxsIHFzdHJpcCwkKEJSMl9TQ1ApKSIgXAo+ID4gwqDCoAlT
RlRQPSIkKGNhbGwgcXN0cmlwLCQoQlIyX1NGVFApKSIgXAo+ID4gZGlmZiAtLWdpdCBhL3N1cHBv
cnQvZG93bmxvYWQvZGwtd3JhcHBlciBiL3N1cHBvcnQvZG93bmxvYWQvZGwtCj4gPiB3cmFwcGVy
Cj4gPiBpbmRleCA1NDQ1YWFkNWE3Li5hMjA5NjY1YjBmIDEwMDc1NQo+ID4gLS0tIGEvc3VwcG9y
dC9kb3dubG9hZC9kbC13cmFwcGVyCj4gPiArKysgYi9zdXBwb3J0L2Rvd25sb2FkL2RsLXdyYXBw
ZXIKPiA+IEBAIC05NSw3ICs5NSw3IEBAIG1haW4oKSB7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqAg
YmFja2VuZF91cmxlbmNvZGU9IiR7dXJpJSUrKn0iCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqAgYmFj
a2VuZD0iJHtiYWNrZW5kX3VybGVuY29kZSV8Kn0iCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqAgY2Fz
ZSAiJHtiYWNrZW5kfSIgaW4KPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdpdHxzdm58Y3Zz
fGJ6cnxmaWxlfHNjcHxoZ3xzZnRwKSA7Owo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ2l0
fHN2bnxjdnN8YnpyfGZpbGV8c2NwfGhnfGdofHNmdHApIDs7Cj4gPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBmdHB8ZnRwcykgYmFja2VuZD0iY3VybCIgOzsKPiA+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICopIGJhY2tlbmQ9IndnZXQiIDs7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqAg
ZXNhYwo+ID4gZGlmZiAtLWdpdCBhL3N1cHBvcnQvZG93bmxvYWQvZ2ggYi9zdXBwb3J0L2Rvd25s
b2FkL2doCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDc1NQo+ID4gaW5kZXggMDAwMDAwMDAwMC4uNWMz
Njg1NWNjZgo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvc3VwcG9ydC9kb3dubG9hZC9naAo+
ID4gQEAgLTAsMCArMSw0MyBAQAo+ID4gKyMhL3Vzci9iaW4vZW52IGJhc2gKPiA+ICsKPiA+ICsj
IFdlIHdhbnQgdG8gY2F0Y2ggYW55IHVuZXhwZWN0ZWQgZmFpbHVyZSwgYW5kIGV4aXQgaW1tZWRp
YXRlbHkKPiA+ICtzZXQgLWUKPiA+ICsKPiA+ICsjIERvd25sb2FkIGhlbHBlciBmb3IgR2l0SHVi
IENMSSwgdG8gYmUgY2FsbGVkIGZyb20gdGhlIGRvd25sb2FkCj4gPiB3cmFwcGVyIHNjcmlwdAo+
ID4gKyMKPiA+ICsjIE9wdGlvbnM6Cj4gPiArI8KgwqAgLW8gRklMRcKgwqDCoMKgIFNhdmUgaW50
byBmaWxlIEZJTEUuCj4gPiArI8KgwqAgLWYgRklMRU5BTUUgVGhlIGZpbGVuYW1lIG9mIHRoZSB0
YXJiYWxsIHRvIGdldCBhdCBVUkwKPiA+ICsjwqDCoCAtdSBVUkzCoMKgwqDCoMKgIERvd25sb2Fk
IGZpbGUgYXQgVVJMLgo+ID4gKyMKPiA+ICsjIEVudmlyb25tZW50Ogo+ID4gKyPCoMKgIEdIwqDC
oMKgwqDCoMKgwqAgOiB0aGUgZ2ggY29tbWFuZCB0byBjYWxsCj4gPiArCj4gPiArcXVpZXQ9Cj4g
PiArd2hpbGUgZ2V0b3B0cyAiJHtCUl9CQUNLRU5EX0RMX0dFVE9QVFN9IiBPUFQ7IGRvCj4gPiAr
wqDCoMKgIGNhc2UgIiR7T1BUfSIgaW4KPiA+ICvCoMKgwqAgbynCoCBvdXRwdXQ9IiR7T1BUQVJH
fSI7Owo+ID4gK8KgwqDCoCBmKcKgIGZpbGVuYW1lPSIke09QVEFSR30iOzsKPiA+ICvCoMKgwqAg
dSnCoCB1cmw9IiR7T1BUQVJHfSI7Owo+ID4gK8KgwqDCoCA6KcKgIHByaW50ZiAib3B0aW9uICcl
cycgZXhwZWN0cyBhIG1hbmRhdG9yeSBhcmd1bWVudFxuIgo+ID4gIiR7T1BUQVJHfSI7IGV4aXQg
MTs7Cj4gPiArwqDCoMKgIFw/KSBwcmludGYgInVua25vd24gb3B0aW9uICclcydcbiIgIiR7T1BU
QVJHfSIgPiYyOyBleGl0IDE7Owo+ID4gK8KgwqDCoCBlc2FjCj4gPiArZG9uZQo+ID4gKwo+ID4g
K3NoaWZ0ICQoKE9QVElORC0xKSkgIyBHZXQgcmlkIG9mIG91ciBvcHRpb25zCj4gPiArCj4gPiAr
IyBDYWxsZXIgbmVlZHMgdG8gc2luZ2xlLXF1b3RlIGl0cyBhcmd1bWVudHMgdG8gcHJldmVudCB0
aGVtIGZyb20KPiA+ICsjIGJlaW5nIGV4cGFuZGVkIGEgc2Vjb25kIHRpbWUgKGluIGNhc2UgdGhl
cmUgYXJlIHNwYWNlcyBpbiB0aGVtKQo+ID4gK19naCgpIHsKPiA+ICvCoMKgwqAgaWYgWyAteiAi
JHtxdWlldH0iIF07IHRoZW4KPiA+ICvCoMKgwqDCoMKgwqDCoCBwcmludGYgJyVzICcgJHtHSH0g
IiR7QH0iOyBwcmludGYgJ1xuJwo+ID4gK8KgwqDCoCBmaQo+ID4gK8KgwqDCoCBfcGxhaW5fZ2gg
IiRAIgo+ID4gK30KPiA+ICsjIE5vdGU6IHBsZWFzZSBrZWVwIGNvbW1hbmQgYmVsb3cgYWxpZ25l
ZCB3aXRoIHdoYXQgaXMgcHJpbnRlZAo+ID4gYWJvdmUKPiA+ICtfcGxhaW5fZ2goKSB7Cj4gPiAr
wqDCoMKgIGV2YWwgJHtHSH0gIiR7QH0iCj4gPiArfQo+ID4gKwo+ID4gK19naCBhcGkgLUggIidB
Y2NlcHQ6IGFwcGxpY2F0aW9uL3ZuZC5naXRodWIucmF3K2pzb24nIiAiJHtAfSIgXAo+ID4gK8Kg
wqDCoCAiJyR7dXJsfS8ke2ZpbGVuYW1lfSciICI+JyR7b3V0cHV0fSciCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
