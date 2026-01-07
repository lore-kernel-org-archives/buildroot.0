Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED32D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4388A40EA2;
	Wed,  7 Jan 2026 17:51:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QzicD19jZ_oF; Wed,  7 Jan 2026 17:51:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EF3040E9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808271;
	bh=avrnfMglhA10YwcizMkukwAe2+pF2MD/tClTWsAS3Qk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HFTEZxYgzUka1FsACUq9peVRI8ydWd3+LYQbkwwMCJ1frOYFLyZJ1yfAn2PIU/x5i
	 Ic06t0ZnPxwJ/ILfK6H6zr6ZAO3rp9D0o5o3hY2TxuR6drwvS4sTvH+C2Tv1MXxamq
	 k1DXh0cG5RZvSbWNpuR5fgfpXQhXdhO9XyplPBRkfzUgZNO2VPuEOYY9Zn7SoR2tLL
	 F2PC1zuDW8aVFk760DysTJrl4EaxPhel7KFSREJT9QqoyixYiJ1gCguvEVpvgCoHDz
	 ygdReAgzpnmseQCOasX/NKBiQifThdmbGGREDb9NeKTiw160C5AXR/HUFW7NQ3aDVu
	 a9tlvZmzByBXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EF3040E9E;
	Wed,  7 Jan 2026 17:51:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7001A9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56D9D8113A
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zl2BiQW_Y7PM for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:51:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EEF11810FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEF11810FC
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EEF11810FC
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 35A87B97A70F; Wed,  7 Jan 2026 18:51:06 +0100 (CET)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:51:05 +0100
Message-ID: <20260107175105.227411-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224112404.3796586-2-giulio.benetti@benettiengineering.com>
References: <20251224112404.3796586-2-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808266; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=eB1mpCjb38u78Y45dw0EzRj8RCz0s+ntLw0NDiV41Ak=;
 b=pZ65D8q62O2qA27HMQ0WL+TYdK+BDa5/IS8PWV+BQE7BjZjER0SU40Z98I9yAy86tOdu49
 PnsfGu1kk0Vyxb74RHJv16QTqQKLEFlosbz2/8ocqUReMz72j66+5zfPPQ0Q1HQLXk3qZK
 b6jX5sJEB+l0oqzU/W/HCk8YSnz3CTUlKKPq6HN335SQ9U2JigvibJUcsofDqrr14CutXD
 9QQ/JogbOQhtKSZ36tp8iTbcMyeuy2uqIun/ZnLkRZwBWI+QE3NUmuivk/fHFumxv6TAtX
 ZwDkdRrPI9WMnhOVHS4iDwZu1AFoREnFPGXlNBrp5sI3omfK0Vm9GYjn6NfI9g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=pZ65D8q6
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti to vim
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
> index 224c0fda73..d576fe9c61 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1334,6 +1334,7 @@ F:	package/swugenerator/
>  F:	package/swupdate/
>  F:	package/trace-cmd/
>  F:	package/udisks/
> +F:	package/vim/
>  F:	package/wilc-driver/
>  F:	package/zlib-ng/
>  F:	toolchain/
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
