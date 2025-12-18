Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CAF3D6E2B0
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 16:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12C4361266;
	Thu, 18 Dec 2025 16:38:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sBiZMwKAH9Ti; Thu, 18 Dec 2025 16:38:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE55C6124A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766075915;
	bh=6RkRfNckA8feIXQvAid9cvdAw7cq9Rtj3Gls+SgzmEo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=m8H2HkhgLLY0F89UrW98j+fXbU3MssXtjee8/+5LFj8K+5tJRvxPiwSsbquMhdRRt
	 qOLqlP0KMw04nupFXA8UF66t94KzWc+6s4t/k+3TcC3iwtoXVpsRjnR4BQkTrsOd0I
	 hSuPI1Mv39T1ab6j8eSO4CGvcz1GEE5YNznH51eR3Nbnqz1o6/TT6l1GHSq50IL4yR
	 a59ulnrxH+DEp8L1nXMgIXAp2+c8Hk8Py7vcaRC4ymVrXoNMjRNYldSYk9D1mPk/8i
	 MkmPWc+L4DHNyNkr++YBG0ZsiUXZWotc/0/goPYQOwvOGhzi908f0azXUfIiiQvCfH
	 2HvEijc9O2RiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE55C6124A;
	Thu, 18 Dec 2025 16:38:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 48A301A6
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B4F541152
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:38:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V3mXBndscwku for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 16:38:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2BD3F4114C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BD3F4114C
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2BD3F4114C
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:38:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C2A6AB97A328; Thu, 18 Dec 2025 17:38:30 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 18 Dec 2025 17:38:29 +0100
Message-ID: <20251218163829.380305-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251213115839.1277318-1-bernd@kuhls.net>
References: <20251213115839.1277318-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1766075910; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=gA70XnURMm2qWDYFE6ywwVuuHDFOhQaFQ6321JLiPww=;
 b=Adr/MaydB3KGIP+SAxzbWb6ezTbYQe/mClb0Zm/QKDdaESmQYx57Fd4c4yFrdAqp2yVoBC
 7C5lyKDMIXJ8bQAVjnrENswI+evOPPGYfRAMx5gDkbnljhC78ovOLtMkTbr6eryVRHvF+M
 a+wdNawHZth2NJ0t9hWz+8w9kMh7Yj3DAaXSykHQv0n+OSHIWXakbzrfiovWk1WUBjqkhS
 SUIOV2VVoLRH6KWaLDB9XZhyD3NVCazNBeiSr/yFW6qVqMm+L5i8JArNcSgFQYk6fwoV3o
 ununNcvuT9IvAuNUQZ/M4822dSw1rSEMdhPkpRD2oWtiPNUGqwr469I0Pyx3QQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Adr/Mayd
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.23.4
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
> https://www.samba.org/samba/history/samba-4.23.4.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.11.x. Thanks

> ---
>  package/samba4/samba4.hash | 4 ++--
>  package/samba4/samba4.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
> index ec28ced087..363c6c26eb 100644
> --- a/package/samba4/samba4.hash
> +++ b/package/samba4/samba4.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature
> -# https://download.samba.org/pub/samba/stable/samba-4.23.3.tar.asc
> -sha256  06cdbb27a6956978b045455fe0696d998ffbac8d24ba24de87a4ef8200813320  samba-4.23.3.tar.gz
> +# https://download.samba.org/pub/samba/stable/samba-4.23.4.tar.asc
> +sha256  af429d078a86f1ce16d0d1ecee35c42a3610790b47b84468f31284a8c4060140  samba-4.23.4.tar.gz
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
> index 439e5452af..7976e9ae05 100644
> --- a/package/samba4/samba4.mk
> +++ b/package/samba4/samba4.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SAMBA4_VERSION = 4.23.3
> +SAMBA4_VERSION = 4.23.4
>  SAMBA4_SITE = https://download.samba.org/pub/samba/stable
>  SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
>  SAMBA4_INSTALL_STAGING = YES
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
