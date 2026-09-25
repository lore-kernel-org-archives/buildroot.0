Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 251C3C9830D
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC02C81340;
	Fri, 25 Sep 2026 14:44:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WfTa8kLtAZVa; Fri, 25 Sep 2026 14:44:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C633C8131E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347440;
	b=UO8/Bq7TOvT0B2f21ZqyTy4N3f6PzzM2629jws3ijEhR38oQnRazD/1kgQuW7RUfiQCQ
	 E44CL8T4cakMmshIZstRngJd5IvUK3ltYe2bGlbT0DG1oylNW93tD6S9qU6pVakUchG45
	 64xp6F2uun1o1t5yK7WkFnji5SSUQW/YJaGDetJPLZZTkDbp04CEURaEi6MVhZc/kaYl4
	 pwoTlxljZwbP8LOSesxiF3LvgLzTvcp6Ufb9OJ8aCCMQZbWrJIwL43ApQ/xf4O9BbaaSm
	 WuJoCgtkeYcNEUAwE8dk5Cu8Vij3SwYBSgGo0z5E+Yk3lHLfS7ChiidBXKcUhVQizPA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347440;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ftiTTJUK2500AHlH6pvHmRUvPORvQteMJXXf08O04cI=;
	b=AILvrs6rs+60H34ngdYgRKTJ36/OO+qjAeSHFHhM1Nq0I4loAjl9eV/hRFMppmzcvxLP
	 9FtkfUJcEi7TkTiQBbTIbSnpVR5h7OXdl5u6KJN85mjb9VsUlxdd1zLMcou4M9M+NAU5X
	 mkYIQFF5RVd7mYPNS266lOMoXYY5NHmZTFqVQam4DEv9T+/AEIZvgDz99CltttR6INRky
	 k53IQz2b0GxjBKW/VoTvs9Y6YSKiq8LuAmdLdoKKtpYsBjmKNTdK1HJvBmE2SVFqncsxM
	 /XZyNfnidgA5zAAzgt215proXugrNjmgcxp6NgXYt4hyYDO4a+sCVwgkh0wyWs+sPVA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347440;
	bh=ftiTTJUK2500AHlH6pvHmRUvPORvQteMJXXf08O04cI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gd1XidFr51+/gwMtpiHYcmBd5xSzZ3cgsA0Vv3sCLs7Jz9h79wVckNxhayNptfABz
	 5exj3S5GQKqA971/AgjCc+oENutkr+XJwNY9Lfe3HUxE/pyIAIAE5qjYLxMB/NJjUk
	 w7357EsvDAkL/ijc83QrhJNeVoBZmb/efGLDH08jPCZrDcEf1tDrxaJgZskQqa1XKq
	 QyPSPsiX4M1K9wZ20obUXip3ys5EdBBbWLXlYG+4DDrqPLOszV6pAGc6ARAYSLIgJ3
	 wuzGFNSlBzK9lQK15BE6VWzGZmz+W8fhNxlg7cAEssokz4GMQwOpks6IrOqKMeSrFf
	 pL077DLY/6yPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C633C8131E;
	Fri, 25 Sep 2026 14:44:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BB8FA332
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADF7840A46
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:43:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sY0EoxzwSISH for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:43:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 35F8040790
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347436;
 b=oKucLKon7axqq1lnejbc0amx415GY8dGp25fsoH2XnzVG3e67SMze16q7jqWMxW674G1
 WTrikKL0lpKZCvDKInNAHmYaDGdQQAWYka39fpg0Kn+oJsAunde0JyJ0jrCMsHzBvXyZw
 je9rNgRgMHXMMSaVQss8xXVzSgzhSsY4inD0Ca57rSe1IZ7qXINZd4ZEWCVhJm16Uekk6
 EFP+sk73RLyPgCQSLEmfwBnkDQ3KecRha4RAPcZLJX4PZNws5J6tHVy3doQquiNHDtOJq
 Kuhz1RXy8c7fBTGun+zRSwaakzpK+yncEroepmpHcBgoqa1IBQaSiABQIVuYQeniMeA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347436;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=EcBR7bYxYFFM2rKBNr5BbXr90vR4l5LuyNOSydtDXCw=;
 b=J6V2ZHZ/zhkoFL39R4nR0V7icyl1oxwa9BfRSDO1NgGCBHvxMFjnbLuCRUdHQeHVzNyd
 MyeeWCzNxk2zFF7jn/peGbAawMiyPVu4j4f46J+JzDXLd//5K8TmRF52GbGPCLEM1sMRy
 CW5zAAdmcJGJe0YtFmEcEwLW1KjumuSmD+R+Ejc5i3lTxGHPuN/wZZdVzAblH0fIqworQ
 SmXMOs/GVS6hGRcBC5W4x/eV/tlmafyu87NNLYbgjky9sBY1lNSyGQpRVl6/OAe4VT6+k
 6ORbeJa6y1CQ9wHxvHMrPTPgzBiCz7mOlDltk4V5opvNfZveTwJr8jSoo65kMGNUvNg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Prc+halK; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35F8040790
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:43:55 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e721b5503so10086785e9.0
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347433; x=1790952233;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=EcBR7bYxYFFM2rKBNr5BbXr90vR4l5LuyNOSydtDXCw=;
 b=VBvO3IDJ9ZXdgm/lkxMZ7iEokcxVKAS9wp/DLuiyGTl7O+OreM5rAfQBmK8H1nyTAb
 wnilNcXDA+3Lu/vbylsu71Ge2SQ49m8xZZ7STe8SvVwog9gVdKiZI5UjKnaCIguD4zwY
 3an/cvBpsjuJEl/uPX5d5sCFWiMshcEw0TdaxDURG+GHtpPrir+LDXXbd1sK2zQLGUlf
 6ZchKXJ8p+K6iHpuzYy0u+TZO/8wpTscZMouPo9nBrAiR0M6x440r/r3WBIbs628kvJK
 cvs3sUTURnxuPKCGE5Kr7t4RtOe1V8Ed5baoVRsD2xvhT857GVrVXBQgj6giAFcoeISW
 CVmQ==
