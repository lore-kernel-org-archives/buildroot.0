Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A480ACD98E4
	for <buildroot@archiver.kernel.org>; Sat, 20 Jun 2026 09:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AF716FB01;
	Sat, 20 Jun 2026 09:10:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JS8oXIke6LRq; Sat, 20 Jun 2026 09:10:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B75186FAF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781946643;
	bh=CO3cgXzNZZNboJpzT/oc6v6tFtUpmvAqOIR8BbDL6+c=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=V63X86ow4onVoBSfbNyttWKckDyFGZDgR4f1MSZYpOINZAUOAxO0Y6ZwLQZTbtLhR
	 IWbIFbsAYxKqfYHpid6/SPkpzax0GKHJoUOgxN/Thjwza2eFaFuIN6JFBooPVcqXsx
	 tNx6fS180klRuBDmvf6I4meoXhjJqsMQn20mT7ym9LJqijW26AA9s1mQryMakLatoT
	 7b1tEmtsib6JlpHAw+LWlhdv3tIrnbzPwSdndsrtMWktepbb5TVeuhwK2BGbe9wh8w
	 /6N5wbtCmbw1wOYc9EfSa1k7B0nWZtjAXnKo41+DhFrrljfSPWqB+21SEFsnzYblT0
	 9WVNx0MZThmHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B75186FAF1;
	Sat, 20 Jun 2026 09:10:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 40C7DD06
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 273546FAF2
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:10:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cEwMvmSsSo6M for <buildroot@buildroot.org>;
 Sat, 20 Jun 2026 09:10:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2BD626FAC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BD626FAC4
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2BD626FAC4
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:10:38 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-45eeea039ebso1594781f8f.1
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 02:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781946636; x=1782551436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=M3xUeRYY5VDyuLXfmaEonBVUPJJCgBQudOi7rWCPiEI=;
 b=WtPmBzMa/wd83D46n/gfy2ocPQCtoEPxwJpEgpxWB0iSzZxAYrQkt2yMqq76qQ0va3
 ace9szg79hKtXQo+rfJh9Aaq4TmF625AeIf0bEkVYyqVfCbncHCQLPrgA0A9hpI3OmtT
 O3Qo/eGo/Z132PQ5AOCTHq9tPRghbsdPfoTtGi/ovSvn9LHWfbfkC59JuwqugZJ1Xk6z
 n8+85Cu4jVkS1U6Sb4yPWtzbIjcYaPtZZ/gKZ+Wjl87QVXtXRaaOXZ0Tjw93jkJazu5C
 VNmNa4XFYcyXb+DzPqpS8Mgim4Vuw/LMz60pkZPsKw4u3KCFEYtG8GBrb8pwJVgCRKPu
 AUSQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9i0CKyTiD7vGu4pniCNXPB9GLjv0XQxQbjjXIWVdIyIlxMnayDU7UOXRE4dt3D21FYZ2GnJAhmXOk=@buildroot.org
X-Gm-Message-State: AOJu0YwKVB6XdI7a8qgplElJbIGAlACYpVGGnfrvu2YiQfuPSdD7Ff/U
 VC2veNImEgxybuhH/IplvjEkN2H8L3Y+9fCtSv6B2Kxwuy5/eMS/sOnZPfNYLASPst0=
X-Gm-Gg: AfdE7clBTMa8P8iDyvCB6amFnrzwuIhy6hg46I+VLD/ZvsCoYvOxs83Tn70LqXo93GJ
 uUYs30WI9Nm5fMqHufBMJyk7BKEdU7R1ieW0c/QLHev5Gs3KQtVal9pxg9xqTF0Ycgv3jJJU8j9
 7S14JwLi0lzPD3cajXciUMtujhVDkVFb3yx4nsqv40dW0sh0/t5/cuBXdy2fJfQds+R8ys9fxkw
 oohBiNnJ3zpidt+LnVURbWKeHL3kt+AMC1NihHP+T4NQXn1QVLZKC03i6U7XX2lIC7um3XZJev+
 EZtnm+xiur5erNTFrTMzFqulmECszd33g1LffHPsfftzqZa16O4zml6RNqMHQCzR0ZUCubVTiKS
 C51FxYag7wfgcJEJz93wJcMUgaqKt8xgyj4CNQkjbjyEXto+k++bZKqQLH4ZRsjrMX4AVroS1Ik
 DjlddBQGCF5SaYnZM=
