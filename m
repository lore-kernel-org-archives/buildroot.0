Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CB6D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2D4A40DFC;
	Wed,  7 Jan 2026 17:50:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QItUOBqusFPa; Wed,  7 Jan 2026 17:50:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B86B140DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808233;
	bh=jv2N+XSgby3h1om06CgO6do5OfuEGnu7MGjoEZAoftI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RA/hBAfzwleVOyq/rKXmNQTABcnEotzIeAbeePjWDDFPNR03+bp+ryGogIC4SG0lS
	 VxKoS3Of/uO+2U+zGIwdLLR3xjTVI1nt9yaMIxr7coH1ONk78wJZyemdsFMm37RIbR
	 njRDoZm3kW3FggstK8jhejQV0ZOn1njE4dUS1rWYNFXTI3o+emD0umWDetliMGRDkM
	 kMcSpjnolMpG38xxOjh5Jb3+CiKS8FHKrgTDpStfFA1JX9CpbnN2ONcjrdVdIoKw3x
	 Rg8oANfIJlh4vPhB4+J+kYDV2lG+xg3+a01PTf3/8ZrkUiNJaNNXuEt8GmeWsR/6lz
	 8aYIRN1O4T8Lw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B86B140DEE;
	Wed,  7 Jan 2026 17:50:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DE659ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 608E340DEE
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 93DssU_lD7iN for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:50:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4AF0A40DFC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AF0A40DFC
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4AF0A40DFC
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8C181B97A192; Wed,  7 Jan 2026 18:50:29 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:50:28 +0100
Message-ID: <20260107175028.226459-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251221223441.185169-19-bernd@kuhls.net>
References: <20251221223441.185169-19-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808229; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=9f+5oxGfmdMEo9mE+ltuzh3bSglfO9dwfBJwSlbJ6qs=;
 b=ivnB8vZPD/lNKpad/duhH37bLxcBrgM7qBLe71Yd4muK+O1sc/FegJPnwgPdEM9eE9HfXK
 N6ngUJ8Lo3EUnVIQvi2deIvC7GO3LzYxzkYkj+BtqlhsigdSxQXINTwlFSXn2c36Q1y64H
 Qa7zq7eQ8Hxnaud4Aj3ZueQs2ALgaTA1LbFwksyF1dBTpbCxxnB+XI6X/baUKCYyBp/AZk
 hGPC/SAObAxhqXczmXlOp5q1hV0a3Xak6E9zF0tf2lgGQWoxkiN5+Wn43i134nLp4I3aWm
 HG1nInu3Qh0JNmWRK0Ac56snSxFfwEAbMej9cGdCW42zuJLUySIQqIJsiXU8BQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=ivnB8vZP
Subject: Re: [Buildroot] [PATCH v2 19/23] package/python-pyinotify: update
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
>  package/python-pyinotify/python-pyinotify.hash | 6 ++++--
>  package/python-pyinotify/python-pyinotify.mk   | 3 ++-
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-pyinotify/python-pyinotify.hash b/package/python-pyinotify/python-pyinotify.hash
> index 72095ff6e5..9eecfbf9be 100644
> --- a/package/python-pyinotify/python-pyinotify.hash
> +++ b/package/python-pyinotify/python-pyinotify.hash
> @@ -1,3 +1,5 @@
> -# Locally calculated
> -sha256  7943f198c5cef2bdc121d847937fbe565daaa7d4daaf1b8de8ef5689812f481c  python-pyinotify-0.9.6.tar.gz
> +# md5, sha256 from https://pypi.org/pypi/pyinotify/json
> +md5  8e580fa1ff3971f94a6f81672b76c406  pyinotify-0.9.6.tar.gz
> +sha256  9c998a5d7606ca835065cdabc013ae6c66eb9ea76a00a1e3bc6e0cfe2b4f71f4  pyinotify-0.9.6.tar.gz
> +# Locally computed sha256 checksums
>  sha256  97c96d577f761e23c7778bda2b163dba7b94e4defdd7873b7155bed252820608  COPYING
> diff --git a/package/python-pyinotify/python-pyinotify.mk b/package/python-pyinotify/python-pyinotify.mk
> index b4ea66299d..61666e8b49 100644
> --- a/package/python-pyinotify/python-pyinotify.mk
> +++ b/package/python-pyinotify/python-pyinotify.mk
> @@ -5,7 +5,8 @@
>  ################################################################################
>  
>  PYTHON_PYINOTIFY_VERSION = 0.9.6
> -PYTHON_PYINOTIFY_SITE = $(call github,seb-m,pyinotify,$(PYTHON_PYINOTIFY_VERSION))
> +PYTHON_PYINOTIFY_SOURCE = pyinotify-$(PYTHON_PYINOTIFY_VERSION).tar.gz
> +PYTHON_PYINOTIFY_SITE = https://files.pythonhosted.org/packages/e3/c0/fd5b18dde17c1249658521f69598f3252f11d9d7a980c5be8619970646e1
>  PYTHON_PYINOTIFY_SETUP_TYPE = setuptools
>  PYTHON_PYINOTIFY_LICENSE = MIT
>  PYTHON_PYINOTIFY_LICENSE_FILES = COPYING
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
