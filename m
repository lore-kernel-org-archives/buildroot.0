Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 395B2C36010
	for <buildroot@archiver.kernel.org>; Mon,  7 Apr 2025 17:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF08040198;
	Mon,  7 Apr 2025 17:46:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VXyV15n16cLc; Mon,  7 Apr 2025 17:46:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 307D94064C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 307D94064C;
	Mon,  7 Apr 2025 17:46:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 69174DA
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 17:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5AD8E40421
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 17:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JyXcs6ETDyZf for <buildroot@buildroot.org>;
 Mon,  7 Apr 2025 17:46:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 30BBE40AAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30BBE40AAB
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 30BBE40AAB
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 17:46:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 02F7813F8A7;
 Mon,  7 Apr 2025 19:46:40 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 07 Apr 2025 19:46:40 +0200
MIME-Version: 1.0
Date: Mon, 07 Apr 2025 19:46:40 +0200
From: Julien Olivain <ju.o@free.fr>
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <Z_OmBb9nw-CawX3x@waldemar-brodkorb.de>
References: <Z_OmBb9nw-CawX3x@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.10
Message-ID: <208edceaf54fa61f04c3ace26dd4fe78@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744048002;
 bh=gxtXQ0hN5cv9YMtoiNRK5DiuhQMXYfQgoHSBJasMiSc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hyYdBSwk1mQEEFnNTTWP7pPz6uJghZIX/xwSKu2yzgMN1S1ouH2VniR9CWT+QK30d
 QXpW1i+hXVkekYE4vd1V4r752/aayqoVE71L/FNnbeZ38kevoHqiZ5CiX38eF7/Frx
 6WXyI8iRbBo62/9irJkfuDfxSqhvkyU033VvBaCaCP4v/xw8FmWNT0rSy/1gusrDtX
 iO6S9M1FBM+eHLxVakTgwC1HJ9F53K1CQQwUGITLNzpYcI4VaHSmYsQTucyM1jU7Bh
 5laXxql72MaXU0+nJNn64qU2M250EeUW3TGMJHVq9lbsF7WFd+lgFRJ6ITsD2UJYOs
 mkmLWVN2bDbbQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=hyYdBSwk
Subject: Re: [Buildroot] [PATCH v2] package/uclibc: update to 1.0.52
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 07/04/2025 12:16, Waldemar Brodkorb wrote:
> See here for release notes:
> https://mailman.openadk.org/mailman3/hyperkitty/list/devel@uclibc-ng.org/thread/AGJRU33MT2GMXFNOUDXHISFQIVRYRYXO/
> 
> Drop patches 0001/0002 which are upstream.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
