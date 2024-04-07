Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60609CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 07:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2549160774;
	Sun,  7 Apr 2024 07:59:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U1H0vpzEEWVQ; Sun,  7 Apr 2024 07:59:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEC6860833
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEC6860833;
	Sun,  7 Apr 2024 07:59:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1C0C31BF21A
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 07:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 066016070B
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 07:59:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 03WkUrgrk-Dc for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 07:59:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0AE8460769
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AE8460769
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0AE8460769
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 07:59:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5D17660003;
 Sun,  7 Apr 2024 07:59:14 +0000 (UTC)
Date: Sun, 7 Apr 2024 09:59:13 +0200
To: Vincent =?UTF-8?B?U3RlaGzDqQ==?= via buildroot <buildroot@buildroot.org>
Message-ID: <20240407095913.7df5d2d5@windsurf>
In-Reply-To: <20240406145802.15700-1-vincent.stehle@laposte.net>
References: <20240406145802.15700-1-vincent.stehle@laposte.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712476754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yJWzj2YpQZWFgm4+oJrz8TiB9/qmSDHMtNTho5s4niM=;
 b=jkc5mLbjNG06a1fENUzAmi9UH80b30OlygSPGQii+gOJDiePJ0VW+EAQ3qYmFTRXP5W3tm
 hzvItUhHorlGFCGtYAMOG0pAeOvQoeqKKUvN6N9hIx+USTpiFzOKWvQ6DaVhbPI46xnjZM
 IgYBV7Ei/ORsHKrHdmBTOdEIH6zj+NogCaKS+08uAmUJkvcyoyhTFtV0ChjMRar6E0osCU
 ts2uBUmGd8eirg29EajPGD5FwPy0Uah+5BdSK/2o372EN/EyY4PfatqQsRT3TNjJmayJBi
 Jl15muRP6Jp3m6V4MNdPQTy38XhWhiVIIZOGfN+DdQRRoADlpwnXI14SF8QyUA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jkc5mLbj
Subject: Re: [Buildroot] [PATCH] configs/bananapi_m2_zero: bump Linux to
 6.8.4 and U-Boot to 2024.04
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Vincent =?UTF-8?B?U3RlaGzDqQ==?= <vincent.stehle@laposte.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCAgNiBBcHIgMjAyNCAxNjo1ODowMiArMDIwMApWaW5jZW50IFN0ZWhsw6kgdmlhIGJ1
aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgoKPiBOZWNlc3NhcnkgYWRh
cHRhdGlvbnM6Cj4gLSBUaGUgU0QgY2FyZCBpcyBub3cgY2FsbGVkIG1tY2JsazE7IGFkYXB0IExp
bnV4IGJvb3QgY29tbWFuZCBhY2NvcmRpbmdseS4KPiAtIFRoZSBEVEIgaXMgbm93IHVuZGVyIHRo
ZSBhbGx3aW5uZXIvIGZvbGRlci4KPiAtIFUtQm9vdCBuZWVkcyBPcGVuU1NMIHRvIGJ1aWxkLgo+
IAo+IEZpeGVzOgo+IC0gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290
Ly0vam9icy82NTQ0NTAxMTExCj4gCj4gU2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOpIDx2
aW5jZW50LnN0ZWhsZUBsYXBvc3RlLm5ldD4KPiBDYzogSmFnYW4gVGVraSA8amFnYW5AYW1hcnVs
YXNvbHV0aW9ucy5jb20+Cj4gLS0tCj4gIGJvYXJkL2JhbmFuYXBpL2JhbmFuYXBpLW0yLXplcm8v
Ym9vdC5jbWQgfCAgMiArLQo+ICBjb25maWdzL2JhbmFuYXBpX20yX3plcm9fZGVmY29uZmlnICAg
ICAgIHwgMTAgKysrKystLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwg
NiBkZWxldGlvbnMoLSkKCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpUaG9tYXMKLS0gClRo
b21hcyBQZXRhenpvbmksIENUTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVu
Z2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
