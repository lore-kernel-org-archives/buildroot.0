Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35994E8537A
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 18:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC69440B8D;
	Fri,  3 Apr 2026 18:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wPDhWN09oUWj; Fri,  3 Apr 2026 18:00:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FC5640B88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775239232;
	bh=8vPF0rS+E2KUMPRkR1pt12C+l/gyetqLWz1ONQpZ/ec=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Br3MTVmHxEE0Ax2lVTQqzyi/fw6uKZsaPmcZj9ZgMmIY7giXsm9WEU1YVPjAOntXE
	 nJAzg3H5fYv8mBYKHwKgmCfbsqtxjnB1me06PgS3FS/ez7ymb/HqS6byA1vyQXhxy/
	 cBMdml56PUXwtcPlCX81sikbXmFx5+78ivKGTahn76pVXrpZsbVqssIQV/zsUG4b9r
	 Mxc49sE3z/EO8YSB5Vdyjvf17aWwDBKX8F/yNjBbEMhoHoGJ9jt8Y2bK5t6o8v2mJH
	 xwHobJzi5Kp+TxicKFryKNbWjf7hLARyyWbCHsMJ5HjY+WzPx/td5XW/oawKfblE98
	 WhJVIWY8LMH7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FC5640B88;
	Fri,  3 Apr 2026 18:00:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C2811A9
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 18:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5FCF60B58
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 18:00:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XlHS_09pSFbj for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 18:00:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1E91160A85
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E91160A85
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E91160A85
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 18:00:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 2FC58780368;
 Fri,  3 Apr 2026 20:00:27 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 03 Apr 2026 20:00:27 +0200
MIME-Version: 1.0
Date: Fri, 03 Apr 2026 20:00:27 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>
In-Reply-To: <20260402191908.2125697-1-giulio.benetti@benettiengineering.com>
References: <20260402191908.2125697-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <aaed89a76ef001c5b2089104238ebd21@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775239229;
 bh=aCNdeRz92EoHoOMZnD6lZdTzhHnrLr4rO41fFSOn9HA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CJAlUZ9CozRJl42eRwGJrkqKwkdBbwSDigepkeYvNYtedLKc3G7bAd0ruPS+XGg/M
 MUxvdoNYUywMqEddW8GOngzYy6/kvR+44QO88I+BS0LdVJ15TR8Cix8/9O5iFDLxZl
 CZja1RdWk8FxcJC+DoRkcBLv9iwEUnkTc95YGse3FxokIuJUvfbASkxeXr7aMG2J2+
 pORR7rUsyayZhhVxPIH+hQMuh3oLqW6TNZCFDvNU5yNeMw73v+seFdr2WkmA29f4Rd
 xsUdrcFzykxVtv2SLrg2vqqAFZB5a3KP5Ey7DjTIqF8JIBb23l/T1HK5f8ngnwmYGw
 5gzevrO3Sd9bQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CJAlUZ9C
Subject: Re: [Buildroot] [PATCH] package/mongoose: bump to version 7.21
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

On 02/04/2026 21:19, Giulio Benetti wrote:
> Release notes:
> https://github.com/cesanta/mongoose/releases/tag/7.21
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
