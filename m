Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D665C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 15:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26EEE600B6;
	Wed,  5 Feb 2025 15:12:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4p8itbBVrxe2; Wed,  5 Feb 2025 15:12:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D86C6083D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D86C6083D;
	Wed,  5 Feb 2025 15:12:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F462CD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B5FE409F3
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:12:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hVWvO58QSr2M for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 15:12:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 64CE0409BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64CE0409BD
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 64CE0409BD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:12:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E745443F2;
 Wed,  5 Feb 2025 15:12:51 +0000 (UTC)
Date: Wed, 5 Feb 2025 16:12:50 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, Romain Naour
 <romain.naour@gmail.com>
Message-ID: <20250205161250.3ccc5edc@windsurf>
In-Reply-To: <20241205173643.2334343-3-alex.bennee@linaro.org>
References: <20241205173643.2334343-1-alex.bennee@linaro.org>
 <20241205173643.2334343-3-alex.bennee@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeejlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehudetueefkeeiveeigeeugeeigfdvveehgffguddtieeuvddtgfelvdegveelieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheprghlvgigrdgsvghnnhgvvgeslhhinhgrrhhordhorhhgpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegsvghrnhgusehkuhhhlhhsrdhnvghtpdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738768371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L14WRo7S4WfwWstbFKHf9CuIHR/fC3qRYtAbL8C3joE=;
 b=k5QMAGbOXiVOIR8b7cnq3gXArw+m9YX8VTezI77nB1GCuMkbGYm2ye4Im6EuTXikil2Avj
 yqrnJNCHE6nnhfgWgk/ymtiSPn0B4JtOd7DbqS8/bn/VWP6LKjraTOMQegLenxkKAxWI1J
 4OupvcWym7QkyNhViGmzjTfyGHhDtGhMGyOSRkrmI/p3PxL2XHqeLTC8xdDsdQT0DErJmS
 axun0hoqdjVRVr4FmGaO2KYU9nLlHuB+muqCJGXFpmqQ3dsoSOaGC4VmtIhNVrWX6HT40W
 vRrBWGX113uhnfpbgYZhn31dE8NbpwENlDJqdCczNZQpa4uIrLw6+ezUHyRnpQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=k5QMAGbO
Subject: Re: [Buildroot] [PATCH v2 2/4] package/mesa3d: add option to enable
 VIRTIO vulkan driver
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAgNSBEZWMgMjAyNCAxNzozNjo0MSArMDAwMApBbGV4IEJlbm7DqWUgPGFsZXguYmVu
bmVlQGxpbmFyby5vcmc+IHdyb3RlOgoKPiBUaGUgc3VwcG9ydCBmb3IgVmVudXMgKHRoZSBWdWxr
YW4gVmlydElPIGVuY2Fwc3VsYXRpb24pIGluIE1FU0EgaGFzCj4gYmVlbiBzdGFibGUgc2luY2Ug
MjMuMiBzbyBhZGQgYW4gb3B0aW9uIHRvIGVuYWJsZSBpdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBC
ZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0Pgo+IFNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOp
ZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KPiBNZXNzYWdlLUlkOiA8MjAyNDA4MjIxODE1NDYu
NjQ5MDAtNi1iZXJuZEBrdWhscy5uZXQ+Cj4gCj4gLS0tCj4gdjIKPiAgIC0gcmUtYmFzZWQgb24g
QmVybmQncyBzZXJpZXMKPiAgIC0gbWFrZSBjbGVhciBWZW51cyBpcyB0aGUgZW5jYXBzdWxhdGlv
biBmb3IgVnVsa2FuCj4gICAtIGRyb3BwZWQgcHl0aG9uLXB5eWFtbCBhcyBtZXJnZWQgaW4gZWFy
bGllciBidW1wcwo+IC0tLQo+ICBwYWNrYWdlL21lc2EzZC9Db25maWcuaW4gfCA2ICsrKysrKwo+
ICBwYWNrYWdlL21lc2EzZC9tZXNhM2QubWsgfCAxICsKPiAgMiBmaWxlcyBjaGFuZ2VkLCA3IGlu
c2VydGlvbnMoKykKCkkgaGF2ZSBhcHBsaWVkIHRoaXMgcGF0Y2gsIGJ1dCB0aGUgdmVyc2lvbiBw
b3N0ZWQgYnkgQmVybmQgaW4gaGlzCmxhdGVzdCBtZXNhM2Qgc2VyaWVzLgoKVGhhbmtzIQoKVGhv
bWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5k
IEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
