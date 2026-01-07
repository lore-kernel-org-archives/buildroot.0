Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B71D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EACAB40E37;
	Wed,  7 Jan 2026 17:50:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wVMk8Su1Czz7; Wed,  7 Jan 2026 17:50:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F46940E1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808240;
	bh=3RVCcMkEmsGvClhNuryNEiqwZpeDvNznYBjZy5mcsKM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=e4nfzxCuYRgWbz9MatZKatHxjv1phbCeItrsUuPjRI/Cyp0mNaUqrHDh372a+nI/E
	 vbMT4B/xoh+6uQ+3Jx+HENtoEposLOfaAugR3DzeGCFUrtqyVzy1rtd9g7vUG11LUA
	 CsN1RT49v8Wch4mC9zrcqy0hDxKIn5Wb+CNUtLHHABf6wqA4u8kcTyS52CsyaNvwd6
	 yOSXnJqLKCJ0BxDdjhFLRlSWyT7UaP1HgfRgZX7HMBL21HEBpaN7bHdGFsiGogah39
	 ziHHYv9Jwx1EYFVo+Hcw8pPibnW2dnOLhh868h66+THcWSlgZb52Zh6dzhGjnjJaPz
	 beI7I6Gac5DWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F46940E1C;
	Wed,  7 Jan 2026 17:50:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C2E7A25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9D6E82387
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WUjvik_V-4ER for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:50:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A1119822A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1119822A9
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A1119822A9
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C3694B97A596; Wed,  7 Jan 2026 18:50:35 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:50:34 +0100
Message-ID: <20260107175034.226663-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251221223441.185169-22-bernd@kuhls.net>
References: <20251221223441.185169-22-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808235; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=yScVpLtlVpjIhjgnEVsv3VxHwaj+krygz2xJdpGhtGA=;
 b=fSA+/mH/cy0NkS7z/4IgrfK0WQltHXjLNjNiLiVhXlq1CFC/G1MvbZYTqTjac/mVK++rn/
 fKHQaI3QdCzT6v0NXbkPnEwsxEiVqosi5micPp0gKY8MOHb4f+92PAWSl4eKfQtKHhdjFJ
 pELJ8cTUAyfaGKkziMz+B4rxMxzydN/9v8OljmOBzYO0zzHryWBqtFvPt94J3vANWMsyra
 nlglOjhjUSGFfKkjw7osQekiFt5C3iYGeZpPr6XTax/yJ2vnOpds7eCZtaynCLfWjDI+PM
 Ys2TAXPbtfhPGMHWwN3Yxa7Rn3/410TR+mjSOYDsIj5uT5A5KrPd4Q4weFW/mQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=fSA+/mH/
Subject: Re: [Buildroot] [PATCH v2 22/23] package/python-pysendfile: update
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
>  package/python-pysendfile/python-pysendfile.hash | 6 ++++--
>  package/python-pysendfile/python-pysendfile.mk   | 3 ++-
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-pysendfile/python-pysendfile.hash b/package/python-pysendfile/python-pysendfile.hash
> index d1aff6aed2..2b5b8a9714 100644
> --- a/package/python-pysendfile/python-pysendfile.hash
> +++ b/package/python-pysendfile/python-pysendfile.hash
> @@ -1,3 +1,5 @@
> -# Locally computed:
> -sha256  f4ca8a7f0be67e3d710c0633dd9aadab6881203c31cb9eb9be4f10361ad3f937  python-pysendfile-2.0.1.tar.gz
> +# md5, sha256 from https://pypi.org/pypi/pysendfile/json
> +md5  e7b301eddd703ab74a48c59a8fda1f97  pysendfile-2.0.1.tar.gz
> +sha256  510a414b270986fba3c79cb76d90a4c910c701bfb43ff983a5d4e92846050e17  pysendfile-2.0.1.tar.gz
> +# Locally computed sha256 checksums
>  sha256  259f433563cfe0296c84c00381c600e82e0ab1b617ce20fe6e7f555a2b95af26  LICENSE
> diff --git a/package/python-pysendfile/python-pysendfile.mk b/package/python-pysendfile/python-pysendfile.mk
> index bb8f057d3d..6c2d06e367 100644
> --- a/package/python-pysendfile/python-pysendfile.mk
> +++ b/package/python-pysendfile/python-pysendfile.mk
> @@ -5,7 +5,8 @@
>  ################################################################################
>  
>  PYTHON_PYSENDFILE_VERSION = 2.0.1
> -PYTHON_PYSENDFILE_SITE = $(call github,giampaolo,pysendfile,release-$(PYTHON_PYSENDFILE_VERSION))
> +PYTHON_PYSENDFILE_SOURCE = pysendfile-$(PYTHON_PYSENDFILE_VERSION).tar.gz
> +PYTHON_PYSENDFILE_SITE = https://files.pythonhosted.org/packages/cd/3f/4aa268afd0252f06b3b487c296a066a01ddd4222a46b7a3748599c8fc8c3
>  PYTHON_PYSENDFILE_SETUP_TYPE = setuptools
>  PYTHON_PYSENDFILE_LICENSE = MIT
>  PYTHON_PYSENDFILE_LICENSE_FILES = LICENSE
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
