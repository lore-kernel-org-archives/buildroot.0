Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230E9C52D7D
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 08:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB67D60A8A;
	Thu, 15 Aug 2024 08:58:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C7uyMox3M2LT; Thu, 15 Aug 2024 08:58:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FADC60A43
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FADC60A43;
	Thu, 15 Aug 2024 08:58:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E44FA1BF2B6
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 08:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C793A81E8D
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 08:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TgBPtYXhF5Fj for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 08:58:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 142C581E8B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 142C581E8B
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 142C581E8B
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 08:58:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 51895FF802;
 Thu, 15 Aug 2024 08:58:25 +0000 (UTC)
Date: Thu, 15 Aug 2024 10:58:24 +0200
To: "J. =?UTF-8?B?TmV1c2Now6RmZXI=?= via buildroot" <buildroot@buildroot.org>
Message-ID: <20240815105824.37914b70@windsurf>
In-Reply-To: <20240811-s6-multicall-v2-0-14249fd20cbd@gmx.net>
References: <20240811-s6-multicall-v2-0-14249fd20cbd@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723712305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a9cruItajIlF23do1E5iBAIerRya0qV/bBAZp7ajIu8=;
 b=J5baqyyy6nTvg7RX1nyTUeCCHlYdnPWbdXf0RIPVVYIZ8uF0JWYYrb6fUAuJAEbOXnWYnS
 ao5hHMe+FjRzpEFbkk+d9M1cSO6Br71TUMXpNF1h1k7BnIEc2Bxm6OyAHwRI1v0CbqHykg
 mFJCsXjmHlernH38r3Yd8ZVY23sqZYax3nD7vHb75jZ/CUgqJ/TROi74LZJPzlOllwILfn
 r3y8QCQp5SnqWrbocEacJDBBf2RJwodlS/1pvebFmB5urre1ykFjqMDVKKitx310kDUfyF
 av45Zoh787+mXIzZlE42wcirI4d7u763IL3pR9xrx/Dkr3AUxJAufelaYZCElQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=J5baqyyy
Subject: Re: [Buildroot] [PATCH v2 0/4] Optionally build some skarnet.org
 packages as multicall binaries
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 "J. =?UTF-8?B?TmV1c2Now6RmZXI=?=" <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCAxMSBBdWcgMjAyNCAxMjowMToxMCArMDIwMApKLiBOZXVzY2jDpGZlciB2aWEgYnVp
bGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cgo+IEouIE5ldXNjaMOkZmVy
ICg0KToKPiAgICAgICBwYWNrYWdlL2V4ZWNsaW5lOiBBZGQgb3B0aW9uIHRvIGJ1aWxkIG11bHRp
Y2FsbCBiaW5hcnkKPiAgICAgICBwYWNrYWdlL3M2LXBvcnRhYmxlLXV0aWxzOiBBZGQgb3B0aW9u
IHRvIGJ1aWxkIG11bHRpY2FsbCBiaW5hcnkKPiAgICAgICBwYWNrYWdlL3M2LWxpbnV4LXV0aWxz
OiBBZGQgb3B0aW9uIHRvIGJ1aWxkIG11bHRpY2FsbCBiaW5hcnkKPiAgICAgICBERVZFTE9QRVJT
OiBBZGQgc2thcm5ldC5vcmcgcGFja2FnZXMgdG8gSi4gTmV1c2Now6RmZXIncyBlbnRyeQoKVGhh
bmtzLCBzZXJpZXMgYXBwbGllZCB0byBuZXh0IQoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25p
LCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5n
aW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
