Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5AABD5B845
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 22:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A284406C3;
	Mon, 28 Oct 2024 22:39:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 29WzCKIF1_tx; Mon, 28 Oct 2024 22:39:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EC83406D0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EC83406D0;
	Mon, 28 Oct 2024 22:39:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 99311AEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 945158118A
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:39:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mgqSpUSkX5gV for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 22:39:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CC56980A69
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC56980A69
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC56980A69
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:39:54 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:50af:2c92:e0e7:45a3] (unknown
 [IPv6:2a01:e0a:12:eba0:50af:2c92:e0e7:45a3])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id A4BA6BFC04;
 Mon, 28 Oct 2024 23:39:50 +0100 (CET)
Message-ID: <321d4dd3-10ad-48df-8155-27bd529c590d@grenoble.cnrs.fr>
Date: Mon, 28 Oct 2024 23:39:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Buildroot Development <buildroot@buildroot.org>,
 Brandon Maier <brandon.maier@collins.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
References: <20241020092527.734923-3-bagasdotme@gmail.com>
 <20241028231334.30d80be8@windsurf>
Content-Language: en-US
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <20241028231334.30d80be8@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1730155191;
 bh=PHVCLbZWwebKxuaiKdsYRNb7Zigsrds9aUuQrVIoaWg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ksb6PXPmNqHt1XYRHFsusx7rVcJQ3aafFoQVLu1+GJ+phTudRMNFXow0O442TbdR3
 CytB5P6Plikp+LJbWzWS31YJ+nwJnOfT/mp+hq79u7ns6rzmkPWtZlFMGA11Bk54X7
 4vQlWspBeQqi5TVcHc0zTSL49do221IG3YnwU87SdD8oP/7JJEYXiuWLOU+DkOUK+P
 /ZCTTE6rHSH0Yn89uGHPIEHlKKzEY/BTUb4nGrdsp9QSxnox8LpMugoHNMENB1d/68
 R9gDZXv/6FIL80KZ43u1kZAU/ebd294ncfwEtesX1qEZUkvE8sqz1NzVcHwT+y8/Tx
 XqpPmkszUDDuQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=Ksb6PXPm
Subject: Re: [Buildroot] [PATCH] package/git: fix wchar-less uclibc build
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

SGVsbG8hCgpCYWdhcyBTYW5qYXlhIHdyb3RlOgo+ICtGaXggdGhlIGJ1aWxkIGZhaWx1cmUgYnkg
b25seSB1c2luZyB3Y2hhcl90IHdoZW4gX19VQ0xJQkNfSEFTX1dDSEFSX18KPiAraXMgYWN0dWFs
bHkgZGVmaW5lZC4KClRob21hcyBQZXRhenpvbmkgcmVwbGllZDoKPiBUaGUgc29sdXRpb24gaXNu
J3QgcmVhbGx5IG5pY2UsIGJlY2F1c2UgaXQgYWRkcyBzb21lIHVDbGliYyBzcGVjaWZpYwo+IGxv
Z2ljLgoKSW5kZWVkLiBOb3RlLCBob3dldmVyLCB0aGF0IHRoZSBwYXRjaCBpcyBtYWtpbmcgaXRz
IHdheSB1cHN0cmVhbToKCiAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9naXQvY292ZXIuMTcy
OTUwNjMyOS5naXQucHNAcGtzLmltL1QvI3UKCihsb25nIHRocmVhZCwgc2VhcmNoIGZvciDigJx1
Q2xpYmPigJ0gdG8gc2VlIHRoZSByZWxldmFudCBiaXRzKS4KClJlZ2FyZHMsCgpFZGdhciBCb25l
dC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
