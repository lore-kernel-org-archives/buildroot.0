Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C1A8CD5BAB
	for <buildroot@archiver.kernel.org>; Thu, 21 May 2026 20:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E39DD423A4;
	Thu, 21 May 2026 20:21:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m7_4vVuSNjGI; Thu, 21 May 2026 20:21:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E08C54239F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779394877;
	bh=IBwlYUCBFXnmJPTncxIlC/N0bKOTGL0QyYJVGzHIB+k=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rN0eTEFDrtxX/JHMc+n/MlE5vNxoUOEb1GfAxjbzao7EZbGsP9W+OzdtlkxeOWm2i
	 nv6uCCfFZx9/KHhfEEDwRRZifD/obszjjIF61xGhW5kCvaByp5jmhgNQsEix0h+XeT
	 2i2Hyj0cd4HaTDK7rkF0foahfSQH4TQAcz0tK7MBBeCJ8hYdCW/uWLn30U9kS7DwpZ
	 2M0emkjE+A486JTwnmz0yJkinjjl+9NUEKQFeV5lloc+dArQgBslsZ63CFx4jakBhx
	 NtF/pEHVwNg1DgI0VTV3mPEpcIZrg5LZB5ybIcJIRJ+fOsDKABZAZI+r6lSwPRKUAP
	 NXGv2YhZgE14A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E08C54239F;
	Thu, 21 May 2026 20:21:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BD742282
 for <buildroot@buildroot.org>; Thu, 21 May 2026 20:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF36561C8A
 for <buildroot@buildroot.org>; Thu, 21 May 2026 20:21:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id szoK8FAXmgpW for <buildroot@buildroot.org>;
 Thu, 21 May 2026 20:21:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F258761C87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F258761C87
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F258761C87
 for <buildroot@buildroot.org>; Thu, 21 May 2026 20:21:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BB675B97C56B; Thu, 21 May 2026 22:21:11 +0200 (CEST)
Message-ID: <6caa0831-abbd-4300-97ab-38757c18499c@rnout.be>
Date: Thu, 21 May 2026 22:21:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260515-virglrenderer-v7-0-1f1814b65ccd@gmail.com>
 <20260515-virglrenderer-v7-6-1f1814b65ccd@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260515-virglrenderer-v7-6-1f1814b65ccd@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779394872; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Z65Myx+6UOVfXtiUf70rqaT10oZ9EGrEHdPmOjW+InU=;
 b=PXl+reRWhldtTPlqz8AuUleN+RXJJZxhaSUm57AxVVGVGnVBPP1n54ARKmsmW6asBan0vd
 UULi0rmG+kbDlEYtr9qYcJnrge98fbrl0QsNvjb4v5oJky65oZ8Olrv71HZYMfTi9khKnk
 8fTI/7qJCQW8N1SQUgAyPsep/Qqf/Nd/g5g+JQZ2WLIGgYWL5H5130U2OB9lP8+BeuQFsX
 /YZ6ul8QL8kQBAXz88dUwSRXTNBKZ92L7VTsWHv+oTz3GqgwyyBqF56AFpwnW67xCtmK7M
 awJab1pZ5MytaY1NFRoOIqbRQSVWsel/bHYDXlYUvNcuhiuehuwS+M7lJnFvlg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=PXl+reRW
Subject: Re: [Buildroot] [PATCH v7 6/8] package/qemu: add OpenGL config
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



On 16/05/2026 04:03, Joseph Kogut wrote:
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---
>   package/qemu/Config.in | 14 ++++++++++++++
>   package/qemu/qemu.mk   |  8 +++++++-
>   2 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/package/qemu/Config.in b/package/qemu/Config.in
> index 2a6aa288d3..d4e4e37a3e 100644
> --- a/package/qemu/Config.in
> +++ b/package/qemu/Config.in
> @@ -112,6 +112,20 @@ config BR2_PACKAGE_QEMU_SDL
>   	  Say 'y' to enable the SDL frontend, that is, a graphical
>   	  window presenting the VM's display.
>   
> +config BR2_PACKAGE_QEMU_OPENGL
> +	bool "Enable OpenGL"
> +	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL # needs libepoxy w/ EGL or GL

  Even though it only includes epoxy/egl.h and not EGL/egl.h, it's still using 
symbols from EGL/egl.h so I think the comment is not needed.

  But basically you can add my

Acked-by: Arnout Vandecappelle <arnout@rnout.be>

  Regards,
  Arnout

> +	select BR2_PACKAGE_LIBEPOXY
> +	help
> +	  Say 'y' to enable OpenGL accelerated display frontend support.
> +	  This is necessary to efficiently display frames rendered in a
> +	  guest on the host.
> +
> +	  Run qemu with `-display sdl,gl=on`
> +
> +comment "OpenGL support needs an OpenGL and/or OpenGL EGL backend"
> +	depends on !(BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
> +
>   config BR2_PACKAGE_QEMU_FDT
>   	bool "Enable FDT"
>   	select BR2_PACKAGE_DTC
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index 2199db38cf..aff1762fb9 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -272,6 +272,13 @@ else
>   QEMU_OPTS += --disable-usb-redir
>   endif
>   
> +ifeq ($(BR2_PACKAGE_QEMU_OPENGL),y)
> +QEMU_OPTS += --enable-opengl
> +QEMU_DEPENDENCIES += libepoxy
> +else
> +QEMU_OPTS += --disable-opengl
> +endif
> +
>   ifeq ($(BR2_STATIC_LIBS),y)
>   QEMU_OPTS += --static
>   endif
> @@ -329,7 +336,6 @@ define QEMU_CONFIGURE_CMDS
>   			--disable-membarrier \
>   			--disable-mpath \
>   			--disable-netmap \
> -			--disable-opengl \
>   			--disable-oss \
>   			--disable-pa \
>   			--disable-plugins \
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