X-Received: by 2002:a05:6000:290f:b0:465:1c33:1494 with SMTP id
 ffacd0b85a97d-4651c331624mr10757950f8f.2.1781946636205; 
 Sat, 20 Jun 2026 02:10:36 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46666c579d4sm6804635f8f.28.2026.06.20.02.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jun 2026 02:10:36 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 20 Jun 2026 11:10:35 +0200
Message-ID: <20260620091035.22178-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609150410.2888215-1-peter@korsgaard.com>
References: <20260609150410.2888215-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781946636; x=1782551436; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M3xUeRYY5VDyuLXfmaEonBVUPJJCgBQudOi7rWCPiEI=;
 b=dj60aLYxYbiLC7jwZ9jy6cpMHZCiaDQ3msl6kzUZNnm4Xe6a4rhfwdyygC8kJAZWa9
 qQrPXwvO5z7kO8pKdGHht3TCEkBCyaR6/T59yJ6rwqJ7Ny5gkKZK58jT+WctXOugqBqS
 owHGCtzB57ufgmbwVsdoS7X9CLZ6IoFiVMVjEfDrKwee5wz/41+6epJuqhvdghgn+7m9
 yPDkO2Kz3Cok0KsvsLRNQo061b535jN/CjstFkXWM2bbH+PgWsPCmyn5Qf4/Opl89NoP
 mmJ2B7oZ8VAng2rjPBn0XRT30U5OqmmsTV8+tEGVanwOWFuPPWcneHPHMy7370gtGfJD
 C+6w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dj60aLYx
Subject: Re: [Buildroot] [PATCH] package/rsync: bump version to 3.4.4
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
> Bugfix release containing a number of fixes for regressions introduced in
> the 3.4.3 release.
> 
> For details, see:
> https://download.samba.org/pub/rsync/NEWS#3.4.4
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2026.05.x & 2025.02.x. Thanks

> ---
>  package/rsync/rsync.hash | 4 ++--
>  package/rsync/rsync.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/rsync/rsync.hash b/package/rsync/rsync.hash
> index 666bb5cf99..2deaed0674 100644
> --- a/package/rsync/rsync.hash
> +++ b/package/rsync/rsync.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -# https://rsync.samba.org/ftp/rsync/src/rsync-3.4.3.tar.gz.asc
> -sha256  c72e63ca3021cbc80ba86ec30102773f4c5631fbc492b52e773b3958f82a53d3  rsync-3.4.3.tar.gz
> +# https://rsync.samba.org/ftp/rsync/src/rsync-3.4.4.tar.gz.asc
> +sha256  bd88cf82fa653da32314fb229136407c5c90f80d1758d8f4b091767877d8fa96  rsync-3.4.4.tar.gz
>  # Locally calculated
>  sha256  85c19ea50a224c2d0067a69c083584e5717b40b76610ec1218f91385775067dd  COPYING
> diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
> index 5b4345d036..5dd89a82d2 100644
> --- a/package/rsync/rsync.mk
> +++ b/package/rsync/rsync.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RSYNC_VERSION = 3.4.3
> +RSYNC_VERSION = 3.4.4
>  RSYNC_SITE = https://rsync.samba.org/ftp/rsync/src
>  RSYNC_LICENSE = GPL-3.0+ with exceptions
>  RSYNC_LICENSE_FILES = COPYING
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
