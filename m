Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96DBD2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 923904027D;
	Tue, 13 Jan 2026 19:46:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eRxkztDVvmvW; Tue, 13 Jan 2026 19:46:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B04C5402ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333573;
	bh=AJHWpq1WuOWFqhVrd3xnQzCpbbuDD3W7k3cS2hwVyDg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bbn37g3yIKktEambViM+CdyoaYSTwe9VMzVP3ehKLHyZ850Jzp6Ergd0i1z6JUFhM
	 +CLcKfgNQ00cODeopyhh5WybN4yIogyAL7oEqmEme0lf93RJq6sSk5G8xEK6HI9t7T
	 BCHTON3kYEh9hklfuHRBDG1yj9bdg6QbmsOSnWVfsn5cjcaNbrkkdFG+PohsLaZoMZ
	 qKeHKBHmU5/Bq7ZcBePKtwsiQcLN1bDm3PrQjapYBs+VgjMJIceC0UurAZY+okYAla
	 kFNEXuTuvTV5dXsBqzoRBaekKi18b8CVu+tlNh755Pfsa+fXzbsECt9Mnm2Py7AgUN
	 ubyO1cqVP+j0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B04C5402ED;
	Tue, 13 Jan 2026 19:46:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F0C2231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F3DD60B48
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SKi25NCaqc6n for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:46:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5CD2060A94
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CD2060A94
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5CD2060A94
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5F664B97A863; Tue, 13 Jan 2026 20:46:09 +0100 (CET)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
 Buildroot List <buildroot@buildroot.org>
Date: Tue, 13 Jan 2026 20:46:04 +0100
Message-ID: <20260113194607.98303-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215224952.1253359-2-thomas.petazzoni@bootlin.com>
References: <20251215224952.1253359-2-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333569; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=HBoyM1N8gAmCOjm2sHJpvHA7N4mdgXNaSME3vNh81Y0=;
 b=FA1SWMeNMmuZruBTjjqiT8uOtHlAj7jlNZqs41sgKFAKmbOgQaznFX2hwOgxh6/vTbR0Zr
 Xe0maTk+FxoTxPCjSkCoZjsSYEhg+4sZAqXTN4oo900HAHT+Kz7GbpU+tcrA8sjbVAzIOE
 t00fNolJ44oo+APR2f8yjEvWrA1mDcFOKH/k710YF+rJLZecFuvpEO+E/Z4kEbf93hxKwP
 8IlOrN/R8hsWcyOkF1+QtVXRtrPjMrbDzBv7pQIInF/Dc5288i7Xu6eUAyRFOdLKihwaRs
 k+Gv55+vhQn2hp6uDqDehl3/D0DpybzwQIXq9+FLA+JkT1hyVS5Hpi+apcVWWg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=FA1SWMeN
