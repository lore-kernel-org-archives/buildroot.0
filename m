Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255BCC27C44
	for <buildroot@archiver.kernel.org>; Tue, 28 May 2024 13:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2B9980EB5;
	Tue, 28 May 2024 13:45:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1TGt3lL7eIpT; Tue, 28 May 2024 13:45:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED8B680F4C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED8B680F4C;
	Tue, 28 May 2024 13:45:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 32FF91D2868
 for <buildroot@lists.busybox.net>; Tue, 28 May 2024 13:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C51360784
 for <buildroot@lists.busybox.net>; Tue, 28 May 2024 13:45:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id neHf17lWaRrq for <buildroot@lists.busybox.net>;
 Tue, 28 May 2024 13:45:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D094F605B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D094F605B5
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D094F605B5
 for <buildroot@buildroot.org>; Tue, 28 May 2024 13:45:24 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id D8B2F440782;
 Tue, 28 May 2024 16:44:50 +0300 (IDT)
To: James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <CADvTj4riLO-shACg9LLMgPqorKU9CkH088T8b-cddTcZf_av7Q@mail.gmail.com>
 (James Hilliard's message of "Tue, 28 May 2024 07:33:26 -0600")
References: <20240528132218.2307479-1-james.hilliard1@gmail.com>
 <875xuy9i77.fsf@tarshish>
 <CADvTj4riLO-shACg9LLMgPqorKU9CkH088T8b-cddTcZf_av7Q@mail.gmail.com>
User-Agent: mu4e 1.12.4; emacs 29.3
Date: Tue, 28 May 2024 16:45:21 +0300
Message-ID: <871q5m9hji.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1716903890;
 bh=kvSdl8jlSKAKoJkKGIowO6pPk5BupuQiDlaAhQcG7I8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=QF6BH7cBBZfHkavUaEtPfK5mbQE7EMacJP12BOCs0z9TKnLZBGdB7AQhU4I5IOmw4
 bDCsJdzpb2EmRqmEBuwU/pCptlw4+O/ya3M+ych2SDqMCJYx7TRGcTojHrBNtY/o9J
 3V1WYApiRwP4ezT0dj7MkzcIKm2QC9CLV6PKpFvSBOGrX8fOwpFUqvbL3HIg/dbWI8
 WvPNnxngCDRG7XtNsh5iKi8EMEnW4HsYjqnJ3zbwh1L+P3RtdNxKkb/r10zp7OK/m4
 oMMnPQM9DazrHDszQAQvxSyQQa5HGtZIDE0gIx3oSVlxrkT7R14mBtj9PSJkAMAHB5
 JXFUAq8Wd4LMA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=QF6BH7cB
Subject: Re: [Buildroot] [PATCH v2 1/1] utils/genrandconfig: switch to
 async/await format
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFtZXMsCgpPbiBUdWUsIE1heSAyOCAyMDI0LCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiBP
biBUdWUsIE1heSAyOCwgMjAyNCBhdCA3OjMx4oCvQU0gQmFydWNoIFNpYWNoIDxiYXJ1Y2hAdGtv
cy5jby5pbD4gd3JvdGU6Cj4+IE9uIFR1ZSwgTWF5IDI4IDIwMjQsIEphbWVzIEhpbGxpYXJkIHdy
b3RlOgo+PiA+IFRoaXMgcmVxdWlyZXMgcHl0aG9uIDMuNSBvciBuZXdlciBidXQgaXMgYSBiaXQg
Y2xlYW5lciB0aGFuIHRoZQo+PiA+IHByZXZpb3VzIGNvcm91dGluZSBtZXRob2QuCj4+Cj4+IFRo
aXMgcmVxdWlyZXMgYW4gdXBkYXRlIG9mIEJSMl9QWVRIT04zX1ZFUlNJT05fTUlOIGluCj4+IHN1
cHBvcnQvZGVwZW5kZW5jaWVzL2NoZWNrLWhvc3QtcHl0aG9uMy5tay4KPgo+IEkgZG9uJ3QgdGhp
bmsgdGhpcyBzY3JpcHQgdXNlcyBob3N0LXB5dGhvbjMgYXQgYWxsLCBpdCdzIG1vc3RseSB1c2Vk
IGZvcgo+IGF1dG9idWlsZGVycyB3aGljaCBhbHdheXMgdXNlIHRoZSBzeXN0ZW0gcHl0aG9uIHJp
Z2h0PwoKUmlnaHQuIE5vdGhpbmcgaW4gQnVpbGRyb290IHJlZmVyZW5jZXMgdGhlIGdlbnJhbmRj
b25maWcgc2NyaXB0LgoKU29ycnkgZm9yIHRoZSBub2lzZSwKYmFydWNoCgotLSAKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB+LiAufiAgIFRrIE9w
ZW4gU3lzdGVtcwo9fS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLW9vTy0tVS0tT29vLS0tLS0tLS0tLS0tez0KICAgLSBiYXJ1Y2hAdGtvcy5jby5pbCAtIHRl
bDogKzk3Mi41Mi4zNjguNDY1NiwgaHR0cDovL3d3dy50a29zLmNvLmlsIC0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
