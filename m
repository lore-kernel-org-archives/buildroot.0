Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8423BD0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C3F2410F7;
	Wed,  7 Jan 2026 17:56:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d1MHwqIA5s08; Wed,  7 Jan 2026 17:56:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89331410F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808562;
	bh=p2C1udZY64YwduzhCFh5tIS+4BilEKVYq4Z5glDif+M=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JyrBRBIyoLvSUTFS40Hv+G5a04h16HozlUU84FttpIfTMQwtcJz4xVyA7yBQ0Ri/Y
	 rKteWMMKzoJP8YzzpCWHjiUy6BlEC3/8+MjF8ownVBteP1g1qjTGLb3MujOcv2gYwF
	 DtFAXB0mRTuIJkkr2EK4oukZfNYrIRnQsgFmSJprKD6W6nQviVvqLJXhtt7YEKIdWW
	 I4p2d3ATLLN4ylBNT1k9LJnCI5B19LVY9HrKkxj6vvHXT0Lf8VOmyOTOHZJgKeEgLT
	 Q55f+hGMnoGFaIvuDvSr48XcH/3OBCpmizC30lStfXfE1/bEy196ciDtqPUHBiozx5
	 ns95vJkx3GoEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89331410F3;
	Wed,  7 Jan 2026 17:56:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B79C225B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E7F060667
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:56:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YqeS5WrxMDm3 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:55:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 94D5A605CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94D5A605CD
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 94D5A605CD
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BF550B97A704; Wed,  7 Jan 2026 18:55:57 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:55:56 +0100
Message-ID: <20260107175556.230631-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251221223441.185169-7-bernd@kuhls.net>
References: <20251221223441.185169-7-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808557; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=nMBdIALzR5BP4lYhuB+ZVzLmzzyxALM4Mf0MKnOvd6M=;
 b=n2/RL3gT4zoeFZFyDrfJ/5U1Z03mNn6zp9wAjKptkpsL8npntA48J9+kZR/84qxtG/2ath
 f3qAFohHF6P0F/E9oTNbgtiQXN+hTVAyt2nI3woArqyGYSRSub+JFPyvi/uG8KlaDjMcbf
 E2g3z9KG96QwWYjxQ4k+NzT11WY5e7rfmr3Oi5aerL2cIXTIVj8w0Xc3rm+YAbIq3hbakQ
 ORhGtvccK2z/q/t2HBlvUE5gKWzK8TFLJSS6ofOEDR8TmQ3qVq2DZWeV94IJJCPCJVcpWQ
 Sx9ilTQ6syRrOp+itvB4KN4S9e1UcZlykWtEOFT81MbIdrA2XC6/gWe/SAPo7A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=n2/RL3gT
Subject: Re: [Buildroot] [PATCH v2 07/23] package/python-fs: add md5 hash
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
> Updated package as computed by scanpypi.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.11.x. Thanks

> ---
>  package/python-fs/python-fs.hash | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-fs/python-fs.hash b/package/python-fs/python-fs.hash
> index 5ebb49128d..a7c416af0d 100644
> --- a/package/python-fs/python-fs.hash
> +++ b/package/python-fs/python-fs.hash
> @@ -1,5 +1,5 @@
> -# From https://pypi.org/project/fs/#fs-2.4.16.tar.gz
> +# md5, sha256 from https://pypi.org/pypi/fs/json
> +md5  2c9dae3d52950407fe265c3576396c33  fs-2.4.16.tar.gz
>  sha256  ae97c7d51213f4b70b6a958292530289090de3a7e15841e108fbe144f069d313  fs-2.4.16.tar.gz
> -
> -# Locally calculated
> +# Locally computed sha256 checksums
>  sha256  bcc1fbae1da071a15d17fd7609519af1160a3d72c65622047b61e19ba63e780d  LICENSE
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
