Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E367ED6ACDD
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 16:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B926C6120B;
	Thu, 18 Dec 2025 16:37:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rPOmwdlrbQ9y; Thu, 18 Dec 2025 16:37:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F39A2611AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766075860;
	bh=YynvW+exKCldEMkDg2Mu9bugAUFmneYSHPXh8XaNr4s=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YpgYvflXkgGYntDRzIVnDxHv0l362SMJJ6kXOSNbMasceuDegL9UaoVni4M5GTCC7
	 iEr0dC6+ASQN47XG3oYSQ5ND/kuv1mYw8x6mza3WBX6ukeP76yXJqB6zRLs0t8IbU7
	 7a4sP8pMHBG36K7HfADnAWtEGfUITrwv+IJ7koqW6vjdQM3Y8HjPDjbjF4umGn7qrF
	 hvHkDfIFvHL5MjSSCPG6Xftfu54u0/qrqTdK3AIwLkjq1So4C4gMr66EHU9P+nK5PY
	 dUtGG7dVmIWD1fT3jJSC+MotjoI6GzxnguOyDljkERFYn/U9nvRivnAVKnx6vyK2OH
	 HPppHqNUHJh1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F39A2611AA;
	Thu, 18 Dec 2025 16:37:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C73041A6
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9BCF410C5
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:37:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VeTmr4meF6c9 for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 16:37:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B3D7D4074D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3D7D4074D
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B3D7D4074D
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:37:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 59943B97A297; Thu, 18 Dec 2025 17:37:35 +0100 (CET)
To: Kadambini Nema <kadambini.nema@gmail.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 18 Dec 2025 17:37:32 +0100
Message-ID: <20251218163732.379436-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20250607222538.50866-1-kadambini.nema@gmail.com>
References: <20250607222538.50866-1-kadambini.nema@gmail.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1766075855; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=VsFRMMzvRoLvZoQqY8zWxKTG9Jma1xqMPsT5tNlA/CU=;
 b=CkpN7Yxu0uOjSokbck2UOByHdkrbBWa8UYwPz8Gkn9XnRD6ARhC/VTAAP7TAA4ioeKkfKw
 8ILCNh8sPWSNWNYaRGNnPIu8yVpNhl6rwTzPOh9Wi1AUeT8PRHotaBOCQk+ssCaadlBgp/
 cQ1B2mdWlpz8hvGfo8AWm/SgzhDv+UA49/HRl7NUAiT7QkHy42wsodQyPVfHrjyPFNt2G4
 AmtqSJelprXQMxgJhBEmg9M1lr0/mzcjhr7zwPefIhe1RXiXAFIds++HbSgUVkBsq+x2jA
 8RZi2G6kxih6V7jJGPWYJwwec3VxYSYW/citzhDGUGpLQPzxWYPLZSkkuCD4yA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=CkpN7Yxu
Subject: Re: [Buildroot] [PATCH 1/1] package/libgit2: bump version to 1.9.1
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
> Release notes:
> https://github.com/libgit2/libgit2/releases/tag/v1.9.1
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

Applied to 2025.02.x. Thanks

> ---
>  package/libgit2/libgit2.hash | 2 +-
>  package/libgit2/libgit2.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
> index 3f11309750..8c9b210581 100644
> --- a/package/libgit2/libgit2.hash
> +++ b/package/libgit2/libgit2.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  75b27d4d6df44bd34e2f70663cfd998f5ec41e680e1e593238bbe517a84c7ed2  libgit2-1.9.0.tar.gz
> +sha256  14cab3014b2b7ad75970ff4548e83615f74d719afe00aa479b4a889c1e13fc00  libgit2-1.9.1.tar.gz
>  sha256  e3712465634e97cfd850822a4eb5ac7d2f8a10f753189366d5a2060046f28288  COPYING
> diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
> index 4026ac1f7c..f615484edb 100644
> --- a/package/libgit2/libgit2.mk
> +++ b/package/libgit2/libgit2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBGIT2_VERSION = 1.9.0
> +LIBGIT2_VERSION = 1.9.1
>  LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
>  LIBGIT2_LICENSE = \
>  	GPL-2.0 with linking exception, \
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
