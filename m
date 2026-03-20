Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E29310987A2
	for <buildroot@archiver.kernel.org>; Fri, 20 Mar 2026 15:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C67984880;
	Fri, 20 Mar 2026 15:55:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kA-uvQnpCrMR; Fri, 20 Mar 2026 15:55:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E04B84896
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774022114;
	bh=meXhCmYiGyVcXpshgrbvziPceeHKcMrXI8hddzE8mFM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Nhqlb2GvaMKBgmLZYgYs7Rrd3e6K5OFNtMnF8chRDG5X/lcQrYn3kD2W5KYzUbOA5
	 gqoK4ToA/O5NrUTlwkwamXqQ1hO718GIvesy0KGBTIFCaKnqy4A7oRG96rswFsCM3N
	 UZhLh/YVd++42ipMb+VkOg4M48PzirRztxBycGi8a4fk6XwCqljVL4O+YgQb7UkfmX
	 qW1AGnluQqe69LpBrWY4gkplFaYNCF8Y6WYPmJs5nS0nnX0OPAnrp3zeV6zlvQQvEg
	 ngwjWg6m5f8DR+EIjbopBVzs8O0SxzKe9JQO3lZle+cKVPoV8EPaGW+LqcUZXinycb
	 z0Qz41KrTPDig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E04B84896;
	Fri, 20 Mar 2026 15:55:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DB23F25C
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCB03414DB
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6KFDzfX7ZpKG for <buildroot@buildroot.org>;
 Fri, 20 Mar 2026 15:55:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B8E2F40139
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8E2F40139
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B8E2F40139
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:09 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-439c6fc2910so1507276f8f.0
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 08:55:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774022108; x=1774626908;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=E6GVphaR7ZbBw2O4d/PNgB0UDobBHwlgvtaFNA/ytBs=;
 b=gavTQOl4suU0lda+rJi5uGz/S/L/wGympHuO2UNXaEzQ2bdrZ2t9sy8K68r066dCDt
 49Vbv74D77YvB0nBtgoi5TV8inlqg+tuNKv1VA3V6bG7Focxgi4qU/++RbONo/mGwmPx
 4CziMkES8ZoKZxBsnHZ6W+K4PjNVmogN+9j81e+2DtgqQR2hHFVK9twXq+MNEtSzeou+
 njCTAxAv0tkIqfP61gYwg0ilwccYDu1OCE2e6tTqH5eyQpxtCRmRaRcBJdS6PV9tp0Gt
 MPUF0PNWSwjTtfSU8NWETzHlvXC1fTs7sYG6BJMx4VZ1OaC290XNLs7Q4PmpPyXUBoWV
 V7/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU//f3U1zrcRnAxTO3raagonsilQrdmJNwm6psUSQKtPnxzDgJ4+jVGPlvKskAaGD92UJdZItqHwhk=@buildroot.org
X-Gm-Message-State: AOJu0Ywudm+mjniQRzcjIMRxZhl1V0FPObOBgmXRxKHXmZ+3CtXC2RuZ
 TM7Ha2awtRkmUcCxTYgDUMiYS3eN3vy8Eth/kraULAVMT3AXB3Eja6udhPtmSaxKVAY=
X-Gm-Gg: ATEYQzwSwp+OtiTd31Fq7EuV0+ZwcT6yeF/XVxF0iOJlPArlTu4V+h4mI/YnElc3TmZ
 yJvwCnMYdwpYVNxT3JaLK2j7H3zxav5T/MIGZp41YGecOY9bOzPCyszSGFx7v4FxcjHngS+7Pf4
 Fjw4Ui1LUF6y09MPzBGdupVdbtsmQGqUVEoQ0itQqxcGBKlhlFNN7tnTz8vZYPR+nqWnwck+q4+
 92F2P1TM/2p5+Nive9mNF65OHKQXXGzH3A4W3qHKp1NUFH8JO4Uu1MI60onJH444ldl+T1Y38qc
 DNMEXtLbwKDYk9IR+Cbf8JT6u2WnVzJmVLJlqRWGhbIGTi2+u/fLS/c/WBZPdXCzLaPRbG/4/7A
 RCvLEhYme5sx/ky4AmmN6Olvo+fJW+q6gG+gFhTs7fvBVhOYRjv1HetPqRG3rf0rI66zjLgf4Ht
 Ap1tbZTV0rw/OSzkHR
