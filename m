Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2A1C4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 20:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D919981551;
	Wed,  8 Nov 2023 20:55:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D919981551
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s0avVcvh6bN6; Wed,  8 Nov 2023 20:55:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28B81813F4;
	Wed,  8 Nov 2023 20:55:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28B81813F4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 34BA81BF282
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 20:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 015FF4194E
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 20:55:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 015FF4194E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nRDQh3miBAaP for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 20:55:41 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 743644192C
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 20:55:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 743644192C
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC53CE0003;
 Wed,  8 Nov 2023 20:55:37 +0000 (UTC)
Date: Wed, 8 Nov 2023 21:55:36 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231108215536.7a780fe2@windsurf>
In-Reply-To: <20231012103210.2915871-1-adam.duskett@amarulasolutions.com>
References: <20231012103210.2915871-1-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699476938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e9hl1BBrQuRboB8JiREDnaPiZb3IB00Llykv/kZzCfE=;
 b=W6VAZviZTULS6aQgsM0t/8Gpf6jW8dQtvokXFXACO3ilp4TjXBYmvXf9OmmCs1QpAFX2+3
 /QLemdIYZRoBsY2E5NjZvBkhrjqnilfEmF9/48/iSefbaCWfBFNplTAabioo6joGWxM948
 2laLgHUMNuXiVJ9velr6ThDeucgKcuxK0l70DyF6oCBdnRJNh/6VRjrn/u+K9wolWcatt4
 +R/rGj3B6V9coSmNcZRtMn67oXZp9AiAAxEhqdR1Zj0NbVXP9Qn91tigo1syPv+Hi6vBp1
 DQhrkBA3RDSgGxBBTL3ENAvaxKjLEZdRHNDd1YaCqL5YxhrkXaEfwcCP2njaKQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=W6VAZviZ
Subject: Re: [Buildroot] [PATCH 00/12] SELinux: Basic config enforcing mode
 support.
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Marek Belisko <marek.belisko@open-nandra.com>,
 Antoine Tenart <atenart@kernel.org>, Sen Hastings <sen@phobosdpl.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, buildroot@buildroot.org,
 Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQWRhbSwKCk9uIFRodSwgMTIgT2N0IDIwMjMgMTI6MzE6NTcgKzAyMDAKQWRhbSBEdXNr
