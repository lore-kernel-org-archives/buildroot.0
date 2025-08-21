Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C45AACA0EFA
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9862561B81;
	Thu, 21 Aug 2025 19:21:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DWHRvC1EarY0; Thu, 21 Aug 2025 19:21:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E8FA61727
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E8FA61727;
	Thu, 21 Aug 2025 19:21:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6377525B
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4703861748
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VX5u_SK46I9w for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:20:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CDDF261794
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDDF261794
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CDDF261794
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:50 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-45a1b05d252so10141825e9.1
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 12:20:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755804049; x=1756408849;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TefeF0Stq0MgET8+IvTEVAcLXrt3l+4hPtXMR/E6V7Q=;
 b=aEIAdygmsJEs1HKa0EdpZ/a/6OY6ZxjARDGbF44bHxKqE1PMe5GNx0oabWEMEcif7k
 x3n90zONzri3Y7GrO6Iqqw0dcqw1RKTmjWURa526AAmBlLPEl6IZ6isvKyqHIRYt2/ql
 TjCX5h2dIkNDjj82cC24RvqC+aJUCuc4D3TKrpZ1lRN+rM/Czv5BwnqcfiF8E0mV5Wh2
 ofzc3YS0J3nZSaCiiCzo06ICFmpXYcmKRs7WW3OH477ZLFYR+EAPGpbUMiQXETg5Nz7G
 XK0qDxAKWEB1vjLU0zbm8awx5KPVd1D4kh+O+wDOGjE8DqiWj319EhspqLsYMqcNnlSE
 Umvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIJwQLu7JzqJpl2pNEPsgWaS3M4uHCMv1EWrvOsY14bQVcQOGljI26w9C1RC8yBcywGvQH5/lNXcQ=@buildroot.org
X-Gm-Message-State: AOJu0YwTDPRdeZ5lCRTcTXAJfguOhusW5MDKBrHhcp2S8ZD1OlDHs800
 3GOf82REYCenYyy23HUB553ofvWKPlovvFwOo8xZuUsNmv2XYJ40rpovdSSkrBsBTDA=
X-Gm-Gg: ASbGncvdBwtk4d2aZ0IJ84ajqXg4gVaNs61cgkGN38RVmbXPDiyzbDEZ2BSdCe78tDC
 gmyedEa4mNP7ACZFNXJdaEIRzHcmwPsZVObYoZB8SYoImrqWbFPsYMWwhZWH4xwRxUuxa1dvxMv
 XHMATV+lSklPVnxFmX7LpohedW6+pqtSFAGe1ErRX9IZu56+xsWfteGdpP+1fRiwDmUzZDaBB3h
 GstdM9yupzOEXVP81V1Ct/Ejnv60RLzVcJS7E8bnrB/VJc1q45OOjyc4uHeuPxOjXh40iiFBnf/
 TvGsksXzDaQK4S6+fPUYBsrxlYRr2C/EwMVz3+e1ghIRJXHwNmG/4FmCN9sHJGypVh7RZGWQ4mD
 Oy3YyajwzkhrZDQ==
X-Google-Smtp-Source: AGHT+IEx3o/xohzlm9xBjO2YCnnBHXU0ELbiY/ZfVXvE4mVaUyPlpCCBd1M/J8sVA+ioCEzpt+ojCw==
X-Received: by 2002:a05:600c:3b26:b0:456:1ac8:cac8 with SMTP id
 5b1f17b1804b1-45b517ad6c8mr2613745e9.15.1755804048843; 
 Thu, 21 Aug 2025 12:20:48 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c0771c1aa3sm12088156f8f.32.2025.08.21.12.20.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 12:20:48 -0700 (PDT)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 21 Aug 2025 21:20:48 +0200
Message-ID: <20250821192048.23608-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811152650.3689304-1-yann.morin.1998@free.fr>
References: <20250811152650.3689304-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755804049; x=1756408849; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TefeF0Stq0MgET8+IvTEVAcLXrt3l+4hPtXMR/E6V7Q=;
 b=C33qMzska0kG9/IJm+9jNwLjofI/fv+cHzmRfqx/snM9KEDGcPohXtGw0H8ArWrhWj
 ZNVu363h2eImnd2vxgaPRsj1m4b3w3j5OIliz73Lu6YtgAFIfA2ogxbfHitQKri/LpbD
 sEiD1MhiqYzK1Hv2hxb9maOJwOpfBSyXiSlmR++eL8fzbSqaheDn3YtEjEKL7PkfU8uw
 fmziz/3Q7lrNaotnO98sI+ANcRwjMuGgT+PLj/vB2bAHcErr4b7jAfRfFc59+LbRov5j
 1PXI974akkEVOXq3TlbNbEzKyw6FVFZL4ahqRh1c/rrOF4qfeUcity1iJ3TGSdpUgzB0
 mihg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=C33qMzsk
Subject: Re: [Buildroot] [PATCH] package/bash: don't use append-assignment
 where unneeded
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
> For the first, unconditional assignment, there is no reason to use
> append-assignment; it can even be misleading.
> 
> Fixes: b367ca32e53a774c174899e44c77ed1d128cbcdc
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/bash/bash.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/bash/bash.mk b/package/bash/bash.mk
> index 84f581da79..2747802592 100644
> --- a/package/bash/bash.mk
> +++ b/package/bash/bash.mk
> @@ -17,7 +17,7 @@ BASH_CONF_OPTS = \
>  	--with-installed-readline \
>  	--without-bash-malloc
>  
> -BASH_CONF_ENV += \
> +BASH_CONF_ENV = \
>  	ac_cv_rl_prefix="$(STAGING_DIR)" \
>  	ac_cv_rl_version="$(READLINE_VERSION)" \
>  	bash_cv_getcwd_malloc=yes \
> -- 
> 2.47.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
