Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18AC9C77B71
	for <buildroot@archiver.kernel.org>; Thu, 13 Apr 2023 14:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FF6F400C7;
	Thu, 13 Apr 2023 14:14:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FF6F400C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AGdqzG0xOrA9; Thu, 13 Apr 2023 14:14:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 892EE40589;
	Thu, 13 Apr 2023 14:14:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 892EE40589
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 089731BF2B1
 for <buildroot@lists.busybox.net>; Thu, 13 Apr 2023 14:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4E344086A
 for <buildroot@lists.busybox.net>; Thu, 13 Apr 2023 14:14:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4E344086A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s1SnSMAYGp7w for <buildroot@lists.busybox.net>;
 Thu, 13 Apr 2023 14:13:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BE184071E
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3BE184071E
 for <buildroot@buildroot.org>; Thu, 13 Apr 2023 14:13:58 +0000 (UTC)
Received: from 91-153-34-68.elisa-laajakaista.fi ([91.153.34.68] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1pmxhx-00HYNs-Hx; Thu, 13 Apr 2023 16:13:53 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 0f23a74a;
 Thu, 13 Apr 2023 14:13:51 +0000 (UTC)
Date: Thu, 13 Apr 2023 17:13:47 +0300
Message-ID: <20230413171347.GB3097844@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Stefan Ott via buildroot <buildroot@buildroot.org>
In-Reply-To: <20230412222640.109345-1-stefan@ott.net>
References: <20230412222640.109345-1-stefan@ott.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I6NyUTy39Xh/1pmeSJB/ihli7VwO0kUPgvsmSbYZJKg=; b=JpNE3WvB629V+G4Qshf7tVqhFj
 kni0KTZD7NkFk7Medw/G8egxcs5C+GwbTdO2xU0RuFXAvoZDZ3jxyEg7lLJRQhN7cJ2fbXJGRayKn
 Q/WN5QNWSX6G8kH2ggHh8Dtll3/uoAA/CcXiG88/cnKro39fZkfQZSlNd5eWSxyWRTJxNLDANQa5p
 WvmcWV/AQESCARpMgFOu72M3fhR6XMRP+j2i76m1Ds3Wt5kfj/FBjmXc3nbg8BW9pviU8omPLF9sT
 iIYVfhQbb7Y+ypdQVSrR24tm6AvJQLH5WU264xpAIKU1DNysEGP3FVnZiDxFU4nw3NKLt5qvxb30T
 1vL299zw==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=JpNE3WvB
Subject: Re: [Buildroot] [PATCH 1/1] package/libgtk3: Remove atk-bridge from
 .pc file
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
Cc: Stefan Ott <stefan@ott.net>, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7541133731979163349=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============7541133731979163349==
Content-Type: multipart/signed; boundary="tgjZXrQAEqAAb8tL"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--tgjZXrQAEqAAb8tL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGVsbG8sCgpPbiBUaHUsIDEzIEFwciAyMDIzIDAwOjI2OjQwICswMjAwIFN0ZWZhbiBPdHQgdmlh
IGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgo+IFRoZSBkZXBlbmRl
bmN5IGlzIHN1cHBvc2VkIHRvIGJlIG9wdGlvbmFsIGJ1dCBpdCBhbHdheXMgZW5kcyB1cCBpbiB0
aGUKPiAucGMgZmlsZS4gVGhpcyBsZWFkcyB0byBpc3N1ZXMgd2hlbiBidWlsZGluZyBwYWNrYWdl
cyB0aGF0IGRlcGVuZCBvbgo+IGxpYmd0azMgYW5kIGFyZSB1bmFibGUgdG8gZmluZCBhdGstYnJp
ZGdlOgo+IAo+ID4gb3V0cHV0L2J1aWxkL2djci0zLjQwLjAvbWVzb24uYnVpbGQ6NTc6MjogRVJS
T1I6IERlcGVuZGVuY3kgbG9va3VwIGZvciBndGsrLTMuMCB3aXRoIG1ldGhvZCAncGtnY29uZmln
JyBmYWlsZWQ6IENvdWxkIG5vdCBnZW5lcmF0ZSBjYXJncyBmb3IgZ3RrKy0zLjA6Cj4gPiBQYWNr
YWdlIGF0ay1icmlkZ2UtMi4wIHdhcyBub3QgZm91bmQgaW4gdGhlIHBrZy1jb25maWcgc2VhcmNo
IHBhdGguCj4gPiBQZXJoYXBzIHlvdSBzaG91bGQgYWRkIHRoZSBkaXJlY3RvcnkgY29udGFpbmlu
ZyBgYXRrLWJyaWRnZS0yLjAucGMnCj4gPiB0byB0aGUgUEtHX0NPTkZJR19QQVRIIGVudmlyb25t
ZW50IHZhcmlhYmxlCj4gPiBQYWNrYWdlICdhdGstYnJpZGdlLTIuMCcsIHJlcXVpcmVkIGJ5ICdn
dGsrLTMuMCcsIG5vdCBmb3VuZAo+IAo+IFRoaXMgY2hhbmdlIG1vZGlmaWVzIHRoZSBvcmlnaW5h
bCBwYXRjaCBzbyB0aGF0IHRoZSBkZXBlbmRlbmN5IGlzIG9ubHkKPiBhZGRlZCB0byB0aGUgLnBj
IGZpbGUgaWYgYXRrLWJyaWRnZSBpcyBwcmVzZW50LgoKVGhpcyBmaXhlcyBidWlsZGluZyBXZWJL
aXRHVEsgZm9yIFgxMS4KCkNvaW5jaWRlbnRhbGx5IEkgd2FzIGp1c3QgYSBjb3VwbGUgb2YgZGF5
cyBhZ28gc3RhcnRpbmcgdG8gd29yayBvbiB0aGUgdXBkYXRlCnRvIDIuNDAueCwgYW5kIG5vdGlj
ZWQgdGhhdCB0aGUgYnVpbGQgcmVjaXBlIGVuZm9yY2VzIChYMTEgeG9yIFdheWxhbmQpCnN1cHBv
cnQgaW4gV2ViS2l0R1RLLCBidXQgaXQgaXMgcG9zc2libGUgdG8gYnVpbGQgc3VwcG9ydCBmb3Ig
Ym90aCBhdCB0aGUgc2FtZQp0aW1lICh3aGljaCBpcyB3aGF0IG1vc3QgTGludXggZGlzdHJpYnV0
aW9ucyBkbykuIFdoaWxlIHRlc3RpbmcgdGhlIGRpZmZlcmVudApidWlsZCBvcHRpb25zIEkgcmFu
IGludG8gcGtnLWNvbmZpZyBjb21wbGFpbmluZyBhYm91dCB0aGUgbWlzc2luZwphdGstYnJpZGdl
LTIuMCBtb2R1bGUsIHdoaWNoIGluIHR1cm4gbWFkZSBDTWFrZSBza2lwIHBpY2tpbmcgdGhlIHBy
ZXByb2Nlc3NvcgpmbGFncyBwcm9wZXJseSBhbmQgdGhlbiBXZWJLaXQgZmFpbGluZyB0byBidWls
ZC4KCj4gU2lnbmVkLW9mZi1ieTogU3RlZmFuIE90dCA8c3RlZmFuQG90dC5uZXQ+CgpUZXN0ZWQt
Ynk6IEFkcmlhbiBQZXJleiBkZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPgpSZXZpZXdlZC1i
eTogQWRyaWFuIFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+Cgo+IC0tLQo+ICBw
YWNrYWdlL2xpYmd0azMvMDAwMS1kaXNhYmxlLWF0ay1icmlkZ2UucGF0Y2ggfCAxMSArKysrKysr
KysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL2xpYmd0azMvMDAwMS1kaXNhYmxlLWF0ay1icmlkZ2UucGF0Y2ggYi9wYWNrYWdl
L2xpYmd0azMvMDAwMS1kaXNhYmxlLWF0ay1icmlkZ2UucGF0Y2gKPiBpbmRleCBmM2U5YmZmMmJh
Li44MTI3Yjk3MjUzIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGliZ3RrMy8wMDAxLWRpc2FibGUt
YXRrLWJyaWRnZS5wYXRjaAo+ICsrKyBiL3BhY2thZ2UvbGliZ3RrMy8wMDAxLWRpc2FibGUtYXRr
LWJyaWRnZS5wYXRjaAo+IEBAIC0zOSwzICszOSwxNCBAQCBTaWduZWQtb2ZmLWJ5OiBIYWRyaWVu
IEJvdXR0ZXZpbGxlIDxoYWRyaWVuLmJvdXR0ZXZpbGxlQGdtYWlsLmNvbT4KPiAgIAo+ICAgICBi
YWNrZW5kX2ltbW9kdWxlcyArPSBbJ3hpbSddCj4gICAKPiArQEAgLTU4OCw3ICs1ODgsOSBAQAo+
ICsgICAgIHgxMV9wa2dzICs9IFsneGRhbWFnZSddCj4gKyAgIGVuZGlmCj4gKwo+ICstICBhdGtf
cGtncyArPSBbJ2F0ay1icmlkZ2UtMi4wJ10KPiArKyAgaWYgYXRrYnJpZGdlX2RlcC5mb3VuZCgp
Cj4gKysgICAgYXRrX3BrZ3MgKz0gWydhdGstYnJpZGdlLTIuMCddCj4gKysgIGVuZGlmCj4gKwo+
ICsgICBjZGF0YS5zZXQoJ0hBVkVfWERBTUFHRScsIHhkYW1hZ2VfZGVwLmZvdW5kKCkgPyAxIDog
ZmFsc2UpCj4gKyAgIGNkYXRhLnNldCgnSEFWRV9YQ1VSU09SJywgeGN1cnNvcl9kZXAuZm91bmQo
KSA/IDEgOiBmYWxzZSkKPiAtLSAKPiAyLjQwLjAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo+IAoKQ2hlZXJzLArigJRBZHJpw6FuCg==

--tgjZXrQAEqAAb8tL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZDgOGwAKCRCRxVnb5MkS
O8cOAJ4pc5fhkz4mGk1k03VPaZz3W4TWvQCdHI4XqU++36YzWC/fr2TT2UzGNq0=
=fYFs
-----END PGP SIGNATURE-----

--tgjZXrQAEqAAb8tL--

--===============7541133731979163349==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7541133731979163349==--
