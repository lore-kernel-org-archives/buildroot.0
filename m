Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435EAC369D1
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 20:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCC9680FDD;
	Sat, 19 Apr 2025 20:09:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7HI7EFLUlwv4; Sat, 19 Apr 2025 20:09:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10BAD80F4C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10BAD80F4C;
	Sat, 19 Apr 2025 20:09:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 83F2C228
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 20:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72E6E4043E
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 20:09:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CZvTHtoYdnjH for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 20:09:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 497CE4021C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 497CE4021C
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 497CE4021C
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 20:09:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D416F439F2;
 Sat, 19 Apr 2025 20:09:17 +0000 (UTC)
Date: Sat, 19 Apr 2025 22:09:16 +0200
To: =?UTF-8?B?R2HDq2w=?= PORTAY <gael.portay+rtone@gmail.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Julien Corjon
 <corjon.j@ecagroup.com>
Message-ID: <20250419220916.4056a3af@windsurf>
In-Reply-To: <20250412143522.1214009-1-gael.portay+rtone@gmail.com>
References: <20250412143522.1214009-1-gael.portay+rtone@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeehleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptedthfehjeegffevteeuteetheekkeevudeuleegfedvkedvueetudduudekgeevnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepghgrvghlrdhpohhrthgrhidorhhtohhnvgesghhmrghilhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoo
 hhtrdhorhhgpdhrtghpthhtohepghhiuhhlihhordgsvghnvghtthhisegsvghnvghtthhivghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopegtohhrjhhonhdrjhesvggtrghgrhhouhhprdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745093360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y3F0h4tVNoPxIT75Q7ePTAZ4FXuZ64pAPDXZbCy+3+k=;
 b=KVDNd65/pxyboBkpivrK20aLbU8dvNLPE+yNxDIP2hLiawiM/51J23MjWffLVTVZMpdH+y
 4Pdb1ZZsnZZYHpiKyeY02FsHqh2UeryMXSoGPsp6Ytm/J8pooUcXgHlpSWMWX80mKc+9Zt
 4S1IDVlBjGgb3fBrkNOv/ayX2nOqiQ99D9W5qC7Ujzt1EPdS8aZl3J44vh8joWJa8qmUVS
 RrLnifBgFJXKP319g3qy2/NFQWO4X5mv7DslsBV4UjlN0vOVxwdpIpJryZEeYQxiby4/ax
 e9A3cNyuiJvduMORGCfakqYwRKsS5rJHSawbmCdXwQOXM8QU9ScFYKsohKO3VA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KVDNd65/
Subject: Re: [Buildroot] [PATCH 1/1] qt5webengine-chromium: fix python 3.13
 issue
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gR2HDq2wsCgpPbiBTYXQsIDEyIEFwciAyMDI1IDE2OjM1OjIyICswMjAwCkdhw6tsIFBP
UlRBWSA8Z2FlbC5wb3J0YXkrcnRvbmVAZ21haWwuY29tPiB3cm90ZToKCj4gUHl0aG9uIHdhcyBi
dW1wZWQgZnJvbSAzLjEyLnggdG8gMy4xMy54IHNpbmNlIHRoZSBjb21taXQKPiBkNjNlMjA3ZWI4
NjkwNjNmODJjODY3NjU4Njc2YzI5MDNiZWIwOGNiLgoKWy4uLl0KClRoYW5rcywgSSBoYXZlIGFw
cGxpZWQgeW91ciBwYXRjaC4gSnVzdCB0d28gbml0cy4gRmlyc3QgdGhlIHRpdGxlCnByZWZpeCBz
aG91bGQgaGF2ZSBiZWVuIHBhY2thZ2UvcXQ1L3F0NXdlYmVuZ2luZS1jaHJvbWl1bS4KCj4gK1Vw
c3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0aHViLmNvbS9jaHJvbWl1bS9jaHJv
bWl1bS9jb21taXQvNGM2ZmMxOTg0OTcwYWY0YjJiMTc2NTAxNGM5ZGRjZDk1N2FkN2RkYV0KClRo
aXMgc2hvdWxkIGhhdmUgYmVlbiBVcHN0cmVhbTosIG5vdCBVcHN0cmVhbS1TdGF0dXM6LCBvdGhl
cndpc2Ugb3VyCmNoZWNrLXBhY2thZ2UgdG9vbCBjb21wbGFpbnMuCgpUaGFua3MgYSBsb3QhCgpU
aG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1i
ZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9i
b290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
