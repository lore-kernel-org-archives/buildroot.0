Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97449CD3431
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 12:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D192605AA;
	Wed,  4 Sep 2024 12:33:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ehFBj3ZGd28b; Wed,  4 Sep 2024 12:33:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4201560877
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4201560877;
	Wed,  4 Sep 2024 12:33:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5D6141BF267
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 12:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5828C60877
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 12:33:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6M49LzIy9NoX for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 12:33:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C9D94605AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9D94605AA
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C9D94605AA
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 12:33:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 158A5C0009;
 Wed,  4 Sep 2024 12:33:46 +0000 (UTC)
Date: Wed, 4 Sep 2024 14:33:45 +0200
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <20240904143345.42fb7e47@windsurf>
In-Reply-To: <20240904122040.738362-2-roykollensvendsen@gmail.com>
References: <20240904122040.738362-1-roykollensvendsen@gmail.com>
 <20240904122040.738362-2-roykollensvendsen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725453226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VhGLqixb0oPy6MSmS8xSFmp8lGZsJMFnRVOmjQda0GU=;
 b=kI97xjjM7TQjkBmInljq4oEBkhNnFn95qJhnIuymHd1MRj50LEgz3YW4j84Uxo3p3LQQzZ
 xUhGURi8wEKxqSDDFBuP1rT4aYqB+ca/qzymTLO79p84lrP6PP5YgCVll+Kw+VyUp0J9aj
 0YtAmjA5mKBNMaxSK3GoElbHgjF688B07IRkbjvcHRgXYErPKjYQ9rc5QxVnM6HD/QEcqI
 3rPaTwMsb30vkCopqctyLU1TpNM0lDdAuZPri+ewiOVfC/HOsVXdJ7gdcw2vdNUYAv3lvN
 IirFTnpCUzkW9pptFXkq6JNuRR2q+LTWFLkp9YFYUzJ4jeSbv1+16NcHcWNEWw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kI97xjjM
Subject: Re: [Buildroot] [PATCH 2/2] package/qt6/qt6base: allow selecting
 the host Qt Print Support module
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Wed,  4 Sep 2024 14:20:38 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> According to configure.cmake printsupport requires widgets:
> 
> qt_feature("printsupport" PRIVATE
>     LABEL "Qt PrintSupport"
>     CONDITION QT_FEATURE_widgets
>     SECTION "Module"
>     PURPOSE "Provides the Qt PrintSupport module."
> )
> 
> So we let print support automatically select widgets support.
> 
> Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>

This should be PATCH 1/2 in the series, because your patch adding
BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS uses this new
BR2_PACKAGE_HOST_QT6BASE_PRINTSUPPORT option.

> ---
>  package/qt6/qt6base/Config.in.host | 11 +++++++++++
>  package/qt6/qt6base/qt6base.mk     | 16 ++++++++++++++--
>  2 files changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/package/qt6/qt6base/Config.in.host b/package/qt6/qt6base/Config.in.host
> index 46fb668817..8f0bc1f070 100644
> --- a/package/qt6/qt6base/Config.in.host
> +++ b/package/qt6/qt6base/Config.in.host
> @@ -8,6 +8,13 @@ config BR2_PACKAGE_HOST_QT6BASE_GUI
>  config BR2_PACKAGE_HOST_QT6BASE_NETWORK
>  	bool
>  
> +# Select this if you need host qt6 tools that require the Qt Print Support
> +# module
> +# (e.g. Qt Tools Linguist Tools).

I don't think that this really makes sense. We don't really care about
how is using this (in the future, it may be other things). We care
about what the option does... but what it does is actually pretty
obvious from the option name. I think the only comment is to clarify
that yes, widget support is needed for the print support, which isn't
really obvious.

> +config BR2_PACKAGE_HOST_QT6BASE_PRINTSUPPORT
> +	bool
> +	select BR2_PACKAGE_HOST_QT6BASE_WIDGETS
> +
>  # Select this if you need host qt6 tools that require the Qt::Test module
>  # (e.g. qmltestrunner).
>  config BR2_PACKAGE_HOST_QT6BASE_TEST
> @@ -17,3 +24,7 @@ config BR2_PACKAGE_HOST_QT6BASE_TEST
>  # (e.g. qhelpgenerator).
>  config BR2_PACKAGE_HOST_QT6BASE_SQL
>  	bool
> +
> +# The Qt Widgets module is required by the Qt Print Support module

And this comment would become useless.

> +config BR2_PACKAGE_HOST_QT6BASE_WIDGETS
> +	bool

Isn't widget support dependent on GUI support?

> diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
> index 4c0392f92d..271f464115 100644
> --- a/package/qt6/qt6base/qt6base.mk
> +++ b/package/qt6/qt6base/qt6base.mk
> @@ -113,10 +113,8 @@ HOST_QT6BASE_CONF_OPTS += \
>  	-DFEATURE_png=OFF \
>  	-DFEATURE_gif=OFF \
>  	-DFEATURE_jpeg=OFF \
> -	-DFEATURE_printsupport=OFF \
>  	-DFEATURE_kms=OFF \
>  	-DFEATURE_fontconfig=OFF \
> -	-DFEATURE_widgets=OFF \
>  	-DFEATURE_libinput=OFF \
>  	-DFEATURE_tslib=OFF \
>  	-DFEATURE_eglfs=OFF
> @@ -131,6 +129,13 @@ else
>  HOST_QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
>  endif
>  
> +# The Qt Print Support module is required for building Qt Tools Linguist Tools

Not needed, it could be other things.

> +ifeq ($(BR2_PACKAGE_HOST_QT6BASE_PRINTSUPPORT),y)
> +HOST_QT6BASE_CONF_OPTS += -DFEATURE_printsupport=ON
> +else
> +HOST_QT6BASE_CONF_OPTS += -DFEATURE_printsupport=OFF
> +endif
> +
>  # We need host qt6base with Sql support for host-qt6tools to generate the
>  # qhelpgenerator host tool. qt6tools will fail to build if qhelpgenerator is not
>  # available.
> @@ -150,6 +155,13 @@ else
>  HOST_QT6BASE_CONF_OPTS += -DFEATURE_testlib=OFF
>  endif
>  
> +# The Qt Widgets module is required by the Qt Print Support module

Also not very relevant comment IMO.

> +ifeq ($(BR2_PACKAGE_HOST_QT6BASE_WIDGETS),y)
> +HOST_QT6BASE_CONF_OPTS += -DFEATURE_widgets=ON
> +else
> +HOST_QT6BASE_CONF_OPTS += -DFEATURE_widgets=OFF
> +endif

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
