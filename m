Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A78C8303C
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0C0F61507;
	Fri, 11 Jul 2025 10:45:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GTKOC8Gy92zc; Fri, 11 Jul 2025 10:45:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3EEB614FF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3EEB614FF;
	Fri, 11 Jul 2025 10:45:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1324C199
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDF5840510
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iAzYBOk3nCRm for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:45:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1612940094
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1612940094
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1612940094
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:00 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-60dffae17f3so2864634a12.1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:45:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752230699; x=1752835499;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7Hgy1kNLIkVcxPnpj77IGM90Ub3EULChT6NTal3CY9Y=;
 b=P/N0sbybBRX9Q3WOoEkR6jQ2pkCkCNHcPTSiX+UBLpilV9TXW9Z1Kzf+6wUa/mXoiB
 xGWHdccBwBu/JN3V9pfPBodisWPrFt02zVfs81Bajh6waGs/ArxelKn6zIqCcOPu2CKR
 xKQi/8xto2jKv+rwrkEXKqN8dQb8BdVg98vUF6OCZ2LZkHtGyizxxN9yx3rqibhnCZRG
 gLAEMH2yFK/F9boI7ic5LChhfYX68ShMmb+3PT2AXZBGT2TXc4T75OCum+iC4Biswufd
 vGkplR6UrgYRVXLE2qdeigjXWHMp04NjVNriVg7SvL4r7vIvNbJGbIS9Y44h6RCeVWb+
 nV8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQJPzstn40ge4o0rCot2L9zzBVSDM3mkfO6K2DPCCjrFoPWodbI3XmcG2gpVuuBEO0yn/fSh5eEEQ=@buildroot.org
X-Gm-Message-State: AOJu0YwpcppYSYA+KNcJiMoKM/YuU1c6c2l1hAm3gT/+K0rjQE6JgtQZ
 SVt/d+JJMUPy4ohqg6YYZzUQupbHh1Ou/XhrkzwdozvRB1RW3uZ1Xvq2dCwUolYkaa0=
X-Gm-Gg: ASbGnct7XLpZswnRXENL6rsfv/amLB3LDc/y3NVmeFbeC2DfEkae/3Z0ynK0IaHplFU
 +krOL5Tb7pDTk2MXZBm7Gl0UjWhtMUuFzb/lWLt21kChsi7ozwY8R6xAYjUhjWJ7Xe2CbTbZFjW
 fDjEOAwtVzLxpQW1+IuDPMKO9dE1oQrBTLZczS+2qSyIvnnJY4OkiDJ8tCz1EbYh2iJeVftHAdZ
 hXbjj3H06rWeArcWlShez6hruOWfXUefqYgPr+S8v4qer/ESma1Eyh0egtJ3+hmX3WqtPi0Td1Q
 vv1WFcOWhnxH7eLyhxTb0VhpeM9udv46RHIw3+OJdJkFVjVWKnkXa43H0VmBIFkcGY9vcUz7zpQ
 v1u6usO5BJ/tHjugl9MxPpK0a
X-Google-Smtp-Source: AGHT+IGBDLFx52HKm7aLJ42sIrARq9TtdIbY5j00I6Iev5FQTqYXhuYXIzQinnCLz2a8pdsZVTc0cA==
X-Received: by 2002:a17:907:1a4f:b0:ad8:a935:b8ff with SMTP id
 a640c23a62f3a-ae6fc200bcfmr165844766b.31.1752230699003; 
 Fri, 11 Jul 2025 03:44:59 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e82de902sm278325966b.147.2025.07.11.03.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:44:58 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 11 Jul 2025 12:44:57 +0200
Message-ID: <20250711104457.824252-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250703210056.1519541-1-bernd@kuhls.net>
References: <20250703210056.1519541-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752230699; x=1752835499; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Hgy1kNLIkVcxPnpj77IGM90Ub3EULChT6NTal3CY9Y=;
 b=XnFFWf+E61IAIKJNkE7efaZ8kQWRkYuDTUhOFDk562+AUWrU80ylYzH5AA8mivth++
 g7uSZ4uHrwxZ4DjVwvO5pUORUiPMhPptsC/HQc1MOELKdUCS5pJpcOIuxJwagTt2MEtf
 md+ZyZ+1DbOIkwSg755Gi0m9sZqcv1FRWwL+E+XezdViLYp3h5pdbK7lwaxmXvrqSSLH
 0FFBltP+BPMRV2I4hd6hUi/vJOxVUjrbQ9LMABS2tgjD8Z9rPT5vXNfEulIeAqkbAjuu
 tSK2Jk/3jpGoibGQYddayW0dLzfZ+RyVrVKeALe/xKAl34MIylMxCIubdLC3bBGaBJCf
 q4kQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XnFFWf+E
Subject: Re: [Buildroot] [PATCH 1/1] package/php: security bump version to
 8.3.23
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
> Changelog: https://www.php.net/ChangeLog-8.php#PHP_8_3
> 
> Fixes CVE-2025-1735, CVE-2025-6491 & CVE-2025-1220:
> https://news-web.php.net/php.announce/465
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/php/php.hash | 2 +-
>  package/php/php.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/php/php.hash b/package/php/php.hash
> index 4260c1e5f4..29162bd008 100644
> --- a/package/php/php.hash
> +++ b/package/php/php.hash
> @@ -1,5 +1,5 @@
>  # From https://www.php.net/downloads.php
> -sha256  66c86889059bd27ccf460590ca48fcaf3261349cc9bdba2023ac6a265beabf36  php-8.3.22.tar.xz
> +sha256  08be64700f703bca6ff1284bf1fdaffa37ae1b9734b6559f8350248e8960a6db  php-8.3.23.tar.xz
>  
>  # License file
>  sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
> diff --git a/package/php/php.mk b/package/php/php.mk
> index a049d90fde..b431d839fb 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PHP_VERSION = 8.3.22
> +PHP_VERSION = 8.3.23
>  PHP_SITE = https://www.php.net/distributions
>  PHP_SOURCE = php-$(PHP_VERSION).tar.xz
>  PHP_INSTALL_STAGING = YES
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
