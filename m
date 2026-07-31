Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE6AC5516D
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 12:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C96760B48;
	Fri, 31 Jul 2026 12:21:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fos0M00DX5xT; Fri, 31 Jul 2026 12:21:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FBDD60B38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785500505;
	bh=XZpoREWDgSLTbFW36JsnRi4a4A/qAj4PQkTx8+IDi7Q=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=G5wvQxKSumCzmvIfjDi65KFE4SPiDnm4pjA9rYxAJrH7w8hdUS/KVhqdJelc+GK8a
	 VXgbWe9xdn2oax9imOKguWssToEi+kq4dU3lPq6MLFzDVj6fZeYg/jQCB05g4EWSiK
	 K+vuTK23iPiggob64h2mX/tpYp/252qr2ANAf0KslZUetq5OlTsFKWFbFqLHltrkiO
	 xi1ynvvZ676yGvliblVblKw+yXzmG4R5Ld4dLvW7jD7NdGV4nB2CUD+1DHADqJZhxU
	 fpgd5r67jEd8wasppQKtJoN6zkNS2SBwNwosBJrj0ffyTcMmjgZzke3LfzGPXh0S/B
	 wQjeSWv8r7DDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FBDD60B38;
	Fri, 31 Jul 2026 12:21:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CE112E9
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02DC640470
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:21:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QKUm4Pzicpxh for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 12:21:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 14B3940463
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14B3940463
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 14B3940463
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:21:41 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-47c2b362ee2so868237f8f.1
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 05:21:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785500500; x=1786105300;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=27g7MAgIoTKVtjM5qSlYHT9A8NwWTFAIFN1/QdkXm00=;
 b=bVe7svCBiqfsliI6tuHM3TnDnAKV2NRU8WQPc67G0KeTX3iorMmquTz5PCWXsiw9fh
 yF6m09PpJmk5/2LO6ZntOnOPhnm8DVjxhPfjS94LlbsBrue1WkWZfxKdMJwzyW7Kwomk
 mXxoRlBSPctkniKSvsO/dopyFqfkdZCugSYX+zIoJWHlbJVwRgMGdqFr1FbDLHGTKFdF
 NVcuBJ5Op8qg+wYaNW7hsc1F/0MSEF9q8qRewEPiG5R3NPPK719zTOTeFrRsvr3Hyn9T
 56P/dL9QaVY8SvCoeB9JrjtgoGpLv27t/ArnEqrTdmw6bJWrV/zNbKDAodZXARnYYGv0
 so+g==
X-Forwarded-Encrypted: i=1;
 AHgh+RrcZ+bmeGeqcBm2o93bTJy5v48QLVmNTgbx0GiGLRdaBLd3Ya/IXZ3JKGuJmvcMPZXdxMELi9ybtoE=@buildroot.org
X-Gm-Message-State: AOJu0YwpdN/FAxzYQTStMAb7PEn51FqvAZGybhAu5IRx62ZN7qg6o//g
 Samib7wvde8KjTipgy0+HF2ufOccEHDz4bsWQjpIE5en7pLoZfTJCo4SC9duGTUhJDUIaxJv9XH
 0lBQ1
X-Gm-Gg: AR+sD11BdKRW+pyRb4REs8QA1eZYzOobyVC7Wlnr5NuWRo49kTnHlJHP/zdJzZA4T6K
 rqEPdxkLDbOLJ8KKmyXoyqUoMo/78QbG/AdwrjXYJMXtCc7TN0GZ1/7MRg8YTAx/1fLV/IYU2RL
 Mcd3g5aYJbA3a3Ka8wlBpwfNLUCmUM9L8snL+lYZJ6upjF5M0AwjdbAPt8XmAwZbvm4sBzIWwMA
 5bq7Jui6KUWYZWBrquB4u4Xw8GNvVh6tNYf7Xiovu3IrY16u63vYcicz8/nUnl/io3COulKGzpU
 pS7QERIpJPQ8tWhXx4ZfX3slCgndGXBAHcNIxfAkUbzAHjFcI4SVQv9jzQkK72TKU8kkXz6dWe6
 /WO99qXmuwHrjuPBciNQ6th+B4oNjb0aP/B4uqVbpMhhHSHoPLrdrDKfT1RDKmG5PsYWQh47ZcH
 6vcWkYUGwRa2L91f8J1wet9cXBw8xyPnNfRag3JtCpfp0kytKHaEGM+YgSm0sJmYy36c+xdhmK+
 qgrldM9d+n9vdcVwcIIQg==
X-Received: by 2002:a05:6000:2c07:b0:47f:7005:285e with SMTP id
 ffacd0b85a97d-47fd2b67562mr3915830f8f.53.1785500499919; 
 Fri, 31 Jul 2026 05:21:39 -0700 (PDT)
Received: from arch (213.219.161.200.adsl.dyn.edpnet.net. [213.219.161.200])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd456262bsm3805858f8f.17.2026.07.31.05.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:21:39 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 31 Jul 2026 14:21:39 +0200
Message-ID: <20260731122139.155229-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20250616191419.3479584-1-bernd@kuhls.net>
References: <20250616191419.3479584-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1785500500; x=1786105300; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=27g7MAgIoTKVtjM5qSlYHT9A8NwWTFAIFN1/QdkXm00=;
 b=hgTniNBVLYAHf9wSozGwfLYWBkD3PfLtVpDLe9bjZky/OhhZS3DnP8J9ewRwXY/fCJ
 bwtw5dhm8jwK1VDpCVUD86vw9aRe+fjwBexdrgsBvxT2EZWFWA6w3KIzGKdZxASX+X/W
 B/kiMWBzmG0rSkcCIzgYv01TKlgMQ2zjGtiU0SPmtA60HaJV/NR4dTC+x707goDB6A1+
 e8naqtUDzo+0qRhbe/NS79vwl0/QjWwSeBTVrmC4lON7sWAwItT72gn+GEniVb5J/jed
 9ukUTIfGbM6IlKhdTQQctB2CQxbU8Filh6i+xIjSQTZ9Mo1Zn99UlmjoeXBkyC0Oj6Dv
 lfhg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hgTniNBV
Subject: Re: [Buildroot] [PATCH 1/1] package/libass: bump version to 0.17.4
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
> Release notes: https://github.com/libass/libass/releases/tag/0.17.4
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>  package/libass/libass.hash | 2 +-
>  package/libass/libass.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libass/libass.hash b/package/libass/libass.hash
> index 2f6b554e3d..2f4f718813 100644
> --- a/package/libass/libass.hash
> +++ b/package/libass/libass.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  eae425da50f0015c21f7b3a9c7262a910f0218af469e22e2931462fed3c50959  libass-0.17.3.tar.xz
> +sha256  78f1179b838d025e9c26e8fef33f8092f65611444ffa1bfc0cfac6a33511a05a  libass-0.17.4.tar.xz
>  sha256  f7e30699d02798351e7f839e3d3bfeb29ce65e44efa7735c225464c4fd7dfe9c  COPYING
> diff --git a/package/libass/libass.mk b/package/libass/libass.mk
> index f198ee89f0..ff42c6d621 100644
> --- a/package/libass/libass.mk
> +++ b/package/libass/libass.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBASS_VERSION = 0.17.3
> +LIBASS_VERSION = 0.17.4
>  LIBASS_SOURCE = libass-$(LIBASS_VERSION).tar.xz
>  # Do not use the github helper here, the generated tarball is *NOT*
>  # the same as the one uploaded by upstream for the release.
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
