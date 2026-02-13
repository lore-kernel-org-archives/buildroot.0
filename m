Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34062EF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0341A41E37;
	Fri, 13 Feb 2026 19:40:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XfPqrLv5zmhZ; Fri, 13 Feb 2026 19:40:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18FDF42288
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011613;
	bh=e6fM8VH0+gGAYw1OoiJPEe+ti8QV8mQRXXqpvEA16Yk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Is2m6mvbcoTQGtaCyE+pfavUezwnxS3HJrPJjdTBkDJcpZ9a3lFlP0tspW3ziSD1S
	 KESisV4doK/RJ8HvC8ybdVNfQvr3WTljji0ZDB+VZ5ZGQwLj0S23Ar+n8jzianyTSX
	 lwNCqYGRDf8coo820NcKK/vy3pyRRZ9WiYg256Ld/4IrHbeycD3dZvkNfATMkmO6x8
	 /5+pS3wMAvRCkO/ITOmp8BOPz6zD+v4R8luUF0wh8Tm/1i+ZMOVTtOosWPZ8yu2b5n
	 UkCAATXRn9g21w7H+JDXyLiGMi7tUE2ujnO/ulxuJQltMGiZXWS91gxy98FNG6Tn5u
	 OEXLVebvVIJEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18FDF42288;
	Fri, 13 Feb 2026 19:40:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 77CB2EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2636741300
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Op2oMBwQ9Lmq for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 15325412D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15325412D9
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 15325412D9
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:24 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-480706554beso12376645e9.1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:37:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011443; x=1771616243;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lukWiMFS35KT2lQejeDjFV6NTWCNRghoOSnWmxS3xow=;
 b=orF5/NZNgmArlX3lhBbG5IwQn/70y7GljRvdIuasIv/pMAPeF5uVyMuAwytXM/5quw
 xIsofZDJfS7FM5GmF7yjbDLPHZP3Mt9wT5cgvA6GRFd0oPfiLvEsyovGhzhGaqG7dzvj
 cZ9Jt7B5YdYY7kIQ0LxrY1fVYEmpaT1eRuLowsyRd0uBV3rBXJZtjLYTQukb8Hb0e6Yr
 qVVB9mkn4UeRacsI2GNGA+PI9EhuR5R/9rxwx9gyw+qyXl+JhDfdaL95eC9Agt6QOoai
 7oXLhD0B7ikBiUO4gEivi9Pir7dqWXSBioUZoIGqTBpOXzHUC752/x1t7Vr7abWnkjtH
 hT+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUc+D5iQiuifG9Je7zkkasgmVbKw8ho96GzrQr2s4xvuZfsebwsaWzBuPsc8ttuduNtDvREjRGuJO0=@buildroot.org
X-Gm-Message-State: AOJu0Yzu30yO8Jco28lVbmKUJTLHqboY5vKnZS/yd2iI1GCkwOzTjUZZ
 lkmFBtmZPfA6B6AcZ8K5sQsuSJqrTxwle+INIS8B3wne+ruTywLrqhF8GV/pbl40KSo=
X-Gm-Gg: AZuq6aJ2VxdtCDfSPqrhgChMJVry8eaV9fGNrC4vjcYJzTI32YY4TBU0up+uxkc767o
 5dlnRWwptbM2EAGmT9yjjXHckdjp6Zy83nPwuKNNlo+H8YkI8bRqTXQbhcMGMDzo6dAs4bORPlY
 0hwSNDM1F1CkiXHKnwzV9bSmLWwyLSz/9JkTPHPg8dxRy7LcOHhE6xbtwmKktI9hp6HAET7vOhZ
 eKeCmRjtm8bw9opeOGOPYJ0h2gI5uGoSHljKvTw0rO1/hKuKXmD3f3S4yXstMiEQ4rhK4gOY07w
 tDxpbsgSUwenkfaY1NGoxX9BP0TJO1B3ODGNr0jsa/qKRNnyNQ+YUrbeBrwreJsj7cRvRxINYIw
 KGbgnaOUpUlk3fJsJ45bFKFyE6fovlFNMQxTRo/RnLuFjsursvi2vcV+F8JAvNyB4yzV+6GSbBT
 jqbVxmtr4qCSCBDWA=
