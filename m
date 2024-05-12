Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C084AC10F1A
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 07:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84B8A4010C;
	Sun, 12 May 2024 07:57:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oWcDWNm9aaZp; Sun, 12 May 2024 07:57:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83F5C4011A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83F5C4011A;
	Sun, 12 May 2024 07:57:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DDD341BF473
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 07:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C948E4216E
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 07:57:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rpYu9MoRF8Vp for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 07:57:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4108C42164
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4108C42164
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4108C42164
 for <buildroot@buildroot.org>; Sun, 12 May 2024 07:57:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 64F5060002;
 Sun, 12 May 2024 07:57:22 +0000 (UTC)
Date: Sun, 12 May 2024 09:57:21 +0200
To: friedtj@free.fr
Message-ID: <20240512095721.7695acbd@windsurf>
In-Reply-To: <299860002.1258357262.1712837263439.JavaMail.zimbra@free.fr>
References: <299860002.1258357262.1712837263439.JavaMail.zimbra@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715500642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wG19eCy3dJd4fMz/ZJA7atIFk5NWpnrVpgUQfOE6Tq8=;
 b=HaqcvEBwR5qdpWfIxBjmuHuznZ7PFizpTiAn6SFdZjb8RNRdZNTAm0sfYNTtEaeCgR1WWF
 AGe0bQNEQj8t254h6qQwiMhrHuRt7Eq271l5tXb1lACAWCm1uGk03GVTWbbQficcv1Ko7X
 UwsNoJBIRN6NahqfduH0JwOxPYPqkimSWv0PgM/ZvtIe/RImW1Xy/fUrdwZrc4iVk72hM/
 s4AomkGE3NvsHwj+WmaciSZjx2a6nTfnC/TfZtzQlj3HbDSVuqkROPYnzw4bg3ZMXVB8Js
 OugJxokhB2qvRBYvbuyuFLHrwLtitwmoHi70m/gu6Wf/7GzA1VKSxhjimTX7Eg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HaqcvEBw
Subject: Re: [Buildroot] [PATCH 1/1] package/gr-osmosdr: add host-python-six
 dependency needed for generating Python bindings
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
Cc: gwenhael.goavec-merou@trabucayre.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSmVhbi1NaWNoZWwsCgpPbiBUaHUsIDExIEFwciAyMDI0IDE0OjA3OjQzICswMjAwIChD
RVNUKQpmcmllZHRqQGZyZWUuZnIgd3JvdGU6Cgo+IENvbXBpbGluZyBnci1vc21vc2RyIHdoZW4g
UHl0aG9uMyBzdXBwb3J0IGlzIGFjdGl2ZSBmYWlscyB3aXRoCj4gCj4gTW9kdWxlTm90Rm91bmRF
cnJvcjogTm8gbW9kdWxlIG5hbWVkICdzaXgnIAo+IG1ha2VbM106ICoqKiBbcHl0aG9uL2JpbmRp
bmdzL0NNYWtlRmlsZXMvb3Ntb3Nkcl9kb2NzdHJpbmdzLmRpci9idWlsZC5tYWtlOjczOiBweXRo
b24vYmluZGluZ3MvZG9jc3RyaW5nX3N0YXR1c10gRXJyb3IgMQo+IAo+IHdoZW4gZ2VuZXJhdGlu
ZyB0aGUgUHl0aG9uIGJpbmRpbmdzLiBUaGUgZm9sbG93aW5nIHBhdGNoIHNvbHZlcyB0aGUgcHJv
YmxlbS4KPiAKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKZWFuLU1pY2hlbCBGcmllZHQgPGptZnJpZWR0
QGZlbXRvLXN0LmZyPgo+IC0tLQo+ICBwYWNrYWdlL2dyLW9zbW9zZHIvZ3Itb3Ntb3Nkci5tayB8
IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpU
aGFua3MgZm9yIHRoZSBwYXRjaC4gSG93ZXZlciwgSSBoYXZlIGFwcGxpZWQgYSBzaW1pbGFyIHBh
dGNoIHdoaWNoIHdhcwpzdWJtaXR0ZWQgZWFybGllciBieSBNYXJ0aW4gQsO2aDoKCiAgaHR0cHM6
Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0L2NmZGExZjBiODdl
YmZiNzY4NmI4MmYzMTljNTMxZDRkMjhmZGZkNjcKCkJlc3QgcmVnYXJkcywKClRob21hcwotLSAK
VGhvbWFzIFBldGF6em9uaSwgQ1RPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwg
ZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
