Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815C2CAC586
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 10:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A5EA61CB3;
	Mon,  8 Sep 2025 10:56:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 29cPKDnsSXWh; Mon,  8 Sep 2025 10:56:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 920C861CA0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 920C861CA0;
	Mon,  8 Sep 2025 10:56:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D1D3C186
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF13F61C9B
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:56:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tnwRRpMFYDSg for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 10:56:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CFA0661CA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFA0661CA0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CFA0661CA0
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:56:03 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45dd513f4ecso23857515e9.3
 for <buildroot@buildroot.org>; Mon, 08 Sep 2025 03:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757328962; x=1757933762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zfU78S5u5reeSADDz1poLIN6wlAVU221SClKgYi9tv0=;
 b=cF2yOo5phKf6qaMMhWFGGPnfoN76jAaUsFQ2ENkN+l8qCUivWUBiet/7wsXEWSQkwK
 aN2gkLkskYqWvUl4d8aYZS1Vph2oG37g5lZGk+CMWCpmTQWwLgkWShujDFmjySu9VDLC
 ZrLDxIpMf1bnOfhK4CefzXK3M3js7g+jV9VYWjRWA16dysQ8ztVufpTTgUyTmPJzwEEV
 ObWJOC4BA+rmBXKqD6pGz8MOz49VvoyqJWHrLKT7zFGWghKPTez+wgdBk9KqiiSy4FNq
 /pRqZcIrw+i+1YXiPHZKVN+Ki2RFUW8KtcWflovIbn1J9VHHE7HTjWTV7ja8uND522XL
 RLsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmubZBkLOFLxWd3XUS3XsTFTM7lXphgwkxH+wX036Y/JPCvOMXF27hlRHsR3xf1by8ivlVzyeKB8A=@buildroot.org
X-Gm-Message-State: AOJu0Yxy1L2sJCVxYY+mMxDB03BXTmLIEL9g8kl/hEdFZTC44jitgB2O
 MXQdFDXZvU85nzPNbBYl3MhPAvzBliRd2i36aQoPvdVrl5rQ5/SUfIMlgBnuhK5jTEg=
X-Gm-Gg: ASbGncuuCDYnsqq2/roiI41cYhmxvY7EgdbPV2ZK8RF1hK9DjI40rJPzUtzOy5xiJl5
 XHvGxItL8P1tY7a2MBK/3/kHEhV8vPv3EfzCUfwzC5UUOsO5qkz04JwlnFkBmOMMu2hvjM2b7m6
 p6PqmXdpj6SNzNH65QMdIel3fAUEySROzCHQzmh8ZOnFMf6dVuGa/475hApZR1WANsEJiQzzizL
 etwUYdrkIbiHel1m+px49hzCXrKAZd+GvVq5NWLe/uFpZC+Zq2VLhj/jBRx4OxAnCoDd84qr8R8
 CKuU+VQO5wAa9mSnpwSl9Q6gD3QBAIzNkKal3csTdKF//9GME/oQYft6VIOhUVBuiFbQ+iB+3MM
 vQiOjYl/I2l5Gu6O98n3bCCdkhH2DgyLAH6C5aYddp9BWBetk4Gon0tmQCx/ZMyd5wDA48S8dIZ
 JxG9xXIDBjCF4QJ2OyRF33sbdn0wIOgJYaBTA=
X-Google-Smtp-Source: AGHT+IEFeKQQ5Zc/o2rtkn6t49iJXHX+zP0SLADdjzykBgG9qFRkJrJ4zjE7SDV+jrHtbOczejkH4g==
X-Received: by 2002:a5d:5f96:0:b0:3db:a907:f173 with SMTP id
 ffacd0b85a97d-3e64317f390mr5438122f8f.33.1757328961816; 
 Mon, 08 Sep 2025 03:56:01 -0700 (PDT)
Received: from sah2lpt241.local.essensium.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e134cfe923sm15902943f8f.34.2025.09.08.03.56.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 03:56:01 -0700 (PDT)
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  8 Sep 2025 12:56:00 +0200
Message-Id: <20250908105600.682136-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250824171822.4123094-2-romain.naour@smile.fr>
References: <20250824171822.4123094-2-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757328962; x=1757933762; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zfU78S5u5reeSADDz1poLIN6wlAVU221SClKgYi9tv0=;
 b=WDNn+sJaWwvmnr/RVCIAjZYhW5FTNN7dT/16MSuLHTH8n2+6jk5InFoLO1SpxUxd7s
 T+aKjGpm8Gis0F+7H4mECEUnNOi6kfNrUcu4ba+de+6W0zNR0gs5SJUuBIRR24Q2jmbP
 at5a3D7ZLYVmz/z7qBv5t/txGTMFsSyoFKvcu8jSV3vDzGZDTkNLtsK0JIJskx2sfgYV
 F+Lfkcx1GNlOLxUth6V7kc6fgvbGELPqduR17Yh/wZJlRcmvhO2lnBeICgogbw06uYlU
 2bVv56ufAipc5IHwuXbnQKrijf20u+xq3nPAxMZvfJIDdW3BrUtZwNGJDUrtJJbkEV1U
 UnNA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WDNn+sJa
Subject: Re: [Buildroot] [PATCH 2/2] support/testing: TestXvisor: bump
 custom opensbi version to 1.6
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
> Since Buildroot commit [1] "update to Bootlin toolchains 2025.08-1",
> the TestXvisor fails when building xvisor with gcc 15.1.0.
> 
> Since xvisor is now fixed, opensbi 1.5 fail to build with gcc-15 for
> the same reasons.
> 
> opensbi 1.6 include a fix for C23 enabled compilers [2]
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/947dbc92a20c5acea7882166cae7893e6ea661e1
> [2] https://github.com/riscv-software-src/opensbi/commit/d539d64a23bbd64ba324eed595449bcc9c7be0cb
> 
> Cc: Julien Olivain <ju.o@free.fr>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  support/testing/tests/package/test_xvisor.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/package/test_xvisor.py b/support/testing/tests/package/test_xvisor.py
> index b1b7d1a5e0..6872e22db9 100644
> --- a/support/testing/tests/package/test_xvisor.py
> +++ b/support/testing/tests/package/test_xvisor.py
> @@ -16,7 +16,7 @@ class TestXvisor(infra.basetest.BRTest):
>          # BR2_TARGET_ROOTFS_TAR is not set
>          BR2_TARGET_OPENSBI=y
>          BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
> -        BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.5"
> +        BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.6"
>          BR2_TARGET_OPENSBI_PLAT="generic"
>          BR2_PACKAGE_HOST_QEMU=y
>          BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
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
