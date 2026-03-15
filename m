Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3555D58B19
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 10:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C7E260FBA;
	Sun, 15 Mar 2026 10:42:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0AF34QoEpG73; Sun, 15 Mar 2026 10:42:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B293E60C2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773571364;
	bh=nFImbV0rjI3LmvEkPZCUMGU58DUQFLMnrXjjUe+ps6o=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cf5icukC86azee++H1kZSyBH7m+gmsU/l+SiSCPete1DMVhWuZ4Q4o0LSORsw8Sn9
	 FKIuDpo4FTNF6ZcvOMWUeBkh2KxGjwRO0c9CMV7j6BBgXb0ZAT6wCVFbvfBHSNUzQ9
	 MpEqwP9TXGnJCb6SuXzfLJYjKsJ+OxZYuVGODdsYArDkeO2bSNF/e6B+Y4bEd+mm/w
	 8jCuAPnReocXGOXrygfGOzCelaIF6g5SNG5eC1QEmZOdL+T3ke+4kP2NTI1Z1I+ECQ
	 3l9Eza2QdxmJaG7OMMd/BmnbbV/b/zcwDUm5z3wtC4neD9m6cTehfcXqVRTcNpL8Hl
	 ypetJGb+n5ZXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B293E60C2B;
	Sun, 15 Mar 2026 10:42:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AE861B4
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 10:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C80E400DA
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 10:42:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ewVUz1vHAUM for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 10:42:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B3D2D40264
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3D2D40264
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B3D2D40264
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 10:42:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 95A1D13F8CE;
 Sun, 15 Mar 2026 11:42:38 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Mar 2026 11:42:38 +0100
MIME-Version: 1.0
Date: Sun, 15 Mar 2026 11:42:38 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260315090350.748082-1-bernd@kuhls.net>
References: <20260315090350.748082-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <ef1baaca5f50d2593a501022ca8bd9d2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773571359;
 bh=qmCK7YKfcb7NMmsDTC1pqzP6ZhvB1mJlzKjmkGMnCUw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BnX6U6zD82QbWkPwZBMxP1KCdqtfxsQxPwRsv7lkeVxVbtfdrp3cpHWxS7kC/RdFQ
 r5Wy6E77N4GU7EJNuuPmJXM4rTyT0Hz8TXMuSkGDrGLSZVjHAW4zWkAg3Uf82KLjF5
 1437Nwj3ajuQOuayzt8H7yWAxoKAuBjJBsJVfSr6BBSe4Lb4LHIJ2AL99VC7Wenk1G
 6HEnz+waWkfvnvyl1OkRVlbgyTcZawtP/5B2ogsD1LAjoyWbGaehzX4FhcjF3joGLl
 5P+h+Zw5RJz9Tlanp4RiH3XJEe9BUqRbHV3ifUANdWhNcDq5pXLA5b2Si+GfFYzJ1g
 oIEjPXTxrIoEw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BnX6U6zD
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{12, 18,
 19}.x series
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

On 15/03/2026 10:03, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
