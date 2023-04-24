Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F52C7618E
	for <buildroot@archiver.kernel.org>; Mon, 24 Apr 2023 12:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23FE541740;
	Mon, 24 Apr 2023 12:14:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23FE541740
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mEnvK48utifW; Mon, 24 Apr 2023 12:14:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B15841733;
	Mon, 24 Apr 2023 12:14:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B15841733
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 044F11C2AA3
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 12:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D219581C21
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 12:14:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D219581C21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dVGggbb1nuVJ for <buildroot@lists.busybox.net>;
 Mon, 24 Apr 2023 12:14:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B297881C20
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B297881C20
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 12:14:24 +0000 (UTC)
Received: from 91-153-34-68.elisa-laajakaista.fi ([91.153.34.68] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1pqv5K-00Arvu-Cn; Mon, 24 Apr 2023 14:14:22 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id a283dede;
 Mon, 24 Apr 2023 12:14:21 +0000 (UTC)
Date: Mon, 24 Apr 2023 15:14:21 +0300
Message-ID: <20230424151421.GH3960430@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
In-Reply-To: <20230227105838.358916-4-thomas.devoogdt@barco.com>
References: <20230227105838.358916-1-thomas.devoogdt@barco.com>
 <20230227105838.358916-4-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/Xc+xS9NMZjMbArn/QAikYtWwN4AD9U80Wx+jWpsBUY=; b=ke+Afc+ao5VciWKrqUIjAKJXLK
 7z419t0Q+W+h9qlUuyML7AJ8q4stuudxgxKi5+/fhRfNoea22bT52GUtKgXcOAYt3BGGUnWDANjqn
 rQ7Y1kRfvSRb7nPjTWSQQOpkDYQQqSR5A35C32BO0Bw8ZfEDBeUjM/sAahcYBFTK1BvAquo8MuCT/
 oFrKahhWYB+kEasqnQ6WqJWo2QB2tBu+H6oSveY94dkOht2KlC5HOAaQi3hKVpOvjNB0dOxS58Xew
 DbQSJ1Dd5N9M3c/W0X4TYMB1qXIO8dVhqEd6xjv6SgUWWzw/0L4PvuS3CskYUcdnYzLPqRssajRnU
 rHzLF5Zg==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=ke+Afc+a
Subject: Re: [Buildroot] [PATCH v5 4/5] package/libgtk3: re-enable atk-bridge
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
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7735184250760531300=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============7735184250760531300==
Content-Type: multipart/signed; boundary="hVna7eYMv5KroZ6N"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--hVna7eYMv5KroZ6N
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gTW9uLCAyNyBGZWIgMjAyMyAxMTo1ODozNyArMDEwMCBUaG9tYXMgRGV2b29nZHQgPHRob21h
c0BkZXZvb2dkdC5jb20+IHdyb3RlOgo+IFRoZSBhdC1zcGkyLWNvcmUgYW5kIGF0LXNwaTItYXRr
IHdlcmUgbWVyZ2VkLCBhbmQgYXJlIG5vdyBidWlsdCBieSBkZWZhdWx0LAo+IHNvIHRoaXMgcGF0
Y2ggaXMgbm8gbG9uZ2VyIHJlcXVpcmVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBEZXZv
b2dkdCA8dGhvbWFzLmRldm9vZ2R0QGJhcmNvLmNvbT4KClRlc3RlZC1ieTogQWRyaWFuIFBlcmV6
IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+Cgo+IC0tLQo+IHY1OiBhZGRlZCByZS1lbmFi
bGUgYXRrLWJyaWRnZSBwYXRjaCB0byB0aGUgcGFja2FnZS9hdC1zcGkyLWNvcmU6IGJ1bXAgdG8g
dmVyc2lvbiAyLjQ3LjEgZ3JvdXAKPiAtLS0KPiAgcGFja2FnZS9saWJndGszLzAwMDEtZGlzYWJs
ZS1hdGstYnJpZGdlLnBhdGNoIHwgNDEgLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hh
bmdlZCwgNDEgZGVsZXRpb25zKC0pCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xpYmd0
azMvMDAwMS1kaXNhYmxlLWF0ay1icmlkZ2UucGF0Y2gKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9saWJndGszLzAwMDEtZGlzYWJsZS1hdGstYnJpZGdlLnBhdGNoIGIvcGFja2FnZS9saWJndGsz
LzAwMDEtZGlzYWJsZS1hdGstYnJpZGdlLnBhdGNoCj4gZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0
Cj4gaW5kZXggZjNlOWJmZjJiYS4uMDAwMDAwMDAwMAo+IC0tLSBhL3BhY2thZ2UvbGliZ3RrMy8w
MDAxLWRpc2FibGUtYXRrLWJyaWRnZS5wYXRjaAo+ICsrKyAvZGV2L251bGwKPiBAQCAtMSw0MSAr
MCwwIEBACj4gLVJlbW92ZSBhdGstYnJpZGdlIHN1cHBvcnQuCj4gLQo+IC1hdGstYnJpZGdlIGRv
ZXNuJ3Qgc2VlbSB1c2VmdWwgZm9yIG5vdyBpbiBCdWlsZHJvb3QgYW5kIHJlcXVpcmVzIHRvCj4g
LWFkZCB0d28gbmV3IHBhY2thZ2VzIGp1c3QgZm9yIGl0OiBhdC1zcGkyLWNvcmUgYW5kIGF0LXNw
aTItYXRrLgo+IC0KPiAtU2lnbmVkLW9mZi1ieTogSGFkcmllbiBCb3V0dGV2aWxsZSA8aGFkcmll
bi5ib3V0dGV2aWxsZUBnbWFpbC5jb20+Cj4gLQo+IC0tLS0gYS9ndGsvYTExeS9ndGthY2Nlc3Np
YmlsaXR5LmMKPiAtKysrIGIvZ3RrL2ExMXkvZ3RrYWNjZXNzaWJpbGl0eS5jCj4gLUBAIC0zNywx
MCArMzcsNiBAQAo+IC0gI2luY2x1ZGUgPGd0ay9ndGt0b2dnbGVidXR0b24uaD4KPiAtICNpbmNs
dWRlIDxndGsvZ3RrYWNjZXNzaWJsZS5oPgo+IC0KPiAtLSNpZmRlZiBHREtfV0lORE9XSU5HX1gx
MQo+IC0tI2luY2x1ZGUgPGF0ay1icmlkZ2UuaD4KPiAtLSNlbmRpZgo+IC0tCj4gLSBzdGF0aWMg
Z2Jvb2xlYW4gZ2FpbF9mb2N1c193YXRjaGVyICAgICAgKEdTaWduYWxJbnZvY2F0aW9uSGludCAq
aWhpbnQsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGd1aW50
ICAgICAgICAgICAgICAgICAgbl9wYXJhbV92YWx1ZXMsCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IEdWYWx1ZSAgICAgICAgICAqcGFyYW1fdmFsdWVz
LAo+IC1AQCAtOTg4LDkgKzk4NCw1IEBAIF9ndGtfYWNjZXNzaWJpbGl0eV9pbml0ICh2b2lkKQo+
IC0gICBfZ3RrX2FjY2Vzc2liaWxpdHlfb3ZlcnJpZGVfYXRrX3V0aWwgKCk7Cj4gLSAgIGRvX3dp
bmRvd19ldmVudF9pbml0aWFsaXphdGlvbiAoKTsKPiAtCj4gLS0jaWZkZWYgR0RLX1dJTkRPV0lO
R19YMTEKPiAtLSAgYXRrX2JyaWRnZV9hZGFwdG9yX2luaXQgKE5VTEwsIE5VTEwpOwo+IC0tI2Vu
ZGlmCj4gLS0KPiAtICAgYXRrX21pc2NfaW5zdGFuY2UgPSBnX29iamVjdF9uZXcgKEdUS19UWVBF
X01JU0NfSU1QTCwgTlVMTCk7Cj4gLSB9Cj4gLS0tLSBhL21lc29uLmJ1aWxkCj4gLSsrKyBiL21l
c29uLmJ1aWxkCj4gLUBAIC01NjQsNyArNTY0LDcgQEAgaWYgeDExX2VuYWJsZWQKPiAtICAgeGZp
eGVzX2RlcCAgICAgPSBkZXBlbmRlbmN5KCd4Zml4ZXMnLCByZXF1aXJlZDogZmFsc2UpCj4gLSAg
IHhjb21wb3NpdGVfZGVwID0gZGVwZW5kZW5jeSgneGNvbXBvc2l0ZScsIHJlcXVpcmVkOiBmYWxz
ZSkKPiAtICAgZm9udGNvbmZpZ19kZXAgPSBkZXBlbmRlbmN5KCdmb250Y29uZmlnJywgZmFsbGJh
Y2s6IFsnZm9udGNvbmZpZycsICdmb250Y29uZmlnX2RlcCddKQo+IC0tICBhdGticmlkZ2VfZGVw
ICA9IGRlcGVuZGVuY3koJ2F0ay1icmlkZ2UtMi4wJywgdmVyc2lvbjogYXRfc3BpMl9hdGtfcmVx
KQo+IC0rICBhdGticmlkZ2VfZGVwICA9IGRlcGVuZGVuY3koJ2F0ay1icmlkZ2UtMi4wJywgdmVy
c2lvbjogYXRfc3BpMl9hdGtfcmVxLCByZXF1aXJlZDogZmFsc2UpCj4gLSAKPiAtICAgYmFja2Vu
ZF9pbW1vZHVsZXMgKz0gWyd4aW0nXQo+IC0gCj4gLS0gCj4gMi4zOS4yCj4gCj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiAKCkNoZWVycywK4oCUQWRyacOhbgo=

--hVna7eYMv5KroZ6N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZEZynQAKCRCRxVnb5MkS
Oz1TAJ9wD+RyBLzhXmWlIuvlCh16gELNvwCdGB8CoB86gaXP5VLbqLm0gL4mM8E=
=f4WJ
-----END PGP SIGNATURE-----

--hVna7eYMv5KroZ6N--

--===============7735184250760531300==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7735184250760531300==--
