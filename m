Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D4CCD98F0
	for <buildroot@archiver.kernel.org>; Sun, 21 Jun 2026 10:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 652494F01A;
	Sun, 21 Jun 2026 10:36:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 74BO2kcJQxlK; Sun, 21 Jun 2026 10:36:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66F7242ECE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782038216;
	bh=LsKCk/w6lJiygA2KMR/wfevCyfkl1wUCVatjtkXBppw=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jRTTphRq8H4MpblmB8yv2RZaytQDRCIEbJuJEdar2gZrzFY6qo0hB6Vpxuqi0U5DS
	 shMbnzHUJKSG6PnT+381f9QoVKe0RuvN42qKsb0rTcghEt0fv1u7Vd8Y117lHfz11W
	 RR72netl52MYrWz6Ente3jvKq3sobg3D0EpWG9lmB1hdc40ztwiW/S9yiAo9wk0u1B
	 zvPHLI70pAGhMKjcBAGnf1LuLl5WsVq8CkPnFKUYRQHic53BL5tgBGrlNeDb6nIo7a
	 o8uTcvRgKacmHY5egzbeShFYH1B0Xb9WRfVx2wt/POIAxbEsqT3lLN85NrqjtD4fF9
	 9Jxx6jD95Rejg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66F7242ECE;
	Sun, 21 Jun 2026 10:36:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B7BC24D
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 10:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16E0842ECE
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 10:36:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HzAs9xtXnDiw for <buildroot@buildroot.org>;
 Sun, 21 Jun 2026 10:36:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4BAC342C07
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BAC342C07
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4BAC342C07
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 10:36:52 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1963950893; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 21 Jun 2026 10:36:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wbFXl-0000000E0Ot-3nmU;
 Sun, 21 Jun 2026 12:36:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <20260619090027.3145553-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 19 Jun 2026 11:00:26 +0200")
References: <20260619090027.3145553-1-peter@korsgaard.com>
Date: Sun, 21 Jun 2026 12:36:49 +0200
Message-ID: <87eci0b2ny.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Cl5kQU67VysaIb3sc8wLqo/6eAp9LpoMwPodrRxbJ20676gCM1+Y6ysBWHFeONX2bGVlA2h7gq470HW0asHDlZBgVicPams+eQHFL3OcTnoV00ilJsS+HXZzL6zJtnyPpXOqBSvZm11D4nip5QOVE7utC9KxDkdi92/7NOKCnUJPqfKqnuH4m/8Lpjc2QLaRsROYDZJNHTsGimPAerpMREmiRoHZqBMyEMKmZgVAHO6+74E0Ud4PmnsVaE4qS2YSB/i+i9tzw/bl+eI5lRftDAobrXchwAn/c4M/WWIHpEmvi+NkkP6S+hIMc4Dm71aixC0eLo8J7kznRH3flJs2VA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=5tzFhX/H4jKFlmKXoJvIGTz6eYJHMlcicF8J4f443Bc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Cl5kQU67
Subject: Re: [Buildroot] [PATCH] utils/generate-cyclonedx: fixup scp-style
 git sites
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

