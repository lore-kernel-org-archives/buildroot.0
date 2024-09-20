Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B36CF58F1
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 08:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E078E41462;
	Fri, 20 Sep 2024 08:48:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1OH-w0N4ctLS; Fri, 20 Sep 2024 08:48:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 328EC40399
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 328EC40399;
	Fri, 20 Sep 2024 08:48:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0CFC31BF46D
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 08:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08D31607C8
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 08:48:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vhSSdaRui-sj for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 08:48:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5CBB860741
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CBB860741
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5CBB860741
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 08:48:48 +0000 (UTC)
Received: from 91-153-34-109.elisa-laajakaista.fi ([91.153.34.109] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1srZJk-00G0sa-Ia; Fri, 20 Sep 2024 10:48:44 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 11052977;
 Fri, 20 Sep 2024 08:48:43 +0000 (UTC)
Date: Fri, 20 Sep 2024 11:48:38 +0300
Message-ID: <20240920114838.GB3176444@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
In-Reply-To: <20240920061833.132700-1-thomas@devoogdt.com>
References: <20240920061833.132700-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aRgcrOizTOsAM82vewzzPYDjGmOw+FAwdP+Bcr65fXg=; b=EADpJjD2aTc1qFmCkGj+e+PaoU
 LJLEL1kfKwJ/stIX1RWMbOIjyGUwEtR5ap934lhIObbO6o0BQ2U9j4MSYYlfRmA7+i0V0bODzZyo4
 40MUheJa6ykMWLi8ddWQFC6DgUSsCHb0FwsquQ6v/LTvd1lQ8fBGYJdwVIY4+J4jcLZN3FfvtqY/T
 rW0j/N76wc2Y+DP9ab36HlWSfgkjToxlbWOl7m0jGvWcACsba3jjITp05PsUF5asiRYhpGGHNzPHW
 M1Bx0ZU4wxuEFz8kEYnjrB2A+qrLOSE/tBvrzeJRmEy6x8dClEMzO3PsNagR6HADKHI6QGVocuByP
 Tnt6SYKQ==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=EADpJjD2
Subject: Re: [Buildroot] [PATCH v1] package/cairo: bump to 1.18.2
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7806944473401085749=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============7806944473401085749==
Content-Type: multipart/signed; boundary="aKjoTibpruQ+O6Ph"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--aKjoTibpruQ+O6Ph
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gRnJpLCAyMCBTZXAgMjAyNCAwODoxODozMyArMDIwMCBUaG9tYXMgRGV2b29nZHQgPHRob21h
c0BkZXZvb2dkdC5jb20+IHdyb3RlOgo+IEZyb206IFRob21hcyBEZXZvb2dkdCA8dGhvbWFzLmRl
dm9vZ2R0QGJhcmNvLmNvbT4KPiAKPiBOZXdzOgo+ICAtIGh0dHBzOi8vd3d3LmNhaXJvZ3JhcGhp
Y3Mub3JnL25ld3MvY2Fpcm8tMS4xOC4yLwo+IAo+IFVwc3RyZWFtIHBhdGNoZXMgaGF2ZSBiZWVu
IGRyb3BwZWQgaW4gdGhpcyBjb21taXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIERldm9v
Z2R0IDx0aG9tYXMuZGV2b29nZHRAYmFyY28uY29tPgoKUmV2aWV3ZWQtYnk6IEFkcmlhbiBQZXJl
eiBkZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPgoKPiAtLS0KPiAgLi4ucC1JUENfUk1JRF9E
RUZFUlJFRF9SRUxFQVNFLWNoZWNrLXdoLnBhdGNoIHwgNDEgLS0tLS0tLS0tLS0tLS0tLS0tLQo+
ICAuLi4zLW1lc29uLW9ubHktcmVxdWlyZS1jcHAtZm9yLXdpbmRvd3MucGF0Y2ggfCAzOCAtLS0t
LS0tLS0tLS0tLS0tLQo+ICBwYWNrYWdlL2NhaXJvL2NhaXJvLmhhc2ggICAgICAgICAgICAgICAg
ICAgICAgfCAgNCArLQo+ICBwYWNrYWdlL2NhaXJvL2NhaXJvLm1rICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMiArLQo+ICA0IGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgODIgZGVs
ZXRpb25zKC0pCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2NhaXJvLzAwMDItbWVzb24t
YWx3YXlzLXNraXAtSVBDX1JNSURfREVGRVJSRURfUkVMRUFTRS1jaGVjay13aC5wYXRjaAo+ICBk
ZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS9jYWlyby8wMDAzLW1lc29uLW9ubHktcmVxdWlyZS1j
cHAtZm9yLXdpbmRvd3MucGF0Y2gKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9jYWlyby8wMDAy
LW1lc29uLWFsd2F5cy1za2lwLUlQQ19STUlEX0RFRkVSUkVEX1JFTEVBU0UtY2hlY2std2gucGF0
Y2ggYi9wYWNrYWdlL2NhaXJvLzAwMDItbWVzb24tYWx3YXlzLXNraXAtSVBDX1JNSURfREVGRVJS
RURfUkVMRUFTRS1jaGVjay13aC5wYXRjaAo+IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAo+IGlu
ZGV4IDVhNWM0MzhhOTcuLjAwMDAwMDAwMDAKPiAtLS0gYS9wYWNrYWdlL2NhaXJvLzAwMDItbWVz
b24tYWx3YXlzLXNraXAtSVBDX1JNSURfREVGRVJSRURfUkVMRUFTRS1jaGVjay13aC5wYXRjaAo+
ICsrKyAvZGV2L251bGwKPiBAQCAtMSw0MSArMCwwIEBACj4gLUZyb20gOGQ1MDM3ZWQ2NDJiMDJj
ZGIwMThlNDk4NjZhYTI4NmYzMGE3YjU5YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiAtRnJv
bTogVGhvbWFzIERldm9vZ2R0IDx0aG9tYXNAZGV2b29nZHQuY29tPgo+IC1EYXRlOiBNb24sIDUg
RmViIDIwMjQgMTc6NDc6MDcgKzAxMDAKPiAtU3ViamVjdDogW1BBVENIXSBtZXNvbjogYWx3YXlz
IHNraXAgSVBDX1JNSURfREVGRVJSRURfUkVMRUFTRSBjaGVjayB3aGVuCj4gLSBjcm9zcy1jb21w
aWxpbmcKPiAtCj4gLS4uLy4uL2JyLXRlc3QtcGtnL2Jvb3RsaW4tYXJtdjUtdWNsaWJjL2J1aWxk
L2NhaXJvLTEuMTcuNC9tZXNvbi5idWlsZDoyNzk6MTM6Cj4gLUVSUk9SOiBDYW4gbm90IHJ1biB0
ZXN0IGFwcGxpY2F0aW9ucyBpbiB0aGlzIGNyb3NzIGVudmlyb25tZW50Lgo+IC0KPiAtQ29tbWl0
IDFiZWM1NmVhOGE5MzFlMWFlMWM3NGNjNzQwMTM0NDk3ZWMzNjUyNjcgYWRkZWQgc3VwcG9ydCB0
byBkZWZpbmUKPiAtaXBjX3JtaWRfZGVmZXJyZWRfcmVsZWFzZSBpbiBhIGNyb3NzLWNvbXBpbGUg
Y29uZmlnLCBidXQgc3RpbGwga2VwdAo+IC10aGUgZGVmYXVsdCB0byBhdXRvLCB3aGljaCBhbnlo
b3cgcmVzdWx0cyBpbiBhbiBlcnJvciB3aGVuIGNyb3NzLWNvbXBpbGluZy4KPiAtCj4gLVRoZXJl
IGlzIG9ubHkgb25lIHVzYWdlIG9mIHRoZSBpcGNfcm1pZF9kZWZlcnJlZF9yZWxlYXNlIGNvbXBp
bGUgZGVjbGFyYXRpdmUKPiAtd2hpY2ggd2FzIG9yaWdpbmFsbHkgYWRkZWQgaW4gdGhpcyBjb21t
aXQ6IDUwNDFiNDYyZDA4NGRlODU1MjMzNjI3NTkxNGQzMGMyM2JmNWRkMzUuCj4gLQo+IC1JZiBp
cGNfcm1pZF9kZWZlcnJlZF9yZWxlYXNlIGlzIHNldCB0byBGQUxTRSwgYW4gYWRkaXRpb25hbCBY
U3luYyBpcyBwZXJmb3JtZWQuCj4gLVRoaXMgZG9lc24ndCBzb3VuZCB2ZXJ5IGhhcm1mdWwsIHNv
IHRoYXQgaXMgd2h5IHRoaXMgY29tbWl0IGRlZmF1bHRzIHRvIEZBTFNFCj4gLWFuZCB0aHVzIGF2
b2lkcyBhbnkgY3Jvc3MtY29tcGlsZSBlcnJvcnMuCj4gLQo+IC1VcHN0cmVhbTogaHR0cHM6Ly9n
aXRsYWIuZnJlZWRlc2t0b3Aub3JnL2NhaXJvL2NhaXJvLy0vbWVyZ2VfcmVxdWVzdHMvNTM0Cj4g
LVNpZ25lZC1vZmYtYnk6IFRob21hcyBEZXZvb2dkdCA8dGhvbWFzQGRldm9vZ2R0LmNvbT4KPiAt
LS0tCj4gLSBtZXNvbi5idWlsZCB8IDIgKy0KPiAtIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQo+IC0KPiAtZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIvbWVz
b24uYnVpbGQKPiAtaW5kZXggOWVmZTkxOTc4Li42YTY3MGJmOTQgMTAwNjQ0Cj4gLS0tLSBhL21l
c29uLmJ1aWxkCj4gLSsrKyBiL21lc29uLmJ1aWxkCj4gLUBAIC0zNjksNyArMzY5LDcgQEAgaWYg
eDExX2RlcC5mb3VuZCgpIGFuZCB4ZXh0X2RlcC5mb3VuZCgpCj4gLSAKPiAtICAgIyBDYW4gc2tp
cCB0aGUgcnVuIGNoZWNrIGJ5IHByb3ZpZGluZyB0aGUgcmVzdWx0IGluIGEgY3Jvc3MgZmlsZSBv
cgo+IC0gICAjIG5hdGl2ZSBmaWxlIGFzIGJvb2wgcHJvcGVydHkgdmFsdWUuCj4gLS0gIHByb3Ag
PSBtZXNvbi5nZXRfZXh0ZXJuYWxfcHJvcGVydHkoJ2lwY19ybWlkX2RlZmVycmVkX3JlbGVhc2Un
LCAnYXV0bycpCj4gLSsgIHByb3AgPSBtZXNvbi5nZXRfZXh0ZXJuYWxfcHJvcGVydHkoJ2lwY19y
bWlkX2RlZmVycmVkX3JlbGVhc2UnLCBtZXNvbi5pc19jcm9zc19idWlsZCgpID8gJ2ZhbHNlJyA6
ICdhdXRvJykKPiAtICAgIyBXZSBkb24ndCBrbm93IHRoZSB0eXBlIG9mIHByb3AgKGJvb2wsIHN0
cmluZykgYnV0IG5lZWQgdG8gZGlmZmVyZW50aWF0ZQo+IC0gICAjIGJldHdlZW4gYSBzZXQgdmFs
dWUgKGJvb2wpIG9yIHRoZSBmYWxsYmFjayB2YWx1ZSAoc3RyaW5nKSwgc28gY29udmVydCB0bwo+
IC0gICAjIGEgc3RyaW5nIGFuZCBjaGVjayB0aGUgc3RyaW5nIHZhbHVlLgo+IC0tLQo+IC0yLjM0
LjEKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9jYWlyby8wMDAzLW1lc29uLW9ubHktcmVxdWlyZS1j
cHAtZm9yLXdpbmRvd3MucGF0Y2ggYi9wYWNrYWdlL2NhaXJvLzAwMDMtbWVzb24tb25seS1yZXF1
aXJlLWNwcC1mb3Itd2luZG93cy5wYXRjaAo+IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAo+IGlu
ZGV4IDNjZTM5NmY2NmYuLjAwMDAwMDAwMDAKPiAtLS0gYS9wYWNrYWdlL2NhaXJvLzAwMDMtbWVz
b24tb25seS1yZXF1aXJlLWNwcC1mb3Itd2luZG93cy5wYXRjaAo+ICsrKyAvZGV2L251bGwKPiBA
QCAtMSwzOCArMCwwIEBACj4gLUZyb20gZTkzZWYzZmViNjk5OTRlM2FhNGUwYWI2NmNjZDY2MTM5
YjA5N2U0OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiAtRnJvbTogVGhvbWFzIERldm9vZ2R0
IDx0aG9tYXMuZGV2b29nZHRAYmFyY28uY29tPgo+IC1EYXRlOiBUaHUsIDE4IEp1bCAyMDI0IDEy
OjE2OjUxICswMjAwCj4gLVN1YmplY3Q6IFtQQVRDSF0gbWVzb246IG9ubHkgcmVxdWlyZSBjcHAg
Zm9yIHdpbmRvd3MKPiAtCj4gLUFsbG93IHRvIGNvbXBpbGUgY2Fpcm8gd2l0aG91dCBjKysgdG9v
bGNoYWluLgo+IC0KPiAtRml4ZXM6Cj4gLSAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5l
dC9yZXN1bHRzLzk4YjYyYWI3ZWQzMDkyZjlmOTA4NWY3MjNiYWY3ZDYyNjc0NTFlNWMvCj4gLQo+
IC1VcHN0cmVhbTogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2NhaXJvL2NhaXJvLy0v
bWVyZ2VfcmVxdWVzdHMvNTczCj4gLVNpZ25lZC1vZmYtYnk6IFRob21hcyBEZXZvb2dkdCA8dGhv
bWFzLmRldm9vZ2R0QGJhcmNvLmNvbT4KPiAtLS0tCj4gLSBtZXNvbi5idWlsZCB8IDQgKysrLQo+
IC0gMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IC0KPiAt
ZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIvbWVzb24uYnVpbGQKPiAtaW5kZXggOTEwMDE1MmVl
Li4yOTc0ODJiMDMgMTAwNjQ0Cj4gLS0tLSBhL21lc29uLmJ1aWxkCj4gLSsrKyBiL21lc29uLmJ1
aWxkCj4gLUBAIC0xLDQgKzEsNCBAQAo+IC0tcHJvamVjdCgnY2Fpcm8nLCAnYycsICdjcHAnLAo+
IC0rcHJvamVjdCgnY2Fpcm8nLCAnYycsCj4gLSAgIG1lc29uX3ZlcnNpb246ICc+PSAwLjU5LjAn
LAo+IC0gICB2ZXJzaW9uOiBydW5fY29tbWFuZChmaW5kX3Byb2dyYW0oJ3ZlcnNpb24ucHknKSwg
Y2hlY2s6IHRydWUpLnN0ZG91dCgpLnN0cmlwKCksCj4gLSAgIGRlZmF1bHRfb3B0aW9uczogWyd3
YXJuaW5nX2xldmVsPTInXSwKPiAtQEAgLTQ4OSw2ICs0ODksOCBAQCBpZiBob3N0X21hY2hpbmUu
c3lzdGVtKCkgPT0gJ2RhcndpbicgYW5kIG5vdCBnZXRfb3B0aW9uKCdxdWFydHonKS5kaXNhYmxl
ZCgpCj4gLSBlbmRpZgo+IC0gCj4gLSBpZiBob3N0X21hY2hpbmUuc3lzdGVtKCkgPT0gJ3dpbmRv
d3MnCj4gLSsgIGFkZF9sYW5ndWFnZXMoJ2NwcCcpCj4gLSsKPiAtICAgYWRkX3Byb2plY3RfYXJn
dW1lbnRzKCctRFdJTjMyX0xFQU5fQU5EX01FQU4nLCAnLUROT01JTk1BWCcsIGxhbmd1YWdlOiBb
J2MnLCAnY3BwJ10pCj4gLSAKPiAtICAgd2luMzJfZXh0cmFfZGVwcyA9IFsKPiAtLS0gCj4gLTIu
NDUuMgo+IC0KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9jYWlyby9jYWlyby5oYXNoIGIvcGFja2Fn
ZS9jYWlyby9jYWlyby5oYXNoCj4gaW5kZXggZGY5YzY5M2JhZC4uYjJkMzg0ZDAxYSAxMDA2NDQK
PiAtLS0gYS9wYWNrYWdlL2NhaXJvL2NhaXJvLmhhc2gKPiArKysgYi9wYWNrYWdlL2NhaXJvL2Nh
aXJvLmhhc2gKPiBAQCAtMSw1ICsxLDUgQEAKPiAtIyBGcm9tIGh0dHBzOi8vd3d3LmNhaXJvZ3Jh
cGhpY3Mub3JnL3JlbGVhc2VzL2NhaXJvLTEuMTguMC50YXIueHouc2hhMjU2c3VtCj4gLXNoYTI1
NiAgMjQzYTA3MzZiOTc4YTMzZGVlMjlmOWNjYTc1MjE3MzNiNzhhNjViNTQxODIwNmZlZjdiZDFj
M2Q0Y2YxMGI2NCAgY2Fpcm8tMS4xOC4wLnRhci54ego+ICsjIEZyb20gaHR0cHM6Ly93d3cuY2Fp
cm9ncmFwaGljcy5vcmcvcmVsZWFzZXMvY2Fpcm8tMS4xOC4yLnRhci54ei5zaGEyNTZzdW0KPiAr
c2hhMjU2ICBhNjJiOWJiNDI0MjVlODQ0Y2MzZDZkZGRlMDQzZmYzOWRiYWJlZGQxNTQyZWJhNTdh
MmViNzlmODU4ODlkNDVhICBjYWlyby0xLjE4LjIudGFyLnh6Cj4gIAo+ICAjIEhhc2ggZm9yIGxp
Y2Vuc2UgZmlsZXM6Cj4gIHNoYTI1NiAgNjcyMjhhOWY3YzVmOWI2N2M1OGY1NTZmMWJlMTc4ZjYy
ZGE0ZDllMmU2Mjg1MzE4ZDhjNzRkNTY3MjU1YWJkZiAgQ09QWUlORwo+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL2NhaXJvL2NhaXJvLm1rIGIvcGFja2FnZS9jYWlyby9jYWlyby5tawo+IGluZGV4IGJh
MjU2MjBmOGQuLmM3NDFjOTc4NTMgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9jYWlyby9jYWlyby5t
awo+ICsrKyBiL3BhY2thZ2UvY2Fpcm8vY2Fpcm8ubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgIwo+
ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAtQ0FJUk9fVkVSU0lPTiA9IDEuMTguMAo+
ICtDQUlST19WRVJTSU9OID0gMS4xOC4yCj4gIENBSVJPX1NPVVJDRSA9IGNhaXJvLSQoQ0FJUk9f
VkVSU0lPTikudGFyLnh6Cj4gIENBSVJPX0xJQ0VOU0UgPSBMR1BMLTIuMSBvciBNUEwtMS4xIChs
aWJyYXJ5KQo+ICBDQUlST19MSUNFTlNFX0ZJTEVTID0gQ09QWUlORyBDT1BZSU5HLUxHUEwtMi4x
IENPUFlJTkctTVBMLTEuMQo+IC0tIAo+IDIuNDMuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cj4gCgpDaGVlcnMsCuKAlEFkcmnDoW4K

--aKjoTibpruQ+O6Ph
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZu025gAKCRCRxVnb5MkS
O4nhAJ9Z+YpfDtaySyWp5vI1pLLjLsVsTACeNIJ42srKP6U+8UYQMvv8UFkfFWw=
=HK/e
-----END PGP SIGNATURE-----

--aKjoTibpruQ+O6Ph--

--===============7806944473401085749==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7806944473401085749==--
