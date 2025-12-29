Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5717FE92FE2
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 21:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F139081C6E;
	Mon, 29 Dec 2025 21:35:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1M9gp3ZtWMFX; Mon, 29 Dec 2025 21:35:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C3C8819B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767044125;
	bh=ZwSfvNNGrYt4X4CXt81dYjnjbNRds7t4qwRq5WVv3P4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qydud3Z2/FqsnfTWd+xvHR5RLSbsGbvXmtAJDMT3MOIe7tD+HkRwf00SBvSqpkpin
	 F8q9h/LW62kPqfnzS99RYmxKU+0BFyhg+3r5UQ5J2tTVDcAfIo6P1UJSlH2J4JCd7q
	 c+BynwWSx9PgvyKKofbDrhePnGK9g0Q8u8KNUnUZCupPoLp8tGNXV6QQqO6yJ62q9+
	 uiEFsx//zYs88tenCot34nl9GvCYcc4/XivusEKOcZNXSjlxuXhw1Fx3KuBFJP+sg+
	 4IFnuKQG9VubnawM4dSV3se4srjuX8fB/jcJkaagFoPdV+uNFMg+pkID4gbGXG6Fe7
	 ymwZY5tYcn9fQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C3C8819B4;
	Mon, 29 Dec 2025 21:35:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EE07C177
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5488401CB
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:35:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o3eDZqsiwyAf for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 21:35:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 03EA0401C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03EA0401C2
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 03EA0401C2
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:35:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 9C18813F861;
 Mon, 29 Dec 2025 22:35:20 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 29 Dec 2025 22:35:20 +0100
MIME-Version: 1.0
Date: Mon, 29 Dec 2025 22:35:20 +0100
To: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20251229181303.1813920-1-pkerbrat@free.fr>
References: <20251229181303.1813920-1-pkerbrat@free.fr>
User-Agent: Webmail Free/1.6.12
Message-ID: <3ee4eee5c5e6ca0edcc0512bb59feb39@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767044121;
 bh=6VedWY0O546s6w5fT6W5tOzjKSLnRKidCGjtaf20fB0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TBNjU8Y4WDUVEfmQI8qB5WuCjmNsUxFAlKa0oCijfJEPchREdkf911+CjHjohv538
 5j91fp2ai5D24gliJGIBH3b4bRlM8xmS+wpNw1clK+vZXlvkLL9chU9+DAve0jK8DE
 TUCQ0L0THueL3q02Gc8PDQ5aJ+U3nL7jiFTCjvagHddPdlnZ3GY6Nwa7P9eYbodROx
 M5zF0VzOD4XXZW7ySJ/cEKgSWV6MZONiLetzV9rEBquWZvPeLDTQTwsNhwYV5W00Dl
 eINzqfR51vxp0nvsHyNQYoVvHsjOPjooKj2CMfAJy/f1ZId2wbetELtmjvaiIdPrE9
 +XzKIKTdCFbyA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TBNjU8Y4
Subject: Re: [Buildroot] [PATCH] package/imagemagick: bump to 7.1.2-12
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

On 29/12/2025 19:13, Pierre-Yves Kerbrat via buildroot wrote:
> Changelog:
> https://github.com/ImageMagick/Website/blob/main/ChangeLog.md
> 
> Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>

Applied to master, thanks.
For info, I marked the commit as "security" related, because 7.1.2-10 is
including a fix for CVE-2025-66628. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/4a315e153f120ff236f1dd63d9e097e169918c23

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
