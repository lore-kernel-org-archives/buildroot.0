Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF10D0D152
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 895A98234B;
	Wed,  7 Jan 2026 17:55:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aONLoLGAxhzp; Wed,  7 Jan 2026 17:55:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B50E5827AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808535;
	bh=ylv3Pq82k8cpQXtA/rzq/nIp/m2cF/WBwiT2Qp8LamY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rXsI0N82kIrIpA9/3II3RwWkVkSoAjm1PU0MQp9J/BpxNHqb7bW3XDpbFeis6wFmd
	 OpZTn0l0ZHxXl+Vj0S8YSs78MY+PqnOm+EhP/7tJ/50EKBTQ7bI6EyoVSXEPoEvsgX
	 YtHn5Gt+/KPZokLPQscg36t5hRI7+2yOzJqNmjNuuLRMXiA3PMxGc+qKQZhyAdGRh1
	 7YptiyFn3kfgDoTPECk8BjbwK6R4+QlJd7sxhcsx/tEMMYyRQxOAzJon90+2hVokIa
	 jiW6Omr0Be/WPZzl2EA9tuWc37uaD6hcARlB/jWk82v8PRUwyawFLyfjkHyg57dA9t
	 peLJHRhxNFvKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B50E5827AF;
	Wed,  7 Jan 2026 17:55:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A6B19ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D55B40391
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cbtamcVwJlzY for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:55:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0210F40160
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0210F40160
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0210F40160
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3AF18B97A70C; Wed,  7 Jan 2026 18:55:31 +0100 (CET)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:55:29 +0100
Message-ID: <20260107175529.230040-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251214210114.2523806-1-giulio.benetti@benettiengineering.com>
References: <20251214210114.2523806-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808531; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=mmZWgpJs1p5gqpTw1NLcRLrzgO0dqC5MjZKkNr6OY/M=;
 b=SjJJ1UWFo1FmTOtfcTHw+IuRbap4xvQwO7lCYR5EANbiEjfhxd1q6bRkjz/16oK4pFXS/t
 77cvd+XLpDcdsbSS53H9EMUiqF6V/Pzz4qZss8dNtSs6kxvtSrQiQqbMIET+ji7N2drmsF
 G9JZrdXBGRLhO9fQHAzJFbZi2uxaDFcDbUsejkaPya+CJNUYI94CK/CJXeBPejpIrY/C9r
 BCqXUboKmRALpFTBQ+K9JIEO3iaApvSuo/+HT4TikVttYLzjNm5yiadGTEuhDcxBKBGFfb
 U7+hmZbax1SL+xEcQnEAXA3nb5swvidsR8xDXl1wAN8Q/THOG/sU8MMQ5wy9+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=SjJJ1UWF
Subject: Re: [Buildroot] [PATCH] package/rtl8723bu: bump to 2025-12-14
 version
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
> This version allows to build with Linux 6.18
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.11.x. Thanks

> ---
>  package/rtl8723bu/rtl8723bu.hash | 2 +-
>  package/rtl8723bu/rtl8723bu.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rtl8723bu/rtl8723bu.hash b/package/rtl8723bu/rtl8723bu.hash
> index 1261139a20..e230485226 100644
> --- a/package/rtl8723bu/rtl8723bu.hash
> +++ b/package/rtl8723bu/rtl8723bu.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256  e9f94b6e6a6412acbef98d5e21f5c5ef185b0d856f35790e328caeb5df40702c  rtl8723bu-bb6fcc9d14b1ec8eb9c3b448c2023fa8fc551178.tar.gz
> +sha256  22d81a21318cdae23ab6a65bed7c24d7cc98e7d1afef7a200804761c72036019  rtl8723bu-ac3d2f564bdf6816f1e3a3384524dc1a966f78a3.tar.gz
> diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
> index b324b87685..f1c4eda4ed 100644
> --- a/package/rtl8723bu/rtl8723bu.mk
> +++ b/package/rtl8723bu/rtl8723bu.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RTL8723BU_VERSION = bb6fcc9d14b1ec8eb9c3b448c2023fa8fc551178
> +RTL8723BU_VERSION = ac3d2f564bdf6816f1e3a3384524dc1a966f78a3
>  RTL8723BU_SITE = $(call github,benetti-engineering,rtl8723bu,$(RTL8723BU_VERSION))
>  RTL8723BU_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
>  
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
