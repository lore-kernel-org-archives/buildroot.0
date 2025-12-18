Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FB3D6E2B1
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 16:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CC44410E6;
	Thu, 18 Dec 2025 16:38:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qBH0EDTevcuK; Thu, 18 Dec 2025 16:38:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C45204113A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766075910;
	bh=XOIQY2vfEWxAENPUuLBNPzt7FPb7Ka5J1iZLJtL5RuE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ODpMEynKCUlMKV+r7iuI5DFl0wJ3rgxDBI7Fr0Z6wYOjEwY6YIeEV3z4H4Feu+j16
	 lPZUIGjaPES7UsRfcdSxegYx015mOEtWMpi/OqZWn9j+5LUdBAYi0hEXZssg5mXjoV
	 1JT0Jw+Ae+5CdiJhFO/LXqcZIxbKnUEhpVmD8lkM+znRfeeqmWOEuCSJaxVM3P/hch
	 3+EHkyw9HkzXDGSBMPrmiFzkzud8mzt87643qHGL35rwU56uU4RB8rGZIMv1zbGh5B
	 mrel5wVk9YNVksa+BoefHWyFwhTClTUNBIS/z30q3IDGcL2AxgHfm2gQ4XupVOx6yC
	 PepAYAPSTsxzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C45204113A;
	Thu, 18 Dec 2025 16:38:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BBAC361
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82C9640CAA
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:38:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IIinmZ11k59z for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 16:38:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7977D40CA4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7977D40CA4
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7977D40CA4
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:38:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 83671B97A323; Thu, 18 Dec 2025 17:38:26 +0100 (CET)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 18 Dec 2025 17:38:24 +0100
Message-ID: <20251218163824.380199-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251212203952.327091-1-giulio.benetti@benettiengineering.com>
References: <20251212203952.327091-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1766075906; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=Yj9EFZJcAzjRZzwwEMrdQgxX5xYxcM+Xx3gzR0R5vwM=;
 b=Oxn5Gw3bsQ/XPeVCO8X4Mxu660LrUZ/iM9FFLdWEYAZYkdQm+1LIojWhdzmOluZmixZ+Kh
 9d1xMrlK4cWdiqaJsIOZRhp/JLhWWCMpF67zmkjX6BJz+ZBhfG5mzd6Roc0GyobztTyKxM
 VbFeqmj3RFFLufs+X9Read9rNm4P4p+zItvCoQFnAB0T1ijT6sKpJpEfouCJAID09LNjBs
 hgrhamNVkdCwNXdPDrACIMiaEstkX9hof+32o/wtUdTQpPIDuK7ZevnINAysDUAadiYI3b
 /yTWzrxCytdONGvskp2nWZ1S4D2CLPCaU+jfUK0FH8hOHPNF5pCUB8zmRWrjFg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Oxn5Gw3b
Subject: Re: [Buildroot] [PATCH] package/rtl8192eu: bump to 2025-10-13
 version on branch 5.11.2.1
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
> This version allows to build with Linux 6.18.
> 
> Fixes:
> still not occured.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.11.x. Thanks

> ---
>  package/rtl8192eu/rtl8192eu.hash | 2 +-
>  package/rtl8192eu/rtl8192eu.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rtl8192eu/rtl8192eu.hash b/package/rtl8192eu/rtl8192eu.hash
> index 42055cb194..05e53745c7 100644
> --- a/package/rtl8192eu/rtl8192eu.hash
> +++ b/package/rtl8192eu/rtl8192eu.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256  19e1686d6841f572d3274c96e3e4b66544027d559f5d4da528d8c8510f7d34e6  rtl8192eu-ee928d5dc065f328043711c271eb54f008e6245c.tar.gz
> +sha256  50e289e6a1a4f5cf455e7525b2e2003c0ce58b6b55c1c3ab2e91e3b9fc357730  rtl8192eu-9664b2bfc4bcba55ca5a1284e67bad15ed910081.tar.gz
> diff --git a/package/rtl8192eu/rtl8192eu.mk b/package/rtl8192eu/rtl8192eu.mk
> index d96389edf0..91c250e07d 100644
> --- a/package/rtl8192eu/rtl8192eu.mk
> +++ b/package/rtl8192eu/rtl8192eu.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RTL8192EU_VERSION = ee928d5dc065f328043711c271eb54f008e6245c
> +RTL8192EU_VERSION = 9664b2bfc4bcba55ca5a1284e67bad15ed910081
>  RTL8192EU_SITE = $(call github,clnhub,rtl8192eu-linux,$(RTL8192EU_VERSION))
>  RTL8192EU_LICENSE = GPL-2.0
>  
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
