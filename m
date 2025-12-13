Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929EAD5B169
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 22:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E6E4406BE;
	Sat, 13 Dec 2025 22:11:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iNaEok0stRZG; Sat, 13 Dec 2025 22:11:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F51B404E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765663892;
	bh=/nbthqrK4W80HknXSBe/JTunlHiEj8qeXlOpww0H6EU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YZdqJm1j0ZGjQjy5vNQO7cKP7ZKDSz8hPPFUnwSxZwn4U7JQFlu5IqiPAjxemzIpd
	 2vLEsW7Uf7nMp1hhpwhg9p0A0rPMgFws0znmZ/92W89fV8S6DNyZhTeeg35EokUp7L
	 fa4UXRKAk1uhkGos5wvDMOKDVhX53P3vPhpU8zUQLM2em+7jVTwyErPyRdUKg0mRdk
	 XxnVLph/SiHW3QxsJtxUmVe6PJCJ1tWgC98MsoeZ0r/ZBPKzOv43CB3aoKeqIS8MuN
	 Clt+9BjRUp0bcLvdNLXFmqg7panc+aPFyxqeqOBlN4iTelZtBM24eLCPKGM8ITAf9B
	 tyxVYCj+eyeIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F51B404E6;
	Sat, 13 Dec 2025 22:11:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B129013D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 22:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9755A402ED
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 22:11:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v4OujUruMIkV for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 22:11:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8645C40130
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8645C40130
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8645C40130
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 22:11:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id C6B4719F5AF;
 Sat, 13 Dec 2025 23:11:23 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 13 Dec 2025 23:11:23 +0100
MIME-Version: 1.0
Date: Sat, 13 Dec 2025 23:11:23 +0100
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Fiona Klute <fiona.klute@gmx.de>
In-Reply-To: <20251201-rasdaemon-v3-1-8ad394bdc372@bootlin.com>
References: <20251201-rasdaemon-v3-0-8ad394bdc372@bootlin.com>
 <20251201-rasdaemon-v3-1-8ad394bdc372@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <c517b6068e9301eabb9d433d1689cccc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765663887;
 bh=BMY+PCMa9lUX5l1Ye/y+xibMpiWAZRaTEqVaov5eFTg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Y5huR6rcJYkl2mRvgLAGN93hC3ACeEa9s3rDGVH/aBwmmTUnbCZpudU6usOyN1III
 s/PbXp1D2983f8U6p700A/lKt9NsWpONcfLaU8/Go3tDP05sk9DK8sVaYHI40PANLH
 WH87jm8IrkPLZT8HeD4sqMc9bbbmTBOHAOWIfqgPuM1fxU8evV/oTF54wbxJXe1vQI
 PzFRKpNAx5fyPcHogJEguB8ldVTrSgXaNjOqEkwDYOHL98YWkwe86KVEAHfI6BZoOL
 Ox6pIGKsrCInNqTg0jAwxItOy6+mWM8Tyt3Is7MjrSe7hgPk8TECNCQZkCRps6gKM0
 Y65jsm/pQRjkA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Y5huR6rc
Subject: Re: [Buildroot] [PATCH v3 1/2] package/rasdaemon: Add rasdaemon
 package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bastien,

Thanks for the patch.  I have few comments. See below.

On 01/12/2025 15:08, Bastien Curutchet via buildroot wrote:
> Rasdaemon is a tool that aims to replace the edac-tool and provide a 
> way
> to collect all hardware error events reported by the Linux kernel in a
> common framework.
> 
> Add a new package to support rasdaemon in the 'Hardware handling'
> section. It depends on libtraceevents to detect the ftrace events
> generated by the kernel and on sqlite to store these events.
> 
> Support for the PCIe AER events is optionnal and implies a dependency 
> on
> pciutils so also add a dedicated 'sub-option' to enable it.
> 
> Add a SYSV init script to start / stop the daemon
> 
> Add myself to the DEVELOPERS file.
> 
> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
> ---
[...]
> diff --git a/package/rasdaemon/Config.in b/package/rasdaemon/Config.in
> new file mode 100644
> index 
> 0000000000000000000000000000000000000000..68cef3a313bf2b82a8306ed5e0ec581cd618531d
> --- /dev/null
> +++ b/package/rasdaemon/Config.in
> @@ -0,0 +1,25 @@
> +config BR2_PACKAGE_RASDAEMON
> +	bool "rasdaemon"
> +	depends on !BR2_STATIC_LIBS # libtraceevent

