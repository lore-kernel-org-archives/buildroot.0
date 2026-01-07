Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EEFD0D16D
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 22:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D739581114;
	Wed,  7 Jan 2026 22:41:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PgbdMkvWciyS; Wed,  7 Jan 2026 22:41:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E46D80DCA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767825668;
	bh=gK9nf7Aw8rxel5SzIM2UzTiz1bTQqh4JYCSR3HgnILo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pXXHNqo6daRbg+OpFuHvBjSjh0jvh1sp4UCZU4CdMqTfJ8Sf7GQgk8Gyq/SVgJp+2
	 SYeq7+VFQv860Rigc/Iwc0QjP80MGd30q14hKYhUR+zCXpa4yOMCLc1ifO/Uxk+dqU
	 ut5CzU69AOpsDbgX/WWvIgdnPKn+S6SGTx/6t10/32vIf4jU+E1WHfJzHwGhb0t65m
	 egLpMzc6sdN+mFbcyIXDYuuECllQz8sRj++CJlr+hsWJcljjDKSqh0No4FYv0M6lz3
	 PIa/VeudQGJvOjTLlEuW6fPI5MBg0xQ8eO16TCPcdii4w577OSsIBxfCsaMes6mYsi
	 w2iME0SixH4QQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E46D80DCA;
	Wed,  7 Jan 2026 22:41:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E00B1436
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 22:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D18944029F
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 22:41:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zj3AOgWg--JY for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 22:41:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BFA5D4023C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFA5D4023C
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BFA5D4023C
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 22:41:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A868D4E41FDE
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 22:41:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7E32B606F8;
 Wed,  7 Jan 2026 22:41:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 372CD103C867C; Wed,  7 Jan 2026 23:40:59 +0100 (CET)
Date: Wed, 7 Jan 2026 23:40:58 +0100
To: Vincent Jardin via buildroot <buildroot@buildroot.org>
Cc: Vincent Jardin <vjardin@free.fr>
Message-ID: <20260107234058.5c46e3aa@windsurf>
In-Reply-To: <20260107175446.2470125-2-vjardin@free.fr>
References: <20260107175446.2470125-1-vjardin@free.fr>
 <20260107175446.2470125-2-vjardin@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767825659; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=pmKXjfG4HEuECbXVlFCGT50KyxoncmkivVTBFumTUjM=;
 b=y6+iwTT4IQYMiujkRXc1MKFv1RXCopml8UCAYCdlaPnc2DEPw/JQMDLJe9YKBS3+JveF70
 c0l3AXeHof8U1Zm8nskYwai7+mybnV860kBifxqVvo+qrZC7U/ocrTHnOJsXEbCS2V173b
 /nZXkTrZhe9Gz07fA1vMy2Y/34UOw4R4z/0HLXk274UAdeJUdVSW5bCJwdAFbuMq4WgHxH
 S9TO4KDoIxgG/vJWE+O1ujFl8t14f5X23tucG9Sd1l9oIVlZaQAzr5C6wu7l21O2O6sksi
 6r42o+tQwtj5ghk5fDRsKGLCYOMOIcq35wPpO33Chk72nhaFfK2hB2XkkrAzvg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=y6+iwTT4
Subject: Re: [Buildroot] [PATCH v1 1/2] package/python-libyang: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Vincent,

On Wed,  7 Jan 2026 18:54:45 +0100
Vincent Jardin via buildroot <buildroot@buildroot.org> wrote:

> diff --git a/DEVELOPERS b/DEVELOPERS
> index f982e3123a..5585e8b353 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3359,6 +3359,8 @@ F:	package/bfscripts/
>  F:	package/dpdk/
>  F:	package/libecoli/
>  F:	package/libyang-cpp/
> +F:	package/python-libyang/
> +F:	package/python-sysrepo/

There's a problem in the patch splitting here. This patch should only
add the entry for python-libyang.

>  F:	package/sysrepo-cpp/
>  
>  N:	Vincent Prince <vincent.prince.fr@gmail.com>
> diff --git a/package/Config.in b/package/Config.in
> index def3db0e50..19d32c16ea 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1205,6 +1205,7 @@ menu "External python modules"
>  	source "package/python-libconfig/Config.in"
>  	source "package/python-libevdev/Config.in"
>  	source "package/python-libusb1/Config.in"
> +	source "package/python-libyang/Config.in"
>  	source "package/python-lmdb/Config.in"
>  	source "package/python-lockfile/Config.in"
>  	source "package/python-log-rate-limit/Config.in"
> @@ -1434,6 +1435,7 @@ menu "External python modules"
>  	source "package/python-stack-data/Config.in"
>  	source "package/python-starlette/Config.in"
>  	source "package/python-sympy/Config.in"
> +	source "package/python-sysrepo/Config.in"
>  	source "package/python-systemd/Config.in"
>  	source "package/python-tabledata/Config.in"
>  	source "package/python-tcolorpy/Config.in"

Same comment here.

> diff --git a/package/python-libyang/Config.in b/package/python-libyang/Config.in
> new file mode 100644
> index 0000000000..793bf7e3c5
> --- /dev/null
> +++ b/package/python-libyang/Config.in
> @@ -0,0 +1,23 @@
> +config BR2_PACKAGE_PYTHON_LIBYANG
> +	bool "python-libyang"
> +	depends on BR2_PACKAGE_PYTHON3

Not needed, since all python-*/Config.in are already included inside a
if BR2_PACKAGE_PYTHON3... endif condition.

> +	depends on BR2_PACKAGE_LIBYANG

This should be a "select", and then you replicate the "depends on" from
BR2_PACKAGE_LIBYANG:

        depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libyang
        depends on BR2_TOOLCHAIN_HAS_THREADS # libyang
        depends on !BR2_STATIC_LIBS # libyang

> +	# Python3 doesn't work with uClibc and kernel headers < 5.1
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1

This is no longer the case, this issue has been fixed in Buildroot, so
this dependency can be dropped.

> +	select BR2_PACKAGE_PYTHON_CFFI

	select BR2_PACKAGE_PYTHON_CFFI # runtime

> +	help
> +	  Python CFFI bindings for the libyang YANG library.
> +
> +	  This package provides the 'libyang' Python module, used by
> +	  higher-level tooling such as python-sysrepo.
> +
> +	  https://github.com/CESNET/libyang-python
> +
> +comment "python-libyang needs python3, uClibc needs kernel headers >= 5.1"
> +	depends on !BR2_PACKAGE_PYTHON3 || \
> +		(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1)
> +
> +comment "python-libyang needs libyang"
> +	depends on BR2_PACKAGE_PYTHON3
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
> +	depends on !BR2_PACKAGE_LIBYANG

This needs to be updated to cover those dependencies:

        depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libyang
        depends on BR2_TOOLCHAIN_HAS_THREADS # libyang
        depends on !BR2_STATIC_LIBS # libyang

No need to mention the python3 dependency.

Rest looks good to me.

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
