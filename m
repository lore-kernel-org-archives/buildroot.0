Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE88B107BCFE
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 07:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B054407AE;
	Sat, 14 Mar 2026 07:54:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iYUSLrRLz4a5; Sat, 14 Mar 2026 07:54:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7DFD40FED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773474859;
	bh=S+JwQPIVhsomdqFFgGtoa473JOIw3JlHCfGWGc6LN+A=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kH+Fak/a+ggVDcrBnMuXxkR1CXArV3OpFvXE1jGKii2YrdHZwSNAHGvq66XWqh68H
	 BcaUGqXLhJC9ju4uvjaZB1/FtQ6q339qpx80mt4Jyp2Vb+1Ya/frTtT7upSORMmlCU
	 vRr6Ib0L28hNTc0aklZq8BVLpopezqkG9+Jd1ac5Lz6WVgKqpCL4jt94Xfz5bHU5+n
	 WVcjHXqJ0GqsYHte+jtqbizq381hiTYX3hKnZu4tzDPhuBlIZSulpfs5JY5PVCBANl
	 kmawJnc1xAhlJNk97S2fUYLgU5XnkHpwEK/CtVjhz1Vr8tUQ3Fk0AXcOR8WqLoufZX
	 1Mwp0iqrD37fA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7DFD40FED;
	Sat, 14 Mar 2026 07:54:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 072B8201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04AFE40FE9
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:54:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2WdsNQn1I6u5 for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 07:54:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ED2FA407AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED2FA407AE
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED2FA407AE
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:54:16 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-439bcec8613so2301965f8f.3
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 00:54:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773474855; x=1774079655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=T3Ujb7MUwNnbDF1jtGP4Co2THF2kn7EzbZNg9q8iD+I=;
 b=kleopm4rWOtD1yKx6zFLNyYY5iKVgo/qk0+9UyXVu5BxIHgPhVpqMuhDK38VKnPDHS
 pTgJVGYB6/2YIGxmiumeMElgDtcrdgKcVZk8Em2i4dyk4zQTyluF7PUvysa5LrSaZnCJ
 bsZezsh8oY+kdfawPlxakcoTEAD9UZrjKLJqAbduq5b2FP2dpoJvqD5pKfVunWAvn7Sm
 UmV8YogpCqL1Ylh5pXnzqUEvPR6RpxZBgWYqLIG1qq9GDhWQwMqnGRv49cLlsHGfJRtB
 RFbFV5ekbp475lrcFLmUMF0udHSwach9yMA7woNpCpocha6sfSJhuWj6H/22wzeprjc6
 UiOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUesE/eMNSuxgXbwV8S5MdEeBZC8NozP+xp2yGa79KsSccjQkTU1MKEjM1eX2yM/vOFGKIaurlXyyA=@buildroot.org
X-Gm-Message-State: AOJu0YxwkCGZvkFVi2FHvd5JLnDkObRDdVQMQnDjBI6MHNF/HhA87lbK
 loTtKxBub5Cf6sDjfVFnoVPIJaNV6jUiwCRCwl+Fiq7VGpd1K9A3HNJesPw313noERg=
X-Gm-Gg: ATEYQzwB2ypSVZ0HcP9K3dzp+6qWxgjS4QajgweF21Rgez7hTsABjb9A0XlBygE2oow
 WrhyGCR4tp9zN8rxyukTAKiHoZ0Lr+ltDnYw23Y5E4h6jnqaRfJPwHajKAGKoSsYuUhSDoNJJzR
 ELWqEZTIWIIC2UgnrwFsNoBQoWfsKOjsH8AnAPi1+eXjjOZ76mR9c6Wt7ZrdxLKSsPYRQj8La53
 XioUc/7x+/aFiMMQuUdhPgceZ+oVffRx1Alc42b0gmJcmAx8Emb6eBrlTz54QKLOsTFciHNqYOz
 t09lVgWdp7Wp80fZV2YfSrNAi6B10cLdhdto42tTCHTb0ybNZw4JjZ/zmECHBWMa/VmYjyqLaJ3
 ns5ezpmErA5m/Z38GlUBNyTACnAMqviHM4uFkW1bHcAElB3a/PG3z3aOSWNBR1p/a5A6xgpimqh
 swPq0Y5wIuRteI79c=
X-Received: by 2002:a05:6000:40da:b0:439:c661:3245 with SMTP id
 ffacd0b85a97d-43a04db7ed0mr11003643f8f.34.1773474854594; 
 Sat, 14 Mar 2026 00:54:14 -0700 (PDT)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b3a09e453sm1426617f8f.0.2026.03.14.00.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Mar 2026 00:54:14 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 14 Mar 2026 08:54:13 +0100
Message-ID: <20260314075413.15419-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304191607.3488559-1-bernd@kuhls.net>
References: <20260304191607.3488559-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773474855; x=1774079655; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T3Ujb7MUwNnbDF1jtGP4Co2THF2kn7EzbZNg9q8iD+I=;
 b=W+LtVD+iKu7Sb7nFHQ02eC53tgyNXEJQ7nknf0zGR+0Ttz/CfJRg3FHFVGY1nVjp8B
 /uwpWvdJ30Q3VvK/yXOmDBAMTCEF3p1zWld1UlK2vcu24COJ+aftIFeUyZmmS/fsaxEq
 y+ZXPQYGzE2VEzwrcMFARoUBazu8EFfPxGHpMQ371AtCAG7SgJxbKgCHFSZT+veHN9wu
 3F7vU/RwjlGKrIT3cIfkP7u21zbCqxuFkHrxGKxV9+ahjWPlCz8qAO6Nw/Q+C0WW3J9r
 RCSlOxae52cG/I/Lc3hnKyxrw8B8+EXNU2MMIhLCkHW/hjyN4TruNRk07a+F1XPKvYZM
 2JQA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=W+LtVD+i
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: bump version to 18.3
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
> https://www.postgresql.org/about/news/postgresql-183-179-1613-1517-and-1422-released-3246/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
>  package/postgresql/postgresql.hash | 4 ++--
>  package/postgresql/postgresql.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
> index 8d47db5b7f..58eab8e548 100644
> --- a/package/postgresql/postgresql.hash
> +++ b/package/postgresql/postgresql.hash
> @@ -1,4 +1,4 @@
> -# From https://ftp.postgresql.org/pub/source/v18.2/postgresql-18.2.tar.bz2.sha256
> -sha256  5245bd1b79700d55b8e0575be0325ef61e7bbef627e6a616e4cf36ad4687be36  postgresql-18.2.tar.bz2
> +# From https://ftp.postgresql.org/pub/source/v18.3/postgresql-18.3.tar.bz2.sha256
> +sha256  d95663fbbf3a80f81a9d98d895266bdcb74ba274bcc04ef6d76630a72dee016f  postgresql-18.3.tar.bz2
>  # License file, Locally calculated
>  sha256  3d6af92ff8a4c2cdf69afb1cf44edea727922f5cd0cf8b5f72b11cdecac8fdfd  COPYRIGHT
> diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
> index 542fe05264..fed3887ef5 100644
> --- a/package/postgresql/postgresql.mk
> +++ b/package/postgresql/postgresql.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -POSTGRESQL_VERSION = 18.2
> +POSTGRESQL_VERSION = 18.3
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
