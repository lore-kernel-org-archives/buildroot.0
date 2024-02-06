Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAA8C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 22:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 725AD41ED7;
	Tue,  6 Feb 2024 22:31:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SmeqEmRKqmwg; Tue,  6 Feb 2024 22:31:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7924D4203B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7924D4203B;
	Tue,  6 Feb 2024 22:31:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F25EC1BF276
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 22:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC1ED83077
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 22:31:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yLspg41hxAun for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 22:31:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D189D830AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D189D830AB
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D189D830AB
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 22:31:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EACDD240003;
 Tue,  6 Feb 2024 22:31:16 +0000 (UTC)
Date: Tue, 6 Feb 2024 23:31:16 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20240206233116.7f7c2602@windsurf>
In-Reply-To: <20231218220457.1705749-1-adam.duskett@amarulasolutions.com>
References: <20231218220457.1705749-1-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707258677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1F9punRBGtEMDs1BJ/+8MdLiJMuWXVTjlQZLNEJdkIc=;
 b=VAiD3UiqZuDS4cQajEfI5ZR2Ad4Jvb9lp8M+aFgIGkNr9RhThEVmac3vG964lSfz/LjPeh
 BOkG9GIDdDHRfTGQeMxemt8JkbpGk+IY/s2u7pT7yr9BUD6Q0v9fVAEGIkxWQtiLH43WhW
 NefPiJsgmuLAoTEFI9gRTva2ZKnBT4bJKwWjcRUvaGk6MuqwsYMqjSHfvzmLw/zYY6ZTBu
 fMuEwLg8Ocib0ZSpCijO8mr1jeSVAt2pL0ZqrWimV+1vCmmgruoLgkM22OMpgQJl/AChpx
 AwKTiCA2cTBfVR0VJ8kB/Z8eAl3YChnZqwi88CaD646yX6Au4+ZCTaI3HTSegw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VAiD3Uiq
Subject: Re: [Buildroot] [PATCH v4 1/3] package/python-pygame: drop package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCAxOCBEZWMgMjAyMyAxNTowNDo1NCAtMDcwMApBZGFtIER1c2tldHQgPGFkYW0uZHVz
a2V0dEBhbWFydWxhc29sdXRpb25zLmNvbT4gd3JvdGU6Cgo+IFRoZSBweXRob24tcHlnYW1lIHBh
Y2thZ2UgaGFzIG5vdCByZWNpZXZlZCBhbnkgdXBkYXRlIHNpbmNlCj4gU3VuIE1heSAxIDIyOjE1
OjE3IDIwMTYgKGNvbW1pdDogYTllYzk2ZTU0NTEwMmFlNWNjZDQyODAzMjNkMzUzNjBiMGE1MDcy
ZCkKPiAKPiBBbHNvLCB0aGlzIHBhY2thZ2Ugbm8gbG9uZ2VyIGJ1aWxkcyBwcm9wZXJseSBhZ2Fp
bnN0IHB5dGhvbiAzLjEyLjAuIFJlY2lldmluZwo+IHRoZSBmb2xsb3dpbmcgZXJyb3Igd2hlbiBi
dWlsZGluZzoKPiAKPiBgYGAKPiBzcmMvc3VyZmFjZS5jOjI4MTI6MTQ6IGVycm9yOiBpbnZhbGlk
IHR5cGUgYXJndW1lbnQgb2YgdW5hcnkg4oCYKuKAmSAoaGF2ZQo+IOKAmGludOKAmSkKPiAgMjgx
MiB8ICAgICAgICAgY2ggPSAqUHlVbmljb2RlX0FTX1VOSUNPREUgKG9iaik7Cj4gICAgICAgfCAg
ICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gc3JjL3N1cmZhY2UuYzog
SW4gZnVuY3Rpb24g4oCYUHlTdXJmYWNlX0JsaXTigJk6Cj4gYGBgCj4gCj4gSWYgc29tZW9uZSB3
YW50cyB0byByZS1pbnRyb2R1Y2UgdGhpcyBwYWNrYWdlIGF0IGEgbGF0ZXIgZGF0ZSB0aGV5IGFy
ZSBtb3JlCj4gdGhhbiB3ZWxjb21lIHRvIGRvIHNvIQo+IAo+IFNpZ25lZC1vZmYtYnk6IEFkYW0g
RHVza2V0dCA8YWRhbS5kdXNrZXR0QGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+IC0tLQo+ICBDb25m
aWcuaW4ubGVnYWN5ICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA5ICsrCj4gIERFVkVMT1BF
UlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgLQo+ICBwYWNrYWdlL0NvbmZp
Zy5pbiAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxIC0KPiAgcGFja2FnZS9weXRob24tcHln
YW1lL0NvbmZpZy5pbiAgICAgICAgICB8ICA1MCAtLS0tLS0tLS0tCj4gIHBhY2thZ2UvcHl0aG9u
LXB5Z2FtZS9weXRob24tcHlnYW1lLmhhc2ggfCAgIDMgLQo+ICBwYWNrYWdlL3B5dGhvbi1weWdh
bWUvcHl0aG9uLXB5Z2FtZS5tayAgIHwgMTExIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDYg
ZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxNjYgZGVsZXRpb25zKC0pCj4gIGRlbGV0
ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1weWdhbWUvQ29uZmlnLmluCj4gIGRlbGV0ZSBt
b2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1weWdhbWUvcHl0aG9uLXB5Z2FtZS5oYXNoCj4gIGRl
bGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1weWdhbWUvcHl0aG9uLXB5Z2FtZS5tawoK
QXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwg
Q1RPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6
Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
