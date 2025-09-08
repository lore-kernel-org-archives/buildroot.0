Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72657CAC581
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 13:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E55E84F51;
	Mon,  8 Sep 2025 13:02:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A2ODIpTkxJLv; Mon,  8 Sep 2025 13:02:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2030684F96
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2030684F96;
	Mon,  8 Sep 2025 13:02:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DE68186
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 13:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E864B41534
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 13:02:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ms_blJUXMaxr for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 13:02:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E12F3403F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E12F3403F0
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E12F3403F0
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 13:02:54 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-336b071e806so38289091fa.1
 for <buildroot@buildroot.org>; Mon, 08 Sep 2025 06:02:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757336572; x=1757941372;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oaR/Aq8xmh4Lxe7IR2fw+ewbNE79IolkRgu5suhFfDg=;
 b=Q2rcC43+flg4t0C3u3Rxlx+BI8e4m4VzO7DgUGUHtB8r37JSy2lj0kwT22AhchtspF
 tK8zvaDzeKHlORof1QkfShrl6I20XGxzMfAZCZlcs2wJqt0qvVHlZU0oC8X8lHK1HKnq
 oI47EdatwnRHA+Jy0zLq00oZ5ghEPEFbZb7rJla2klYfuiT3CP9hkwc0M2nl+NzOvF61
 xTLxtsFwvgaRo87C/Qj8xrsn3WJb7aTXBc+ClqQgBvbiVoxS59g3d86zlqftk7EgC6E4
 SSkhRxD2GrwtfZfRqh6nHMfqp4MT7S1Q5SaA7oCU/bZH7ESsqkvOMIg5a4eiOh6PH56O
 ymhA==
X-Gm-Message-State: AOJu0Yx8qvOo6eKoJrfd/CPWETRhBf6OsMGIpsaw1h6ia95nJMiW2HS8
 NVc7hKQ/pQb2p3hKHMmq4Sg2HHRnNeTP57aHoTqACinWtdxI1P2+uZDIt9542bxrHMHJPimuqm2
 j8DVbAwqquyaaGYf6b/TVwkZxP4O+PmwtFn8W
X-Gm-Gg: ASbGncu3jb3sch7iBxNqWweZ2qOZxjfNcfddHXXASv5ZOkEXracT9rWec30OBxxPN+f
 zqxjmTFilZ4iLwASM3SuY+J8PS9rS8Jwa7ZqouwqzXDXHviHaGHZ5J4DHgxUoEkEGyXuumbxIqc
 3D6bGeoWs020hItNwiW1suQ3pPSqPcDVfZKuz/NO23obj/HtdaUdL8dEeg63iuld1FibjlA5WjR
 K+fSFzogRxQwk9oN3vnXabmWQP5
X-Google-Smtp-Source: AGHT+IEx4Swp/ppUXksSTzDnqe/CCT1dLUYD3SXptK+Jjdput4OiUHceNVPffE2B5PP+etOci7Tbc6cd9l8Cr9EDetE=
X-Received: by 2002:a2e:a016:0:10b0:338:beb:88c8 with SMTP id
 38308e7fff4ca-33b520d6d91mr15213751fa.19.1757336571278; Mon, 08 Sep 2025
 06:02:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250905123754.33866-1-heiko.thiery@gmail.com>
