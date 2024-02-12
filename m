Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B71FC4829B
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 00:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96F9F84129;
	Mon, 12 Feb 2024 00:51:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vnKKHTcVCQVI; Mon, 12 Feb 2024 00:51:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69E8384124
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69E8384124;
	Mon, 12 Feb 2024 00:51:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DEFAD1BF868
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 00:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA178403AC
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 00:51:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3oWuVMTxtT4a for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 00:51:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2f; helo=mail-oa1-x2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7317940106
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7317940106
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7317940106
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 00:51:44 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-206689895bfso2110829fac.1
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 16:51:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707699103; x=1708303903;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+99hlinLINS8CPQU7BQ3FADEVceO1/DNrrqBJDjasCI=;
 b=WqOuuMkr50easBvYsBfho/cKCs34MoSgww+kOIJv4cydlBmJQv/e8KtiQzkyuLTuF1
 Lis8eK7LHPsUO+4MZCjqJfFAp/85rtNhHrPy/QCxbtJ/I6Iy/w3PA+2r/erSorzjN+uC
 z/0fGRq7ml494bNO3MUxaOXxxI6dmYXITv1L6V3B055ALKjEIom6tQ6vEa28uZ2R+EAv
 cgpix4CDgBDqP0VWR7mpGqz4GN94c/ZopgX1yKX/zR84M+muTyzXvY2gCswZb3nqvDoG
 3Dw9tG/N/inRPxAU/7JQcTI7g325f8u9YMGgxHFQOMnj43X+EIM49tC39aiMq7VDqo07
 GdjQ==
X-Gm-Message-State: AOJu0YysvFuKHMzj7MxR2PH4RFa1AKWPvvnCS7z27UzlKUhG9SrXkl8K
 PAS4abIZs+zH3/SZpCGFXLGEvnVabXQIAJ4vGXCPZZbwlMbQ2KprdQspk3apgyG7ES3KdG2UbQl
 rVbgLQ/Fvn3oBHnkrB6fbMNImthAdfLNG7XzIJg==
X-Google-Smtp-Source: AGHT+IHeXoVEVCXAWoNdpasIHdr6vzQRS8cSP6QW+WChvI+DfgmuCUzjmBvn117qpnsbjxch2auhrIe2T0CkCF/rG9Y=
X-Received: by 2002:a05:6870:5246:b0:218:f129:8a98 with SMTP id
 o6-20020a056870524600b00218f1298a98mr5223134oai.42.1707699103351; Sun, 11 Feb
 2024 16:51:43 -0800 (PST)
MIME-Version: 1.0
References: <20240209175631.1337370-1-james.hilliard1@gmail.com>
 <Zck6_sR8fspWF37e@landeda>
 <CADvTj4ppD06TSGnYUUBSzB_sV6vErb2ozyMuGr1QjyLtu_pvPA@mail.gmail.com>
 <ZclC3_dSvLTp6Ras@landeda> <18bea399-dc8e-424b-b087-3823d0bd4545@bubu1.eu>
In-Reply-To: <18bea399-dc8e-424b-b087-3823d0bd4545@bubu1.eu>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 11 Feb 2024 17:51:30 -0700
Message-ID: <CADvTj4pdnvNK3go=5t6PWhU8ax0gNpqwD3kpOUn9RCJV8b2NkA@mail.gmail.com>
To: Marcus Hoffmann <buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707699103; x=1708303903; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+99hlinLINS8CPQU7BQ3FADEVceO1/DNrrqBJDjasCI=;
 b=XszKkHv89bbGfQAp9/zhgAIcKLL4QkcezmyUhIQiaP++a+7k48yyjMwaHsW0+WhGdn
 bKkhUwkx2Yl1SMVvnlO/IebungxW5Co8jD28Rc1kCGQseX5eQlnNRG1GNwWB687V8Pda
 lwZ+IEtoJADLtIF7KpD6aYp1Ws3NWliNLzwQK9bzXXsfqEwVpywmtchrZOI7OXDnh/Lf
 7WwbbF5a+NqWQd3imdI9AItzsD7bXLx5YQO254yJvPhRkJuhw609hJef0bes+5fezKHZ
 v9YksFx3jQ8BTTcnpVU/8FzaxwkF2opjZAkQ1YvUvmBQVrifGMDHnMMINSSuQwwSjtdi
 QwQA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XszKkHv8
