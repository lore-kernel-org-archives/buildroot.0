Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B34EC61DBD
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 16:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8575060879;
	Fri, 28 Aug 2026 16:47:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vb5pMWDK66hO; Fri, 28 Aug 2026 16:47:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787935629;
	bh=wbUaGHt69b/quSNDPvjEU/xF39VMpA3JZ5dUB2jwrqQ=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=at0dYQ29HdyLeYWynaEqbpgl0XSRxyPqtopEWgo1AQP6kIyFMvVwSB7bj+XM85bvo
	 CLtHv/pmZyYyM/NmKfSEMsB5V3vV2KEEoPIS0sCXA6piWlRoBW8pk7bHp27ANN5UrV
	 WX9bHFEXYYs4GNOcxE5bxME2B7EbFXRxs4ksaU3QhOz27fwFFTRoRkkR3oUnI3ZMtG
	 cwYmz6OwxB7FaPPJRq9KPppQABKUQ0rRBRHewtrwuf6xmotEJtlMHNgIAnr0gWrZqP
	 sZXOi+xZyc8NPtw9ioy/AAuCG1pMa1qL1VaS+tUvt2K0gYUIYyHhj1By50FJAxM6+Y
	 /8Wmay391BvBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6553860826;
	Fri, 28 Aug 2026 16:47:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 94AF5334
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 16:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8674D401A0
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 16:47:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u8GT5bdHr47l for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 16:47:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=theo.lebrun@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F8214016F
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 16:47:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 4719D4E41408;
 Fri, 28 Aug 2026 16:47:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 145EF60537;
 Fri, 28 Aug 2026 16:47:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 74DAA11C78230; 
 Fri, 28 Aug 2026 18:46:56 +0200 (CEST)
Date: Fri, 28 Aug 2026 18:46:46 +0200
Message-Id: <20260828-xdp-tools-tleb-v1-0-463c25b5a99b@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHa7kWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCyML3YqUAt2S/PycYt2SnNQkXQNTk2STZAsgTktSAmoqKEpNy6wAGxg
 dC+EXlyZlpSaXgExRqq0FAJp5Um5yAAAA
