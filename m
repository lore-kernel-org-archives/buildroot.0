Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CC3CCF9E7
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 17:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 717E58436C;
	Wed, 25 Sep 2024 17:38:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pLACBR7nw4mI; Wed, 25 Sep 2024 17:38:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77FAC8447F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77FAC8447F;
	Wed, 25 Sep 2024 17:38:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A599A1BF4E7
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 17:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94D3C8447F
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 17:38:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O6u8tyRNywwi for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 17:38:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9B4538436C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B4538436C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B4538436C
 for <buildroot@busybox.net>; Wed, 25 Sep 2024 17:38:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 97EF560129;
 Wed, 25 Sep 2024 19:38:41 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 25 Sep 2024 19:38:41 +0200
Date: Wed, 25 Sep 2024 19:38:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <ZvRKodo2g2GGi3l8@landeda>
References: <20240925133539.3899781-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240925133539.3899781-1-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1727285923;
 bh=SttwsW1uh3RwANp1pLlfmbfwD4LO9GCepihq6dz+45E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zvp58cQqqXSZlHVfpEzVI/g5wF7kh2RDk+XrcFt7WTPsasI8BcJ1Gz7htH5JYR04j
 0tWo1YI99zOw7XVgM1qKIwEXme15OW7/LDa7HU6mBAWVeR5xDmrnDc7EnTH6aDswvq
 AVKu9tHXYbh67YKoWns2CmBwz8Wwivb5BgIi35+UW4AQRnggKeRt7l90nE5FwIPa4d
 Q126221N57CJ8B+G2zQamD7h2h2ReS8DJgrBiy47vGONsdgULoO783zqLV4PvI5jNm
 LCTKb/XlC7GhAt2CfO7tj9RtNw77sMyn6XpCyLsE9dich8JiTM43UovQRaTmxvnx75
 SXRcPsJKfSowQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Zvp58cQq
Subject: Re: [Buildroot] [PATCH] package/gawk: bump to version 5.3.1
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDI0LTA5LTI1IDE1OjM1ICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMs
Cllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdlL2dhd2svQ29uZmlnLmluIHwgMiArLQo+
ICBwYWNrYWdlL2dhd2svZ2F3ay5oYXNoIHwgNCArKy0tCj4gIHBhY2thZ2UvZ2F3ay9nYXdrLm1r
ICAgfCAyICstCj4gIDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2dhd2svQ29uZmlnLmluIGIvcGFja2FnZS9n
YXdrL0NvbmZpZy5pbgo+IGluZGV4IGU5Y2Y0YzVmZi4uODZlYmEwYjdiIDEwMDY0NAo+IC0tLSBh
L3BhY2thZ2UvZ2F3ay9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL2dhd2svQ29uZmlnLmluCj4g
QEAgLTgsNyArOCw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9HQVdLCj4gIAkgIHJhdGhlciB0aGFu
IHByb2NlZHVyYWwuIEFsbG93cyBmb3Igc2ltcGxlIGRhdGEtcmVmb3JtYXR0aW5nCj4gIAkgIGpv
YnMgd2l0aCBqdXN0IGEgZmV3IGxpbmVzIG9mIGNvZGUuCj4gIAo+IC0JICBodHRwOi8vd3d3Lmdu
dS5vcmcvc29mdHdhcmUvZ2F3ay8KPiArCSAgaHR0cHM6Ly93d3cuZ251Lm9yZy9zb2Z0d2FyZS9n
YXdrLwo+ICAKPiAgY29tbWVudCAiZ2F3ayBuZWVkcyBhIHRvb2xjaGFpbiB3LyB3Y2hhciIKPiAg
CWRlcGVuZHMgb24gQlIyX1VTRV9NTVUKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9nYXdrL2dhd2su
aGFzaCBiL3BhY2thZ2UvZ2F3ay9nYXdrLmhhc2gKPiBpbmRleCAzZmYwYTkwMDMuLmIwMjlhYjMz
MCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2dhd2svZ2F3ay5oYXNoCj4gKysrIGIvcGFja2FnZS9n
YXdrL2dhd2suaGFzaAo+IEBAIC0xLDYgKzEsNiBAQAo+ICAjIExvY2FsbHkgY2FsY3VsYXRlZCBh
ZnRlciBjaGVja2luZyBwZ3Agc2lnbmF0dXJlCj4gLSMgaHR0cHM6Ly9mdHAuZ251Lm9yZy9nbnUv
Z2F3ay9nYXdrLTUuMy4wLnRhci54ei5zaWcKPiArIyBodHRwczovL2Z0cC5nbnUub3JnL2dudS9n
YXdrL2dhd2stNS4zLjEudGFyLnh6LnNpZwo+ICAjIFByaW1hcnkga2V5IGZpbmdlcnByaW50OiBE
MTk2IDdDNjMgNzg4NyAxMzE3IDdEODYgIDFFRDcgREY1OSA3ODE1IDkzN0UgQzBEMgo+IC1zaGEy
NTYgIGNhOWMxNmQzZDExZDBmZjhjNjlkNzlkYzBiNDcyNjdlMTMyOWE2OWIzOWI3OTk4OTU2MDRl
ZDQ0N2QzY2E5MGIgIGdhd2stNS4zLjAudGFyLnh6Cj4gK3NoYTI1NiAgNjk0ZGI3NjQ4MTJhNjIz
NjQyM2Q0ZmY0MGNlYjdiNmM0YzQ0MTMwMWI3MmFkNTAyYmI1YzI3ZTAwY2Q1NmY3OCAgZ2F3ay01
LjMuMS50YXIueHoKPiAgIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiAgc2hhMjU2ICA4Y2ViNGI5ZWU1
YWRlZGRlNDdiMzFlOTc1YzFkOTBjNzNhZDI3YjZiMTY1YTFkY2Q4MGM3YzU0NWViNjViOTAzICBD
T1BZSU5HCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ2F3ay9nYXdrLm1rIGIvcGFja2FnZS9nYXdr
L2dhd2subWsKPiBpbmRleCBmZjFiOTkyMGEuLmZiYjYyMGJlNyAxMDA2NDQKPiAtLS0gYS9wYWNr
YWdlL2dhd2svZ2F3ay5tawo+ICsrKyBiL3BhY2thZ2UvZ2F3ay9nYXdrLm1rCj4gQEAgLTQsNyAr
NCw3IEBACj4gICMKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgCj4gLUdBV0tfVkVSU0lP
TiA9IDUuMy4wCj4gK0dBV0tfVkVSU0lPTiA9IDUuMy4xCj4gIEdBV0tfU09VUkNFID0gZ2F3ay0k
KEdBV0tfVkVSU0lPTikudGFyLnh6Cj4gIEdBV0tfU0lURSA9ICQoQlIyX0dOVV9NSVJST1IpL2dh
d2sKPiAgR0FXS19ERVBFTkRFTkNJRVMgPSBob3N0LWdhd2sKPiAtLSAKPiAyLjQzLjAKPiAKPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0t
LS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJc
IEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwg
U29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAg
ICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1Qg
ICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3Jn
LyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0t
LS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
