Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D16D1BDD4
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 20:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E5F741459;
	Wed,  3 Dec 2025 20:08:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LfMWXgFoSLLX; Wed,  3 Dec 2025 20:08:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3D884142E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764792517;
	bh=FG4ruwGNYaDQkG1lrs0LgJVPRcUEKRBMXK7cCFanjW4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Fpf9j+p/QQrQxXgngurxIu8Of0uZKZAzy44czbbCpMcyMRu5T4/wFyzssxGISa2nH
	 T2/aRYxiSo98z1V/6SBCYX78Yfw4GbpO5pnR0n6NEVJCBoLODChHazmY2/R+S7oxrU
	 8M+vWkAYbOchDWrXnjzTDBUSb4iGzstM9LXkSnM7rA4dJSggY/GIXuf/F4q6IUH3Me
	 QvjrdK8k11Rk4JJwQd9+uoxXPAPF7hEy38qX778gnK03SGevL/4Jwkc8WtrmAWWsTy
	 iGwA+bzdd31j3vhRcwVrLAd4U0lC9xlmZl/pcXq6ayf6kjKxDmuHGEZD/y41Y4o58+
	 fyrPh/vcJdNzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3D884142E;
	Wed,  3 Dec 2025 20:08:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AF65D3
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 20:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E552E400B0
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 20:08:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mwmBDiRcyO4L for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 20:08:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D6BF440028
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6BF440028
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D6BF440028
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 20:08:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9A1D5B979E84; Wed,  3 Dec 2025 21:08:29 +0100 (CET)
Message-ID: <dea1f048-e9ca-436e-8e93-05c290825365@rnout.be>
Date: Wed, 3 Dec 2025 21:08:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Heiko Thiery <heiko.thiery@gmail.com>, buildroot@buildroot.org
Cc: Matt Weber <matthew.weber@rockwellcollins.com>,
 Arnout Vandecappelle <arnout@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Walle <michael@walle.cc>
References: <20250905123754.33866-1-heiko.thiery@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250905123754.33866-1-heiko.thiery@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764792512; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=9tFU+jHZziJ/9GD8AIw9p2zAVXcX51XPz+tAhiCsCpU=;
 b=MeRPYGtqtOh0bP7MNHlfvQj0ofuItrPBBH/ZlJozWTFJC4ue5R7cTWXBgJYpajejz+FUSU
 D7gSFN4P/soK5i9QHUXQKOqwMCDLnODN/G2aUo8xZcIrY3QCRO5+2Rnwzv/nbKQm+xEQmt
 234qdkvWtTPN8tpWI4OZEUMxjKhnetoGZfhHNmWoL4MN73sXRVPYEj/nrUmEqr8Ob+UAnT
 xw7PYJusMlI7ourMt+VSeMti3FvWxd7/6X0AY+usH38U8VcRGZGVMzJuSZM0fhv6368tpr
 3wBtB/dpb6j5qjPm4FTbB/Sp+9EHv1aT5AbpeIrP9CTnbLHyz2GPYLdylI8NYg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=MeRPYGtq
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/09/2025 14:37, Heiko Thiery wrote:
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

  See below.

> 
>   boot/uboot/uboot.mk                | 4 ++++
>   package/uboot-tools/uboot-tools.mk | 5 +----
>   2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 2796b0a310..66264bb3f0 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -144,6 +144,10 @@ UBOOT_MAKE_TARGET += u-boot.stm32
>   endif
>   endif
>   
> +ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE),y)
> +UBOOT_MAKE_TARGET += u-boot-initial-env
> +endif
> +
>   ifeq ($(BR2_TARGET_UBOOT_INITIAL_ENV),y)
>   UBOOT_MAKE_TARGET += u-boot-initial-env
>   define UBOOT_INSTALL_UBOOT_INITIAL_ENV
> diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
> index 1925047ccd..25d7b26c6a 100644
> --- a/package/uboot-tools/uboot-tools.mk
> +++ b/package/uboot-tools/uboot-tools.mk
> @@ -154,10 +154,7 @@ HOST_UBOOT_TOOLS_DEPENDENCIES += uboot
>   ifeq ($(UBOOT_TOOLS_GENERATE_ENV_FILE),)
>   UBOOT_TOOLS_GENERATE_ENV_FILE = $(@D)/boot-env-defaults.txt
>   define HOST_UBOOT_TOOLS_GENERATE_ENV_DEFAULTS
> -	CROSS_COMPILE="$(TARGET_CROSS)" \
> -		$(UBOOT_SRCDIR)/scripts/get_default_envs.sh \
> -		$(UBOOT_SRCDIR) \
> -		> $(UBOOT_TOOLS_GENERATE_ENV_FILE)
> +	$(UBOOT_SRCDIR)/tools/printinitialenv > $(UBOOT_TOOLS_GENERATE_ENV_FILE)

  You can use a shell condition here to choose one or the other based on existence:

	if [ -x $(UBOOT_SRCDIR)/tools/printinitialenv ]; then
		... Use pintinitialenv ...
	else
		... Use get_default_envs.sh ...
	fi


  Regards,
  Arnout

>   endef
>   endif # UBOOT_TOOLS_GENERATE_ENV_FILE
>   endif # BR2_TARGET_UBOOT


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
