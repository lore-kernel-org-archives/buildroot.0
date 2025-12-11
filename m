Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B618D41D7E
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E427340305;
	Thu, 11 Dec 2025 19:31:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CW72FmVEvb8q; Thu, 11 Dec 2025 19:31:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A60D4007B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481462;
	bh=ZrHAQeRV0Fc4vdUS8sQuCJHXenG46HJG3LyVWRuThyk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GmqHgxl7BshsvyLv+jyY8bDhbINmH2gZikhG6wZikwXvVBbLtl3Gpp/ltI0h0tTVT
	 7dB8PR9AdyhR312PVPTOSDMgeEFW+2aQl1Twn5BKQtIS/XarDxdnuZhkHP+g3TYy9S
	 efyDx2ib8deCEwdXRL5x/+NTD/qKAlJ3UdKGtqaMPp4WmAI/+xe6RfQDeFYuRJYnRS
	 2v9UwtKQUWnb+mI2YTyuCoWs5Cf629V3/MpQkapQU4/t7dXR/XeVJEsY5qLnYYeF6W
	 X8d1t/UWSOsOXq4zXVjhQ0TT9pwlvV37vHYzYWAI8hldEEdmf0E1mMGvWlo/dFVRAH
	 FcmC4T99WqVsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A60D4007B;
	Thu, 11 Dec 2025 19:31:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 41640E7
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28398411CC
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:31:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XtVvQSV7lZep for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:31:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1BDFA41200
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BDFA41200
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1BDFA41200
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:31:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5973AB97A082; Thu, 11 Dec 2025 20:30:58 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:30:56 +0100
Message-ID: <20251211193056.1099437-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251206213818.2301716-1-bernd@kuhls.net>
References: <20251206213818.2301716-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1765481458; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=omPQJ5WiB1S+IuFiu2MkPovUy5lhGrs5uqjmsiyTA9Y=;
 b=cWfbKtWO5Htqw6L2SSrkHgASCR2By0uPxE1cnyMs20f7oNPaqRehrL/D0sV0O74PYlxsrN
 +mytKq1aqd7/2qnAk0kU4HcuhiBp23/peYMqhg8nTqtNV7zX3QI/p0qDQXdjAVLHBwNd+z
 XSLABIk8EjkcvYoh4rywSE34SZAAPei1nPS/LfK9rQT253GWdtqu+N1uVLVLSpnGomW9Qm
 PbXpLtNDU9Ah7U7Zshxr/Ah1COXW2xZVWnw6crQN+L/NkUoQwTZm4NKMptYres0WRoKe7Q
 Bn6ehCNtOsl91A4lLgW+sKAZcXuLey9Ab+BzSG/TECC35+60ICiMPAXPe4HMZg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=cWfbKtWO
Subject: Re: [Buildroot] [PATCH 1/1] package/ficl: update SITE
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
> Upstream moved the tarball to another folder:
> https://sourceforge.net/p/ficl/news/2025/07/ficl4-is-retiring/
> and also retired the package.
> 
> This patch just fixes the download problem.
> CC'ing Francois to ask whether the package should be removed until a new
> version 3.x is released.
> 
> Fixes:
> https://autobuild.buildroot.net/results/125/125fa1c0a3b37b4d09389a49640b90121838c665/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.08.x. Thanks

> ---
>  package/ficl/ficl.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/ficl/ficl.mk b/package/ficl/ficl.mk
> index af900fa2cf..c0698a3433 100644
> --- a/package/ficl/ficl.mk
> +++ b/package/ficl/ficl.mk
> @@ -6,7 +6,7 @@
>  
>  FICL_VERSION_MAJOR = 4.1
>  FICL_VERSION = $(FICL_VERSION_MAJOR).0
> -FICL_SITE = http://downloads.sourceforge.net/project/ficl/ficl-all/ficl$(FICL_VERSION_MAJOR)
> +FICL_SITE = https://sourceforge.net/projects/ficl/files/OldFiles/Ficl4%20%28retired%29
>  FICL_LICENSE = BSD-2-Clause
>  FICL_LICENSE_FILES = ReadMe.txt
>  FICL_INSTALL_STAGING = YES
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
