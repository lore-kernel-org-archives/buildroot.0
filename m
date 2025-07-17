Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67D8C83F1A
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE6614172F;
	Thu, 17 Jul 2025 20:41:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vfa5x2Tyavcc; Thu, 17 Jul 2025 20:41:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60D434111A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60D434111A;
	Thu, 17 Jul 2025 20:41:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 13A2C226
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0536E81E8C
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:41:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sn6a87oD9gW5 for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:41:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 17DEC80CBF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17DEC80CBF
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 17DEC80CBF
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:41:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 28A9EB977AA4; Thu, 17 Jul 2025 22:41:23 +0200 (CEST)
Message-ID: <ce4f9b66-0c2f-4682-9d15-cce0696d2dee@rnout.be>
Date: Thu, 17 Jul 2025 22:41:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20250715225335.747969-1-james.hilliard1@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250715225335.747969-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752784883; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Oio3nSrjHzTTxmLUhyVxezQl2S3VIrzQUtO99zJXtx8=;
 b=fjnAPoHdm1vOp5tZ2OQ5yegnIuqSXrZUkDfi1qqjIxBDLmSpQ1LYiKEihzOd8MATqEldAg
 JJHlWzV9Xqta7gsT1DMtyYie8spfImSVm2cZqt2Ooq2+9F2rRSDWxCGHqJHywMm9oy3cr6
 xPZCwKs/VtXClHGKsXKGnrpWDwUGBXOAJx4QKRyd9DO+ja/BZLRUdcdhxClDCBochk3u1U
 k+kwKyJe7wLJvBELXNHnubPs71sRrm4UqL0f4+8s6HZD6D6WFdmT6vHAINNO3bAdzYkTo9
 8nfRO5Trdkk6R6Q1RHeGivJ6xEyUS90pZsJj8RjRjToK3xrLTtKuVIeZ8Eouxw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=fjnAPoHd
Subject: Re: [Buildroot] [PATCH 1/1] package/python-setuptools-scm: bump to
 version 8.3.1
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



On 16/07/2025 00:53, James Hilliard wrote:
> Drop no longer required host-python-typing-extensions dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-setuptools-scm/python-setuptools-scm.hash | 4 ++--
>   package/python-setuptools-scm/python-setuptools-scm.mk   | 7 +++----
>   2 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/package/python-setuptools-scm/python-setuptools-scm.hash b/package/python-setuptools-scm/python-setuptools-scm.hash
> index f2bdf8a208..9a1c6f0262 100644
> --- a/package/python-setuptools-scm/python-setuptools-scm.hash
> +++ b/package/python-setuptools-scm/python-setuptools-scm.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/setuptools-scm/json
> -md5  d8046dce093a94dc382b68b45f6a6257  setuptools_scm-8.1.0.tar.gz
> -sha256  42dea1b65771cba93b7a515d65a65d8246e560768a66b9106a592c8e7f26c8a7  setuptools_scm-8.1.0.tar.gz
> +md5  35e09656d091a94b27f9c50b383b32c5  setuptools_scm-8.3.1.tar.gz
> +sha256  3d555e92b75dacd037d32bafdf94f97af51ea29ae8c7b234cf94b7a5bd242a63  setuptools_scm-8.3.1.tar.gz
>   # Locally computed sha256 checksums
>   sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSE
> diff --git a/package/python-setuptools-scm/python-setuptools-scm.mk b/package/python-setuptools-scm/python-setuptools-scm.mk
> index e646147785..8bf879082e 100644
> --- a/package/python-setuptools-scm/python-setuptools-scm.mk
> +++ b/package/python-setuptools-scm/python-setuptools-scm.mk
> @@ -4,16 +4,15 @@
>   #
>   ################################################################################
>   
> -PYTHON_SETUPTOOLS_SCM_VERSION = 8.1.0
> +PYTHON_SETUPTOOLS_SCM_VERSION = 8.3.1
>   PYTHON_SETUPTOOLS_SCM_SOURCE = setuptools_scm-$(PYTHON_SETUPTOOLS_SCM_VERSION).tar.gz
> -PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/4f/a4/00a9ac1b555294710d4a68d2ce8dfdf39d72aa4d769a7395d05218d88a42
> +PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/b9/19/7ae64b70b2429c48c3a7a4ed36f50f94687d3bfcd0ae2f152367b6410dff
>   PYTHON_SETUPTOOLS_SCM_LICENSE = MIT
>   PYTHON_SETUPTOOLS_SCM_LICENSE_FILES = LICENSE
>   PYTHON_SETUPTOOLS_SCM_SETUP_TYPE = pep517
>   
>   HOST_PYTHON_SETUPTOOLS_SCM_DEPENDENCIES = \
>   	host-python-packaging \
> -	host-python-setuptools \
> -	host-python-typing-extensions
> +	host-python-setuptools
>   
>   $(eval $(host-python-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
