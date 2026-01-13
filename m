Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4783D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAA03842F4;
	Tue, 13 Jan 2026 19:47:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4gzqK4b0NpLe; Tue, 13 Jan 2026 19:47:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1249E842E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333621;
	bh=vNCmSw+hLhjmhllWgpO9DDPOmPL48GYPrfua3nyZGsk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SMmUsss8xLAd7BiDholQSLTVAQPou8CNV/Gfw7mJtQ74NUSweX6+p4Ne/OeDGd2+S
	 qmjpYXs0OSuJ9yJ7S+2X+18oHXj7wJmZRnJCCTO4luAInsdzhqXl0cbXd6PL+Qu07U
	 vA7IBzCA5Ts6IQS1tzWeOSgQO3KkbG6fa2stH5iSJUkUuv2IJHmidIwKed6QxmimW/
	 uJsJL/GZN5tVfEMl4NttpnCroNICj4/R/sUeKjJ8ngL55VOQ5vTx1gjGenIjhttJPI
	 tX+gNpUHcTX3XFYOn6goNUEiI/RQmKOts4ThaZQv5XMwyoL4ugKuuYdQXwdCCJbcWg
	 ZNTMz8mVu9qYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1249E842E8;
	Tue, 13 Jan 2026 19:47:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FE14231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2106060BD1
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xj8UC3Tf3Eza for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:46:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1BEE660BB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BEE660BB3
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1BEE660BB3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2CDC5B97A863; Tue, 13 Jan 2026 20:46:56 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:46:54 +0100
Message-ID: <20260113194654.99195-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230081917.18676-14-thomas.perale@mind.be>
References: <20251230081917.18676-14-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333616; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=xIsLRaSCuc++TSPNToj+cFBt5JAOlu0pRHpGUmLI7dU=;
 b=MOM+yIaQTvO3CD8Tdre2Giv4dBv56xn7g4pWXr+ng+Uj0gCjSuk5NACBCnLczd7jwxQBiX
 PmZCSSLTMv9iRo4REuN792IwVUqrXgRnj1Kl9hbQgD2/e6RrmCMAX3e6+8nSddREthY+Ri
 wiYSFPpumjklQmOHWgi44lu7UdUP2JXX/6UXQZEBACtonbaXAydyyr4Y5QTqGgwq9Cyj58
 S00L3W5bLHi1nJ5fnV0ZfXxw95Dv8QnelfczUiBCKMHyrtMVNEizVRls9uWkWVcQUqwldW
 u9OadUF2y4bXDb60mk2khwdHoUY/tNYLmR6w3DTFE1cSK0YpG1UTX4y7AutHKg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=MOM+yIaQ
Subject: Re: [Buildroot] [PATCH v2 13/15] package/freerdp: remove stale
 IGNORE_CVES
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
> The NVD DB is now correctly tracking the vulnerability starting version
> 3.0 (see [1]). The IGNORE_CVES entry introduced in [2] is then no longer
> needed.
> 
> [1] https://nvd.nist.gov/vuln/detail/CVE-2025-4478
> [2] f741e8f6e6 package/freerdp: ignore CVE-2025-4478
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/freerdp/freerdp.mk | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
> index 391b9a4675..3a1ba61621 100644
> --- a/package/freerdp/freerdp.mk
> +++ b/package/freerdp/freerdp.mk
> @@ -13,10 +13,6 @@ FREERDP_LICENSE = Apache-2.0
>  FREERDP_LICENSE_FILES = LICENSE
>  FREERDP_CPE_ID_VENDOR = freerdp
>  
> -# As explained on https://github.com/FreeRDP/FreeRDP/pull/11573#issuecomment-2904160524,
> -# the affected code is new with 3.x, was not there on 2.x
> -FREERDP_IGNORE_CVES += CVE-2025-4478
> -
>  FREERDP_INSTALL_STAGING = YES
>  
>  FREERDP_CONF_OPTS = -DWITH_MANPAGES=OFF -Wno-dev -DWITH_GSTREAMER_0_10=OFF
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
