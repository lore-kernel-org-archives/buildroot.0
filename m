Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D570CA0EED
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 13:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52A36606B3;
	Thu, 28 Aug 2025 13:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kjGmKfkcenfL; Thu, 28 Aug 2025 13:24:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FA8E60D9C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FA8E60D9C;
	Thu, 28 Aug 2025 13:24:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C6052B8C
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7C9760DD2
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:24:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6a1UXLrtGBTm for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 13:24:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E2AE4606B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2AE4606B3
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E2AE4606B3
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:24:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 076B4B978384; Thu, 28 Aug 2025 15:24:24 +0200 (CEST)
Message-ID: <44494c87-bc3a-48de-a098-2c8e771b2a6a@rnout.be>
Date: Thu, 28 Aug 2025 15:24:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: =?UTF-8?B?TWljaGHFgiDFgXlzemN6ZWs=?= <michal.lyszczek@bofc.pl>,
 Jagan Teki <jagan@amarulasolutions.com>
References: <20250819101806.3321661-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250819101806.3321661-1-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756387465; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=poZFpfXD6oj1XoLi/brVi/W2kN6zk9pzjWR3d38xM40=;
 b=ktS+aNgdIhhKajBEq+STnpdP9DNp7J8QJCBPl7mxMZDw7A4AGjQcx6I7dutJEIzCLebHGp
 mLnpDP1HN0DLkrHqS6u8Dipv6ztk/WlqFUGGsdAxw1lgEXQeXgIK/bY8p8R6jSKBFkDgEt
 j3GCXuKxN9b3jt9bzcr1rOHYHO8kWw6vXi3dH78ALHWMFEzOwpIRSGIj07JEfPzjtqcPFz
 fGZzHCkDoYoEyWWwc6Qgi105mHaHLS3t3zh7rAMYdJwIIDpTz0PmsM8hPOg1uXnwZkwJC3
 T4+YnFKxQrpt2X+1gv3t9snuQUBZK1zJ3G7iOfhTyfavWO5wc73H/4iHRYFs3g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=ktS+aNgd
Subject: Re: [Buildroot] [PATCH] configs/rock64: remove defconfig, broken
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

CgpPbiAxOS8wOC8yMDI1IDEyOjE4LCBUaG9tYXMgUGV0YXp6b25pIHZpYSBidWlsZHJvb3Qgd3Jv
dGU6Cj4gVGhpcyBkZWZjb25maWcgbm8gbG9uZ2VyIGJ1aWxkczoKPiAKPiAgICBodHRwczovL2dp
dGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzExMDI2NzY5NzIzCj4gCj4g
SXQgaGFzIGJlZW4gYnJva2VuIGZvciBhdCBsZWFzdCAyIG1vbnRoczoKPiAKPiAgICBodHRwczov
L2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzP25hbWU9VCUzRHJvY2s2
NCZraW5kPUJVSUxECj4gCj4gVGhlIG9sZCB1LWJvb3QtMjAyMC4wNy1yYzQgbm8gbG9uZ2VyIGJ1
aWxkcy4KPiAKPiBVbmxlc3MgYSBmaXggaXMgcHJvdmlkZWQsIHRoaXMgZGVmY29uZmlnIHdpbGwg
YmUgcmVtb3ZlZC4KPiAKPiBGaXhlczoKPiAKPiAgICAgIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWls
ZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMTEwMjY3Njk3MjMKPiAKPiBDYzogTWljaGHFgiDF
gXlzemN6ZWsgPG1pY2hhbC5seXN6Y3pla0Bib2ZjLnBsPgo+IFNpZ25lZC1vZmYtYnk6IFRob21h
cyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+CgogIEFwcGxpZWQgdG8g
bWFzdGVyLCB0aGFua3MuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgpbc25pcF0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