X-Received: by 2002:a05:6000:184a:b0:43b:45a0:9df6 with SMTP id
 ffacd0b85a97d-43b6427d9d8mr6692627f8f.32.1774022107637; 
 Fri, 20 Mar 2026 08:55:07 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b644ae048sm7821822f8f.1.2026.03.20.08.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 08:55:07 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 20 Mar 2026 16:55:06 +0100
Message-ID: <20260320155506.176678-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260301140024.693061-1-giulio.benetti@benettiengineering.com>
References: <20260301140024.693061-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774022108; x=1774626908; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E6GVphaR7ZbBw2O4d/PNgB0UDobBHwlgvtaFNA/ytBs=;
 b=PRW9vAi6xyZu2JMArqCBFoDVSH70TQnoeDdGrh84JCDcirU8fQ22KAQtUu7Ety5u7O
 2feFJ5qi4VBHB9w4kqQiLvf1g66ItSlL3Pe20LmTS3gvKV1C1u64UqzAbnmR7VQCkxs7
 3ZSAYZJCLsQsjXtoKNdYp6KDaDT3mSClSPwYrR6csPbdPKJVS6ENM3noVmzQdM8w6qOj
 GXGK6mdqePA8Jtz6XhEy9Ut4QAsDD6BVP2CIojxWlk9DdPgI/wl5PCISZh63Z9pEqLjX
 FOvJQEB7R9KWOtZyEYQiO9Arl1M8bcJpVcKl7nXr9AlvOroTi9CwXz6xvX/0KVAx5dw5
 MQ8Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PRW9vAi6
Subject: Re: [Buildroot] [PATCH v2] package/nfs-utils: bump version to 2.8.5
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
> https://lore.kernel.org/linux-nfs/fdf3631f-e924-4e4c-bd9f-db5b40a90bfe@redhat.com/
> 
> With patch [1] option nfsv41 required to be renamed to blkmapd.
> 
> [1]: https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=59e85671e59f7ccbf66dcf72ce7462bf4932cc78
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
> V1->V2:
> * renamed option nfsv41 to blkmapd as pointed by Petr Vorel
> ---
>  package/nfs-utils/nfs-utils.hash | 4 ++--
>  package/nfs-utils/nfs-utils.mk   | 8 ++++----
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
> index fb5c03d917..9aa9151ebb 100644
> --- a/package/nfs-utils/nfs-utils.hash
> +++ b/package/nfs-utils/nfs-utils.hash
> @@ -1,4 +1,4 @@
> -# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.8.4/sha256sums.asc
> -sha256  11c4cc598a434d7d340bad3e072a373ba1dcc2c49f855d44b202222b78ecdbf5  nfs-utils-2.8.4.tar.xz
> +# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.8.5/sha256sums.asc
> +sha256  b13ca4a9df44186bdbe107514b22732d4243f785f95daf2fb86afc1edba15bbb  nfs-utils-2.8.5.tar.xz
>  # Locally computed
>  sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
> diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
> index e7d82b10ba..ba87ef813e 100644
> --- a/package/nfs-utils/nfs-utils.mk
> +++ b/package/nfs-utils/nfs-utils.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -NFS_UTILS_VERSION = 2.8.4
> +NFS_UTILS_VERSION = 2.8.5
>  NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
>  NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
>  NFS_UTILS_LICENSE = GPL-2.0+
> @@ -28,7 +28,7 @@ HOST_NFS_UTILS_DEPENDENCIES = host-pkgconf host-libtirpc host-libevent host-sqli
>  HOST_NFS_UTILS_CONF_OPTS = \
>  	--enable-tirpc \
>  	--disable-nfsv4 \
> -	--disable-nfsv41 \
> +	--disable-blkmapd \
>  	--disable-gss \
>  	--disable-uuid \
>  	--disable-ipv6 \
> @@ -50,10 +50,10 @@ NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_NFSD) += usr/sbin/exportfs \
>  	usr/sbin/fsidd usr/lib/systemd/system/fsidd.service
>  
>  ifeq ($(BR2_PACKAGE_NFS_UTILS_NFSV4),y)
> -NFS_UTILS_CONF_OPTS += --enable-nfsv4 --enable-nfsv41
> +NFS_UTILS_CONF_OPTS += --enable-nfsv4 --enable-blkmapd
>  NFS_UTILS_DEPENDENCIES += keyutils lvm2
>  else
> -NFS_UTILS_CONF_OPTS += --disable-nfsv4 --disable-nfsv41
> +NFS_UTILS_CONF_OPTS += --disable-nfsv4 --disable-blkmapd
>  endif
>  
>  ifeq ($(BR2_PACKAGE_NFS_UTILS_GSS),y)
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
