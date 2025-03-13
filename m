Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD4FC282DE
	for <buildroot@archiver.kernel.org>; Thu, 13 Mar 2025 09:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 269274080E;
	Thu, 13 Mar 2025 09:44:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bNEO4bW5zlqP; Thu, 13 Mar 2025 09:44:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0760C412DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0760C412DD;
	Thu, 13 Mar 2025 09:44:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 39486EA
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 09:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0EF1860853
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 09:44:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p0-Gso6N7UeZ for <buildroot@buildroot.org>;
 Thu, 13 Mar 2025 09:44:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BAE276100B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAE276100B
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BAE276100B
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 09:44:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 794FA43147;
 Thu, 13 Mar 2025 09:44:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tsf6o-00D9xk-2C;
 Thu, 13 Mar 2025 10:44:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Gero =?utf-8?Q?Schw=C3=A4ricke?= <gero.schwaericke@sevenlab.de>
Cc: buildroot@buildroot.org
References: <20250309105806.157831-1-gero.schwaericke@sevenlab.de>
Date: Thu, 13 Mar 2025 10:44:10 +0100
In-Reply-To: <20250309105806.157831-1-gero.schwaericke@sevenlab.de> ("Gero
 =?utf-8?Q?Schw=C3=A4ricke=22's?= message of "Sun, 9 Mar 2025 11:58:02
 +0100")
Message-ID: <87ldt96z9x.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdejiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefufhffjgfkfgggtgfgsehtqhdttddtreejnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepgeehleeikedtgeduvdduhefglefgudelvdevkeefhfejtefgvdeukeegkeehffehnecuffhomhgrihhnpehsthdrtghomhenucfkphepudejkedrudduledruddrudefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeekrdduudelrddurddufeejpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehgvghrohdrshgthhifrggvrhhitghkvgesshgvvhgvnhhlrggsrdguvgdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1]
 board/stmicroelectronics/stm32mp135f-dk: fix boot steps in readme
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

Pj4+Pj4gIkdlcm8iID09IEdlcm8gU2Nod8Okcmlja2UgPGdlcm8uc2Nod2Flcmlja2VAc2V2ZW5s
YWIuZGU+IHdyaXRlczoKCiA+IFRoZSBpbnN0cnVjdGlvbnMgaW4gdGhlIHJlYWRtZSB1c2UgaW5j
b3JyZWN0IGNvbm5lY3RvciBuYW1lcy4KID4gU2VlIGFsc28gdGhlIG9mZmljaWFsIGRldmtpdCBk
b2N1bWVudGF0aW9uOgogPiBodHRwczovL3dpa2kuc3QuY29tL3N0bTMybXB1L3dpa2kvR2V0dGlu
Z19zdGFydGVkL1NUTTMyTVAxX2JvYXJkcy9TVE0zMk1QMTM1eC1ESy9MZXQlMjdzX3N0YXJ0L1Vu
cGFja190aGVfU1RNMzJNUDEzNXgtREtfYm9hcmQjT3V0LW9mLXRoZS1ib3hfa2l0CgogPiBBbHNv
IHRoZSBib2FyZCBkb2VzIG5vdCBzaG93IHRoZSBjb25zb2xlIG9uIHRoZSBzY3JlZW4uCgogPiBU
aGlzIG1heSBoYXZlIGJlZW4gYSBjb3B5ICYgcGFzdGUgb3ZlcnNpZ2h0IGZyb20gdGhlIFNUTTMy
TVAxNTcgcmVhZG1lLgoKID4gU2lnbmVkLW9mZi1ieTogR2VybyBTY2h3w6RyaWNrZSA8Z2Vyby5z
Y2h3YWVyaWNrZUBzZXZlbmxhYi5kZT4KCkNvbW1pdHRlZCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0
ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
