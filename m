Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39DACEFD04
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 21:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6FCF40612;
	Tue,  6 Jan 2026 21:00:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GLomXgUduXQm; Tue,  6 Jan 2026 21:00:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDE9A4061F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767733230;
	bh=p1kqtvJDhwVbC+VywPvYiqdGCNX5lkmVibsTVdsOBOI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=akR6FtSnmEoLsD2PWOVHi2/s9w/4UufIL0bTSDe9xYq5PFR09hkX3ylzcvCGhfrHr
	 a0cAdAy1QzigWF8jG50l2bAENtj89M05QJr8UhGuw/Pur4NTmnkH6hzxbWuwUBRIOW
	 LZOEAWI9+EBkXoT1Ki9b5wpNWzzizJc9GZkSXaHJry7SuEYi2rUDYkbvaywzRjkmMQ
	 oNdLdMnJtV1sn/VK5GsX3EncNBLo2MWXEHETmlPLqWunMyGkWfbdr6C1ECTC/HmuFX
	 Sgos5pD/1L/Vy3tejnPwHoMC9nsloKakITAtYrwph6rBVWlflFgXYyu5jp4InhWfSn
	 w87r/tTsvqlkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDE9A4061F;
	Tue,  6 Jan 2026 21:00:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D54F170B
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 21:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA0C2406EF
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 21:00:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 87V6c76jIXNm for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 21:00:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DD44340327
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD44340327
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD44340327
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 21:00:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id C9BD2C1E4BD;
 Tue,  6 Jan 2026 21:00:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B05F960739;
 Tue,  6 Jan 2026 21:00:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CF8E9103C85F8; Tue,  6 Jan 2026 22:00:24 +0100 (CET)
Date: Tue, 6 Jan 2026 22:00:23 +0100
To: Mohammed Sadik Shaik via buildroot <buildroot@buildroot.org>
Cc: Mohammed Sadik Shaik <s-sadik@ti.com>, Bryan Brattlof <bb@ti.com>,
 "Bajjuri Praneeth" <praneeth@ti.com>
Message-ID: <20260106220023.5441033a@windsurf>
In-Reply-To: <20251218065017.1286139-1-s-sadik@ti.com>
References: <20251218065017.1286139-1-s-sadik@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767733226; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=GDzpDlau4zenJxyEchrBk6xzE/HXWf8Fnf/KNTjKgak=;
 b=EhRdgSHvjtS7mCPOZx9g5695aVb1bkOySgHHwhKvJtLMrML7uMK1jj6OTANbgwr0KzlJIa
 Y6g6l6dKObjEWwjGTmot3RNla4dXW3AfteDjQMogNdFVluuAPUf7EXOz+Xgtt3+ZdVlXC0
 ZR3LcXIuUL5JTAVQ1D8ltnZSP9et1OwpfLpoHcjDdNF2Rvj3+Bh4W34iB0gBe70eRITbPc
 LGfRWacKqQPrEzPV6sg5LAGSPSgoVZdb74TFIomXCPYKrEF0aDGxvaMescjOF7MEGevACV
 MUMcQM4Z5nVM2/wS/TaRTq9g/UHfqHpIZBYLSHu46HnYZr+zhd7IfIeA1DBfag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=EhRdgSHv
Subject: Re: [Buildroot] [V2] package/k3conf: new package
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

Hello Mohammed,

On Thu, 18 Dec 2025 12:20:18 +0530
Mohammed Sadik Shaik via buildroot <buildroot@buildroot.org> wrote:

> K3CONF is a Linux user-space standalone application
> designed to provide a quick'n easy way to dynamically
> diagnose Texas Instruments' K3 architecture based
> processors. K3CONF is intended to provide similar
> experience to that of OMAPCONF that runs on legacy TI platforms.
> 
> K3CONF currently supports Texas Instruments AM654, J721E, J7200, 
> AM64x,AM62x,J721S2,J784S4,J722S, AM62Ax, AM62Px, and AM62Lx devices.
> Along with the BeagleBoard variants of the above mentioned TI SOC's.
> 
> Signed-off-by: Mohammed Sadik Shaik <s-sadik@ti.com>

Thanks for your v2, which I have applied with some tweaks. See below.


> diff --git a/package/k3conf/Config.in b/package/k3conf/Config.in
> new file mode 100644
> index 0000000000..6146a5413b
> --- /dev/null
> +++ b/package/k3conf/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_K3CONF
> +	bool "k3conf"

Added:

	depends no BR2_aarch64

here since it's only for K3 platforms, which AFAIK are all ARM64.

> +	help
> +	  A Powerful Diagnostic Tool for Texas Instruments K3 based
> +	  Processors.

Replaced this text with parts of your commit log, which was much more
useful.

Added a blank line to separate the help text with the upstream URL
below.

> +	  https://git.ti.com/cgit/k3conf/k3conf
> diff --git a/package/k3conf/k3conf.hash b/package/k3conf/k3conf.hash
> new file mode 100644
> index 0000000000..2c8d4ef664
> --- /dev/null
> +++ b/package/k3conf/k3conf.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated sha256sum
> +sha256  a3459f80e7af5672da6b41bc0814114690dd549aac4cf81ba4e5dc84d42ab9c6  k3conf-v0.4-git4.tar.gz
> +sha256  f962a0a4912aeae2d6f2f6e07bc3f79f7f1df9d4bf1abfb5c421b9b14352bfaf  LICENSE
> diff --git a/package/k3conf/k3conf.mk b/package/k3conf/k3conf.mk
> new file mode 100644
> index 0000000000..da21fcccbb
> --- /dev/null
> +++ b/package/k3conf/k3conf.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# k3conf
> +#
> +################################################################################
> +
> +K3CONF_VERSION = v0.4
> +K3CONF_SITE = https://git.ti.com/git/k3conf/k3conf.git
> +K3CONF_SITE_METHOD = git
> +K3CONF_LICENSE = BSD-3-Clause
> +K3CONF_LICENSE_FILES = LICENSE
> +
> +define K3CONF_LINUX_CONFIG_FIXUPS
> +        $(call KCONFIG_ENABLE_OPT,CONFIG_DEVMEM)

Indentation here should have been with a tab. Noticed by "make
check-package".

Thanks a lot for your contribution!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
