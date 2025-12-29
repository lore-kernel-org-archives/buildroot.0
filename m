Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AFFE92724
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 14:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A29B460AF6;
	Mon, 29 Dec 2025 14:34:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JBFXRh3Muib7; Mon, 29 Dec 2025 14:34:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBC3560887
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767018890;
	bh=SGhCtxCls0ovq+vfsZ4OaZKmGR8jrOl9N9mzrbnV5m0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Pm/xdiPc8DMT09dKZrVXq+djlIc0+6MHOI6Wrp25EnDnwsAL7GNpYDnTy3Rxszr9D
	 nR5wuxUphUAbZtjXi/NgXBG7pFJ8gu+DE6Ra421TuC6MUSOPKVFUyblEPez2PmK6Ag
	 ixLCCsbjR/E2aIXmuyVcDbyKQQiElf72h69fyyozikRsLpWQxS4x0/mLPBeUMf/3mo
	 iEwQ4PXk+YGT6aqh0Gej1J+H6b/rrAqrRRARVKI9Jn5kWi7iCbj8KfxLNUAZqob4Ao
	 R5SWv3HqgHcGj3NwYZIqIx7+7ToB1k05qmddLYPg7KHXNLwd+jReMZtliwlrS9Jy0E
	 2qmlZc3uls1BQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBC3560887;
	Mon, 29 Dec 2025 14:34:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CDD29D8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C046F407E3
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:34:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sX7xJpC_oIir for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 14:34:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EA13E407DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA13E407DD
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA13E407DD
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:34:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 3278D19F5C3;
 Mon, 29 Dec 2025 15:34:44 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 29 Dec 2025 15:34:44 +0100
MIME-Version: 1.0
Date: Mon, 29 Dec 2025 15:34:44 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20251229105411.47443-1-dario.binacchi@amarulasolutions.com>
References: <20251229105411.47443-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <c8778ae2006bf377fcd54fa1d0fd71d2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767018886;
 bh=OnXY3NM+T2qM6inyCwN4bqXjwyDXhXN6YLuP0FxTbwY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=V0NpuNBd/eMyt2H7LDv2IUyt6DwAWB5gZfgaI66zN/TGxcrAQUhzed2FRvVUmCZfc
 eGUfuU9AC6cX/sgiH4Xgrm8jx6XVSgGICJCPeThlrRpXRyfBAqfBbJrqUUVKpPAO1y
 J6V0TGkw8U7hDxThH+LpKbRdql3EoTb6/xRdaEdm3c7rsdFNzmRVsiJygp2VTD164T
 vM74+Vd/q8glbWytDRI6mwXj0vFCBSIKeuXEGgIW+5Qr/uQzdA3nupuUGUb2x6pryk
 XbOHFEaQl5KCGgwXUKk470mSKjGkVF/skSfCK5PPd5GSsJEV97ZjHMN+absCLhdv7V
 Nwx5/2yNY+CUA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=V0NpuNBd
Subject: Re: [Buildroot] [PATCH 1/1] package/cmocka: bump to version 2.0.1
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

On 29/12/2025 11:54, Dario Binacchi wrote:
> Release notes:
> https://gitlab.com/cmocka/cmocka/-/tags/cmocka-2.0.1
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
For info, I changed the link to the change log in the commit log:
https://gitlab.com/buildroot.org/buildroot/-/commit/259073938b149383c4c1e66bfe62e0616a0e8855

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
