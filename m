Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104D7D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB09140360;
	Wed,  7 Jan 2026 17:50:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Adxm8si_ngnw; Wed,  7 Jan 2026 17:50:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26C2F40E53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808258;
	bh=vR3lqF9AJJuLWOTYxiB/W/sy+P2mMUUilKRHW7fcZRw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jvVImUxKiu18Ulb97AmnDTqDIPJctKDKFv+q4XkhtmrpYtVQPhO9RYGtVXaPnzhyu
	 SrXFG7HlHqdUSQP33OBPUPMne/GFECUs+CwKcvkdn4eupSWs8ImWJpmyukw6jeqmuU
	 Y3NtQXxRJcMW8qb5CLK0dZ+rPQBQSmye4mgrU1o7rBZnktdAg5LSykba6cfMpTx3Lh
	 TPnKp8eFDh/iLoZy6W1BHHqtF4luySrYP3WfKoInlN7o8zhDhgSF451qt3LXB/DkKK
	 lKZhjueXN5soMVseLKntPsXHEhb9vue4x/kr2CEnOBQTzW2QbwSpczfI8/oeABChhr
	 exzt58CzaNvWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26C2F40E53;
	Wed,  7 Jan 2026 17:50:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8432A9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B439807D6
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ikvAEi2WENS5 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:50:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 58CE5809BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58CE5809BF
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 58CE5809BF
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6088AB97A596; Wed,  7 Jan 2026 18:50:52 +0100 (CET)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:50:51 +0100
Message-ID: <20260107175051.227013-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223202230.3132006-2-giulio.benetti@benettiengineering.com>
References: <20251223202230.3132006-2-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808252; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=Au/1SNme+BygZWP8GzzEkUFKc8FAY66cQUwUCugVXds=;
 b=dAKMeOhOPbkZb5kB6aQAuuHH2/t2mDlBYVql1UTRTSL3mZ5e8PUxzVn8vkjT8NdwrKGqrt
 5Q4B84/zRg/VqmDqQ1dfZMYE3MGKLyAgX2nOzURIwGaUM4nfUNTaLv/TJrf7lkK7J7hAdS
 2t/wmNiFnhFlsfuo2oBqiWfwu263zpHre7o0Eh180sTeQVOe3/W4OL5XfbeKYD1HGBixDq
 EqslSK5HXPSgR9ep1VGSNnWQLxxesCrf6mLh/SG10Rqy1dwUATG9gnmiY7mv73T7Fx5fw5
 QLiBoUYoXL1HfqLqkO50On5K1Co6g1IUL1MgmN2FBWod5sQfjmYHhgQpOgCySA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=dAKMeOhO
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti for package
 zlib-ng
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
> index f289f81229..224c0fda73 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1335,6 +1335,7 @@ F:	package/swupdate/
>  F:	package/trace-cmd/
>  F:	package/udisks/
>  F:	package/wilc-driver/
> +F:	package/zlib-ng/
>  F:	toolchain/
>  
>  N:	Graeme Smecher <gsmecher@threespeedlogic.com>
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
