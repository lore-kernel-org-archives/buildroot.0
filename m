Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611C1C83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B22040553;
	Thu, 17 Jul 2025 20:41:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J5MZnixo6pAN; Thu, 17 Jul 2025 20:41:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AD09417A6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AD09417A6;
	Thu, 17 Jul 2025 20:41:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CDE4226
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23FB060762
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:41:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cqctMu2jzMJR for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:41:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 35B1B60781
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35B1B60781
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 35B1B60781
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:41:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3B866B977AA4; Thu, 17 Jul 2025 22:41:43 +0200 (CEST)
Message-ID: <48083148-df6d-44be-874b-6a806879cc79@rnout.be>
Date: Thu, 17 Jul 2025 22:41:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>
References: <20250715231957.833460-1-james.hilliard1@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250715231957.833460-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752784903; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=8HtviF/6Hi7lGU1w2hS8gu0iCAbmwVQFyse4rJ8H+Xs=;
 b=cFeDTFvWOpIkGXe7QtgSfoO+X9lRqkwhtPCiBeyfVrkGoqEdAfxq4Wb0qfU+6sYenQYFFJ
 QwxQIncpQPZ4QdWeG6MXNz+Rm1dvwxpqvEnXYcLMA0dDpFVzCg6S/akcPbTRyDTMH15j0a
 +F0BBFEBLNDBmv7wdhcrRwroZGF+OnFYI7o7Ec3mMk+h3gxn/nsCrkLDn0l+6iu/XS7CUR
 QdOXJWxGfysS9dbFxQvUK3y8OD9X4nsmzp6P4bG/QEIjxxFnA229TZFecvL6Jy2PFRFEHT
 f74eIuZAjIwk24i6a4ueVh01Y+2s1mPKPx/dmMTwoX3rjAy9gLHhCZ1uEg1uUw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=cFeDTFvW
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cython: bump to version
 3.1.2
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



On 16/07/2025 01:19, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-cython/python-cython.hash | 4 ++--
>   package/python-cython/python-cython.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
> index cd320eaa2a..25fa1d93ba 100644
> --- a/package/python-cython/python-cython.hash
> +++ b/package/python-cython/python-cython.hash
> @@ -1,6 +1,6 @@
>   # md5, sha256 from https://pypi.org/pypi/cython/json
> -md5  388b85b7c23f501320d19d991b169f5d  cython-3.0.11.tar.gz
> -sha256  7146dd2af8682b4ca61331851e6aebce9fe5158e75300343f80c07ca80b1faff  cython-3.0.11.tar.gz
> +md5  6fb2dc869f4d00b4a13e130ec1197bfd  cython-3.1.2.tar.gz
> +sha256  6bbf7a953fa6762dfecdec015e3b054ba51c0121a45ad851fa130f63f5331381  cython-3.1.2.tar.gz
>   # Locally computed sha256 checksums
>   sha256  9568a2b155e66ac3e0ba1fd80b52b827b9460e6cf6f233125e7cbca8e206ddc3  LICENSE.txt
>   sha256  e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
> diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
> index 51086bedab..cffd613787 100644
> --- a/package/python-cython/python-cython.mk
> +++ b/package/python-cython/python-cython.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_CYTHON_VERSION = 3.0.11
> +PYTHON_CYTHON_VERSION = 3.1.2
>   PYTHON_CYTHON_SOURCE = cython-$(PYTHON_CYTHON_VERSION).tar.gz
> -PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/84/4d/b720d6000f4ca77f030bd70f12550820f0766b568e43f11af7f7ad9061aa
> +PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/18/40/7b17cd866158238db704965da1b5849af261dbad393ea3ac966f934b2d39
>   PYTHON_CYTHON_SETUP_TYPE = setuptools
>   PYTHON_CYTHON_LICENSE = Apache-2.0
>   PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
