Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F58FC3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 12:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDB0B400D2;
	Mon, 22 Jul 2024 12:47:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zMv4LIsai249; Mon, 22 Jul 2024 12:47:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9597440499
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9597440499;
	Mon, 22 Jul 2024 12:47:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4C69F1BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A479605C8
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:47:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nibexXG7iDxs for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 12:47:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E423C605C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E423C605C7
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E423C605C7
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 12:47:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2ADE3C0008;
 Mon, 22 Jul 2024 12:47:17 +0000 (UTC)
Date: Mon, 22 Jul 2024 14:47:16 +0200
To: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Message-ID: <20240722144716.092e357b@windsurf>
In-Reply-To: <20240524181856.2712581-1-alexander.i.mukhin@gmail.com>
References: <20240524181856.2712581-1-alexander.i.mukhin@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721652437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xFhxueSO2NsdG5z7LrGKxgl45mcvO2IYFYrHiNuOPsM=;
 b=DfpbX22MYOHyrSFgvbVq7bjC1sunTSHgsTdT29G1EfLgBjim8i615xzgEkLInIBbZqFLWm
 I35GopxqghQ3v0q+Zq7tqSjdH6NyUjqFjdnbYqPb+/aSojQ2VJ4+n098QJ3g6ShWLwd7JB
 Da436DOQlniv0f1rxsDql99Yp+I0LOzoskoGt8NJFUTO99eKBvyLs+lHguie0m5UmfwDiR
 rECnLV1R3E6F6G10X08D0N7kZ/uVFy7W0JrbMyvwHKR4OurpUPPCIOpQxAGdojzB5SgME2
 hRAWTvL/tmUrhR6uSsZ2G7KCmmMb5KucVAsxKXPiLRF9A4Qf/uvXOscRHCwCmA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DfpbX22M
Subject: Re: [Buildroot] [PATCH 1/1] package/zfs: bump version to 2.2.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: salvador.joseluis@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Alexander,

I'm not sure if it's related to this version bump, or to something
else, but the ZFS runtime test is failing:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/7391793226

Could you perhaps have a look at what's going on?

Thanks a lot,

Thomas

On Fri, 24 May 2024 21:18:56 +0300
Alexander Mukhin <alexander.i.mukhin@gmail.com> wrote:

> Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
> ---
>  package/zfs/zfs.hash | 4 ++--
>  package/zfs/zfs.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/zfs/zfs.hash b/package/zfs/zfs.hash
> index 01c86f2b..9c8d4cec 100644
> --- a/package/zfs/zfs.hash
> +++ b/package/zfs/zfs.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/openzfs/zfs/releases/download/zfs-2.2.2/zfs-2.2.2.sha256.asc
> -sha256  76bc0547d9ba31d4b0142e417aaaf9f969072c3cb3c1a5b10c8738f39ed12fc9  zfs-2.2.2.tar.gz
> +# From https://github.com/openzfs/zfs/releases/download/zfs-2.2.4/zfs-2.2.4.sha256.asc
> +sha256  9790905f7683d41759418e1ef3432828c31116654ff040e91356ff1c21c31ec0  zfs-2.2.4.tar.gz
>  
>  # Hash for license files:
>  sha256  1ffb70c33c4f79f04e947facc5c7851f289609256aacb47fc115f700427d9520  LICENSE
> diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
> index 59cdd319..fa6d282f 100644
> --- a/package/zfs/zfs.mk
> +++ b/package/zfs/zfs.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ZFS_VERSION = 2.2.2
> +ZFS_VERSION = 2.2.4
>  ZFS_SITE = https://github.com/openzfs/zfs/releases/download/zfs-$(ZFS_VERSION)
>  ZFS_SELINUX_MODULES = zfs
>  ZFS_LICENSE = CDDL



-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
