Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AF910987A2
	for <buildroot@archiver.kernel.org>; Fri, 20 Mar 2026 15:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5408F61B89;
	Fri, 20 Mar 2026 15:55:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JaJJ1pDgUWMy; Fri, 20 Mar 2026 15:55:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 637EC61B99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774022119;
	bh=PBV+z/DwU0TURiZu7XFfPcWSOLNMf0xyI7sX+GKIgu0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EfrA6eD2F31YLMlcsuWX5JODh+0fmYHRqVT9PXqe9oEjxJw4bw3pm171bYOfzOdg6
	 7v9YDbcbciSGiUmrTviCzlNzRWbwuVcJ+uo7VUDTTzSDiOs2TRha9ph0J3l61g8Pci
	 Lbcy8gm2e4Dw2AKF5iuD7k0jTQ+EzD9FlFnfwgYwabiWegwwxbkLc/TPOlwD4duigT
	 H0SHJcLgulcTUDFE5EgxiOnOpolqkFbgqnh3ys8Vr4rJflZrFdTUEoF1oEGlh/q9/3
	 9UNF105G70drhs7+IK8MBEw1WBDakoC3/RpJoqOfeOKgEdMmScwzVBdQhLVK/LYQNl
	 OQ0cSHtuo0o4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 637EC61B99;
	Fri, 20 Mar 2026 15:55:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 036721B6
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E964684894
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hPJFTEApKpfe for <buildroot@buildroot.org>;
 Fri, 20 Mar 2026 15:55:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DF7B884895
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF7B884895
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF7B884895
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:11 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-48557c8ad47so17071255e9.0
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 08:55:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774022110; x=1774626910;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=b3d4sHwbq62BaH+FgKAlCI/5j3myh5LEpOJuy0VA8ws=;
 b=iD8X/OFMtEcfT1KsTVPL7zFa5MIkzBRxgb2YX8sAxKEW1x5uy2eX0nGnoNdf8LlmYp
 VqnarT2YnRrUAy1lm1COpWHSTuNu8hJhfvUoePCg74dEoU//YfaNmPDRMI4ztzDRDsX4
 v9Hf0QCEz9WaA4MBFgNHDfXXJ1Ef8uwbZGyaUNKq+oSpOVWeYORts5YFBeXMhLigySHS
 kgnNwAYviyBVr3oOi1RN7GPn5pR5Z/cA355f/ITLC/p38o4kluk6YynVGTGNpJDMFMIm
 mjpBkili3oL7Rx4LgszGJfEVpgJFRvKl8Fosjr9h6N4uuX+VTbRPF/f6OBUNdj6MenLT
 YekQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1bwYmC4M9z62DLcLx9Pi4lIBYFofzP167MPknO4LMpyWlcKqd92gm7riEriYIqkpwubHqSgpbpYY=@buildroot.org
X-Gm-Message-State: AOJu0Yz3xhXWTkSDq+X1pdseXnv69SBCsEcUXd95Y/XgNWLPRruYFOX9
 a04SXLJ96f/l/9AycXvJVIfPgZuXm9BRA7rYH863WkOgIGGb+d/XN1Fswyyb21AbZ+w=
X-Gm-Gg: ATEYQzz04Zu8GswR9hmta3HCN3ZlvZuPmX3TtaRTf/PenrOy70LgVIUWN6DPVmOZfWk
 dZcCY1ddI258zTSpKwLQy9S6+oM+XMD2b9S1zVsH8bxLZ/RAL+5oxVEImz5AqZzItz+n3WeyI7G
 t+wgfklOh9xS3lw5LXmxKltrbvw4QUNUnoRPAE7fIc4jmfTqOGT92s+PzHGlbUhN5PBCpcIPiPw
 t54mBzyVFZ8qa7EOmMvdxkO1PBGNxvOTHCMQRP1+c1TqIGRo94OtbzDyieDFItmzHt4i/+PwQdH
 wmZx/qOLMMkrtWHg8QroIu3peXJQVxvdjSfovtYeZl3lhUTb7QXmnm8yA+XRkwfP5325VdoXRcU
 MoaM7TjDrpcCVWw5pjYqsnEX2zr5CDPIqcG1cnDJi27Eu3FhlkxauaBBB0Q8egBo+War/yQ+2Fj
 UNBpAQz7P6WLpqPIaf
X-Received: by 2002:a05:600c:8b66:b0:486:f9d0:aac8 with SMTP id
 5b1f17b1804b1-486fee0f835mr50570915e9.18.1774022109671; 
 Fri, 20 Mar 2026 08:55:09 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486fe85e4d3sm20447495e9.2.2026.03.20.08.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 08:55:09 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 20 Mar 2026 16:55:08 +0100
Message-ID: <20260320155508.176793-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309083104.3500964-1-giulio.benetti@benettiengineering.com>
References: <20260309083104.3500964-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774022110; x=1774626910; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b3d4sHwbq62BaH+FgKAlCI/5j3myh5LEpOJuy0VA8ws=;
 b=B55IkpoKZ6sw7/lfTaFDmdcZT/DYIGRq6XRNLylociwwdfzS5Ahl4n0XbJhHFzsNdw
 2CJLO65MM2vSpQMrIzpR34ypCufu6MH/a8rXRFqhY89TnoZ2WPTHU4fTAqKURF/5Xa4V
 2GAORZjS82kOdb0KTkzLojk7AQj2okfHzQhbSrUAJFO96oeynj/eMECmZ9cxBLlKxuvm
 j+rgpaXXi/t9WTz5iDrHWQeikcs+7Tm9oBqDALg7Je/4ZS2QN3paQyRbEvWq+9PE2ggM
 Hil1P5JlZUlpKq+0W/UrQmcsxfxUux9n55hut51+SakC+9R5E20UEFZhrxOvwni2rXCC
 mriQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=B55IkpoK
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: security bump version to
 2.8.6
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Release announce:
> https://lore.kernel.org/linux-nfs/4d58bf28-a3e0-4496-bae8-05387da27054@redhat.com/
> 
> This update fixes CVE-2025-12801.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/nfs-utils/nfs-utils.hash | 4 ++--
>  package/nfs-utils/nfs-utils.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
> index 9aa9151ebb..bf7c4b61b6 100644
> --- a/package/nfs-utils/nfs-utils.hash
> +++ b/package/nfs-utils/nfs-utils.hash
> @@ -1,4 +1,4 @@
> -# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.8.5/sha256sums.asc
> -sha256  b13ca4a9df44186bdbe107514b22732d4243f785f95daf2fb86afc1edba15bbb  nfs-utils-2.8.5.tar.xz
> +# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.8.6/sha256sums.asc
> +sha256  2bd7b34e809a7eff2f4bc5fc5fd96ebcd66a5458b471a270cbd2dc169b011550  nfs-utils-2.8.6.tar.xz
>  # Locally computed
>  sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
> diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
> index ba87ef813e..7ac0b549cf 100644
> --- a/package/nfs-utils/nfs-utils.mk
> +++ b/package/nfs-utils/nfs-utils.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -NFS_UTILS_VERSION = 2.8.5
> +NFS_UTILS_VERSION = 2.8.6
>  NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
>  NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
>  NFS_UTILS_LICENSE = GPL-2.0+
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
