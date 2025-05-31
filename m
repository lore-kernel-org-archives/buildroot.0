Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193CFC5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9347607CC;
	Sat, 31 May 2025 16:41:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NawA1AuxCy6j; Sat, 31 May 2025 16:41:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02976607C0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02976607C0;
	Sat, 31 May 2025 16:41:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FB44235
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 914B940AE3
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:41:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id goagY-s-Jcqn for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:41:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9953440A54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9953440A54
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9953440A54
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:41:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 933101C0D7C; Sat, 31 May 2025 18:41:51 +0200 (CEST)
Message-ID: <f4f5f601-bdc0-45e1-9766-4a807187a4dd@rnout.be>
Date: Sat, 31 May 2025 18:41:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
References: <20250512125000.1099442-1-buildroot@bubu1.eu>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250512125000.1099442-1-buildroot@bubu1.eu>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748709711; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=r9WvUc/rmNeArjpvCRnZ/ImUpSyLInAtdFHUabJqZX0=;
 b=WXZG6dHOkRfja9CyKir5/EbaKCg8cYSnZYw2/QIWCx2SHdQ+rj+uBGxcVpvtnEK40SHmAZ
 OjlqSzsR+0NcPldMKsmhFotcNoqTz1KUHKZWLLDIVc5J1DvpbxcaI9qAIMeTPpXmhjo6/K
 W2ruUTv9gMPqyNcqgaIAcyVQ/BPhwLRKNDJ1OqWkpmC0CWyoUcqptj2VEk3puTKMNkyVua
 fa1i2a+JREZYpGKZT6HfWH2mLcxwOeOeMIN3rrNITrELA36a0aXHxpezDD+kTJgo9Ml47f
 lyk7B1nEnmlMEMPzSS9vTtIUAV1EbDSRWxh/bN+rx2mT9PbZho5p6ZAVVkrKqQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=WXZG6dHO
Subject: Re: [Buildroot] [PATCH] package/python-jc: bump to 1.25.5
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



On 12/05/2025 14:49, Marcus Hoffmann via buildroot wrote:
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

>   package/python-jc/python-jc.hash | 4 ++--
>   package/python-jc/python-jc.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-jc/python-jc.hash b/package/python-jc/python-jc.hash
> index d8ee918ac7..6e80024639 100644
> --- a/package/python-jc/python-jc.hash
> +++ b/package/python-jc/python-jc.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/jc/json
> -md5  77e798f2c3fbe89c0dbf7b31dc35fc69  jc-1.25.4.tar.gz
> -sha256  a32eaf029c56b582dadae48895f20784d0f84f2fa28a8e2b32f377a8bffa8b39  jc-1.25.4.tar.gz
> +md5  40bc4d9fa71e3809c236954a1bd2354f  jc-1.25.5.tar.gz
> +sha256  f8ac0e4bc427b0ee8a3bdb07a254cc9df6b6036cd440f6c425e2e519cdbda78a  jc-1.25.5.tar.gz
>   # Locally computed sha256 checksums
>   sha256  6493f2db400f4166ca0956cf192a41aa092bd1396ff463e7fdaf51f257c10497  LICENSE.md
> diff --git a/package/python-jc/python-jc.mk b/package/python-jc/python-jc.mk
> index 9a3754a0fa..16bdc05895 100644
> --- a/package/python-jc/python-jc.mk
> +++ b/package/python-jc/python-jc.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_JC_VERSION = 1.25.4
> +PYTHON_JC_VERSION = 1.25.5
>   PYTHON_JC_SOURCE = jc-$(PYTHON_JC_VERSION).tar.gz
> -PYTHON_JC_SITE = https://files.pythonhosted.org/packages/5b/82/146ef4c94297ef87c6a732c92dd57761bea2c2179e1b8ca8a6b9b8dd6ff7
> +PYTHON_JC_SITE = https://files.pythonhosted.org/packages/1b/da/f6ec6a79f8dea70671f41d7162cfefdfe97e9c5b6c2227c1737183c05cd6
>   PYTHON_JC_SETUP_TYPE = setuptools
>   PYTHON_JC_LICENSE = MIT, BSD-3-Clause (bundled pbPlist)
>   PYTHON_JC_LICENSE_FILES = LICENSE.md

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
