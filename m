Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0485EC83F03
	for <buildroot@archiver.kernel.org>; Wed,  9 Jul 2025 15:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C55D640A4E;
	Wed,  9 Jul 2025 15:17:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AjVJGEGSJCn6; Wed,  9 Jul 2025 15:17:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40F6940838
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40F6940838;
	Wed,  9 Jul 2025 15:17:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E4BC012E
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 15:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB314606D3
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 15:17:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wyRIonVLUhlR for <buildroot@buildroot.org>;
 Wed,  9 Jul 2025 15:17:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 032C56060B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 032C56060B
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 032C56060B
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 15:17:31 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::235])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 8226158038B
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 15:04:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 750EF4428F;
 Wed,  9 Jul 2025 15:04:23 +0000 (UTC)
Date: Wed, 09 Jul 2025 17:04:15 +0200
MIME-Version: 1.0
Message-Id: <20250709-perf_libtraceevent-v2-2-3ea54fbe6b5b@bootlin.com>
References: <20250709-perf_libtraceevent-v2-0-3ea54fbe6b5b@bootlin.com>
In-Reply-To: <20250709-perf_libtraceevent-v2-0-3ea54fbe6b5b@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Olivier Benjamin <olivier.benjamin@bootlin.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefjeekjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevgefhteffuefhheekkeelffffvdeugffgveejffdtvdffudehtedtieevteetnecukfhppedvrgdtvdemkeegvdekmeehvggsieemuddvtddumegrfhguieemfehfsggsmegrugdtkeemkehfleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemhegvsgeimeduvddtudemrghfugeimeeffhgssgemrggutdekmeekfheliedphhgvlhhopegludelvddrudeikedruddrgeejngdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlu
 ghrohhothdrohhrghdprhgtphhtthhopegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopeholhhivhhivghrrdgsvghnjhgrmhhinhessghoohhtlhhinhdrtghomh
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1752073463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bmpDgo0TAqFgaPDq4FgYMNr+8eSPlzwN6obl2AyAznc=;
 b=GPRSR64xPLTbtS+A/mo5WpPRxpFmZOEG2kNa44Nj062HkEfj/57xpkB5zpHpQm2fofTGS4
 HNMje6eqFtX2dSj7TNQEmhBWoMuWPV3rt+ZqtGDPlp2rmdow3A1MJw38W9eyKvk2dhefPe
 MbbsndfLD2fEJgHuIyfnepLnUor230TXXDsfeX+Z/ByGfvQpKh/H5UQU2aOuOEg9cVzJxF
 r4twlihPLtiGC9Dkxd6KkqT6lzfj1XYFaaH7UkK0hjhJ9RVprqrm/P7EUr6j12Lr+2UaOV
 NHfCwiMTjs979Pukx4uFh4MEHuFZTLqnAL/JohhYNeyyWTJ9BFZU6p0UGrYqpg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GPRSR64x
Subject: [Buildroot] [PATCH v2 2/2] packages/linux-tools: perf: enforce
 PKG_CONFIG_LIBDIR
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rm9yIGtlcm5lbCBwYXRjaGVkIHdpdGggNDQwY2Y3NzYyNWUzICgicGVyZjogYnVpbGQ6IFNldHVw
ClBLR19DT05GSUdfTElCRElSIGZvciBjcm9zcyBjb21waWxhdGlvbiIpLCBpZiBuZWl0aGVyIFBL
R19DT05GSUdfTElCRElSLApQS0dfQ09ORklHX1BBVEggbm9yIFBLR19DT05GSUdfU1lTUk9PVF9E
SVIgYXJlIHByb3ZpZGVkLCB0aGUgcGVyZgpNYWtlZmlsZSB3aGlsZSB0cnkgdG8gc2V0IHNvbWUg
ZGVmYXVsdCB2YWx1ZSBmb3IgUEtHX0NPTkZJR19MSUJESVIsCndoaWNoIHdpbGwgbm90IHBvaW50
IGNvcnJlY3RseSB0byBidWlsZHJvb3Qgc3RhZ2luZyBkaXJlY3RvcnkuIFRoaXMKaXNzdWUgd2ls
bCBsZWFkIGZvciBleGFtcGxlIHRvIGEgZmFpbHVyZSB0byBmaW5kIGxpYnRyYWNlZXZlbnQgZXZl
bgppZiBpdCBpcyBjb3JyZWN0bHkgZW5hYmxlZCBhbmQgaW5zdGFsbGVkIGluIHRoZSBzdGFnaW5n
IGRpciwgYW5kIHNvIGl0CndpbGwgbWFrZSBwZXJmIGZhaWwgdG8gYnVpbGQuCgpNYWtlIHN1cmUg
dG8gY2FsbCB0aGUgcGVyZiBtYWtlIGNvbW1hbmQgd2l0aCBQS0dfQ09ORklHX0xJQkRJUiB2YXJp
YWJsZQpzZXQgYW5kIHBvaW50aW5nIHRvIGJ1aWxkcm9vdCBzdGFnaW5nIGFyZWEgdG8gbWFrZSBz
dXJlIHRvIHByb3Blcmx5CmRldGVjdCBwZXJmIGRlcGVuZGVuY2llcy4KClNpZ25lZC1vZmYtYnk6
IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+Ci0tLQpDaGFuZ2Vz
IGluIHYyOgotIG5ldyBwYXRjaAotLS0KIHBhY2thZ2UvbGludXgtdG9vbHMvbGludXgtdG9vbC1w
ZXJmLm1rLmluIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL2xpbnV4LXRvb2xzL2xpbnV4LXRvb2wtcGVyZi5tay5pbiBiL3BhY2thZ2Uv
bGludXgtdG9vbHMvbGludXgtdG9vbC1wZXJmLm1rLmluCmluZGV4IDFlMTllZTdmMWM0ZTQ2ZDIx
MGMwNzlkNzk2Zjk0NjFmMmJmYWFlMDguLjMyMzg5NDhkNzYwODkyMGQ2YzIzNmU0N2ZjZGNlOGEz
MWZiNjc1NDUgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGludXgtdG9vbHMvbGludXgtdG9vbC1wZXJm
Lm1rLmluCisrKyBiL3BhY2thZ2UvbGludXgtdG9vbHMvbGludXgtdG9vbC1wZXJmLm1rLmluCkBA
IC0yMyw2ICsyMyw3IEBAIFBFUkZfTUFLRV9GTEFHUyA9IFwKIAlKT0JTPSQoUEFSQUxMRUxfSk9C
UykgXAogCUFSQ0g9JChQRVJGX0FSQ0gpIFwKIAlERVNURElSPSQoVEFSR0VUX0RJUikgXAorCVBL
R19DT05GSUdfTElCRElSPSIkKFNUQUdJTkdfRElSKS91c3IvbGliL3BrZ2NvbmZpZyIgXAogCXBy
ZWZpeD0vdXNyIFwKIAlOT19HVEsyPTEgXAogCU5PX0xJQlBFUkw9MSBcCgotLSAKMi41MC4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
