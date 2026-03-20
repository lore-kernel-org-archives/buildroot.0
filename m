Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F31F810987A1
	for <buildroot@archiver.kernel.org>; Fri, 20 Mar 2026 15:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9AC784878;
	Fri, 20 Mar 2026 15:55:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pqBjspgfcntq; Fri, 20 Mar 2026 15:55:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3750F84885
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774022100;
	bh=f6/185VOEG7R8KFFqsyobKPwr7SvP3CeHW7bJEoZIew=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PzxpIQDZYn3Tt2b765DedGQfMSmRA5mocTPGjmbnIs0bRinRXgwcN7Tmh8DdN0f/6
	 2316dkUzz07RktCx6D4hcDt8NOBPlvHNg/m+WH4z1PNjrPHzbAsRknZg8m8lz7NN8T
	 4Qvq6nACR74FyjnE4ttklL0RFUAnj5eHszbBd0tNS1VS9HcYJ0+yC5cubyy0uOnk7c
	 l2TrMDtiId60a7mkbVoRnLrDi6KMgYpK4ha0h7gxcfn6+ShHmQtxuRqOK3i9ygo1hH
	 X3hXD1ZnfMQMYwtt74JQZjgqvIAbqClzYLbXxPCFGiscoc37+TO0EOunhwLNVI1Nlm
	 ojAPlWoaFMqLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3750F84885;
	Fri, 20 Mar 2026 15:55:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9556225C
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7AEA440139
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:54:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1wys0Fn5pXRn for <buildroot@buildroot.org>;
 Fri, 20 Mar 2026 15:54:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 67FCD40336
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67FCD40336
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 67FCD40336
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:54:52 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-439c56e822eso2134447f8f.2
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 08:54:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774022090; x=1774626890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=i6FL2+v3KETamqlvmcXQF6StNdFQ3NhCK9bbWhFg9G8=;
 b=cOF8HheydK0m925H2nEffGmfC61ZMPnTOTx3xJIoF7ILT46qlxYTvDbYV/pras6jvp
 GjKrAuX1ymvbPl8tQ/paMlAVms+AUMHak222AA3JRzmYS/HvZvn/GA7jwwp/VgVZWEMi
 NMPb3hFzMW0ssI7PphMyzsk8DfTecy/nJsPlRHV4odJmknI/MjWvi7J1z05dCFgLLNL6
 2JJzMws2TUzqQ5y9kxR+H8h3+xr62xwHNoobRpzyUqKc0M45ANVI8DbB9q7vdXMi6Wow
 HGGcU8WrxSZlYfBtmTodf104dmvC/r7YETHKVEjOBjjS+AgmqYZhc94DnKCQ//xH902S
 s1Nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDvBCt3UziAoopWKTKCUjCNInhJlvbMLn6/aRG90oNcn3mIYR3HLENuWMA/6jjOgAZy+MhDl+DBKU=@buildroot.org
X-Gm-Message-State: AOJu0YwErQG5xYjpgMniMQxMUPISW1i7AdxNWQO0EOtQTlXSkDQZlTj1
 0AYB1C8CeSDg+EvCM3JbL6c5Q5eEaPZVefeNtpAKIJ93nXFR4DEpLFmkokcgdi/krUc=
X-Gm-Gg: ATEYQzxIwO6vrsnEQJovlfVi1JwHJwih9WG8vlvC9dE6RjK05BuMChhLQP8UuNo1bAS
 7VYRi2jtoeBCEQoN36uyGsx5vEIH6PTm6Fh+S8ERvXL/KaGNl9CFE/FQ4r7Stym7BPc7Wy1/4ZU
 51+WTqavvkB5Da0mzCBqirizjQIhm5ab9x9ccirGYXNZsthPVkgx9WUKkbnqXjfNjlxq/pY4TJF
 T5YXieNGNt0Is8967ZWGOGWST8dOZROY/b6zo5UpZLooZXzm6rQPvGlbSKeUvAH+CAEKm8TSv/q
 y7dCd+fNro1GF/t1vcqTEaLYHc/FqAWBLg7p8L+8yJ9uorNlY08aTXzEo2HR2DnrhsTYWwuiOKg
 S6NAJkZKbVKgo2di6uw7BFfhQSs1I9rXQnPMaztFH6eX54yAegc/A3I8orbpJHyFGMOzHc+iuTt
 LSUOg77UBhAMMo8eOp
X-Received: by 2002:a05:600c:4e49:b0:486:f9a4:d487 with SMTP id
 5b1f17b1804b1-486feb6253dmr50295575e9.0.1774022090165; 
 Fri, 20 Mar 2026 08:54:50 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486fe68ec05sm117102505e9.0.2026.03.20.08.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 08:54:49 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 20 Mar 2026 16:54:49 +0100
Message-ID: <20260320155449.176202-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260315074850.8072-2-bernd@kuhls.net>
References: <20260315074850.8072-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774022090; x=1774626890; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i6FL2+v3KETamqlvmcXQF6StNdFQ3NhCK9bbWhFg9G8=;
 b=S0Lmm96T2mU/HZGwJ7kt2cj5p8WCGVSBdKXJrL8gJIqxd/Xo7PbNDMtVqKxlP7bNgS
 WX1xqsv9zz5fYZOKehOYbiMk+tepUQLyQ1CRu/pemUoFE66KDxUf/fWrjeySXDiWiOw+
 Lkjnig25YqZaN3OnrgqtTI7PXJid9fagn+CAuSyfSF3oivj7l1TM3LvkGTEJDaLpVyJk
 p8OHXYGsmORcqEoW6rPtswBtCEC9SGblU6x54mTN7L//EgKPjUZKD51DzCwtUyUhH2n6
 r8c0+m4/T9PCfjfUXwFfTI+piBy9MvEmhRaMXS06gC4GLnpAqbZaQ7OVx1mKWBGm/SDV
 5zkg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=S0Lmm96T
Subject: Re: [Buildroot] [PATCH 2/2] package/sqlite: bump version to 3.51.3
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
> https://sqlite.org/releaselog/3_51_3.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
>  package/sqlite/sqlite.hash | 2 +-
>  package/sqlite/sqlite.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
> index 055e935a4e..7c5068c7aa 100644
> --- a/package/sqlite/sqlite.hash
> +++ b/package/sqlite/sqlite.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  fbd89f866b1403bb66a143065440089dd76100f2238314d92274a082d4f2b7bb  sqlite-autoconf-3510200.tar.gz
> +sha256  81f5be397049b0cae1b167f2225af7646fc0f82e4a9b3c48c9ea3a533e21d77a  sqlite-autoconf-3510300.tar.gz
>  sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
> diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
> index 795bc32dbf..e9fb874399 100644
> --- a/package/sqlite/sqlite.mk
> +++ b/package/sqlite/sqlite.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -SQLITE_VERSION = 3.51.2
> -SQLITE_TAR_VERSION = 3510200
> +SQLITE_VERSION = 3.51.3
> +SQLITE_TAR_VERSION = 3510300
>  SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
>  SQLITE_SITE = https://www.sqlite.org/2026
>  SQLITE_LICENSE = blessing
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
