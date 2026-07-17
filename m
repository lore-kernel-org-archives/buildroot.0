Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A972EC4451B
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5398040BE5;
	Fri, 17 Jul 2026 15:47:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1O5RyZMDN8-h; Fri, 17 Jul 2026 15:47:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF09640BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303272;
	bh=fKfJlH7HfbVAgOPtRCMDoibu0eg7a+zZ1WfnbCf1C1M=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ejoJYzdW1EI90+YSw5na3AUQI6ma+JtxDY0q/iPzf0Ib2RDLzJlp+J2hHJneqvn93
	 qZoXcJ2Td5bi4tSCER7T9CcyL5bDABgTWZwTumct3UEeeqBKb0QuFaPreNgnV1Ourl
	 dGsw/JS0HtIlGfqGMnCi2ft/lEGypb5DcSUngKTZ0C2MkoNzsZGRb6fFv38g5s5IQo
	 y4FWPCnd9buVI1EjM/OPp9bxN9MZ41YIr8QGfN02MUK0wRe5Uy2AcWKUh3e9X67Mtg
	 u4XPYWZUL1PbuUNNBpIt24PCLdVh2J5cCook4pKFwduKDexDtOOM2zrJen0Hn8cD90
	 +gtLpSMqNbE2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF09640BC0;
	Fri, 17 Jul 2026 15:47:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4ABDC1F6
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 309028121A
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HOPZG6hNAzdV for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:47:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 17BAA81216
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17BAA81216
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 17BAA81216
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:44 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4953ddae026so22048695e9.3
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 08:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784303263; x=1784908063;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=fOWNBLSREfys3qiq6mMg4xp6SnwrpXE90POy5cSp8zo=;
 b=KryBFsXXXzVBcUUIz825krqEvYsRKqPVfh6/S/b4QLKSAI/1oGV2rVn27iNEdZomlR
 A7z2JOkHCZ41eBWTOlWElsPNGqp6mUz8+8rPGa5RbI67D81AI3suy5wolaEPnb3MW409
 OgiiuC5FwH616tKTBzqtHsYx9Ct4PazqkWKh+xhUogD2lRLV8ErtDmMqPp86UvjVPcDD
 HCFUf/9R3HUTKhKsUp/3SvdyF+GWvkDUVi3WHf8XpuG7Ezqv0BRhOolWJs9S/c9KioVa
 pHZ3eigK++Fbjpf1Eu1avG15817MsHPNM0aMyws+jmiNZlxH+4P78iOrCyTZTMzb2PMz
 f+4g==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr6Oydmr/X3fuHIVcsAJgEFq8t8GzhnXq5ZI4wJ9wnz/8VQmMbLTE70sePdjq2qqj1cgnrC3Y9Mzz0=@buildroot.org
X-Gm-Message-State: AOJu0YzxET/SnQpagTtEL6JYzCl59lQ2ovpAo/LtYsjga4pP50LVMitn
 tcWs/IoD4wN2RAzTzbVl98k6pIjaiJi6YwgZnVlq+pfuHZ3m6EoRQrIxyRefEqhcEDDGcKY/WdB
 MhzHj
X-Gm-Gg: AfdE7cnQ+UFyfeyDks2RMosIPjTXnwoKcs5rxDuG3yjWgr5PlaLMVcn8lCkNkei+RGU
 NVIreJd65zb330A9EfGTRRpkzOmx1XUScoJlcLb9niQ9ZfKNTf8COvGz2v8sbtiDR/Htp1WL3QT
 EWKzL2XqvRuxDRzwUgWuwMCQfwNkQ4atzi0ONATiPlkV65tKZEy1fO9ahhZFjtivk0pgGYMCyQA
 R5xYmJT/7/o3/ypfe+BhsvLPClFovGjirzI2WKNZLaGP5Rmbd22wY8G5AqUjhIt0uYBKec1y692
 bRt6R4CX/hlVkNRPxKCZFpPwiYqrHOWYXQzGkZi99RuZsmCd0CFYoO4ndgvBiRxgbKF73lUrR6n
 tkH9hEFZirhB+7BquLjtQRCTAbvd9cGJpzmzfhIZC8qG0FGZTuwWfwxwuL1INrsJK70gs36E=
X-Received: by 2002:a05:600c:19c8:b0:495:43ab:4f78 with SMTP id
 5b1f17b1804b1-4954a3d0ad9mr37869065e9.7.1784303263041; 
 Fri, 17 Jul 2026 08:47:43 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4954ba2abd0sm36817545e9.15.2026.07.17.08.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 08:47:42 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Jul 2026 17:47:42 +0200
