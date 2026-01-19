Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486E8D29C33
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 15:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E94436126D;
	Mon, 19 Jan 2026 15:47:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QQe8ktVETWs8; Mon, 19 Jan 2026 15:47:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D56626126F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768837646;
	bh=024OUZnffJqqa+wVHGju9QGKIakkyLGatEwMcN9favw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=C2DEw6XywMCudjJXaIn1EacaIkvMKV+tj7Omjb6dsBwTD5fqt9/i86jvlpmYVDs+t
	 SzrR2sAUzjkkYXI09PaNAF1zjm4lG2EK01nz55pg++LPELvFJjk43zWe3fBkfdNiCa
	 JpZsGeF0FLuyuhiPRvXcfkCTEy7TsnDnJOE/ryohBIlIqaans4cMvoB3N2aW7WwWNM
	 zo+SjUehOOps/3iruTSQQ1Nj3BzUSTz97S0vYy2IbPPCJRRL0/CLjYqrtNO5uaBJR9
	 9yRYl1iSd0SIitbTqI3gtN6RKya0kGlTgZ5lPsETD9996jqADhLJYgN8iWaqe/h6FQ
	 OlRDXjKv9ujnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D56626126F;
	Mon, 19 Jan 2026 15:47:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BA762CE
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 15:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49AF56126F
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 15:47:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DjR-bVkBcsWB for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 15:47:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5C2B86126D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C2B86126D
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C2B86126D
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 15:47:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E23A8B97A1FF; Mon, 19 Jan 2026 16:47:21 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Mon, 19 Jan 2026 16:47:19 +0100
Message-ID: <20260119154719.73966-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251012182016.2711834-13-bernd@kuhls.net>
References: <20251012182016.2711834-13-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768837643; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=eZYOKF6yqPvK+/NKJwjFzKVxFnyag/MnAPyFljc3CUM=;
 b=W7kgISf+C8Cjmlnm1zICdga9OtvDqaEQHtxJZSpGLQbjIH2/tbU+0u444bRl+5DX+Brx0J
 8vq5BL0kK4558Ex32ZSjhPnM0V4BUyRalec23H9J9bNfyfhItsE1YXHyT8fkE63vSunVGi
 KdcSE0ONF3aH6wpDMk5rCwbmkYMlooHRsf1AVVel+JnjF7ZjEHLddb0YqZ9qhXT5mu2Kth
 lt0T++ljOYV47OuxL+C1pJLaBfXUQ+OOs6ZEdnYUrHJnNpMCG8R6wMp4y9d/6NHqQSLvCk
 I7L90pr4nMqFd3hvU5p6J3f7fYwq3ZEcxTLFAgpty8r/iQRp44gbsFWbW0UWew==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=W7kgISf+
Subject: Re: [Buildroot] [PATCH 13/21] package/python-certifi: bump version
 to 2025.10.5
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
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>  package/python-certifi/python-certifi.hash | 4 ++--
>  package/python-certifi/python-certifi.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
> index 723e2eccfb..ef0e0d4ca5 100644
> --- a/package/python-certifi/python-certifi.hash
> +++ b/package/python-certifi/python-certifi.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/certifi/json
> -md5  bb7ee7c24518dc4314ce7a83ca24263f  certifi-2025.8.3.tar.gz
> -sha256  e564105f78ded564e3ae7c923924435e1daa7463faeab5bb932bc53ffae63407  certifi-2025.8.3.tar.gz
> +md5  7fe97b2e79933430062935f3759a09b0  certifi-2025.10.5.tar.gz
> +sha256  47c09d31ccf2acf0be3f701ea53595ee7e0b8fa08801c6624be771df09ae7b43  certifi-2025.10.5.tar.gz
>  # Locally computed sha256 checksums
>  sha256  e93716da6b9c0d5a4a1df60fe695b370f0695603d21f6f83f053e42cfc10caf7  LICENSE
> diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
> index 996e451d33..ad85d44bbc 100644
> --- a/package/python-certifi/python-certifi.mk
> +++ b/package/python-certifi/python-certifi.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_CERTIFI_VERSION = 2025.8.3
> +PYTHON_CERTIFI_VERSION = 2025.10.5
>  PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
> -PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/dc/67/960ebe6bf230a96cda2e0abcf73af550ec4f090005363542f0765df162e0
> +PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/4c/5b/b6ce21586237c77ce67d01dc5507039d444b630dd76611bbca2d8e5dcd91
>  PYTHON_CERTIFI_SETUP_TYPE = setuptools
>  PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
>  PYTHON_CERTIFI_LICENSE_FILES = LICENSE
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