Subject: Re: [Buildroot] [PATCH 1/2] package/python-uvloop: add support for
 cython3
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCBGZWIgMTEsIDIwMjQgYXQgNToxM+KAr1BNIE1hcmN1cyBIb2ZmbWFubiA8YnVpbGRy
b290QGJ1YnUxLmV1PiB3cm90ZToKPgo+IEhpIFlhbm4sIEphbWVzLAo+Cj4gT24gMTEuMDIuMjQg
MjI6NTcsIFlhbm4gRS4gTU9SSU4gd3JvdGU6Cj4gPiBKYW1lcywgQWxsLAo+ID4KPiA+IE9uIDIw
MjQtMDItMTEgMTQ6MzkgLTA3MDAsIEphbWVzIEhpbGxpYXJkIHNwYWtlIHRodXNseToKPiA+PiBP
biBTdW4sIEZlYiAxMSwgMjAyNCBhdCAyOjI04oCvUE0gWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jp
bi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+ID4+PiBPbiAyMDI0LTAyLTA5IDEwOjU2IC0wNzAwLCBK
YW1lcyBIaWxsaWFyZCBzcGFrZSB0aHVzbHk6Cj4gPj4+PiBBZGQgcGF0Y2hlcyBmcm9tIHBlbmRp
bmcgdXBzdHJlYW0gcHVsbCByZXF1ZXN0IHdoaWNoIGFkZCBjeXRob24zCj4gPj4+PiBjb21wYXRp
YmlsaXR5Lgo+ID4+PiBXZSBhcmUgYSBsaXR0bGUgYml0IGNhdXRpb3VzIGF0IGFwcGx5aW5nIHJh
bmRvbSBwYXRjaGVzIHRoYXQgaGF2ZSBub3QKPiA+Pj4geWV0IGJlZW4gYXQgbGVhc3QgcmV2aWV3
ZCBieSB1cHN0cmVhbS4gSW4gdGhpcyBjYXNlLCB0aGVyZSBoYXMgbm90IGJlZW4KPiA+Pj4gYW55
IHVwc3RyZWFtIGFjdGl2aXR5IHNpbmNlIHRoZSBsYXN0IHJlbGVhc2UsIGFuZCBub3QgbXVjIGJl
Zm9yZSB0aGF0Cj4gPj4+IGVpdGhlci4uLgo+ID4+IFdlbGwgdGhlc2UgcGF0Y2hlcyBhcmUgYmVp
bmcgdXNlZCBieSBnZW50b28gc28gdGhleSBhcmUgbm90IGVudGlyZWx5Cj4gPj4gdW50ZXN0ZWQg
aW4gdGhlIHJlYWwgd29ybGQuCj4gPgo+ID4gSXQncyBub3QgdGhhdCB0aGV5IGFyZSB0ZXN0ZWQg
b3Igbm90LiBJdCBpcyBhYm91dCB3aGV0aGVyIHRoZXknbGwgaGF2ZSBhCj4gPiBjaGFuY2UgdG8g
YmUgYWNjZXB0ZWQgdXBzdHJlYW0sIG9yIHdoZXRoZXIgd2UnbGwgaGF2ZSB0byBjYXJyeSBhbmQK
PiA+IG1haW50YWluIHRoZW0gZm9yZXZlciBpbiBCdWlsZHJvb3QuCj4gPgo+ID4gTWF5YmUgaXQn
cyB0aW1lIHRoYXQgc29tZW9uZSBwaW5ncyB1cHN0cmVhbSBhYm91dCB0aGF0IFBSPwoKT2ssIEkg
cGluZ2VkIG9uZSBvZiB0aGUgbWFpbnRhaW5lcnM6Cmh0dHBzOi8vZ2l0aHViLmNvbS9NYWdpY1N0
YWNrL3V2bG9vcC9wdWxsLzU4NyNpc3N1ZWNvbW1lbnQtMTkzNzg5NjYxNgoKPiA+Cj4gPj4+IFdl
IGhhdmUgbm8gaW4tdHJlZSB1c2VyIG9mIHV2bG9vcCwgc28gSSB3b25kZXIgd2hldGhlciBpdCBt
YWtlcyBzbnNlIHRvCj4gPj4+IGtlZXAgaXQsIGVzcGNpYWxseSBzaW5jZSBpdCBtYXUgYmUgYmxv
Y2tpbmcgdGhlIGJ1bXBzIG9mIG90aGVyIHBhY2thZ2VzCj4gPj4+IChsaWtlIGN5dGhvbiAzLngg
YmVpbmcgcmVxdWlyZWQgYnkgd2hhdHMtaXRzLW5hbWUpLgo+ID4+IFRoYXQncyBub3QgZW50aXJl
bHkgdHJ1ZSwgaXQncyBhIGNvbW1vbiBvcHRpb25hbCBkZXBlbmRlbmN5IGZvciBwYWNrYWdlcwo+
ID4+IGxpa2UgcHl0aG9uLXV2aWNvcm4gZm9yIGV4YW1wbGUuCj4gPgo+ID4gICAgICAkIGdpdCBn
cmVwIC1pIC1FIHB5dGhvbi51dmxvb3AKPiA+Cj4gPiB3b3VsZCB0dXJuIG9ubHkgcHl0aG9uLXV2
bG9vcCBpdHNlbGYsIGFuZCBpdHMgcnVudGltZSB0ZXN0LiBJZiBpdAo+ID4gaXMgb25seSBvcHRp
b25hbCwgYW5kIHByZXZlbnRzIHVzIGZyb20gdXBkYXRpbmcgdW5sZXNzIHdlIGFwcGx5Cj4gPiBu
b24tdXBzdHJlYW1hYmxlIHBhdGNoZXMsIHRoZW4gSSdkIGFyZ3VlIHdlIHNob3VsZCBkcm9wIGl0
Lgo+Cj4gSXQncyBhbiBvcHRpb25hbCBkZXBlbmRlbmN5LCBidXQgYSByZWNvbW1lbmRlZCBvbmUs
IHNlZSB0aGUgaW5zdGFsbAo+IGluc3RydWN0aW9ucyBmb3IgdXZpdm9ybjoKPiBodHRwczovL2dp
dGh1Yi5jb20vZW5jb2RlL3V2aWNvcm4/dGFiPXJlYWRtZS1vdi1maWxlI3F1aWNrc3RhcnQKPgo+
IEl0J3MgYSBmYXN0ZXIgZHJvcC1pbiByZXBsYWNlbWVudCBmb3IgdGhlIHB5dGhvbiBhc3luYyBl
dmVudCBsb29wLCBidXQKPiBvbmx5IGNvbXBhdGlibGUgd2l0aCBDUHl0aG9uLCBub3QgaS5lLiBw
eXB5LCBzbyB1c3VhbGx5IHByb2plY3RzIGRvbid0Cj4gZGVjbGFyZSBhIGhhcmQgZGVwZW5kZW5j
eSBvbiBpdC4KPgo+IEkgZm91bmQgYSBob3BlZnVsbHkgYmV0dGVyIHNvbHV0aW9uIHRvIG91ciBj
eXRob24gcHJvYmxlbXMgdGhvdWdoOiBzZWUKPiB0aGUgcHl0aG9uLW1zZ3BhY2sgdGhyZWFkLgo+
Cj4gSW4gc2hvcnQ6IGlmIHdlIGNvbnRpbnVlIHRvIHVzZSB0aGUgc2Rpc3RzIGZyb20gcHlwaSwg
Y3l0aG9uIGlzIG5vdCBhCj4gcmVhbCBidWlsZCBkZXBlbmRlbmN5IGFuZCB3ZSBjYW4ganVzdCBy
ZW1vdmUgaXQgZnJvbSBweXB0b2plY3QudG9tbAo+IGluc3RlYWQgb2YgdHJ5aW5nIHRvIHByb3Zp
ZGUgdGhlIGNvcnJlY3QgdmVyc2lvbiB0aGF0J3MgbmV2ZXIgZ29pbmcgdG8KPiBiZSBpbnZva2Vk
LgoKV2UgY2FuIHByb2JhYmx5IGp1c3QgcGFzcyAtLXNraXAtZGVwZW5kZW5jeS1jaGVjayBhcyBh
IGJ1aWxkIGFyZyBvcgpzb21ldGhpbmcgbGlrZSB0aGF0IEkgc3VwcG9zZS4KCj4KPiA+Cj4gPiBb
LS1TTklQLS1dCj4gPj4gSSdsbCBmaXggYW5kIHJlc2VuZC4KPiA+Cj4gPiBUaGFua3MuCj4gPgo+
ID4gUmVnYXJkcywKPiA+IFlhbm4gRS4gTU9SSU4uCj4gPgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