Pj4+Pj4gIlBldGVyIiA9PSBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+IHdy
aXRlczoKCiA+IENvbW1pdCBlOGM1NGZmYjNkICgidXRpbHMvZ2VuZXJhdGUtY3ljbG9uZWR4OiBn
ZW5lcmF0ZSB2Y3MKID4gZXh0ZXJuYWxSZWZlcmVuY2VzIGZvciBzb3VyY2UgcmVwb3MiKSBhZGRl
ZCBleHRlcm5hbFJlZmVyZW5jZXMgdG8gdGhlIHNvdXJjZQogPiBjb2RlIG9mIHBhY2thZ2VzLgoK
ID4gVGhpcyB1bmZvcnR1bmF0ZWx5IGNhdXNlcyBpc3N1ZXMgd2l0aCBwYWNrYWdlcyAoaW4gYnIy
LWV4dGVybmFsKSBmZXRjaGluZwogPiBmcm9tIGdpdCB1c2luZyB0aGUgc2NwLWxpa2Ugc3ludGF4
LCBFLkcuOgoKID4gIEZPT19TSVRFX01FVEhPRCA9IGdpdAogPiAgRk9PX1NJVEUgPSBnaXRAZ2l0
aHViLmNvbTo8cHJvamVjdD4vPHJlcG8+LmdpdAoKID4gV2hpY2ggZW5kcyB1cCBpbiB0aGUgU0JP
TSBhczoKCiA+IFsKID4gICB7CiA+ICAgICAidHlwZSI6ICJ2Y3MiLAogPiAgICAgInVybCI6ICJn
aXRAZ2l0aHViLmNvbTo8cHJvamVjdD4vPHJlcG8+LmdpdCIsCiA+ICAgICAiY29tbWVudCI6ICJn
aXQgcmVwb3NpdG9yeSIKID4gICB9CiA+IF0KCiA+IFRoaXMgKGNvcnJlY3RseSkgY2F1c2VzIERl
cGVuZGVuY3kgdHJhY2sgdG8gcmVqZWN0IHRoZSBTQk9NIGltcG9ydCB3aXRoOgoKID4gewogPiAg
ICJzdGF0dXMiOiA0MDAsCiA+ICAgInRpdGxlIjogIlRoZSB1cGxvYWRlZCBCT00gaXMgaW52YWxp
ZCIsCiA+ICAgImRldGFpbCI6ICJTY2hlbWEgdmFsaWRhdGlvbiBmYWlsZWQiLAogPiAgICJlcnJv
cnMiOiBbCiA+ICAgICAiJC5jb21wb25lbnRzWzJdLmV4dGVybmFsUmVmZXJlbmNlc1swXS51cmw6
IGRvZXMgbm90IG1hdGNoIHRoZSBpcmktcmVmZXJlbmNlIHBhdHRlcm4gbXVzdCBiZSBhIHZhbGlk
IFJGQyAzOTg3IElSSS1yZWZlcmVuY2UiLAogPiAgICAgIiQuY29tcG9uZW50c1syXS5leHRlcm5h
bFJlZmVyZW5jZXNbMF0udXJsOiBkb2VzIG5vdCBtYXRjaCB0aGUgaXJpLXJlZmVyZW5jZSBwYXR0
ZXJuIG11c3QgYmUgYSB2YWxpZCBSRkMgMzk4NyBJUkktcmVmZXJlbmNlIiwKID4gICAgICIkLmNv
bXBvbmVudHNbMl0uZXh0ZXJuYWxSZWZlcmVuY2VzWzBdLnVybDogZG9lcyBub3QgbWF0Y2ggdGhl
IHJlZ2V4IHBhdHRlcm4gXnVybjpjZHg6WzAtOWEtZl17OH0tWzAtOWEtZl17NH0tWzAtOWEtZl17
NH0tWzAtOWEtZl17NH0tWzAtOWEtZl17MTJ9L1sxLTldWzAtOV0qJCIsCiA+ICAgIF0KID4gfQoK
ID4gVGhlIEN5Y2xvbmVEWCBzcGVjIGluZGVlZCByZXF1aXJlcyBhIFVSSToKCiA+IFRoZSBVUkkg
KFVSTCBvciBVUk4pIHRvIHRoZSBleHRlcm5hbCByZWZlcmVuY2UuICBFeHRlcm5hbCByZWZlcmVu
Y2VzIGFyZQogPiBVUklzIGFuZCB0aGVyZWZvcmUgY2FuIGFjY2VwdCBhbnkgVVJMIHNjaGVtZSBp
bmNsdWRpbmcgaHR0cHMgKFJGQy03MjMwKSwKID4gbWFpbHRvIChSRkMtMjM2OCksIHRlbCAoUkZD
LTM5NjYpLCBhbmQgZG5zIChSRkMtNDUwMSkKCiA+IGh0dHBzOi8vY3ljbG9uZWR4Lm9yZy9kb2Nz
LzEuNi9qc29uLyNtZXRhZGF0YV90b29sc19vbmVPZl9pMF9jb21wb25lbnRzX2l0ZW1zX2V4dGVy
bmFsUmVmZXJlbmNlc19pdGVtc191cmwKCiA+IFRoZSB1c2VyQGhvc3Q6cHJvamVjdC9yZXBvLmdp
dCBpcyBhIGdpdC1zcGVjaWZpYyBzaG9ydGhhbmQgZm9yIGEgZ2l0LW92ZXItc3NoIFVSTC4gRnJv
bSBtYW4gZ2l0LWNsb25lOgoKID4gIEdpdCBzdXBwb3J0cyBzc2gsIGdpdCwgaHR0cCwgYW5kIGh0
dHBzIHByb3RvY29scyAoaW4gYWRkaXRpb24sIGZ0cCBhbmQgZnRwcwogPiAgY2FuIGJlIHVzZWQg
Zm9yIGZldGNoaW5nLCBidXQgdGhpcyBpcyBpbmVmZmljaWVudCBhbmQgZGVwcmVjYXRlZDsgZG8g
bm90IHVzZQogPiAgdGhlbSkuCgogPiAgVGhlIG5hdGl2ZSB0cmFuc3BvcnQgKGkuZS4gIGdpdDov
LyBVUkwpIGRvZXMgbm8gYXV0aGVudGljYXRpb24gYW5kIHNob3VsZAogPiAgYmUgdXNlZCB3aXRo
IGNhdXRpb24gb24gdW5zZWN1cmVkIG5ldHdvcmtzLgoKID4gIFRoZSBmb2xsb3dpbmcgc3ludGF4
ZXMgbWF5IGJlIHVzZWQgd2l0aCB0aGVtOgoKID4gIOKAoiAgIHNzaDovL1t1c2VyQF1ob3N0Lnh6
Wzpwb3J0XS9wYXRoL3RvL3JlcG8uZ2l0LwogPiAg4oCiICAgZ2l0Oi8vaG9zdC54els6cG9ydF0v
cGF0aC90by9yZXBvLmdpdC8KID4gIOKAoiAgIGh0dHBbc106Ly9ob3N0Lnh6Wzpwb3J0XS9wYXRo
L3RvL3JlcG8uZ2l0LwogPiAg4oCiICAgZnRwW3NdOi8vaG9zdC54els6cG9ydF0vcGF0aC90by9y
ZXBvLmdpdC8KCiA+ICBBbiBhbHRlcm5hdGl2ZSBzY3AtbGlrZSBzeW50YXggbWF5IGFsc28gYmUg
dXNlZCB3aXRoIHRoZSBzc2ggcHJvdG9jb2w6CgogPiAg4oCiICAgW3VzZXJAXWhvc3QueHo6cGF0
aC90by9yZXBvLmdpdC8KCiA+IFNvIGNvbnZlcnQgdGhlIHNjcC1saWtlIHN5bnRheCB0byBzc2g6
Ly8gVVJMcyBpbiBwYXJzZV91cmlzKCkgZm9yIHNwZWMKID4gY29tcGxpYW5jZS4KCiA+IFNpZ25l
ZC1vZmYtYnk6IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4KCkNvbW1pdHRl
ZCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
