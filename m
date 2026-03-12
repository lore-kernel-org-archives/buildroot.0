Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A96106ACEA
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 21:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35C1D6062A;
	Thu, 12 Mar 2026 21:07:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rav0hrq2OEx2; Thu, 12 Mar 2026 21:07:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5E3A60604
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773349639;
	bh=MGx4Yzqp1oTVAAEvmAxtUjUnBRNyBO/FvVZ5vcrlPI4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MEtZVNF+JiX0A8uZ+2NGlPnKpYA2n1/kJi+1FlRkyg/19RKLDi+X7NewyPQJ2Ph4f
	 SZYrPKvPJ9owmBuFXOOnpQawDyJ8LCX31QYZ6DHVP4STC7CszA/2+ClbYJc1Y50qhK
	 OBnny+Jua91g3D49+DvFlozp9dI64hHigmPv6WCgbacR4USfa7SezSX8BFVNwg4Cur
	 i5SVSUaodRJc6V34YOfFZrNzXTU6HUIslxc03kHssH1f/60xFW7rbae4wiOmlc9Thw
	 QMwEkzr68PjvaOcmTEVuwthG57bMYYfH7lYQFMGZIj+SR7TKgcFM3vQxIP1wPIag04
	 tYQ12I786R92g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5E3A60604;
	Thu, 12 Mar 2026 21:07:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A42CB201
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 21:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95FBE406C4
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 21:07:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kXKRdSkBSCek for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 21:07:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9957A40571
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9957A40571
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9957A40571
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 21:07:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 989B919F574;
 Thu, 12 Mar 2026 22:07:10 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 12 Mar 2026 22:07:10 +0100
MIME-Version: 1.0
Date: Thu, 12 Mar 2026 22:07:10 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Daniel Lang <dalang@gmx.at>
In-Reply-To: <20260311175758.3371395-1-bernd@kuhls.net>
References: <20260311175758.3371395-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <5960c778e7f5f619f3a1429fb0481a2f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773349632;
 bh=2lZ/0fNhVy1CRgUXhn2ojimJD0yzaoxB3UWiddk1wv4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ih9v1RS4RAC6CtAtywBpvs9ZQP0uABYdZmqJ9B5Yw80C84Nf/Yy9UFuZ5WOTV7K9y
 +WI9X13pA0TEWoWTQ1ArSZUr1E2BThordAA5dfDm6j3NCruSxljVfQ4tfrMbTg3OCS
 JBVvgjxl4lPy6zJOpg1CO9V78R+Fmkj7FlQIIueyGL4PIxZBpXatBBSEUU+I76ItwC
 MVb86/U3jnRjyi2cbROJ19DpZKED6BJm4i+snBHzXL9aJGKPpYTGE18bx7Z89l5sYH
 qxzuoTQ0lfbHq4D5a9CVbmH32SVKPajMlGxFxUJgjy+31rAfr71vHdKtvA/Oanf12i
 0xngDDQs7zYqQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ih9v1RS4
Subject: Re: [Buildroot] [PATCH 1/1] package/llvm-project: bump version to
 22.1.1
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

On 11/03/2026 18:57, Bernd Kuhls wrote:
> https://discourse.llvm.org/t/llvm-22-1-1-released/90150
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
