Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711DBD0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48FBE81193;
	Wed,  7 Jan 2026 17:51:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dy5uUNBbjsvi; Wed,  7 Jan 2026 17:51:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BEF981154
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808272;
	bh=18ub3GTHDg0KqVQmadTJfGNd+jGcEzrSyK08olZymIc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lmdFzUHjeEZQJa7ExBhlwl9gM0JBZmhEOAnH/oydaLR8K4LXVJThb9VFC2pYumqJE
	 W5ld7IeO3HeBBP/XKxRU3IreC5P9v5Kv0rxHfwO8ylfrayd78q00rEvBe5jvVKCD2q
	 r8JBrVkwgg5BdJvR70uS54jzTFaoOnzKYIY4NVvYNdx6QTuyzxex0awubjuW4ZCMfK
	 oo8a/6shoCV9OWha14KfgsqmwI/eIOu8r4Oo/NX9U72ZfqVmJXNTfa2rtrmeX/pTJi
	 YvCQJc4cvdXgMLaXbf4wOOFBNq1gNrgKypBHUKhe90R1t9cYe6BbhtIGotpIFT3yHw
	 Ky6Anx9lNPnlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BEF981154;
	Wed,  7 Jan 2026 17:51:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D103625B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B787C40128
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ElFLqEZ7XV-H for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:51:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A762340160
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A762340160
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A762340160
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E1182B97A70C; Wed,  7 Jan 2026 18:51:07 +0100 (CET)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:51:06 +0100
Message-ID: <20260107175106.227463-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251225211907.2300253-2-giulio.benetti@benettiengineering.com>
References: <20251225211907.2300253-2-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808268; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=xp5iq1FdGL/OP1wsZTk7qHCF8Rk3XsbU5xQ/nTw/xoo=;
 b=Hx8VpvLZqpQBYuHqIGPj20pn1hFZedChB5vxD8qdW3Idt6uxI641A31lRLFzE5f5uHMR3R
 yLk9XIMMz/tb6ZrjJpSn1l50tzH+PJfZysAkkA7KgnGrNK4b50RD7nmchLkuynoRyFnYji
 E2d0KK0+ZC+RdIgqo32biLVZ4tUDA1ccQQu7CGHNNW6az50Ty0HSgMZ+FiaM4zFSOl9fPx
 X+V12OPGdZff9JzA24AaLNkTv5msz7YOxbOLekXZS2a5MmGzb+SdkYwyorGsEBbxEEovap
 WOhUPyBHY5v/OSh0xgZFrrz1N4IRr/IA/agOX26lfFET9WljzGgZhY+eWHNiPA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Hx8VpvLZ
Subject: Re: [Buildroot] [PATCH 2/2] DEVELOPERS: add Giulio Benetti to tmux
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  DEVELOPERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index d39e8ab30f..62a0721ebd 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1332,6 +1332,7 @@ F:	package/sunxi-mali-utgard-driver/
>  F:	package/sunxi-tools/
>  F:	package/swugenerator/
>  F:	package/swupdate/
> +F:	package/tmux/
>  F:	package/trace-cmd/
>  F:	package/udisks/
>  F:	package/util-linux/
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
