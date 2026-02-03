Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 749B3E83070
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 09:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AEF083AEF;
	Tue,  3 Feb 2026 09:41:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M2ML6iYNUjsr; Tue,  3 Feb 2026 09:41:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B39F782327
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770111696;
	bh=TWlOq01H9ml4nP1WARnVNstakh2MYD1e30Qx2LR7JAA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cGM43/r+w6ZB2aHpvL44JCxO18P/qRudOUQJI/ieYYZskCilOsCSaTn2qtimIUeMD
	 vKNHbkAtvJZ/+ZcUt7ASDJEusx5GWFa38AhhORToDvyP/8fJ6XDDFriPHbFK5uDtfs
	 QRZ/B4Jg6or95mK91JVjU4uJh68LLMoNM+jOz36TVL1I54HroV4Wu+HNdx7wsTX5AK
	 yZiuANknr6NbYUYdzA5LcudguoRQb3yIbfCClCj7DHPnn6qHsDXmJuCj9yIqMdXgp8
	 xtacGpnyCwO+rykXxStdp7Avy/9TJYgI+3bZX1oeZhXYx+WBI6gtNvXDl0uoHsLb6O
	 Uax2yhSYZeBjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B39F782327;
	Tue,  3 Feb 2026 09:41:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 727B61A6
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 09:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58397402DD
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 09:41:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aKZIXYJZZvI5 for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 09:41:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5AA0D40243
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AA0D40243
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5AA0D40243
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 09:41:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 0EA7AC211DB;
 Tue,  3 Feb 2026 09:41:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D66A260728;
 Tue,  3 Feb 2026 09:41:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9FD7C119A88EE; Tue,  3 Feb 2026 10:41:23 +0100 (CET)
Date: Tue, 3 Feb 2026 10:41:21 +0100
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: buildroot@buildroot.org, Etienne Carriere
 <etienne.carriere@foss.st.com>, Alistair Francis <alistair@alistair23.me>,
 Dick Olsson <hi@senzilla.io>, Sergey Matyukevich <geomatsi@gmail.com>,
 Simon Dawson <spdawson@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Gero =?UTF-8?B?U2Nod8Okcmlja2U=?=
 <gero.schwaericke@grandcentrix.net>, Thomas Perale <thomas.perale@mind.be>,
 Titouan Christophe <titouan.christophe@mind.be>, Bernd Kuhls
 <bernd.kuhls@t-online.de>
Message-ID: <20260203104121.6f0944f4@kmaincent-XPS-13-7390>
In-Reply-To: <78b41baa-1a11-492e-8e8b-5b0aea92b7bd@rnout.be>
References: <20251001-fix_license-v2-0-bf18911c835d@bootlin.com>
 <20251001-fix_license-v2-1-bf18911c835d@bootlin.com>
 <78b41baa-1a11-492e-8e8b-5b0aea92b7bd@rnout.be>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770111688; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=4P5/AAmhnR+05EJ6Uu0GZDnaOnkwF1/TYpfer/l6aIs=;
 b=k7nkrrxmMKjprnPkjoQJJfAJlDPeoDkFgtt2xcYSwQK8wgCGiYxyIoCVH/D1NuNZm3YGIL
 vitNoGqrOxzKThP0g7vemmW4j6iIflD/B2gZlQNPaHJ7lvFk4dea6QtJ5isnRvqgOZ9pF9
 Bh7xvT9BR9l3PSWjz3EnA+za52cQhzSY+FTyMcq2qdz3bfBTMHYsminIUFj0Suy4iDcybb
 i3EvoRB4F19Sad195/AOxQCR4TXJXivWwpgT2SvUUAjpQ0FLhOQgmIyaikk4RSnzXb1zr0
 ydefBb0WA1MXV9K+VyIn80I0TrFFxhG+VVkMBhUVgfPqnYIS95OeN2qQQbBxDA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=k7nkrrxm
Subject: Re: [Buildroot] [PATCH v2 1/7] linux: Add support for custom
 license files
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQXJub3V0LAoKT24gTW9uLCAyIEZlYiAyMDI2IDE4OjUzOjU5ICswMTAwCkFybm91dCBW
YW5kZWNhcHBlbGxlIDxhcm5vdXRAcm5vdXQuYmU+IHdyb3RlOgoKPiAgIEhpIEtvcnksCj4gCj4g
ICBTZXJpZXMgYXBwbGllZCB0byBtYXN0ZXIsIHdpdGggY2hhbmdlcy4uLgo+IAo+ICAgRmlyc3Qs
IHlvdSBtaXNzZWQgcGFja2FnZS9saW51eC1oZWFkZXJzLCBzbyBJIGFkZGVkIGFuIGFkZGl0aW9u
YWwgY29tbWl0Cj4gdGhhdCBkb2VzIHRoZSBzYW1lIGZvciB0aGF0IHBhY2thZ2UuCj4gCj4gICBT
ZWNvbmQsIHVuZm9ydHVuYXRlbHkgdGhlIGhhc2ggb2YgdGhlIGxpY2Vuc2UgZmlsZQo+IExJQ0VO
U0VTL3ByZWZlcnJlZC9HUEwtMi4wIGNoYW5nZWQgaW4gNi4xNy4gVGhlcmVmb3JlLCBmb3IgdGhl
IENJUCB2ZXJzaW9ucywKPiBhbmQgYWxsIGxpbnV4LWhlYWRlcnMgdmVyc2lvbnMgYmVmb3JlIDYu
MTcsIHRoZSBoYXNoIGNoZWNrIGZhaWxzLi4uIEkgYWRkZWQKPiBhbm90aGVyIGNvbW1pdCB0aGF0
IGFkZHMgdmVyc2lvbi1zcGVjaWZpYyBoYXNoIGZpbGVzIGZvciBhbGwgc3VwcG9ydGVkCj4gdmVy
c2lvbnMuCj4gCj4gICBUaGlyZCwgdGhlc2UgdmVyc2lvbi1zcGVjaWZpYyBoYXNoIGZpbGVzIGJy
ZWFrIGJ1bXAtc3RhYmxlLWtlcm5lbC12ZXJzaW9ucy4KPiBJIGRpZCBub3QgZml4IHRoYXQgLSBp
bnN0ZWFkIEkgYWRkZWQgYWxsIHBlb3BsZSB3aG8gSSBrbmtvdyB1c2UgdGhhdCBzY3JpcHQKPiBp
biBDYy4gSG9wZWZ1bGx5IHNvbWVvbmUgd2lsbCBmaXggaXQgOi0pCj4gCj4gICBBbmQgZmluYWxs
eSwgdGhlcmUncyBhIHNtYWxsIHNpbXBsaWZpY2F0aW9uIChhcHBsaWVkIHRvIGFsbCBwYXRjaGVz
IGluIHRoZSAKPiBzZXJpZXMpLCBzZWUgYmVsb3cuCgpPayBncmVhdCEgVGhhbmtzIHlvdSEKCkRv
IHlvdSBoYXZlIHRoZSB0aW1lIHRvIHRha2UgYSBsb29rIGF0IHRoZSBzZXJpZXMgb24gZXh0ZXJu
YWwgdG9vbGNoYWluCmxpY2Vuc2VzPwpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2pl
Y3QvYnVpbGRyb290L2xpc3QvP3Nlcmllcz00NTg3NDcKClJlZ2FyZHMsCi0tIApLw7ZyeSBNYWlu
Y2VudCwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQga2VybmVsIGVuZ2luZWVyaW5nCmh0dHBz
Oi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
