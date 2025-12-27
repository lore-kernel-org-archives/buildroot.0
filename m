Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5554CE8FDD5
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 09:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEF7B403A3;
	Sat, 27 Dec 2025 09:58:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a6dGMaQwW6_W; Sat, 27 Dec 2025 09:58:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 005C940408
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766829539;
	bh=Z1p8vxfilc/55OaDneKyrJZXvoGqvSYow2Vo2NhTU1w=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XIAnyZ8iaScMurx+f6j9w+qPkA+ULBG5LgnAuOINyoB6wcC/m6n5Hgo0IKgvZaQYN
	 WSsr5kDdHrAsoribRO1qBxHkwaFWVMvonp1pCxD8oHy5cDQynsPqWcbQ1mKoq8yJdb
	 xWL9IyRqPSPzBTLlzYT/w6SfpS+jYOYH6V2+I9/BZKoqSkLlnjbve3yrDh7a2wWNU6
	 1NCUHqeR0OXf08CvcL47irbAka+/ATM1jymsRhn+aT+kdxAoR2l4qhy/zSWMCRJGqU
	 UmLulHmd5tIy/Cly6YvTlbO6ktGQhUuC2VF0EV1R1z0PJC7/Te2l1mCW4bpZx7xRwp
	 ROmS+Wk2qAvjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 005C940408;
	Sat, 27 Dec 2025 09:58:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 04B73119
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 09:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE54860758
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 09:58:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FLwOyEQpnlzK for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 09:58:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B13F56069B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B13F56069B
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B13F56069B
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 09:58:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id A97DD1A2498
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 09:58:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 66EF460725;
 Sat, 27 Dec 2025 09:58:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5F5D111978342; Sat, 27 Dec 2025 10:58:52 +0100 (CET)
Date: Sat, 27 Dec 2025 10:58:51 +0100
To: Trammell Hudson via buildroot <buildroot@buildroot.org>
Cc: Trammell Hudson <hudson@trmm.net>
Message-ID: <20251227105851.39b927c1@windsurf>
In-Reply-To: <aP0fg9gNzZ0xspy0@hachi.swcp.com>
References: <aP0fWpti-9PiGKxn@hachi.swcp.com> <aP0fg9gNzZ0xspy0@hachi.swcp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766829533; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=TcybVFqQRaAL6a31oUZnD5Of6VDNhw98NiOyJpuadZ8=;
 b=heDyVZTxo183m3TNAjlFR3WK7k03Pk1+3iY1w4EPxjI0qglxPk0l6BCoh5g4nz9DHiLqVE
 ME9RorCX18sZR5Cok547C5XBMFoS4xnWAmZccpdGrpHMHWw19Iq+EYAgjD0mpDelHc5tx7
 iB6OUTSw8iO7Gj3IZq1ALQjRTPrlEmDcjFx8i/r9U8oee64B2GrhLJ5MKtA08grSzJffQU
 +Y1Y8gYbFuqsz95v5J/CHpZ2fWiaxw631WhJQp2vugATYiosuVmG1xZMC/03jT+lNHIukd
 6/u6853D/HDYwA4hJM74YxFoQI2HiQEA/XMWywKbqB6vRXawFlWnx6rANCUaYg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=heDyVZTx
Subject: Re: [Buildroot] [PATCH 1/2] package/nqptp: Add version 1.2.4
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

Hello Trammell,

Sorry for the long delay in taking your contribution into account. I
have merged it after a number of changes, see below.

First, I've adjusted the commit title to:

	package/nqptp: new package

On Sat, 25 Oct 2025 13:05:39 -0600
Trammell Hudson via buildroot <buildroot@buildroot.org> wrote:

