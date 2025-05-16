Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C94C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 19:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5ED446069A;
	Fri, 16 May 2025 19:27:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DANj2Jg3ISrC; Fri, 16 May 2025 19:27:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87AF1608BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87AF1608BE;
	Fri, 16 May 2025 19:27:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 64B0E1F5
 for <buildroot@buildroot.org>; Fri, 16 May 2025 19:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AAA840257
 for <buildroot@buildroot.org>; Fri, 16 May 2025 19:27:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 61Ey4Jz_rrsy for <buildroot@buildroot.org>;
 Fri, 16 May 2025 19:27:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DF43D400AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF43D400AB
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DF43D400AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 19:27:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1FA52432C8;
 Fri, 16 May 2025 19:27:21 +0000 (UTC)
Date: Fri, 16 May 2025 21:27:21 +0200
To: =?UTF-8?B?xYF1a2Fzeg==?= Stelmach <l.stelmach@samsung.com>
Cc: buildroot@buildroot.org, Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <20250516212721.655c421e@windsurf>
In-Reply-To: <20250514190942.1481011-1-l.stelmach@samsung.com>
References: <CGME20250514191014eucas1p2285ef49df987aabbcfec5d5db83d4d29@eucas1p2.samsung.com>
 <20250514190942.1481011-1-l.stelmach@samsung.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudefheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheduteeufeekieevieegueegiefgvdevhefggfdutdeiuedvtdfgledvgeevleeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehlrdhsthgvlhhmrggthhesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepmhdrs
 hiihihprhhofihskhhisehsrghmshhunhhgrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747423642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2QK7B3fN3Ql/4LQ0AglnN7dJNeUGmo9h8ihNGzimb7M=;
 b=EG1+GdRLH/RLCAS2Q3l2mz2Dxz8LqykgrdvjSV6LflUEXrq2cr9ZwGejiA+MoMRVqw0dG1
 tiHlUyn3tBA3kq1dGeFPevPM9DME55+XcpK1A4F7NiKHI0gpll6MugcaATiyKr2p9nmbNt
 7ZkdbuaZPQcmIBSsDfGLCjc0nXosTyPxlIC5BkE668OeBS8n/OFmaY+SgJ7rBz0D8nvS1u
 D9Gnz9LEhXuiu6taaBjYeYHOKG6fUYAbv35IfFIpMmYXrK5f+OGnOUlTeN15f/6aYvUkVr
 Ncroul/SLVgLXvVoIjqyTFsZHFtG03SHWKbFwPdpVeefcPFARxv1EvGmX3As3g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EG1+GdRL
