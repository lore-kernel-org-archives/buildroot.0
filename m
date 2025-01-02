Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04D0E77188
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 18:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F109402DD;
	Thu,  2 Jan 2025 18:30:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7QDH7VjNGdpW; Thu,  2 Jan 2025 18:30:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76274402E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76274402E4;
	Thu,  2 Jan 2025 18:30:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A3CCE0F
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 18:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E952940522
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 18:30:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3huO3kh0BVgO for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 18:30:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0395540290
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0395540290
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0395540290
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 18:30:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 879D4B005A9;
 Thu,  2 Jan 2025 19:30:33 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:51492])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 02 Jan 2025 19:30:33 +0100
MIME-Version: 1.0
Date: Thu, 02 Jan 2025 19:30:33 +0100
From: Julien Olivain <ju.o@free.fr>
To: yann.morin@orange.com
Cc: buildroot@buildroot.org
In-Reply-To: <4b86d26a5cb2a78995974e86fc69b4ac1fe3d351.1735802949.git.yann.morin@orange.com>
References: <4b86d26a5cb2a78995974e86fc69b4ac1fe3d351.1735802949.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <a9a26dd50ffb9539c7afdc57549ad370@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735842634;
 bh=AnJ3UcyeNTImcdDEHMBMPa/muNIE47KzXdTZZEl52Zk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pKowBekTDF+WIaxpTHK8ZAJTuSmITT0e1Tx4ouD1NQijUw53r6F4/MTuk1RU3sEbO
 vWNjF1Hmm3COvvGyZgC9ATYdZJSToELzHhFYovGesu02I1TMPg992agUBYUvD6q3Hj
 r8w9h5E+oGRX3Zcv09UG79qe9TkoLUKeL9ZgC+uXvzKfByv0kKpWsr0jmgE5VYUcmn
 J/JAVgyqP8aOu+gwb9vexz8saiZDTxPnfYroW3gwyPBvORtJEBJkiGbFfAxpgKhPmX
 HOt2vSz1I6L4iyf2DKyNim9ji//BwVx6/DWmNqo29VeN1eJPBIlsYtk2kbZNkI8Dq6
 PszVZrJj/UdRA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=pKowBekT
Subject: Re: [Buildroot] [PATCH] package/usbip: add missing kernel options
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

On 02/01/2025 08:29, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> usbip needs USBIP_CORE, which needs network support (NET), and both
> basic USB support (USB_SUPPORT) and host-side USB support (USB).
> Both NET and USB are usually enabled, so they got missed when adding
> usbip in f05f2c1ad717 (package/usbip: new package).
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
