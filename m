Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9AE10987A1
	for <buildroot@archiver.kernel.org>; Fri, 20 Mar 2026 15:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DDC941CD6;
	Fri, 20 Mar 2026 15:55:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Kp4DgTdTWKf; Fri, 20 Mar 2026 15:55:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A26FA41CED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774022121;
	bh=QueY9UI3MWtrV3xje6IgMEB+vi/MneNJFZ31TVO+bl8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=E4mEODXV7Z5tEKM/IajNoWFcQEmC61utU1KRdSx0DYQCaE9TdU53UrQOJEDU2ZK0y
	 +KvmSULXGrj/oB27qCiTL4RNluuPwu8BpqWZMLj0vDGmqxojaI2eNtRFHjorKdCvnv
	 nuzJMtJT4nVVuS3HGXW0FFoRJ36NIyH9crlHs4RW4NoRXF1v74WkRUjQmKJayKBEU4
	 8Ohg26UwXsDETlLbCE5bwDzLHVIiJJlal1S47nJOIwk0czkogKq16GBOukCFRM8gmF
	 1KjPtMWIZz4bJ7mAjDbJhNEsaPK4qrBZD1TqsHOAkTlBlTCDtIfBiA7JxnOkLRhrQf
	 rhA4UctqS5AFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A26FA41CED;
	Fri, 20 Mar 2026 15:55:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 407671B6
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3062A84894
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zi2DjaIbZdZp for <buildroot@buildroot.org>;
 Fri, 20 Mar 2026 15:55:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 04ED284895
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04ED284895
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04ED284895
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:13 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-486fd3a577eso6431355e9.1
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 08:55:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774022112; x=1774626912;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=J2P8BaT566A5iEHkSCqxgkY5n/NjJ05Rty+rviYeXQw=;
 b=JlGsQ4+ACAKXdy1UsfFA6u0pesg1jwNMIniYUBXJUjhoT7o7+1IqQoh9O5cenib5Gx
 3D4EWHml6VcyHIcqstdy7Z7YT2J9si8f5iAiIQpwlSBuvxKgHOQ/gaHGg8ZOX8eaNLtA
 7smJ/btFG8ZQ86QneIMYogJ/d2XTWXipCguMLks1BHgIqUtkbYhgryRZ8pNm9NGg5BDZ
 fWQH3kptQ9tFV1Du7t1K97teeJa/V69TI99lUOC42qZNTXLD1zY6+GHF7dXl3ZzjNNZC
 ykbQwKfAWgp5QlpCx7V+aBnJwc7m66oWZPhIWNBXLeM/l6mxkcTp185vVpXi/xy/qXdu
 IGxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/XVwKZWjiv+MtSG31HP0y+s4rou2P3RuEv2dfRbKidjQeg+FCosA5WRTphY29xPv7OmTNDXS/ItM=@buildroot.org
X-Gm-Message-State: AOJu0YzNAT42Lf4iTdClw7bLcj5WZHtUg1+b8CaF/AuGqXepVoy4xQdq
 o9KTt4c3K/oMDBMT14cFKUECbo148pzOQU4Pai6pWC+SZS49LdMNypPgQ83tm48gXnk=
X-Gm-Gg: ATEYQzx8LrqQqOiz7tR2yaZIOBoaOhRqYGfnKFnzYhfYduuFgGgn0EtlYfxjLmhp/ZV
 PDJk3Xo9hVgWkBSqDkcJJF1rgu4vsGmZfUKRVWzHlxNRS/+Dvz+JdwGc4dKk2hEvEkaXZ8gXhRv
 PGqpcKo+SjyCjN6p5dJhU1j+bAgfeCzBuvXh62F4mUdT9WKLspUMLi11ZVgo2AYK68oSJRiJKvo
 NN14wO+mCRyPzDBmeUBd75T+W9KrVBvtq5m5Yx94AHFKkw4DfniI0QzUkenp7r0JbphgTQgYHCu
 bhB0wBHxH7BPLIW90iqaloUZs6mNJ5JDAOil3/e2OQq6mM+S6fk5t+DULYcYns7NUv2yje0dBvj
 gsq3Lt0L2s4Y6PoNNKtBFtscA/NR9cCqDhivI3WJU2ylr30bgz6qzREGBQozC2dukrKDLVlOzE3
 SeN8x2bEgdMvkr9pYz
X-Received: by 2002:a05:600c:3b07:b0:486:af22:4a2a with SMTP id
 5b1f17b1804b1-486febbc445mr54408175e9.7.1774022111939; 
 Fri, 20 Mar 2026 08:55:11 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486f8b1fe65sm134857975e9.5.2026.03.20.08.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 08:55:11 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 20 Mar 2026 16:55:11 +0100
Message-ID: <20260320155511.176897-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312163926.3178494-1-bernd@kuhls.net>
References: <20260312163926.3178494-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774022112; x=1774626912; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J2P8BaT566A5iEHkSCqxgkY5n/NjJ05Rty+rviYeXQw=;
 b=CwBy6zf1k6qmLrv2USgq01XuDaYBJ8MyfsrCU3u/IeQi2xEO/L7szjmrmfF7/DnwrZ
 +YDEO/brZb2Z/mO2lpEpmJqOjDGBU6RyqbhcFmkGKHqrP2oTkBIHAG7Su0LKwGvEKg9o
 yuJc9+Zsoxb2Hp/+VyoYYY3cF2RisTRZk8mfZTiZLBDVvVfIBDpjWUkgc62ixOLxoAhc
 NDKBnNiCq0otvw3re/+hesQGAudIK3SIEyKBbT0dvlWvdmqGmW57+bG8RHLcJZe7GX+S
 +CTYBvh12/Fg7MhBm2WNMKy916SzZ6ZOH0CBJ4a12I63pYxkeA9Q2Y8wiCNMy40iQMjQ
 QDNQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CwBy6zf1
Subject: Re: [Buildroot] [PATCH 1/1] package/libarchive: security bump
 version to 3.8.6
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
> https://github.com/libarchive/libarchive/releases/tag/v3.8.6
> "Libarchive 3.8.6 is a security and bugfix release."
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/libarchive/libarchive.hash | 6 +++---
>  package/libarchive/libarchive.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
> index db7ed95bd9..be357183e2 100644
> --- a/package/libarchive/libarchive.hash
> +++ b/package/libarchive/libarchive.hash
> @@ -1,6 +1,6 @@
> -# From https://github.com/libarchive/libarchive/releases/tag/v3.8.5
> +# From https://github.com/libarchive/libarchive/releases/tag/v3.8.6
>  # After verifying the pgp signature from:
> -# https://www.libarchive.de/downloads/libarchive-3.8.5.tar.xz.asc
> -sha256  d68068e74beee3a0ec0dd04aee9037d5757fcc651591a6dcf1b6d542fb15a703  libarchive-3.8.5.tar.xz
> +# https://www.libarchive.de/downloads/libarchive-3.8.6.tar.xz.asc
> +sha256  8ac57c1f5e99550948d1fe755c806d26026e71827da228f36bef24527e372e6f  libarchive-3.8.6.tar.xz
>  # Locally computed:
>  sha256  30e556b3959e3985d66efefec5eaac51d4995053caa1d3cffe6eb916f146f229  COPYING
> diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
> index f3e90e5910..3b8fdbae1e 100644
> --- a/package/libarchive/libarchive.mk
> +++ b/package/libarchive/libarchive.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBARCHIVE_VERSION = 3.8.5
> +LIBARCHIVE_VERSION = 3.8.6
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
