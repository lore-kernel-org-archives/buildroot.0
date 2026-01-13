Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 262F3D2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F062940D41;
	Tue, 13 Jan 2026 19:45:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qRHImMu_Lpac; Tue, 13 Jan 2026 19:45:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B40B940AA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333544;
	bh=BPbVghqjaRJxfJ8nPisWftMhLJTTneu38I8OHpmhjGg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cjGPEJTLC9KNcIMWgNj1JfCD5gZam7M8tbmkCqemd9XS5+4Q4v4PUKiwys3RophqD
	 XMG6iAdzy6RVfnjOPW6so0Kw/Sz0LE2JvUOr4oQ+TY8paoHUBW0zY42UnItUGFMDxq
	 DDRJImtxPtS7puJZlUCAQKiPIgpJTxR2RIsj6q3IW6LXBeJ+sCAhiGsuMBW7vJrTxl
	 w8rFxeef0ITrYu6dJPpdiymefwgNZBqytEmL6976krHmO4/ZircG4aV3ufzqUGLUWq
	 9deeco4vyx0DnVPVAkTkBtKyPc+G2BV3qMAWkgQ95FyTbxrrBR4zK6pjE46fyhWFZX
	 bp4seOLfVI+IQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B40B940AA9;
	Tue, 13 Jan 2026 19:45:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1545A1C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0647D406E2
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:45:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KpTr1YROlJJ8 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:45:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0138A40373
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0138A40373
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0138A40373
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:45:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1EA60B97A885; Tue, 13 Jan 2026 20:45:37 +0100 (CET)
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:45:35 +0100
Message-ID: <20260113194535.97901-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20250926100609.4158676-1-dario.binacchi@amarulasolutions.com>
References: <20250926100609.4158676-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333537; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=aJAvbncLOxGFJTkm3UYRM5vj8QliGSkyWdl8yRFNOiM=;
 b=jO4c6Xv/A9q17BwIsK+WHo/lizpLVEsE2zjF1J6Ua4v5sI400m++KoC0X9wyLnEKoOw4E9
 mYroAmj7KCT70WaqCDblg8VbIkRi0YUmZ43X3nyQHGT0AzFMJ0DECIfLRBN/lH8fHixyIP
 Xz4siDgTRlGUh92jCARGu9GjdJUYCEjvv6+y15UGmaj8spDFcoEXbCXDHS65wa8UESdnWU
 2YUYm+1S6cf6loJe2aDae5n3hunVLggHus3Y5bTZ6uRRwrWOkM/owttHKp/rkcVUPyZV1k
 yBekgTBccEgMwFf4zF3heenF+osoN8jy061xjK9bqPew1hPd8U2kjTfGAut1Nw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=jO4c6Xv/
Subject: Re: [Buildroot] [PATCH 1/6] package/embiggen-disk: fix
 EMBIGGEN_DISK_VERSION
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
> Make EMBIGGEN_DISK_VERSION compliant with release-monitoring.org.
> 
> Fixes: 4ae18c511a2a7e8b0b6cd7a2961ba4c0e395fe2a
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/embiggen-disk/embiggen-disk.hash | 2 +-
>  package/embiggen-disk/embiggen-disk.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/embiggen-disk/embiggen-disk.hash b/package/embiggen-disk/embiggen-disk.hash
> index 02c99add6aa8..1a327dce2a2a 100644
> --- a/package/embiggen-disk/embiggen-disk.hash
> +++ b/package/embiggen-disk/embiggen-disk.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  25e536bd58969077554927a456cd3cb79e21f126e47545ba511abe64a0f3ba5e  embiggen-disk-v20240521-go2.tar.gz
> +sha256  67ab51d13c85c5e3f1805f1e7b1e2db92edf8472007cd859c5919692eb0c0cbc  embiggen-disk-20240521-go2.tar.gz
>  sha256  063aedec1652c5a05c2d04c40e032b932453142ee8ef7fd53c04a9acc127fc95  LICENSE
> diff --git a/package/embiggen-disk/embiggen-disk.mk b/package/embiggen-disk/embiggen-disk.mk
> index 47b86c072bf3..a981cdf87f63 100644
> --- a/package/embiggen-disk/embiggen-disk.mk
> +++ b/package/embiggen-disk/embiggen-disk.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -EMBIGGEN_DISK_VERSION = v20240521
> -EMBIGGEN_DISK_SITE = $(call github,skiffos,embiggen-disk,$(EMBIGGEN_DISK_VERSION))
> +EMBIGGEN_DISK_VERSION = 20240521
> +EMBIGGEN_DISK_SITE = $(call github,skiffos,embiggen-disk,v$(EMBIGGEN_DISK_VERSION))
>  EMBIGGEN_DISK_LICENSE = Apache-2.0
>  EMBIGGEN_DISK_LICENSE_FILES = LICENSE
>  
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
