Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961F6C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A4DC40CF2;
	Fri, 16 May 2025 10:50:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ly_ZB44-ewyi; Fri, 16 May 2025 10:50:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADF454183C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADF454183C;
	Fri, 16 May 2025 10:50:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 80C9F13D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D84960AF3
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:50:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZbIFtarU7F0q for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:50:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CBF7060B6D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBF7060B6D
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CBF7060B6D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:50:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B7EE81C0FF6; Fri, 16 May 2025 12:50:36 +0200 (CEST)
Message-ID: <15296ebd-537f-4969-8e5f-6f21d1752980@rnout.be>
Date: Fri, 16 May 2025 12:50:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20250502220326.3200749-1-giulio.benetti@benettiengineering.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250502220326.3200749-1-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747392636; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=KbLzE0/y5qnAksb/+RXcb+5t7tK+diB6m/5ydf02mNs=;
 b=S6He22QnLPcNHGw1NM1Uq7r/hU1GIDm2RNDgqPEn0Wa9/9BMboGUOEoex0HsztFfLxtDd5
 MuOod4ex2bqj0UWD4v1DvKs49qqmr25FFLiaOPGRXYZJC35An3GGwU9OeGKO55k8APzJ6X
 qtb6VPfOnyKPR1HH8nXWQFJGt4rJp2UJ9hgDeGmpbhODKXe0vmNNALQIjPcLqDrecElteD
 B2Gth9l1xnPdXujp6Bxv4RYMSYC1yjICsLVpF49oIJ2IMuoKQ2XzOK7zKurbRu5IhwMWzU
 rJPyF6TxBcWySGGt+LCA3j4k3em1hKJm6BXv/p1bzAm38tkUgC9qgtw70aBlXg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=S6He22Qn
Subject: Re: [Buildroot] [PATCH] package/sunxi-mali-utgard-driver: bump to
 version 2025-05-02
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



On 03/05/2025 00:03, Giulio Benetti wrote:
> It builds up to Linux 6.13
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash | 2 +-
>   package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
> index 5f3e001325..b8f96ae1b3 100644
> --- a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
> +++ b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  151a56eb6a47efee19369a1c08b7aec506e48f983683a3cd05c5494cedf0fb69  sunxi-mali-utgard-driver-ad7e98bc1e81c7ac9c897f854c1a429d33e45d58.tar.gz
> +sha256  ce73be1fb5f5d24f0e66516623db0b51c45adb30d845bfa8cb78aed9b6d8913f  sunxi-mali-utgard-driver-9926236a20904ecfca68f3365657c11f92695546.tar.gz
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
> diff --git a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
> index ba7c50718d..9c68285256 100644
> --- a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
> +++ b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -SUNXI_MALI_UTGARD_DRIVER_VERSION = ad7e98bc1e81c7ac9c897f854c1a429d33e45d58
> +SUNXI_MALI_UTGARD_DRIVER_VERSION = 9926236a20904ecfca68f3365657c11f92695546
>   SUNXI_MALI_UTGARD_DRIVER_SITE = $(call github,giuliobenetti,sunxi-mali,$(SUNXI_MALI_UTGARD_DRIVER_VERSION))
>   SUNXI_MALI_UTGARD_DRIVER_DEPENDENCIES = linux
>   SUNXI_MALI_UTGARD_DRIVER_LICENSE = GPL-2.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
