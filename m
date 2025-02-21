Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67829C021AA
	for <buildroot@archiver.kernel.org>; Fri, 21 Feb 2025 09:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D5528204F;
	Fri, 21 Feb 2025 09:58:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vuYBA7VgWh3I; Fri, 21 Feb 2025 09:58:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10F688216D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10F688216D;
	Fri, 21 Feb 2025 09:58:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id ABE85D92
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 09:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A715C60714
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 09:58:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8FMCFzMuQl2G for <buildroot@buildroot.org>;
 Fri, 21 Feb 2025 09:58:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 695986071B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 695986071B
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 695986071B
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 09:58:04 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 5FA7958011B
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 09:30:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1AC134411B;
 Fri, 21 Feb 2025 09:30:25 +0000 (UTC)
Date: Fri, 21 Feb 2025 10:30:23 +0100
Message-Id: <20250221-fixes_octavo-v2-0-0bb2012512eb@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAK9HuGcC/x3LQQqAIBBA0avErBNMsbCrRIToWLPR0JBAvHvS8
 vH5FTImwgzrUCFhoUwxdIhxAHuZcCIj1w2CC8XFpJmnF/MR7WNKZPOijfHSKukk9OVO+Pd+bHt
 rH8grB+peAAAA
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>, thomas.petazzoni@bootlin.com, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeileeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtkeertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudeggfduffethfdtgeehtdeiieeuveelleduieeiteejkeetheelheefteeugfegnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudelmeelhegrvgemlehftddtmegugehfrgemvdeksggumegskegvleemvdgvvghfnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemleehrggvmeelfhdttdemugegfhgrmedvkegsugemsgekvgelmedvvggvfhdphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesshhmihhlvgdrfhhrpdhrtghpthhtohepkhhorhihrdhmr
 ghinhgtvghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1740130225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lV6m7r2m6/LNNgpK/3eWkg1ptde4iOEtkXM5COfKxso=;
 b=p01a2xyGAsq1usolmg3xqebVVvGUKgTyFofxuRvK1Q6BRw3e/3kl1u6T5HLM1R1Xy64we6
 LyIjB4u84oYEGKajtpAvi/IUYlhFUN/jwLr0IDvTaUnl0P4wIjsnYVzp0903YL+5Exfx0t
 R3eHFqhRxxYlR4OQRHT15e2SXIww1enRU7hTD9c2qCy3mI3snLlsR3KFh8XU7jn6gp6Vjv
 C1rO9zvC+YtA7K2e2WOziL1rSueABhrhVpt/cwHSmz7Qv45uAp5Q+ko9zW6UtsBGDiF7Xs
 IybS+rI20/ntVZxPMVY4F4UY+1jE8qNUk9v3CzV5h54DxAf9xG4EK3T59SSznw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=p01a2xyG
Subject: [Buildroot] [PATCH v2 0/3] Fix Octavo board build
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rml4IFRGLUEgYW5kIExpbnV4IGJ1aWxkIGVycm9ycyBieSBpbXBvcnRpbmcgdGhlIG5lY2Vzc2Fy
eSBwYXRjaGVzLgpBdCB0aGUgc2FtZSB0aW1lLCB1cGRhdGUgdGhlIHRvb2xjaGFpbiB0byB1c2Ug
dGhlIEJvb3RsaW4gc3RhYmxlIHRvb2xjaGFpbiwKZm9sbG93aW5nIHRoZSByZWNvbW1lbmRlZCBn
dWlkZWxpbmVzLgoKQ2hhbmdlIGluIHYyOgotIEFkZCBwYXRjaCAyIGFuZCAzLgoKU2lnbmVkLW9m
Zi1ieTogS29yeSBNYWluY2VudCA8a29yeS5tYWluY2VudEBib290bGluLmNvbT4KLS0tCktvcnkg
TWFpbmNlbnQgKDMpOgogICAgICBib2FyZC9vY3Rhdm8vb3NkMzJtcDE6IEZpeCBURi1BIGJ1aWxk
IGVycm9yCiAgICAgIGJvYXJkL29jdGF2bzogRml4IExpbnV4IGNvbXBpbGF0aW9uCiAgICAgIGNv
bmZpZ3Mvb2N0YXZvOiBTd2l0Y2ggdG8gQm9vdGxpbiBzdGFibGUgdG9vbGNoYWluCgogLi4uaWxk
LWFkZC1zdXBwb3J0LWZvci1uZXctYmludXRpbHMtdmVyc2lvbnMucGF0Y2ggfCAgNjEgKysrKwog
Li4uMDEtYXRhLWFoY2ktZml4LWVudW0tY29uc3RhbnRzLWZvci1nY2MtMTMucGF0Y2ggfCAzNTcg
KysrKysrKysrKysrKysrKysrKysrCiAuLi5pbGQtYWRkLXN1cHBvcnQtZm9yLW5ldy1iaW51dGls
cy12ZXJzaW9ucy5wYXRjaCB8ICA2MSArKysrCiAuLi4wMS1hdGEtYWhjaS1maXgtZW51bS1jb25z
dGFudHMtZm9yLWdjYy0xMy5wYXRjaCB8IDM1NyArKysrKysrKysrKysrKysrKysrKysKIGNvbmZp
Z3Mvb2N0YXZvX29zZDMybXAxX2Jya19kZWZjb25maWcgICAgICAgICAgICAgIHwgICA0ICstCiBj
b25maWdzL29jdGF2b19vc2QzMm1wMV9yZWRfZGVmY29uZmlnICAgICAgICAgICAgICB8ICAgNCAr
LQogNiBmaWxlcyBjaGFuZ2VkLCA4NDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKLS0t
CmJhc2UtY29tbWl0OiBhMDJlNDM3NDE3MTkzYzQ2N2IzZGY2N2VhODExNTIzYjhlMDUxN2U2CmNo
YW5nZS1pZDogMjAyNTAyMTktZml4ZXNfb2N0YXZvLTY3OWFhZjNjNTNkMwoKQmVzdCByZWdhcmRz
LAotLSAKS8O2cnkgTWFpbmNlbnQsIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIGtlcm5lbCBl
bmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
