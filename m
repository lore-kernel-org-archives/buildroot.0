Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38B0CA5FA6
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 18:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A232940539;
	Mon, 28 Sep 2026 18:42:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eFascG7NhmuS; Mon, 28 Sep 2026 18:41:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9348640522
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790620918;
	b=WsWpnS126uvHEeyMnux5c4ANq15b6Na1GEn1Z1jjVuTTY8r9Owz3TaC/HtXF10IUR9nw
	 XBz8z8W+CFy4IVjpvsZij0bJfpkpj7rK7ZsX1b3gOCHtQNvUNT0VQwhvIDX+m+RR0FUMx
	 CfewjoW/sB25vJwegTZKKEOO2PByOB66y29m3dxwb0wWyvEisWLSC1K8SaDZJVkfxnbvW
	 bQD5nfATTyKIsGCLoom3V7IKPIU5DWACzd2P6JtIGPlQvvYI3qGfqGYnKZykXHUJn+KFu
	 I7yNNYEG/3KemmjDUGK4btggvKDYrIDkCSgenGjyBfVfowx6N0DVd8iTjIMWRSk+CjA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790620918;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:Errors-To:Sender;
	bh=ttCLtSl/c4IZUNjtYKk1EbOWKub60hdS6bgEm4WMUGI=;
	b=mWvR1TiztZ9j01NwFEI1qyM4XGpFXksOHoUtJmlMjJxu1zrckfeZWxCm9mxcdi8ewMJI
	 asYzstGkShgd1jvj41mumpqK16FbYQm5+8x3XFMFnex0z2VOLwHtnduw1ZHsWLPkII/u5
	 LsAiylWZZZ2qKUHijixvmlo8THZgd7TSZJSyCHHt4qZhI3Ml6CLZrNIJsbuPeNb39EeOx
	 mtaSJcd5TRv/nzyXffcELHqqmBHkPdGZDNQ46TnSTywHXezkyEWfE06L1WJEqC+N28GJH
	 TNSYE50hRU7w2DJ28lmtZXLRCKw5dcWuN3ewdCFk46E786pd8CuSMW8da16YJRYfsLA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790620918;
	bh=ttCLtSl/c4IZUNjtYKk1EbOWKub60hdS6bgEm4WMUGI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IsWHnUBCqq40mEqAS0fSYKOUe6daJI46jr5l4sk//QvMkkM788pL0a0BcorigvmLa
	 q8BZTfSPYtQEZZ6anNqfsFgc3U2JiAvz9k7pqz0OzHEwzs3dWUeKMLQPLcrO2QsAd9
	 ombxiN2h+XmrutEjCPRG2TvKNvzKKR8JsGK23d4LhTS6n8xRpUo+9gLrFNsVb7XIlS
	 LlJMXbBazj5CN95amHYd6oJQHVgHJeCpVWB61npiU7Xc32YlpBNBVLYx2U/n04D/Q0
	 NdD8HZpVaj/dkhlXG+xmu3sI7iQ1wbsBWJ0U7I6NerixH49WbsxVsERr7ZtMce5zTi
	 gusFLJI3iF88w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9348640522;
	Mon, 28 Sep 2026 18:41:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DB8D632F
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 18:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE38880A95
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 18:41:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Okwl8OQ3s4hE for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 18:41:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5457280A92
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790620915;
 b=mrZyGonEItqbOVbue5ocEpaHdjjAVPajhVDWdCcF7wZ+hSYLrWmr3yN8m6s+6VjNrA5T
 x9RRgkZhczdEDTrhYa0o080R29v/XIm2TbHUjN1V/4Z6DyA5+J5er/8SjAuqkV8y8tkTb
 eVjvQ45EvyyDL/RmRgZPfpvabGoRa/iUh2LK8gief8rTBoIq+vpYGmiLXDP8Inmp5Alfp
 TR+QgDMZOCmPSmFS5lY/Z/JPhF7pTF9kkBycoETtJThZUrr19PLRlJg4Eztvpsvy8xUGd
 YANX1gi/HKupUB/ME8ZxyDpBFYoF9FRxuSQAIlf+2E5RKPhM3+FXXf7dCMjPcFeLY+Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790620915;
 h=Received-SPF:DKIM-Signature:Received:Received:Date:Message-ID:From:
 To:Cc:Subject:In-Reply-To:References:MIME-Version:Content-Type;
 bh=04SGj3FUoMgDzTpkLWpAndXC+Sa0holrf0PfOYbsDwo=;
 b=bscIMA+k6aUBuB5o7x9jIciJVaKxEtSSZWOjVCTN6fNJykywVwnsQ6KxCgOP3G4NbhHm
 fh6C9nFhffgzilszn69ODVvOCJFcveocbxQJwyXfBjS78zzaAh+V2kpIOS0QdY+gZk9B9
 kZTOSeH/o0whq1pY61mQh7HpHJbazE+iuUsKAZvgO6XQjxwz3ZK7JqpaRoO20Uxa+gt8D
 5f1+iM7Nt0zjF2eBEyNeubqS2JGTjQEKsYSHiRlHpCq+mX5/6oyRvQyAo+1ZvHTEElLNI
 YgqPcHfD8ICvklfdEIUu29wqYo1IY0k5wXpERvJbCugyfnJIvTzdhCu2c+E+4tfXb4A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=igalia.com; 
 dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=j1ROYywg; 
 arc=none smtp.remote-ip=213.97.179.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=j1ROYywg
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5457280A92
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 18:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:Subject:Cc:To:From:Message-ID:Date:
 From:Reply-To; bh=04SGj3FUoMgDzTpkLWpAndXC+Sa0holrf0PfOYbsDwo=; b=j1ROYywg9Rp
 pMP/F3YF8xMknTMlhenRF5jH/n+dHCwjUWBFw3aLLkb/Wp0sBkmQNzJKw6vM9vT53c9ZoymnBOq7K
 GfbWzOABKG3F446lox6iW4faf03jB3x3sWJFiuFcDra8vCt0o3RuSSwXC75rlznF7FMN1L0jneitq
 npfOxbrjCNJE0+wWG12tkmlan1u1zGEob83WvpFVpa3S3+Ew0WXI1c+OHGDns3u91etohFqI7i4gT
 gX85ZDtjGZaZfgqxTvRcm3/FHyDT3FsQ7qkbjqXP+4sjSxSU0EAnHhGjzf3smaHnJQ7JvNAsogc7s
 LZGSyF0jSx48Un+tpWuYS/A==;