ZXR0IDxhZGFtLmR1c2tldHRAYW1hcnVsYXNvbHV0aW9ucy5jb20+IHdyb3RlOgoKPiBTRUxpbnV4
IHN1cHBvcnQgaW4gQnVpbGRyb290IGlzIGN1cnJlbnRseSBvdXRzdGFuZGluZyEgSG93ZXZlciwg
b25lIGxhc3QgbWFqb3IKPiBpc3N1ZSByZW1haW5zOiBFbmZvcmNpbmcgbW9kZSBuZWVkcyB0byB3
b3JrIG91dCBvZiB0aGUgYm94IGNvcnJlY3RseSwgd2l0aG91dAo+IGRlbmlhbHMsIGF0IGxlYXN0
IHdpdGggYSBtaW5pbWFsIGRlZmNvbmZpZy4KPiAKPiBUaGlzIHBhdGNoIHNlcmllcyBzZWVrcyB0
byByZW1lZHkgdGhpcyBwcm9ibGVtIHdpdGggYSBiYXNpYyBzZXQgb2YgcG9saWNpZXMgaW4KPiBz
ZXZlcmFsIGNvbW1vbmx5IHNlbGVjdGVkIHBhY2thZ2VzIHRvIGFsbG93IGEgdXNlciB3aG8gd2lz
aGVzIHRvIHVzZSBTRUxpbnV4IGluCj4gZW5mb3JjaW5nIG1vZGUgdGhlIGFiaWxpdHkgdG8gZG8g
c28gd2l0aG91dCBoYXZpbmcgdG8gc3BlbmQgc2V2ZXJhbCBob3Vycwo+IHdyaXRpbmcgdGhlIHNh
bWUgcG9saWN5IHRoYXQgZXZlcnlvbmUgd2hvIHdpc2hlcyB0byBkbyB0aGUgc2FtZSB0aGluZyB3
b3VsZAo+IGhhdmUgdG8gZG8uCj4gCj4gVGhlIHBhY2thZ2VzIEkgaGF2ZSBzZWxlY3RlZCBhcmUg
YmFzZWQgb24gdGhlIHBjX3g4Nl82NF9iaW9zX2RlZmNvbmZpZyB3aXRoIGFsbAo+IG9mIHRoZSBz
ZWxpbnV4IHBhY2thZ2VzIHNlbGVjdGVkIGJlY2F1c2UgaXQgd2FzIHRoZSBtb3N0IHN0cmFpZ2h0
Zm9yd2FyZCBvcHRpb24KPiBJIGhhZCB0byBjcmVhdGUgYSBzbWFsbCwgYm9vdGFibGUgc3lzdGVt
IGluIFZpcnR1YWwgTWFuYWdlciB3aXRoIHNzaCBzdXBwb3J0IHRvCj4gcXVpY2tseSBidWlsZCBv
dXQgYSBwb2xpY3kgdGhhdCBkaWRuJ3QgZ2VuZXJhdGUgYW55IGRlbmlhbHMgaW4KPiAvdmFyL2xv
Zy9hdWRpdC5sb2cuCj4gCj4gSSB3YW50IHRvIGFkZHJlc3MgWWFubidzIHF1ZXN0aW9ucyBmcm9t
IGEgcHJldmlvdXMgZGlzY3Vzc2lvbiBvbiBJUkM6Cj4gICBRKSBXaGF0IHdpbGwgYmUgdGhlIG1h
aW50ZW5hbmNlIGVmZm9ydD8KPiAgIEEpIE1pbmltYWwgYWZ0ZXIgdGhpcyBwYXRjaCBzZXJpZXMu
IEFzIHlvdSB3aWxsIHNlZSwgbW9zdCBwb2xpY2llcyBhcmUgb25seSBhCj4gICAgICBmZXcgbGlu
ZXMgbG9uZyEKPiAKPiAgIFEpIEhvdyBtdWNoIHRpbWUgd2lsbCB3ZSBpbnZlc3Qgd2hlbiB3ZSBi
dW1wIGEgcGFja2FnZSBvciBhZGQgYSBkZXBlbmRlbmN5Pwo+ICAgQSkgVXN1YWxseSBub25lISBJ
ZiBhIHBhY2thZ2UgYnVtcC9uZXcgZGVwZW5kZW5jeSByZXF1aXJlcyBuZXcgcGVybWlzc2lvbnMg
dG8KPiAgICAgIHRoZSBTRUxpbnV4IHBvbGljeSwgdGhpcyBpcyBhIGdvb2QgdGhpbmchIFdlIHNo
b3VsZCBzdGVwIGJhY2sgYW5kIHF1ZXN0aW9uCj4gICAgICB3aHkgYSBwYWNrYWdlIHByZXZpb3Vz
bHkgYWNjZXNzaW5nIG9ubHkgZmlsZXMgYW5kIGxpYnJhcmllcyBzdWRkZW5seSBuZWVkcwo+ICAg
ICAgdG8gKGUuZy4pLCBjaGFuZ2UgcGVybWlzc2lvbnMgb24gYSAvZGV2LyBkZXZpY2UhCgpUaGFu
a3MgYSBsb3QgZm9yIHdvcmtpbmcgb24gdGhpcy4KCkhvd2V2ZXIsIEknZCBsaWtlIHRvIHVuZGVy
c3RhbmQgd2h5IHRoZXNlIHBvbGljeSBmaWxlcyBuZWVkIHRvIGJlIGluCkJ1aWxkcm9vdC4gRm9y
IGV4YW1wbGUsIHlvdSdyZSBhZGRpbmcgc29tZSBwb2xpY3kgZm9yIE9wZW5TU0guIEJ1dApCdWls
ZHJvb3QganVzdCBidWlsZHMgdXBzdHJlYW0gT3BlblNTSCB3aXRoIG5vIGNoYW5nZS4gV2h5IGRv
IHdlIG5lZWQKc29tZSBwb2xpY3kgc3BlY2lmaWNhbGx5IGluIEJ1aWxkcm9vdCBmb3IgT3BlblNT
SCB0aGF0IGNhbm5vdCBiZSBpbgp1cHN0cmVhbSByZWZwb2xpY3k/CgpCYWNrIHdoZW4gQW50b2lu
ZSBUw6luYXJ0ICh3aGljaCB5b3UgaGF2ZSBpbiBDYykgd2FzIHdvcmtpbmcgb24gdGhpcywKYW5k
IGFsc28gbXkgY29sbGVhZ3VlIE1heGltZSBDaGV2YWxsaWVyICh3aGljaCBJIGhhdmUgYWRkZWQg
aW4gQ2MpLAp0aGVpciBwbGFuIHdhcyB0byBtYWtlIGl0IHBvc3NpYmxlIHRvIHVzZSB0aGUgdXBz
dHJlYW0gcmVmcG9saWN5IGZvciBhCkJ1aWxkcm9vdCBzeXN0ZW0sIGJ5IGNvbnRyaWJ1dGluZyBj
aGFuZ2VzIHRvIHRoZSByZWZwb2xpY3kgKGFuZCB0aGV5CmNvbnRyaWJ1dGVkIHF1aXRlIGEgZmV3
KS4KCldoeSBhcmUgd2Ugbm90IGNvbnRpbnVpbmcgb24gdGhpcyBhcHByb2FjaD8KCk9yIGlzIHlv
dXIgcG9saWN5IGEgImZyb20gc2NyYXRjaCIgcG9saWN5IHRoYXQgY2FuIGJlIHVzZWQgYXMgYQpj
b21wbGV0ZSBhbHRlcm5hdGl2ZSB0byB0aGUgdXBzdHJlYW0gcmVmcG9saWN5PwoKKE5vdGU6IHdl
IHdpbGwgY2xlYXJseSB3YW50IGEgcnVudGltZSB0ZXN0IGNhc2UgZm9yIHRoaXMuKQoKQmVzdCBy
ZWdhcmRzLAoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBC
b290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5n
Cmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
