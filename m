Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706BDCD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4593E84543;
	Fri, 15 May 2026 17:47:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vAeoURU8Kpqi; Fri, 15 May 2026 17:47:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30E4984558
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867245;
	bh=Q+l2nsXD8ueeNnJTjpqJX2SH0WdLlunZXXC2AoG5/OQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kNbTzm5+Xvs+6rkmfSwgah9qc+N8TxXzsZ9uZYAdMrC1jcZJI7IupVkxcrPTaxjfv
	 W808wq7aBEzheKLNAfQZNDA8ker3fgjQSEcg5OHG+Pu/oKn7IkkbjEgJ6GKVQLZrM7
	 NInIoYxrU/ykd0jlJTWT34E5BJIEZGpFxTHi7PgUqung34fGXxiuKUMJxUGXlnbo/o
	 dPgg6gmZ+KJBqbPY/Edk/6I9kvDBv6iGO6eEhd/2w4Ma/GwmKweKDtET2uknGL0sGO
	 v3JLn+Aw14nFj/8Af2FfPNuJHh257wErD4sCsrHmyojH0a0nObBbY2/ksy8R8EqCI5
	 /FCM9FATqiygw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30E4984558;
	Fri, 15 May 2026 17:47:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2659A23F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C48D61697
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c3TEr_nZ776q for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F048061623
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F048061623
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F048061623
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:51 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-4526a8170ceso19540f8f.2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:46:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778867210; x=1779472010;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=59xM/6LKyPPLm5EIe+4N02Evbq7Gs4F2Pb+NVOSfYmg=;
 b=BgoBBh+Yn/UyQ8YEYjIF+c+Xl1zN59Eulw0juG0VyZNJ/yJURGzSOZ9CDsHqxbh3CU
 Aa0P7gowY82gD5Dk0SdJDlwmmzi69MJkozd8NCqxb1j7iKk+mqxIUuX3UCNcKcitrs7P
 m1lbz1prSmjxPXlPB+K8mGM/PJQQZ40cki6gAnUoV2XH0NtpvTjP3FEie31bq1eD7A2O
 nsUCZ+yvdGKbfK0MHqGvwRUnxT3D2aemgCct9JlGjl/vcaPalr48jxNgKFckVq96TT63
 AnBy75MHhcyewscP+1Wms0r7fWcXDqexxgmEskKDNyfRKs6YoemU8qmKP9ZcAN9PEvlU
 GCuQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/QGLAvmmWQaHn2m8LbAWfYFwB//t3h6mutIFGjV/LdLpz061j3lo9c3pNsuV1BvRRgH9pYm850ykc=@buildroot.org
X-Gm-Message-State: AOJu0YxwA4BMLIPeyGtsT6q4WsR2MoyzEPSEOU/KQ9B6pN8tV8vGGlgg
 9+G5LZ1KCNb98Io8V9sjTmmDSsSqqmkKAmKVXOYgHM/o4V/DN3py2lrlvKl6J1rn3TY=
X-Gm-Gg: Acq92OEbyCQt8RgTiX1eF2M4S/sb6JYyvXVswTv1FKxXvs4QTsJZtz66Xf5NEnhM3HX
 0nKeYz/HHmPp82CSBKOMPiSg3oAnIEWuH5qGEnZe2zpR2Z7ib7ZCGCCVou6wBBdY1LTEd9hogtn
 hIW4O+6+ZHVmCTgErrUqmkqtZJGWP/R3MNa1uI85uIuKmQiRjJxiCqHPi1NgaOo7jMpsNyZTh2x
 /UG6aJDQbLlBDAJrA3GGCq14m88q5QLzyP1n14Pfmvtzx87XlYtWgQALzJ4Fbk2HAsLbegLm1F/
 kxQkPhfxNjonY0njXXtjebCvdfTxtEOpaPmsM7O8DISlsntHxl0L6K2dwlM82zWkz1VHpPZLl2a
 pqLLpQIj5LC8/bEywSLS1Vop2UhCvAKM0jmFoJfxuTOiPu3R+H4mynloICI+kfsKMxKQ1Dxk+GK
 m2KyGw7/ef5VKFNXlynEHtyjShx9CQ6/f9ogvEnLoURrfV