Received: from 68.171.94.90.dynamic.jazztel.es ([90.94.171.68] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1xBGIO-008WXZ-PY; Mon, 28 Sep 2026 20:41:48 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id cd8a1be8;
 Mon, 28 Sep 2026 18:41:48 +0000 (UTC)
Date: Mon, 28 Sep 2026 20:41:44 +0200
Message-ID: <20260928204144.GI695823251613696@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Fiona Klute <fiona.klute@gmx.de>
In-Reply-To: <20260928182454.2165278-1-fiona.klute@gmx.de>
References: <20260928182454.2165278-1-fiona.klute@gmx.de>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/bubblewrap: fix build failure
 if kernel uses localversion
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
Content-Type: multipart/mixed; boundary="===============7727351574313376550=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============7727351574313376550==
Content-Type: multipart/signed; boundary="4HTczYQu3f0+rkF3"; micalg="pgp-sha256"; protocol="application/pgp-signature"


--4HTczYQu3f0+rkF3
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"; hp="clear"
Date: Mon, 28 Sep 2026 20:41:44 +0200
Message-ID: <20260928204144.GI695823251613696@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Fiona Klute <fiona.klute@gmx.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/bubblewrap: fix build failure if
 kernel uses localversion
In-Reply-To: <20260928182454.2165278-1-fiona.klute@gmx.de>
References: <20260928182454.2165278-1-fiona.klute@gmx.de>
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGVsbG8gRmlvbmEsIGFsbCwKCllvdSBiZWF0IG1lIHRvIHRoaXMgb25lLCB0aGFua3MgYSBsb3Qh
IFRoZXNlIGRheXMgSSBjYW4gb25seSB3b3JrIG9uIEJ1aWxkcm9vdApvbiBteSBzcGFyZSB0aW1l
LCBoZW5jZSBtZSBiZWluZyBzbG93IHRvIGdldCB0aGluZ3MgZG9uZS4gSSdtIGhhcHB5IHRvIGRv
CnJldmlld3MsIHRobyEKClNvIHRoZXJlZm9yZS4uLgoKT24gTW9uLCAyOCBTZXAgMjAyNiAyMDoy
NDo1NCArMDIwMCBGaW9uYSBLbHV0ZSB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290
Lm9yZz4gd3JvdGU6Cgo+IEJ1YmJsZXdyYXAgZXhwZWN0cyB0aGUgdmFsdWUgb2YgdGhlIGFzc3Vt
ZV9rZXJuZWwgb3B0aW9uLCBpZiBzZXQsIHRvCj4gYmUgZXhhY3RseSB0aHJlZSBudW1iZXJzIHNl
cGFyYXRlZCBieSBkb3RzLCBub3RoaW5nIGVsc2UgWzFdLiBJZiB0aGF0Cj4gcmVxdWlyZW1lbnQg
aXMgbm90IG1ldCBjb25maWd1cmluZyB0aGUgYnVpbGQgZmFpbHMuCj4gCj4gQnVpbGRyb290IHNl
dHMgYXNzdW1lX2tlcm5lbCB0byAkKExJTlVYX1ZFUlNJT05fUFJPQkVEKSBzaW5jZSB0aGUKPiB2
ZXJzaW9uIGJ1bXAgdG8gMC4xMi4wKS4gSG93ZXZlciwgdGhlIGV4cGFuc2lvbiBvZgo+IExJTlVY
X1ZFUlNJT05fUFJPQkVEIG1heSBjb250YWluIGFkZGl0aW9uYWwgc3VmZml4ZXMsIGUuZy4gaWYK
PiBDT05GSUdfTE9DQUxWRVJTSU9OIGlzIHNldCwgb3IgbG9jYWx2ZXJzaW9uKiBmaWxlcyBhcmUg
cHJlc2VudCAobGlrZQo+IGluIENJUCBrZXJuZWxzKS4gU28gZmlsdGVyIHRoZSB2ZXJzaW9uIHN0
cmluZyB0byBpZ25vcmUgYW55IHN1ZmZpeGVzLgo+IAo+IFsxXSBodHRwczovL2dpdGh1Yi5jb20v
Y29udGFpbmVycy9idWJibGV3cmFwL2Jsb2IvdjAuMTMuMC9tZXNvbi5idWlsZCNMOTQtTDEwNAo+
IAo+IEZpeGVzOiA0Y2I2MTkzZDJlY2EzOWIxYmQ3OWZmNDg2N2M4NDJmNTA3ZjY5MmI4Cj4gRml4
ZXM6IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9lNzUxM2U0NzMwMDAw
ZTQ2YjEzYmI5Y2YyNTk1NWViZDNlYzVmYjcxLwo+IAo+IFNpZ25lZC1vZmYtYnk6IEZpb25hIEts
dXRlIDxmaW9uYS5rbHV0ZUBnbXguZGU+CgpBY2tlZC1ieTogQWRyaWFuIFBlcmV6IGRlIENhc3Ry
byA8YXBlcmV6QGlnYWxpYS5jb20+Cgo+IC0tLQo+ICBwYWNrYWdlL2J1YmJsZXdyYXAvYnViYmxl
d3JhcC5tayB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvYnViYmxld3JhcC9idWJibGV3cmFwLm1r
IGIvcGFja2FnZS9idWJibGV3cmFwL2J1YmJsZXdyYXAubWsKPiBpbmRleCBkY2MzYzIzZDdjLi5h
NThkN2ZkMTQzIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvYnViYmxld3JhcC9idWJibGV3cmFwLm1r
Cj4gKysrIGIvcGFja2FnZS9idWJibGV3cmFwL2J1YmJsZXdyYXAubWsKPiBAQCAtMTgsNyArMTgs
NyBAQCBkZWZpbmUgQlVCQkxFV1JBUF9MSU5VWF9DT05GSUdfRklYVVBTCj4gIGVuZGVmCj4gIAo+
ICBCVUJCTEVXUkFQX0NPTkZfT1BUUyA9IFwKPiAtCS1EYXNzdW1lX2tlcm5lbD0kKExJTlVYX1ZF
UlNJT05fUFJPQkVEKSBcCj4gKwktRGFzc3VtZV9rZXJuZWw9JChzaGVsbCBlY2hvICQoTElOVVhf
VkVSU0lPTl9QUk9CRUQpIHwgZ3JlcCAtbyAnXlswLTldXCtcLlswLTldXCtcLlswLTldXCsnKSBc
Cj4gIAktRHpzaF9jb21wbGV0aW9uPWRpc2FibGVkIFwKPiAgCS1EbWFuPWRpc2FibGVkIFwKPiAg
CS1EcHl0aG9uPSQoSE9TVF9ESVIpL2Jpbi9weXRob24gXAo+IC0tIAo+IDIuNTUuMAo+IAo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290
IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gCgpDaGVlcnMsCuKAlEFk
cmnDoW4K

--4HTczYQu3f0+rkF3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEIAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCarq06AAKCRCRxVnb5MkS
O9hIAJ9D6xhMOMVGYGoK5YF4eABI369o1wCbBk+Xrsa1RBJWXvBI/WwE64qyAGQ=
=p6tl
-----END PGP SIGNATURE-----

--4HTczYQu3f0+rkF3--

--===============7727351574313376550==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7727351574313376550==--
