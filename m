Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B55CCD1BB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F11B612D5;
	Wed, 22 Oct 2025 16:43:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X1sz3o8eoWIl; Wed, 22 Oct 2025 16:43:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA81161478
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA81161478;
	Wed, 22 Oct 2025 16:43:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 24B1043F
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16E0383D7C
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lZKWOGo-OF-X for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:43:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0319F81B9D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0319F81B9D
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0319F81B9D
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E7556B97918D; Wed, 22 Oct 2025 18:43:10 +0200 (CEST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed, 22 Oct 2025 18:43:07 +0200
Message-ID: <20251022164310.286190-1-arnout@rnout.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009165624.3914222-1-bernd@kuhls.net>
References: <20251009165624.3914222-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1761151391; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=yH2DlEqPTAAAu955yruyCp5WWyE0GuF8TRjkkImN5q4=;
 b=DvEbkmmT5LY2b+rx1hPFupGl2+dDuESxjFF+or0G5ZIE9JCi+PHEhPy5AwIl6TSrcDYQq0
 z+xJVBZBjDPYSB+ZMPLtLwXI0LQZlbzh19/0CgGrE+g6z6EjT0JDmlIFm789Z+N8U3IoMI
 nB6nMHEYRK6uShR2ZjOaQ5+LfxslORlOMctkTcoinZgzGplVia+PTZfA/ocNK5xRL9gM6B
 mH9C2M3JSv2pItoy/shcAr0RvRLQGqZBl8ubu4OSElot3fV1E2pc8yImT/6V5UoYWfUzlJ
 +c1CuqMyZHOu3rxyOVWCq13G4ifjEVspxYn1Ko/XJmfQkRfUV0CehpwJSCa7mw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=DvEbkmmT
Subject: Re: [Buildroot] [PATCH 1/1] package/gpsd: remove -std=gnu++98 from
 CFLAGS
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

SW4gcmVwbHkgb2Y6Cj4gSW4gMjAxNiBidWlsZHJvb3QgY29tbWl0IGI0YzA1MGU5YWZlZDdhOGRj
MzAyZTZlMTAxNGNjNGZmYjUwODU5MGQgYWRkZWQKPiAtc3RkPWdudSsrOTggYWxzbyB0byBDRkxB
R1Mga25vd2luZyB0aGF0IGl0IHdpbGwgY2F1c2Ugd2FybmluZ3M6Cj4gCj4gaHR0cHM6Ly9saXN0
cy5ub25nbnUub3JnL2FyY2hpdmUvaHRtbC9ncHNkLWRldi8yMDE2LTA5L21zZzAwMDgyLmh0bWwK
PiAnQWx0aG91Z2ggdGhpcyBsZWFkcyB0byBsb3RzIG9mIHdhcm5pbmdzIG9uIGV2ZXJ5IGNvbXBp
bGF0aW9uIHdpdGggZ2NjOgo+ICJjYzE6IHdhcm5pbmc6IGNvbW1hbmQgbGluZSBvcHRpb24gJy1z
dGQ9Z251Kys5OCcgaXMgdmFsaWQgZm9yIEMrKy9PYmpDKysgYnV0IG5vdCBmb3IgQyInCj4gCj4g
VGhlc2Ugd2FybmluZ3MgYXJlIHN0aWxsIHByZXNlbnQgYnV0IGNhdXNlIGEgbWlzZGV0ZWN0aW9u
IGluIGNvbmZpZ3VyZQo+IAo+ICAgICBDaGVja2luZyBpZiBzdHJlcnJvcl9yKCkgcmV0dXJucyBp
bnQuLi4gbm8KPiAKPiBiZWNhdXNlIGhlcmUgd2FybmluZ3MgYXJlIHRyZWF0ZWQgYXMgZXJyb3Jz
LCBxdW90aW5nIGNvbmZpZy5sb2c6Cj4gCj4gY2MxOiBlcnJvcjogY29tbWFuZC1saW5lIG9wdGlv
biDDouKCrMucLXN0ZD1nbnUrKzk4w6LigqzihKIgaXMgdmFsaWQgZm9yIEMrKy9PYmpDKysgYnV0
IG5vdCBmb3IgQyBbLVdlcnJvcl0KPiBjYzE6IGFsbCB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFz
IGVycm9ycwo+IAo+IEluIDIwMTcgdXBzdHJlYW0gY29tbWl0dGVkCj4gaHR0cHM6Ly9naXRsYWIu
Y29tL2dwc2QvZ3BzZC8tL2NvbW1pdC9kMjg3Yzc2ZjRmMmUxZmZkMjc1ZGE0MWI4NGY5ZTA4ZWE3
Zjc0MzQ0Cj4gd2hpY2ggYWRkZWQgInN0ZDo6IiBuYW1lc3BhY2UgcHJlZml4ZXMgYW5kIGZpeGVk
IHRoZSBvcmlnaW5hbCBwcm9ibGVtLgo+IAo+IC1zdGQ9Z251Kys5OCBiZWluZyByZW1vdmVkIGZy
b20gQ0ZMQUdTIGxldHMgY29uZmlndXJlIGNvcnJlY3RseSBkZXRlY3QKPiBzdHJlcnJvcl9yKCk6
Cj4gCj4gICAgIENoZWNraW5nIGlmIHN0cmVycm9yX3IoKSByZXR1cm5zIGludC4uLiB5ZXMKPiAK
PiBhbmQgbm8gbmV3IGJ1aWxkIGVycm9ycyBvY2N1cjoKPiAKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGFybS1hYXJjaDY0IFsgMS8zNV06IE9LCj4gICAgICAgICAgICAgICAgICAgIGJv
b3RsaW4tYWFyY2g2NC1nbGliYyBbIDIvMzVdOiBPSwo+ICAgICAgICAgICAgICAgIGJvb3RsaW4t
YXJjbGUtaHMzOC11Y2xpYmMgWyAzLzM1XTogT0sKPiAgICAgICAgICAgICAgICAgICAgIGJvb3Rs
aW4tYXJtdjUtdWNsaWJjIFsgNC8zNV06IE9LCj4gICAgICAgICAgICAgICAgICAgICAgYm9vdGxp
bi1hcm12Ny1nbGliYyBbIDUvMzVdOiBPSwo+ICAgICAgICAgICAgICAgICAgICBib290bGluLWFy
bXY3bS11Y2xpYmMgWyA2LzM1XTogU0tJUFBFRAo+ICAgICAgICAgICAgICAgICAgICAgICBib290
bGluLWFybXY3LW11c2wgWyA3LzM1XTogT0sKPiAgICAgICAgICAgICAgICAgYm9vdGxpbi1tNjhr
LTUyMDgtdWNsaWJjIFsgOC8zNV06IFNLSVBQRUQKPiAgICAgICAgICAgICAgICBib290bGluLW02
OGstNjgwNDAtdWNsaWJjIFsgOS8zNV06IE9LCj4gICAgICAgICAgICAgIGJvb3RsaW4tbWljcm9i
bGF6ZWVsLXVjbGliYyBbMTAvMzVdOiBPSwo+ICAgICAgICAgICAgICAgICBib290bGluLW1pcHNl
bDMycjYtZ2xpYmMgWzExLzM1XTogT0sKPiAgICAgICAgICAgICAgICAgICAgYm9vdGxpbi1taXBz
ZWwtdWNsaWJjIFsxMi8zNV06IE9LCj4gICAgICAgICAgICAgICAgICBib290bGluLW9wZW5yaXNj
LXVjbGliYyBbMTMvMzVdOiBPSwo+ICAgICAgICAgYm9vdGxpbi1wb3dlcnBjNjRsZS1wb3dlcjgt
Z2xpYmMgWzE0LzM1XTogT0sKPiAgICAgICAgICAgIGJvb3RsaW4tcG93ZXJwYy1lNTAwbWMtdWNs
aWJjIFsxNS8zNV06IE9LCj4gICAgICAgICAgICAgICAgICAgIGJvb3RsaW4tcmlzY3YzMi1nbGli
YyBbMTYvMzVdOiBPSwo+ICAgICAgICAgICAgICAgICAgICBib290bGluLXJpc2N2NjQtZ2xpYmMg
WzE3LzM1XTogT0sKPiAgICAgICAgICAgICAgICAgICAgIGJvb3RsaW4tcmlzY3Y2NC1tdXNsIFsx
OC8zNV06IE9LCj4gICAgICAgICAgICAgICAgICBib290bGluLXMzOTB4LXoxMy1nbGliYyBbMTkv
MzVdOiBPSwo+ICAgICAgICAgICAgICAgICAgICAgICBib290bGluLXNoNC11Y2xpYmMgWzIwLzM1
XTogT0sKPiAgICAgICAgICAgICAgICAgICAgYm9vdGxpbi1zcGFyYzY0LWdsaWJjIFsyMS8zNV06
IE9LCj4gICAgICAgICAgICAgICAgICAgICBib290bGluLXNwYXJjLXVjbGliYyBbMjIvMzVdOiBP
Swo+ICAgICAgICAgICAgICAgICAgICAgYm9vdGxpbi14ODYtNjQtZ2xpYmMgWzIzLzM1XTogT0sK
PiAgICAgICAgICAgICAgICAgICAgICBib290bGluLXg4Ni02NC1tdXNsIFsyNC8zNV06IE9LCj4g
ICAgICAgICAgICAgICAgICAgIGJvb3RsaW4teDg2LTY0LXVjbGliYyBbMjUvMzVdOiBPSwo+ICAg
ICAgICAgICAgICAgICAgICBib290bGluLXg4Ni1pNjg2LW11c2wgWzI2LzM1XTogT0sKPiAgICAg
ICAgICAgICAgICAgICAgYm9vdGxpbi14dGVuc2EtdWNsaWJjIFsyNy8zNV06IE9LCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGJyLWFybS1iYXNpYyBbMjgvMzVdOiBTS0lQUEVECj4gICAg
ICAgICAgICAgICAgICAgICBici1hcm0tZnVsbC1ub3RocmVhZCBbMjkvMzVdOiBTS0lQUEVECj4g
ICAgICAgICAgICAgICAgICAgICAgIGJyLWFybS1mdWxsLXN0YXRpYyBbMzAvMzVdOiBTS0lQUEVE
Cj4gICAgICAgICAgICAgICAgICAgIGJyLWkzODYtcGVudGl1bTQtZnVsbCBbMzEvMzVdOiBGQUlM
RUQKPiAgICAgICAgICAgICAgICAgICAgICAgYnItbWlwczY0LW42NC1mdWxsIFszMi8zNV06IE9L
Cj4gICAgICAgICAgICAgICAgICBici1taXBzNjRyNi1lbC1oZi1nbGliYyBbMzMvMzVdOiBPSwo+
ICAgICAgICAgICAgICAgIGJyLXBvd2VycGMtNjAzZS1iYXNpYy1jcHAgWzM0LzM1XTogU0tJUFBF
RAo+ICAgICAgICAgICAgICAgIGJyLXBvd2VycGM2NC1wb3dlcjctZ2xpYmMgWzM1LzM1XTogT0sK
PiAzNSBidWlsZHMsIDYgc2tpcHBlZCwgMSBidWlsZCBmYWlsZWQsIDAgbGVnYWwtaW5mbyBmYWls
ZWQsIDAgc2hvdy1pbmZvIGZhaWxlZAo+IAo+IFRoZSBici1pMzg2LXBlbnRpdW00LWZ1bGwgZXJy
b3IgaXMgbm90IGNhdXNlZCBieSBncHNkOgo+IAo+IHBhY2thZ2UvcHl0aG9uMy9weXRob24zLm1r
OjMyNDogKioqIFB5dGhvbjMgZG9lc24ndCB3b3JrIHdpdGggdUNsaWJjIGFuZAo+IGtlcm5lbCBo
ZWFkZXJzIDwgNS4xLiBQbGVhc2UgdXNlIGEgZGlmZmVyZW50IHRvIG9sY2hhaW4gb3IgdW5zZWxl
Y3QKPiBQeXRob24zLi4KPiAKPiBGaXhlczoKPiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qu
b3JnL3Jlc3VsdHMvNTJkNzQ3ZDMzZDcxNGVhMTBiOWU3ZWUxMGFkZWFkZDllNDUxMmMyZC8KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgoKQXBwbGllZCB0
byAyMDI1LjAyLnggYW5kIDIwMjUuMDgueC4gVGhhbmtzCgo+IC0tLQo+ICBwYWNrYWdlL2dwc2Qv
Z3BzZC5tayB8IDEgLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL2dwc2QvZ3BzZC5tayBiL3BhY2thZ2UvZ3BzZC9ncHNkLm1rCj4gaW5k
ZXggMWIyMDIxMGM0OS4uYzVjNGRhZDI5NiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2dwc2QvZ3Bz
ZC5tawo+ICsrKyBiL3BhY2thZ2UvZ3BzZC9ncHNkLm1rCj4gQEAgLTM3LDcgKzM3LDYgQEAgZW5k
aWYKPiAgIyBCdWlsZCBsaWJncHNtbSBpZiB3ZSd2ZSBnb3QgQysrCj4gIGlmZXEgKCQoQlIyX0lO
U1RBTExfTElCU1REQ1BQKSx5KQo+ICBHUFNEX0xERkxBR1MgKz0gLWxzdGRjKysKPiAtR1BTRF9D
RkxBR1MgKz0gLXN0ZD1nbnUrKzk4Cj4gIEdQU0RfQ1hYRkxBR1MgKz0gLXN0ZD1nbnUrKzk4Cj4g
IEdQU0RfU0NPTlNfT1BUUyArPSBsaWJncHNtbT15ZXMKPiAgZWxzZQo+IC0tIAo+IDIuNDcuMwo+
IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVp
bGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
