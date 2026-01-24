Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D89ED715DE
	for <buildroot@archiver.kernel.org>; Sat, 24 Jan 2026 12:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AC134094E;
	Sat, 24 Jan 2026 12:20:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zPZ-67zNumzL; Sat, 24 Jan 2026 12:20:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 312D040854
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769257206;
	bh=pS7/Z6RYpFWqLxjORm+XAVBnL4xlJnwYTOLqNzWUf3E=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cXr/aS0/JVUdu4mqYj901GopGIDXFZr3AUGuoSuIAx2ZNLpgWLEChaAwSC5ADZvta
	 stt5zY1CpNjWkOzgBoVcnlR6OasZQqsEjA/EfBP5HpqtfS7U77OaYLU/SlSvm3NIPD
	 n3hOIkjUYmfDFKsxVK1t89qecSKJxONaJjiuTrXptsYPwsk5Rg+MDGlgJDQaKKF01J
	 fDiPyLy5k+B7/ERlklOIyfeNJCVJYCzA95d5hTkNMBFReHk1iRN/yMh73tMmwzEGLH
	 ID3WNGQ4PYXfMZyxMWW1VkoTSepR6AMnxG6VALPYJ2pNxE2i6hpMF1n+LzXKXbD5mh
	 7uT1kVNaNtnUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 312D040854;
	Sat, 24 Jan 2026 12:20:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F0B8C122
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 12:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDDCC40025
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 12:20:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MG9dki1lqq_L for <buildroot@buildroot.org>;
 Sat, 24 Jan 2026 12:20:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2DAA14003D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DAA14003D
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2DAA14003D
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 12:20:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id C5DF77803A2;
 Sat, 24 Jan 2026 13:19:58 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 24 Jan 2026 13:19:58 +0100
MIME-Version: 1.0
Date: Sat, 24 Jan 2026 13:19:58 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260124074644.5639-1-bernd@kuhls.net>
References: <20260124074644.5639-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <fe622156a5ea50034c825b0a468f7ccb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769257199;
 bh=9147eK4rMN7z2T48EUqRX1+SAI5JeT4PMJQOP5/0RJs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RB6s4YpCLBziwos7I5cQCTbVEOo4TC+PB1XQUzZGP+FN6WWyyV8OLXHSR1mRq1YG3
 uyL/iGbvApfWsaxHSxWlBov9kU2NhWozMIYNf8kVBYkzsom3ZChKG8a4k66nN/pnVs
 5tBR8Iywza5qd/+p7a3Ccox7Vjzj9SZi4Xg7edErUjqjDI7zrFcucD49i0lmu1QntG
 WCwbTsrwvsaSMSTRjwPOyIioOd3LvZ7dN/Ro2w8DoRYOjROqg0UPXCZYYtW57Sq6gl
 oFFatiWu/Lq9j0AlUYbfGHSYNDgI/99gszXfIRkW3SQNKBzrvIYazazdi3YJqAO21h
 phglEtiATxWjQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RB6s4YpC
Subject: Re: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
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

On 24/01/2026 08:46, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
