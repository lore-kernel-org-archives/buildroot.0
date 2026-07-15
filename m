Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B5C5C44508
	for <buildroot@archiver.kernel.org>; Wed, 15 Jul 2026 06:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4AD040652;
	Wed, 15 Jul 2026 06:17:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rMy1cnlBDceV; Wed, 15 Jul 2026 06:17:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2167B406C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784096271;
	bh=H1BHi8RCLBfdkq3IN6A0SC4xymwdTDwxRACDn/WSOM0=;
	h=Date:Cc:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FJGzR4P28v3ag9gQmSX+C9RAchb0I7fjt/qwrxW8TvnM/KfOGBt3kB5kzHe4tRGn/
	 rcOv0cYvehBXpnmsMAORY2f4rCxFMxys5DU5iPjFqyskTrbDvlESdJ+b0ZD5BdXd0l
	 CL0oNv2SQ6Q4zOSDkZxV8Y6I8/6zrhKIOpRECu0UKBEriRvHoT0zYC3/OcsmlTVazD
	 Xahy44CM30Qt+i4C6YFGjzOEhcCxavuQF8cpKoG9JN/YTsGsM6ljtVCBh3gDRGViG+
	 NgbTWNFa8x+xavtoWc+eutC8Hw+c+/YXx+1C/dYV4kTW/4UqwDJeLT1R8m+Icn8xqT
	 aRvoZW/6WHcgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2167B406C7;
	Wed, 15 Jul 2026 06:17:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 78A85203
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 06:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 621906063F
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 06:17:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4j__U03ravZM for <buildroot@buildroot.org>;
 Wed, 15 Jul 2026 06:17:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 49C63605E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49C63605E4
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49C63605E4
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 06:17:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id E3671C2B9C3;
 Wed, 15 Jul 2026 06:18:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 077B96035C;
 Wed, 15 Jul 2026 06:17:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 158AE11BD3B92; 
 Wed, 15 Jul 2026 08:17:41 +0200 (CEST)
Mime-Version: 1.0
Date: Wed, 15 Jul 2026 08:17:41 +0200
Message-Id: <DJYXCBQHYG5N.3UU3PS17VGW6T@bootlin.com>
Cc: <buildroot@buildroot.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Bernard Gautier"
 <bernard.gautier@nav-timing.safrangroup.com>
To: "Julien Olivain" <ju.o@free.fr>, =?utf-8?q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260618-libgpg-error-gawk-v1-1-d6ac9f962f1f@bootlin.com>
 <09d3e819f570608806122b57c96ab83b@free.fr>
In-Reply-To: <09d3e819f570608806122b57c96ab83b@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1784096264; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=TbtRhVfXZcsdZtEpkCq3A0qzKwKdXUauRtrbyJ8MfEE=;
 b=qKnlMD3WhTsdly0KiwFtDfB6mz7Ftc46QIFkQhFbyW3ndTxOwUd4Q381ceudFrfHUyurGq
 mg+bftLrgiAi0GkOC/ngQkjA51Hl2ymtrZW2On7NkaCB9/pLjgAhQxBt9QjDdhksWlkwC9
 MlmiqiG3rBmw8rEyStXWWNGj9PRLa+5/f8rqxqKPf3wupdxA7pdHgFeLCrrvteSskXpbj4
 dDrbE31lHratrNhZaAdk5zy0WtahYeoSr4u0+GX1MiThuSYEXm6M2CVJ3A3/lLTcqan/Ww
 n6kvzZB5zFU/Qo1UgFUkC6dMMFEhvrhd/FhRc2ZxO6CsWU2a0dIVuCeUHLc5pw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=qKnlMD3W
Subject: Re: [Buildroot] [PATCH] package: libgpg-error: make sure to use
 host-gawk
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSnVsaWVuLAoKT24gVHVlIEp1bCAxNCwgMjAyNiBhdCAxOjM0IFBNIENFU1QsIEp1bGllbiBP
bGl2YWluIHdyb3RlOgo+IE9uIDE4LzA2LzIwMjYgMTY6NDksIEFsZXhpcyBMb3Rob3LDqSB2aWEg
YnVpbGRyb290IHdyb3RlOgoKWy4uLl0KCj4+IEVuZm9yY2UgYW4gZXhwbGljaXQgZGVwZW5kZW5j
eSBvbiBob3N0LWdhd2sgZm9yIGxpYmdwZy1lcnJvciB0byBtYWtlCj4+IHN1cmUgdGhhdCBpdCBz
eXN0ZW1hdGljYWxseSB1c2VzIHRoZSBidWlsZHJvb3QtcHJvdmlkZWQgYXdrLgo+PiAKPj4gQ28t
ZGV2ZWxvcHBlZC1ieTogQmVybmFyZCBHYXV0aWVyIAo+PiA8YmVybmFyZC5nYXV0aWVyQG5hdi10
aW1pbmcuc2FmcmFuZ3JvdXAuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBCZXJuYXJkIEdhdXRpZXIg
Cj4+IDxiZXJuYXJkLmdhdXRpZXJAbmF2LXRpbWluZy5zYWZyYW5ncm91cC5jb20+Cj4+IENvLWRl
dmVsb3BwZWQtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+
Cj4+IFNpZ25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxp
bi5jb20+Cj4KPiBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgo+Cj4gV2hpbGUgcmV2aWV3aW5n
LCBJIG9ic2VydmVkIHRoZSBtYXdrIHZlcnNpb24gZnJvbSBEZWJpYW4gMTIgaXMgd29ya2luZyAK
PiBhcwo+IGV4cGVjdGVkLiBPbmx5IHRoZSB2ZXJzaW9uIGluIERlYmlhbiAxMyBzaG93cyB0aGUg
aXNzdWUuIEkgYWRkZWQgdGhpcyAKPiBzaWRlCj4gbm90ZSBpbiB0aGUgY29tbWl0IGxvZywgd2hl
biBhcHBseWluZy4KClRoYW5rcyBmb3IgdGhlIHVwZGF0ZS4gSW4gdGhlIG1lYW4gdGltZSwgSSBo
YXZlIHByb3Bvc2VkIGEgZml4IGluIHRoZQp1cHN0cmVhbSBwYWNrYWdlIHRoYXQgZXZlbnR1YWxs
eSB3ZW50IGZ1cnRoZXIgKFsxXSkgYW5kIGFjdHVhbGx5IGRyb3BwZWQKYXdrIHVzYWdlIGZyb20g
bGliZ3BnLWVycm9yLiBUaGUgZml4IGhhcyBiZWVuIGludGVncmF0ZWQgYnV0CmxpYmdwZy1lcnJv
ciBoYXMgbm90IGJlZW4gcmUtcmVsZWFzZWQgeWV0LCBvbmNlIHRoZXJlJ3MgYSBuZXcgdGFnLCB3
ZQpjYW4gYnVtcCB0aGUgcGFja2FnZSBhbmQgZHJvcCB0aGUgYXdrIGRlcC4KClRoYW5rcyAKCkFs
ZXhpcwoKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9ncGcvbGliZ3BnLWVycm9yL2NvbW1pdC82MWQ5
YTY0ZjkxYWE4OTY1MjI2NWRhOTdlMzJlZGVlODZkNWZiYTQ1Cgo+Cj4gQmVzdCByZWdhcmRzLAo+
Cj4gSnVsaWVuLgoKCgoKLS0gCkFsZXhpcyBMb3Rob3LDqSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51
eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
