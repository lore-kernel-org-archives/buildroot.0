Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 840CEC43458
	for <buildroot@archiver.kernel.org>; Thu,  9 Jul 2026 10:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1DE440EFB;
	Thu,  9 Jul 2026 10:37:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z-hub-zcb5hj; Thu,  9 Jul 2026 10:37:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10D1F40ED0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783593457;
	bh=0dc6HZc6UZe3svfo0xi/NzpED8QvMmnjTHOn67QYfP8=;
	h=In-Reply-To:References:From:Cc:To:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jf8pwEXLSJFH/2UPQUFpywWjws1eUCtV7xvuOCk2itOaFUcW9gbY4i9l3ZPvBYsLt
	 uWR1MOGaFqV8d40VNDVE5/x2ZKpFgOkrC4djlbz+fFhBgEa5DrWsCoQWIOw8NPj7Ug
	 Gtoaw237gFOV+lF9DyP4xMoHYc8x6Lm3TeKvR0rXy0RuPP/dQp2yDIKHs0qTtmHfOT
	 FFMeMwBj7Mtcv5VCQMy5QiJYzZiBzUJyFI55vtuAqhqzKrUENTqrDTEIbaMsce3+Gk
	 NhQ+nAqm+761QvQZm47GmAMx+oDAWZkMxvRvCrT5AyOVk8yA2AaQc+tGVjB3KPgk6W
	 Xk4VoLAljcvIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10D1F40ED0;
	Thu,  9 Jul 2026 10:37:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A514A315
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 10:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87CB640EC8
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 10:37:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id glQGRi-rtotm for <buildroot@buildroot.org>;
 Thu,  9 Jul 2026 10:37:34 +0000 (UTC)
X-Greylist: delayed 1050 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 09 Jul 2026 10:37:34 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9B12540EC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B12540EC1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.167.242.64;
 helo=perceval.ideasonboard.com; envelope-from=kieran.bingham@ideasonboard.com;
 receiver=<UNKNOWN> 
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B12540EC1
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 10:37:34 +0000 (UTC)
Received: from monstersaurus.ideasonboard.com
 (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5B0B54DC;
 Thu,  9 Jul 2026 12:19:11 +0200 (CEST)
MIME-Version: 1.0
In-Reply-To: <20260708223532.421647-1-laurent.pinchart@ideasonboard.com>
References: <20260708223532.421647-1-laurent.pinchart@ideasonboard.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 libcamera-devel@lists.libcamera.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 buildroot@buildroot.org
Date: Thu, 09 Jul 2026 11:19:58 +0100
Message-ID: <178359239867.2174993.2668122399182615183@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1783592351;
 bh=THmyTBklCec0UKnKvBxRgx+2aVVEz5sQolpioGJ0S2g=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=L4sk50FomxLCY2xFICFKnb9UnOBj0bQG3xnmybgCBv0tQkFr6OkCT4HLvN6V7Vu6R
 TMTaWPs3JLzH2pEuQmDgSwfD87bvX640/UFCCccI6lypPKR62Prkp6aDDsxVkR9mbG
 uxZ5EvjlBhi+i7/mIQxKxD+lPqzSVEt0Q3qDHxuE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=ideasonboard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=L4sk50Fo
Subject: Re: [Buildroot] [PATCH 1/1] package/libcamera: update source URL
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quoting Laurent Pinchart (2026-07-08 23:35:32)
> libcamera has moved for a while now to gitlab.freedesktop.org. The
> mirror on git.linuxtv.org is still active, but it isn't the canonical
> repository and has less bandwidth than freedesktop.org. Switch the
> libcamera source URL to gitlab.freedesktop.org.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  package/libcamera/libcamera.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index 945207888bab..ba7510daf8e1 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
> +LIBCAMERA_SITE = https://gitlab.freedesktop.org/camera/libcamera.git/

Why the trailing slash?

Though I've just checked and :
 git clone https://gitlab.freedesktop.org/camera/libcamera.git/

works as expected,

Viewing the webpage, drops the .git but cloneing without .git reports
the following:

kbingham@Monstersaurus:/tmp$ git clone https://gitlab.freedesktop.org/camera/libcamera
Cloning into 'libcamera'...
warning: redirecting to https://gitlab.freedesktop.org/camera/libcamera.git/

Which has the trailing slash so :


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>


>  LIBCAMERA_VERSION = v0.7.1
>  LIBCAMERA_SITE_METHOD = git
>  LIBCAMERA_DEPENDENCIES = \
> 
> base-commit: 6854ee9aa3826d5036a7d3cc19056d43c0452320
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
