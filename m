Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984B7CCD1AB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 22:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6373340DEA;
	Wed, 22 Oct 2025 22:15:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7lxjBizZ3fO0; Wed, 22 Oct 2025 22:15:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9117A40DED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9117A40DED;
	Wed, 22 Oct 2025 22:15:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A6B243F
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 22:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C0A240DED
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 22:15:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ncwkqjjA-vOX for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 22:15:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 522BB40DEA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 522BB40DEA
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 522BB40DEA
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 22:15:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id E8B9F5FFAF;
 Thu, 23 Oct 2025 00:15:30 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 23 Oct 2025 00:15:30 +0200
MIME-Version: 1.0
Date: Thu, 23 Oct 2025 00:15:30 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20251022163457.19215-1-dario.binacchi@amarulasolutions.com>
References: <20251022163457.19215-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <6477e4fde602ff8f94bce629f63c374e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761171333;
 bh=jUX1tAqxr76jQ1veSXtRv0mvgoXcrVOTTknNejHdxSg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=k7e7Qa0l3PHGrzi3XWmwGn7fPYadOCVKmifHizw27W0ET7QFD58avdEIMuJ/pRSOA
 Wl+W5UZzqfZM2VOXJNrW/MSWbbUv21kDIdaoZ5q/iC8nPIQwkoScLsWZxlYQp8kNLF
 1f6Tggn878mR287Gea6pUM9gm+CSZFMUql0Yo3SIxeHyhqFrXUyZZdE4W8awPCO7PL
 H44LoVbgSizkP4Jw34A4Yz/+rFv+lcRGvW3P9nZwz6ZtB7fsitD+qkyNOxOgl4U3Ov
 N3Q2u4FEZVcUJJezGXfBAQ+bVSnj9N87MVsJ16AEK32jfsIelL/N9MHBZ2D5dd/X7N
 yAWa0/bkdm15Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=k7e7Qa0l
Subject: Re: [Buildroot] [PATCH 1/2] package/libglib2: security bump to
 version 2.84.4
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

On 22/10/2025 18:34, Dario Binacchi wrote:
> This bump includes the security fix for CVE-2025-7039.
> 
> Fixes:
> https://www.cve.org/CVERecord?id=CVE-2025-7039
> 
> Release notes:
> https://gitlab.gnome.org/GNOME/glib/-/releases/2.84.4
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
