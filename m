Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99AEFD609B7
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 16:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4648761002;
	Tue, 16 Dec 2025 16:17:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u3MgJaTBg7vF; Tue, 16 Dec 2025 16:17:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5620F60F83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765901830;
	bh=iq9bANfLZnHrFKw8hwkBQuUq/8UHBJslAczhxgYF5NE=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=RGj399646O+nduU9dDYfD/8vMRiZprm2rBQD7qy2jI6JrU8657yVkI97ToDx657ll
	 nXVGPUsRNOBjVYlaqgoX+rEfS7WmV55npN9OhwM/3ghuzT0ixOJllDgm288+Jnf3DH
	 TU7VCKuvOYqGDAGYybaIblCKzNem8MDQFC49cfbsR/nTxmN2DkIgrGvviTukfS56Vs
	 JZSeWKbYh0gEGUPQBwfcSb1CDrTVOhpBGxJ5/LMTxw1yKLJWeL2SeN5/2w4Y1YFb+x
	 agQHEkGi+WP4TR0TkaLTUozjOhGC/2kScPt4Nur9308vLU+oBEz9ML7+ZibZEc9EiB
	 +hYd4Vl1oheWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5620F60F83;
	Tue, 16 Dec 2025 16:17:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 16111151
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 16:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F10E3827A5
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 16:17:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mTILWYWjvisR for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 16:17:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2C2FB8272A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C2FB8272A
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C2FB8272A
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 16:17:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3FC361A2204;
 Tue, 16 Dec 2025 16:17:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 156676071C;
 Tue, 16 Dec 2025 16:17:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 124BD119A8FE8; Tue, 16 Dec 2025 17:16:56 +0100 (CET)
Date: Tue, 16 Dec 2025 17:16:56 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20251216171656.7c0a8277@kmaincent-XPS-13-7390>
In-Reply-To: <20251216164043.458d92bb@windsurf>
References: <20251216151449.395253-1-kory.maincent@bootlin.com>
 <20251216151449.395253-3-kory.maincent@bootlin.com>
 <20251216164043.458d92bb@windsurf>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765901820; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=HerotvhJazp2mG+8JzCB7EUCDOXA0GddIthlO2mY7Qg=;
 b=10y04Bru3jQlGtRKufKrm04Pgv1joCVvXCj+m9p+Z7rwfhwbLlNNQ8A5+cjD+rqhtnv7uG
 9PHP4w+8eb5ZQ1tF0xKCWvmBLiPlRCH69mXlSve3j/ZKMsSc+j2sNBYrZM9fiotp11/ak1
 7kngxIx79+29ZpYbEzcJJv1WSOOS4zO00bgmQKAwvpqeve3E3WF4nUH189pdCAuoS7FPO5
 n6+/VxUT35AB+mlvC7pp23U/nx4hSEugeWIpPbLtv61TEsdN+HZiKVlUcEG3CRI9UBXVII
 bvOnlAsTOw7salCbX4xihCUTmxcwjPuQy4teucm7xEZXoiqAFBm4u6XXK4yfqQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=10y04Bru
Subject: Re: [Buildroot] [PATCH v3 2/5] configs/beaglebone: Bump to Linux
 mainline 6.18.1
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Bajjuri Praneeth <praneeth@ti.com>, Julien Olivain <ju.o@free.fr>,
 Lothar Felten <lothar.felten@gmail.com>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCAxNiBEZWMgMjAyNSAxNjo0MDo0MyArMDEwMApUaG9tYXMgUGV0YXp6b25pIDx0aG9t
YXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gSGVsbG8gS29yeSwKPiAKPiBPbiBU
dWUsIDE2IERlYyAyMDI1IDE1OjE0OjQyICswMDAwCj4gS29yeSBNYWluY2VudCA8a29yeS5tYWlu
Y2VudEBib290bGluLmNvbT4gd3JvdGU6Cj4gCj4gPiAgYm9hcmQvYmVhZ2xlYm9hcmQvYmVhZ2xl
Ym9uZS9saW51eC5jb25maWcgICAgIHwgNjgyICsrKysrKysrKysrKysrKysrKyAgCj4gCj4gSWYg
eW91IHByb3ZpZGUgYSBjdXN0b20gZGVmY29uZmlnLCBpdCByZWFsbHkgbmVlZHMgdG8gYmUgdGFp
bG9yZWQgdG8gdGhlCj4gcGxhdGZvcm0uCgpJIHVzZWQgdGhlIG9uZSBwcm92aWRlZCBieSBUSSBv
biB0aGVpciByZXBvOgokIG1ha2UgbXVsdGlfdjdfZGVmY29uZmlnIHRpX211bHRpX3Y3X3BydW5l
LmNvbmZpZwoKQnV0IG9rIEkgd2lsbCB1c2UgdGhlIG9tYXAycGx1c19kZWZjb25maWcgbWFpbmxp
bmUgZGVmY29uZmlnIGluc3RlYWQsIHdpdGggYQpmcmFnbWVudCBpZiBuZWVkZWQuCgpSZWdhcmRz
LAotLSAKS8O2cnkgTWFpbmNlbnQsIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIGtlcm5lbCBl
bmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