> This is the Not Quite PTP timing library necessary for
> AirPlay2 support with shairport-sync.
> 
> Signed-off-by: Trammell Hudson <hudson@trmm.net>
> ---
>  package/Config.in        |  1 +
>  package/nqptp/Config.in  |  6 ++++++
>  package/nqptp/S90nqptp   | 24 ++++++++++++++++++++++++
>  package/nqptp/nqptp.hash |  3 +++
>  package/nqptp/nqptp.mk   | 31 +++++++++++++++++++++++++++++++
>  5 files changed, 65 insertions(+)

I've added an entry in the DEVELOPERS file.


> diff --git a/package/nqptp/Config.in b/package/nqptp/Config.in
> new file mode 100644
> index 0000000000..cddb12e4d0
> --- /dev/null
> +++ b/package/nqptp/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_NQPTP
> +	bool "NQPTP"

Changed to:

	bool "nqptp"

I've added:

	depends on BR2_USE_MMU

as it doesn't build for noMMU platforms.

And also, I've added:

	select BR2_PACKAGE_LIBCONFIG

since you have a build-time dependency on it.

> +	help
> +	  Not Quite PTP for shairport-sync AirPlay 2 support.
> +	  https://github.com/mikebrady/shairport-sync

Changed to:

+         nqptp is a daemon that monitors timing data from PTP clocks
+         it sees on ports 319 and 320. It maintains records for one
+         clock, identified by its Clock ID.
+
+         It is a companion application to Shairport Sync and provides
+         timing information for AirPlay 2 operation.
+
+         https://github.com/mikebrady/nqptp

The important bit being that the homepage URL of the project is on a
separate line, which our coding style requires.

> +
> diff --git a/package/nqptp/S90nqptp b/package/nqptp/S90nqptp
> new file mode 100644
> index 0000000000..41dbb4749a
> --- /dev/null
> +++ b/package/nqptp/S90nqptp
> @@ -0,0 +1,24 @@
> +#! /bin/sh

I've fixed this script so that it is modeled after our standard
package/busybox/S01syslogd script.


> diff --git a/package/nqptp/nqptp.hash b/package/nqptp/nqptp.hash
> new file mode 100644
> index 0000000000..a1b686c1a9
> --- /dev/null
> +++ b/package/nqptp/nqptp.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  1df1d5edd5b713010d6495b3abca4c1cf4ad8fa6029df0abeb9e4de8e0eb707a  nqptp-1.2.4.tar.gz
> +sha256  1daaa904985807b7f9f2fa91f6b19f3faadf8df4e813f7451a691f89a6965e3f  LICENSES

LICENSES didn't exist.

> diff --git a/package/nqptp/nqptp.mk b/package/nqptp/nqptp.mk
> new file mode 100644
> index 0000000000..11dac9f10e
> --- /dev/null
> +++ b/package/nqptp/nqptp.mk
> @@ -0,0 +1,31 @@
> +################################################################################
> +#
> +# nqptp
> +#
> +################################################################################
> +
> +NQPTP_VERSION = 1.2.4
> +NQPTP_SITE = $(call github,mikebrady,nqptp,$(NQPTP_VERSION))
> +

I dropped this empty line.

> +NQPTP_LICENSE = MIT, BSD-3-Clause

License is GPL-2.0.

> +NQPTP_LICENSE_FILES = LICENSES

The file is LICENSE, not LICENSES.

> +NQPTP_DEPENDENCIES = libconfig host-pkgconf
> +
> +# git clone, no configure
> +NQPTP_AUTORECONF = YES
> +
> +NQPTP_CONF_OPTS = 

Dropped.

> +#NQPTP_CONF_ENV += LIBS="$(NQPTP_CONF_LIBS)"

Dropped.

> +
> +define NQPTP_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/nqptp \
> +		$(TARGET_DIR)/usr/bin/nqptp
> +endef
> +
> +define NQPTP_INSTALL_INIT_SYSV
> +	$(INSTALL) -D -m 0755 package/nqptp/S90nqptp \
> +		$(TARGET_DIR)/etc/init.d/S90nqptp
> +endef
> +
> +$(eval $(autotools-package))

Applied with all those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
