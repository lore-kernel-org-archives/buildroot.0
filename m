Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2496EC7EE31
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F01BD4198E;
	Thu, 26 Jun 2025 19:53:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RlUBZ9mv5Zd0; Thu, 26 Jun 2025 19:53:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 329AB4199A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 329AB4199A;
	Thu, 26 Jun 2025 19:53:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 98D1910A
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A5F46123B
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:53:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KRf_eS_BNfTe for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:53:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AEDF660790
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEDF660790
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AEDF660790
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:53:46 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a548a73ff2so1310855f8f.0
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 12:53:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750967625; x=1751572425;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=11OyD0XavcSbqMJSHGEEHUG99X4FQspbxoqzwklYj7o=;
 b=kCOXiEQg2P7B54UaX0ZYtqhcVsCbzm1hnxgl4xDk0wz72ccB7febs5oLzoo+OIMFya
 CnyfSyo02jxfKsv0k5Of7pLem/+TlawdAW+PT0VhJAKJgzVeGy714e4kFD0vqi6NzGvd
 H26zfAZZ1l45j0Ya2/ta7Uw3yjfJSZXIG+ZCppF+/ieRA2REw4d3d3WF38zK9YLurh1u
 pJCXyWtHQlXmxvbWfDtYoG9KSfTq8U7qpfNEyNwFwcoAsS7ZDOwXUOLb2okyT5royK+8
 7kVDICu5PsAXEu+LmTfurLmrusblkXVrSxLqGGLVWt1eMQjQSKQ3nqh3cxsaEUUvzfKg
 6U9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWF26f/sYySvqudbi1zBu9giIrNhAbucHjlFRqM/9dDD3246Bm1bYdfvnYziLYDBiwtNV+zAtciD+Y=@buildroot.org
X-Gm-Message-State: AOJu0YxQ8LbSO4oDptaxqeszBqj3G3Tzvgr5H996wMofwfiwh3oZJBGS
 rm4JCJtMD/5Lsxd/95N4jLEwEOh4UOAewC/g2jXozFPXddTq0aH5YhYeEJ7iEHWXCLFd7rClMfX
 s/2OA
X-Gm-Gg: ASbGnctBN/XTT2RGwJKyGfCEsyYzYrY4J78mHHE67cpWxlv5TESFJBHYJ7Wp0zFzyBb
 AvcsVrBsl3YtHiJLuPTGQvc9ztVo6ZubPR+5iTd9bn/Z9EBIAjPFGwIElwhf34cn+9GeY1O82DV
 aekLEizhTIu9XlVtqT516t+jLv5F5YHe2Vht+hPxQV6TkG1sRvgFb/Zx00Jd6rwTIaVjpaXhhyS
 cgIfnSRWBHxzag+DkVa49mwRj7U0Pw50nWXbz0pcXoW7l3OLxd3drSiGzHttCjbT76sbvy5YbNd
 If1/KlGkaCAfs/rJDeRuc06OhrB4+tmYwfYdn3/t4z2APyl90+YimzmIJV8UoYUeuH6t7CrK2+W
 Q6j3nPWbxsniDkq7CU+CxTD+n9+AidPJq
X-Google-Smtp-Source: AGHT+IEverLac9FaAHKi3s1gbdnjCpJlc6aRySSt2sujpPWmWUrfpQhB+eAj4eBgRuppBKadzfJT5Q==
X-Received: by 2002:adf:c084:0:b0:3a4:f9e7:2796 with SMTP id
 ffacd0b85a97d-3a9176038c6mr484769f8f.35.1750967624773; 
 Thu, 26 Jun 2025 12:53:44 -0700 (PDT)
Received: from localhost.localdomain (94.105.118.175.dyn.edpnet.net.
 [94.105.118.175]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538a3a5fd2sm28601705e9.15.2025.06.26.12.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 12:53:44 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Jun 2025 21:53:36 +0200
Message-ID: <20250626195336.15236-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250615161635.2499294-1-bernd@kuhls.net>
References: <20250615161635.2499294-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750967625; x=1751572425; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=11OyD0XavcSbqMJSHGEEHUG99X4FQspbxoqzwklYj7o=;
 b=AwLD4JZanG6ZTgi6REarXshht8T7ZVB5nUS87XnsghWmy18sbFbTsM8zjmwdgD4UqC
 BBbNkgnM5t9EFEYtV9CYJDCbkl21yLUU7ZlkIq+6CbDVjq5IzG7ZAuCsrSUNDXAAzbsx
 FC8mXQoalKFRawK78m1SMLvPNlZswjiPexYLazvblnTPOGu71X1OXyV6QHJHkCKdgrGm
 yDUX2/MmGESfazR8rM84RXLAauT4sIPm1BDTKQu5FIxLO8bAFMCx2Z4CM1oGVpA4p29l
 +mcnTfQlwW8JtwTBHMB01JC92yKM6E/7LLXAmg8JqvccTN6CPeTAjgUd1EjlxrCcHz63
 qrrQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=AwLD4JZa
Subject: Re: [Buildroot] [PATCH 1/2] package/samba4: security bump version
 to 4.21.6
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
> Release notes:
> https://www.samba.org/samba/history/samba-4.21.5.html
> https://www.samba.org/samba/history/samba-4.21.6.html
> 
> Version 4.21.6 fixes CVE-2025-0620:
> https://www.samba.org/samba/security/CVE-2025-0620.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.05.x. Thanks

> ---
>  package/samba4/samba4.hash | 4 ++--
>  package/samba4/samba4.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
> index 86b11b4d1f..6c4205853e 100644
> --- a/package/samba4/samba4.hash
> +++ b/package/samba4/samba4.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature
> -# https://download.samba.org/pub/samba/stable/samba-4.21.4.tar.asc
> -sha256  50acf030db0ce6be1ee8a6c3a7636e54576c60a7f814e64becfa840f7b30eced  samba-4.21.4.tar.gz
> +# https://download.samba.org/pub/samba/stable/samba-4.21.6.tar.asc
> +sha256  681bad60f57959436350751bc89e893b8c106ac882cc7420f93f419e1d188688  samba-4.21.6.tar.gz
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
> index 828de56fc8..7ba0aa3346 100644
> --- a/package/samba4/samba4.mk
> +++ b/package/samba4/samba4.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SAMBA4_VERSION = 4.21.4
> +SAMBA4_VERSION = 4.21.6
>  SAMBA4_SITE = https://download.samba.org/pub/samba/stable
>  SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
>  SAMBA4_INSTALL_STAGING = YES
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
