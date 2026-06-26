Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85364C43327
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F7FD411CD;
	Fri, 26 Jun 2026 14:56:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E74RW6F447fr; Fri, 26 Jun 2026 14:56:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5ADB9411CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485771;
	bh=DXHZ5HTWsv00rg38n2s0z2h6/DWke42HWQVrhH6WuFY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cQ/YXDDudkSPYfINFsW3oNq3/k9l1n0MhFXTol8Kf8Mo49WNvrmfJgzytMv3T7Q0G
	 WshLLVKUMaIKmupWpWtcRxUGFC6Z05+T60GnAWaVn9TFgZsau3bavYfXTdZwv0XmIO
	 Kz1kDzM3qkaVVoShtRsveDBcxqK6YAPOd+v3p9vqGh2QBkUSpOojeEkna7VtDnxgkd
	 doSsJBHOhI3nMEjD+DCqqcI8tgYHbe8xxFVxXxkD6a2zx38ADqJQCZ3KFEK/AlUewR
	 wFmIO0bG0tDiIdH+LJDqFaV+ghfhHEhHJ8UG9pGX65n9rJJTE4AA3816X9+x6nJmZe
	 0PpNpNJ+SD8Ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5ADB9411CE;
	Fri, 26 Jun 2026 14:56:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C75F23A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3C90823AA
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VSyAblZuz03z for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:56:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CAF8382390
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAF8382390
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CAF8382390
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:05 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-4627adcf4d6so721446f8f.3
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:56:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485764; x=1783090564;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CtSIIeCx5+PDSQfeMt64Ct+sRPRpOjnmQUw5h676zVI=;
 b=B+KLe8CAnukt+oG8GXlsrRxqJKzSBuvZ8nAPNYw3eKjTumaWKaNmZurOoub9S09zdj
 DOyqWB8X8xCxwL7pOeHWyoruLbzztH00EvFo8U0mxvdtpzwkBuVYy5hoZf+8CUFXHFbN
 d6Zj+1vrBlWyXzNvxu1M6Xyp2y2FssyTqk/qRvLjasNrhqncOhrweCBAP9IwmRnhejQE
 hKt3H6oUEI1e0fiMS/yTKTuY/AylfMaCda9PdIfiv6PtUiAn5q7MJZ2hoOBCGUoY96j8
 X6d4GPLqgcCnM2OmMDVJrLTJnwv6w36SZAfn3g/NJ31YIcvaGXRs2oEhkQMgRRJ6olft
 guTA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqF0yX0XtZYWjeTib8YmrCKt+5JBgJ8ux5q2aErovr45Lt48VKi/LjjvjgwifdgSko9IfhlRq9WRGI=@buildroot.org
X-Gm-Message-State: AOJu0Yx2flZOxh+UpIhN0PXhzc8uU6XmlF6db+HkmK4Fm68j2rL1tl3Y
 5r7hKKa/KQePQ/qgZ1O5MsUiF6NxnywyESCkW2qfqq9dHyscP7O5AE90c10FzgCriCPkhjKo3Fb
 gamx0
X-Gm-Gg: AfdE7ckA6yXSslBTAB6YW5Tvi+vNxf8lIz6wz6XqxRi63ATPGaBbpkASZEI3PtVvm/Y
 Fg5jiYpMluSEf3cmDrGzqFvGIr2KwRK4aBcjk57J3n8hZ76d+S4XXTNT+Y8LPq8jz8LtY3kpbdH
 0QtSFNwT5d7XBqRXoI4w8cLkEunJ2PRw/9OEf4f5CVgwqwFwhRDKxNmnZxJGvliYVlhhen/fC6Y
 eai2zXLkFPSHGzS41in3OpTdw3t+gxGzgrSmPZd2v9zPyrPCpZqGWQKVW44NGU/YOfXgFJQkjVf
 mrOzqC0qKs/Y7hQ0FXB3EQgYqYaHYHSGkHzxTCid6CSXdkNnAuwFHW24oMyk6QDPYwVzp2srRXN
 rHhWkhQXj/4jdERr6q7ow8Mp9YIpmNSASa19LCQkZtiQ2vEQuqNHdSjJOCDEl07P+tgQz15ABZF
 IHxs2g
