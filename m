Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11600D6E2B1
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 16:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA4484112F;
	Thu, 18 Dec 2025 16:38:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L42lISM_9YzP; Thu, 18 Dec 2025 16:38:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6C22410BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766075883;
	bh=wm7NJfMUAyCTnhLaUwgI/uoMwXxW8jZ5P9pGzkwoUYg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=o95L8AyR55vXtKnsCHh6cqBTnXDF5GhovkhvI2kMhmLLODRZKLZF40LJPohL7G4NK
	 L6jFtKnVWeXyVRqEmjzakSRXi5kuPCI3etfViLmOj36ch3RXYrN/fG1kqBnhctCzen
	 INU+A7exwzz7SEalKJvHJXjlNaBJf14ucE5mH09k2D6u9cG7ldl8NK+BnElER+wO4u
	 gJZ70tj2qEcCo5A6QqCyw+1etsoIwaywLYdnGxtoNdPFwYItPBynzXk31a/rrya7pf
	 zUBHpSaYJeNOcl4+GqYNi8wU+ItMy3Imui/F04M24p6exE8ytyZ7nrzKm4XwhJOgD5
	 5ypDz0tlPZ7QQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6C22410BB;
	Thu, 18 Dec 2025 16:38:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 23C5B1A6
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 214D680BA7
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:37:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KXPn38HE4VCS for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 16:37:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 20BBA80BA4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20BBA80BA4
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 20BBA80BA4
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:37:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A5784B97A323; Thu, 18 Dec 2025 17:37:54 +0100 (CET)
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 18 Dec 2025 17:37:53 +0100
Message-ID: <20251218163753.379867-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251210131421.16305-1-nicolas.cavallari@green-communications.fr>
References: <20251210131421.16305-1-nicolas.cavallari@green-communications.fr>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1766075874; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=Ey/4qndB9pWFaZIIKIUPmOu3l2+LsJHOnBpTLIawIm8=;
 b=RHnSdO545OW6dHMAWnSOToMWoMfbgelRdjVN/43/IFOY8sGSBW1zWd7zGUcevM05wXOqbM
 sEeqHBDB+UyES87pMF/6Q7cYSoiMfTHV15RLOcUGjbrmP4eE4lvxuONkdYxcpxtNsnKXrn
 Zp0+BXH1GXsjSdiHgPNIeANK4epQPNoDUdMtZ45s0IeJP8hHq/xG+hoIEv+MEVUvImtX06
 UbxfAK4sLpT0KKNPkQiT7oKkN0fDXFjnADYQSUpwSep1QbX9uX6/FUOP0ypmQNJtTZdmjK
 +WhRKuxv+acVhoM/66eId5Vd4w3nIZONhZIsaD7PtP/XykKFRjLizmlRcuysKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=RHnSdO54
Subject: Re: [Buildroot] [PATCH 1/1] package/libgit2: security bump version
 to 1.9.2
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
> Fix two vulnerabilities related to SSH support:
> * The external SSH execution code lacked shell quoting on repositories
>   name, resulting in arbitrary command execution.
> * SSH public keys were zeroed by calling memset with the wrong length,
>   resulting in either buffer overflow or incomplete zeroing.
> 
> Release notes:
> https://github.com/libgit2/libgit2/releases/tag/v1.9.2
> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

Applied to 2025.02.x. Thanks

> ---
>  package/libgit2/libgit2.hash | 2 +-
>  package/libgit2/libgit2.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
> index 8c9b210581..e8c155c994 100644
> --- a/package/libgit2/libgit2.hash
> +++ b/package/libgit2/libgit2.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  14cab3014b2b7ad75970ff4548e83615f74d719afe00aa479b4a889c1e13fc00  libgit2-1.9.1.tar.gz
> +sha256  6f097c82fc06ece4f40539fb17e9d41baf1a5a2fc26b1b8562d21b89bc355fe6  libgit2-1.9.2.tar.gz
>  sha256  e3712465634e97cfd850822a4eb5ac7d2f8a10f753189366d5a2060046f28288  COPYING
> diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
> index f615484edb..34cb67929e 100644
> --- a/package/libgit2/libgit2.mk
> +++ b/package/libgit2/libgit2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBGIT2_VERSION = 1.9.1
> +LIBGIT2_VERSION = 1.9.2
>  LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
>  LIBGIT2_LICENSE = \
>  	GPL-2.0 with linking exception, \
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