Message-ID: <20260717154742.192487-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260712113058.1579954-1-bernd@kuhls.net>
References: <20260712113058.1579954-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1784303263; x=1784908063; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=fOWNBLSREfys3qiq6mMg4xp6SnwrpXE90POy5cSp8zo=;
 b=T4VIF98+0H5IiYqwDZKfzs0Thfs25zQxrgiOOyCsyo4fmZeiYr1tpu+dwsVz+yRyRp
 u0sPjVbmXXbXjA/v7TjR9B0CRxHbg4R2wC5VxMI4plBE/G0r4CoERFqjMeDUjX614woC
 x4H7vJ0kePZMdruwNFAYgj8EM4xuJxqur5VkgGT+0q02DQ8bDD1SrBf2+k7G0D7qgXFZ
 Hps1NKmB5MaZcg1oduPfLoZ/hRWCFn86Dv8Tq5CU3ULNGl1TtqiQb8yEaf03sa9LmC7R
 aOgLqZ+T/jQt/J1i5NugYOV6Ozc9wMFMEk3q1kVB+cxicWIUbCfxILTyfgBD39JSsMbG
 wqxA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=T4VIF98+
Subject: Re: [Buildroot] [PATCH 1/4] package/x11r7/xwayland: fix uClibc build
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
> Copy patch from xserver_xorg-server to fix build errors with uClibc.
> 
> Fixes:
> https://autobuild.buildroot.net/results/c03/c03d57ad7ed3feac008091a38ea50bfccfa62b08/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/ac5c6561894d41b86a43af13c4a5af16612c9195
> https://gitlab.com/bkuhls/buildroot/-/commits/9c78a853c88fa85f7a31404b4ab324370cf049f6
> 
>  .checkpackageignore                           |  1 +
>  ...0001-include-misc.h-fix-uClibc-build.patch | 31 +++++++++++++++++++
>  2 files changed, 32 insertions(+)
>  create mode 100644 package/x11r7/xwayland/0001-include-misc.h-fix-uClibc-build.patch
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 6147f35b03..4ec39f9f36 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -971,6 +971,7 @@ package/x11r7/xdriver_xf86-video-mach64/0001-cross-compile.patch lib_patch.Upstr
>  package/x11r7/xdriver_xf86-video-tdfx/0001-cross.patch lib_patch.Upstream
>  package/x11r7/xserver_xorg-server/0001-include-misc.h-fix-uClibc-build.patch lib_patch.Upstream
>  package/x11r7/xserver_xorg-server/S40xorg Shellcheck lib_sysv.Variables
> +package/x11r7/xwayland/0001-include-misc.h-fix-uClibc-build.patch lib_patch.Upstream
>  package/xl2tp/xl2tpd lib_shellscript.TrailingSpace
>  package/yajl/0001-Let-the-shared-and-the-static-library-have-the-same-.patch lib_patch.Upstream
>  package/yajl/0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch lib_patch.Upstream
> diff --git a/package/x11r7/xwayland/0001-include-misc.h-fix-uClibc-build.patch b/package/x11r7/xwayland/0001-include-misc.h-fix-uClibc-build.patch
> new file mode 100644
> index 0000000000..562aa79fbb
> --- /dev/null
> +++ b/package/x11r7/xwayland/0001-include-misc.h-fix-uClibc-build.patch
> @@ -0,0 +1,31 @@
> +From 2e8fca00f5bdb02f2f59aaa428d1e9d808ab0e86 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd.kuhls@t-online.de>
> +Date: Sat, 16 Jun 2018 19:20:16 +0200
> +Subject: [PATCH] include/misc.h: fix uClibc build
> +
> +A similar fix was used for Dovecot:
> +https://www.dovecot.org/list/dovecot/2017-November/110019.html
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +---
> + include/misc.h | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/include/misc.h b/include/misc.h
> +index 14920c3c3..390e52b60 100644
> +--- a/include/misc.h
> ++++ b/include/misc.h
> +@@ -185,6 +185,10 @@ typedef struct _xReq *xReqPtr;
> + #endif
> + #endif
> + 
> ++#undef bswap_16
> ++#undef bswap_32
> ++#undef bswap_64
> ++
> + /**
> +  * Calculate the number of bytes needed to hold bits.
> +  * @param bits The minimum number of bits needed.
> +-- 
> +2.17.1
> +
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
