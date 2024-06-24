Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F4B1C2BD09
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 20:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4D3C608F4;
	Mon, 24 Jun 2024 20:04:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Sl2AkjB2fcJ; Mon, 24 Jun 2024 20:04:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDA2660A80
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDA2660A80;
	Mon, 24 Jun 2024 20:04:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 171AE1BF473
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0540860A80
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:04:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 28Xlf_sAxStW for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 20:04:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DF7F6608F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF7F6608F4
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF7F6608F4
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 20:04:13 +0000 (UTC)
Received: from 85-76-136-15-nat.elisa-mobile.fi ([85.76.136.15] helo=momiji)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sLpv8-0072tS-Cm; Mon, 24 Jun 2024 22:04:10 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id f9bbc89d;
 Mon, 24 Jun 2024 20:04:08 +0000 (UTC)
Date: Mon, 24 Jun 2024 23:04:02 +0300
Message-ID: <20240624230402.GB192149@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <877cegowt1.fsf@dell.be.48ers.dk>
References: <1582f-6672b400-7-af99240@116839531>
 <20240619140513.GB831334@igalia.com> <877cegowt1.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f8jiGKclLapFt4e7QlI9xHgyWUizqv+oavD+wr4Ajzw=; b=sar+wcnIBZ7fqCjBfvJmbMGbLK
 HyrV0VFQhowMkPYb44Mcn8uGmid/86w+OLJmoKr8m3CJhegY1u+DMx6GiA8aPah3ZbO+AQ5ghbMjI
 6wmuUX9RRMItbfUFOUMM5fc8SPKTj62SUJiK2ajCiZrzW4ixwCRRXcC1KQcxxBjvyN5r3sgElGiJe
 GmCy1ArZPbL5+UzM2BESkzQrKqhV8pN5ccuD5y3dSsQgboRwC7dJbPv3SuGA2wSipXQBEATDkpTV2
 bFfkX5rAHcChybyEpVy9RE+QES9pzVQFvzHf0praPpYP6e1K9NSri3GQY3hdLduY+sGwkLiKlniHZ
 /v8DF9cA==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=sar+wcnI
Subject: Re: [Buildroot] [PATCH 2/4] package/wpewebkit: security bump to
 version 2.44.2
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7020098012421712427=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============7020098012421712427==
Content-Type: multipart/signed; boundary="ygBqSKtlbotKwY0S"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--ygBqSKtlbotKwY0S
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGkgUGV0ZXIsIGFsbCwKCk9uIFN1biwgMjMgSnVuIDIwMjQgMTE6MDM6MzggKzAyMDAgUGV0ZXIg
S29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPiB3cm90ZToKPiA+Pj4+PiAiQWRyaWFuIiA9
PSBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxhcGVyZXpAaWdhbGlhLmNvbT4gd3JpdGVzOgo+IAo+
ICA+PiA+IENvbW1pdHRlZCB0byAyMDI0LjAyLngsIHRoYW5rcy4KPiAgPj4gCj4gID4+IHRoaXMg
YnVtcCBicm9rZSB0aGUgYnVpbGQgb24gQVJNIE5FT04gKGFnYWluKS4gU2luY2UgdGhlIGdpdGxh
YiBpc3N1ZSB0cmFja2VyIGRvZXNuJ3Qgc2VlbSB0byBub3RpZnkgdGhlIE1MIAo+ICA+PiBoZXJl
IGlzIHRoZSBsaW5rOiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3Qv
LS9pc3N1ZXMvMyAKPiAKPiAgPiBUaGVyZSB3YXMgYSBmaXggdGhhdCBsYW5kZWQgaW4gdGhlIFdl
YktpdCAibWFpbiIgYnJhbmNoIHNvbWUgZGF5cwo+ICA+IGFnbyBhbmQgSSBkaWQgYSBiYWNrcG9y
dCB0byB0aGUgMi40NCBicmFuY2g7IEkgaGF2ZSBhbHJlYWR5IHN0YXJ0ZWQKPiAgPiBwcmVwYXJp
bmcgYSBwYXRjaCBmb3IgQnVpbGRyb290Lgo+IAo+IFRoYW5rcy4gV2hhdCBoYXBwZW5lZCB0byB0
aGF0IHBhdGNoPwoKU3VibWl0dGVkOgpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2pl
Y3QvYnVpbGRyb290L3BhdGNoLzIwMjQwNjI0MjAwMDU2LjQ0MDE1NC0xLWFwZXJlekBpZ2FsaWEu
Y29tLwoKVGVzdGVkIGJ1aWxkaW5nIGZvciBSYXNwYmVycnlQaSAzICgzMi1iaXQpIGFuZCB0aGUg
NCAoNjQtYml0KS4KClNvcnJ5LCBJIHdhcyBBRksgYXJvdW5kIG1pZHN1bW1lciBhbmQgY291bGRu
J3Qgc2VuZCBpdCBlYXJsaWVyIDopCgpDaGVlcnMsCuKAlEFkcmnDoW4K

--ygBqSKtlbotKwY0S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZnnRMgAKCRCRxVnb5MkS
OypnAJ9FE0qJNsEObgyjaM68ULDlidE8ZACbBcJEDpoibxWq15WcaH5RPTp4zEk=
=a19E
-----END PGP SIGNATURE-----

--ygBqSKtlbotKwY0S--

--===============7020098012421712427==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7020098012421712427==--
