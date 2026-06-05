Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6295CCD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AB7382BE5;
	Fri,  5 Jun 2026 12:50:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZeFfVKLtlZck; Fri,  5 Jun 2026 12:50:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6619382BC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663839;
	bh=FvqUFmwNxD014meSOotmSItPffcXVLmFTEt3ByMjAbY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gdb7b8WnboqFn9gwaTRBb+FzbkRHNpKioHc6VX3U1t6G4hDGqO0aDo5uCg1dZg6Z1
	 yThgVQrCOXU0dAfh2UXPs8c+46p3DxFsOCiUvebfB9ikrlX0Z7eqrpW0eni2krO1tb
	 R/xgJAt4fjIZl60zG19OHUsrARYtS3GA1XYN/WpRfiD2z4HikXBD0GBoJfvMVlorgl
	 9vMDNEqIZdOcUQqj6ANZ0y6f37RoTguT8WX1r4KTf0Uteq5QwcReipxzw5X/9m8qnw
	 vlvy3mPqOq0e94Ge8f6zNwz2EbK1J8W9SPY/UUw9rDDlvo6wPKoomdVyckVjNK0dfx
	 K/z2SZN1NC+1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6619382BC3;
	Fri,  5 Jun 2026 12:50:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 81F57F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7421E82AA7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3cuPDhxxyDCi for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8BDD382A5D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BDD382A5D
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8BDD382A5D
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:32 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-490b7866869so22370655e9.2
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663830; x=1781268630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=w4ppLqhHm7EgspIb2hxfmF7K8ebwMZuGMo3eRnC9/5I=;
 b=gMyOB62yGpOlOSBUA+Jb2sNkMrpUcZIzhZxItdkNFny3EB2q0Dv1luQzKKj9ts7Nka
 0FjA2H/+RUDh1dGcz7hiRbiEmqO3zowbKs9SPRZy0xumG2aowZ6lkwZ6Jy+kIbSSIkj1
 01CwDUj3F06oz7h+zK6WhPF0ZST2EFhpYHbIuvTHxnTVY4LdcImbuMPX8k930tZgYTRr
 fnM1zgRUiV2A8Uc8e9HRd2j9v9k6EsHElAIylxBHIU6KK5Bs+FuIOJ6jWHJvXIXwiwCg
 GLcvIhgR4TQPRSdTOFqD3HQu6BQUA0mE5XNS2Y+IeDt1DUQL82TAKnvAhl3ZLbmjHg11
 Sacw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/Pztr071h8CmsX3fErNfU16fOOejWKV+sInEi2bauZwoLUINpj+fxw0cEfdvDhGGdm/QITnR6ejqI=@buildroot.org
X-Gm-Message-State: AOJu0YytYfWglxegPtpV2zyISZkpZIE+jwleaixgoWZC61ZjcJBWFi23
 4+0drTYeQWWSIVKbqev3q6luhaLbDbsiTJ0lqtLwowd9J/tzoGh/lc7P7s92SZvZGmPMQuFPU/R
 Uq2Al
X-Gm-Gg: Acq92OHfMIxSdsh+5Pg+GdXaDgyg48s1YbQYNDShh5J1f6MLb8xtwSmO+fr3dfqLMMo
 Rm2D+v/sV42oMYIiGtAIoeEWZuNQ9la2mHXnjFfHNpML69aNjXceWMxfScpulfqU8Bgil53vhWX
 DO1nyABZeAASE/VtLl+QDVESzK01HQXzayL5WQhdH5phmjhD49EKo99M6NDhpcVXl8MX3oX4UQf
 EbgJYVvZ2FJ0zVKbdKeatcZNVbxCBbEQw5Qp5N5V0WSNm01VC6p9ebCFSafblKoe8pd+5QeYGgQ
 EYfVYphw1fMHb0kihccv7H3pgPbqQD66enkjJUfpTfU9baFP3dif9WgA69dQTh6NaiAhs3oauVZ
 sSERPNhL3Tc5CuXKQSle6YXjG56k/M1K8SoFsYnpsnfNcoWitnncrshKya4iC+KqeKEbhHuaqiE
 Wyib4otag2CmL9w6Shq6+YLjpdAg==
X-Received: by 2002:a05:600c:8b83:b0:490:625e:bb68 with SMTP id
 5b1f17b1804b1-490c25b3856mr57959975e9.3.1780663830538; 
 Fri, 05 Jun 2026 05:50:30 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f344148sm25422731f8f.19.2026.06.05.05.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:30 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:29 +0200
Message-ID: <20260605125029.273646-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260503144908.2807535-1-bernd@kuhls.net>
References: <20260503144908.2807535-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663830; x=1781268630; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w4ppLqhHm7EgspIb2hxfmF7K8ebwMZuGMo3eRnC9/5I=;
 b=fXRly85yAtLuPeMeitkZBVdVa0YVzw9Iy6aG9qElBBFwVHvpd3R/C5ITF5fvxDGjT6
 IHBM3SZgHCFJxYsyAj9MVDWLfFrEVrUwxqzclCmniJkoPT3NgwHSTSo88L1PiFEpjA5w
 qJRkJ0wBiSG+2pavg1ufR4tEnTKFFk3OfxZ7PmRM2OEasAcJdheP2APYXlch4tucwS8r
 vwBe8u+1yuvCcXiBDFwvgV6Ll/DjKJMdI4r+z9MlhqNJ/fvIgDAO1AcCnrOjXOehoUAD
 6i/xcvpPUCdrCCNseUTCJ9BmGT8eXhkaL5uiLYjCuMyrycL4aCLp3deHruduDocRRmZu
 GMeg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fXRly85y
Subject: Re: [Buildroot] [PATCH 1/4] package/gdb: link with libatomic if
 needed
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
> Fixes:
> gdb-14.2: https://autobuild.buildroot.net/results/32f/32f5715285ca46370df2ab35c38d16dbdbde5d21/
> gdb-15.2: https://autobuild.buildroot.net/results/386/38645389cc5fdb1d5fdfa5d6f6eef417a975ea41/
> 
> Support for gdb 14.x was added to buildroot with commit
> a9a56ab6fd98125ca09078bdeb7c8d55d53aa35e so a backport to LTS branches
> should be considered.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/gdb/gdb.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index 1841002dc1..2a2fdb260d 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -116,6 +116,14 @@ GDB_MAKE_ENV += \
>  GDB_CONF_ENV += gdb_cv_prfpregset_t_broken=no
>  GDB_MAKE_ENV += gdb_cv_prfpregset_t_broken=no
>  
> +GDB_LDFLAGS = $(TARGET_LDFLAGS)
> +# Uses __atomic_compare_exchange_1
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +GDB_LDFLAGS += -latomic
> +endif
> +GDB_CONF_ENV += \
> +	LDFLAGS="$(GDB_LDFLAGS)"
> +
>  # We want the built-in libraries of gdb (libbfd, libopcodes) to be
>  # built and linked statically, as we do not install them on the
>  # target, to not clash with the ones potentially installed by
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
