Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E19C369BA
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 17:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1BA14132A;
	Wed, 16 Apr 2025 17:22:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4H7yotdBXTrk; Wed, 16 Apr 2025 17:22:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2921941734
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2921941734;
	Wed, 16 Apr 2025 17:22:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 24E1F159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 17:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 163094132A
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 17:22:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7jhD6Zf4KKti for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 17:22:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5559441446
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5559441446
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5559441446
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 17:22:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 4026E60137;
 Wed, 16 Apr 2025 19:22:51 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 16 Apr 2025 19:22:51 +0200
MIME-Version: 1.0
Date: Wed, 16 Apr 2025 19:22:51 +0200
From: Julien Olivain <ju.o@free.fr>
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org, Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20250416114620.140463-1-fancp2007@gmail.com>
References: <20250416114620.140463-1-fancp2007@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <24f8e3f7e3c1600701d211d898cc760c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744824173;
 bh=LBfhusk9/uglVUgRgmkKiui14BZ/kaId8TTb4dVaWYs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hF/ybfm5hIcKJG6RGjMC9aKSjmQnGYWPebWPxnK2oetdI9VTCilLzIKI3E+ZXhcJy
 bX3Hsg7WFr2pdf/G0w19/kfq3Y0f1T3GOWEOpNAC6v2PJjVYHfGTbaSDsqRXB+Zzo8
 V6uJd7ZdrD+z6stjtugGS+J81mqdFH9rXEwbFhGSCnkYxWF1LWbTJMnaH+rOH0b1KF
 Zyl3Ed1G88xKXboTQtOUKBdOksXVfSGs3kD17aE0UGxSJyD0rfO32ZeQmGO4haY8OZ
 GVGbzS/cd4hR4b5spGVZNQuH7OCS22/kQcp1kny7g6ibi0opJYi049HUz0OR2I9WkZ
 HpW6cHGcLKRRw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hF/ybfm5
Subject: Re: [Buildroot] [PATCH] package/timescaledb: bump version to 2.19.3
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

On 16/04/2025 13:46, Scott Fan wrote:
> Release notes: 
> https://github.com/timescale/timescaledb/blob/2.19.3/CHANGELOG.md
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
