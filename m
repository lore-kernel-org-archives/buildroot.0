Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4903C28B20
	for <buildroot@archiver.kernel.org>; Sun, 30 Mar 2025 20:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E933981E76;
	Sun, 30 Mar 2025 20:04:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xp5DLb2LJZyX; Sun, 30 Mar 2025 20:04:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8009B81E08
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8009B81E08;
	Sun, 30 Mar 2025 20:04:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B488812A
 for <buildroot@buildroot.org>; Sun, 30 Mar 2025 20:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92AF040647
 for <buildroot@buildroot.org>; Sun, 30 Mar 2025 20:04:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kxFZmSkuK5m5 for <buildroot@buildroot.org>;
 Sun, 30 Mar 2025 20:04:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2D53D4050D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D53D4050D
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D53D4050D
 for <buildroot@buildroot.org>; Sun, 30 Mar 2025 20:04:39 +0000 (UTC)
Received: from 91-152-140-108.elisa-laajakaista.fi ([91.152.140.108]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tyytW-008nmH-Pb; Sun, 30 Mar 2025 22:04:34 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id d4b803b8;
 Sun, 30 Mar 2025 20:04:32 +0000 (UTC)
Date: Sun, 30 Mar 2025 23:04:23 +0300
Message-ID: <20250330230423.GB1481340@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Thomas Devoogdt <thomas@devoogdt.com>
In-Reply-To: <20250330142842.2909327-1-thomas@devoogdt.com>
References: <20250330142842.2909327-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IeemUUSlD1ZK8pmYP2yz1eB2zsTlKmP16hDWevcM/0w=; b=oVy1QWMWoU7f3ZrNUwLcLZYOdX
 KNrPMWJMwKNsfF2yOi3LaZV8ZTRdEodURG5arxd6N8QNEV3Uc9eZ/RLVrbiipg0ORTya3flv/Oeil
 ACYcbcQXSgMNyEl4W4Qf8TjK7XSAJVCtYWu+rNLYZwdMjJtdcgBwwwB+zLQLPGkUMpNFQhnJ5i2/S
 2/neniXXrefogTWhMuG1xMNZcLQQaf2/JTYzusuydBoengQG0q0gOCPSiiqV7BjS1CA8+1AnLisih
 1RC7Rmh4D+XiWny+3bBXBQgnPrjwYf8B52ARQJuoExoVwSrHpDdDsfy9PBe/b65e94yoOcd4XjtXB
 NMzuegKg==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=oVy1QWMW
Subject: Re: [Buildroot] [PATCH v1] package/libsoup3: bump to 3.6.5
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
Content-Type: multipart/mixed; boundary="===============8358549956202826912=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============8358549956202826912==
Content-Type: multipart/signed; boundary="PeTkXKtoZl6ev+D0"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--PeTkXKtoZl6ev+D0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGkgVGhvbWFzLCBhbGwsCgpUaGFua3MgZm9yIHRoZSBwYXRjaCwgdGhlIGNoYW5nZXMgbG9vayBn
b29kIHRvIG1lLgoKT24gU3VuLCAzMCBNYXIgMjAyNSAxNjoyODo0MiArMDIwMCBUaG9tYXMgRGV2
b29nZHQgPHRob21hc0BkZXZvb2dkdC5jb20+IHdyb3RlOgoKPiBOZXdzOgo+IC0gaHR0cHM6Ly9k
b3dubG9hZC5nbm9tZS5vcmcvc291cmNlcy9saWJzb3VwLzMuNi9saWJzb3VwLTMuNi4zLm5ld3MK
PiAtIGh0dHBzOi8vZG93bmxvYWQuZ25vbWUub3JnL3NvdXJjZXMvbGlic291cC8zLjYvbGlic291
cC0zLjYuNC5uZXdzCj4gLSBodHRwczovL2Rvd25sb2FkLmdub21lLm9yZy9zb3VyY2VzL2xpYnNv
dXAvMy42L2xpYnNvdXAtMy42LjUubmV3cwo+IAo+IEFsc28gZHJvcCB0aGUga3JiNV9jb25maWcs
IHdoaWNoIHdhcyBkcm9wcGVkIGluIGNvbW1pdAo+IGh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9H
Tk9NRS9saWJzb3VwLy0vY29tbWl0LzEyM2ViMDI5YmYzZmEwOGYzYzQ1Njc4YzBhNDNhZTRiOTMw
ZTY2MzEuCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIERldm9vZ2R0IDx0aG9tYXNAZGV2b29n
ZHQuY29tPgoKUmV2aWV3ZWQtYnk6IEFkcmlhbiBQZXJleiBkZSBDYXN0cm8gPGFwZXJlekBpZ2Fs
aWEuY29tPgoKPiAtLS0KPiAgcGFja2FnZS9saWJzb3VwMy9saWJzb3VwMy5oYXNoIHwgNCArKy0t
Cj4gIHBhY2thZ2UvbGlic291cDMvbGlic291cDMubWsgICB8IDYgKystLS0tCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL2xpYnNvdXAzL2xpYnNvdXAzLmhhc2ggYi9wYWNrYWdlL2xpYnNvdXAzL2xpYnNv
dXAzLmhhc2gKPiBpbmRleCAyM2FmMzQ3OTAzLi4zMmFhNzM4MmZhIDEwMDY0NAo+IC0tLSBhL3Bh
Y2thZ2UvbGlic291cDMvbGlic291cDMuaGFzaAo+ICsrKyBiL3BhY2thZ2UvbGlic291cDMvbGli
c291cDMuaGFzaAo+IEBAIC0xLDQgKzEsNCBAQAo+IC0jIEZyb20gaHR0cHM6Ly9kb3dubG9hZC5n
bm9tZS5vcmcvc291cmNlcy9saWJzb3VwLzMuNi9saWJzb3VwLTMuNi4xLnNoYTI1NnN1bQo+IC1z
aGEyNTYgIGNlYjFmMWFhMmJkZDczYjJjZDgxNTlkMzk5OGM5NmM1NWVmMDk3ZWYxNWU0YjRmMzYw
MjkyMDlmYTE4YWY4MzggIGxpYnNvdXAtMy42LjEudGFyLnh6Cj4gKyMgRnJvbSBodHRwczovL2Rv
d25sb2FkLmdub21lLm9yZy9zb3VyY2VzL2xpYnNvdXAvMy42L2xpYnNvdXAtMy42LjUuc2hhMjU2
c3VtCj4gK3NoYTI1NiAgNjg5MTc2NWFhYzNlOTQ5MDE3OTQ1YzNlYWViZDhjYzgyMTZkZjc3MjQ1
NmRjOWY0NjA5NzZmYmRiN2FkYTIzNCAgbGlic291cC0zLjYuNS50YXIueHoKPiAgIyBMb2NhbGx5
IGNhbGN1bGF0ZWQKPiAgc2hhMjU2ICBiNzk5MzIyNTEwNGQ5MGRkZDgwMjRmZDgzOGZhZjMwMGJl
YTVlODNkOTEyMDNlYWI5OGUyOTUxMmFjZWJkNjljICBDT1BZSU5HCj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvbGlic291cDMvbGlic291cDMubWsgYi9wYWNrYWdlL2xpYnNvdXAzL2xpYnNvdXAzLm1r
Cj4gaW5kZXggZjJmOTZjMmRlZi4uMGRiNTg3YTkzYSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xp
YnNvdXAzL2xpYnNvdXAzLm1rCj4gKysrIGIvcGFja2FnZS9saWJzb3VwMy9saWJzb3VwMy5tawo+
IEBAIC01LDcgKzUsNyBAQAo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAgTElCU09V
UDNfVkVSU0lPTl9NQUpPUiA9IDMuNgo+IC1MSUJTT1VQM19WRVJTSU9OID0gJChMSUJTT1VQM19W
RVJTSU9OX01BSk9SKS4xCj4gK0xJQlNPVVAzX1ZFUlNJT04gPSAkKExJQlNPVVAzX1ZFUlNJT05f
TUFKT1IpLjUKPiAgTElCU09VUDNfU09VUkNFID0gbGlic291cC0kKExJQlNPVVAzX1ZFUlNJT04p
LnRhci54ego+ICBMSUJTT1VQM19TSVRFID0gaHR0cHM6Ly9kb3dubG9hZC5nbm9tZS5vcmcvc291
cmNlcy9saWJzb3VwLyQoTElCU09VUDNfVkVSU0lPTl9NQUpPUikKPiAgTElCU09VUDNfTElDRU5T
RSA9IExHUEwtMi4wKwo+IEBAIC00NSw5ICs0NSw3IEBAIExJQlNPVVAzX0NPTkZfT1BUUyArPSAt
RGludHJvc3BlY3Rpb249ZGlzYWJsZWQgLUR2YXBpPWRpc2FibGVkCj4gIGVuZGlmCj4gIAo+ICBp
ZmVxICgkKEJSMl9QQUNLQUdFX0xJQktSQjUpLHkpCj4gLUxJQlNPVVAzX0NPTkZfT1BUUyArPSBc
Cj4gLQktRGdzc2FwaT1lbmFibGVkIFwKPiAtCS1Ea3JiNV9jb25maWc9JChTVEFHSU5HX0RJUikv
dXNyL2Jpbi9rcmI1LWNvbmZpZwo+ICtMSUJTT1VQM19DT05GX09QVFMgKz0gLURnc3NhcGk9ZW5h
YmxlZAo+ICBMSUJTT1VQM19ERVBFTkRFTkNJRVMgKz0gbGlia3JiNQo+ICBlbHNlCj4gIExJQlNP
VVAzX0NPTkZfT1BUUyArPSAtRGdzc2FwaT1kaXNhYmxlZAo+IC0tIAo+IDIuNDMuMAo+IAo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290
IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gCgpDaGVlcnMsCuKAlEFk
cmnDoW4K

--PeTkXKtoZl6ev+D0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZ+mjxwAKCRCRxVnb5MkS
O9v8AJ9Ony7P699Ylsc4EQCKd1us+3/14wCdHzI1zVvQdjbyHwUNBBbpzQX1UCU=
=O6Wt
-----END PGP SIGNATURE-----

--PeTkXKtoZl6ev+D0--

--===============8358549956202826912==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8358549956202826912==--