X-Received: by 2002:a05:6000:4308:b0:465:7c2f:c09 with SMTP id
 ffacd0b85a97d-46dbf6db969mr11229512f8f.16.1782485763427; 
 Fri, 26 Jun 2026 07:56:03 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46dcbac0c9dsm15853085f8f.19.2026.06.26.07.56.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:56:02 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:56:02 +0200
Message-ID: <20260626145602.343640-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615182915.1888004-2-bernd@kuhls.net>
References: <20260615182915.1888004-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485764; x=1783090564; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CtSIIeCx5+PDSQfeMt64Ct+sRPRpOjnmQUw5h676zVI=;
 b=aTM8Ax+lhRt4KYdCoWKweiMu1v7isqNO4FKmRmOElVtTGq7Y7pKI32Po0/i5OligFq
 pAVVb80K5NOpjZc5w6lpVHlj/SjE+r5gTSfEo/kNFsuaokyYcKUiJXWWfIPlLWpWX2Ph
 TStFknyANqXWuDD/b8xfYGOlWiqO9ZjOlwkrCZXKRwVIAmDJhfDYh8DUve4VWAC8uHPS
 QKUeXW/JVCyiOWTp0r8SlhxEUPhkK366mcQL2he+OFmqJujJGEx+DD8+ffBlLlPXqPVm
 CPSTRVNZB7ugzeF2p0vbBLvx7tfHCxPLv6/4gIdas/9+bJmsNCS/FWgutCgPOvWjLRyp
 s3jg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aTM8Ax+l
Subject: Re: [Buildroot] [PATCH 2/4] package/kodi-screensaver-rsxs: remove
 dependencies to gli & glm
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
> Upstream commit
> https://github.com/xbmc/screensavers.rsxs/commit/a00a3cce3c5f24ea7274968b5b16c8d2db656a8b
> added the code of gli & glm in-tree and removed the usage as external
> packages.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/ad40439fbf81d306cc35d33bf35e93c320dbefa8
> 
>  package/kodi-screensaver-rsxs/Config.in                | 2 --
>  package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk | 2 +-
>  2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/package/kodi-screensaver-rsxs/Config.in b/package/kodi-screensaver-rsxs/Config.in
> index e88df1fe49..8185f3c424 100644
> --- a/package/kodi-screensaver-rsxs/Config.in
> +++ b/package/kodi-screensaver-rsxs/Config.in
> @@ -2,8 +2,6 @@ config BR2_PACKAGE_KODI_SCREENSAVER_RSXS
>  	bool "kodi-screensaver-rsxs"
>  	depends on BR2_PACKAGE_KODI_RENDER_SYSTEM_GL
>  	select BR2_PACKAGE_BZIP2
> -	select BR2_PACKAGE_GLI
> -	select BR2_PACKAGE_GLM
>  	help
>  	  RSXS screensaver add-ons for Kodi
>  
> diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
> index ff554a2e1a..dcca031b51 100644
> --- a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
> +++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
> @@ -8,6 +8,6 @@ KODI_SCREENSAVER_RSXS_VERSION = 21.1.2-Omega
>  KODI_SCREENSAVER_RSXS_SITE = $(call github,xbmc,screensavers.rsxs,$(KODI_SCREENSAVER_RSXS_VERSION))
>  KODI_SCREENSAVER_RSXS_LICENSE = GPL-2.0+
>  KODI_SCREENSAVER_RSXS_LICENSE_FILES = LICENSE.md
> -KODI_SCREENSAVER_RSXS_DEPENDENCIES = bzip2 gli glm kodi
> +KODI_SCREENSAVER_RSXS_DEPENDENCIES = bzip2 kodi
>  
>  $(eval $(cmake-package))
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
