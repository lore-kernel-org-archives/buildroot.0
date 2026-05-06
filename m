Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F8CCD342C
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 12:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF95F40543;
	Wed,  6 May 2026 12:04:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pM3cEcN_7KtK; Wed,  6 May 2026 12:04:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3434040507
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778069040;
	bh=731COzNhuOtEbCGLUSxq0/7+ataTaI2Sp5sP8c97P1w=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TIiS/Vi0QTWCaELlngmLly2yJXZ5pPPfL+JP01PXiWH+PSF0UvSWufP5U/nKahdgb
	 vFJeZFXjBLr5ZZaXdnVJn7zpyC9VgdXz40I/55MDhUa4WpmLzGbxxNaoIoGRIBvN6w
	 Vj+VArm2aWcYs7RqTQWqrft+66HP0JUQfaMYkTyGvM0+IsyQwd72eB1mjlJ4t+c+Xp
	 TZZqeweSXigTIMk4baEidVwebPBmI1aWZMEg+CwPy6bX4ZZvZ/5OLfCcpKmQi2VIWv
	 YLn2ykSQSYlLIE5Q6LuhGHpVCicL/phsCW2X6WJMA9fywANqqVPvMqcaQV5+ZW9pGf
	 XJCNC7s/3esXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3434040507;
	Wed,  6 May 2026 12:04:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 309DC11B
 for <buildroot@buildroot.org>; Wed,  6 May 2026 12:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 228B060B8E
 for <buildroot@buildroot.org>; Wed,  6 May 2026 12:03:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CCadJto7yqSz for <buildroot@buildroot.org>;
 Wed,  6 May 2026 12:03:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 69D8C60B9D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69D8C60B9D
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 69D8C60B9D
 for <buildroot@buildroot.org>; Wed,  6 May 2026 12:03:58 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 654E32C84123;
 Wed, 06 May 2026 14:03:54 +0200 (CEST)
Message-ID: <b2b6542e-4a60-4921-93f8-e3a9435e522c@bubu1.eu>
Date: Wed, 6 May 2026 14:03:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vadim Kochan <vadim4j@gmail.com>
References: <20260422-frr_service-v1-1-b9aa85034931@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260422-frr_service-v1-1-b9aa85034931@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1778069036; bh=vTnjldqj2zFZLKIaPQl6t0MPdjQEqFuUA4xNIXa5okE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=DwMbxyh+FXV0aM5yQMTfYdNbYXeYILMgifPM9kAjFYFozOkgGylHbSq92KuTYU2qH
 9GW5c8ny8oPipb57F+JJOowV+pAYd8Bfp65Jx5xQUQGDsGh8XWmNrcToR9ciltKYsc
 iRrD4W9cSDqxojHdIiSWpsh92yuHG/VHOEzVInWgHqGdGAHszUlAL2KSiWddtfp+jO
 8bzlGuHsy6uSSji7DEEIruI0ChJ9oAdEKrfeguOL6bitSX0JXbzGeopDjIhZzJ0QlU
 AaGEfYEQFCQ2h5cvLuPaaFtqP6KzspeCCOrSgz+wQZR7aNkDSfhHxSt82XgQ50G9Fn
 7zh5ZdtU2gHHw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=DwMbxyh+
Subject: Re: [Buildroot] [PATCH] package/frr: install systemd service files
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gNC8yMi8yNiAxMjozNSwgQWxleGlzIExvdGhvcsOpIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4g
VGhlIEZSUiBwYWNrYWdlIGN1cnJlbnRseSBvbmx5IGluc3RhbGxzIHN5c3RlbXYgc2VydmljZXMg
ZmlsZXMuIFRoZQo+IHVwc3RyZWFtIHBhY2thZ2UgYWxzbyBwcm92aWRlcyBhIHN5c3RlbWQgc2Vy
dmljZSBmaWxlIGFuZCBhIHNlcnZpY2UKPiB0ZW1wbGF0ZSBmaWxlLiBJbnN0YWxsIHRob3NlIHdo
ZW4gc3lzdGVtZCBpcyBzZWxlY3RlZCBhcyBhbiBpbml0Cj4gbWFuYWdlci4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgo+IC0t
LQpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzIQpNYXJjdXMKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