X-Received: by 2002:a5d:5885:0:b0:43c:f7e5:817b with SMTP id
 ffacd0b85a97d-45e5c5cc2b5mr6797886f8f.19.1778867209848; 
 Fri, 15 May 2026 10:46:49 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9ec39806sm16218870f8f.9.2026.05.15.10.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 10:46:49 -0700 (PDT)
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 19:46:49 +0200
Message-ID: <20260515174649.530857-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260507130813.67423-1-aperez@igalia.com>
References: <20260507130813.67423-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778867210; x=1779472010; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=59xM/6LKyPPLm5EIe+4N02Evbq7Gs4F2Pb+NVOSfYmg=;
 b=PXTWz9xHU4pU2jIFZRUcbZKZqjUF2mK1ktSCQR0KoW2CyqJoihHEPMF2csvmhw5+k8
 xpl7/9175BNcHNn6FUp/RiG+okMhrJ2rd4Ew5xTjQC9j74dGnzyuOEmaWwVK25+tt7vp
 vUNe5PT/0HooYVxsuC1On7911U6DR25GSQ61Un4qqbc/Uz20b1GHFMWk125kfw70QP4j
 FwnQFQFCmkFC/P51Ajny4g1cKxIxcIrrtsQjPuVY7S6le2cOGpqCMBrU8UPpP78M8wEN
 EbByJB0YbzgcPu9vVpyEZfgFDXTgu2dWmtPEgy8i414Whizd2uc9g6seW/I8nVCX+XI+
 G9kw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PXTWz9xH
Subject: Re: [Buildroot] [PATCH] package/bubblewrap: security bump to
 version 0.11.2
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
> Fixes CVE-2026-41163, which affects any system using bubblewrap 0.11.x
> using a setuid bubblewrap.
> 
> Release notes:
> 
>   https://github.com/containers/bubblewrap/releases/tag/v0.11.2
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/bubblewrap/bubblewrap.hash | 5 ++---
>  package/bubblewrap/bubblewrap.mk   | 3 ++-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/bubblewrap/bubblewrap.hash b/package/bubblewrap/bubblewrap.hash
> index 696c20ee07..e87d3c81cb 100644
> --- a/package/bubblewrap/bubblewrap.hash
> +++ b/package/bubblewrap/bubblewrap.hash
> @@ -1,6 +1,5 @@
> -# Also checked GPG signature from
> -# https://github.com/containers/bubblewrap/releases/tag/v0.11.1
> -sha256  c1b7455a1283b1295879a46d5f001dfd088c0bb0f238abb5e128b3583a246f71  bubblewrap-0.11.1.tar.xz
> +# From https://github.com/containers/bubblewrap/releases/download/v0.11.2/bubblewrap-0.11.2.tar.xz.sha256sum
> +sha256  69abc30005d2186baf7737feacd8da35633b93cf5af38838ecff17c5f8e924f6  bubblewrap-0.11.2.tar.xz
>  
>  # Hash for license files:
>  sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
> diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
> index afbb29eab9..7838ab90b3 100644
> --- a/package/bubblewrap/bubblewrap.mk
> +++ b/package/bubblewrap/bubblewrap.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BUBBLEWRAP_VERSION = 0.11.1
> +BUBBLEWRAP_VERSION = 0.11.2
>  BUBBLEWRAP_SITE = https://github.com/containers/bubblewrap/releases/download/v$(BUBBLEWRAP_VERSION)
>  BUBBLEWRAP_SOURCE = bubblewrap-$(BUBBLEWRAP_VERSION).tar.xz
>  BUBBLEWRAP_DEPENDENCIES = host-pkgconf libcap
> @@ -18,6 +18,7 @@ BUBBLEWRAP_CONF_OPTS = \
>  	-Dman=disabled \
>  	-Dpython=$(HOST_DIR)/bin/python \
>  	-Drequire_userns=false \
> +	-Dsupport_setuid=true \
>  	-Dtests=false
>  
>  ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
