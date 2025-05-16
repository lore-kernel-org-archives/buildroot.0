Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E716C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F5DA40773;
	Fri, 16 May 2025 10:42:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PxCAcAbSphaz; Fri, 16 May 2025 10:42:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 472E741867
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 472E741867;
	Fri, 16 May 2025 10:42:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id ACB2D1AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 927A3811AF
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:42:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t5agulI7tLEG for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:42:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A1C6C811A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1C6C811A4
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A1C6C811A4
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:42:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3F6161C10F8; Fri, 16 May 2025 12:42:29 +0200 (CEST)
Message-ID: <7fd0d8bc-22cd-48cd-9eef-2215c0111b40@rnout.be>
Date: Fri, 16 May 2025 12:42:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vincent Fazio <vfazio@xes-inc.com>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
References: <20250424181706.3990060-1-vfazio@xes-inc.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250424181706.3990060-1-vfazio@xes-inc.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747392149; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=AlYnfnYV7LBjzT58AUn7CfS6psPotX+YWuOvfdShd7U=;
 b=aynLRtKM3FABlU/7scDgndV2KBlHuvxz+5fQgKxyxEuT6nA5hZFcydTcXG4CE52+waCdRJ
 1/jPMGRH7xHppixunRt8nJlAJs3PsQBjLSPEYu17OtbNE81lf4S9KmjLI604wCVWBTBTWT
 PTcErYN+8ne6psP/LPfvmoh9oyuO19IuWa6sPfO4YGbtzT+Qjp6v/Uz6k5SG7Jb9lh6b52
 6i/zOKBN2IxSaLNYvMrANoSg0+4YScwgdK8uT2D9vgxKVqYeAzgDiuEGQNpxPrw7omtM77
 aFa5lasZkJNagckS5JQAgu0Y9VpXiT9GtOTIN7cWYRbBoNmBE57Jn76GBEMbGA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=aynLRtKM
Subject: Re: [Buildroot] [PATCH] package/python-setuptools: bump to 79.0.1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/04/2025 20:17, Vincent Fazio wrote:
> This version of setuptools includes an update to distutils [0] which
> fixes an issue with determining the linker command for C++ targets when
> a wrapper, such as ccache, is in the command.
> 
> Fixes: https://autobuild.buildroot.org/results/5f017fca3d708388c9f66afea39b090f0976d496/
> 
> [0]: https://github.com/pypa/distutils/commit/b8c06fffe4b118f3c549fc23d196c2f3d41aa17c
> 
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/python-setuptools/python-setuptools.hash | 4 ++--
>   package/python-setuptools/python-setuptools.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
> index d2aa961b04..b5bac10fe2 100644
> --- a/package/python-setuptools/python-setuptools.hash
> +++ b/package/python-setuptools/python-setuptools.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/setuptools/json
> -md5  a15701d19326a1d4132fce56f2861a60  setuptools-76.0.0.tar.gz
> -sha256  43b4ee60e10b0d0ee98ad11918e114c70701bc6051662a9a675a0496c1a158f4  setuptools-76.0.0.tar.gz
> +md5  652d999eca1412525c01e4c5b6e2275b  setuptools-79.0.1.tar.gz
> +sha256  128ce7b8f33c3079fd1b067ecbb4051a66e8526e7b65f6cec075dfc650ddfa88  setuptools-79.0.1.tar.gz
>   # Locally computed sha256 checksums
>   sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
> diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
> index 7157b1c771..1ee5448100 100644
> --- a/package/python-setuptools/python-setuptools.mk
> +++ b/package/python-setuptools/python-setuptools.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_SETUPTOOLS_VERSION = 76.0.0
> +PYTHON_SETUPTOOLS_VERSION = 79.0.1
>   PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
> -PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/32/d2/7b171caf085ba0d40d8391f54e1c75a1cda9255f542becf84575cfd8a732
> +PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/bb/71/b6365e6325b3290e14957b2c3a804a529968c77a049b2ed40c095f749707
>   PYTHON_SETUPTOOLS_LICENSE = MIT
>   PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
>   PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
