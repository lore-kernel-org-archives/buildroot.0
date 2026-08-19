Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A52FC5DF81
	for <buildroot@archiver.kernel.org>; Wed, 19 Aug 2026 14:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5ABB9607A1;
	Wed, 19 Aug 2026 14:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qMfYVGvifV3l; Wed, 19 Aug 2026 14:35:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787150155;
	bh=U77RYl+YDYP0VB1x1eIGx8nm07z5L2ythWy5uXktrYk=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R1rrWjFqnGqkRhM1xZPPEyTWmvhfirXnslGvNsHXh7CV/cOMpTQosWxuB9DpC4Mx/
	 awf2oCR4aCj4H+l3q/LBAlGPSMJi3FsyjqOAQcxN8gogUpkY9xxsJR4DG4V7llyH2Q
	 lUGZzJnppELuZffczN1S80iz6phZRgxSpRdFcqbL77SPxmmS8Cf9jyS3Kbdr5bn16F
	 60DbNrjGEiJvuF4GOCIY/7Twx9LhjEm8ZxbgSpYiGEnhI+8hGQACAm3mWm5aCN9Et8
	 CQir5bak1D79oPl7qX5YqV0VULSvi07tX/rBTHVlqcEFYD8/TDAyWSqQV6RaeQjP0p
	 m97j4OvuJMXeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E82860797;
	Wed, 19 Aug 2026 14:35:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 062132FD
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 14:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E00DE6071F
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 14:35:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G5P41zCEEuLM for <buildroot@buildroot.org>;
 Wed, 19 Aug 2026 14:35:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=KISct6x8
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51DA160743
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 14:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:Subject:Cc:To:From:Message-ID:Date:
 From:Reply-To; bh=+udXKHBGSJ4PPBzHPTCfuEXhIwz51MeV3HiOYMfCbaw=; b=KISct6x8NBf
 KI3MKXIWlD5lQEG1rPwfyoLt2byKSp1YF+nK8x4THoNsrIh7xEzRvlEHOhL4ucvLCfXLzR1UhfItE
 bH6gW7ryvPxyuHjwdAfCImbvX2bSkcvV1NQs/9PQrUSW2A8YpYwT+eWmWvGxsd1u3uLqdQqFcvWC3
 ZrB33spaHfoqYm/eyKZKchZDgqzYBEqeNHkVZtWWuOD70/zoiMDVX9XJqvsBiPlxWA295objlV8I/
 mOHKiBoRpAWo6C2eIDQEHw8TjmHywlHTzuyVPnTaG6CiUxJi9nJBjg+zlsWrh4jONJAJZfA1cwSHh
 01kTLDNz25O/I4iuFfdSb2g==;
Received: from 68.171.94.90.dynamic.jazztel.es ([90.94.171.68] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wwhOM-0068vQ-PG; Wed, 19 Aug 2026 16:35:46 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 287b4423;
 Wed, 19 Aug 2026 14:35:46 +0000 (UTC)
Date: Wed, 19 Aug 2026 16:35:41 +0200
Message-ID: <20260819163541.GF771367@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Thomas Devoogdt <thomas@devoogdt.com>
In-Reply-To: <20260819123811.420995-1-thomas@devoogdt.com>
References: <20260819123811.420995-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/webkitgtk: fix wrong config option
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
Content-Type: multipart/mixed; boundary="===============5364092821153067802=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============5364092821153067802==
Content-Type: multipart/signed; boundary="o9tRoRCNCWOj21td"; micalg="pgp-sha256"; protocol="application/pgp-signature"


--o9tRoRCNCWOj21td
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGkgVGhvbWFzLAoKR29vZCBjYXRjaCEKCk9uIFdlZCwgMTkgQXVnIDIwMjYgMTQ6Mzg6MTEgKzAy
MDAgVGhvbWFzIERldm9vZ2R0IDx0aG9tYXNAZGV2b29nZHQuY29tPiB3cm90ZToKPiBDb21taXQg
NzEzZDYzYiAicGFja2FnZS93ZWJraXRndGs6IGFkZCBvcHRpb24gdG8gZW5hYmxlIE1pbmlCcm93
c2VyIiwKPiBhZGRlZCBzdXBwb3J0IHRvIHNlbGVjdCBCUjJfUEFDS0FHRV9XRUJLSVRHVEtfTUlO
SUJST1dTRVIsIGJ1dCBmb3Jnb3QKPiB0byBkcm9wIHRoZSBkZWZhdWx0IC1ERU5BQkxFX01JTklC
Uk9XU0VSPU9OIGVudHJ5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBEZXZvb2dkdCA8dGhv
bWFzQGRldm9vZ2R0LmNvbT4KCkFja2VkLUJ5OiBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxhcGVy
ZXpAaWdhbGlhLmNvbT4KCj4gLS0tCj4gIHBhY2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5tayB8
IDEgLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL3dlYmtpdGd0ay93ZWJraXRndGsubWsgYi9wYWNrYWdlL3dlYmtpdGd0ay93ZWJraXRn
dGsubWsKPiBpbmRleCA2Y2FiMmM2YTI0Ny4uZWU5ZTcwN2NiNTUgMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS93ZWJraXRndGsvd2Via2l0Z3RrLm1rCj4gKysrIGIvcGFja2FnZS93ZWJraXRndGsvd2Vi
a2l0Z3RrLm1rCj4gQEAgLTI3LDcgKzI3LDYgQEAgV0VCS0lUR1RLX0NPTkZfT1BUUyA9IFwKPiAg
CS1ERU5BQkxFX0FQSV9URVNUUz1PRkYgXAo+ICAJLURFTkFCTEVfRE9DVU1FTlRBVElPTj1PRkYg
XAo+ICAJLURFTkFCTEVfR0VPTE9DQVRJT049T0ZGIFwKPiAtCS1ERU5BQkxFX01JTklCUk9XU0VS
PU9OIFwKPiAgCS1ERU5BQkxFX1NQRUxMQ0hFQ0s9T04gXAo+ICAJLURFTkFCTEVfV0VCX1JUQz1P
RkYgXAo+ICAJLURQT1JUPUdUSyBcCj4gLS0gCj4gMi40My4wCj4gCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0
Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiAKCkNoZWVycywK4oCUQWRyacOhbgo=

--o9tRoRCNCWOj21td
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEIAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCaoW/PQAKCRCRxVnb5MkS
O+luAJ9xrMu7nZZhI3jtM1AIK7DJF78/qACfcc53Yo8NqZzLMCjdobPhCou2TH4=
=DsES
-----END PGP SIGNATURE-----

--o9tRoRCNCWOj21td--

--===============5364092821153067802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5364092821153067802==--
