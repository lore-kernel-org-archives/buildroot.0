Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C7AC369C5
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 20:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8C1040D15;
	Wed, 16 Apr 2025 20:13:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dYeM9j4q5bLO; Wed, 16 Apr 2025 20:13:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BD424095B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BD424095B;
	Wed, 16 Apr 2025 20:13:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 160276B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF66383B63
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:13:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oH3wNSHv8fpr for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 20:13:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6067A81F6C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6067A81F6C
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6067A81F6C
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:13:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 72B222003CC;
 Wed, 16 Apr 2025 22:13:03 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 16 Apr 2025 22:13:03 +0200
MIME-Version: 1.0
Date: Wed, 16 Apr 2025 22:13:03 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay+rtone@gmail.com>
Cc: buildroot@buildroot.org, Julien Grossholtz
 <julien.grossholtz@openest.io>, Mahyar Koshkouei
 <mahyar.koshkouei@gmail.com>, Martin Bark <martin@barkynet.com>
In-Reply-To: <20250415085737.1827669-2-gael.portay+rtone@gmail.com>
References: <20250415085737.1827669-1-gael.portay+rtone@gmail.com>
 <20250415085737.1827669-2-gael.portay+rtone@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <efb09cece38f7bb1e31541bdf525977f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744834388;
 bh=3PxG0IQRKhDoxbpiVCJWqBWpnBzwU/R3/eC8JHFsfqM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=E7cUQ+XLfnmtWttzRlGguFgDkSzZX3ZLtYDsGkJyETVQJiCYZhQsO0nVtxq6KDTPj
 uxQIYBXzsswOruj/eLn7P9TgGchPJuWo8nt3MlvT1j9I/ME294WiAzGcLPokomTO5P
 MvCloCtYKBpAI1xutpjP8i7EhD8evWP0aPal2R6Upc+wfACPXbtW3Oq92UtSjw0X8K
 yR9IEBXLJtFh7jWkCo18IyM2iwQZvNZoMPxOPUwjA5G6u9hmXpyH/FOeGycTCTuKBy
 4ifVqZOXrDBIBNlgAYl03VYljFoGrkFkjsorfIyQoMH8o2mNdEEVIi3l45Xokz52o0
 6WAlMA4l1keFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=E7cUQ+XL
Subject: Re: [Buildroot] [PATCH 1/3] configs/raspberrypi{zero2w,
 3}_64: update defconfig
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTUvMDQvMjAyNSAxMDo1NywgR2HDq2wgUE9SVEFZIHdyb3RlOgpbLi4uXQo+IFNpZ25lZC1v
ZmYtYnk6IEdhw6tsIFBPUlRBWSA8Z2FlbC5wb3J0YXkrcnRvbmVAZ21haWwuY29tPgoKU2VyaWVz
IGFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
