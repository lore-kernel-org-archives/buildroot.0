Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CF0CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1DC241BB4;
	Fri, 15 May 2026 13:33:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iyL51FjZn_Yd; Fri, 15 May 2026 13:33:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E677941BBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852028;
	bh=HxGzy6wk8vjJjc1/ldbKxOUIEteBPtMtm+baGsndspg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PXto5lEaJrmDJJrj0tRo4P5RLm1AR5tsfznV1E1qTfWUtDF+5aM8wGl5/8BBLYRJC
	 DQN8QQu1dJPpZbIZDxvjnNOvamKN2+6d4N4sLu/5/9NvHo0Z9P7UzfR2nFEqTJOQWi
	 f2o26YcFzgpkfkHgIikJGo2ff2XGDocBBY6OU2inL4dfB3wZ4pf85J2Co0RawwOvMI
	 fSO8JO/+rNP/80QbqAO8KGOMnK8/2geAQ9NlnxleowBDJ1OoMR+xmJVppYq6PlytZ9
	 VNC6bEeqvTmh8CKntSdP2D2cz5bFJUuAF+WSCKmXtDdtajkYv8ILWf7uREDgyhG0RP
	 V43kDsrsqh8Xw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E677941BBA;
	Fri, 15 May 2026 13:33:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AD0E36E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4AA040E23
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ppGCIAXBHEuu for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:33:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6AB7140E24
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AB7140E24
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6AB7140E24
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:44 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-43fe62837baso4781053f8f.3
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:33:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778852022; x=1779456822;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AdulQ6SMOdOD0yb/lkQQ2NeNVHcAp5WsAQvXJ/Leg6o=;
 b=a01PbySQ9VZMKpF4pFfIuEss+6t7jgKObq9SmrdC1n96zxgr8j+A0oykh2vQ5WNdPT
 Wx5Q6/qvzBZXH/3zs0ZTVCptVzJPnJpAss4O2/HJPiQOt+AORH3NZgn93pKUerFMUFsN
 buBUIgBgpJvwL8sseiLmGoU94EljB+Z+8uDo5X1HjxztkJU6daWBIxmLUZHCniwPphwv
 lqwETsqUCoRhwhuCHHL6tsZlYgsEGUzBowOZqeyASUpOEFrzmbxBFEYCp5ZmIqYTrCdU
 n/uPxhj/VncjljuWIK2S323mF/mdRvmzwlKg/5xSBaRnadl3u+Xu92OAkwh1hrfbFlcY
 WEuQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9jBlmvuKhn9k5MqBBroMyRt3hokQ9xC+1WQiSmrFGD5UPRbbsPgQC+doteSUVe4zqkbJJBVIol2jM=@buildroot.org
X-Gm-Message-State: AOJu0YwlyRq8HuntiT/0fpeqgbQbIpJfAFLC43RYD+NEGCVgRM+sivCZ
 PuHZWFuitY7Cbnu4Szx2m5hnEf3cL2d5cPiVvYHCpWBRjm0frUL6EK4VdGkxrvt+gSqbWx0Ub5y
 oR+dz
X-Gm-Gg: Acq92OEs2QOEA99SISepboZkHtMJ+fEB/f4LqorqaJdWFXOyoLO1TNLYVEFTOP195jh
 rR4+MU9aPm+k+JSw9CeGj76p26YG+JzJKNzpzEcfOlLXg866pbwx2QSCjePjL0PCGhYkB+88NGE
 wvVMADyaXCi9OIHxwfrIwvzz9Ufp68ayTAJS/QLtMtx4rXn5qtWj7AAWzCjk26Eb2RRwl+oPPle
 58Pobh8wsCn5fq1s9t+5Mg2sWkeEOovpq72GLBH9C5Ka2tCKNxIh+cZv8T/2gvOh5pG/YfWnMPO
 Ft7RwJuj3ZQfgGsGGpG9KdGHkcMeUa7aevV+URaiEiFvM3GhTwR5GEbdnOtV9Sye2UrJCqV2VZ1
 P07TryNSVOQlvOz+NI2fgt1AYkNBDWyovkFTJreFnYfZYKlAZi+muIa4k5Nb6bF+0kUG4kTxreg
 CBzqYj774beisSmIi01r2fqDpdn0ph2X/Tuq8EjWG7g7AC
