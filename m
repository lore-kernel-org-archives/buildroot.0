Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2566FC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 13:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3E4C410A7;
	Fri, 12 Jul 2024 13:45:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qyvwnyX6kVN2; Fri, 12 Jul 2024 13:45:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B8EA410D7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B8EA410D7;
	Fri, 12 Jul 2024 13:45:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3DDA51BF59E
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A84A40273
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:45:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lW1W1xxOzEtI for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 13:45:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7C29640240
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C29640240
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C29640240
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 13:45:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3AAE4E000F;
 Fri, 12 Jul 2024 13:45:13 +0000 (UTC)
Date: Fri, 12 Jul 2024 15:45:12 +0200
To: Alexis =?UTF-8?B?TG90aG9yw6k=?= via buildroot <buildroot@buildroot.org>
Message-ID: <20240712154512.3cecec39@windsurf>
In-Reply-To: <20240313224610.2743219-2-alexis.lothore@bootlin.com>
References: <20240313224610.2743219-1-alexis.lothore@bootlin.com>
 <20240313224610.2743219-2-alexis.lothore@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720791913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pOExQNvFE4Vb1LgAsmO+baoWzSeLm2dZYQfCSftc7Xw=;
 b=IhQ3A7HfFDRZfFn191O6LBh0OL0Qiu3saXG1JkGdaKoU35a7F+Ie8EP3oLR4Sd6Xm/BTI2
 6++3K0bwqP8qV5aZSFn374gFl7K4PZFXMyZriyF8hs2FpUuV5PFyUjMldNQHjRRtbaeehB
 nacmYvpEFDK1O4AqXb3sklaM/X9NAzB2lZEZ3ff6u2kFQMeP+R1Mhhh8kT6wKqa4xUxjez
 wa82hMTLfeb8UMkbq3AOcNh0I8MuRJIMzeymG3fvcxKgQkI1haXch/rJ0UOggK4bZpg4M4
 yH899/ez2JEzrmYuvK7eN82z1HAPC4o2sAx2x0aflqYkTbJCed/zn/kVNJw4Kw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IhQ3A7Hf
