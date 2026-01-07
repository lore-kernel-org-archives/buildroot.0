Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157D8D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC24A40F3E;
	Wed,  7 Jan 2026 17:51:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9L-FnT0ZjVdI; Wed,  7 Jan 2026 17:51:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AAA140F34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808304;
	bh=MscJ2EdTWMEbFVGzF3i0yDOoAl2yDuepgTRkHGSeGUE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=X2muGQh242M0bCb/aNoGRiUDKt53MR+Na7549IRQXppcLQuAO13rmvLCZfVNHXjxG
	 V5YSKdMT6Y3ehsvLZHhrIkIsZF8KbKKTApOx/49vVPqB1PApRpIMuPaykAL1i9uDHu
	 p+J+dUJYJu7qyA9JS8l5W1MEo5KFdbzR3EEeO59kl51cumueXA6XOfFS/zYJltmwye
	 jLo4ZU/REdokdKh6dc5/HgaaSWSUMb/rYf4otgW5zse6swFa0qUhQ++RfVODmGHha9
	 jfgOLXIZa1MLAXOuCYBEAcASbjQ2kH0fLtMs18e3yZIlcCc3bbUtdWQzy2AIO0pcW0
	 xmINVXp8nn3vg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AAA140F34;
	Wed,  7 Jan 2026 17:51:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1069E9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0266740391
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OMQ5JAO286oa for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:51:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 022BC40160
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 022BC40160
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 022BC40160
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1E826B97A70C; Wed,  7 Jan 2026 18:51:40 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:51:38 +0100
Message-ID: <20260107175138.228143-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228185637.58072-2-thomas.perale@mind.be>
References: <20251228185637.58072-2-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808300; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=Qbxte5U2KB/xfiDTMt0w1NuPZuCjCgNrkkXtQvfdQlk=;
 b=ZblY8H1LzILPu2u9BAf6zOarRlOXhRZbECByAuNYk7XjZCzKr0er5fp2GY0nOrKUPCOdeu
 IISO8dH/wk8VtaQ0xT10yNPKbh68rJK0X9oHtDzTK55VFkaFHLP7H6c/h+VAEYBLevMsCq
 yKa8PWwuoJupzgmQVGEPHAdpterRD/uwb2Q3IHYazLjSIeQTZfeZISVLYkB6wjOQpW0WrD
 XOyI7kTOem5b+QjysGJzaPBiymZePdDbh/45qChm4km22MobKD+OksSPoococ/RY6pTl2Z
 uBqtnYEsgtckLX9EH7FaTyxgyA9H9gZOce5WW3+H8rcKSr9ArvI34QKTwlmaVA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=ZblY8H1L
Subject: Re: [Buildroot] [PATCH 02/10] package/yasm: add CVE trailer in patch
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
> Since Buildroot commit [1] the patches that fixes a security
> vulnerability needs to reference the fixed vulnerability.
> 
> This patch adds the relevant information to the patch header.
> 
> [1] 1167d0ff3d docs/manual: mention CVE trailer
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  ...1-fix-null-pointer-dereference-in-yasm_expr_get_intnum.patch | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/yasm/0001-fix-null-pointer-dereference-in-yasm_expr_get_intnum.patch b/package/yasm/0001-fix-null-pointer-dereference-in-yasm_expr_get_intnum.patch
> index 976c2f7a13..b563fda71c 100644
> --- a/package/yasm/0001-fix-null-pointer-dereference-in-yasm_expr_get_intnum.patch
> +++ b/package/yasm/0001-fix-null-pointer-dereference-in-yasm_expr_get_intnum.patch
> @@ -10,8 +10,8 @@ For more info see:
>    - https://nvd.nist.gov/vuln/detail/CVE-2021-33454
>    - https://github.com/yasm/yasm/pull/244
>  
> +CVE: CVE-2021-33454
>  Upstream: https://github.com/yasm/yasm/pull/244
> -
>  Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
>  ---
>   libyasm/expr.c | 2 +-
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