In-Reply-To: <20250905123754.33866-1-heiko.thiery@gmail.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 8 Sep 2025 15:02:38 +0200
X-Gm-Features: Ac12FXwwX9nZkTEAwZ8AprtByqtUjSrpSYxBaRqPFsMA0Ctl2EDf0OHg_hWDtQM
Message-ID: <CAEyMn7ZE2=2nBQ=TS63Pi1KdfVJr_+1Rvr72apuwCaSycXzchA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757336572; x=1757941372; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oaR/Aq8xmh4Lxe7IR2fw+ewbNE79IolkRgu5suhFfDg=;
 b=S0qnSgNMSle+ErZ0diuKVblw191Hlp6TWUA68ow/OT1lJx/IUjqT+edX2KsvbZrhgB
 9NUzjlS4Iuu7lKy/BG70hOfIf/ARN+UuxQbnKtivWSwdSSZ51RIYXAx1+Drh3GeMUcgF
 6aQ14C3SBaFOy9Duq88a5AsnSTZf0QlENoKS+Zmkou5J4MatlmqPZBbzTY9FpVHPTvTR
 VtT05fKTxG1xqeQqmAj75t8O4l//oUvSVU+LfxYy43z1LMXrBglboQ6luqLsEpHnhTwi
 N2gOfjscvVmKWTqqevC/CqIq2pm8P+UGpbKZcU9YC96Wc/0xEE1psqUIbQmWwLzR9aGe
 gvBQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=S0qnSgNM
Subject: Re: [Buildroot] [PATCH] package/uboot-tools: use uboot host tool
 printinitialenv to extract env
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
Cc: Matt Weber <matthew.weber@rockwellcollins.com>,
 Michael Walle <michael@walle.cc>, Arnout Vandecappelle <arnout@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

I add Arnout here with the actual address, since I used his old mail address.

Am Fr., 5. Sept. 2025 um 14:38 Uhr schrieb Heiko Thiery
<heiko.thiery@gmail.com>:
>
> If u-boot is compiled with the LTO option, it is no longer possible to
> use the script 'get_default_envs.sh'. The problem was already observed
> and a solution available upstream u-boot since the commit 486aef08de09 [1].
> This was first available in release v2023.04.
>
> Instead of using the script the new tool 'printinitialenv' is used. The
> tool is build with u-boot that is a dependency of this package.
>
> [1] https://source.denx.de/u-boot/custodians/u-boot-tegra/-/commit/486aef08de091ca35386f32fe961a201c3cfa9d4
>
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>
> The question I ask myself is, how can this problem be solved for older
> U-Boot versions, or how can both options be supported? With the proposed
> option, old U-Boats will no longer build.
>
>  boot/uboot/uboot.mk                | 4 ++++
>  package/uboot-tools/uboot-tools.mk | 5 +----
>  2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 2796b0a310..66264bb3f0 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -144,6 +144,10 @@ UBOOT_MAKE_TARGET += u-boot.stm32
>  endif
>  endif
>
> +ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE),y)
> +UBOOT_MAKE_TARGET += u-boot-initial-env
> +endif
> +
>  ifeq ($(BR2_TARGET_UBOOT_INITIAL_ENV),y)
>  UBOOT_MAKE_TARGET += u-boot-initial-env
>  define UBOOT_INSTALL_UBOOT_INITIAL_ENV
> diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
> index 1925047ccd..25d7b26c6a 100644
> --- a/package/uboot-tools/uboot-tools.mk
> +++ b/package/uboot-tools/uboot-tools.mk
> @@ -154,10 +154,7 @@ HOST_UBOOT_TOOLS_DEPENDENCIES += uboot
>  ifeq ($(UBOOT_TOOLS_GENERATE_ENV_FILE),)
>  UBOOT_TOOLS_GENERATE_ENV_FILE = $(@D)/boot-env-defaults.txt
>  define HOST_UBOOT_TOOLS_GENERATE_ENV_DEFAULTS
> -       CROSS_COMPILE="$(TARGET_CROSS)" \
> -               $(UBOOT_SRCDIR)/scripts/get_default_envs.sh \
> -               $(UBOOT_SRCDIR) \
> -               > $(UBOOT_TOOLS_GENERATE_ENV_FILE)
> +       $(UBOOT_SRCDIR)/tools/printinitialenv > $(UBOOT_TOOLS_GENERATE_ENV_FILE)
>  endef
>  endif # UBOOT_TOOLS_GENERATE_ENV_FILE
>  endif # BR2_TARGET_UBOOT
> --
> 2.39.5
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
