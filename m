Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C73AE9A055
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42D5D61188;
	Thu, 19 Feb 2026 17:26:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pVdQCX7EJnxy; Thu, 19 Feb 2026 17:26:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF7E061199
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771521965;
	bh=CDjYA4NxrDtSiJ+Dreqr7JJq621XfCsDnije2UJ3A7I=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jscH4GeZM/LoSPW3i6/spqfaaosLYW++fDxkkVhqhnEy03TI687U0pSW8yEQknj9g
	 ee8ggrDJ1OpfX/fK6KR83XuiqjyYkVXqYD3kRQIurN1BkKOu7T787hXWZXlAHPm6FR
	 ZqKQUyIHhAkuAyV6nF1+Bs3Qbfxk/fjA9Z6JKm/zVexR/qLzexeWtGWk/+30HiONch
	 mjkq5uuFXfoQtaD1dnNT+Ydmb//SXUpvhAnKuv2lyy48QKIOhwdVsfUpKyrAYrBzhF
	 H523oxoxWdDDVM/t2CAQSrclKXqCPO7S559p4Mq/OsmgGXHcsMBpkGWxrRUQtIf0kQ
	 /8WLge6fTk3qg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF7E061199;
	Thu, 19 Feb 2026 17:26:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 97564206
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2127A40C78
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bDfr0Dlj-Z-z for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:25:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 20A5E40CF4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20A5E40CF4
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 20A5E40CF4
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:37 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48371bb515eso16181195e9.1
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 09:25:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771521936; x=1772126736;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=l7KPW3aXfy8SHxmJFarDtpzge+ENdPvIyTnFQtWGztQ=;
 b=mss91Zba+uU+Iz9gdMSnR/nU4zEh1U1Adu2xKCzGwkN9XJEQAAkS4SRTqwmuheEaCi
 j32jhcXyYGWAmMhGPjrFArVXL3bvjxupiFv1+XGsgK0wayh6slfXvD2sX6fYwtVJJbTC
 seuv8jJyI3MbDgzK3yK70L0XjJtS1JZoGppmGvQRLfLFCDTi+ESkCcgGfdYAdB+tPslz
 TBdNGX5S05y3tkEeAf5HBlz3SC9cHJh6aETYocetBoA4KMw0dzpYku3uzmMkAN1/9ynT
 PCaFp9sqJsdyUcYSiZBxkBVQpEThhRDxadOh4HPvytv1MG99sj/XfdVWQ/UkVsaQ7q6D
 Jyvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWY582VI4PutA4//eURyeyV8PbEZftdgE8j82k4eQv8OhVWDu4lrH0uim9j+gHpkND4/kxlomNNsNA=@buildroot.org
X-Gm-Message-State: AOJu0Yw6qVfKeERpbpXfBItMdb3vyd4W46UaEeENuW7DG/azoqfs8sL9
 WoIXw32G9EeBcJp/nlBe4PU2wBt/zrjMR2/zEnRB/ksy3tZGx4NoUXUeZ6z6Aj3mctLXf9nUuLX
 ZLBbp
X-Gm-Gg: AZuq6aLc6g5yeA1dSNYSTtWx11Ac/1HOEsoXzVF4ACnEZnNrDd3RGIe+WeAxTHAMUsr
 4XhdcJroRuEH9Ucv/p+ifBOam8+mh9vc3oMBCQ0+FE3xRbu3Onw2vETrtbGjRaaf1JzMoCwppEc
 dOPpel3VAAt3uKTQPpfRYI0Gn9e+dJtjAwo0+fRNVTiHvdkGvMdSkkjyqjsvtBEQPChXj8L8krp
 FuvmjW8c7XG8nDqJNzeUArfwDVlfhI/1ZrlwED+Ngg1bWWXAui4qkLlEEq1Ja6L2/WrI+4CCaEg
 HXzNCMA3ykLyT2AKlvwGUI9fpM1HWCnJI/yYUE3/acQAinlsZeUfTlpDoL+0fmUmciOFQwhl2td
 kWDYt7BVkivE60cT9k0xxeXfTU4EmmEYT626cSpjor56mJytsOgROmPyGmPGqlooxV/LeVe7ryO
 RveKOB52yOYET8jM8=
X-Received: by 2002:a05:600c:3b01:b0:477:a36f:1a57 with SMTP id
 5b1f17b1804b1-48398a678e6mr102479575e9.3.1771521935952; 
 Thu, 19 Feb 2026 09:25:35 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796acffcesm47312497f8f.37.2026.02.19.09.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 09:25:35 -0800 (PST)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 19 Feb 2026 18:25:35 +0100
Message-ID: <20260219172535.340224-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20251224112404.3796586-1-giulio.benetti@benettiengineering.com>
References: <20251224112404.3796586-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771521936; x=1772126736; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l7KPW3aXfy8SHxmJFarDtpzge+ENdPvIyTnFQtWGztQ=;
 b=au+q2yaEZMkGdyExy7WRQlEfXgvZ3jHCQ7qU91yD68qY9fVCooKwpZ6n0/ijSp8f5o
 2Ib2trkgR13lnj1SW0eGu0/qfShAhW0o9Zuvk5LuzIiHFx4GlWVbbNGIpP5d3eiB1ikU
 jnRFx1iSCWeB+m0izzcxw6NeA5IQ1EuGiasAnb3tRzXbmL2egl0UCAohgVA6SZk1Vu8f
 LBbgqA/qPIYKQ5xpDwOUeLNvhlV4b+YfZlaBcHIdhkQ+DNsAIKzgxJuYBceerh/TSg1e
 tv78YrC1YjTrQy0NZ5ClJuHzc8g9/fUcTgNef1l9YTAO1Q8dvd50vyaycg43a5lT9c+g
 nkQw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=au+q2yaE
Subject: Re: [Buildroot] [PATCH] package/vim: bump package to version
 9.1.2017
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
> Changelog:
> https://github.com/vim/vim/compare/v9.1.1989...v9.1.2017
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/vim/vim.hash | 2 +-
>  package/vim/vim.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/vim/vim.hash b/package/vim/vim.hash
> index 95c44234fe..f7c883b929 100644
> --- a/package/vim/vim.hash
> +++ b/package/vim/vim.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  e150b40bcf593c10afb39378f2594203d94e5d6110ffe242a0b6bedd258d757f  vim-9.1.1989.tar.gz
> +sha256  be1d60091d27bbdbc090e0bb19798baeea378aa29645fd47dc4c222dc14efcaf  vim-9.1.2017.tar.gz
>  sha256  0b3f1f330cb1b179bb17c7c687d4cec601e0aa3462bc7f890ad4c3888d37d720  LICENSE
>  sha256  ee1d0885bbc4a95a24e49873a075391bdf26b69d13758e30f3d9271f8f42bd2d  README.txt
> diff --git a/package/vim/vim.mk b/package/vim/vim.mk
> index 4fe8800bea..1e7e1d6a55 100644
> --- a/package/vim/vim.mk
> +++ b/package/vim/vim.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -VIM_VERSION = 9.1.1989
> +VIM_VERSION = 9.1.2017
>  VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
>  VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
>  VIM_SUBDIR = src
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
