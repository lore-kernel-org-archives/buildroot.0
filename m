Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96DEC5DF6E
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 13:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 097364070C;
	Sun, 16 Aug 2026 13:11:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 12id7N1_u798; Sun, 16 Aug 2026 13:11:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D463405F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786885901;
	bh=crqqJ4Pj8XKpiFVpeSbv2OvpkzM6Gm+gLXaArjT2IrQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eqrx+bRoRRY80aSbAfsz0qhC8vYT/ZmQPVeYS+herMajAJBc5bBegeERbmAkoDYU2
	 oXPN9dJ7Z77T1ZPiqjof+Gp4Mt/Kje3almbMz/iNSDbxhzs/Esd4xT93grNTOiAq9e
	 S2GXETqGHIbvHyZkWV5/Zutp8FUH4mLjw/+As73FZCR8h5tkj4Awlye2V6LTTxJYaj
	 QY57Z/iAjrRG5r+Xzhv26aoyR9tr46k4KB+/Phx2P8T8VG7hsUNreciDUpPr+9wiej
	 SzeH83laB4zwnR41phpYzBBmPDNEkpRT6FZn1Acmwp9HEcSj3tHzCTvor7remcwvb4
	 1hHqUWC3IM7QQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D463405F1;
	Sun, 16 Aug 2026 13:11:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 896AC336
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 13:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B53F60622
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 13:11:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sWFf28XHQ5fc for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 13:11:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 628F56061F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 628F56061F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 628F56061F
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 13:11:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id C49F0B0056A;
 Sun, 16 Aug 2026 15:11:34 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Aug 2026 15:11:34 +0200
MIME-Version: 1.0
Date: Sun, 16 Aug 2026 15:11:34 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <aoGO11vvqxF6VTOy@waldemar-brodkorb.de>
References: <aoGO11vvqxF6VTOy@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.17
Message-ID: <cc0d6f54837b18fa9f7155585a505af7@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/wpa_supplicant: security bump to
 2.12
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 16/08/2026 12:20, Waldemar Brodkorb wrote:
> See here for a Changelog:
> https://git.w1.fi/cgit/hostap/tree/wpa_supplicant/ChangeLog?id=e6386389448a4e0ec568fa7a27026e03f95bb768
> 
> Security issues fixed in this release:
> https://w1.fi/security/2026-4/incomplete-bounds-checking-of-mesh-ampe-messages-in-wpa_supplicant.txt
> https://w1.fi/security/2026-3/unexpected-sae-commit-message-contents-terminating-wpa_suppliant.txt
> https://w1.fi/security/2026-2/missing-network-context-validation-for-pmksa-caching.txt
> https://w1.fi/security/2026-1/missing-ml-parsing-validation.txt
> 
> Patches 0001 and 0002 are upstream.
> 
> Tested on Raspberry PI4 (64 Bit).
> 
> License changed:
> -Copyright (c) 2002-2024, Jouni Malinen <j@w1.fi> and contributors
> +Copyright (c) 2002-2026, Jouni Malinen <j@w1.fi> and contributors
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
