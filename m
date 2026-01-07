Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 723B9D0D150
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46EFE822FB;
	Wed,  7 Jan 2026 17:49:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C3nB7RwtmKDY; Wed,  7 Jan 2026 17:49:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E8BA822BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808142;
	bh=Fw4jmDhfu/fxtj07ILNV9BAFCJzLxMwfukoqhrTEEOI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KPBPAxbs1M7kJ2tWCZH/L8OBEV1OadfPdlN2MItxnac5uweggfWjQLoG7sxmW6JsZ
	 UDRqoAUh598C5O9nVtdrsUCKgctJgSNHIwNo5XBJWluso3SOqIIlmfxbuSUBRaQReo
	 qHTB0lTi6RLDwVTK44GSUupml/avZ71yMkI1KNOY9ePDL6MhqEQcFUujppjtyJbmb1
	 ub4Dv4VjO+Cx5NQ0UD6moGSYPGNhmmfAR21rd5cEEUujKgCX070qJpa9PJz5WtKLLy
	 qQ4Ugd2FX4G2F0e8esCTuVkJuV5qQxQRiC9w9iJD3Jdbs46/gwxP/W87WmvTiqu/1a
	 dfrmtHIWnzeLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E8BA822BC;
	Wed,  7 Jan 2026 17:49:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B9C9D25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB36840263
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:48:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HmJOocatNAL3 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:48:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9C53D40160
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C53D40160
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C53D40160
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:48:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B59F3B97A596; Wed,  7 Jan 2026 18:48:56 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:48:55 +0100
Message-ID: <20260107174855.224664-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251214171531.1496512-1-bernd@kuhls.net>
References: <20251214171531.1496512-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808136; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=wLToWFNmT4dFdH4ijPA3FSlRN5Ug39tIuko42dnNi0M=;
 b=Ta+iSu9/lNSyL6lMLcpJqnvH9ZYxRlfEQaqAaEgtuZoT/zEV4duI8sBDQ4kQBtTRY9MPKq
 lnnml7xb1c9NGXB+paqTc/i8aIRSC53DkpiJ61TWjDBWQ+/ats5/Jtv5e+f2unqJGPoYO+
 qi5IAuMaorXwKtomHpzFpk5aqexzNCvgNkKQcjXfwEW4aitcBeK3SMft764uAy43ugrND4
 cjnbcP970ceTu5x5+Yx8bkrDbX0UVHR/9RPW5R6gAPAqamvo6O1pvrb3vmfkpttheNmOX0
 6+yBrPYXt/uWo2OXY0psGLoGyTk1tTeyxtCuF0LGPR8QED8Y+YJl+ayUV3Freg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Ta+iSu9/
Subject: Re: [Buildroot] [PATCH 1/2] package/open-lldp: fix musl build with
 gcc-14.x
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
> Fixes:
> https://autobuild.buildroot.net/results/0f8/0f88cbe9152ab816b4ae17e1d84e8257f458eb4a/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  ...string.h-for-mem-function-prototypes.patch | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 package/open-lldp/0001-clif-Include-string.h-for-mem-function-prototypes.patch
> 
> diff --git a/package/open-lldp/0001-clif-Include-string.h-for-mem-function-prototypes.patch b/package/open-lldp/0001-clif-Include-string.h-for-mem-function-prototypes.patch
> new file mode 100644
> index 0000000000..de67131c58
> --- /dev/null
> +++ b/package/open-lldp/0001-clif-Include-string.h-for-mem-function-prototypes.patch
> @@ -0,0 +1,26 @@
> +From f9d0099ac7d9041447cce4d3edd9577b4b52c09c Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Mon, 29 Aug 2022 22:37:14 -0700
> +Subject: [PATCH] clif: Include string.h for mem* function prototypes
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream: https://github.com/intel/openlldp/commit/f9d0099ac7d9041447cce4d3edd9577b4b52c09c
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + clif.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/clif.c b/clif.c
> +index cad6f75..0758a7e 100644
> +--- a/clif.c
> ++++ b/clif.c
> +@@ -32,6 +32,7 @@
> + 
> + #include <stdlib.h>
> + #include <stdio.h>
> ++#include <string.h>
> + #include <unistd.h>
> + #include <sys/types.h>
> + #include <sys/socket.h>
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