X-Gm-Message-State: AFuF++kdZYAzHTHuAMpWpAyFlviGYZ0sAvsOt/k2J8dVW9lwRnl/y01r
 FaCLyqLEZSwc9EOOC0thH73d67MMVD8JSR2wSJCuKUmE12q0CHli3SZFSZag3pbZycTqHvXK5Bp
 fTOaWO+lQrg==
X-Gm-Gg: AYBFou1pUdVYmpRbbSthiNZeMt6BJeEkIoOXH+WH9DL6RZheFTB3J0H7aIyqRfgm/12
 Id468jNFiOSipqBjX9LyaO17xDPaLUQEIQPBzPBfBCjqZM1lcBSSWz/f94/vLOf3PfpUbtgPucF
 NRgadJN8OSMIgchTI6UTAmAFfnd1EKmScAANC06v9bBYVTEUj3YHObarubNiFW02qOdE72OhJty
 9/0srzLY/AoYTb6edJjWCq7HxP/BD4hH6xZGZIDtQSAoHiUVDRjIFN4bQTbajL1nlgb3USHukkO
 CFN95BN5MlyvAzw0eeMSQdT/27/aobq24ExzNn0P0LkvbqIx163gBHfJHK7hN051YB0J03ThTgG
 +DUzBhDsvk3jQv4cuCmhyuk0EF70p1pZ6iwcGlWKk1hwhcHXC4aOG5hw3d97/TwW3L7YJOHnbFd
 lmkXHOSIgD/40CLkUJu+chzTUCvsKk0mMzeCt+nxPvSOq01dRJ8IocHk5dFPW8ph6ePMnsb84Tm
 v5IxjBNYXU+hKdGoJv95IuG8QEY/NMraa2EGBRQ4g==
X-Received: by 2002:a05:600c:c177:b0:49c:fc6c:be19 with SMTP id
 5b1f17b1804b1-49fe67080b1mr112805675e9.31.1790347433615; 
 Fri, 25 Sep 2026 07:43:53 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ff06cbd2dsm62891435e9.12.2026.09.25.07.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:43:52 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:43:50 +0200