X-Change-ID: 20260828-xdp-tools-tleb-054c4c8c4cfb
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>, Daniel Lang <dalang@gmx.at>, 
 Joseph Kogut <joseph.kogut@gmail.com>, 
 Romain Naour <romain.naour@gmail.com>, 
 Valentin Korenblit <valentinkorenblit@gmail.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Jimmy Wesolowski <Jimmy.Wesolowski@mobileye.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.15-dev
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 0/4] Add xdp-tools package
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
From: =?utf-8?q?Th=C3=A9o_Lebrun_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBpcyBhIG5ldyB0YWtlIG9uIHRoZSBzZXJpZXMgYWRkaW5nIGFuIHhkcC10b29scyBwYWNr
YWdlIGJ5IEppbW15CkRXIFswXS4gSGVyZSB3ZSBzdGljayB0byBob3N0LWxsdm0gZm9yIGNvbXBp
bGluZyBCUEYgcHJvZ3JhbXMgaW5zdGVhZApvZiBob3N0LWdjYy4KClNlZSB0aGlzIHNlcmllcyBh
cyBhICJldmVyeXRoaW5nIHRoYXQgbmVlZHMgdG8gYmUgZG9uZSB0byBnZXQgd29ya2luZwp4ZHAt
dG9vbHMgb24gYSBNSVBTIEV5ZVEgcGxhdGZvcm0iLgoKIC0gRmlyc3QgcGF0Y2ggaXMgYSBmaXgg
aW4gYnBmdG9vbC4gSSBoZXNpdGF0ZWQgc2VuZGluZyBpdCBzZXBhcmF0ZWx5LgoKIC0gU2Vjb25k
IHBhdGNoIGlzIGFib3V0IGFsbG93aW5nIGJwZnRvb2wgdG8gYmUgYnVpbHQgb24gTUlQUy4gSXQg
d2FzCiAgIHByb2JhYmx5IHJlc3RyYWluZWQgb3V0IG9mIHByZWNhdXRpb24uIEkgY2FuIHRlc3Rp
ZnkgdGhhdCBpdCB3b3Jrcy4KCiAtIFRoaXJkIHBhdGNoIGlzIGFib3V0IGFkZGluZyBhIGNvbmZp
ZyBlbnRyeSB0byBob3N0LWxsdm0gZm9yIHdoZW4gaXQKICAgc2hvdWxkIGJ1aWxkIHRoZSBCUEYg
YmFja2VuZC4gQ3VycmVudGx5LCBCUjJfUEFDS0FHRV9MTFZNX0JQRj15CiAgIGltcGxpZXMgaG9z
dC1sbHZtIGhhcyB0aGUgQlBGIGJhY2tlbmQ7IHRoaXMgYmVoYXZpb3IgaXMgb2RkLgoKICAgSW5z
dGVhZCB3ZSBhZGQgYW4gb3B0aW9uIHRoYXQgcGFja2FnZXMgbmVlZGluZyBhIEJQRiBjb21waWxl
ciBzaG91bGQKICAgZW5hYmxlLiBOb3RlIHRoYXQgd2Ugc3VwcG9ydCBidWlsZGluZyBob3N0LWxs
dm0gd2l0aCBCUEYgYXMgdGhlIHNvbGUKICAgdGFyZ2V0LgoKIC0gRmluYWxseSB3ZSBhZGQgdGhl
IHhkcC10b29scyBwYWNrYWdlLiBJdCBjb21lcyB3aXRoIHR3byBvcHRpb25zOiBvbmUKICAgZm9y
IHRoZSBwYWNrYWdlLCBvbmUgZm9yIGJ1aWxkaW5nICYgaW5zdGFsbGluZyB0aGUgdGVzdHMuIFdl
IG5lZWQKICAgdGhyZWUgcGF0Y2hlcyBvbiB0b3Agb2YgdXBzdHJlYW0uCgpBYm91dCB0aG9zZSB4
ZHAtdG9vbHMgcGF0Y2hlcywgdGhleSdsbCBoYXZlIHRvIGJlIHNlbnQgdXBzdHJlYW0uIEknbGwK
YWxzbyBzZW5kIGFuIHVwc3RyZWFtIHBhdGNoIHRvIHNpbXBsaWZ5IGRpc2FibGluZyB0ZXN0czsg
d2UgbWFuYWdlIHRvCmRpc2FibGUgdGhlbSB3aXRob3V0IGEgcGF0Y2ggYnV0IGl0J3MgYSB3b3Jr
YXJvdW5kLiBJIHdhbnRlZCBmZWVkYmFjawpvbiB0aGUgc2VyaWVzIGFuZCB0aGUgZGlyZWN0aW9u
IGl0IGlzIGhlYWRpbmcuCgpUaGFua3MhClRow6lvCgpbMF06IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2J1aWxkcm9vdC9EQjlQUjA5TUI0OTg3NjNCNkZBNUE3MjIxM0NFQUYyQTZGNjlBQUBEQjlQ
UjA5TUI0OTg3LmV1cnByZDA5LnByb2Qub3V0bG9vay5jb20vCgpTaWduZWQtb2ZmLWJ5OiBUaMOp
byBMZWJydW4gPHRoZW8ubGVicnVuQGJvb3RsaW4uY29tPgotLS0KVGjDqW8gTGVicnVuICg0KToK
ICAgICAgcGFja2FnZS9icGZ0b29sOiBkaXNhYmxlIGZlYXR1cmUgYXV0by1kZXRlY3Rpb24gZm9y
IGhvc3QgYnVpbGQKICAgICAgcGFja2FnZS9icGZ0b29sOiBhbGxvdyBidWlsZGluZyBvbiBNSVBT
IGFyY2hpdGVjdHVyZQogICAgICBwYWNrYWdlL2xsdm06IGFkZCBvcHRpb24gdG8gYnVpbGQgdGhl
IEJQRiBiYWNrZW5kIGluIGhvc3QtbGx2bQogICAgICBwYWNrYWdlL3hkcC10b29sczogbmV3IHBh
Y2thZ2UKCiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAgMyArCiBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgMSArCiBwYWNrYWdlL0NvbmZpZy5pbi5ob3N0ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgMSArCiBwYWNrYWdlL2JwZnRvb2wvQ29uZmlnLmluICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgMSArCiBwYWNrYWdlL2JwZnRvb2wvYnBmdG9vbC5tayAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgNSArLQogcGFja2FnZS9sbHZtLXByb2plY3QvbGx2bS9Db25maWcu
aW4uaG9zdCAgICAgICAgICAgfCAgMTAgKysKIHBhY2thZ2UvbGx2bS1wcm9qZWN0L2xsdm0vbGx2
bS5tayAgICAgICAgICAgICAgICAgIHwgIDEyICsrLQogLi4uLzAwMDEtbGliLWJ1aWxkLUJQRi1v
YmplY3RzLWZyZWVzdGFuZGluZy5wYXRjaCAgfCAxMTYgKysrKysrKysrKysrKysrKysrKysrCiAu
Li4vMDAwMi1saWItdGVzdGluZy1zdXBwb3J0LWJ1c3lib3gtbWt0ZW1wLnBhdGNoICB8ICA2NCAr
KysrKysrKysrKysKIHBhY2thZ2UveGRwLXRvb2xzL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDU1ICsrKysrKysrKysKIC4uLmQtQlBGLW9iamVjdHMtd2l0aC1hc3NlbWJsZXIt
cmF0aGVyLXRoYW4tLnBhdGNoIHwgIDU5ICsrKysrKysrKysrCiBwYWNrYWdlL3hkcC10b29scy9u
by10ZXN0cy9NYWtlZmlsZSAgICAgICAgICAgICAgICB8ICAgMyArCiBwYWNrYWdlL3hkcC10b29s
cy94ZHAtdG9vbHMuaGFzaCAgICAgICAgICAgICAgICAgICB8ICAgOCArKwogcGFja2FnZS94ZHAt
dG9vbHMveGRwLXRvb2xzLm1rICAgICAgICAgICAgICAgICAgICAgfCAgNzkgKysrKysrKysrKysr
KysKIDE0IGZpbGVzIGNoYW5nZWQsIDQxNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQot
LS0KYmFzZS1jb21taXQ6IGUzMTNhMmQyNTkwYWY2ODllYjFmNzllNTViNWE0ODgxNTQ0MDBkYTEK
Y2hhbmdlLWlkOiAyMDI2MDgyOC14ZHAtdG9vbHMtdGxlYi0wNTRjNGM4YzRjZmIKCkJlc3QgcmVn
YXJkcywKLS0gIApUaMOpbyBMZWJydW4gPHRoZW8ubGVicnVuQGJvb3RsaW4uY29tPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
