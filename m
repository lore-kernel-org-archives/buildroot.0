Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8B1C83030
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7056E811A0;
	Fri,  4 Jul 2025 06:47:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rzdhkGWLGvub; Fri,  4 Jul 2025 06:47:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94BCA8104D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94BCA8104D;
	Fri,  4 Jul 2025 06:47:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 228701EB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 094B74040D
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:47:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QKJ3gg-Im_SB for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:47:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1A92740167
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A92740167
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A92740167
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:47:52 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-450cfb790f7so4336165e9.0
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 23:47:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751611670; x=1752216470;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YM+B1YMTMIUe3mCNMjkn1LKxeAkryKO6VcAqzi+FKZc=;
 b=TOZU5XF0S0cfFphwz2pK9Ab65+2u7XNFKozSNgbsQlSWeMpG7zQoAj9ldvma5j+Znm
 WclzY4lyEdjrNiMSwTqAu1fZlwat5/ajqzt2gTRkW97hYDuKEQ39swM+l2tFzobOoB+L
 1xWxdPtT4iy1kyvvmMQWaDzWGRpZ6fER2GBt30wKC9Q6O4BAb4TejSWNvRtdOFLxiBht
 KOdFsZ8NLT5J47quX1nbwXzt7u3OEO2cCe2eaWls9MOB7o5SlQJuJbIykqcqdBLNgrWB
 61uxESmrD65a74ONaP1DiASOARQar4MGVVJvIcuJgBj06hsHt8VVdxbFk3RqZxtf9gil
 l7+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZ/B4XVuanzQ3mFeOqlD0Xgagov89LuDHnQjveVW62WiaLcjcQ5CMRZjRYZ28yx4PB8h6GqC1A+T8=@buildroot.org
X-Gm-Message-State: AOJu0YyOmZbOvrInH3wW17Wnnt+pSZTFb1tJOuxxij+D6YmOHQFNNaG8
 kege/T+3BVl1lHJVSii4y0ZOYVJbPrTlQvueM2aWKY7W9EO22HUQHIBMMGmHHbVXt/ZsZj/CGSx
 UF49O
X-Gm-Gg: ASbGncux1Dh2MmlLr7s/D6ezCvTgH2xsTrtbqTbS/3IA8Vo5QEgzPzpTNuM6tzD6JpW
 tv8juq+e8/4PMenEIJDJ3zU+OzA5QqP9zii/Ym6dkkmLklJ5JKAR66eba2N9tXS/xkBcevpRWav
 2g1HOpb1IdXBrFLNjiwjUpdYDGqVHqKKX17l0Q9EZNtmoN4/w0xzq59dHcuqeV5he8UXNJzYxPl
 uRGSeNswrFNHDiiuEASPvrvnSzbwGm3EemL6isS1y4wV86INS3V9SJJHmg3GNh1kuz0IElBm5ST
 5YdlP8eOyIIYaY+f5vxkibaXHSkpqWN002pKzykvQHrffiErzPFRpPILxc9AIl07w3ot1AM3cbJ
 vbbU4lGcc+Ju20hawlxbP
X-Google-Smtp-Source: AGHT+IF1AgqYWlx8A4uztyS8zRV/H2iz3bbiuAbaWeSRaHMYv6/sQrSLDgEfgduYRygD2IVbvn4RgQ==
X-Received: by 2002:a05:600c:8b6f:b0:43c:efed:733e with SMTP id
 5b1f17b1804b1-454b30b4d40mr13349405e9.14.1751611669846; 
 Thu, 03 Jul 2025 23:47:49 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a9bde3b9sm47353825e9.28.2025.07.03.23.47.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 23:47:48 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Jul 2025 08:47:47 +0200
Message-ID: <20250704064747.4065086-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250623191224.588712-1-thomas.petazzoni@bootlin.com>
References: <20250623191224.588712-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751611670; x=1752216470; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YM+B1YMTMIUe3mCNMjkn1LKxeAkryKO6VcAqzi+FKZc=;
 b=dBsAiVsBF2ubveuBy8i3lEOxyCajPccaQoiC/PL7StCgp/K/6BgCOeltsgHcDwo3k/
 ZTQnQMUK/2uA3PZOXeSK9ToQ0Hh78/EMroiqNBn62QH1pz5JRhHJHiLqSrsnEWWIJyoc
 3tvlFLeXJXuT9I1sarvjkU+Y43O3aw0ivNBVk2+ta0iXCcq2ltRHywOuqq5Dj31KZ9gB
 w+RrTj7eZvZfJ3vMQJFoe5N++f3aU0ESo1udVso6Fkpkh5alPzIjho2hJY+RI0zrUD8a
 erfwsxd/lJsxhhESNEob3sxlCpXqk7omDNjGc5xXqbz95TT32t4vw4iCthih86sTY8d8
 v+2A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dBsAiVsB
Subject: Re: [Buildroot] [PATCH] package/cifs-utils: bump to version 7.4
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
> According to
> https://lists.samba.org/archive/samba-technical/2025-June/139484.html:
> 
> A new update, version 7.4, of cifs-utils has been released today.
> Users of cifs-utils version 7.3 on older kernels are encouraged to
> update to 7.4 since it includes a fix for a mount problem with version
> 7.3 of cifs-utils on older kernels when using namespaces.
> 
> [...]
> 
> Detailed list of changes since version 7.3 was released
> ----------------------------------------------------------------
> Enzo Matsumiya (1):
>       mount.cifs: retry mount on -EINPROGRESS
> 
> Henrique Carvalho (1):
>       cifs.upcall: correctly treat UPTARGET_UNSPECIFIED as UPTARGET_APP
> 
> Paulo Alcantara (1):
>       cifs.upcall: fix memory leaks in check_service_ticket_exits()
> 
> Pavel Shilovsky (1):
>       cifs-utils: bump version to 7.4
> 
> Z. Liu (2):
>       getcifsacl, setcifsacl: use <libgen.h> for basename
>       cifscreds: use <libgen.h> for basename
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.05.x. Thanks

> ---
>  package/cifs-utils/cifs-utils.hash | 2 +-
>  package/cifs-utils/cifs-utils.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/cifs-utils/cifs-utils.hash b/package/cifs-utils/cifs-utils.hash
> index ea32d4dca7..e6a5eefeaa 100644
> --- a/package/cifs-utils/cifs-utils.hash
> +++ b/package/cifs-utils/cifs-utils.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -sha256  c4e1eb5f4ad880d96e16d95a1cdbc7ec978ab51c5b6d8a20ae09dac638f36dd5  cifs-utils-7.3.tar.bz2
> +sha256  53353d05c30b4fc9dac006a8f0c5054cdd8a1834c176313c91e4694025c4b891  cifs-utils-7.4.tar.bz2
>  
>  # Hash for license file:
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
> index 9c029342eb..9e1e822c4c 100644
> --- a/package/cifs-utils/cifs-utils.mk
> +++ b/package/cifs-utils/cifs-utils.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -CIFS_UTILS_VERSION = 7.3
> +CIFS_UTILS_VERSION = 7.4
>  CIFS_UTILS_SOURCE = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
>  CIFS_UTILS_SITE = http://ftp.samba.org/pub/linux-cifs/cifs-utils
>  CIFS_UTILS_LICENSE = GPL-3.0+
> -- 
> 2.49.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