Message-ID: <20260925144352.4095302-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260906105309.3690634-2-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/exim: bump version to 4.100
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> https://lists.exim.org/lurker/message/20260820.154633.91995f73.en.html
> 
> Rebased patch 0001.
> 
> Updated patch 0005, the previous version was applied upstream with
> commit 497e9eb7e77ad27ae1d45281e23eefadfaa7a3bc but it did not fix all
> linker errors so we sent a new patch upstream which replaces the
> previous patch.
> 
> Updated hash of GPL-2.0 license file (address, name of president and
> typos), a commit can not be provided from the source tree.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Series passed Gitlab pipelines:
> https://gitlab.com/bkuhls/buildroot/-/commits/24ccdda33622eebee11e88a9af4a6b63476d060b
> 
>  .../0001-Build-buildconfig-for-the-host.patch |   5 +-
>  ...-cross-compile-by-adding-LD-variable.patch | 106 ++++--------------
>  package/exim/exim.hash                        |   6 +-
>  package/exim/exim.mk                          |   2 +-
>  4 files changed, 31 insertions(+), 88 deletions(-)
> 
> diff --git a/package/exim/0001-Build-buildconfig-for-the-host.patch b/package/exim/0001-Build-buildconfig-for-the-host.patch
> index 6f4351a50f..2f2e23c1a1 100644
> --- a/package/exim/0001-Build-buildconfig-for-the-host.patch
> +++ b/package/exim/0001-Build-buildconfig-for-the-host.patch
> @@ -2,7 +2,7 @@ buildconfig is meant to be executed on the host, so it has to be compiled
>  using $(HOSTCC), not $(CC).
>  
>  Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> -[Bernd: rebased for version 4.99]
> +[Bernd: rebased for version 4.100]
>  Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>  ---
>   OS/Makefile-Base |    4 ++--
> @@ -22,4 +22,5 @@ index 29a6ad3..420ba60 100644
>  +	$(FE)$(HOSTCC) $(HOSTCFLAGS) $(INCLUDE) -o buildconfig buildconfig.c
>   
>   
> - util_deps: config ../src/utils/msgid.frag
> + UTIL_DEPS = $(CONFIG_DEPS) ../src/utils/msgid.frag
> +
> diff --git a/package/exim/0005-Fix-cross-compile-by-adding-LD-variable.patch b/package/exim/0005-Fix-cross-compile-by-adding-LD-variable.patch
> index 99bf5ce667..51383329fd 100644
> --- a/package/exim/0005-Fix-cross-compile-by-adding-LD-variable.patch
> +++ b/package/exim/0005-Fix-cross-compile-by-adding-LD-variable.patch
> @@ -1,95 +1,37 @@
> -From a47de397eb1f28356086f315a443c288599d8657 Mon Sep 17 00:00:00 2001
> +From cb7d04db69623673e606a3249bc7de1330c8f0b6 Mon Sep 17 00:00:00 2001
>  From: Bernd Kuhls <bernd@kuhls.net>
> -Date: Sat, 1 Nov 2025 17:00:52 +0100
> +Date: Fri, 4 Sep 2026 18:43:42 +0200
>  Subject: [PATCH] Fix cross-compile by adding LD variable
>  
> -Fixes cross-build error due to commit
> -a449ff8ca50e6df5faee2f1e83e1198c27738dfc.
> +Upstream: https://code.exim.org/exim/exim/pulls/3244
>  
> -Hard-coding "ld" when cross-compiling is a bad idea.
> -
> -Upstream: https://github.com/Exim/exim/pull/98
>  Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>  ---
> - src/OS/Makefile-Base      | 10 +++++-----
> - src/OS/Makefile-Default   |  1 +
> - src/src/miscmods/Makefile |  2 +-
> - 3 files changed, 7 insertions(+), 6 deletions(-)
> + src/miscmods/Makefile | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
>  
> -diff --git a/OS/Makefile-Base b/OS/Makefile-Base
> -index 5a15b0a6b..0250647f0 100644
> ---- a/OS/Makefile-Base
> -+++ b/OS/Makefile-Base
> -@@ -1065,7 +1065,7 @@ dynmodules: buildlookups buildrouters buildtransports buildauths \
> - buildlookups: config
> - 	 @cd lookups && $(MAKE) SHELL=$(SHELL) AR="$(AR)" $(MFLAGS) CC="$(CC)" CFLAGS="$(CFLAGS)" \
> - 	   CFLAGS_DYNAMIC="$(CFLAGS_DYNAMIC)" HDRS="../version.h $(PHDRS)" \
> --	   FE="$(FE)" RANLIB="$(RANLIB)" RM_COMMAND="$(RM_COMMAND)" \
> -+	   FE="$(FE)" RANLIB="$(RANLIB)" LD="$(LD)" RM_COMMAND="$(RM_COMMAND)" \
> - 	   INCLUDE="$(INCLUDE) $(IPV6_INCLUDE) $(TLS_INCLUDE) $(LOOKUP_INCLUDE)"
> - 	 @echo " "
> - 
> -@@ -1074,7 +1074,7 @@ buildlookups: config
> - buildrouters: config
> - 	 @cd routers && $(MAKE) SHELL=$(SHELL) AR="$(AR)" $(MFLAGS) CC="$(CC)" CFLAGS="$(CFLAGS)" \
> - 	   CFLAGS_DYNAMIC="$(CFLAGS_DYNAMIC)" \
> --	   FE="$(FE)" RANLIB="$(RANLIB)" RM_COMMAND="$(RM_COMMAND)" HDRS="$(PHDRS)" \
> -+	   FE="$(FE)" RANLIB="$(RANLIB)" LD="$(LD)" RM_COMMAND="$(RM_COMMAND)" HDRS="$(PHDRS)" \
> - 	   INCLUDE="$(INCLUDE) $(IPV6_INCLUDE) $(TLS_INCLUDE)"
> - 	 @echo " "
> - 
> -@@ -1083,7 +1083,7 @@ buildrouters: config
> - buildtransports: config
> - 	 @cd transports && $(MAKE) SHELL=$(SHELL) AR="$(AR)" $(MFLAGS) CC="$(CC)" CFLAGS="$(CFLAGS)" \
> - 	   CFLAGS_DYNAMIC="$(CFLAGS_DYNAMIC)" \
> --	   FE="$(FE)" RANLIB="$(RANLIB)" RM_COMMAND="$(RM_COMMAND)" HDRS="$(PHDRS)" \
> -+	   FE="$(FE)" RANLIB="$(RANLIB)" LD="$(LD)" RM_COMMAND="$(RM_COMMAND)" HDRS="$(PHDRS)" \
> - 	   INCLUDE="$(INCLUDE) $(IPV6_INCLUDE) $(TLS_INCLUDE)"
> - 	 @echo " "
> - 
> -@@ -1092,7 +1092,7 @@ buildtransports: config
> - buildauths: config
> - 	 @cd auths && $(MAKE) SHELL=$(SHELL) AR="$(AR)" $(MFLAGS) CC="$(CC)" CFLAGS="$(CFLAGS)" \
> - 	   CFLAGS_DYNAMIC="$(CFLAGS_DYNAMIC)" \
> --	   FE="$(FE)" RANLIB="$(RANLIB)" RM_COMMAND="$(RM_COMMAND)" HDRS="$(PHDRS)" \
> -+	   FE="$(FE)" RANLIB="$(RANLIB)" LD="$(LD)" RM_COMMAND="$(RM_COMMAND)" HDRS="$(PHDRS)" \
> - 	   INCLUDE="$(INCLUDE) $(IPV6_INCLUDE) $(TLS_INCLUDE)"
> - 	 @echo " "
> - 
> -@@ -1101,7 +1101,7 @@ buildmisc: config
> - 	   CC="$(CC)" CFLAGS="$(CFLAGS)" \
> - 	     CFLAGS_DYNAMIC="$(CFLAGS_DYNAMIC)" \
> - 	     LDFLAGS_PARTIAL="$(LDFLAGS_PARTIAL)" HDRS="../version.h $(PHDRS)" \
> --	     FE="$(FE)" RANLIB="$(RANLIB)" RM_COMMAND="$(RM_COMMAND)" \
> -+	     FE="$(FE)" RANLIB="$(RANLIB)" LD="$(LD)" RM_COMMAND="$(RM_COMMAND)" \
> - 	     PERL_CC="$(PERL_CC)" PERL_CCOPTS="$(PERL_CCOPTS)" \
> - 	     PERL_CFLAGS="$(PERL_CFLAGS)" PERL_LFLAGS="$(PERL_LFLAGS)" \
> - 	     INCLUDE="$(INCLUDE) $(IPV6_INCLUDE)" TLS_INCLUDE="$(TLS_INCLUDE)"
> -diff --git a/OS/Makefile-Default b/OS/Makefile-Default
> -index 858361bf3..c469c7f01 100644
> ---- a/OS/Makefile-Default
> -+++ b/OS/Makefile-Default
> -@@ -227,6 +227,7 @@ HOSTNAME_COMMAND=/bin/hostname
> - 
> - RANLIB=ranlib
> - 
> -+LD=ld
> - 
> - # EXIM_CHMOD is available to specify a command that is automatically applied
> - # to the Exim binary immediately it is compiled. (I find this useful when
>  diff --git a/src/miscmods/Makefile b/src/miscmods/Makefile
> -index 1e46d4456..cfae5aac2 100644
> +index 807d6f377..5bac23a7f 100644
>  --- a/src/miscmods/Makefile
>  +++ b/src/miscmods/Makefile
> -@@ -62,7 +62,7 @@ dkim.o:
> - 	$(FE)$(CC) -c $(CFLAGS) $(INCLUDE) pdkim.c
> - 	$(FE)$(CC) -c $(CFLAGS) $(INCLUDE) $(TLS_INCLUDE) signing.c
> - 	$(FE)mv dkim.o dkim_tmp.o
> --	$(FE)ld -r -o dkim.o $(LDFLAGS_PARTIAL) \
> -+	$(FE)$(LD) -r -o dkim.o $(LDFLAGS_PARTIAL) \
> - 		dkim_tmp.o dkim_transport.o pdkim.o signing.o
> - 
> - # Similarly, we want a single .so for the dynamic-load module
> +@@ -96,7 +96,7 @@ dmarc.o dmarc_native.o:
> + 	$(FE)$(CC) -c $(CFLAGS) $(INCLUDE) $*.c
> + 	$(FE)$(CC) -c $(CFLAGS) $(INCLUDE) dmarc_common.c
> + 	$(FE)mv $@ dmarc_tmp.o
> +-	$(FE)ld -r -o $@ $(LDFLAGS_PARTIAL) dmarc_tmp.o dmarc_common.o
> ++	$(FE)$(LD) -r -o $@ $(LDFLAGS_PARTIAL) dmarc_tmp.o dmarc_common.o
> + 
> + # dmarc_native is special in the same way as spf_perl
> + dmarc.so dmarc_native.so:
> +@@ -112,7 +112,7 @@ sieve_filter.o:
> + 	$(FE)$(CC) -c $(CFLAGS) $(INCLUDE) sieve_filter_body.c
> + 	$(FE)$(CC) -c $(CFLAGS) $(INCLUDE) sieve_filter_input.c
> + 	$(FE)mv sieve_filter.o sieve_filter_tmp.o
> +-	$(FE)ld -r -o sieve_filter.o $(LDFLAGS_PARTIAL) \
> ++	$(FE)$(LD) -r -o sieve_filter.o $(LDFLAGS_PARTIAL) \
> + 		sieve_filter_tmp.o sieve_filter_body.o sieve_filter_input.o
> + 
> + sieve_filter.so:
>  -- 
>  2.47.3
>  
> diff --git a/package/exim/exim.hash b/package/exim/exim.hash
> index 4cdedb724d..c075b2fe96 100644
> --- a/package/exim/exim.hash
> +++ b/package/exim/exim.hash
> @@ -1,6 +1,6 @@
>  # From https://ftp.exim.org/pub/exim/exim4/00-sha256sums.txt
> -sha256  c2d2f80adc7c71d424fd82a46655eaa2d7d9b4ca2e77883eba9076947b7ee627  exim-4.99.5.tar.xz
> +sha256  5bd0a3e353dbfcd5c8174388b824316a61ee2455d9052ea2f0877dee939d33b3  exim-4.100.tar.xz
>  # From https://ftp.exim.org/pub/exim/exim4/00-sha512sums.txt
> -sha512  28fd15d0d4e0114129fd42140fb5d5920fcd5cbfb6ac816197e3567c3d2ece6ec73367b43bd8d47d2b543adb89ad28a5e4c58a23210887f867a5c41c24e181b5  exim-4.99.5.tar.xz
> +sha512  e7f2cc1ba9af4b1113d9a40b384bf2e5439f539381126018fb9a15d3afaf687fd209d06d1cfa96e61426df0d9f4e7988e49e1192510abc02b2aa19b14b051abc  exim-4.100.tar.xz
>  # Locally calculated
> -sha256  49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
> +sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  LICENCE
> diff --git a/package/exim/exim.mk b/package/exim/exim.mk
> index 482c7ca2c1..a8395a2309 100644
> --- a/package/exim/exim.mk
> +++ b/package/exim/exim.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -EXIM_VERSION = 4.99.5
> +EXIM_VERSION = 4.100
>  EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
>  EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
>  EXIM_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
