Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171F5C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 08:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B80A340917;
	Fri, 12 Jul 2024 08:47:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zx9_Qk1ulNcW; Fri, 12 Jul 2024 08:47:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6480540A03
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6480540A03;
	Fri, 12 Jul 2024 08:47:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3431F1BF584
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 08:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DEF840A03
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 08:47:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8gaYIvPOihVQ for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 08:47:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 91F0340917
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91F0340917
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 91F0340917
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 08:47:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BF0371BF20C;
 Fri, 12 Jul 2024 08:47:14 +0000 (UTC)
Date: Fri, 12 Jul 2024 10:47:13 +0200
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <20240712104713.2805a251@windsurf>
In-Reply-To: <20240625211847.1419944-2-roykollensvendsen@gmail.com>
References: <20240618212646.4154474-1-roykollensvendsen@gmail.com>
 <20240625211847.1419944-1-roykollensvendsen@gmail.com>
 <20240625211847.1419944-2-roykollensvendsen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720774035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G8y4bjwxG5Z8ixWwYqHh8ZTeVaiD2lCrhnrrNZWTGss=;
 b=ceRUv7qlnEDSR0g0/SXXwyN3hxDxgA8OSYAwfcd/hkQPh3U+W1UByfCJmRiaWFf2eaWjeZ
 zv7N6TubqkJgK2M+gBG+MhjJQQDFX26letBi9T6wTozut0Ul7Jq5AsAvm/sbxqdZI5/WUJ
 AqgN5U7mAqxA6ivf2W7Yz1cE4Wt8ILCYnanVYJVgSxhXMTygzwYRSLt97V9qn/yS1LGNbB
 FWEKjz6X07lB/xGSagaXf/9mwrHvIqLV9i5A9NZjqeKaj76qtCYTcJVsxmJla3syTQcRVs
 LK7syAKeG8bLb336+b3jGxrPocYQteblIO0FBXEVNmCnFYRUe3BSqfY+kk1deg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ceRUv7ql
Subject: Re: [Buildroot] [PATCH v9 02/14] package/qt6/qt6base: add blind
 option to enable GUI support on host
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Roy,

On Tue, 25 Jun 2024 23:18:26 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> +# We need host-qt6base with Gui support when building host-qt6shadertools,
> +# otherwise the build is skipped and no qsb host tool is generated.
> +# qt6shadertools fail to build if qsb is not available.
> +ifeq ($(BR2_PACKAGE_HOST_QT6BASE_GUI),y)
> +HOST_QT6BASE_CONF_OPTS += -DFEATURE_gui=ON
> +else
> +HOST_QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
> +endif

This was failing to build here with:

ERROR: The OpenGL functionality tests failed! You might need to modify the OpenGL package search path by setting the OpenGL_DIR CMake variable to the OpenGL library's installation directory

So to fix this, I changed to:

ifeq ($(BR2_PACKAGE_HOST_QT6BASE_GUI),y)
HOST_QT6BASE_CONF_OPTS += \
	-DFEATURE_gui=ON \
	-DFEATURE_freetype=OFF \
	-DFEATURE_vulkan=OFF \
	-DFEATURE_linuxfb=ON \
	-DFEATURE_xcb=OFF \
	-DFEATURE_opengl=OFF -DINPUT_opengl=no \
	-DFEATURE_harfbuzz=OFF \
	-DFEATURE_png=OFF \
	-DFEATURE_gif=OFF \
	-DFEATURE_jpeg=OFF \
	-DFEATURE_printsupport=OFF \
	-DFEATURE_kms=OFF \
	-DFEATURE_fontconfig=OFF \
	-DFEATURE_widgets=OFF \
	-DFEATURE_libinput=OFF \
	-DFEATURE_tslib=OFF \
	-DFEATURE_eglfs=OFF
else
HOST_QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
endif

So basically, I've disabled every option that we have support for for
the target GUI support, except linuxfb=ON, to have one backend enabled.

Applied with this change. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
