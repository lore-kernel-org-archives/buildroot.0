Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3DDCD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53DF961563;
	Fri, 29 May 2026 08:29:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Drmbe5-MjXK8; Fri, 29 May 2026 08:29:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5567C61570
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043391;
	bh=jk1iGPAWsRz33yBpCYWJG7JYA8UCe91j+EmqhBLk6iI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AidlPeYu79vLiY2+fjcAQQCpQj5bCb9vp4QfOkunulsxBPUhvkVFs4Qp6Vqk3nX7I
	 ZcwJ7tzUc/K+5/7jOAgy7rz/s/vp8atsQWUemThVUoWh1fr9CYAiPZpJVFT1z6SDCZ
	 GMUsOnAY4eYWknkd4Vn6j7wcWcRWBnQbCgc4xvD612k3L36LW149Sg+7Lg+RxPe5/C
	 qGND4KaKD3HZOYWcrFkb8R9rzOI/lwYgH69XdI29O4VxsLS2Y+HO2FpQRHGVBY5bRz
	 8U0fA0flSI0tWkJkRAiY6sPpgAnSK8sqe4+kYyggjUlBZISpmnI1++ZDsq39WL5cmZ
	 d8i8DRcwl4ZEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5567C61570;
	Fri, 29 May 2026 08:29:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 334CF288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22B58422C0
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6s54AIrps0aD for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:29:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1FAFB422B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FAFB422B2
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1FAFB422B2
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:46 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4904127c32cso46406275e9.2
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:29:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043385; x=1780648185;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qXQAfKDgZyiEWt7peIuCFDVpiAO+vGFB7f8L2Ax8SeM=;
 b=jy8tTQiCV4PAgxqQLP/Z2EnmfbEV1jwSkLToSp3CfWqJFkr9gyK0g0merpbNp4cnKM
 HQdJs8Ct6iqlvN6bKWakQtipvfLax3+x7xZORU0XGQArEwzrJ1p8H73CAYyHwt2opjZC
 6ILwhIWrAFDtxImkcSqUfznU7somI3qYJ3ZoZcW4+u+MKX171v2/f047Bf6N6HJMgHTz
 HC3MRRtH0UgdyQgpm6mQw8M+PWdHnn4gmixIK9FmTu4V9BOGCIr6drvGSBwDSbW32wdr
 CuH+diRCtJ12+WYiwuTzZ6SB01jglLc/qtoMeRKNVQ92wc3Y8O13dpsqRKdy9jp2t9Bs
 X2GQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9CPsdhKvVH4zrL8gfY/wS0NESGihVVL0O5MAf9i5o6UzzWfBKh5L2bbVI66YKyl1Tyme1wz2kJBRk=@buildroot.org
X-Gm-Message-State: AOJu0YyuguGPYg52AIhg2wYlRG80ujsuRvlAx2ucDQR0kP0hNR12wvls
 UbYHQXJjthtorqgo0UlBEx782kaysp0T7nQ/6xdS5camWuDGL5xC1l5ZByIBDkV0VDZ6n8juVCG
 sRCTQ
X-Gm-Gg: Acq92OHJDggFQXDBxBnQNK3SGzSuZPUPW/TaM7uo6uLVMsi7a/pZm+5ylnQ3af4q2wF
 sQqaJfzIQ2kcJjHP9Ci74Zb/LidZkKnHCWSBCrkmJhgqW8MBtxpkpCmT1c21gzy5MhzQ0SJaPxQ
 fsJCVG+JmWBEDVvqBvlSr6/rnEi7v6+PkGeUcmTeQqQUAIkhOqSV3XxAWpcJV3C5QTedb9nbAye
 6mslZJote4LCmmtBd7NtyRITtbm1T3DJKMiXJ3C0B7mBbzATy0zPJE2DpCSbBW6SDhYMnOyVDNF
 /GIJ/eHgfb/c7lo7sP5VcThzixGQUcZRCoBfkr3dKZzVrgQLMAHEumK3wKLQBYysFNLqoVEKM68
 hRRzwFjUEOCxrro84q/Mv4ICDB/Do0RXkI/g8BDxoke+WjOlnu6f9SD7DnxEDqfehoA0be0mgYy
 PllpMQedNvtnLJ453vEJkTGI7lHt0ixeC085fOEWwHd3iyooMtHI9YghJDEw==
X-Received: by 2002:a05:600c:c8f:b0:490:9d1b:f05c with SMTP id
 5b1f17b1804b1-4909d1bf0demr29156405e9.33.1780043384622; 
 Fri, 29 May 2026 01:29:44 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909d7002e8sm34122015e9.15.2026.05.29.01.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:29:44 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:29:44 +0200
Message-ID: <20260529082944.58082-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260517164102.3570510-1-bernd@kuhls.net>
References: <20260517164102.3570510-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043385; x=1780648185; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qXQAfKDgZyiEWt7peIuCFDVpiAO+vGFB7f8L2Ax8SeM=;
 b=gexepH+q9oQ8xqNA/jum/aRmdgdUIVx9uTz5WmkoctPNV4e1dXWB16ux+uFd2J56CS
 nXBxmfVwHsXo8LWSOvtMEnrKg451NK2KQG3aD1r/6dNHoZ3FxvPsxpb0ghHlljtqnzEP
 kL80WZ+wciZn3/NL8ZIoxBc3TZTp/LlMpTQQepj3AB5K+diabsOCEYlzozRQ2LVXKTwn
 Wx7CZQZcQTnqja52iM2JQLWy++w/DJpWoAd2xmsEgfcXKnv+VqoVE5V8YT4yu/+cFlMO
 QruAtpizWlSz60p8PyctaqTsWjUz5TIRJBfnv6URI1tGcLJIYkJGlZAvmshXhbc4/exc
 VXUg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gexepH+q
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: security bump
 version to 18.4
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
> https://www.postgresql.org/about/news/postgresql-184-1710-1614-1518-and-1423-released-3297/
> 
> Fixes CVE-2026-6472, CVE-2026-6473, CVE-2026-6474, CVE-2026-6475,
> CVE-2026-6476, CVE-2026-6477, CVE-2026-6478, CVE-2026-6479,
> CVE-2026-6575, CVE-2026-6637, CVE-2026-6638.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
>  package/postgresql/postgresql.hash | 4 ++--
>  package/postgresql/postgresql.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
> index 58eab8e548..be57f216f1 100644
> --- a/package/postgresql/postgresql.hash
> +++ b/package/postgresql/postgresql.hash
> @@ -1,4 +1,4 @@
> -# From https://ftp.postgresql.org/pub/source/v18.3/postgresql-18.3.tar.bz2.sha256
> -sha256  d95663fbbf3a80f81a9d98d895266bdcb74ba274bcc04ef6d76630a72dee016f  postgresql-18.3.tar.bz2
> +# From https://ftp.postgresql.org/pub/source/v18.4/postgresql-18.4.tar.bz2.sha256
> +sha256  81a81ec695fb0c7901407defaa1d2f7973617154cf27ba74e3a7ab8e64436094  postgresql-18.4.tar.bz2
>  # License file, Locally calculated
>  sha256  3d6af92ff8a4c2cdf69afb1cf44edea727922f5cd0cf8b5f72b11cdecac8fdfd  COPYRIGHT
> diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
> index fed3887ef5..16ed591df4 100644
> --- a/package/postgresql/postgresql.mk
> +++ b/package/postgresql/postgresql.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -POSTGRESQL_VERSION = 18.3
> +POSTGRESQL_VERSION = 18.4
>  POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
>  POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
>  POSTGRESQL_LICENSE = PostgreSQL
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