rasdaemon seems to use unconditionally threads. See:
https://github.com/mchehab/rasdaemon/blob/v0.8.4/ras-events.h#L10

So you probably miss here a "depends on BR2_TOOLCHAIN_HAS_THREADS".
The Config.in comment also needs to be updated at the end of the file.

> +	select BR2_PACKAGE_LIBTRACEEVENT
> +	select BR2_PACKAGE_SQLITE

SQLite is an optional dependency. See:
https://github.com/mchehab/rasdaemon/blob/v0.8.4/configure.ac#L28

So you don't need to select BR2_PACKAGE_SQLITE here, and you could
preferably have in the .mk file something like:

ifeq ($(BR2_PACKAGE_SQLITE),y)
RASDAEMON_CONF_OPTS += --enable-sqlite3
RASDAEMON_DEPENDENCIES += sqlite
else
RASDAEMON_CONF_OPTS += --disable-sqlite3
endif

> +	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || 
> BR2_TOOLCHAIN_USES_MUSL
> +	help
> +	  rasdaemon is a tool that collects all hardware error events
> +	  reported by the Linux Kernel from several sources (EDAC, MCE
> +	  PCI, ...) into one common framework.

Could format the help string like other Buildroot packages,
please?

You should have a blank line, followed by just the homepage url:

https://github.com/mchehab/rasdaemon

> +	  See https://github.com/mchehab/rasdaemon for details.
> +
> +if BR2_PACKAGE_RASDAEMON
> +
> +config BR2_PACKAGE_RASDAEMON_AER
> +	bool "Enable AER support"
> +	select BR2_PACKAGE_PCIUTILS
> +	help
> +	  Enable handling of AER (Advanced Error Reporting) events on
> +	  PCIe
> +
> +endif
> +
> +comment "rasdaemon needs a toolchain w/ dynamic library"

The comment should become:
comment "rasdaemon needs a toolchain w/ threads, dynamic library"

> +	depends on BR2_STATIC_LIBS

Here the condition should become:
depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS

> diff --git a/package/rasdaemon/rasdaemon.mk 
> b/package/rasdaemon/rasdaemon.mk
> new file mode 100644
> index 
> 0000000000000000000000000000000000000000..50ac97a37dcbe63443bddca505ebc7c929116e53
> --- /dev/null
> +++ b/package/rasdaemon/rasdaemon.mk
> @@ -0,0 +1,33 @@
> +################################################################################
> +#
> +# rasdaemon
> +#
> +################################################################################
> +
> +RASDAEMON_VERSION = 0.8.4
> +RASDAEMON_SITE = $(call 
> github,mchehab,rasdaemon,v$(RASDAEMON_VERSION))
> +RASDAEMON_LICENSE = GPL-2.0+
> +RASDAEMON_LICENSE_FILES = COPYING
> +RASDAEMON_AUTORECONF = YES
> +
> +RASDAEMON_DEPENDENCIES = libtraceevent sqlite

The "sqlite" dependency could be removed and added in a conditional
block, as I suggested.

> +# rasdaemon uses argp.h which is not provided by uclibc or musl by 
> default.
> +# Use the argp-standalone package to provide this.
> +ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
> +RASDAEMON_DEPENDENCIES += argp-standalone
> +RASDAEMON_CONF_ENV += LIBS="-largp"
> +endif
> +
> +ifeq ($(BR2_PACKAGE_RASDAEMON_AER),y)
> +RASDAEMON_DEPENDENCIES += pciutils
> +RASDAEMON_CONF_OPTS += --enable-aer
> +else
> +RASDAEMON_CONF_OPTS += --disable-aer
> +endif
> +
> +define RASDAEMON_INSTALL_INIT_SYSV
> +	$(INSTALL) -m 0755 -D package/rasdaemon/S95rasdaemon \
> +		$(TARGET_DIR)/etc/init.d/S95rasdaemon
> +endef
> +
> +$(eval $(autotools-package))
> 
> --
> 2.51.1

Could you send an updated patch, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