Subject: Re: [Buildroot] [PATCH 1/2] package/qt5/qt5webkit: fix
 JavaScriptCore parser error
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCAxMyBNYXIgMjAyNCAyMzo0NjowOSArMDEwMApBbGV4aXMgTG90aG9yw6kgdmlhIGJ1
aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgoKPiBGcm9tOiBBbGV4aXMg
TG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgo+IAo+IHF0NXdlYmtpdCBidWls
ZCBjdXJyZW50bHkgZmFpbHMgd2l0aCB0aGUgZm9sbG93aW5nIGVycm9yOgo+IAo+IFsuLi5dIHBh
cnNlci5yYjo1ODc6aW4gYGJsb2NrIGluIHBhcnNlU2VxdWVuY2UnOiB1bmRlZmluZWQgbWV0aG9k
IGA9ficgZm9yIGFuIGluc3RhbmNlIG9mIEFubm90YXRpb24gKE5vTWV0aG9kRXJyb3IpCj4gICBm
cm9tIDxpbnRlcm5hbDprZXJuZWw+OjE4NzppbiBgbG9vcCcKPiAgIGZyb20gL2hvbWUvYWxleGlz
L3NyYy9idWlsZHJvb3RfbWluL291dHB1dC9idWlsZC9xdDV3ZWJraXQtNS4yMTIuMC1hbHBoYTQv
U291cmNlL0phdmFTY3JpcHRDb3JlL29mZmxpbmVhc20vcGFyc2VyLnJiOjU4NjppbiBgcGFyc2VT
ZXF1ZW5jZScKPiAgIGZyb20gL2hvbWUvYWxleGlzL3NyYy9idWlsZHJvb3RfbWluL291dHB1dC9i
dWlsZC9xdDV3ZWJraXQtNS4yMTIuMC1hbHBoYTQvU291cmNlL0phdmFTY3JpcHRDb3JlL29mZmxp
bmVhc20vcGFyc2VyLnJiOjY1NDppbiBgYmxvY2sgaW4gcGFyc2VTZXF1ZW5jZScKPiAgIGZyb20g
PGludGVybmFsOmtlcm5lbD46MTg3OmluIGBsb29wJwo+ICAgZnJvbSAvaG9tZS9hbGV4aXMvc3Jj
L2J1aWxkcm9vdF9taW4vb3V0cHV0L2J1aWxkL3F0NXdlYmtpdC01LjIxMi4wLWFscGhhNC9Tb3Vy
Y2UvSmF2YVNjcmlwdENvcmUvb2ZmbGluZWFzbS9wYXJzZXIucmI6NTg2OmluIGBwYXJzZVNlcXVl
bmNlJwo+ICAgZnJvbSAvaG9tZS9hbGV4aXMvc3JjL2J1aWxkcm9vdF9taW4vb3V0cHV0L2J1aWxk
L3F0NXdlYmtpdC01LjIxMi4wLWFscGhhNC9Tb3VyY2UvSmF2YVNjcmlwdENvcmUvb2ZmbGluZWFz
bS9wYXJzZXIucmI6ODE0OmluIGBwYXJzZURhdGEnCj4gICBmcm9tIC9ob21lL2FsZXhpcy9zcmMv
YnVpbGRyb290X21pbi9vdXRwdXQvYnVpbGQvcXQ1d2Via2l0LTUuMjEyLjAtYWxwaGE0L1NvdXJj
ZS9KYXZhU2NyaXB0Q29yZS9vZmZsaW5lYXNtL3BhcnNlci5yYjo4MTg6aW4gYHBhcnNlJwo+ICAg
ZnJvbSAvaG9tZS9hbGV4aXMvc3JjL2J1aWxkcm9vdF9taW4vb3V0cHV0L2J1aWxkL3F0NXdlYmtp
dC01LjIxMi4wLWFscGhhNC9Tb3VyY2UvSmF2YVNjcmlwdENvcmUvb2ZmbGluZWFzbS9wYXJzZXIu
cmI6NzgwOmluIGBibG9jayBpbiBwYXJzZVNlcXVlbmNlJwo+ICAgZnJvbSA8aW50ZXJuYWw6a2Vy
bmVsPjoxODc6aW4gYGxvb3AnCj4gICBmcm9tIC9ob21lL2FsZXhpcy9zcmMvYnVpbGRyb290X21p
bi9vdXRwdXQvYnVpbGQvcXQ1d2Via2l0LTUuMjEyLjAtYWxwaGE0L1NvdXJjZS9KYXZhU2NyaXB0
Q29yZS9vZmZsaW5lYXNtL3BhcnNlci5yYjo1ODY6aW4gYHBhcnNlU2VxdWVuY2UnCj4gICBmcm9t
IC9ob21lL2FsZXhpcy9zcmMvYnVpbGRyb290X21pbi9vdXRwdXQvYnVpbGQvcXQ1d2Via2l0LTUu
MjEyLjAtYWxwaGE0L1NvdXJjZS9KYXZhU2NyaXB0Q29yZS9vZmZsaW5lYXNtL3BhcnNlci5yYjo2
MjU6aW4gYGJsb2NrIGluIHBhcnNlU2VxdWVuY2UnCj4gICBmcm9tIDxpbnRlcm5hbDprZXJuZWw+
OjE4NzppbiBgbG9vcCcKPiAgIGZyb20gL2hvbWUvYWxleGlzL3NyYy9idWlsZHJvb3RfbWluL291
dHB1dC9idWlsZC9xdDV3ZWJraXQtNS4yMTIuMC1hbHBoYTQvU291cmNlL0phdmFTY3JpcHRDb3Jl
L29mZmxpbmVhc20vcGFyc2VyLnJiOjU4NjppbiBgcGFyc2VTZXF1ZW5jZScKPiAgIGZyb20gL2hv
bWUvYWxleGlzL3NyYy9idWlsZHJvb3RfbWluL291dHB1dC9idWlsZC9xdDV3ZWJraXQtNS4yMTIu
MC1hbHBoYTQvU291cmNlL0phdmFTY3JpcHRDb3JlL29mZmxpbmVhc20vcGFyc2VyLnJiOjgxNDpp
biBgcGFyc2VEYXRhJwo+ICAgZnJvbSAvaG9tZS9hbGV4aXMvc3JjL2J1aWxkcm9vdF9taW4vb3V0
cHV0L2J1aWxkL3F0NXdlYmtpdC01LjIxMi4wLWFscGhhNC9Tb3VyY2UvSmF2YVNjcmlwdENvcmUv
b2ZmbGluZWFzbS9wYXJzZXIucmI6ODE4OmluIGBwYXJzZScKPiAgIGZyb20gL2hvbWUvYWxleGlz
L3NyYy9idWlsZHJvb3RfbWluL291dHB1dC9idWlsZC9xdDV3ZWJraXQtNS4yMTIuMC1hbHBoYTQv
U291cmNlL0phdmFTY3JpcHRDb3JlL29mZmxpbmVhc20vZ2VuZXJhdGVfb2Zmc2V0X2V4dHJhY3Rv
ci5yYjo2ODppbiBgPG1haW4+Jwo+IAo+IFRoaXMgaXNzdWUgaXMgZHVlIHRvID1+IGJlaW5nIG1h
cmtlZCBhcyBkZXByZWNhdGVkIHNpbmNlIGEgZmV3IFJ1YnkKPiB2ZXJzaW9ucywgYW5kIGZpbmFs
bHkgcmVtb3ZlZCBpbiAzLjIuMCBbMV0uIFRoaXMgbm93IGJyZWFrcyB0aGUgYnVpbGQgc2luY2UK
PiBidWlsZHJvb3QgaGFzIG1vdmVkIHRvIFJ1YnkgdjMuMy4wLgo+IFRoZSBjb3JyZXNwb25kaW5n
IGZpeCBoYXMgYWxyZWFkeSBiZWVuIGlzc3VlZCBpbiB1cHN0cmVhbSBXZWJraXQgcHJvamVjdAo+
IFsyXSwgYnV0IHF0NXdlYmtpdCB2ZXJzaW9uIHRyYWNrZWQgaW4gYnVpbGRyb290IGRvZXMgbm90
IGhhdmUgdGhlCj4gY29ycmVzcG9uZGluZyB3ZWJraXQgdmVyc2lvbiBwdWxsZWQuIEZpeCB0aGlz
IGJ1aWxkIGVycm9yIGJ5IGJyaW5naW5nIHRoZSB1cHN0cmVhbQo+IHBhdGNoLiBUaGUgcGF0Y2gg
aXMgc2xpZ2h0bHkgbW9kaWZpZWQgKGV4Y2x1ZGUgcGFydCBhYm91dCBDaGFuZ2Vsb2cgZmlsZSwK
PiB3aGljaCBpcyBhYnNlbnQgZnJvbSBxdDV3ZWJraXQpCj4gCj4gWzFdIGh0dHBzOi8vd3d3LnJ1
YnktbGFuZy5vcmcvZW4vbmV3cy8yMDIyLzEyLzI1L3J1YnktMy0yLTAtcmVsZWFzZWQvCj4gWzJd
IGh0dHBzOi8vZ2l0aHViLmNvbS9XZWJLaXQvV2ViS2l0L2NvbW1pdC9jN2QxOWE0OTJkOTdmOTI4
MmE1NDY4MzFiZWI5MThlMDMzMTVmNmVmCj4gCj4gU2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhv
csOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KPiAtLS0KPiAgLi4ubmdzLXdpdGgtbmV3
ZXItUnVieS12ZXJzaW9ucy1odHRwcy1iLnBhdGNoIHwgNDggKysrKysrKysrKysrKysrKysrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
cGFja2FnZS9xdDUvcXQ1d2Via2l0LzAwMDctT2ZmbGluZWFzbS13YXJuaW5ncy13aXRoLW5ld2Vy
LVJ1YnktdmVyc2lvbnMtaHR0cHMtYi5wYXRjaAoKQXBwbGllZCB0byBtYXN0ZXIgYWZ0ZXIgYWRk
aW5nIGEgcmVmZXJlbmNlIHRvIHRoZSBhdXRvYnVpbGRlciBpc3N1ZQpiZWluZyBmaXhlZCBieSB0
aGlzIGNvbW1pdC4gVGhhbmtzIQoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJv
b3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3Rs
aW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
