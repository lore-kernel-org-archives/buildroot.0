Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25FCEED609
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 13:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 757B1407D3;
	Thu,  1 Jan 2026 13:27:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vSt1X5FazOq9; Thu,  1 Jan 2026 13:27:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A36140765
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767274065;
	bh=YKFO/lEzuouFFXSZJKGYCKb/lLt1RXfd16d6mNQ/ivo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KXmdNgbu0DoxYiU2DaTYB4whA6xqNNQ/6m9KY07bfmyBtpvU+wEnlNa5XC5lDd++o
	 llbtwwdD6+TdFML/qXDFM+wmN83SxbaSm+m0uhA2GzQyW4pxz5vbwOysqmhnjs40rh
	 bzrptz+rvbgrWbh5e6RBM+h5zCpSWcfg/ZgRXQa186anNA6ghrwjY+fOqAI6ikmX2O
	 yXBXBrmoIFtiDbIxmVtdF0fvf9MttpyLXzy7A0VAUkxqdTUrA7TJyDegD1r0J+OgEd
	 EHUw0jn3dIClfZwrcUBMgWlfioTDOyXu24kbTqu2fr9OSNAchdoxOV0avcfFM2vOCz
	 bxyIBCsT4Sauw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A36140765;
	Thu,  1 Jan 2026 13:27:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D20AA351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 13:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3E2560717
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 13:27:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FCVOM8i1liTS for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 13:27:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C5809606CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5809606CF
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C5809606CF
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 13:27:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 9C44E4E41ED8
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 13:27:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 52B74606B6
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 13:27:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 510FF113B029E; Thu,  1 Jan 2026 14:27:38 +0100 (CET)
Date: Thu, 1 Jan 2026 14:27:37 +0100
To: =?UTF-8?B?VGjDqW8=?= Lebrun via buildroot <buildroot@buildroot.org>
Cc: =?UTF-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Message-ID: <20260101142737.0c8644b4@windsurf>
In-Reply-To: <20251117-gitignore-brmake-log-v1-1-a77ec4bb1db2@bootlin.com>
References: <20251117-gitignore-brmake-log-v1-1-a77ec4bb1db2@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767274058; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Qg9AbzYXYAPwVGM1gTSXCgU+0ngNQQsGE86YmE9pDGI=;
 b=UD5zfPVzV7qzUhc/FWvdBBPvfZs5/NQm49G3ZuOZekF4rk6F1ul0pZ/YCk04C2h05pCs1w
 Kbx0tB71Przxu9qJMdB/AI0uDKJekisfmx7pYfg2Vczzp5TGG2vrmtBgWpB+k9e7T+uLdn
 NH4U8xKiqXzlfket0CInZPC3WenIWQZi3WBE855MnDzM7boFvO/o2XwE6Sk6h5VtbZBG+D
 K3FuII/vPqXTswYAkJoeqlTTzHztDQejEGx4CW4PXpu2+ugtVze1fmY9UMaQxVXQc1jgr1
 niicKvP98iFTzbqt1Au5W/xRYAGeR2qqX9airv9HmWluCkh4aP8v7et/vOlylA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=UD5zfPVz
Subject: Re: [Buildroot] [PATCH] gitignore: ignore utils/brmake log output
 named `br.log`
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

T24gTW9uLCAxNyBOb3YgMjAyNSAxODowNzo1MiArMDEwMApUaMOpbyBMZWJydW4gdmlhIGJ1aWxk
cm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgoKPiBUaGUgYHV0aWxzL2JybWFr
ZWAgdG9vbCBydW5zIGBtYWtlIGFsbGAgd2l0aCBsb2dzIHB1dCBpbnRvIGBici5sb2dgLgo+IFRo
YXQgZmlsZSBpcyB0aGVyZWZvcmUgdGhlIHJlc3VsdCBvZiBhIGJ1aWxkIGFuZCBjb21taXR0aW5n
IGl0IG5ldmVyCj4gbWFrZXMgc2Vuc2UsIG5laXRoZXIgdXBzdHJlYW0gbm9yIG9uIGFueSBvdGhl
ciByZW1vdGUvYnJhbmNoLgo+IAo+ICAgICDin6kgZ2l0IHN0YXR1cyAtLXNob3J0Cj4gICAgIOKf
qSBtYWtlIGJlYWdsZWJvbmVfZGVmY29uZmlnCj4gICAgIOKfqSAuL3V0aWxzL2JybWFrZQo+ICAg
ICDin6kgZ2l0IHN0YXR1cyAtLXNob3J0Cj4gICAgID8/IGJyLmxvZwo+IAo+IEFkZCBhIG5ldyBg
L2JyLmxvZ2AgZW50cnkgaW4gdGhlIHJvb3QgYC5naXRpZ25vcmVgIGZpbGUuCj4gQXBwZW5kIHRv
IHRoZSBlbmQgYmVjYXVzZSBubyBvcmRlcmluZyBsb2dpYyB3YXMgZm91bmQuCj4gCj4gU2lnbmVk
LW9mZi1ieTogVGjDqW8gTGVicnVuIDx0aGVvLmxlYnJ1bkBib290bGluLmNvbT4KPiAtLS0KPiAg
LmdpdGlnbm9yZSB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCkFwcGxp
ZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIENUTywg
Qm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9v
dGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
