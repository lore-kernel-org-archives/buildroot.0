Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 196DBC5B549
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9B5160762;
	Sat, 31 May 2025 16:46:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2SNcI0lqpeb4; Sat, 31 May 2025 16:46:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E22B6072E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E22B6072E;
	Sat, 31 May 2025 16:46:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7720A127
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DDFE6072E
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:46:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y0NQRliIE3RH for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:46:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6D1C96069D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D1C96069D
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6D1C96069D
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:46:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2E8BD1C00B7; Sat, 31 May 2025 18:46:02 +0200 (CEST)
Message-ID: <b3bd90dd-54f5-4c03-a38f-96881b469f9b@rnout.be>
Date: Sat, 31 May 2025 18:46:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
References: <20250512192240.235850-1-buildroot@bubu1.eu>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250512192240.235850-1-buildroot@bubu1.eu>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748709962; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=3lb8B/kNm/rIr0cbhdIxvDFpqmiSkqHCpDU1+Jdwdrw=;
 b=jcNQDa4Km/UX8S44+e5lfBI7rggeRQflZhwR2Dv34BynHJQP10UaC2pJZ2JUoZjEkUaVTL
 iD2TeO2G2tRxTH68PxFL9f9EH1XxElfb2IbSxMSmikkkrXskZtY6FnVb6Z+w4eub9ta3c3
 EcGEzLGATfSEFoGS9w4hDtF9Qmh3U7BDdJIiA6n2ClR7h+VfvUFUKmtZKWT6nhND2gOIrT
 SiPlEV806nxcQ0FIAkSTq+jllCXwxeNZXan6NzOO4LG97xoXYeam2ON3TcBaAfDpEmG7vE
 4lCfD0D9EMiexHQoYQ/EDsC0zecmmH/naGO8vNQyeXA9gy2Wbmzj4zF7qA/98g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=jcNQDa4K
Subject: Re: [Buildroot] [PATCH] package/python-uvicorn: bump to version
 0.34.2
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



On 12/05/2025 21:22, Marcus Hoffmann via buildroot wrote:
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/python-uvicorn/python-uvicorn.hash | 4 ++--
>   package/python-uvicorn/python-uvicorn.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-uvicorn/python-uvicorn.hash b/package/python-uvicorn/python-uvicorn.hash
> index bbaf98dfff..7040ffa37c 100644
> --- a/package/python-uvicorn/python-uvicorn.hash
> +++ b/package/python-uvicorn/python-uvicorn.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/uvicorn/json
> -md5  9944ee2becd37cb1c1e804a96c34a9e0  uvicorn-0.34.0.tar.gz
> -sha256  404051050cd7e905de2c9a7e61790943440b3416f49cb409f965d9dcd0fa73e9  uvicorn-0.34.0.tar.gz
> +md5  4a741214532ec25c04dbb1e926e085f9  uvicorn-0.34.2.tar.gz
> +sha256  0e929828f6186353a80b58ea719861d2629d766293b6d19baf086ba31d4f3328  uvicorn-0.34.2.tar.gz
>   # Locally computed sha256 checksums
>   sha256  efe1acf3e62fb99c288b0ec73e5a773b7268ef4320fe757ea994214e4b63c371  LICENSE.md
> diff --git a/package/python-uvicorn/python-uvicorn.mk b/package/python-uvicorn/python-uvicorn.mk
> index fbb3937af1..944f683bab 100644
> --- a/package/python-uvicorn/python-uvicorn.mk
> +++ b/package/python-uvicorn/python-uvicorn.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_UVICORN_VERSION = 0.34.0
> +PYTHON_UVICORN_VERSION = 0.34.2
>   PYTHON_UVICORN_SOURCE = uvicorn-$(PYTHON_UVICORN_VERSION).tar.gz
> -PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/4b/4d/938bd85e5bf2edeec766267a5015ad969730bb91e31b44021dfe8b22df6c
> +PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/a6/ae/9bbb19b9e1c450cf9ecaef06463e40234d98d95bf572fab11b4f19ae5ded
>   PYTHON_UVICORN_SETUP_TYPE = hatch
>   PYTHON_UVICORN_LICENSE = BSD-3-Clause
>   PYTHON_UVICORN_LICENSE_FILES = LICENSE.md

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
