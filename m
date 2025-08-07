Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36820CA0EC0
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B593580D7A;
	Thu,  7 Aug 2025 18:24:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QcDZ_ZKBP_Qw; Thu,  7 Aug 2025 18:24:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1C8C80D9C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1C8C80D9C;
	Thu,  7 Aug 2025 18:24:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B5C84C6
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D87140087
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y_XIc_7ZFD05 for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4DE5F40057
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DE5F40057
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4DE5F40057
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:01 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-458b885d6eeso8460195e9.3
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591039; x=1755195839;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iu7tyeBwNQ/NaDt+ESOVJzL/s3FhS7JiqRTx+PNeyWk=;
 b=gwtgKmv/mfN6pxUh/+tNot9maoMHUU2Mgl1ehvfyXMdIhGafLPZpj4oV2/fCqhqynh
 EnzsnTut/PT4s8SmyT093JgnOjpmCOUt52VlvlUJtZqeUC3jr7hmTBdM3NusPMFIvvSg
 nYGGxwc/zR6OJOMIsbZWCApCzMhOJ1og9qy18qYpcq2M+74saDcM+F5+WQh6W31zRAzH
 qyJSTNibAjqh2USiAv3+TyOhW2E+m4xDyVC0PtxbuSerxajuLkeztJoR9jp4Fll9tgAk
 y1ftu9rDnakuSGKk9T8nOrf6oxLgRrhPgCrFsCqDnnQqqXD5L7PfBOgO67XL2dM8cIv3
 zhzw==
X-Gm-Message-State: AOJu0Yzwp7kMY6xgVY6HtxxxXpiF+UUCWPRBgkRpU2V+njMHHzFGyUym
 9tQFxw0+RPCyBuT0uG/QlrJKTVVXvoRXIYoRK8y0C+wjqf+l13Q0j1liJgN5WxRla6dAtCNNWvG
 cHPxC
X-Gm-Gg: ASbGncsJMzD0cSY9+RBtxoOzN3Jf7wXSiXxhJlgDkVpOGiqA6CawpQ4YzYN0ABZHzs8
 iPGbsKMxu0Rg+RD+/qTbmNgpg6ztum5vIkmg2GUz+bA2yhtBooX2Qxo2X5GZatSG69VK0g67o+U
 DeeRhm5/IUvDzukQTF1wumgmtA2tQsF/wQj8jbFfIOyKMEoTTH/JQ6jYjZ19fIxPkahkhjetuOT
 qA50fdPlxdXqr2x6l5DmDKXkNjhYF3gooWBkG9xwnmh5twxaHaoSN6wBmk2RIKcE9HrSdgkKu6I
 wq/VK3XPuxU0bmkRbO3tGJiHPfsylQPQlykNFogkPQStOH+/0jnFbcaGSL0AiNy510Ti6WMRsFD
 HUQboYqmM9PaGMQ==
X-Google-Smtp-Source: AGHT+IGXtw61kk8NKUcc+QPCt4RkIGPqeCPBht+tBVouQkBsnJUk2kaHOSee6Kmn7xWBq+ox2TA0Mg==
X-Received: by 2002:a05:600c:1c92:b0:43d:42b:e186 with SMTP id
 5b1f17b1804b1-459f4eb1070mr207795e9.8.1754591039148; 
 Thu, 07 Aug 2025 11:23:59 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459ebede65asm57527145e9.8.2025.08.07.11.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:23:58 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:23:58 +0200
Message-ID: <20250807182358.724024-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714081749.83051-1-thomas.perale@mind.be>
References: <20250714081749.83051-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591039; x=1755195839; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iu7tyeBwNQ/NaDt+ESOVJzL/s3FhS7JiqRTx+PNeyWk=;
 b=Sqz8ljbmTDrCQMN5zCwSOozIhZlPNkpRRGAa1CbF8v9HpUwkoFy9jsRJ+GUn0ZYuyK
 2cvrfPfhjD3fpbs6iXz4rVKK7k+j5B5K20TPwLG/tU65AzbI95iPxVjxg/x0cuqi2BnE
 LihbCfWwEepLTC8cUtl6KMwasoaSdRDjoZsOWTreg9CjaRTWBK6Con7dDOQXJznWhAZ4
 k7jfuCaPB1hFxsn78geIcLujTXShcdjw3M+3VtkTTfYLml5nwIR7aX9MagxHAyMwRyR9
 TnrR983QcpOL0KVkcJuRXlnytAoyH2oMgZ+XXtKz99oM9xoHa1CwwjwuEvE7mOsSXL55
 /pFg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Sqz8ljbm
