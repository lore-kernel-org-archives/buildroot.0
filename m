Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94663CFA45F
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 18:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49B1260863;
	Wed, 23 Oct 2024 18:58:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZrjKJ9FDwGya; Wed, 23 Oct 2024 18:58:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EE2E6089D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EE2E6089D;
	Wed, 23 Oct 2024 18:58:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5373127ED
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 18:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 417946089D
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 18:58:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w2Zd-ZxuymBI for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 18:58:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D48F560863
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D48F560863
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D48F560863
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 18:58:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 485F82003E0;
 Wed, 23 Oct 2024 20:58:51 +0200 (CEST)
Received: from [82.64.214.120:45086] via [82.64.214.120] by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 23 Oct 2024 20:58:51 +0200
MIME-Version: 1.0
Date: Wed, 23 Oct 2024 20:58:51 +0200
From: Julien Olivain <ju.o@free.fr>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20240620134959.1673948-1-kieran.bingham@ideasonboard.com>
References: <20240620134959.1673948-1-kieran.bingham@ideasonboard.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <242a0544880ebfd54efeff702acca0ad@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1729709932;
 bh=byetjhtFe+/cyjBbxAUaKpkxNtQVfSbKrCDobS/pOKA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UeoFGdADqXrXLqImQx04ZNMznoeGRg8xooI31757Xb8ab1roLSuagOLjp7v1dX/pj
 8Mq3v8sccYH4hDJEn58j2HiSsAc9Cn5VvIpSR8hGuOG9loeCgTbYxzpi5zRtE/IAxg
 cMyY6DzqWbNKMHZOUEvBmlGR8d519fmh8kSEZtYdbxv7ICdxe4DE+saN2VWtdb0MWB
 5U59KaZuGDCu1x7JTLMR+7guPvC3/xidgVGgqyDMpC7AdECPIBSpEdFWAT60OyE9VW
 CpHuSwJoV5yzBsdxGgzZfXkNUXuiMliRg+L4IwK86ias5HVVdIbLPLnysWS7oMJ+/7
 vAXor5TRjMl1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=UeoFGdAD
Subject: Re: [Buildroot] [PATCH v2] package/libcamera: Enable python bindings
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Kieran,

On 20/06/2024 15:49, Kieran Bingham wrote:
> Since libcamera commit f513fd70ba1a ("subprojects: Drop leftovers of
> pybind11"), merged before libcamera v0.1.0, libcamera has no longer
> relied on an external subproject branch of pybind to build the python
> bindings.
> 
> Provide a new package option to allow enabling the python bindings on
> libcamera when python3 is available in the buildroot configuration.
> Enabling the python bindings will select and bring in pybind as a
> dependency.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Thanks for the patch!  I applied it to master.

Best regards,

Julien.

> ---
>  package/libcamera/Config.in    | 7 +++++++
>  package/libcamera/libcamera.mk | 8 +++++++-
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
> index e84b8d342eea..4699e382c760 100644
> --- a/package/libcamera/Config.in
> +++ b/package/libcamera/Config.in
> @@ -24,6 +24,13 @@ menuconfig BR2_PACKAGE_LIBCAMERA
> 
>  if BR2_PACKAGE_LIBCAMERA
> 
> +config BR2_PACKAGE_LIBCAMERA_PYTHON
> +	bool "python bindings"
> +	depends on BR2_PACKAGE_PYTHON3
> +	select BR2_PACKAGE_PYTHON_PYBIND
> +	help
> +	  Enable libcamera python bindings
> +
>  config BR2_PACKAGE_LIBCAMERA_V4L2
>  	bool "libcamera v4l2 compatibility layer"
>  	help
> diff --git a/package/libcamera/libcamera.mk 
> b/package/libcamera/libcamera.mk
> index dfcd340b75a0..100934a97d6f 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -19,7 +19,6 @@ LIBCAMERA_CONF_OPTS = \
>  	-Dandroid=disabled \
>  	-Ddocumentation=disabled \
>  	-Dtest=false \
> -	-Dpycamera=disabled \
>  	-Dwerror=false
>  LIBCAMERA_INSTALL_STAGING = YES
>  LIBCAMERA_LICENSE = \
> @@ -45,6 +44,13 @@ ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_7),y)
>  LIBCAMERA_CXXFLAGS = -faligned-new
>  endif
> 
> +ifeq ($(BR2_PACKAGE_LIBCAMERA_PYTHON),y)
> +LIBCAMERA_DEPENDENCIES += python3 python-pybind
> +LIBCAMERA_CONF_OPTS += -Dpycamera=enabled
> +else
> +LIBCAMERA_CONF_OPTS += -Dpycamera=disabled
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBCAMERA_V4L2),y)
>  LIBCAMERA_CONF_OPTS += -Dv4l2=true
>  else
> --
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
