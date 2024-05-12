Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0391EC10F1A
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 10:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0EF14053D;
	Sun, 12 May 2024 10:29:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XmVZ745vVu1g; Sun, 12 May 2024 10:29:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC2A640BA2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC2A640BA2;
	Sun, 12 May 2024 10:29:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E1481BF290
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17B5A4053D
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:29:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YHeg-tpwmDYO for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 10:29:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C260840B21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C260840B21
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C260840B21
 for <buildroot@buildroot.org>; Sun, 12 May 2024 10:29:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CEF2940005;
 Sun, 12 May 2024 10:29:14 +0000 (UTC)
Date: Sun, 12 May 2024 12:29:14 +0200
To: Jan =?UTF-8?B?xIxlcm3DoWs=?= <sairon@sairon.cz>
Message-ID: <20240512122914.38c9b8b7@windsurf>
In-Reply-To: <20240301094949.175637-1-sairon@sairon.cz>
References: <20240301094949.175637-1-sairon@sairon.cz>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715509755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HCCmLBRuAyW0xEEhAfCZoDOeSp4u+XZvHB8AWLmRpew=;
 b=ScePaId2scDkl4cEDYoORfEsuxc1FEGgXYqDklL3NJ/o2iuobQikq6/A2pQBcTlKzo5OIV
 x3KTJlql5FIu8MUeB2pOD/1sj+/1BBjFjLIxgsiV7IAcDP1XUaddMol4KzNISGuVyYGYTR
 iHdKJ30+CXOECwlgAQ3CjQ+rcXp8lDKMm5hWOeH5oqOeJXBCEOMRE1Ugp8CSv+O6TqwiPo
 lYKnAUgErfAk5iZJRQeITlSD1fuHny2q8GElwyPmarzu2i0Uc7IgGLTIqjbWy+JdYPQZDr
 ZYoi+YMi+QuqhiDkVsnYU1gOdv/4+PbENciUR0EGo2YbBzX/CsdWJ1tnKSRu7w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ScePaId2
Subject: Re: [Buildroot] [PATCH v2] linux-firmware: add options for missing
 Intel b/g/n cards
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
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCAgMSBNYXIgMjAyNCAxMDo0OTo0OCArMDEwMApKYW4gxIxlcm3DoWsgPHNhaXJvbkBz
YWlyb24uY3o+IHdyb3RlOgoKPiBBZGQgZmlybXdhcmUgZmlsZXMgZm9yIG1pc3NpbmcgY2FyZHMg
ZnJvbSB0aGUgODAyLjExYmduIHByb2R1Y3QgbGlzdAo+IGluIHRoZSBMaW51eCBGaXJtd2FyZSBX
aWtpIFsxXS4KPiAKPiBTbyBmYXIgb25seSBXaXJlbGVzcy1OIDEzMCBhbmQgMTAzMCB3ZXJlIHN1
cHBvcnRlZCwgd2hpY2ggdXNlIHRoZQo+IDYwMDBHMkIgbWljcm9jb2RlLgo+IAo+IFsxXSBodHRw
czovL3dpcmVsZXNzLndpa2kua2VybmVsLm9yZy9lbi91c2Vycy9kcml2ZXJzL2l3bHdpZmkjc3Vw
cG9ydGVkX2RldmljZXMKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gxIxlcm3DoWsgPHNhaXJvbkBz
YWlyb24uY3o+Cj4gLS0tCj4gIHBhY2thZ2UvbGludXgtZmlybXdhcmUvQ29uZmlnLmluICAgICAg
ICAgfCAzNiArKysrKysrKysrKysrKysrKysrKysrKysKPiAgcGFja2FnZS9saW51eC1maXJtd2Fy
ZS9saW51eC1maXJtd2FyZS5tayB8IDMwICsrKysrKysrKysrKysrKysrKysrCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgNjYgaW5zZXJ0aW9ucygrKQoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcyEKClRo
b21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgQ1RPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFu
ZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
