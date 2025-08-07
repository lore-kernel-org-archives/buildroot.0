Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B826FCA0EC0
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 923104064A;
	Thu,  7 Aug 2025 18:25:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PjxQNOpEDvxW; Thu,  7 Aug 2025 18:25:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 061104065C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 061104065C;
	Thu,  7 Aug 2025 18:25:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DD5AD10A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD0C3400D6
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:25:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XOTdtYgmudjn for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:25:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E3050400C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3050400C1
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3050400C1
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:25:14 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-455fdfb5d04so7315715e9.2
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:25:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591113; x=1755195913;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z8rvltoy5km+C3VDUHhRc7Mjhdupw9EXdbwNmS2hc+U=;
 b=uQtfGkt+67xvjB49eaACEfEIMo1GtU60PcNWjVABAsUL7FGOwaCebzEt3JD6fWerco
 yaQqhSJO/ks1fWnANDaZSqfMbhmE2jcf7yi9IaM/lXVjiBOxJQwLVz+aIB8TqyFwPwg6
 QVE+SdO/Fy58TawrZCs58Iy+nS8BlOVEvUZqJxLNLcmqUAR654RB6VtrB9NGJxQqio5k
 4SstCBca8XJgyYXiFxaiNS0AcpH6zG21UzbfgZLyfFksqLsDrCVFVbG7DOlAQBBIi9pm
 sl3msavBPk7sLK4xBRzWLX+V8z4evv0A8vGmlMbofuC81LEYaRLzLdwnATjm2qHIyVvm
 jFdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8uMzePXpy6aBnmbCCn4YbMzi4LJcufIXh0RugsQd3Ash/pvadWFfLsULD+wLHXUUs7lPWXJuxLMk=@buildroot.org
X-Gm-Message-State: AOJu0YwgeiJfDtqDBsJO834OV2JIyW170B/qQK9Vme93Y171khIfe8jn
 0FwvzRlriTHXX+qSSu5Qq6D0ZnAGUPIY1aIVQgTZY+J7xFbzCbmdHiSDC0HcPin3R3d/VANUBNI
 XES/nnpY=
X-Gm-Gg: ASbGncvQEmY8ZrhkM98SMSVfZjrXvwC70n9p74AdtyeDHnneAoJQXUbMp2k9iZUcnna
 Ot4V/8N/JXg1QKmG2W3nrvBPUSULvy2C3vWZwPqZLjqTycBY5BJKjiKLUtqtUlcLF9iXMbeA0TP
 I0ITaQ3aB3MHk8WHgbyMM6KjqVFtwG3RHy5g2F8OuCWpLcP9pleTQFexWfZbiZ9Bs/kBt5d9625
 1RmekA2CYq/qGEt00fEgyizg3D4IGaK1xMjKobjEfYEVdHaqkMZQB9koZFoGeS9bdSmnkzOf75y
 1lG78GAO7laMdDPip3K0OhiAIdKjJxVIeH5Y1PcRcwtrBziVVqTkvBtTyapNjTzrO+l0MKNZtqp
 Fi/+23rNjmiIQhg==
X-Google-Smtp-Source: AGHT+IHVIoqi2WmS2dusj63p/BgzGpO1hGUK6YC/3lugKILiUtcsqNZ6cCP5+H4llizhS7H3mJkrqQ==
X-Received: by 2002:a05:600c:474d:b0:459:db80:c29f with SMTP id
 5b1f17b1804b1-459f4ea0f38mr212365e9.1.1754591112924; 
 Thu, 07 Aug 2025 11:25:12 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c4530b3sm28275189f8f.34.2025.08.07.11.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:25:12 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:25:12 +0200
Message-ID: <20250807182512.726989-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250725182743.3599859-1-bernd@kuhls.net>
References: <20250725182743.3599859-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591113; x=1755195913; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z8rvltoy5km+C3VDUHhRc7Mjhdupw9EXdbwNmS2hc+U=;
 b=aax/ghydWi1xIZzstyOfAfwJUuVNh+BpGN3ctAxMf+J9PObfpl3qRKYE/JmqvJLOkH
 XMBlptKd2wGWVC+6RqqCny/WWLBoZi25MN+Xw2VO5QSyv404DsaKBQZTJ09C2kEvSWY9
 TeHQSOsg/KFEEp/fpqd1NtIAI9Pbdt5+k0nXjBclfHnEYxKO5zdK0wIT+kyzULz5WLfB
 ZsDzs4IKlQcFXAcegNpsLQCpfwtiVdtzC6tI3j11EhHzPYo7GWqad/EgLwXHdtCd+pB0
 EiEyziOE4GWH/ei4jKoOuBXbTA8qjB2NNQ7hWL2SVYzH73WdALwhR/5xdlsaqzPEPz79
 kpzg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aax/ghyd
Subject: Re: [Buildroot] [PATCH 1/1] package/rust-bindgen: bump version to
 0.72.0
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
> https://github.com/rust-lang/rust-bindgen/blob/main/CHANGELOG.md
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.05.x. Thanks

> ---
>  package/rust-bindgen/rust-bindgen.hash | 2 +-
>  package/rust-bindgen/rust-bindgen.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rust-bindgen/rust-bindgen.hash b/package/rust-bindgen/rust-bindgen.hash
> index 0718bdc696..dc79a62ddd 100644
> --- a/package/rust-bindgen/rust-bindgen.hash
> +++ b/package/rust-bindgen/rust-bindgen.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  20d32e8e182ef49694a65a4a18d624cac7caa30b03422212d503a7edc0d04f6a  rust-bindgen-0.65.1-cargo4.tar.gz
> +sha256  f131b9cf87ea0a5db33ff3ad711aec4dbc4d383536f5f2e37493d63cbe95428e  rust-bindgen-0.72.0-cargo4.tar.gz
>  sha256  c23953d9deb0a3312dbeaf6c128a657f3591acee45067612fa68405eaa4525db  LICENSE
> diff --git a/package/rust-bindgen/rust-bindgen.mk b/package/rust-bindgen/rust-bindgen.mk
> index aa0d7d44a4..349d4c3670 100644
> --- a/package/rust-bindgen/rust-bindgen.mk
> +++ b/package/rust-bindgen/rust-bindgen.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RUST_BINDGEN_VERSION = 0.65.1
> +RUST_BINDGEN_VERSION = 0.72.0
>  RUST_BINDGEN_SITE = $(call github,rust-lang,rust-bindgen,v$(RUST_BINDGEN_VERSION))
>  RUST_BINDGEN_LICENSE = BSD-3-clause
>  RUST_BINDGEN_LICENSE_FILES = LICENSE
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
