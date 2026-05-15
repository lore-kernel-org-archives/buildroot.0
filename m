Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB576CD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C46F940C1C;
	Fri, 15 May 2026 13:34:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E3lxxW_ZfcsV; Fri, 15 May 2026 13:34:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACC0440648
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852066;
	bh=z2z5z2mtzTovhoyx7/FF2qQ4KpE5G4Dd/Dvf6y403vY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oqMy3Wn8wIL5l8Cg7n3mbikRYqIjT2aW5YcSM1QawyeQTQV0c6Uek4y4DuONcmUxX
	 ukS3ulU+f3eQW+bC9wr8EXzIQMP19J5aTA/NHPWEJQCagArBbgsjT9r/mJsX56eBHm
	 qfNUzxOr0zWppTBkIjIJ2QLydy9x3A39YVqVlLlMngmI4m5ixYDu7RBBZBcKMkb2gn
	 +PoSLdkmVvh6g3SPX31Pkv47OptEQ9MzHFnXz7n/iGfYjx3cTht8Al2mv+znw5bWPd
	 AlcrqXRIT8paJTHmnFZFbixpsP9CAAUPkW1vlIa8/XZRKCnY0Tsa7KxCSG3TNwMFFf
	 Z50X0RbhYjRTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACC0440648;
	Fri, 15 May 2026 13:34:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1356036F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2B5240DC2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v-WvbS8e-09N for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:34:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 515A94112C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 515A94112C
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 515A94112C
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:20 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-488ff90d6c7so80215805e9.2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:34:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778852058; x=1779456858;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MI9bd9uz/H/PRPxcz4b6zYvuuFLeRZpvCZx2pqhuCXM=;
 b=lRuGcxC5A8gP7booohurI342r/msjdXooAzbIZGo/6q1m+95nAIltxP/+2XbZNQQZ0
 vwRQWYZ104GKzcXTbKWW+9b58pR+pEy2jHmtyBLnJJL/QymzlPVxCOqrDPAqlaf3QEnX
 9PAqktpxHyeY2T69xRUdEDxn1PQuY86+1lBTDAak64eLFjs4F5NvZsgn7X/2uHSriHYn
 bzDxXHcapR3JQtXPWvNgTuLe8/gQSgT5FnaQy4C+997Xag+mJX8VrUYC8kt3/c09r42n
 ZgvyKij9J3vgZPG+g5nbt0gszizWPSnCO1lQ4KxfS8ceECF5ls+9czrQ8ddoc+AV5PYE
 Q2IQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9cXoLG92MIYa0u8kVvitwT13XSIGEpz+ZxCawzTufkY440HfKSJFc3TVYicEdDmZZpk35E3xv+2Uw=@buildroot.org
X-Gm-Message-State: AOJu0YxPQ4a8sYI46Y2B9vgICcxZngJsinswTmFa57Xh/QTAmztaOkRd
 2PN3x7VRe78Mz5vion+sHUvNoY0aVt2sZL0zM+uMKUNvVXTqGwXjDCHKcVCBz6YIJIKMtQq0Aef
 tiu7F
X-Gm-Gg: Acq92OG9bBNyuOuYiqLiwmxFVdzjaOd+B50q2c+VsqKf4sSnrREX6ip8yspFMtd1F0y
 Chkg4wbntV0f7PmcGuo18Dg9H92nd9Y+xj4yQZ+CYLv/7iYfrHiGXlOmg1vAjGAEj1mptuPe+yS
 1ZNTqN2aLsu8CowLqj43A7GJGruGPgOoPBk/+g5GGsqgXKqBrAonDg4jLfotRYKX7dUrdb9UTJE
 hw/pYeMwu7eNLsOlDPfCSh8Glwrz8Wj04IVO06tknB8Z5QbzLdkn7SPM6BKYIyNrdPtXYDg/V7R
 ldb6rYyK5vAVO64KpHhhiT50Cle8G3d+Yr5iQcy8BigG13VmYcj8lS3Qj+JMpCYl3dAfw5FDdY5
 3EjRgv5s3gXcosV/BgdNFAmkCDziOa3unxyD5es2wxBF0o0SU92v25uet64aON74vZltd30tMlX
 ywplb+a0oesUsbAgwg2GnV1IQSxBHLJK//JgSrVFAUq/LQ
