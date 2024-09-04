Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C033CD3431
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 12:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01BEA40340;
	Wed,  4 Sep 2024 12:30:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yw0-hnHpi3DG; Wed,  4 Sep 2024 12:30:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FFE0403C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FFE0403C4;
	Wed,  4 Sep 2024 12:30:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9EA371BF373
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 12:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 995EC6087A
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 12:30:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x0_k-8vxJzO1 for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 12:30:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 375EA60877
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 375EA60877
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 375EA60877
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 12:30:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 34ED4E000B;
 Wed,  4 Sep 2024 12:30:17 +0000 (UTC)
Date: Wed, 4 Sep 2024 14:30:16 +0200
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <20240904143016.14accde3@windsurf>
In-Reply-To: <20240904122040.738362-1-roykollensvendsen@gmail.com>
References: <20240904122040.738362-1-roykollensvendsen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725453017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YYrnfZI9JbeBVzoYChoeRGCyP2IhdvDm++h0+8dDeso=;
 b=b50P+dfJZB/m/t1cjMB2b1dmtNaQ8J0H7HW902ETj2j5yRa/dIjLy2m3WAsCvMl0se0/Td
 yYlE/CbksS6GDHBKlHxIDsn+g40XuCjPaKaCBk29W8NvpSOs8JICM+m9q6yw4kvmaLJ2o4
 ZR81vdx5xCcrIxZDY64DqLqDqn/6nVdXOL6h59ztuR4Two9f17PawQhtYdT0kWyyl87Sn/
 gPX6JNXqtRk9TWaCARFCgwZ+cO3q4tTuOI1kn8skgunJdPL9Jb9onyh0Dx5lsl4Jkw6wS3
 pmLtV0nwohdLhJwd8F5+0SFjW9NsX4A+BT1ukpBZWiUj2A495vQAd8BnJjJ86Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=b50P+dfJ
Subject: Re: [Buildroot] [PATCH 1/2] package/qt6/qt6tools: allow building
 host Qt Linguist Tools
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

On Wed,  4 Sep 2024 14:20:37 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> According to src/linguist/CMakeLists.txt we need to enable the
> linguist feature:
> 
> ...
> if(NOT QT_FEATURE_linguist)
>     return()
> endif()
> add_subdirectory(lconvert)
> add_subdirectory(lprodump)
> add_subdirectory(lrelease)
> add_subdirectory(lrelease-pro)
> add_subdirectory(lupdate)
> add_subdirectory(lupdate-pro)
> if(QT_FEATURE_process AND QT_FEATURE_pushbutton AND QT_FEATURE_toolbutton AND TARGET Qt::Widgets AND NOT no-png)
>     add_subdirectory(linguist)
> endif()
> ...
> 
> And according to configure.cmake we need to select print support:
> ...
> qt_feature("linguist" PRIVATE
>     LABEL "Qt Linguist"
>     PURPOSE "Qt Linguist can be used by translator to translate text in Qt applications."
>     CONDITION TARGET Qt::PrintSupport
> )
> ...
> 
> Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
> ---
>  package/qt6/qt6tools/Config.in   | 11 +++++++++++
>  package/qt6/qt6tools/qt6tools.mk | 10 ++++++++--
>  2 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/package/qt6/qt6tools/Config.in b/package/qt6/qt6tools/Config.in
> index 5f52c5644f..eea461a2a9 100644
> --- a/package/qt6/qt6tools/Config.in
> +++ b/package/qt6/qt6tools/Config.in
> @@ -15,3 +15,14 @@ config BR2_PACKAGE_QT6TOOLS
>  	  and design of applications.
>  
>  	  https://github.com/qt/qttools
> +
> +if BR2_PACKAGE_QT6TOOLS
> +
> +config BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS
> +	bool "linguist tools (host)"
> +	select BR2_PACKAGE_HOST_QT6BASE_PRINTSUPPORT
> +	help
> +	  Translate Qt C++ and Qt Quick applications into local
> +	  languages.

This should go in a package/qt6/qt6tools/Config.in.host, not in
Config.in as Config.in is for options that affect the target build.

> +
> +endif
> diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/qt6tools.mk
> index 09c986cfc6..897cf43054 100644
> --- a/package/qt6/qt6tools/qt6tools.mk
> +++ b/package/qt6/qt6tools/qt6tools.mk
> @@ -37,11 +37,17 @@ QT6TOOLS_DEPENDENCIES = \
>  	qt6base \
>  	host-qt6tools
>  
> +HOST_QT6TOOLS_DEPENDENCIES = host-qt6base
> +
> +ifeq ($(BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS),y)
> +HOST_QT6TOOLS_CONF_OPTS += -DFEATURE_linguist=ON
> +else
> +HOST_QT6TOOLS_CONF_OPTS += -DFEATURE_linguist=OFF
> +endif

Please group these host package things...

> +
>  ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
>  QT6TOOLS_DEPENDENCIES += qt6declarative
>  endif
>  
> -HOST_QT6TOOLS_DEPENDENCIES = host-qt6base

... here. Rather than inter-twining target package and host package
details.

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
