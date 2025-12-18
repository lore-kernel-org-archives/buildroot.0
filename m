Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9BED6E2B1
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 16:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CE7F4114E;
	Thu, 18 Dec 2025 16:38:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ScYpGy91a3hP; Thu, 18 Dec 2025 16:38:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A228A41147
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766075912;
	bh=Vx/l5oywD0EkPj5Kr3gvyzkQdj2Id9pKpmyOcQZ941g=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iQkmi6lNUyIa/AC8c3oXhXd4DyuWeVLkTsH/n8opimyguZj5gqHeUJxn33G4b1+a9
	 LxwavT2jcoa+2bBSMmkMDKKKIgCYfYK9i9t/7k5kx9dfzBihdx+NNekiPtHkA2Roel
	 hiDwOLoBUfOWA6wpFnf0/TAOYoiWfqSlwIVwsdTkKcRCsER9iGNMitIhqKzDGkqxVn
	 PK75pRjm4OMIg368Xk4bF0PimntkQLmNBsI/J8u2U1QkC8uXb3mh2tDxbgkZqAP8G9
	 5uX0H2JhFW7L3vj7cwOEUzYWPuORFCJ5Nte1BRR3uuczLBkSY/Ud92/y4uTvF8wZow
	 9kZeS35Z+ThvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A228A41147;
	Thu, 18 Dec 2025 16:38:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C93B361
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83F2041141
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:38:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4H38TMWzKjro for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 16:38:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 76C16410E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76C16410E6
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 76C16410E6
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:38:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CDD18B97A323; Thu, 18 Dec 2025 17:38:28 +0100 (CET)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 18 Dec 2025 17:38:27 +0100
Message-ID: <20251218163827.380253-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251213204021.1811227-1-giulio.benetti@benettiengineering.com>
References: <20251213204021.1811227-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1766075908; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=icFoSgPwqJpgIYbyRCu3OEI4h803DzXBRK1WVoQd6us=;
 b=R3m0jZU2BCguKkVCCBHcV2mS52RkpzbrYVqRAUVvMf+SPZMAQBBydswmiU8shtAytV9Dym
 wInvRY+gdD7YJXKU//2ygpS6LZNYKauNvlgaBDkIzygFti43q77KiMgvTuSChPhznkBOG0
 9rCVy1jtFqMMjj8nERkTPU+ojtjNseoOBkvQhb9wxvTk6rBTRj4MXSlhDnQSFfqIOlVBaL
 mJboeitjb7LsIUKqE+4joARao4b8ylpMl7DB9vSDFJ3rwo4UVNmvtajOiyYpMSPfLpCcSd
 jPzHF46lJNW5TOutNTkTGIHiET6YtjrCaX4rBhSNUHU3QL9/facgwfId1M/keQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=R3m0jZU2
Subject: Re: [Buildroot] [PATCH] package/rtl8821au: bump to version
 2025-12-13
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
> This allows to build with Linux 6.18
> 
> Fixes:
> https://autobuild.buildroot.org/results/bc0ec5fe3acb37740b54eb1af1fe5d9284c87cf2/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.11.x. Thanks

> ---
>  package/rtl8821au/rtl8821au.hash | 2 +-
>  package/rtl8821au/rtl8821au.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rtl8821au/rtl8821au.hash b/package/rtl8821au/rtl8821au.hash
> index 29b4d46f8e..ca5f9f15df 100644
> --- a/package/rtl8821au/rtl8821au.hash
> +++ b/package/rtl8821au/rtl8821au.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  fe9840003e9481cf9fce3a5ed3f5b985615f862abc1b8d51fe6de7da9e4943c9  rtl8821au-dfe6801adb9b3a5572260ab308d3b69522992814.tar.gz
> +sha256  1d9f87c7a30d54f67cb09e98a436565ba9c64a28feca95205f66212d8833836c  rtl8821au-bb26b6b06c47b79c17426ef186f44a608dbed7a0.tar.gz
>  sha256  640d90f6ee401241ff62834d0d1b33f83049e99b8bfdfa04ed1b0a1635dde3e7  LICENSE
> diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
> index 734b427019..4e7aee4204 100644
> --- a/package/rtl8821au/rtl8821au.mk
> +++ b/package/rtl8821au/rtl8821au.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RTL8821AU_VERSION = dfe6801adb9b3a5572260ab308d3b69522992814
> +RTL8821AU_VERSION = bb26b6b06c47b79c17426ef186f44a608dbed7a0
>  RTL8821AU_SITE = $(call github,benetti-engineering,rtl8821au,$(RTL8821AU_VERSION))
>  RTL8821AU_LICENSE = GPL-2.0
>  RTL8821AU_LICENSE_FILES = LICENSE
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
