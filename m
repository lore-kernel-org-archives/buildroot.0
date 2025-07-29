Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46285C83F26
	for <buildroot@archiver.kernel.org>; Tue, 29 Jul 2025 09:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6027C61063;
	Tue, 29 Jul 2025 09:45:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gzXy3nGCaTRW; Tue, 29 Jul 2025 09:45:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FD2861047
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FD2861047;
	Tue, 29 Jul 2025 09:45:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 99103229
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 09:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F15940792
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 09:45:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8jw6laIgRQ06 for <buildroot@buildroot.org>;
 Tue, 29 Jul 2025 09:45:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=benoit.monin@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 67802403E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67802403E7
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 67802403E7
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 09:45:35 +0000 (UTC)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::236])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id E5DDF583B23
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 09:21:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7043B438CF;
 Tue, 29 Jul 2025 09:21:45 +0000 (UTC)
Date: Tue, 29 Jul 2025 11:21:28 +0200
Message-Id: <20250729-cmake4-v2-0-24fd7677de1c@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJiSiGgC/2XMQQ7CIBCF4as0sxYDo1TrynuYLgod7EQLBhqia
 bi72K3L/+XlWyFRZEpwaVaIlDlx8DVw14CdBn8nwWNtQIlanlALOw8POgqDnbZk3FnhCPX8iuT
 4vUG3vvbEaQnxs7lZ/dY/IishhdKtw061slOHqwlhebLf2zBDX0r5ArxFfsieAAAA
X-Change-ID: 20250725-cmake4-b295cebf812d
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelgeeikecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtkeertdertdejnecuhfhrohhmpeeuvghnohpfthcuofhonhhinhcuoegsvghnohhithdrmhhonhhinhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfeegleefvddtgffhffdtgeeifeeiheehtdehhfethefgkeekffeujeekueekvdeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeduheefjeemfhefheemleefiegumegvledvheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudehfeejmehffeehmeelfeeiugemvgelvdehpdhhvghloheplgduledvrdduieekrddutddrudejvdgnpdhmrghilhhfrhhomhepsggvnhhoihhtrdhmohhnihhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtp
 hhtthhopegurghnohhmihhmrghntghhvghgohduvdefsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplfhovghlshhonhevrghrlhesghhmrghilhdrtghomhdprhgtphhtthhopegsvghnohhithdrmhhonhhinhessghoohhtlhhinhdrtghomh
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753780905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=K03QZS/ZMCFc3A+MibXw9gp+vgYrI9uLOy1pL778D9Q=;
 b=WXFyDqrA2pSm68VrdbJYLYBcsAZXhoN1NBzpE+byPhmRW/q/1gP6fZ8w/xt/mVKf4SWjx5
 8mEVIDwVIZzoadRJBjQiTdbHGs09oFtQSRhBLUbE1BUCWceu3qF8wf5dl6knaAP2SXl11Z
 LJ1ygBIWqnz219uMKkB3syp7liis2Q1bTiivyMk9oD3o0r8fkIeO8G8MSg5lwEnxH9oOP6
 of/L+aRJ6saEwqZnwvup4uRc8yM5PUrKnF0red0fCHAIqzzzoNyf5KtHDvXxU3duAmSIq0
 29xBEAqdrQ/JgokapGavnYC7SlZeixd1X0mGNpeNOOHbE/KwJMnQ8JxgJpCsTQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WXFyDqrA
Subject: [Buildroot] [PATCH v2 0/2] Add CMake 4 support to cjson and flatcc
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
From: =?utf-8?q?Beno=C3=AEt_Monin_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Cc: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW5jcmVhc2UgdGhlIG1pbmltdW0gdmVyc2lvbiBvZiBDTWFrZSB0byAzLjUgaW4gdGhlIENNYWtl
TGlzdHMudHh0IG9mCmJvdGggcGFja2FnZXMgdG8gYWRkIHN1cHBvcnQgZm9yIENNYWtlIDQueC4K
Qm90aCBwYXRjaGVzIGNvbWUgZnJvbSBnaXRodWIgUFIgdGhhdCBhcmUgc3RpbGwgb3BlbiBhdCB0
aGUgdGltZSBvZgpwb3N0aW5nIHRoaXMgbWVzc2FnZS4KClNpZ25lZC1vZmYtYnk6IEJlbm/DrnQg
TW9uaW4gPGJlbm9pdC5tb25pbkBib290bGluLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjI6Ci0gQWRk
IG15IFNpZ25lZC1vZmYtYnkgdG8gdGhlIHBhdGNoZXMKLSBQcm9wZXJseSBzZW5kIHRoZSBwYXRj
aGVzIHRvIGJ1aWxkcm9vdCBtbAotIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3IvMjAyNTA3MjUtY21ha2U0LXYxLTAtMTU2ZjI5MTYwOTEzQGJvb3RsaW4uY29tCgotLS0KQmVu
b8OudCBNb25pbiAoMik6CiAgICAgIHBhY2thZ2UvY2pzb246IGZpeCBjbWFrZSA0IGNvbXBhdGli
aWxpdHkKICAgICAgcGFja2FnZS9mbGF0Y2M6IGZpeCBjbWFrZSA0IGNvbXBhdGliaWxpdHkKCiAu
Li4vMDAwMS1tYWtlX2NvbXBhdGlibGVfd2l0aF9jbWFrZV80LjAucGF0Y2ggICAgICB8IDM0ICsr
KysrKysrKysrKysrKwogLi4ubmltdW1fcmVxdWlyZWRfdmVyc2lvbl90b18zLjVfZm9yX2NtYWtl
XzQucGF0Y2ggfCA1MSArKysrKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDg1
IGluc2VydGlvbnMoKykKLS0tCmJhc2UtY29tbWl0OiAwNjVjMWI4NGI1NmMxNDRjMWNiOGYyYWYx
MDY5ZGU5NmQ4M2IwM2M3CmNoYW5nZS1pZDogMjAyNTA3MjUtY21ha2U0LWIyOTVjZWJmODEyZAoK
QmVzdCByZWdhcmRzLAotLSAKQmVub8OudCBNb25pbiwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBh
bmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
