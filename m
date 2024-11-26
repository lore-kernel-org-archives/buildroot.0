Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8E0D65552
	for <buildroot@archiver.kernel.org>; Tue, 26 Nov 2024 19:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 723818533E;
	Tue, 26 Nov 2024 19:53:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fr6XWtnY-0NP; Tue, 26 Nov 2024 19:53:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90BF685342
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90BF685342;
	Tue, 26 Nov 2024 19:53:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 92A15DB3
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 19:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 725C74ECBD
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 19:53:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ryp7lm1QEDGU for <buildroot@buildroot.org>;
 Tue, 26 Nov 2024 19:53:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3B1414ECAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B1414ECAB
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B1414ECAB
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 19:53:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 7C44D13F8C8;
 Tue, 26 Nov 2024 20:53:09 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:50442])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 26 Nov 2024 20:53:09 +0100
MIME-Version: 1.0
Date: Tue, 26 Nov 2024 20:53:09 +0100
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>
In-Reply-To: <20241124222844.162887-2-giulio.benetti@benettiengineering.com>
References: <20241124222844.162887-1-giulio.benetti@benettiengineering.com>
 <20241124222844.162887-2-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <c7f5e2973af8a0b9be3c31f8c5fb9ded@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732650791;
 bh=h8YlfdxmruLQMA26IMWLUSufGrNx9zPXNPENUCd9ryU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Rf80N2We4X+sHb/9/VtYHT58A19FoeWvNsRSIxZhYQFLdYh0vMHIPYIiIEP+IJ+yi
 AYKbLXcoZlkthjtaUdXV8hPx5LKNORxXdRNSBZXhgeh5zJXTpPhQrnFoSeFkUcFFy0
 Kgw/oc9Njnq/1JNuVNK+kJRuhylIn89VyhL8b2ib68Vz8Ui/0A9P9Jp1w2KeK99lTG
 4QeJxOj9Wjtbic2YGyTqy1OXwrZbANrm2xyRkEkP/LFGbdeWbNVdnvNwJWkY53yw3X
 f+vlLJujAyNpCIq4WLL5UxO6vJfFo8FWa8M5mI1TWBdy9VKiHQsqVMECKMKSh6Zv0M
 1RoTsDXZrnKSw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Rf80N2We
Subject: Re: [Buildroot] [PATCH] package/mongoose: bump to version 7.16
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 24/11/2024 23:28, Giulio Benetti wrote:
> https://github.com/cesanta/mongoose/releases/tag/7.16
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to next, thanks.

> ---
>  package/mongoose/mongoose.hash | 2 +-
>  package/mongoose/mongoose.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mongoose/mongoose.hash 
> b/package/mongoose/mongoose.hash
> index 6e8d1e3804..15aa2b35ba 100644
> --- a/package/mongoose/mongoose.hash
> +++ b/package/mongoose/mongoose.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  
> efcb5aa89b85d40373dcff3241316ddc0f2f130ad7f05c9c964f8cc1e2078a0b  
> mongoose-7.15.tar.gz
> +sha256  
> f2c42135f7bc34b3d10b6401e9326a20ba5dd42d4721b6a526826ba31c1679fd  
> mongoose-7.16.tar.gz
>  sha256  
> 7e2bc5dabbc27b431a530540161ba860906f12109d4b84b1e4bc8879f1afc3bc  
> LICENSE
> diff --git a/package/mongoose/mongoose.mk 
> b/package/mongoose/mongoose.mk
> index e3c57c8e8a..9ec6423e93 100644
> --- a/package/mongoose/mongoose.mk
> +++ b/package/mongoose/mongoose.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -MONGOOSE_VERSION = 7.15
> +MONGOOSE_VERSION = 7.16
>  MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
>  MONGOOSE_LICENSE = GPL-2.0
>  MONGOOSE_LICENSE_FILES = LICENSE
> --
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
