Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A453EF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E4806176C;
	Fri, 13 Feb 2026 19:40:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eW1-ueCH-Ew5; Fri, 13 Feb 2026 19:40:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5686261756
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011617;
	bh=lGjvliayzJk6avUvlZxMOPMz/AMDZMAAJF2ftdC2kUQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QFnoC+SOloawRpLqDbmQSqDC7v3eUnZCKqY+S+3FFLX/19z5gFYs17hwGM9JlBL5I
	 UdAEXcgDLQeYcQbzcLicNVHhuFwr7eqJOKB64GlrJZJoI46BFjfWVIaPhDTHNKBDXj
	 dt3i1+DL1EAuVaIfqKUHq/tAskf9fPqis+a6/arve+lddQ0Qs/6WoIysSE9ctRbrSV
	 Ta+QwTgVJ+0SLHAr5G+34MHauMkUQfSxQsCOTabHVJQy0CaUqvXSrHStfsQ7xIfcqe
	 Go5O/G8S5JbgeM4RFglvB77dEVuudGlK7dl+hjOs8G7Ef7KUSOqZsnfo9gIkk8uv98
	 guBxecgdBHTXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5686261756;
	Fri, 13 Feb 2026 19:40:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4ED4D69
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 489B241336
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hgeiZGyfGXW2 for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 56DA1412D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56DA1412D9
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 56DA1412D9
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:32 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-4376c0bffc1so967140f8f.0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:37:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011450; x=1771616250;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ojew2bD6J8VMhRx6XH6FAJ8V7boQ708vXQn63VTAfms=;
 b=MtuN/agHEX3jYpX6myMqF7EDFrMEd3ShmvynLC35G5DcJ/9eTwCzKHVSEiXQMmp1ov
 SvlNtDIkhPHnf5kmHaP89LHKl1RPUJKnRpauj4c+KnZckosIedBAKzwd1NUsUsgJQN8o
 ppMMj9IL2VV770Dhq2zg1L1rmEnFcdW2ekKpDSE0HY98num01VQFaJ/KO7ISF9bG6aMJ
 8lGy3PbVtYgsISjIgIIEFKPnLSWWXXbm+l/VffyvzpDfSGYXl0wAgLk7OPGonLsixUb/
 GrgA6bsJ6qCncJMSd3FkwkPko8Is2wOfHceuBvpwaMQMSFbJc52SOPQK/Ve3N4ewgNGc
 uPuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrS2oMQEAirlCuVvV5e2wzSF408A1fe1sGLsqpaofZ18Pk784Jd9F6uQ8C5EGRwsOG7EujK6M2Ems=@buildroot.org
X-Gm-Message-State: AOJu0YxIYNlpd/Ks5SBXYn4i0Hh1fYemsHcdqAOpUifo6x4CIg52JEvl
 dkJe5arudAWRwYHtTV7xjya4pGiKRAxxtyvCedtAbG5afzAaDF42GCHgsQ0RW91b0YSQEXbdAIY
 sI3n0
X-Gm-Gg: AZuq6aLKne0mHtg9NID5ua3+JkSEMomD93SqKeqJKjXLIx0GBi/ERQ/1p4O6pSX71zo
 Zwh/8bihue0Gv0aDgfFUiEH+7ueHD8cc7RkxaCqaSYWTE8guHLEUKumjpsqPmsqGH/UPTnRmh05
 H+j5rZqGpQScvZYGaWEDD/IpSNUWTHojFZ0rhvhfae9mJpMpyFkZ4PxhogkeiWTxY6mtxR2muGM
 hrWrCYFC7qeZjw5RLc9GEkMbczxbhbj8LSyEQlc53sM5Qzl/OpyV8REzgyRc8ZABKqt01R/2gNW
 F7K0n3nw7p6Lnt/6kvlaWuChLOVxhqMGNTpJidWgl218KsCALHCJviQfqVSq5b/RPaaUY5x0obl
 14aFmvEHtOeLwhLUDn9enbqO9D/K8WJwTOZgwCvuKAf2v9daWd6vVQcwAhQopkkv3dpzUp9qypN
 4qIugSKPhDY5EVndQ=
