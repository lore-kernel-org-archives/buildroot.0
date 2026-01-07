Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138A9D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCB5C40DAC;
	Wed,  7 Jan 2026 17:50:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vnceAJWXRMiY; Wed,  7 Jan 2026 17:50:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEE4A40D95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808207;
	bh=07ZfGk0W9c8A8YeqvoBVNn9MZ7cQs6OKWNThWRc1uLs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Wm9cYDg424jEKmUO7ABn8j+C+Lw+emqSQRMVBn/e26ztFRz1YAn4v6AEcAReNX4hE
	 IcXrWu5KhwDkhUymw/AzIPMHlroEOTdtL9wxbz6RWrInPb2hCjElwRpaYO0Aknm1Ei
	 fuZHsAvfzbH/hhqNScyRaWTQyBr3oZihfGS75mlPcqvhxkqqrKGQ3OvIZk2riiUT4q
	 Clw/rOFVXCoIe1A/Z5FBJmVdQP/XjxDaWb1JFt7qZBvyFJ6Ae4z0JU/Vkp1q3XbiGK
	 NptdAE4LU5BwfBHleDQzGh6QmkEz/4L7C06S/xP3ucEjs0aWG89YLDyZG+zpRIjTr/
	 VZsa4lPC+pMZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEE4A40D95;
	Wed,  7 Jan 2026 17:50:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D0F229ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B724240263
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id coNwigSeB0F7 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:50:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ABB2240128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABB2240128
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ABB2240128
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B4EE9B97A192; Wed,  7 Jan 2026 18:50:02 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:50:00 +0100
Message-ID: <20260107175000.225865-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251221223441.185169-6-bernd@kuhls.net>
References: <20251221223441.185169-6-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808202; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=qC9Un4Q5nzVVELRC/m7oyouyjnrtnrVlE/pCceGkJgc=;
 b=N3M8ThZrqpZvY6nSEYXEaZFdZcZn0CNOPFJ7hVvvCZT80JaYSqGku+NMzD39dHaHZiksde
 zgkmZ6PJum/K7kh16NbYOwd/c+Lstjq8wTydKWngucSDKcLSxGwPGgtna8/QP/LSkwUw/q
 Oaopg3zK0BEgumghgRRKJVpibU3Ui628DoNYV3Hyy4a/+ufuPsHRfWr3Qg0Jg/D3Bm/P2/
 7K9cOllY+OMgr3ZoFKFg3xnItZKhPs8rWIHQpmk/KJGhi7ZyOC4x5XZ13XmEA+yBBUr6AL
 ku5YUYz7dypWgFzBb3U0Yvq4G1zK4cxuGtjB7PsCz9rkdY06BiHP6y4+Olu/Hw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=N3M8ThZr
Subject: Re: [Buildroot] [PATCH v2 06/23] package/python-dockerpty: update
 tarball URL
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

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/python-dockerpty/python-dockerpty.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python-dockerpty/python-dockerpty.mk b/package/python-dockerpty/python-dockerpty.mk
> index e6fe6e3b49..7ad98c6b94 100644
> --- a/package/python-dockerpty/python-dockerpty.mk
> +++ b/package/python-dockerpty/python-dockerpty.mk
> @@ -6,7 +6,7 @@
>  
>  PYTHON_DOCKERPTY_VERSION = 0.4.1
>  PYTHON_DOCKERPTY_SOURCE = dockerpty-$(PYTHON_DOCKERPTY_VERSION).tar.gz
> -PYTHON_DOCKERPTY_SITE = https://pypi.python.org/packages/8d/ee/e9ecce4c32204a6738e0a5d5883d3413794d7498fe8b06f44becc028d3ba
> +PYTHON_DOCKERPTY_SITE = https://files.pythonhosted.org/packages/8d/ee/e9ecce4c32204a6738e0a5d5883d3413794d7498fe8b06f44becc028d3ba
>  PYTHON_DOCKERPTY_SETUP_TYPE = setuptools
>  PYTHON_DOCKERPTY_LICENSE = Apache-2.0
>  PYTHON_DOCKERPTY_LICENSE_FILES = LICENSE.txt
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
