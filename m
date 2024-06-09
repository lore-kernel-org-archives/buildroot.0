Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7569FC27C53
	for <buildroot@archiver.kernel.org>; Sun,  9 Jun 2024 04:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3757440018;
	Sun,  9 Jun 2024 04:12:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id blLkbCfYvK1m; Sun,  9 Jun 2024 04:12:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 013C14034B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 013C14034B;
	Sun,  9 Jun 2024 04:12:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6402D1BF3FB
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 04:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 501594034B
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 04:12:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ptFW5KeKDfGf for <buildroot@lists.busybox.net>;
 Sun,  9 Jun 2024 04:12:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A4D7D40018
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4D7D40018
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A4D7D40018
 for <buildroot@buildroot.org>; Sun,  9 Jun 2024 04:12:25 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id A6B44440706;
 Sun,  9 Jun 2024 07:12:09 +0300 (IDT)
To: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <878qzfxta2.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sat, 08 Jun 2024 19:01:57 +0200")
References: <20240529-ztext-v2-0-82985032f169@gmx.net>
 <20240529-ztext-v2-2-82985032f169@gmx.net>
 <878qzfxta2.fsf@dell.be.48ers.dk>
Date: Sun, 09 Jun 2024 07:12:21 +0300
Message-ID: <87bk4avjoa.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1717906329;
 bh=TMIjQt62B2Z1NywNmeeIu12xdBixwN73guo6fFm4zl4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=g6VIHAhjeltRlQ2wmzEcfsASM8/I7pVUCwRCUo4mi1isgChgjtixyx/O34a9qFh0r
 h8asEYiRDlIz0+1SxtFbLUje476YlenYZ/CsSQJEgdaGjjG9OUrJieHOx/MW/UulHa
 5sSZOVLk1pqn8U71ONig6XAdavFAA787vw30zFzndHWx5xovNWOAGlhO2BfSxNwXSJ
 Clvgqx/nmtxA67vpq7libZAnyj7uyDb62Vvm3BdGMeR96L+qAU67ohPFI7IUZz4xsA
 3cVh/2P3xANmRGfKUn3nGeFytgZ/S8gQnDL8CoxpxqojMzI4MnSEi1AOvNDarRDlyq
 cyaIWsf/y+h0w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=g6VIHAhj
Subject: Re: [Buildroot] [PATCH v2 2/2] micropython: Add patch to avoid
 textrel on arm/thumb
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
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "J. =?utf-8?Q?Neusch=C3=A4fer?= via buildroot" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ZXIsCgpPbiBTYXQsIEp1biAwOCAyMDI0LCBQZXRlciBLb3JzZ2FhcmQgd3JvdGU6Cgo+
Pj4+Pj4gIkoiID09IEogTmV1c2Now6RmZXIgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxk
cm9vdC5vcmc+IHdyaXRlczoKPgo+ICA+IFNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxq
Lm5ldXNjaGFlZmVyQGdteC5uZXQ+Cj4KPiBDb21taXR0ZWQgdG8gMjAyNC4wMi54LCB0aGFua3Mu
CgpOb3QgaW4gMjAyNC4wMi54IGFzIG9mIGNvbW1pdCBlZTY2OTRlOTcwNGIgKCJwYWNrYWdlL2xp
Ym9wZW5zc2w6CnNlY3VyaXR5IGJ1bXAgdG8gdmVyc2lvbiAzLjIuMiIpLgoKYmFydWNoCgotLSAK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB+LiAu
fiAgIFRrIE9wZW4gU3lzdGVtcwo9fS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLW9vTy0tVS0tT29vLS0tLS0tLS0tLS0tez0KICAgLSBiYXJ1Y2hAdGtvcy5j
by5pbCAtIHRlbDogKzk3Mi41Mi4zNjguNDY1NiwgaHR0cDovL3d3dy50a29zLmNvLmlsIC0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