X-Received: by 2002:a05:600c:8b56:b0:48e:8741:fd4c with SMTP id
 5b1f17b1804b1-48fe632536cmr66537065e9.18.1778852058341; 
 Fri, 15 May 2026 06:34:18 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe4c88e5asm64656955e9.6.2026.05.15.06.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:34:17 -0700 (PDT)
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 15:34:17 +0200
Message-ID: <20260515133417.316783-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430054033.8599-1-chakrabortyshubham66@gmail.com>
References: <20260430054033.8599-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778852058; x=1779456858; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MI9bd9uz/H/PRPxcz4b6zYvuuFLeRZpvCZx2pqhuCXM=;
 b=UfKG2hy9k0yPtXy9fytswVlu1+1aPKRBeb0xENRzIj2cBYtUfU2uxKrPaw+qAjAzS2
 R9ahgvvMTUoG6eceROvdAhHyRmv/6MN5Yb7CpVmKAgy9oaaK8t01eI/Ng30DUJqjtTkE
 YpxjutCTjyP+S1IgoqUMP3CK5PZnj31HRoLBpnLMsdnAUUB7UmgOU4Yl4gza+FjxL5o9
 p1xcofKTvnlvd7gUinAwSczUkLtbcBv+XwaVPieUWrtgvID+mj6wHsA2YwN8yExRMb7t
 Ls0Yvh0wPxX7edyP8Lc3+HxT7E9tba55bIcYQUrJY6rypbx0pWcUmfZKa2woLGU8sK3L
 p6sA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UfKG2hy9
Subject: Re: [Buildroot] [PATCH v2] package/nginx: security bump to version
 1.28.3
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
> Fixes the following security issues:
> - CVE-2026-27654: Buffer overflow in ngx_http_dav_module when using the
>   alias directive with WebDAV COPY or MOVE requests.
> - CVE-2026-27784 & CVE-2026-32647: Buffer overflows in ngx_http_mp4_module
>   when processing specially crafted MP4 files.
> - CVE-2026-27651: NULL pointer dereference in the mail proxy module
>   during CRAM-MD5 or APOP authentication retries.
> - CVE-2026-28753: DNS PTR record manipulation in auth_http or SMTP proxy.
> - CVE-2026-28755: OCSP certificate check bypass in the stream module.
> 
> For a full list of changes, see:
> https://nginx.org/en/CHANGES-1.28
> 

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
> v1 -> v2:
>   - Bump to 1.28.3 (stable) instead of 1.29.7 (mainline) as requested
>     by Marcus Hoffmann.
>   - Highlight security fixes in the commit message.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---
>  package/nginx/nginx.hash | 2 +-
>  package/nginx/nginx.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
> index 7b79036b20..1d11937987 100644
> --- a/package/nginx/nginx.hash
> +++ b/package/nginx/nginx.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature
> -sha256  40e7a0916d121e8905ef50f2a738b675599e42b2224a582dd938603fed15788e  nginx-1.28.1.tar.gz
> +sha256  2c96a946bfb0882a21744ed429770a2123ae1828c7c48665092993ddee91a918  nginx-1.28.3.tar.gz
>  # License files, locally calculated
>  sha256  77c01620abf36ed747b7eca4bd271e49023fe3a8e2b3525bcf4b09c8e3aa28e4  LICENSE
> diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
> index 41490caee2..a8b7ee7319 100644
> --- a/package/nginx/nginx.mk
> +++ b/package/nginx/nginx.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -NGINX_VERSION = 1.28.1
> +NGINX_VERSION = 1.28.3
>  NGINX_SITE = https://nginx.org/download
>  NGINX_LICENSE = BSD-2-Clause
>  NGINX_LICENSE_FILES = LICENSE
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
