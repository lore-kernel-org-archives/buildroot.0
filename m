Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7281C3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82043414BB;
	Fri,  2 May 2025 10:47:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ToxrVaPdXzK0; Fri,  2 May 2025 10:47:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A440E4145D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A440E4145D;
	Fri,  2 May 2025 10:47:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C7408EE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD06E81398
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:47:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W1KWALYjD_kj for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:47:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C02F281373
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C02F281373
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C02F281373
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:47:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BD0E81C0D89; Fri,  2 May 2025 12:47:38 +0200 (CEST)
Message-ID: <60210f5c-4197-473d-a2de-a8d6055850cc@rnout.be>
Date: Fri, 2 May 2025 12:47:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ian Merin <Ian.Merin@entrust.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "angelo.compagnucci@gmail.com" <angelo.compagnucci@gmail.com>
References: <BN7PR11MB2788A512245CC5396C83CD8CFFB52@BN7PR11MB2788.namprd11.prod.outlook.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <BN7PR11MB2788A512245CC5396C83CD8CFFB52@BN7PR11MB2788.namprd11.prod.outlook.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746182858; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=8NUhb0BqkAz6G3wMEg2S9V0fjcD7i3wxpjfkPwVfcqM=;
 b=XDKPkR3flk2+9dhzwqh6yjiLW627V+kdV6EHhKE9S9dnMflNg0ry7J00AYZo9XstY5xN62
 NZXd0D9wW2U/L7UdBzVhTSPCamCurZOkDsX+AWtlz8iPzhe62ViCq9f4dIT8erHac+ETZK
 kKUZtv38hJQjuZWEJ0Xeg9i6jbizULq2h/RZVqKYfSJ4mGmzeoYc4kkEfv5eZgy2HlO4gW
 bRBl/HsyIlCB+A1mYUW23dCLyL4bv5YukqG0Je5hsf9bg/Fgqfa7WFjeXfcL+LIaTMs79b
 x9hOuZA8q5cLKHL1K+D8cCsnT6q29b+5t2E2wvRF7D7qMnmLMOllCk44lVM43w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=XDKPkR3f
Subject: Re: [Buildroot] [PATCH] package/apparmor don't reference
 libapparmor variables
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwOC8wNC8yMDI1IDE5OjQ3LCBJYW4gTWVyaW4gdmlhIGJ1aWxkcm9vdCB3cm90ZToKPiBT
aWduZWQtb2ZmLWJ5OiBJYW4gTWVyaW4gPElhbi5NZXJpbkBuY2lwaGVyLmNvbT4KCiAgQXBwbGll
ZCB0byAyMDI1LjAyLngsIHRoYW5rcy4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gCj4gLS0tCj4g
Cj4gIMKgcGFja2FnZS9hcHBhcm1vci9hcHBhcm1vci5tayB8IDYgKysrLS0tCj4gCj4gIMKgMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9hcHBhcm1vci9hcHBhcm1vci5tayBiL3BhY2thZ2UvYXBwYXJtb3IvYXBw
YXJtb3IubWsKPiAKPiBpbmRleCA2MWU2MmM3NTE1Li4yMGRiY2U2Zjk3IDEwMDY0NAo+IAo+IC0t
LSBhL3BhY2thZ2UvYXBwYXJtb3IvYXBwYXJtb3IubWsKPiAKPiArKysgYi9wYWNrYWdlL2FwcGFy
bW9yL2FwcGFybW9yLm1rCj4gCj4gQEAgLTcsOSArNyw5IEBACj4gCj4gIMKgIyBXaGVuIHVwZGF0
aW5nIHRoZSB2ZXJzaW9uIGhlcmUsIHBsZWFzZSBhbHNvIHVwZGF0ZSB0aGUgbGliYXBwYXJtb3Ig
cGFja2FnZQo+IAo+ICDCoEFQUEFSTU9SX1ZFUlNJT05fTUFKT1IgPSAzLjEKPiAKPiAgwqBBUFBB
Uk1PUl9WRVJTSU9OID0gJChBUFBBUk1PUl9WRVJTSU9OX01BSk9SKS43Cj4gCj4gLUFQUEFSTU9S
X1NPVVJDRSA9IGFwcGFybW9yLXYkKExJQkFQUEFSTU9SX1ZFUlNJT04pLnRhci5nego+IAo+IC1B
UFBBUk1PUl9TSVRFID0gaHR0cHM6Ly9naXRsYWIuY29tL2FwcGFybW9yL2FwcGFybW9yLy0vYXJj
aGl2ZS8gCj4gdiQoTElCQVBQQVJNT1JfVkVSU0lPTikKPiAKPiAtQVBQQVJNT1JfRExfU1VCRElS
ID0gbGliYXBwYXJtb3IKPiAKPiArQVBQQVJNT1JfU09VUkNFID0gYXBwYXJtb3ItdiQoQVBQQVJN
T1JfVkVSU0lPTikudGFyLmd6Cj4gCj4gK0FQUEFSTU9SX1NJVEUgPSBodHRwczovL2dpdGxhYi5j
b20vYXBwYXJtb3IvYXBwYXJtb3IvLS9hcmNoaXZlL3YkKEFQUEFSTU9SX1ZFUlNJT04pCj4gCj4g
K0FQUEFSTU9SX0RMX1NVQkRJUiA9IGFwcGFybW9yCj4gCj4gIMKgQVBQQVJNT1JfTElDRU5TRSA9
IEdQTC0yLjAKPiAKPiAgwqBBUFBBUk1PUl9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRSBwYXJzZXIv
Q09QWUlORy5HUEwKPiAKPiBBUFBBUk1PUl9DUEVfSURfVkVORE9SID0gY2Fub25pY2FsCj4gCj4g
LS0gCj4gCj4gMi4yNS4xCj4gCj4gL0FueSBlbWFpbCBhbmQgZmlsZXMvYXR0YWNobWVudHMgdHJh
bnNtaXR0ZWQgd2l0aCBpdCBhcmUgaW50ZW5kZWQgc29sZWx5IGZvciB0aGUgCj4gdXNlIG9mIHRo
ZSBpbmRpdmlkdWFsIG9yIGVudGl0eSB0byB3aG9tIHRoZXkgYXJlIGFkZHJlc3NlZC4gSWYgdGhp
cyBtZXNzYWdlIGhhcyAKPiBiZWVuIHNlbnQgdG8geW91IGluIGVycm9yLCB5b3UgbXVzdCBub3Qg
Y29weSwgZGlzdHJpYnV0ZSBvciBkaXNjbG9zZSBvZiB0aGUgCj4gaW5mb3JtYXRpb24gaXQgY29u
dGFpbnMuIF9QbGVhc2Ugbm90aWZ5IEVudHJ1c3QgaW1tZWRpYXRlbHkgYW5kIGRlbGV0ZSB0aGUg
Cj4gbWVzc2FnZSBmcm9tIHlvdXIgc3lzdGVtLl8vCj4gCj4gCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4g
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
