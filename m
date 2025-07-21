Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B58C83F1A
	for <buildroot@archiver.kernel.org>; Mon, 21 Jul 2025 21:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7646940DFD;
	Mon, 21 Jul 2025 21:03:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QS3dd6MMUIeC; Mon, 21 Jul 2025 21:03:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DA894287C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DA894287C;
	Mon, 21 Jul 2025 21:03:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BBFFE0
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 21:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C80783ACF
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 21:03:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PJMjFZB2IO4Z for <buildroot@buildroot.org>;
 Mon, 21 Jul 2025 21:03:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7077483AB8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7077483AB8
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7077483AB8
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 21:03:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 2C5F0B0051E;
 Mon, 21 Jul 2025 23:03:08 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 21 Jul 2025 23:03:08 +0200
MIME-Version: 1.0
Date: Mon, 21 Jul 2025 23:03:08 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Kris Bahnsen <kris@embeddedts.com>, Louis Aussedat
 <aussedat.louis@gmail.com>, Sergey Matyukevich <geomatsi@gmail.com>
In-Reply-To: <20250701190841.714026-2-giulio.benetti@benettiengineering.com>
References: <20250701190841.714026-1-giulio.benetti@benettiengineering.com>
 <20250701190841.714026-2-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <cce0fe22f3e60b2b5dc2a414309fd6da@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753131793;
 bh=KYQsO7OJuCUivybAYtBTNBsLeixT8E/JWU3NsYGdTYk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NrWW1YEA1eV/rOjibfjKaWKU+/hV7jK0C+XRsgrmtMUZz9xVrxurh8iIIyDZciNxS
 eWtvvS6i6HdF91jMS6/6AsMPriCa/A2lKfysv/1KXra5fsIGc4OWS9ABlb6WMcZGcK
 wQKfzla1D918Feh9EMY4CoQttBDg+nptFjW4HYBbOkkwczaccw7MmZBxslot3SGzu8
 hU/mObS5A/orD3LDrUNlkI0cDT7haA/oye1NvelNahEPDh6ZGxILpd0kbJ+0OzMO1G
 QgsLx4ScbpbGcQiajuVCpdFRdyym5gvQh/A2Xhqklh9VrtGpnHMAQ/ke3T3kjpCbPa
 riVmWsnsVbcjA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NrWW1YEA
Subject: Re: [Buildroot] [PATCH] package/rtl8189fs: bump to version
 2025-06-21
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

On 01/07/2025 21:08, Giulio Benetti wrote:
> With this version we can build with Linux 6.14.
> 
> Fixes:
> still not occured.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