Subject: Re: [Buildroot] [PATCH 01/13] package/rpi-firmware: drop support
 for vcdbg
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gVGhpcyB0b29sIGhhcyBiZWVuIHJlbW92ZWQgZnJvbSB1cHN0cmVhbSBy
cGktZmlybXdhcmUsIHNvIGRyb3AgdGhlCj4gY29ycmVzcG9uZGluZyBvcHRpb24gYW5kIGxvZ2lj
IGluIHJwaS1maXJtd2FyZS5tay4KPiAKPiBUaGUgdG9vbCBoYXMgYmVlbiByZW1vdmVkIGJ5IHVw
c3RyZWFtIGNvbW1pdAo+IGQxZmNjMjYwMzgxODZhZWNjMTUwMWEwYjc0OTgzMzMwMGFmYmE4MDEg
KCJvcHQ6IFJlbW92ZSBidWlsZHMgb2YKPiBkZXByZWN0YXRlZCB1c2VybGFuZCB0b29scyIpLgo+
IAo+IEl0IGlzIEJ1aWxkb3JvdCBjb21taXQKPiAyOGU2OTUzYmE4NGQzOWE2MDc0YWVlNDM5YTY0
ZWY4NmIxMDlkY2YwICgicGFja2FnZS9ycGktZmlybXdhcmU6IGJ1bXAKPiB2ZXJzaW9uIHRvIDU0
NzY3MjAiKSB0aGF0IGRpZCBhIGJ1bXAgdG8gYSB2ZXJzaW9uIG9mIHJwaS1maXJtd2FyZSB0aGF0
Cj4gbm8gbG9uZ2VyIHByb3ZpZGVkIHZjZGJnLgo+IAo+IENjOiBLw7ZyeSBNYWluY2VudCA8a29y
eS5tYWluY2VudEBib290bGluLmNvbT4KPiBDYzogR2HDq2wgUE9SVEFZIDxnYWVsLnBvcnRheUBy
dG9uZS5mcj4KPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6
b25pQGJvb3RsaW4uY29tPgoKQXBwbGllZCB0byAyMDI1LjAyLnggYW5kIDIwMjUuMTEueC4gVGhh
bmtzCgo+IC0tLQo+ICBDb25maWcuaW4ubGVnYWN5ICAgICAgICAgICAgICAgICAgICAgfCAgNiAr
KysrKysKPiAgcGFja2FnZS9ycGktZmlybXdhcmUvQ29uZmlnLmluICAgICAgIHwgMTIgLS0tLS0t
LS0tLS0tCj4gIHBhY2thZ2UvcnBpLWZpcm13YXJlL3JwaS1maXJtd2FyZS5tayB8IDIwIC0tLS0t
LS0tLS0tLS0tLS0tLS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzMiBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvQ29uZmlnLmluLmxlZ2FjeSBiL0NvbmZpZy5p
bi5sZWdhY3kKPiBpbmRleCBkYTkxYjY4MDg3Li4yMzk1MTlhYTBjIDEwMDY0NAo+IC0tLSBhL0Nv
bmZpZy5pbi5sZWdhY3kKPiArKysgYi9Db25maWcuaW4ubGVnYWN5Cj4gQEAgLTE0Niw2ICsxNDYs
MTIgQEAgZW5kaWYKPiAgCj4gIGNvbW1lbnQgIkxlZ2FjeSBvcHRpb25zIHJlbW92ZWQgaW4gMjAy
Ni4wMiIKPiAgCj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9SUElfRklSTVdBUkVfSU5TVEFMTF9WQ0RC
Rwo+ICsJYm9vbCAicnBpLWZpcm13YXJlIHZjZGJnIG9wdGlvbiByZW1vdmVkIgo+ICsJc2VsZWN0
IEJSMl9MRUdBQ1kKPiArCWhlbHAKPiArCSAgcnBpLWZpcm13YXJlIHVwc3RyZWFtIGhhcyBkcm9w
cGVkIHRoZSB2Y2RiZyB0b29sCj4gKwo+ICBjb25maWcgQlIyX1BBQ0tBR0VfTUVTQTNEX1ZEUEFV
Cj4gIAlib29sICJtZXNhM2QgR2FsbGl1bSBWRFBBVSBzdGF0ZSB0cmFja2VyIHN1cHBvcnQgcmVt
b3ZlZCIKPiAgCXNlbGVjdCBCUjJfTEVHQUNZCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcnBpLWZp
cm13YXJlL0NvbmZpZy5pbiBiL3BhY2thZ2UvcnBpLWZpcm13YXJlL0NvbmZpZy5pbgo+IGluZGV4
IGY5OWMxMTZjYTIuLjRkZGEzM2E3MTMgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9ycGktZmlybXdh
cmUvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9ycGktZmlybXdhcmUvQ29uZmlnLmluCj4gQEAg
LTEwMCwxNiArMTAwLDQgQEAgY29uZmlnIEJSMl9QQUNLQUdFX1JQSV9GSVJNV0FSRV9JTlNUQUxM
X0RUQl9PVkVSTEFZUwo+ICAJICBvdmVybGF5cywgdG8gc3VwcG9ydCBIQVRzIChIYXJkd2FyZSBB
dHRhY2hlZCBvbiBUb3AsIGFkZC1vbgo+ICAJICBtb2R1bGVzKS4KPiAgCj4gLWNvbmZpZyBCUjJf
UEFDS0FHRV9SUElfRklSTVdBUkVfSU5TVEFMTF9WQ0RCRwo+IC0JYm9vbCAidmNkYmciCj4gLQlk
ZXBlbmRzIG9uIEJSMl9hcm0gIyBwcmVidWlsdCBhcm0gYmluYXJ5LCBycGktdXNlcmxhbmQKPiAt
CWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9VU0VTX0dMSUJDCj4gLQlkZXBlbmRzIG9uIEJSMl9J
TlNUQUxMX0xJQlNURENQUCAjIHJwaS11c2VybGFuZAo+IC0JaGVscAo+IC0JICBJbnN0YWxsIHZj
ZGJnLCB0byBoZWxwIGRlYnVnIGNvbW11bmljYXRpb24gd2l0aCB0aGUgR1BVLgo+IC0KPiAtY29t
bWVudCAidmNkYmcgbmVlZHMgYSBnbGliYyB0b29sY2hhaW4gdy8gQysrIgo+IC0JZGVwZW5kcyBv
biBCUjJfYXJtCj4gLQlkZXBlbmRzIG9uICFCUjJfVE9PTENIQUlOX1VTRVNfR0xJQkMgfHwgIUJS
Ml9JTlNUQUxMX0xJQlNURENQUAo+IC0KPiAgZW5kaWYgIyBCUjJfUEFDS0FHRV9SUElfRklSTVdB
UkUKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9ycGktZmlybXdhcmUvcnBpLWZpcm13YXJlLm1rIGIv
cGFja2FnZS9ycGktZmlybXdhcmUvcnBpLWZpcm13YXJlLm1rCj4gaW5kZXggZDBiNmFiY2M2Zi4u
ZjY2ZjQyYTEwYiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3JwaS1maXJtd2FyZS9ycGktZmlybXdh
cmUubWsKPiArKysgYi9wYWNrYWdlL3JwaS1maXJtd2FyZS9ycGktZmlybXdhcmUubWsKPiBAQCAt
NjIsMjYgKzYyLDYgQEAgZGVmaW5lIFJQSV9GSVJNV0FSRV9JTlNUQUxMX0RUQl9PVkVSTEFZUwo+
ICBlbmRlZgo+ICBlbmRpZgo+ICAKPiAtIyBJbnN0YWxsIHByZWJ1aWx0IGxpYnJhcmllcyBpZiBS
UElfVVNFUkxBTkQgbm90IGVuYWJsZWQKPiAtaWZuZXEgKCQoQlIyX1BBQ0tBR0VfUlBJX1VTRVJM
QU5EKSx5KQo+IC1kZWZpbmUgUlBJX0ZJUk1XQVJFX0lOU1RBTExfVEFSR0VUX0xJQgo+IC0JJChJ
TlNUQUxMKSAtRCAtbSAwNjQ0ICQoQEQpLyQoaWYgQlIyX0FSTV9FQUJJSEYsaGFyZGZwLylvcHQv
dmMvbGliL2xpYnZjb3Muc28gXAo+IC0JCSQoVEFSR0VUX0RJUikvdXNyL2xpYi9saWJ2Y29zLnNv
Cj4gLQkkKElOU1RBTEwpIC1EIC1tIDA2NDQgJChARCkvJChpZiBCUjJfQVJNX0VBQklIRixoYXJk
ZnAvKW9wdC92Yy9saWIvbGliZGVidWdfc3ltLnNvIFwKPiAtCQkkKFRBUkdFVF9ESVIpL3Vzci9s
aWIvbGliZGVidWdfc3ltLnNvCj4gLWVuZGVmCj4gLWVuZGlmCj4gLQo+IC1pZmVxICgkKEJSMl9Q
QUNLQUdFX1JQSV9GSVJNV0FSRV9JTlNUQUxMX1ZDREJHKSx5KQo+IC1kZWZpbmUgUlBJX0ZJUk1X
QVJFX0lOU1RBTExfVEFSR0VUX0NNRFMKPiAtCSQoSU5TVEFMTCkgLUQgLW0gMDcwMCAkKEBEKS8k
KGlmIEJSMl9BUk1fRUFCSUhGLGhhcmRmcC8pb3B0L3ZjL2Jpbi92Y2RiZyBcCj4gLQkJJChUQVJH
RVRfRElSKS91c3Ivc2Jpbi92Y2RiZwo+IC0JJChJTlNUQUxMKSAtRCAtbSAwNjQ0ICQoQEQpLyQo
aWYgQlIyX0FSTV9FQUJJSEYsaGFyZGZwLylvcHQvdmMvbGliL2xpYmVsZnRvb2xjaGFpbi5zbyBc
Cj4gLQkJJChUQVJHRVRfRElSKS91c3IvbGliL2xpYmVsZnRvb2xjaGFpbi5zbwo+IC0JJChSUElf
RklSTVdBUkVfSU5TVEFMTF9UQVJHRVRfTElCKQo+IC1lbmRlZgo+IC1lbmRpZiAjIElOU1RBTExf
VkNEQkcKPiAtCj4gIGRlZmluZSBSUElfRklSTVdBUkVfSU5TVEFMTF9JTUFHRVNfQ01EUwo+ICAJ
JChSUElfRklSTVdBUkVfSU5TVEFMTF9CSU4pCj4gIAkkKFJQSV9GSVJNV0FSRV9JTlNUQUxMX0NP
TkZJRykKPiAtLSAKPiAyLjUyLjAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