Subject: Re: [Buildroot] [PATCH] package/libesmtp: bump to upstream version
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
> When building libesmtp on the autobuilder, the following error occurs:
> 
> /workdir/instance-0/output-1/per-package/libesmtp/host/bin/arc-linux-gcc -Ilibesmtp.so.6.2.0.p -I. -I.. -I/workdir/instance-0/output-1/per-package/libesmtp/host/arc-buildroot-linux-gnu/sysroot/usr/include -fdiagnostics-color=always -Wall -Winvalid-pch -std=c11 -O3 -D_POSIX_C_SOURCE=200809L -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -g0 -D_FORTIFY_SOURCE=2 -fPIC -pthread -MD -MQ libesmtp.so.6.2.0.p/smtp-api.c.o -MF libesmtp.so.6.2.0.p/smtp-api.c.o.d -o libesmtp.so.6.2.0.p/smtp-api.c.o -c ../smtp-api.c
> ../smtp-api.c: In function 'smtp_version':
> ../smtp-api.c:1183:7: error: implicit declaration of function 'strlcpy'; did you mean 'strncpy'? [-Wimplicit-function-declaration]
>  1183 |   if (strlcpy (buf, v, len) > len)
>       |       ^~~~~~~
>       |       strncpy
> 
> This error has been fixed upstream in commit [1], but no new release has
> been made since.
> This patch update the package version to fetch the latest upstream commit.
> 
> For the changes, see:
> 
>  - https://github.com/libesmtp/libESMTP/compare/v1.1.0...335ee8d2fa5cb7d30db7b818ec05563ad139ee2f
> 
> [1] https://github.com/libesmtp/libESMTP/commit/972eb547493357681b1b7012ef20618e6831cfde
> 
> Fixes: https://autobuild.buildroot.org/results/ced/ceda012506edccda1727904eb3327017b07e27d8
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/libesmtp/libesmtp.hash | 2 +-
>  package/libesmtp/libesmtp.mk   | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libesmtp/libesmtp.hash b/package/libesmtp/libesmtp.hash
> index 596ed4eaca..ed301257df 100644
> --- a/package/libesmtp/libesmtp.hash
> +++ b/package/libesmtp/libesmtp.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated
> -sha256  32bc3614ca12d21c7d933f32d43410e8744b6f91fdca7732da9877a385e4e6c3  libesmtp-1.1.0.tar.gz
> +sha256  144aece0077db6a2bd655d3d9558c714c9defd30a2d52c6e85ed54457d712daf  libesmtp-335ee8d2fa5cb7d30db7b818ec05563ad139ee2f.tar.gz
>  sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING.GPL
>  sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  LICENSE
> diff --git a/package/libesmtp/libesmtp.mk b/package/libesmtp/libesmtp.mk
> index 6456e83e10..e861ad4ac6 100644
> --- a/package/libesmtp/libesmtp.mk
> +++ b/package/libesmtp/libesmtp.mk
> @@ -4,12 +4,12 @@
>  #
>  ################################################################################
>  
> -LIBESMTP_VERSION = 1.1.0
> -LIBESMTP_SITE = $(call github,libesmtp,libESMTP,v$(LIBESMTP_VERSION))
> +LIBESMTP_VERSION = 335ee8d2fa5cb7d30db7b818ec05563ad139ee2f
> +LIBESMTP_SITE = $(call github,libesmtp,libESMTP,$(LIBESMTP_VERSION))
>  LIBESMTP_INSTALL_STAGING = YES
>  LIBESMTP_LICENSE = GPL-2.0+ (examples), LGPL-2.1+ (library)
>  LIBESMTP_LICENSE_FILES = COPYING.GPL LICENSE
> -LIBESMTP_CPE_ID_VALID = YES
> +LIBESMTP_CPE_ID_VERSION = 1.1.0
>  
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>  LIBESMTP_CONF_OPTS += -Dtls=enabled
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
