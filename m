Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D9BE64A8C
	for <buildroot@archiver.kernel.org>; Tue,  3 Dec 2024 13:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83DBC81F09;
	Tue,  3 Dec 2024 13:21:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RGwE5bFFw4wx; Tue,  3 Dec 2024 13:21:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43FA781F87
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43FA781F87;
	Tue,  3 Dec 2024 13:21:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DB331DAA
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 13:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EEA881F09
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 13:21:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9kOgbLST3c3u for <buildroot@buildroot.org>;
 Tue,  3 Dec 2024 13:21:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=olivier.benjamin@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C7E4D80BE9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7E4D80BE9
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C7E4D80BE9
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 13:21:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DFE6A20002;
 Tue,  3 Dec 2024 13:21:35 +0000 (UTC)
Message-ID: <f6a5318b-2939-4517-a74b-112c39c0194b@bootlin.com>
Date: Tue, 3 Dec 2024 14:21:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Cc: Phil Eichinger <phil.eichinger@gmail.com>
References: <20241122-psplash_options-v1-1-b142ac91f53c@bootlin.com>
Content-Language: en-US
In-Reply-To: <20241122-psplash_options-v1-1-b142ac91f53c@bootlin.com>
X-GND-Sasl: olivier.benjamin@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1733232096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tyhhRyXpxpZnHOf2BZUTfwxpu8+tIn8qSDP9AyZdKaQ=;
 b=JXd3E0qhw5xK/SYykIBjXQMOu+Tftqe2TSZgnvFa8Ty4QHuYQVjyIaMK4mPGTg7l60zY2F
 iDSt7iViStLh4Q9oWy922h5r/Yqjb4iJpM406Bei+ZRMM92rJuHsIj2rW/i40wxq5bAgDq
 EK67mdIePp51CTXhY6NpdD6o1cDU/uhTzgDxN0zh8gZHPsZntJKT146bfvU70vZgn9ZFvY
 weEA3kBlev1KAMWdig8qddFdP0861aqHrS7auZAiWjX5/8ZbAGpndKBTCtcFbJqiU0u0xS
 C8vbo8z6KYdn3/gkjwvo0wOGmJ1pinkKjhwbynuvhrHFwBCYB7cfePkD7uTNyA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JXd3E0qh
Subject: Re: [Buildroot] [PATCH] package/psplash: add support for two
 configure options
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
From: Olivier Benjamin via buildroot <buildroot@buildroot.org>
Reply-To: Olivier Benjamin <olivier.benjamin@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bringing this back up.
Could we consider this simple patch?

On 11/22/24 19:21, Olivier Benjamin via buildroot wrote:
> Add support for two configure options:
>    --disable-progress-bar, via BR2_PACKAGE_PSPLAH_PROGRESS_BAR
>    --disable-startup-msg, via BR2_PACKAGE_PSPLASH_STARTUP_MSG
> 
> Both buildroot options will default to 'y' to be compatible with
> the previous behaviour, since those were enable by default by
> not specifying the disable config flag.
> 
> Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
> ---
>   package/psplash/Config.in  | 12 ++++++++++++
>   package/psplash/psplash.mk | 12 ++++++++++++
>   2 files changed, 24 insertions(+)
> 
> diff --git a/package/psplash/Config.in b/package/psplash/Config.in
> index da99b264e0458766f3c5840568acd7980d0ef313..6379c5537fa18612a3dda862995a9f9a857da121 100644
> --- a/package/psplash/Config.in
> +++ b/package/psplash/Config.in
> @@ -35,6 +35,18 @@ config BR2_PACKAGE_PSPLASH_IMAGE
>   	  Use a personalized png image as boot splash.
>   	  Let it empty if you want to keep the psplash default image.
>   
> +config BR2_PACKAGE_PSPLASH_PROGRESS_BAR
> +	bool "enable progress bar"
> +	default y
> +	help
> +	  Enable management of the progress bar via the "PROGRESS" command.
> +
> +config BR2_PACKAGE_PSPLASH_STARTUP_MSG
> +       bool "enable startup message"
> +       default y
> +       help
> +         Enable text banner output on startup.
> +
>   endif
>   
>   comment "psplash needs a toolchain w/ wchar"
> diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
> index 69f9bf386da0a6b3463a30b7b8a7b09ad9017819..f13f92d5875775aff0eafa8a4f11dc6c68bd0ce4 100644
> --- a/package/psplash/psplash.mk
> +++ b/package/psplash/psplash.mk
> @@ -19,6 +19,18 @@ else
>   PSPLASH_CONF_OPTS += --without-systemd
>   endif
>   
> +ifeq ($(BR2_PACKAGE_PSPLASH_PROGRESS_BAR), y)
> +PSPLASH_CONF_OPTS +=
> +else
> +PSPLASH_CONF_OPTS += --disable-progress-bar
> +endif
> +
> +ifeq ($(BR2_PACKAGE_PSPLASH_STARTUP_MSG), y)
> +PSPLASH_CONF_OPTS +=
> +else
> +PSPLASH_CONF_OPTS += --disable-startup-msg
> +endif
> +
>   PSPLASH_IMAGE = $(call qstrip,$(BR2_PACKAGE_PSPLASH_IMAGE))
>   
>   ifneq ($(PSPLASH_IMAGE),)
> 
> ---
> base-commit: 175dbdf3fc67775486ddf121b6deb651e2bf7c06
> change-id: 20241122-psplash_options-f8ef9770390d
> 
> Best regards,

-- 
Olivier Benjamin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