Subject: Re: [Buildroot] [PATCH] docs/manual: mention Config.in in
 LIBFOO_DEPENDENCIES
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gxYF1a2FzeiwKClRoYW5rcyBmb3IgeW91ciBjb250cmlidXRpb24hCgpPbiBXZWQsIDE0
IE1heSAyMDI1IDIxOjA5OjQyICswMjAwCsWBdWthc3ogU3RlbG1hY2ggPGwuc3RlbG1hY2hAc2Ft
c3VuZy5jb20+IHdyb3RlOgoKPiBNZW50aW9uIHRoZSBuZWVkIGZvciBhIHBhcmFsbGVsIGRlcGVu
ZGVuY3kgc3BlY2lmaWNhdGlvbgo+IGluIGJvdGggKl9ERVBFTkRFTkNJRVMgdmFyaWFibGVzIGlu
IC5tayBmaWxlcyBhcyB3ZWxsIGFzCj4gaW4gQ29uZmlnLmluIGZpbGVzIHVzaW5nIHNlbGVjdCBh
bmQvb3IgZGVwZW5kcyBvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiDFgXVrYXN6IFN0ZWxtYWNoIDxs
LnN0ZWxtYWNoQHNhbXN1bmcuY29tPgo+IC0tLQo+ICBkb2NzL21hbnVhbC9hZGRpbmctcGFja2Fn
ZXMtZ2VuZXJpYy5hZG9jIHwgNSArKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gSSBhbSBub3Qgc3VyZSB0aGlzIGlzIGFjdHVhbGx5IHRy
dWUsIGJ1dCBpZiBpdCBpcywgSSBmaWd1cmUgaXQgd29ydGgKPiBtZW50aW9uaW5nLgoKVW5mb3J0
dW5hdGVseSwgdGhlIHJlYWxpdHkgaXMgbW9yZSBjb21wbGljYXRlZCB0aGFuIHRoYXQ6CgotIEZv
ciBob3N0IHBhY2thZ2VzLCBoYXZpbmcgYSBwYWNrYWdlIGluIEhPU1RfTElCRk9PX0RFUEVOREVO
Q0lFUyBkb2VzCiAgKk5PVCogcmVxdWlyZSBoYXZpbmcgYSBzZWxlY3Qgb3IgZGVwZW5kcyBvbiBm
b3IgdGhpcyBkZXBlbmRlbmN5LgogIEluZGVlZCwgbW9zdCBob3N0IHBhY2thZ2VzIGRvbid0IGV2
ZW4gaGF2ZSBhIENvbmZpZy5pbi5ob3N0IG9wdGlvbi4KCi0gRm9yIHRhcmdldCBwYWNrYWdlcywg
aGF2aW5nIGEgInNlbGVjdCBCQVIiIGRvZXMgbm90IG5lY2Vzc2FyaWx5IGltcGx5CiAgdGhhdCAi
YmFyIiBtdXN0IGJlIGluIExJQkZPT19ERVBFTkRFTkNJRVMuIEluZGVlZCwgcGVyaGFwcyAiYmFy
IiBpcwogIG9ubHkgYSBydW50aW1lIGRlcGVuZGVuY3kgb2YgbGliZm9vLgoKVGhlcmVmb3JlLCB0
aGUgc3RvcnkgaXMgbW9yZSBjb21wbGljYXRlZCB0aGFuIHRoZSB1cGRhdGUgeW91J3JlCnByb3Bv
c2luZyBmb3IgdGhlIGRvY3VtZW50YXRpb24uCgo+IGRpZmYgLS1naXQgYS9kb2NzL21hbnVhbC9h
ZGRpbmctcGFja2FnZXMtZ2VuZXJpYy5hZG9jIGIvZG9jcy9tYW51YWwvYWRkaW5nLXBhY2thZ2Vz
LWdlbmVyaWMuYWRvYwo+IGluZGV4IGYwYjA1MDhmNTMuLjliOTEzNTExMzggMTAwNjQ0Cj4gLS0t
IGEvZG9jcy9tYW51YWwvYWRkaW5nLXBhY2thZ2VzLWdlbmVyaWMuYWRvYwo+ICsrKyBiL2RvY3Mv
bWFudWFsL2FkZGluZy1wYWNrYWdlcy1nZW5lcmljLmFkb2MKPiBAQCAtMzcxLDcgKzM3MSwxMCBA
QCBub3QgYW5kIGNhbiBub3Qgd29yayBhcyBwZW9wbGUgd291bGQgZXhwZWN0IGl0IHNob3VsZDoK
PiAgICBIb3dldmVyLCBtb2RpZmljYXRpb25zIHRvIGNvbmZpZ3VyYXRpb24gb2YgdGhlc2UgZGVw
ZW5kZW5jaWVzIHdpbGwKPiAgICBub3QgZm9yY2UgYSByZWJ1aWxkIG9mIHRoZSBjdXJyZW50IHBh
Y2thZ2UuIEluIGEgc2ltaWxhciB3YXksCj4gICAgK0hPU1RfTElCRk9PX0RFUEVOREVOQ0lFUysg
bGlzdHMgdGhlIGRlcGVuZGVuY2llcyBmb3IgdGhlIGN1cnJlbnQKPiAtICBob3N0IHBhY2thZ2Uu
Cj4gKyAgaG9zdCBwYWNrYWdlLiBJbiBhbGwgY2FzZXMgKCtMSUJGT09fREVQRU5ERU5DSUVTKywK
PiArICArSE9TVF9MSUJGT09fREVQRU5ERU5DSUVTKyBhcyB3ZWxsIGFzIHRoZSB2YXJpYWJsZXMg
YmVsb3cpIHRoZQo+ICsgIGRlcGVuZGVuY2llcyBuZWVkIHRvIGJlIHNwZWNpZmllZCBpbiBwYXJh
bGxlbCB3aXRoICtzZWxlY3QrIG9yCj4gKyAgK2RlcGVuZHMgb24rIGluIHRoZSArQ29uZmlnLmlu
KyBmaWxlLgoKUGVyaGFwczoKCiJOb3RlIHRoYXQgZm9yIHRhcmdldCBwYWNrYWdlcywgYWxsIHBh
Y2thZ2VzIGxpc3RlZCBpbgorTElCRk9PX0RFUEVOREVOQ0lFUysgbXVzdCBiZSBlbmFibGVkIGZy
b20gYSBDb25maWcuaW4gcG9pbnQgaW4gdmlldywKZWl0aGVyIHVzaW5nICtzZWxlY3QrIG9yICtk
ZXBlbmRzIG9uKyBkZXBlbmRlbmNpZXMiIG9yIHNvbWV0aGluZyBsaWtlIHRoaXM/CgpUaG9tYXMK
LS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQg
TGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGlu
LmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
