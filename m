Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA74C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 15:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F66640364;
	Thu, 10 Mar 2022 15:21:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CEKYUFN3ur8q; Thu, 10 Mar 2022 15:21:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 101134014B;
	Thu, 10 Mar 2022 15:21:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 35D831BF2BA
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 15:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 309A08473E
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 15:21:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wkFy9EvA4lqq for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 15:21:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 557AE8438F
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 15:21:25 +0000 (UTC)
Received: (Authenticated sender: theo.lebrun@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 778DD2000C;
 Thu, 10 Mar 2022 15:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646925683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ira3Y/cwCC8gXEq3mtcI9ksIrOCsa25clpAMad1omwM=;
 b=hFz8EhcfN1HKB8fXVDLD169vtEv16nnt4w0Y1FWj5m2Kryl4eVE9P1fwIOPx9dvYHL6Bzx
 oqOVXJHOUMqpO+o87tHjqAMlsKGLw1qND5enkSyvSENZTIOX2YfG+zgcszuNC6zRCuX0P2
 u7biarCiaMVM2qD/lzwEJvp21fuF2qSPFFf2Yi28F2nZEvI7ESCglX/9chA9mvVuZEZjeQ
 RpYPmUU4fsUEdkc6VqlTy8DZ8J4reBPAcXoVZWLinGibn76OC2g2WpvOVQ46ZBtKI4gkzQ
 91c8iT1s9/PuFUAwmsjDY8tWoyIxagEGSxTaP7R+SKPQMeyzUQRCV5bZa+WkRw==
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 16:20:48 +0100
Message-Id: <20220310152048.633340-3-theo.lebrun@bootlin.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310152048.633340-1-theo.lebrun@bootlin.com>
References: <20220310152048.633340-1-theo.lebrun@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/pipewire: add optional roc
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
From: =?utf-8?q?Th=C3=A9o_Lebrun_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Um9jIGlzIGEgdG9vbGtpdCBmb3IgcmVhbC10aW1lIGF1ZGlvIHN0cmVhbWluZyBvdmVyIHRoZSBu
ZXR3b3JrLCB0aGF0CmNhbiBiZSB1c2VkIGFzIGEgUGlwZVdpcmUgbW9kdWxlLgoKU3VjY2Vzc2Z1
bCBpZiBsaWJwaXBld2lyZS1tb2R1bGUtcm9jLXtzaW5rLHNvdXJjZX0uc28gZ2V0IGJ1aWx0LgoK
U2lnbmVkLW9mZi1ieTogVGjDqW8gTGVicnVuIDx0aGVvLmxlYnJ1bkBib290bGluLmNvbT4KLS0t
CiBwYWNrYWdlL3BpcGV3aXJlL3BpcGV3aXJlLm1rIHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9waXBld2lyZS9waXBld2ly
ZS5tayBiL3BhY2thZ2UvcGlwZXdpcmUvcGlwZXdpcmUubWsKaW5kZXggZmM1MjFjODZhYy4uZGUy
N2JjZTEwYyAxMDA2NDQKLS0tIGEvcGFja2FnZS9waXBld2lyZS9waXBld2lyZS5taworKysgYi9w
YWNrYWdlL3BpcGV3aXJlL3BpcGV3aXJlLm1rCkBAIC0xODksNiArMTg5LDEzIEBAIGVsc2UKIFBJ
UEVXSVJFX0NPTkZfT1BUUyArPSAtRHJhb3A9ZGlzYWJsZWQKIGVuZGlmCiAKK2lmZXEgKCQoQlIy
X1BBQ0tBR0VfUk9DKSx5KQorUElQRVdJUkVfQ09ORl9PUFRTICs9IC1Ecm9jPWVuYWJsZWQKK1BJ
UEVXSVJFX0RFUEVOREVOQ0lFUyArPSByb2MKK2Vsc2UKK1BJUEVXSVJFX0NPTkZfT1BUUyArPSAt
RHJvYz1kaXNhYmxlZAorZW5kaWYKKwogZGVmaW5lIFBJUEVXSVJFX1VTRVJTCiAJcGlwZXdpcmUg
LTEgcGlwZXdpcmUgLTEgKiAtIC0gYXVkaW8sdmlkZW8gUGlwZVdpcmUgU3lzdGVtIERhZW1vbgog
ZW5kZWYKLS0gCjIuMzUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
