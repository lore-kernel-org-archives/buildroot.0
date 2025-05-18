Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D109DC3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 08:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A316660E64;
	Sun, 18 May 2025 08:57:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x03cAweJYXve; Sun, 18 May 2025 08:57:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61C5460E51
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61C5460E51;
	Sun, 18 May 2025 08:57:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BF79CE4
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE7E48127C
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v5ySPTMv8iGH for <buildroot@buildroot.org>;
 Sun, 18 May 2025 08:57:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B55678126C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B55678126C
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B55678126C
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id E4922432FD;
 Sun, 18 May 2025 08:57:29 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>
Date: Sun, 18 May 2025 10:57:00 +0200
Message-ID: <20250518085723.23020-8-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518085723.23020-1-thomas.petazzoni@bootlin.com>
References: <20250518085723.23020-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -110
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudektdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculddquddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevfffgffevgfdvudeihfegleefffelhefgieekteeftdfgtefhveefheelhfdtieenucffohhmrghinhepnhhishhtrdhgohhvnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfedphhgvlhhopeifihhnughsuhhrfhdrrddpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheprhgrphhhrggvlhdrmhgvlhhothhtvgesmhhinhgur
 dgsvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegsvghrnhgusehkuhhhlhhsrdhnvght
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747558650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ff5fzJifXjRm/afu71yt4XM2NYY8IV7/CUHuqYmt7qc=;
 b=J5XLf1rT5cJaWu+gzj97FySR6/EctiV2AQ22D3u9MRdjLvOZUpovBlrbMC/wXFThUcihfN
 iZ+Sh7GlQBlRvLJR1/GOqsUtVi12rrIs/4bbAuZJ6bEz32tq2zRGYudq7jmIIJQL/USAtw
 eOtWk3BQKIMPHvXUIz5EHJAI/gfGmsG97YaVc0ntqtwi1xKfKwEXdVxnI2N8gzlawjDZDV
 DSkXSA36W3bOjjPCm+x0NYsK2XwL/R9EVdpL58zGErjcoG39RUmWVMMBwVq9e7VKm0bY8O
 h86Tw8aCosNuBm6SMQbzVneG4pS/2/Ikohxlxn+XV/Upt4UysXfu/vjGq5asZw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=J5XLf1rT
Subject: [Buildroot] [PATCH 07/22] package/libopenh264: drop stale ignore
 CVE entry
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

VGhlIE5WRCBlbnRyeSBmb3IgQ1ZFLTIwMjUtMjcwOTEgd2FzIG5vdCBjb3JyZWN0LCBidXQgdGhh
bmtzIHRvIGhhdmluZwpiZWVuIHJlcG9ydGVkIGJ5IFJhcGhhw6tsIE3DqWxvdHRlLCB0aGUgaXNz
dWUgaGFzIGJlZW4gZml4ZWQgb24gTWF5IDYsCjIwMjU6CgogIGh0dHBzOi8vbnZkLm5pc3QuZ292
L3Z1bG4vZGV0YWlsL0NWRS0yMDI1LTI3MDkxI1Z1bG5DaGFuZ2VIaXN0b3J5U2VjdGlvbgoKVGhl
IGlnbm9yZSBDVkUgZW50cnkgaXMgdGhlcmVmb3JlIHN0YWxlIGFuZCBjYW4gYmUgZHJvcHBlZC4K
ClNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxp
bi5jb20+Ci0tLQogcGFja2FnZS9saWJvcGVuaDI2NC9saWJvcGVuaDI2NC5tayB8IDMgLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYm9w
ZW5oMjY0L2xpYm9wZW5oMjY0Lm1rIGIvcGFja2FnZS9saWJvcGVuaDI2NC9saWJvcGVuaDI2NC5t
awppbmRleCA5YWU5OTZmZWUxLi5mOWE1MGU0YzYxIDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpYm9w
ZW5oMjY0L2xpYm9wZW5oMjY0Lm1rCisrKyBiL3BhY2thZ2UvbGlib3BlbmgyNjQvbGlib3Blbmgy
NjQubWsKQEAgLTEyLDkgKzEyLDYgQEAgTElCT1BFTkgyNjRfQ1BFX0lEX1ZFTkRPUiA9IGNpc2Nv
CiBMSUJPUEVOSDI2NF9DUEVfSURfUFJPRFVDVCA9IG9wZW5oMjY0CiBMSUJPUEVOSDI2NF9JTlNU
QUxMX1NUQUdJTkcgPSBZRVMKIAotIyBUaGUgZm9sbG93aW5nIENWRSBpcyBmaXhlZCBpbiAyLjUu
MSwgdGhlIE5WRCBDUEUgaXMgbm90IHVwIHRvIGRhdGUKLUxJQk9QRU5IMjY0X0lHTk9SRV9DVkVT
ICs9IENWRS0yMDI1LTI3MDkxCi0KIGlmZXEgKCQoQlIyX2FhcmNoNjQpLHkpCiBMSUJPUEVOSDI2
NF9BUkNIID0gYWFyY2g2NAogZWxzZSBpZmVxICgkKEJSMl9hcm0pJChCUjJfYXJtZWIpLHkpCi0t
IAoyLjQ5LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
