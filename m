Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9766CC02180
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 20:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D940610FE;
	Mon, 13 Jan 2025 20:21:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EI71-Vf0-VMa; Mon, 13 Jan 2025 20:21:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76E1D61108
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76E1D61108;
	Mon, 13 Jan 2025 20:21:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CD54D940
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD3A0410E6
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:21:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xBLwKwcqi9Ed for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 20:21:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8302740B77
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8302740B77
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8302740B77
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:21:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 6F11113F854;
 Mon, 13 Jan 2025 21:21:47 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:40548])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 13 Jan 2025 21:21:47 +0100
MIME-Version: 1.0
Date: Mon, 13 Jan 2025 21:21:47 +0100
From: Julien Olivain <ju.o@free.fr>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250113102540.1940023-1-mika.westerberg@linux.intel.com>
References: <20250113102540.1940023-1-mika.westerberg@linux.intel.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <52827b94039a23a4f8495714e4200388@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736799708;
 bh=+UlxriVMLH+FtnGSapymzx914KQXsBTEjqojB4S2CqY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cw7PMZ5+qgikkixcyO9oqR/92UtXTJxyik8CUyoFoEvXxjOwDt9LBIT3KFivk0O6k
 xF8QIWVw1esXwnaQ1wUDdDZfGUjWlq/1wkVBpR1BU2EjkMELtvPAPV+tsD6fbWzb0v
 Qgz2OzTjyxhzwOqOS5PbU6FqHjteB2NUBfXwBotMRF0WrIb2Ohv3GeFmJHZr67HErp
 Y3+hftjfXzdHBR0TPKONS3VPwFMRlPfDWZ9mZHKt+AN2vf1sj1t/EdG+ushmhCDHrw
 K2Lx61JZGBVyxbUL2g83O8KHRwjM3FsyNnv1D04QYQDFo1Sjn/yOBdn/Bk2N7aENPJ
 1r98tl4X7ZAFg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=cw7PMZ5+
Subject: Re: [Buildroot] [PATCH] package/tbtools: bump to version 0.5.0
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

Hi Mika,

On 13/01/2025 11:25, Mika Westerberg wrote:
> Update to the latest release of tbtools.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

I applied to master, thanks.
I added a link to the package changes in the commit log. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/481920a1817fe06d77248000c12562368c95118c

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
