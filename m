Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FFDFED3F1
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E7B684E96;
	Fri, 24 Apr 2026 16:27:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AbKOz9528M7U; Fri, 24 Apr 2026 16:27:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D535D84EA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048053;
	bh=yPBGMI+QrCqCFyAW9OZI8wP/cl30UxhfDPRCiZSfJCg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bXfKtxZIj4fgYRIvnX4ogRQw8NRahpLEgSXhfrDW/o7RMHQq8UP9r6fv2QwG93fNX
	 wVLC84APyueh4hIEiQylNaVj4zJ3cFossFfE8VQbmjM4Xb43DiAUeRLuqZ61YT4dLH
	 IFu8qDRRTMS6ZR+wXkoh8z7SbbGQg/Iwiykv3e8Clftmke7mKDs/EGBnSDPPyG0H2W
	 pt44+b7SETJB1gDnuzqWxNQF7nDnvoG55NM81NdH2qZxQxBMoTE8s4fudVW8GHD+6o
	 aInuhu8NScPKeZEsHnOGSVGyalEHSE4K2cz4mpstGY/UXOvZmWCU6bVpXOsUiKsQW6
	 hiNT7FbW2f2eg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D535D84EA5;
	Fri, 24 Apr 2026 16:27:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E8CFA194
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA78942389
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OvwxvXJuidOo for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:27:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C3105423E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3105423E3
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C3105423E3
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:25 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-488ba840146so72267915e9.1
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 09:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777048044; x=1777652844;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ve1NRM9YtYJko15j3oOyYmqJDO3t9tw9n5fh4rKNxKo=;
 b=OFu+AaIewQwf8qhORMuA8+QR+ORmlb+Tagj+3OyjxMLkUk1kIxemLgFN18nFDYs5yz
 KGb+rKZQ6zCJaE0iy5oFUeTC1eTlu7hEHLMdQeMiTCMhMNDqHobtsLMyqCnIsMnLDN5g
 cKgtH3VBQ0xyGEaK7Pk6o48ktYUw4MXXRk7FA4rPUxsoz4qwwnmCH8OkH4DViaXbVXBA
 FoRtwTQz4xEm9Ti4FmshEW2QkkZepfqSw4i5I9eEzbp0oqV8ei3MN+Mf/VMou18a4gxl
 xhBvTkw9Rc+dtC3BFBh9muMxc/7P3RxTn/VDZ7MMYVcXx2q1Q4h4zM61xybkkgw+DIm4
 NgHg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+rqcS+Vbc0txDTSNGAcH3y33VJR6jJhrsYOwvjaIWDe5rX0Sg24eDSdz+cPF3rCpsrWAZvi7w/EbE=@buildroot.org
X-Gm-Message-State: AOJu0YwSkHFWX04MHT+xjfXzHBKr6y8WySGUYvEzomEOeYi3GE1zKz05
 JXru0IS26fQ7pLm+ghXtP1JiWFsulsP39J3OEyL8oKi8dG1Yb6vAUmP7e8I+Swbf05U=
X-Gm-Gg: AeBDievvreCWdddLM1vrQLaqHU4oGlmv7mCj1Q3iVsoKzAItiVZBaydRcYV0TnNcuue
 nx35TyteTZP0sYxWUe/r+QyUXZTMOHqAd2ty8FAxkkyb4AJqQwWjvOTrre8z4UHlk0IXF12RQa0
 kX+cibQ8pyWuYUHzf46jxnBNq9xjS8Sh9C0DQMwavkQiRPqPTWxkJ60QPRvfbY6ATgO+TXOMK+n
 +Q85EMCsId39pY+2AFDd7beXigcwhFXDKAaY3fyi19TaLZYyN2nyFuZpb4Lgd7KfmUk3rbmpNGg
 boWy7vihYbd9gOxQH2MYS045etYA9WiaGa/SO6IsfzIZgyOzpj6q8VxnnAFFkdvpM4YFSP9XYJX
 8gydoV4a2fE+7bN1jy8/MLezncYUPEo7a8n4ZxEqKZaLzkytO4pG06ry/fp1QgEbXzSBUbLuiK5
 3KnXVF6g5M9yARyLNqsp58heVaqQ==
X-Received: by 2002:a05:600c:3110:b0:485:3abe:ab86 with SMTP id
 5b1f17b1804b1-488fb739ce4mr448987525e9.4.1777048043830; 
 Fri, 24 Apr 2026 09:27:23 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4891c318636sm397673425e9.7.2026.04.24.09.27.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 09:27:23 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:27:23 +0200
Message-ID: <20260424162723.162056-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260416073657.3605628-1-bernd@kuhls.net>
References: <20260416073657.3605628-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777048044; x=1777652844; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ve1NRM9YtYJko15j3oOyYmqJDO3t9tw9n5fh4rKNxKo=;
 b=KXyO1KtTb7oFE8vDHy80wpnQimxrI3A35jHahUlplFRw+j9pqd4ifjdvIIskVilshZ
 JidwqkGZXh7rT6W49U2h4/G88OEpE/KYUO+RIIUNzgoi1mTGtaVMLzBYI0sYoLPo3YGP
 eg6WXQIsdXVBZeQ2o7GEO4zReHjTBZE/44uqQtGKPTkMKt7Ma6/zNzcifma+Ua7cpFEP
 m79zbQIqYu5JUGupbXycP+nwPjLvGi5cjiP7BdG6fLUxJwpfdv9oRQ7YOECpf+rdWAM8
 mCI00QcC0gNGpHaqY5riRtzT0JW9vODkcNA2vkZ0iuCAUdr93UQYG9tN6oIARsRYtJrO
 SJkA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KXyO1KtT
Subject: Re: [Buildroot] [PATCH 1/1] package/libarchive: security bump
 version to 3.8.7
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
> https://github.com/libarchive/libarchive/releases/tag/v3.8.7
> "Libarchive 3.8.7 is a security and bugfix release."
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/libarchive/libarchive.hash | 6 +++---
>  package/libarchive/libarchive.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
> index be357183e2..665259f2b6 100644
> --- a/package/libarchive/libarchive.hash
> +++ b/package/libarchive/libarchive.hash
> @@ -1,6 +1,6 @@
> -# From https://github.com/libarchive/libarchive/releases/tag/v3.8.6
> +# From https://github.com/libarchive/libarchive/releases/tag/v3.8.7
>  # After verifying the pgp signature from:
> -# https://www.libarchive.de/downloads/libarchive-3.8.6.tar.xz.asc
> -sha256  8ac57c1f5e99550948d1fe755c806d26026e71827da228f36bef24527e372e6f  libarchive-3.8.6.tar.xz
> +# https://www.libarchive.de/downloads/libarchive-3.8.7.tar.xz.asc
> +sha256  d3a8ba457ae25c27c84fd2830a2efdcc5b1d40bf585d4eb0d35f47e99e5d4774  libarchive-3.8.7.tar.xz
>  # Locally computed:
>  sha256  30e556b3959e3985d66efefec5eaac51d4995053caa1d3cffe6eb916f146f229  COPYING
> diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
> index 3b8fdbae1e..f11f5d8f6f 100644
> --- a/package/libarchive/libarchive.mk
> +++ b/package/libarchive/libarchive.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBARCHIVE_VERSION = 3.8.6
> +LIBARCHIVE_VERSION = 3.8.7
>  LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
>  LIBARCHIVE_SITE = https://www.libarchive.de/downloads
>  LIBARCHIVE_INSTALL_STAGING = YES
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
