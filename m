Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DE5E9A02C
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 23:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B00B409FB;
	Wed, 18 Feb 2026 23:13:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aQZER5zp0Kcj; Wed, 18 Feb 2026 23:13:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CB47408F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771456384;
	bh=nP+MFWldaPp6omBRaVwva8MGDYxSdq2TvPgBKRGjVZA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MPLt8aV19nCRn+FdnROCM6MjsAPzBhu8xrfcXgrpNgyyWeYZp6H5baGzKqaMqgkRR
	 RRUziwNTR+wFPVIDnz+VGSJbeSKD2xQbODaHPiaJkudsuOqsiZIPwjM3MULu/+KsaF
	 8nxV8ScV85rhHdIvEM2Hb1GvhBaKfSxneUwJljTgFiVJkcG4QhQwAL1OfWowR73brH
	 aSrfB/Bo9HE62qx7+q6rSTzkUM798+BOMYN+IisOYpFJ9vsDWh73N34Wm6me7eWRDA
	 4zMcPoXkI30q21zCfcm5odPIDfGczPf5/KD2B77Y+q4qrONjpSbBFgkt4J5JOBwLQR
	 Ckkf+3O273E1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CB47408F1;
	Wed, 18 Feb 2026 23:13:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D4FE206
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 23:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DAC160B3A
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 23:13:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e1RHpGus3PVw for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 23:13:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C6DB760B38
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6DB760B38
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C6DB760B38
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 23:12:59 +0000 (UTC)
Received: from 81-197-150-176.elisa-laajakaista.fi ([81.197.150.176]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vsqEn-002FJd-8U; Wed, 18 Feb 2026 23:41:41 +0100
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 9b52cc17;
 Wed, 18 Feb 2026 22:41:40 +0000 (UTC)
Date: Thu, 19 Feb 2026 00:41:40 +0200
Message-ID: <20260219004140.GE212936@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260218195812.2983207-2-bernd@kuhls.net>
References: <20260218195812.2983207-1-bernd@kuhls.net>
 <20260218195812.2983207-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LGyP4vm/BkuGO4aXEttugtY0qxju4cMxUson/zhdU34=; b=U8LTpGfNVmMhoosGR0FOyyNzZm
 kdt859LBkYWS/pM7ryvHlBQdO1aWVWoQphCP2pnunM52CzziexjHQqQKMdgb/Y9RdlULiCSHfRShU
 mTzqLJs+FA/AEAtA4mG86PheOEqa8ofdy9hKVGII1OAOMfbXuaQdbMg8aMnAWIkawTDO/heDk8zhV
 /tRRvJhGNCD5aOK+/tKr3oCqoNjK3c8HKyczBovo0JnW4cX7TjnymnbJHWTYnFZQIDSTZJI+o+2o8
 bEZQg9ctnNEIDcmjWPfI/IPaeRgL03Bwf+UhEPjSXh2RZYQaVnKICuw5ThJmsNIMT5sHpHEKFFLQ9
 ZReooeRQ==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=U8LTpGfN
Subject: Re: [Buildroot] [PATCH 2/2] package/wpewebkit: security bump to
 version 2.50.5
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
Content-Type: multipart/mixed; boundary="===============8932426612670283364=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============8932426612670283364==
Content-Type: multipart/signed; boundary="Tml5528kkRXm3tiC"; micalg="pgp-sha256"; protocol="application/pgp-signature"


--Tml5528kkRXm3tiC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gV2VkLCAxOCBGZWIgMjAyNiAyMDo1ODoxMiArMDEwMCBCZXJuZCBLdWhscyA8YmVybmRAa3Vo
bHMubmV0PiB3cm90ZToKPiBGcm9tOiBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxhcGVyZXpAaWdh
bGlhLmNvbT4KPiAKPiBUaGlzIHVwZGF0ZXMgV1BFIFdlYktpdCB0byB0aGUgMi41MCBzdGFibGUg
c2VyaWVzLgo+IFdQRSBXZWJLaXQgMi41MCBoaWdobGlnaHRzIGFuZCAyLjUwLlsxLTVdIHJlbGVh
c2Ugbm90ZXM6Cj4gCj4gLSBodHRwczovL3dwZXdlYmtpdC5vcmcvcmVsZWFzZS93cGV3ZWJraXQt
Mi41MC4wLmh0bWwKPiAtIGh0dHBzOi8vd3Bld2Via2l0Lm9yZy9yZWxlYXNlL3dwZXdlYmtpdC0y
LjUwLjEuaHRtbAo+IC0gaHR0cHM6Ly93cGV3ZWJraXQub3JnL3JlbGVhc2Uvd3Bld2Via2l0LTIu
NTAuMi5odG1sCj4gLSBodHRwczovL3dwZXdlYmtpdC5vcmcvcmVsZWFzZS93cGV3ZWJraXQtMi41
MC4zLmh0bWwKPiAtIGh0dHBzOi8vd3Bld2Via2l0Lm9yZy9yZWxlYXNlL3dwZXdlYmtpdC0yLjUw
LjQuaHRtbAo+IC0gaHR0cHM6Ly93cGV3ZWJraXQub3JnL3JlbGVhc2Uvd3Bld2Via2l0LTIuNTAu
NS5odG1sCj4gCj4gRml4ZXMgdGhlIGZvbGxvd2luZyBzZWN1cml0eSBpc3N1ZXM6Cj4gCj4gLSBG
cm9tIGh0dHBzOi8vd3Bld2Via2l0Lm9yZy9zZWN1cml0eS9XU0EtMjAyNS0wMDA3Lmh0bWwKPiAg
IENWRS0yMDI1LTQzMzQzCj4gCj4gLSBGcm9tIGh0dHBzOi8vd3Bld2Via2l0Lm9yZy9zZWN1cml0
eS9XU0EtMjAyNS0wMDA2Lmh0bWwKPiAgIENWRS0yMDI1LTQzMjcyLCBDVkUtMjAyNS00MzM0Miwg
Q1ZFLTIwMjUtNDMzNTYsIENWRS0yMDI1LTQzMzY4Cj4gCj4gLSBGcm9tIGh0dHBzOi8vd3Bld2Vi
a2l0Lm9yZy9zZWN1cml0eS9XU0EtMjAyNS0wMDA1Lmh0bWwKPiAgIENWRS0yMDI1LTMxMjczLCBD
VkUtMjAyNS0zMTI3OCwgQ1ZFLTIwMjUtNDMyMTEsIENWRS0yMDI1LTQzMjEyLAo+ICAgQ1ZFLTIw
MjUtNDMyMTYsIENWRS0yMDI1LTQzMjI3LCBDVkUtMjAyNS00MzIyOCwgQ1ZFLTIwMjUtNDMyNDAs
Cj4gICBDVkUtMjAyNS00MzI2NSwgQ1ZFLTIwMjUtNjU1OAo+IAo+IFJlbW92ZWQgcGF0Y2ggMDAw
MSB3aGljaCBpcyBpbmNsdWRlZCBpbiB0aGlzIHJlbGVhc2UuCj4gCj4gU2lnbmVkLW9mZi1ieTog
QWRyaWFuIFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+Cj4gW0Jlcm5kOiBidW1w
ZWQgdG8gMi41MC41LCByZW1vdmVkIHR3byBwYXRjaGVzIG9yaWdpbmFsbHkgYWRkZWQgYnkgQWRy
aWFuCj4gIHdoaWNoIHdlcmUgYWRkZWQgdG8gdXBzdHJlYW0gdmVyc2lvbiAyLjUwLjJdCj4gU2ln
bmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KCkFja2VkLWJ5OiBBZHJp
YW4gUGVyZXogZGUgQ2FzdHJvIDxhcGVyZXpAaWdhbGlhLmNvbT4KCj4gLS0tCj4gIC4uLmQtd2l0
aC1VU0VfU0tJQV9PUEVOVFlQRV9TVkctT04tYW5kLS5wYXRjaCB8IDQ0IC0tLS0tLS0tLS0tLS0t
LS0tLS0KPiAgcGFja2FnZS93cGV3ZWJraXQvd3Bld2Via2l0Lmhhc2ggICAgICAgICAgICAgIHwg
IDggKystLQo+ICBwYWNrYWdlL3dwZXdlYmtpdC93cGV3ZWJraXQubWsgICAgICAgICAgICAgICAg
fCAgMiArLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNDkgZGVsZXRpb25z
KC0pCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3dwZXdlYmtpdC8wMDAxLVdQRS1GaXgt
dGhlLWJ1aWxkLXdpdGgtVVNFX1NLSUFfT1BFTlRZUEVfU1ZHLU9OLWFuZC0ucGF0Y2gKPiAKPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS93cGV3ZWJraXQvMDAwMS1XUEUtRml4LXRoZS1idWlsZC13aXRo
LVVTRV9TS0lBX09QRU5UWVBFX1NWRy1PTi1hbmQtLnBhdGNoIGIvcGFja2FnZS93cGV3ZWJraXQv
MDAwMS1XUEUtRml4LXRoZS1idWlsZC13aXRoLVVTRV9TS0lBX09QRU5UWVBFX1NWRy1PTi1hbmQt
LnBhdGNoCj4gZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggODQzMjU0M2UwNy4uMDAw
MDAwMDAwMAo+IC0tLSBhL3BhY2thZ2Uvd3Bld2Via2l0LzAwMDEtV1BFLUZpeC10aGUtYnVpbGQt
d2l0aC1VU0VfU0tJQV9PUEVOVFlQRV9TVkctT04tYW5kLS5wYXRjaAo+ICsrKyAvZGV2L251bGwK
PiBAQCAtMSw0NCArMCwwIEBACj4gLUZyb20gOTRhY2QxY2UwZmYyODYwYjE5ZjIyYWIyZDM4NmQ3
NzExYzk2OTliNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiAtRnJvbTogQWRyaWFuIFBlcmV6
IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+Cj4gLURhdGU6IFR1ZSwgOCBKdWwgMjAyNSAy
MTo0Njo0NCArMDMwMAo+IC1TdWJqZWN0OiBbUEFUQ0hdIFtXUEVdIEZpeCB0aGUgYnVpbGQgd2l0
aCBVU0VfU0tJQV9PUEVOVFlQRV9TVkc9T04gYW5kCj4gLSBVU0VfU1lTUFJPRl9DQVBUVVJFPU9G
Rgo+IC0KPiAtVW5yZXZpZXdlZCBidWlsZCBmaXguCj4gLQo+IC1XaGVuIGJhY2twb3J0aW5nIDI4
Nzg1OUBtYWluIHRoZSAjaW5jbHVkZSBmb3IgdGhlIG5lZWRlZCBTa2lhIGhlYWRlcgo+IC1zbGlw
cGVkIGluc2lkZSBhbiBVU0UoU1lTUFJPRl9DQVBUVVJFKSBndWFyZC4gVGhpcyBtb3ZlcyB0aGUg
Z3VhcmRzCj4gLWFuZCAjaW5jbHVkZSBzdGF0ZW1lbnRzIHRvIHRoZWlyIGNvcnJlY3QgcGxhY2Vz
Lgo+IC0KPiAtKiBTb3VyY2UvV2ViS2l0L1dlYlByb2Nlc3Mvd3BlL1dlYlByb2Nlc3NNYWluV1BF
LmNwcDoKPiAtCj4gLUNhbm9uaWNhbCBsaW5rOiBodHRwczovL2NvbW1pdHMud2Via2l0Lm9yZy8y
OTA5NDUuMjczQHdlYmtpdGdsaWIvMi40OAo+IC0KPiAtU2lnbmVkLW9mZi1ieTogQWRyaWFuIFBl
cmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+Cj4gLVVwc3RyZWFtOiBodHRwczovL2dp
dGh1Yi5jb20vV2ViS2l0L1dlYktpdC9jb21taXQvOTQzZDA1ZjBjOWIwM2MwNTNhNDU2YzkwYzJh
ODgxN2MxZjY3OTcxMQo+IC0tLS0KPiAtIFNvdXJjZS9XZWJLaXQvV2ViUHJvY2Vzcy93cGUvV2Vi
UHJvY2Vzc01haW5XUEUuY3BwIHwgNSArKystLQo+IC0gMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAtCj4gLWRpZmYgLS1naXQgYS9Tb3VyY2UvV2ViS2l0
L1dlYlByb2Nlc3Mvd3BlL1dlYlByb2Nlc3NNYWluV1BFLmNwcCBiL1NvdXJjZS9XZWJLaXQvV2Vi
UHJvY2Vzcy93cGUvV2ViUHJvY2Vzc01haW5XUEUuY3BwCj4gLWluZGV4IGEwNmUzM2ZkMDRmOC4u
NWZiMjQ1Y2UwYjY2IDEwMDY0NAo+IC0tLS0gYS9Tb3VyY2UvV2ViS2l0L1dlYlByb2Nlc3Mvd3Bl
L1dlYlByb2Nlc3NNYWluV1BFLmNwcAo+IC0rKysgYi9Tb3VyY2UvV2ViS2l0L1dlYlByb2Nlc3Mv
d3BlL1dlYlByb2Nlc3NNYWluV1BFLmNwcAo+IC1AQCAtNDMsMTEgKzQzLDEyIEBACj4gLSAjaW5j
bHVkZSA8c2tpYS9jb3JlL1NrR3JhcGhpY3MuaD4KPiAtICNlbmRpZgo+IC0gCj4gLS0jaWYgVVNF
KFNZU1BST0ZfQ0FQVFVSRSkKPiAtLSNpbmNsdWRlIDx3dGYvU3lzdGVtVHJhY2luZy5oPgo+IC0g
I2lmIFVTRShTS0lBX09QRU5UWVBFX1NWRykKPiAtICNpbmNsdWRlIDxza2lhL21vZHVsZXMvc3Zn
L1NrU1ZHT3BlblR5cGVTVkdEZWNvZGVyLmg+Cj4gLSAjZW5kaWYKPiAtKwo+IC0rI2lmIFVTRShT
WVNQUk9GX0NBUFRVUkUpCj4gLSsjaW5jbHVkZSA8d3RmL1N5c3RlbVRyYWNpbmcuaD4KPiAtICNl
bmRpZgo+IC0gCj4gLSBuYW1lc3BhY2UgV2ViS2l0IHsKPiAtLS0gCj4gLTIuNTAuMQo+IC0KPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS93cGV3ZWJraXQvd3Bld2Via2l0Lmhhc2ggYi9wYWNrYWdlL3dw
ZXdlYmtpdC93cGV3ZWJraXQuaGFzaAo+IGluZGV4IDMzMmZkOWRlYWEuLjYwYTUxYzNlNDkgMTAw
NjQ0Cj4gLS0tIGEvcGFja2FnZS93cGV3ZWJraXQvd3Bld2Via2l0Lmhhc2gKPiArKysgYi9wYWNr
YWdlL3dwZXdlYmtpdC93cGV3ZWJraXQuaGFzaAo+IEBAIC0xLDcgKzEsNyBAQAo+IC0jIEZyb20g
aHR0cHM6Ly93cGV3ZWJraXQub3JnL3JlbGVhc2VzL3dwZXdlYmtpdC0yLjQ4LjMudGFyLnh6LnN1
bXMKPiAtbWQ1ICAyZDNiN2ZhM2M2Mjg4NjU0NmY5MThmY2MyODljYWJiZSAgd3Bld2Via2l0LTIu
NDguMy50YXIueHoKPiAtc2hhMSAgOGE5MGI5ZmY4ODA5Yzk5YzMwNmRlZmMxYTA4ZTUwYTMxYTA5
YzU5MCAgd3Bld2Via2l0LTIuNDguMy50YXIueHoKPiAtc2hhMjU2ICA4MDc1NzFmMDdlODc4MjNi
OGZiNzk1NjQ2OTJjOWIxZWY4MWVlNjJlZGJmNTEzNDVhMTViZDBlN2UxZjJlMDdiICB3cGV3ZWJr
aXQtMi40OC4zLnRhci54ego+ICsjIEZyb20gaHR0cHM6Ly93cGV3ZWJraXQub3JnL3JlbGVhc2Vz
L3dwZXdlYmtpdC0yLjUwLjUudGFyLnh6LnN1bXMKPiArbWQ1ICAxZDgxNDg1Mzc5MDA1Y2NhMDIz
NmEyNzg3MDZmMTk0ZiAgd3Bld2Via2l0LTIuNTAuNS50YXIueHoKPiArc2hhMSAgZGQ1NmI3NmVm
ZjhiYTE1N2EwMjkxYzBiNjEyMjA2NjZlZWQ1OTMxMyAgd3Bld2Via2l0LTIuNTAuNS50YXIueHoK
PiArc2hhMjU2ICBkZTRiZmQyMGJmYzkyMWNkZmM3N2U4MzllZTRkYTg0ZTI2NzRiY2I1OGIyZjkx
NjE3Mjk3OGQ2MmZhMTE1ZmMyICB3cGV3ZWJraXQtMi41MC41LnRhci54ego+ICAKPiAgIyBIYXNo
ZXMgZm9yIGxpY2Vuc2UgZmlsZXM6Cj4gIHNoYTI1NiAgMGI1ZDNhN2NjMzI1OTQyNTY3MzczYjBl
Y2Q3NTdkMDdjMTMyZTBlYmQ3Yzk3YmZjNjNmN2UxYTc2MDk0ZWRiNCAgU291cmNlL1dlYkNvcmUv
TElDRU5TRS1BUFBMRQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3dwZXdlYmtpdC93cGV3ZWJraXQu
bWsgYi9wYWNrYWdlL3dwZXdlYmtpdC93cGV3ZWJraXQubWsKPiBpbmRleCAzMWFiYTJhMGI5Li4w
M2RlYjZlOTkxIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uvd3Bld2Via2l0L3dwZXdlYmtpdC5tawo+
ICsrKyBiL3BhY2thZ2Uvd3Bld2Via2l0L3dwZXdlYmtpdC5tawo+IEBAIC01LDcgKzUsNyBAQAo+
ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAgIyBUaGUgbWlkZGxlIG51bWJlciBpcyBl
dmVuIGZvciBzdGFibGUgcmVsZWFzZXMsIG9kZCBmb3IgZGV2ZWxvcG1lbnQgb25lcy4KPiAtV1BF
V0VCS0lUX1ZFUlNJT04gPSAyLjQ4LjMKPiArV1BFV0VCS0lUX1ZFUlNJT04gPSAyLjUwLjUKPiAg
V1BFV0VCS0lUX1NJVEUgPSBodHRwczovL3dwZXdlYmtpdC5vcmcvcmVsZWFzZXMKPiAgV1BFV0VC
S0lUX1NPVVJDRSA9IHdwZXdlYmtpdC0kKFdQRVdFQktJVF9WRVJTSU9OKS50YXIueHoKPiAgV1BF
V0VCS0lUX0lOU1RBTExfU1RBR0lORyA9IFlFUwo+IC0tIAo+IDIuNDcuMwo+IAo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxp
bmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gCgpDaGVlcnMsCuKAlEFkcmnDoW4K


--Tml5528kkRXm3tiC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEIAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCaZZAJAAKCRCRxVnb5MkS
OyksAJwJuEhtmtSYGjuxzNHSBzAD/dI9eQCfQ5nLVEZVvh9lw5ej0WsE74Fyuf4=
=DPud
-----END PGP SIGNATURE-----

--Tml5528kkRXm3tiC--

--===============8932426612670283364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8932426612670283364==--
