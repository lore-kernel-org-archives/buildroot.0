Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48929D10BFC
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 15:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFD3B811EC;
	Sat, 26 Oct 2024 15:50:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TUrtrO2zuQ-3; Sat, 26 Oct 2024 15:50:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6A4881551
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6A4881551;
	Sat, 26 Oct 2024 15:50:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 62D305C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44B0740403
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:50:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9K-5DucfGfea for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 15:50:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E957A40340
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E957A40340
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E957A40340
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:50:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 296851BF204;
 Sat, 26 Oct 2024 15:50:22 +0000 (UTC)
Date: Sat, 26 Oct 2024 17:50:21 +0200
To: Andreas =?UTF-8?B?RMO8cmluZw==?= via buildroot <buildroot@buildroot.org>
Message-ID: <20241026175021.4921fd10@windsurf>
In-Reply-To: <20240916170340.13019-1-brpi@duering-andreas.de>
References: <20240916170340.13019-1-brpi@duering-andreas.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729957822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vmXpuP/eHrmF0PELs9IQqd8f6t/1Wjk3ge1t/UPhB9Y=;
 b=giDGvMLQ7wK+LveZbF+AKvQxbujFYFxvM/Whd5ZlTMmJgUAqZdNrlN/QrS3xBZKeNFHgOF
 jymwd0X3hH3jpvz+Z5tPSZkVhcGmtfJb7viTuz+p11uKiJHz3YR/9tmpaotVz4H5zUlP9/
 fVr4HJo35Sh4w6Om+T3EqbFrIXN4ZI0SO+blvn0tEfmBy4O1neQqMPe0etDG/o6g3zMHaG
 2V9i2E3KRZSFpniXGMWSBBXhL2YO8Js+tKDRAIc7ieH/vAGYeHULmsRFM5Ikoom+yT4e/a
 KrMAtCTTVxuDs9KaEGLHjXZEzemW7Gzw2eSA0lCBXiyn63q270rFNaHDhFfuNg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=giDGvMLQ
Subject: Re: [Buildroot] [PATCH v1 1/1] package/mbedtls: Move test binaries
 to subdirectory
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Andreas =?UTF-8?B?RMO8cmluZw==?= <brpi@duering-andreas.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQW5kcmVhcywKCk9uIE1vbiwgMTYgU2VwIDIwMjQgMTk6MDM6NDAgKzAyMDAKQW5kcmVh
cyBEw7xyaW5nIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToK
Cj4gVGhlIG1iZWR0bHMgcGFja2FnZSBoYXMgYSBjb25maWcgb3B0aW9uIEJSMl9QQUNLQUdFX01C
RURUTFNfUFJPR1JBTVMsCj4gd2hpY2ggZW5hYmxlcyBzb21lIHRlc3QgcHJvZ3JhbXMgdG8gYmUg
YnVpbHQgYW5kIGluc3RhbGxlZC4KPiBIb3dldmVyLCBzb21lIG9mIHRoZSB0ZXN0IHByb2dyYW1z
IGhhdmUgdW5mb3J0dW5hdGUgbmFtZXMsCj4gZS5nLiAiaGVsbG8iIGFuZCAic3RyZXJyb3IiLCB3
aGljaCBtYXkgbGVhZCB0byBuYW1lIGNvbGxpc2lvbnMgKD8pCj4gYW5kIGFsc28gb3RoZXJ3aXNl
ICJwb2xsdXRlIiAvdXNyL2Jpbi8uCj4gCj4gQWRkIGEgcGF0Y2ggdG8gdGhlIENNYWtlTGlzdHMu
dHh0IGZpbGVzLCBzbyB0aGF0IHRoZSBiaW5hcmllcyBnbwo+IHRvIC91c3IvYmluL21iZWR0bHMu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmVhcyBEw7xyaW5nIDxicnBpQGR1ZXJpbmctYW5kcmVh
cy5kZT4KClRoYW5rcyBhIGxvdCBmb3IgcmFpc2luZyB0aGlzIGlzc3VlLCBhbmQgcHJvcG9zaW5n
IHRoaXMgcGF0Y2guCgpIb3dldmVyLCBhcyBBcm5vdXQgaGFzIHBvaW50ZWQgb3V0LCB3ZSBuZWVk
IHRoZSBwYXRjaCB0byBiZSBzdWJtaXR0ZWQKdXBzdHJlYW0sIGFuZCBhbiAiVXBzdHJlYW06IiB0
YWcgd2l0aCB0aGUgcmVmZXJlbmNlIHRvIHRoZSB1cHN0cmVhbQpzdWJtaXNzaW9uIChlbWFpbCwg
cHVsbCByZXF1ZXN0LCBldGMuKS4KCkluIGFkZGl0aW9uLCB3aHkgd291bGQgcHJvZ3JhbXMgZ28g
aW4gL3Vzci9iaW4vbWJlZHRscz8gSXNuJ3QgdGhlIHJpZ2h0CmNvdXJzZSBhY3Rpb24gdG8gcmVu
YW1lIHRob3NlIHByb2dyYW1zIHNvIHRoYXQgdGhleSBkb24ndCBoYXZlCmNvbmZsaWN0aW5nIG5h
bWVzPyBMaWtlIG1iZWR0bHMtaGVsbG8sIG1iZWR0bHMtc3RyZXJyb3IsIGV0Yy4gPwoKVGhpcyBp
cyByZWFsbHkgc29tZXRoaW5nIHRvIHRha2UgYW5kIGRpc2N1c3Mgd2l0aCB1cHN0cmVhbS4KClRo
YW5rcyEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9v
dGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpo
dHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
