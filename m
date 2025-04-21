Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B11CC369AB
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 09:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF720404E8;
	Mon, 21 Apr 2025 09:52:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TP8xEiyFCxPO; Mon, 21 Apr 2025 09:52:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 263FC40554
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 263FC40554;
	Mon, 21 Apr 2025 09:52:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CDC3268
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 09:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3699404EE
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 09:52:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aLOmUnJb6O_R for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 09:52:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C5753404E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5753404E8
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C5753404E8
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 09:52:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 800C060136;
 Mon, 21 Apr 2025 11:52:17 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 21 Apr 2025 11:52:17 +0200
MIME-Version: 1.0
Date: Mon, 21 Apr 2025 11:52:17 +0200
From: Julien Olivain <ju.o@free.fr>
To: Daniel Lang <dalang@gmx.at>
Cc: buildroot@buildroot.org
In-Reply-To: <20250418144342.24540-2-dalang@gmx.at>
References: <20250418144342.24540-2-dalang@gmx.at>
User-Agent: Webmail Free/1.6.10
Message-ID: <a85d308cbc744e34834075fb893d572c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745229138;
 bh=I7QJb55QAjscivAIM7BWRDYAsaFFFLZ6JV3J5Xd1dRE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QduXTUg/ri7VGqFDm/29ZIpnwY85+swDsgahlaBmGjNSNpacpZ0XnE4p2oJHbcM3R
 1eTAsBy00I4Onjgwo15YRpLgOPyeMqJcRfi0VgNlglJJDusVqfIrQ/zmMEtKCmsR9y
 8tu0eMjnv8cWaPP0tfjiBmeuI5pfWWW+VBNVOYmdb0eyS/rKxURaMvYuug8PyNS6Ad
 uhvhnKgyaUGEApQUnwVTzY94ucBWZXiMyrrJrbDgv7UjcZO1X6WBl3C/yh8AyNu1Xy
 Kyf5JhySLIgrXkjZMGv8OFdlmZgY65AFziltWtdKzTWwceIqfh2yOJbWWILgW1fPLC
 anKleNsbR7Z6Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=QduXTUg/
Subject: Re: [Buildroot] [PATCH] package/glibmm2_66: bump to version 2.66.8
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

On 18/04/2025 16:43, Daniel Lang via buildroot wrote:
> https://gitlab.gnome.org/GNOME/glibmm/-/blob/2.66.8/NEWS
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
