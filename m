Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5BE10F286F
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 20:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8C6E41202;
	Fri, 27 Mar 2026 20:39:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OhfAAXyX3_BG; Fri, 27 Mar 2026 20:39:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D979A41206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774643981;
	bh=31rTYlebXd0RxLTbAz316gzZuU4Ml6XBKQ+8wRAaIsI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=N0FZo/J5SuTw/9qtZ7gZNbwTb9dbmeOEdR/NV6f9BKbSND2nHjBQj7lC5fNvGi3Bm
	 vYUQd93B72BZH+UDdv5jHWYXN02MsWOtfeOJPDo37+VtQZUbyuE8+DYiWJFdNrzJeY
	 KcjN8HopjjrxOe5/1mAX7hExbO7qpvVRJRUjWZDfWcS7QzKlXqaijiKH205PA+cMjd
	 heG+4sXX6SA32nmfbBv0y3ulH1eXUKGcQiII2ZCvQfDhTnbUHCKiRRouuWlFcMHZKe
	 n0vw/YMSDGBqboiA/D3SeW81cCePWaecnOO3EgxwYP5O4AvuISrfQRRs9U8A6y+zpY
	 8TAvcUGBbXELA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D979A41206;
	Fri, 27 Mar 2026 20:39:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C6A51D3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 20:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B05E82CE5
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 20:39:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o5SXYfKd0IZR for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 20:39:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2A875827AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A875827AF
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A875827AF
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 20:39:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id E245878034D;
 Fri, 27 Mar 2026 21:39:34 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Mar 2026 21:39:34 +0100
MIME-Version: 1.0
Date: Fri, 27 Mar 2026 21:39:34 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Daniel Lang <dalang@gmx.at>
In-Reply-To: <20260326211614.3598784-1-bernd@kuhls.net>
References: <20260326211614.3598784-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <ac69133f27c922d18d1c88fcfecddf9c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774643977;
 bh=BYCr8Q4Qe96pBFC4jdyu5M9JfFS45PGiX/PDwoU+c0I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uyDipmP3rbNlKycFpC5XZmdWorMFSMAaL+4vc372o0wRkqVOsycPardWdPqUq8nKS
 Db78sk1MTkxojDXd+D4HnZFQwRa7r8seUEsgKQWprrD5HV9A5cFdldeSQUJ4Dea3Xq
 EHlmMacBtc/1BLZah5OylIpt/kG0uM0zsx0wZs0dKEUd4vM4Aic5zx4rMjUlhYnjBm
 uNyhqQDn6W57QhPvPYFLv4+oJZxpO1t6tJa0yHYhlgblQfRZVfjvavb0EsWJPp4tbr
 Bk+IB6UjE6+JJ04LNurLRBgiJlV2jbbZha3vracCizgnn1w1jZHAerhDkhI5aKl4so
 /WzBa6t9mAF7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uyDipmP3
Subject: Re: [Buildroot] [PATCH 1/1] package/llvm-project: bump version to
 22.1.2
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

On 26/03/2026 22:16, Bernd Kuhls wrote:
> https://discourse.llvm.org/t/llvm-22-1-2-released/90308
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