X-Received: by 2002:a05:600c:8b61:b0:480:1b65:b744 with SMTP id
 5b1f17b1804b1-48379bf7907mr5659375e9.28.1771011443117; 
 Fri, 13 Feb 2026 11:37:23 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48378b5196esm11770845e9.8.2026.02.13.11.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:37:22 -0800 (PST)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:22 +0100
Message-ID: <20260213193722.39127-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20250929092431.8974-1-fiona.klute@gmx.de>
References: <20250929092431.8974-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011443; x=1771616243; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lukWiMFS35KT2lQejeDjFV6NTWCNRghoOSnWmxS3xow=;
 b=hFfY1gG5blrEGnimlKjDYTDV3dccul2zo+D9UyEDpjyA4ZrMVpB/gXDCMhwH1nD84/
 16U/X/4ikuFJgwmPM3gKxY532C1pE48PwwFsJO8Sv7M4FpDH6d+GCe+bTOVMh105UGvy
 bFdm5ae7eJQA3pSHSAduQqiPnQTYf1IhMNSCvAkBgzHYddmF5DSC/Hrwni78NvmVpc2L
 wVd0ulwT0coduTWN51zWIfWo4qmM5JOlTjpiKbSEffyeOIWSEe8oUTOgxLsycxktGv7E
 vw3b5+mCUPDARltVEY8HN416byXy1d8Rj6/TWX6PLUZut1q+R356UP7JcfoIh+sItmkO
 EVTw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hFfY1gG5
Subject: Re: [Buildroot] [PATCH 1/1] Makefile: add check-package-external
 target
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
> The new target provides a convenient way to run utils/check-package on
> any external trees, using .checkpackageignore files from the
> respective trees if present.
> 
> While .checkpackageignore should be used as little as possible, in a
> few cases adding overrides for false-positives to the affected files
> is not feasible, a practical example of this is a Markdown file
> misidentified as Python by libmagic (likely due to code blocks).
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
> I've considered wrapping this into the existing check-package target,
> but there are a few reasons not to:
> 
> 1. Some people might not want to subject their external trees to
> check-package at all, and would be annoyed by the warnings.
> 
> 2. BR2_EXTERNAL support for utils/docker-run is still pending (see [1]).
> 
> 3. The older shellcheck and flake8 versions in the Buildroot base
> container image used by utils/docker-run produce some false positives
> for my external trees, so I want to keep using the (newer) local
> versions for checking those, but use the container for upstream
> patches. That is more convenient with separate targets.
> 
> If anyone's wondering about the "Markdown misidentified as Python"
> example: It looks like "__init__(self):" appearing in a code block
> makes libmagic consider the file Python.
> 
>  Makefile | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index b8678ea15b..cdc7ac0e4e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -125,7 +125,8 @@ endif
>  noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconfig \
>  	defconfig %_defconfig allyesconfig allnoconfig alldefconfig syncconfig release \
>  	randpackageconfig allyespackageconfig allnopackageconfig \
> -	print-version olddefconfig distclean manual manual-% check-package
> +	print-version olddefconfig distclean manual manual-% check-package \
> +	check-package-external
>  
>  # Some global targets do not trigger a build, but are used to collect
>  # metadata, or do various checks. When such targets are triggered,
> @@ -1262,10 +1263,27 @@ release:
>  print-version:
>  	@echo $(BR2_VERSION_FULL)
>  
> +# $(1): br2-external path
> +# $(2): br2-external description
> +define check-package-external
> +	@$(call MESSAGE,"Checking packages in $(2)")
> +	$(Q)if [ -r "$(1)/.checkpackageignore" ]; then \
> +		ignore="--ignore-list=$(1)/.checkpackageignore" ; \
> +	fi ; \
> +	$(TOPDIR)/utils/check-package \
> +		--br2-external $${ignore} \
> +		`git -C $(1) ls-tree -r --format='$(1)/%(path)' HEAD`
> +endef
> +
>  check-package:
>  	$(Q)./utils/check-package `git ls-tree -r --name-only HEAD` \
>  		--ignore-list=$(TOPDIR)/.checkpackageignore
>  
> +check-package-external:
> +	$(foreach name,$(BR2_EXTERNAL_NAMES),\
> +		$(call check-package-external,$(BR2_EXTERNAL_$(name)_PATH),\
> +			$(BR2_EXTERNAL_$(name)_DESC))$(sep))
> +
>  .PHONY: .checkpackageignore
>  .checkpackageignore:
>  	$(Q)./utils/check-package --failed-only `git ls-tree -r --name-only HEAD` \
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
