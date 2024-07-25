Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E975BC3DA49
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 16:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B59CC60A69;
	Thu, 25 Jul 2024 16:10:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p3gCr0XhQrl6; Thu, 25 Jul 2024 16:10:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBAA060A9A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBAA060A9A;
	Thu, 25 Jul 2024 16:10:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C9DFE1BF330
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 16:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9243404C0
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 16:10:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VWMsMNkiZcKY for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 16:10:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6196C404CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6196C404CC
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6196C404CC
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 16:10:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8261A1BF204;
 Thu, 25 Jul 2024 16:10:49 +0000 (UTC)
Date: Thu, 25 Jul 2024 18:10:48 +0200
To: =?UTF-8?B?Sm9zw6k=?= Mendes <jp.baltazar.mendes@gmail.com>
Message-ID: <20240725181048.11efa805@windsurf>
In-Reply-To: <CAFAK9+cYzvio3MuLh+WKJ6y1dJi+BMU_ywRoyH9wG8XFPMtD-A@mail.gmail.com>
References: <CAFAK9+cYzvio3MuLh+WKJ6y1dJi+BMU_ywRoyH9wG8XFPMtD-A@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721923849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JNk+Mg+5ZJTvPYfe2ylb4IwZAmMvgFXcqnMlwCSRdyo=;
 b=X4HhrZP+N+cXY+VAcC09B8YD1vykqmeJ5uXt5Drt2Hyy2ZSXfrgKCOvC/6VZ9eG2/mhRc2
 dpWxCZl8WCjw/d3z/G8Sz0RB5ayGb6F6u5Dy+oGpERfNRnxAD0+VqLzLlbCPesVhpyREMR
 g4W4Byr66vLD8h9ALdRhr6PktuYgEhiuBtvf8ZQQy4laaASaWUyJevyc3vCGOKKBfskunp
 N6AUxEFYBTFdegS1AqAesgA7GYzxTQufUcNYuJdgHH8jcPxeVqJHJLaw27elmzVmudX3IX
 XrtbUoOMwlud+nwzYdb94Q6f7tKnbNAPuNlLMAWRde0URPNq+wFVZJrbBp/UPA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=X4HhrZP+
Subject: Re: [Buildroot] Individual package configs
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBUaHUsIDI1IEp1bCAyMDI0IDE3OjI2OjUxICswMjAwCkpvc8OpIE1lbmRlcyA8
anAuYmFsdGF6YXIubWVuZGVzQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IEkndmUgbm90aWNlZCB0aGF0
IHRoZSBjb25maWdzIHByb2R1Y2VkIGJ5IGluZGl2aWR1YWwgcGFja2FnZSBjb21tYW5kcyBkb24n
dAo+IGV2ZXIgZ2V0IHdyaXR0ZW4gdG8gdGhlIC5jb25maWcuCj4gCj4gSXMgdGhlcmUgYSB3YXkg
dG8gcHJvZHVjZSBhIGRlZmNvbmZpZyB3aXRoIHRoZSBpbmRpdmlkdWFsIHBhY2thZ2UgY2hhbmdl
cz8KPiAKPiBJIHNwZWNpZmljYWxseSBuZWVkOgo+IC0gVS1Cb290Cj4gLSBzd3VwZGF0ZQo+IC0g
bGludXgKCm1ha2UgbGludXgtc2F2ZWRlZmNvbmZpZyB3aWxsIHRha2UgdGhlIC5jb25maWcgaW4K
b3V0cHV0L2J1aWxkL2xpbnV4LTx2ZXJzaW9uPi8gYW5kIHR1cm4gaXQgaW50bwpvdXRwdXQvYnVp
bGQvbGludXgtPHZlcnNpb24+L2RlZmNvbmZpZwoKbWFrZSBsaW51eC11cGRhdGUtY29uZmlnIHdp
bGwgdGFrZSB0aGUgLmNvbmZpZyBpbgpvdXRwdXQvYnVpbGQvbGludXgtPHZlcnNpb24+LyBhbmQg
Y29weSBpdCB0byB0aGUgbG9jYXRpb24gZGVmaW5lZCBieQpCUjJfTElOVVhfS0VSTkVMX0NVU1RP
TV9DT05GSUdfRklMRS4KCm1ha2UgbGludXgtdXBkYXRlLWRlZmNvbmZpZyB3aWxsIHRha2UgdGhl
IC5jb25maWcgaW4Kb3V0cHV0L2J1aWxkL2xpbnV4LTx2ZXJzaW9uPi8sIHR1cm4gaXQgaW50byBh
IGRlZmNvbmZpZyBhbmQgY29weSB0aGlzCmRlZmNvbmZpZyB0byB0aGUgbG9jYXRpb24gZGVmaW5l
ZCBieQpCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9DT05GSUdfRklMRS4KClRoZXNlIG1ha2UgdGFy
Z2V0cyBleGlzdCBmb3IgYWxsIHBhY2thZ2VzIHRoYXQgdXNlIGtjb25maWcuClNlZSBodHRwczov
L2J1aWxkcm9vdC5vcmcvZG93bmxvYWRzL21hbnVhbC9tYW51YWwuaHRtbCNjdXN0b21pemUtc3Rv
cmUtcGFja2FnZS1jb25maWcKYWxzbywgYXMgd2VsbAphcyBodHRwczovL2Jvb3RsaW4uY29tL2Rv
Yy90cmFpbmluZy9idWlsZHJvb3QvYnVpbGRyb290LXNsaWRlcy5wZGYKc3RhcnRpbmcgZnJvbSBz
bGlkZSA3NS4KCkhvcGUgdGhpcyBoZWxwcyEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwg
Y28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2lu
ZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