X-Received: by 2002:a05:6000:2087:b0:441:36b7:7262 with SMTP id
 ffacd0b85a97d-45e5c36735emr5460408f8f.13.1778852022268; 
 Fri, 15 May 2026 06:33:42 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0fe0f72sm15636087f8f.25.2026.05.15.06.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:33:41 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 15:33:41 +0200
Message-ID: <20260515133341.315461-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260314140633.2967249-31-bernd@kuhls.net>
References: <20260314140633.2967249-31-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778852022; x=1779456822; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AdulQ6SMOdOD0yb/lkQQ2NeNVHcAp5WsAQvXJ/Leg6o=;
 b=QUFbitaNOI/ex3P24J+EW/2DK5EoHaKbVl6LT0DMFfB3cSqxeMzu46bFS4FANeYZT/
 fMHQ4tNzMspktvjLMkL6gaOjUoyCOGz6uN/KZ0et5rUltaXVQqrHjO5NNgP1RFsARWEb
 lPkaZoevIDS7AzUPJJ5PoFMscMVgmGbIlCpKEVInjUBT4pXc4/Qb5V5wwQ57mwT/2YnH
 GO7lqq6YPFbAaJvqg8mZeJRuvaEO1IZD5pACN++sH59dALVAxx0XhZuOOr9AQpacA9X7
 yIEUQaRdHqFCovbwJSHr6D4x9jwuZvarSd6g3hH4UeYcIzZw8oqQubnM+U8UsG7AbNEY
 vjSQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QUFbitaN
Subject: Re: [Buildroot] [PATCH 31/96] package/python-lmdb: bump version to
 1.8.1
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
> https://github.com/jnwatson/py-lmdb/blob/py-lmdb_1.8.1/ChangeLog
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
>  package/python-lmdb/python-lmdb.hash | 4 ++--
>  package/python-lmdb/python-lmdb.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-lmdb/python-lmdb.hash b/package/python-lmdb/python-lmdb.hash
> index 525c434f2a..679d552d1c 100644
> --- a/package/python-lmdb/python-lmdb.hash
> +++ b/package/python-lmdb/python-lmdb.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/lmdb/json
> -md5  0996b2df3b8019b76ce1fa37913e41f0  lmdb-1.7.5.tar.gz
> -sha256  f0604751762cb097059d5412444c4057b95f386c7ed958363cf63f453e5108da  lmdb-1.7.5.tar.gz
> +md5  de895e4a88eeb179aa0c185a08523d62  lmdb-1.8.1.tar.gz
> +sha256  44ef24033929e9cc227a7e17287473c452b462d716f118db885c667c80f57429  lmdb-1.8.1.tar.gz
>  # Locally computed sha256 checksums
>  sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
> diff --git a/package/python-lmdb/python-lmdb.mk b/package/python-lmdb/python-lmdb.mk
> index 3f92ef066f..dbdc80bfda 100644
> --- a/package/python-lmdb/python-lmdb.mk
> +++ b/package/python-lmdb/python-lmdb.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_LMDB_VERSION = 1.7.5
> +PYTHON_LMDB_VERSION = 1.8.1
>  PYTHON_LMDB_SOURCE = lmdb-$(PYTHON_LMDB_VERSION).tar.gz
> -PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/c7/a3/3756f2c6adba4a1413dba55e6c81a20b38a868656517308533e33cb59e1c
> +PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/23/19/392f028e7ebcc1cc8212fe8a315a909b7a556278456f0bab9234d3a3b665
>  PYTHON_LMDB_LICENSE = OLDAP-2.8
>  PYTHON_LMDB_LICENSE_FILES = LICENSE
>  PYTHON_LMDB_DEPENDENCIES = host-python-cffi host-python-patch-ng
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
