Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06762C369D1
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 07:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7A40820BA;
	Fri, 25 Apr 2025 07:52:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rD3aYyBPn-Mx; Fri, 25 Apr 2025 07:52:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D178D820E2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D178D820E2;
	Fri, 25 Apr 2025 07:52:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EDC8AC1
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 07:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4CE44297D
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 07:52:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vu_WXhpX5tD4 for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 07:52:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 054384296B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 054384296B
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 054384296B
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 07:52:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E5CD43A5F;
 Fri, 25 Apr 2025 07:52:52 +0000 (UTC)
Date: Fri, 25 Apr 2025 09:52:50 +0200
To: =?UTF-8?B?R2HDq2w=?= PORTAY <gael.portay+rtone@gmail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, Romain Naour
 <romain.naour@gmail.com>
Message-ID: <20250425095250.65932b54@windsurf>
In-Reply-To: <20250425020634.2474835-1-gael.portay+rtone@gmail.com>
References: <20250425020634.2474835-1-gael.portay+rtone@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedujeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheduteeufeekieevieegueegiefgvdevhefggfdutdeiuedvtdfgledvgeevleeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehgrggvlhdrphhorhhtrgihodhrthhonhgvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtt
 hhopegsvghrnhgusehkuhhhlhhsrdhnvghtpdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745567572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vJEgqm197b8wcBmC3Dv4jx8jjxcqVKiIWOWUSxCLTXc=;
 b=DOzLp/Zil3FyaL7Gvi0DUZJR4BxV6//pDjlXLnMpJU6Pnk84dMCIAxwZvxLUZUyEGy+qd5
 dDOLIi4ejW+0vIaVty8mczzinZuepsVWr7uAV8pZevRmkAC4t6lEoUc+SqRQxEewWHlb5j
 Mp8bRX2rcelq8HY8G0g4OPHDGe+zwO4pm2t+NkqxicTu56KdOy4sil/rgx1h/RCo7FDjHw
 IMpUoePPhhOOHiUAQa94KHRi6+ye+7fvJAui4QNs3blGGW/xpJH9RZjrK64lI4qA/tFCN2
 JGqpRbHgzAa1tOtlegtEv2D0u3Ulk9fLs6hYFX7uLgsjhbpPvgMYH0BCu/rp5Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DOzLp/Zi
Subject: Re: [Buildroot] [PATCH 1/1] Revert "package/mesa3d: Gallium VC4
 driver depends on NEON"
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

SGVsbG8gR2HDq2wsCgpPbiBGcmksIDI1IEFwciAyMDI1IDA0OjA2OjM0ICswMjAwCkdhw6tsIFBP
UlRBWSA8Z2FlbC5wb3J0YXkrcnRvbmVAZ21haWwuY29tPiB3cm90ZToKCj4gVGhpcyByZXZlcnRz
IGNvbW1pdCBhNWNkYjU0ZWQ3OGIxMzZjODNkZDQ0YWViZmEyN2Y3MTVjZGE1ZWEzLgoKVGhpcyBj
b21taXQgcG9pbnRzIHRvIGl0IHJlc29sdmluZyBhIGJ1aWxkIGZhaWx1cmUuIEhvdyByZXZlcnRp
bmcgdGhlCmNvbW1pdCB3aWxsIGNvbnRpbnVlIHRvIGZpeCB0aGUgYnVpbGQgaXNzdWU/IE9yIGRv
IHlvdSBzYXkgdGhhdCB0aGUKYnVpbGQgaXNzdWUgZG9lcyBub3QgZXhpc3Q/CgpUaG9tYXMKLS0g
ClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGlu
dXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNv
bQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
