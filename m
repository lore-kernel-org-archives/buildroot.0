Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E3E8C52D7C
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 16:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 318E660ABB;
	Thu,  8 Aug 2024 16:43:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LxBN_bxkGokx; Thu,  8 Aug 2024 16:43:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3289060AF2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3289060AF2;
	Thu,  8 Aug 2024 16:43:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F4DC1BF29F
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 16:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87C2381E4B
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 16:43:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5AgCtSWIxBGO for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 16:43:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5B85481E49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B85481E49
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B85481E49
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 16:43:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC3CE60003;
 Thu,  8 Aug 2024 16:43:45 +0000 (UTC)
Date: Thu, 8 Aug 2024 18:43:45 +0200
To: "=?UTF-8?B?R2HDq2w=?= PORTAY" <gael.portay@gmail.com>
Message-ID: <20240808184345.3bb50701@windsurf>
In-Reply-To: <20240808123938.898039-2-gael.portay@rtone.fr>
References: <20240808123938.898039-1-gael.portay@rtone.fr>
 <20240808123938.898039-2-gael.portay@rtone.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723135426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ed8Scpz1B0nMofE8Wv4/TTQ/w/sLabMJ5F4MTxl772M=;
 b=Y75d2DJ3bHhGUL2KwmQIS5AmWDGaRbsYeiEJXb5S+BQHKNLiB6RA8DsB2hq1AqBgCxHnV7
 euJI9I0NTEqvBF3ojy5iUWzxyoMREey+LWX+QIi+fZ3rv5FP38kp5cmIU0jbMtNUucOGA9
 0ACMtLkGi9S5yioBdJD0rGK1I3XxXSxgZZTwbCRX9MS/JzSu+9P6EnWpvOgcUzIwU4rvWv
 By+bGySzGQVRbz824xFvjKkqkE0/MIGqhgI8nosLFMYb8H0E36Rj0DAMorEHygCQXwLkAq
 0bAgP/i1x5TbDlSx09uxPaF+lryQwh9XlJWYkXuVwi6CcbMaViNIe09SM3D3cw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y75d2DJ3
Subject: Re: [Buildroot] [PATCH 2/2] board/raspberrypi: reword console
 comment
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
Cc: =?UTF-8?B?R2HDq2w=?= PORTAY <gael.portay@rtone.fr>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAgOCBBdWcgMjAyNCAxNDozOTozOCArMDIwMAoiR2HDq2wgUE9SVEFZIiA8Z2FlbC5w
b3J0YXlAZ21haWwuY29tPiB3cm90ZToKCj4gVGhlIFJhc3BiZXJyeSBQaSB3aXRoIEJsdWV0b290
aCBjb25uZWN0aXZpdHkgdXAgdG8gNCAoaS5lLiBaZXJvIFcsIFplcm8KPiAyIFcsIDMsIDQgYW5k
IENvbXB1dGUgTW9kdWxlIDQpIHVzZSB0aGUgbWluaXVhcnQtYnQgb3ZlcmxheSB0byByZXN0b3Jl
Cj4gVUFSVDAgZm9yIHRoZSBzZXJpYWwgY29uc29sZSAobGlrZSB0aGUgUmFzcGJlcnJ5IFBpIGFu
ZCBSYXNwYmVycnkgUGkgMgo+IHRoYXQgaGF2ZSBubyBCbHVldG9vdGgpOyB0aGUgQmx1ZXRvb3Ro
IHVzZXMgdGhlIG1pbmktVUFSVCBpbnN0ZWFkWzFdWzJdLgo+IAo+IFRoaXMgcmV3b3JkcyB0aGUg
Y29tbWVudCBpbnN0ZWFkIG9mIGVudW1lcmF0aW5nIGV2ZXJ5IGhhcmR3YXJlcyB0aGF0IGNhbgo+
IGJlIGV4dGVuZGVkIGluIHRoZSBmdXR1cmUuCj4gCj4gWzFdOiBodHRwczovL3d3dy5yYXNwYmVy
cnlwaS5jb20vZG9jdW1lbnRhdGlvbi9jb21wdXRlcnMvY29uZmlndXJhdGlvbi5odG1sI3VhcnRz
LWFuZC1kZXZpY2UtdHJlZQo+IFsyXTogaHR0cHM6Ly9naXRodWIuY29tL3Jhc3BiZXJyeXBpL2xp
bnV4L2Jsb2IvcnBpLTYuNi55L2FyY2gvYXJtL2Jvb3QvZHRzL292ZXJsYXlzL21pbml1YXJ0LWJ0
LW92ZXJsYXkuZHRzI0w0LUw2Cj4gCj4gU2lnbmVkLW9mZi1ieTogR2HDq2wgUE9SVEFZIDxnYWVs
LnBvcnRheUBydG9uZS5mcj4KPiAtLS0KPiAgYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzB3LnR4
dCAgICAgICAgICAgfCAyICstCj4gIGJvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ18zLnR4dCAgICAg
ICAgICAgIHwgMiArLQo+ICBib2FyZC9yYXNwYmVycnlwaS9jb25maWdfM182NGJpdC50eHQgICAg
ICB8IDIgKy0KPiAgYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzNfcXQ1d2UudHh0ICAgICAgfCAy
ICstCj4gIGJvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ180LnR4dCAgICAgICAgICAgIHwgMiArLQo+
ICBib2FyZC9yYXNwYmVycnlwaS9jb25maWdfNF82NGJpdC50eHQgICAgICB8IDIgKy0KPiAgYm9h
cmQvcmFzcGJlcnJ5cGkvY29uZmlnX2NtNGlvLnR4dCAgICAgICAgfCAyICstCj4gIGJvYXJkL3Jh
c3BiZXJyeXBpL2NvbmZpZ19jbTRpb182NGJpdC50eHQgIHwgMiArLQo+ICBib2FyZC9yYXNwYmVy
cnlwaS9jb25maWdfemVybzJ3LnR4dCAgICAgICB8IDIgKy0KPiAgYm9hcmQvcmFzcGJlcnJ5cGkv
Y29uZmlnX3plcm8yd182NGJpdC50eHQgfCAyICstCj4gIDEwIGZpbGVzIGNoYW5nZWQsIDEwIGlu
c2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKQXBwbGllZCB0byBtYXN0ZXIsIG9mIGNvdXJz
ZSB3aXRob3V0IHRoZSBjaGFuZ2UgaW4KY29uZmlnX3plcm8yd182NGJpdC50eHQsIGFzIEkgZGlk
bid0IGFwcGx5IFBBVENIIDEvMi4gVGhhbmtzIQoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25p
LCBDVE8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRw
czovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
