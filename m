Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFCCF8D776
	for <buildroot@archiver.kernel.org>; Thu, 16 Apr 2026 20:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FDDC40B15;
	Thu, 16 Apr 2026 20:11:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xdr2cfzY-22S; Thu, 16 Apr 2026 20:11:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49BA240B07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776370311;
	bh=or8UfGVHYGCwqLmU4UqzD41ZnXQeDtRgAX/kb/+zoRo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EiFOKBObFkUlZv5KErrlHMWo6YEaZOFXQQuZW5wvSxAAq9dUP7+NAJpTiVzDTfmo9
	 EUwr0NIPt6Jh1R6fjgLuqjyYSuJasLCO7yOE2maFVGEygFFXi7BzGOZEGbvr6iJaWI
	 193EJqsAWPDDdwKqy/yf39Jm9dvkSp0UeX1kJ9ofYTNZGhDSdppTLxfDsACTQDwZ8/
	 E1VvFkbOVngBmN4lAH4+Tm4qwhAUFqGgqLj5dK9OJtUSoNmc/kewp1fCeit1ZEDpfo
	 rUFY82I9VvatSIgMywQrjB0BN9eRVVRBSehEUSBJE3f9YLHytzfflHtR+gK6z2+gf/
	 zDuQhLMgCK2rQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49BA240B07;
	Thu, 16 Apr 2026 20:11:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 29EB0259
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 20:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C1A3810BC
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 20:11:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ys1etNUStraO for <buildroot@buildroot.org>;
 Thu, 16 Apr 2026 20:11:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C54C1810BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C54C1810BA
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C54C1810BA
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 20:11:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id D8B06780333;
 Thu, 16 Apr 2026 22:11:45 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 16 Apr 2026 22:11:45 +0200
MIME-Version: 1.0
Date: Thu, 16 Apr 2026 22:11:45 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260416073436.3605243-1-bernd@kuhls.net>
References: <20260416073436.3605243-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <36bb23c7b14449cdd726cb79bfd8cd5e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776370307;
 bh=GgMgl+C4PsuS9/heqkgye0r+Z8ixwyeIUl4jtta60C4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bp7UMlHdMRNiceTh0TkbzyIgDZz/46sY5PkMJ6uhfLTC89+667DnyrxiRp+dk7J2R
 q1aotS/9OD69tqRYZsEzkzhexK58rQBEgQAeqjeqr1EVGnpeDf6uC+e0JlYwOZ01L7
 wbAWwMGjX9pM9+/FJRepY2TYLNAASDLtjtmuMrq+qlBLq8vZrjk5hYHDgMc495Zp31
 l65ShFDrGngdVx2t0/ZwUvqKTX4szYiNFEOeKPvdG4PwgtwJcCtdQTPdsCVqiWfa/9
 T+7CgzeDdRYKOfWfdJqkMoDqxDH7+F9TvXN6v9ZypLcCmTJzPpwxY7PPJv9dNbqR/m
 kLlgBkFVA8b9A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bp7UMlHd
Subject: Re: [Buildroot] [PATCH 1/1] package/giflib: bump version to 6.1.3
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

On 16/04/2026 09:34, Bernd Kuhls wrote:
> https://sourceforge.net/p/giflib/code/ci/6.1.3/tree/NEWS
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
