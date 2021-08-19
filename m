Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ECD2C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:00:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA38F610CF
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA38F610CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98F1360639;
	Thu, 19 Aug 2021 20:00:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gbq08yFjjvGk; Thu, 19 Aug 2021 20:00:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2DFF613A3;
	Thu, 19 Aug 2021 20:00:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11C991BF59F
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0186880E37
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:00:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uI5kyN4tpl7e for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 20:00:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D8E180DAD
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 20:00:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9904:2733:9b91:ffcc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 65EB52003A4;
 Thu, 19 Aug 2021 22:00:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1629403226;
 bh=zIWZVijeYY6MxKpZrz3nblF0hTNpbasubYwBr1YwBR8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NdhJSohRReAzXilwQnWaLUgYgAJ64LGmdxKo5IAnuToRSl41gUH+qpcRmI5cnNPeE
 bIbBZF/+oyyJWQwbzP5KMlD+BHnU/Uvyqb+d2jo1noO5dly5RUttx+udzOtuIRMCzM
 xm68hR4x7BPwZ+utTNoMo+zn5JEYnDkOenweImK9MPgTAdBLrJi9VUSO/gQdqsz7eQ
 hJzjHabtFJ8CO/dTR32G+8wmzKn33ITFhidEzd7fHTrvQahbfcB427oy8U21mMIXcw
 x3YQRclW2uk1FmbsDI9lgmdDc0z0OcmSiUp6U4y/dRjJOMR3A6/UE/7a3rZ8HZguyT
 jHFEt7ZQi64RQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 19 Aug 2021 22:00:22 +0200
Date: Thu, 19 Aug 2021 22:00:22 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210819200022.GA27036@scaer>
References: <20210819172154.7575-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210819172154.7575-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/nvidia-driver: fix build
 without X.org drivers
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-08-19 19:21 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure without BR2_PACKAGE_NVIDIA_DRIVER_XORG
> raised since commit 9cda982855315d683d4880e6bb2a129133ea7213:
> 
> ln: failed to create symbolic link '/tmp/instance-0/output-1/target/usr/lib/xorg/modules/extensions/libglx.so': No such file or directory
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c2e7a826c105363309f70a3fcfe28bd53efcb94a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/nvidia-driver/nvidia-driver.mk | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
> index 7e89c1ab01..54c2aa46d8 100644
> --- a/package/nvidia-driver/nvidia-driver.mk
> +++ b/package/nvidia-driver/nvidia-driver.mk
> @@ -96,6 +96,12 @@ NVIDIA_DRIVER_LIBS += \
>  	nvidia_drv.so:xorg/modules/drivers/ \
>  	libglx.so.$(NVIDIA_DRIVER_VERSION):xorg/modules/extensions/
>  
> +# libglx needs a symlink according to the driver README. It has no SONAME
> +define NVIDIA_DRIVER_SYMLINK_LIBGLX
> +	ln -sf libglx.so.$(NVIDIA_DRIVER_VERSION) \
> +		$(TARGET_DIR)/usr/lib/xorg/modules/extensions/libglx.so
> +endef
> +
>  endif # X drivers
>  
>  ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_CUDA),y)
> @@ -187,12 +193,6 @@ define NVIDIA_DRIVER_INSTALL_STAGING_CMDS
>  	$(NVIDIA_DRIVER_INSTALL_GL_DEV)
>  endef
>  
> -# libglx needs a symlink according to the driver README. It has no SONAME
> -define NVIDIA_DRIVER_SYMLINK_LIBGLX
> -	ln -sf libglx.so.$(NVIDIA_DRIVER_VERSION) \
> -		$(TARGET_DIR)/usr/lib/xorg/modules/extensions/libglx.so
> -endef
> -
>  # For target, install libraries and X.org modules
>  define NVIDIA_DRIVER_INSTALL_TARGET_CMDS
>  	$(call NVIDIA_DRIVER_INSTALL_LIBS,$(TARGET_DIR))
> -- 
> 2.30.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
