Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B44C3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4055A40694;
	Fri,  2 May 2025 11:02:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q3AkznL6oMyd; Fri,  2 May 2025 11:02:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C2D94088F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C2D94088F;
	Fri,  2 May 2025 11:02:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E8796EE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D98BB606CB
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:01:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x3r3bjqnVclV for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:01:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0280F60721
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0280F60721
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0280F60721
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:01:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F12BD1C00E6; Fri,  2 May 2025 13:01:56 +0200 (CEST)
Message-ID: <5c3f2e78-55a8-4ce0-9644-0f5a839cf248@rnout.be>
Date: Fri, 2 May 2025 13:01:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>
References: <20250421202418.919598-1-giulio.benetti@benettiengineering.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250421202418.919598-1-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746183717; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=DLfkcBa9h1d0oj4u8+XwzWOK9v+YnAFqQNFZ1eonnN8=;
 b=O9O+8bBGcUnhQRMDSNG+oHVmkjo+u7qcLso/EaZoGxVjwzNe5n2crE7XYx6V8gCF6Q958L
 BlcYV2MyzSTi9WrUZHbX5lJFd5fr+B5ZOaMrVW5iS3v6g9qRETwwc6xDdyLbMKHLzbXNJ9
 y+Ix93oJj7niHCQn1zFn052zP9KZRkxY+FVHgt7TOUHwf7fSyKSKJaVbV57uCtZiF65l8y
 PXBB/qF0+00+VSM+2zWYsVAfj0I1y7+4akhnzEqjK0Si+X8koFuXj7jOLtXyWdY3h3kyOA
 GJ77WJA/pRBkNz/cZYVKChyTr5seljSgLpLZtwxmJR9zFc37u4rTFPKivn9Jdw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=O9O+8bBG
Subject: Re: [Buildroot] [PATCH] package/libtracefs: bump to version 1.8.2
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



On 21/04/2025 22:24, Giulio Benetti wrote:
> Release notes:
> https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/tag/?h=libtracefs-1.8.2
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/libtracefs/libtracefs.hash | 2 +-
>   package/libtracefs/libtracefs.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libtracefs/libtracefs.hash b/package/libtracefs/libtracefs.hash
> index e728e6431f..17036c3f00 100644
> --- a/package/libtracefs/libtracefs.hash
> +++ b/package/libtracefs/libtracefs.hash
> @@ -1,4 +1,4 @@
>   # Locally computed
> -sha256  d295aa20d711c313a9e229dbd15ba14026f0c1a50d57ae8b0823cc561b23745f  libtracefs-1.8.1.tar.gz
> +sha256  255980e1da5648fbbc32777ed8457b485b2b96f3449674610b46d9c437271209  libtracefs-1.8.2.tar.gz
>   sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
>   sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSES/LGPL-2.1
> diff --git a/package/libtracefs/libtracefs.mk b/package/libtracefs/libtracefs.mk
> index 86baa5d9cd..d24763fa7d 100644
> --- a/package/libtracefs/libtracefs.mk
> +++ b/package/libtracefs/libtracefs.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBTRACEFS_VERSION = 1.8.1
> +LIBTRACEFS_VERSION = 1.8.2
>   LIBTRACEFS_SITE = https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/snapshot
>   LIBTRACEFS_INSTALL_STAGING = YES
>   LIBTRACEFS_LICENSE = GPL-2.0, LGPL-2.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