X-Received: by 2002:a05:6000:4024:b0:436:1888:c0a9 with SMTP id
 ffacd0b85a97d-437978c1b28mr4736380f8f.6.1771011450217; 
 Fri, 13 Feb 2026 11:37:30 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796abc9b2sm7225325f8f.21.2026.02.13.11.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:37:29 -0800 (PST)
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:29 +0100
Message-ID: <20260213193729.39712-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251001-fix_license-v2-2-bf18911c835d@bootlin.com>
References: <20251001-fix_license-v2-2-bf18911c835d@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011450; x=1771616250; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ojew2bD6J8VMhRx6XH6FAJ8V7boQ708vXQn63VTAfms=;
 b=LOCZfYObV6ydJQ5qgm/erphuQnjX0k1hG9ZH59XCamErspzaT0krK0IeoUUqzWPD7k
 ypg9ykvAk6SZlzXFV1S65m0t++t8brZsxuOrwPNWp1MC3XDvAjoOy5PULkqSyvGqXvX2
 13AJuDy3xpsf3sgL/k70qkk1lps6ctbVihXbTes4/YdgZthuyeLmP2aa6/8DE+EndkAu
 HeV8xE1dHLXI2wRj+Vf2JTrWBNVDP14aZ0K4tf7gsa20Lrri4hv6VY9n5hdtDMgX/B9D
 hyZgW11Ovuq7OcmirPMiqtTiixOGp6fU7f7TJYqjtr9oGpHNNAxzgEzoGgNrHD357gY1
 FdDQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LOCZfYOb
Subject: Re: [Buildroot] [PATCH v2 2/7] uboot: Add support for custom
 license files
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
> The U-Boot package was not providing any license file when a custom
> Linux version was selected.
> 
> Fix this by adding a Kconfig option to specify the license file,
> with a default value set to the commonly used license paths.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
> 
> Change in v2:
> - Do not show license option if it is not a custom repo
> ---
>  boot/uboot/Config.in | 16 ++++++++++++++++
>  boot/uboot/uboot.mk  |  4 +---
>  2 files changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index 9320f942d674384f32e3c858e4b5134bad966834..e2547d89d08416026ce1f42d52004d3269b9d2d9 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -92,6 +92,22 @@ config BR2_TARGET_UBOOT_VERSION
>  	default BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION \
>  		if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG || BR2_TARGET_UBOOT_CUSTOM_SVN
>  
> +config BR2_TARGET_UBOOT_CUSTOM_LICENSE_FILES
> +	string "U-boot license files"
> +	default "Licenses/gpl-2.0.txt"
> +	depends on BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG || \
> +		   BR2_TARGET_UBOOT_CUSTOM_SVN || BR2_TARGET_UBOOT_CUSTOM_TARBALL
> +	help
> +	  A space-separated list of license files related to U-Boot
> +	  package.
> +
> +config BR2_TARGET_UBOOT_LICENSE_FILES
> +	string
> +	default BR2_TARGET_UBOOT_CUSTOM_LICENSE_FILES \
> +		if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG || \
> +		   BR2_TARGET_UBOOT_CUSTOM_SVN || BR2_TARGET_UBOOT_CUSTOM_TARBALL
> +	default "Licenses/gpl-2.0.txt"
> +
>  config BR2_TARGET_UBOOT_PATCH
>  	string "Custom U-Boot patches"
>  	default BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR if BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR != ""  # legacy
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index c92568a559118bda16622731aa3a90904435a8e2..db12c835fbb41ea96344e1056c9f3d25b6e4cb69 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -8,9 +8,7 @@ UBOOT_VERSION = $(call qstrip,$(BR2_TARGET_UBOOT_VERSION))
>  UBOOT_BOARD_NAME = $(call qstrip,$(BR2_TARGET_UBOOT_BOARDNAME))
>  
>  UBOOT_LICENSE = GPL-2.0+
> -ifeq ($(BR2_TARGET_UBOOT_LATEST_VERSION),y)
> -UBOOT_LICENSE_FILES = Licenses/gpl-2.0.txt
> -endif
> +UBOOT_LICENSE_FILES = $(call qstrip,$(BR2_TARGET_UBOOT_LICENSE_FILES))
>  UBOOT_CPE_ID_VENDOR = denx
>  UBOOT_CPE_ID_PRODUCT = u-boot
>  
> 
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
