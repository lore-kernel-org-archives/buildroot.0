Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC08FA3755
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 22:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECBFD40851;
	Fri,  2 Jan 2026 22:33:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Vu6o5l5vf8g; Fri,  2 Jan 2026 22:33:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBDFF407D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767393198;
	bh=qaS6qyPDS0WXfWIFhF0W4JiEJafPjuhORT6bUIjifZM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=f0sh8S0/laydbMCovv2p6kZ75tAwH4ppXJNpldakAUvHzkEHj3KnHjFk++tbtFuDD
	 G73rryPSTPwM3HIsygMMkdgpvDO4VwhOyvSbnsch8bUN7nUr3P6nhceRO/wFsYr202
	 ng+9vdoJVZHzXKpqd82LUJsqsSOAvsoUOYEK13e9wD058PrKQM+1mip+26rSvc2Lsi
	 rE+UXf4v6nCJp5RAL9zD63UI/qMOakpEjdnkQ3hfNcUneTCpMBeczzkhKa+sU7LYJl
	 Ieq6GtfdlxpMh1EcDHeRWwos7AH89OiH4yghGoai/fkzxrWSCb05LZlCQHq3QRJzMk
	 fRLVtrtMeDdaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBDFF407D4;
	Fri,  2 Jan 2026 22:33:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EE02819D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3A2D608D4
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:33:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Da1tmFurF3GK for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 22:33:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BDDE860844
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDDE860844
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BDDE860844
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:33:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 5E3E11A25EA;
 Fri,  2 Jan 2026 22:33:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 19AB2606C7;
 Fri,  2 Jan 2026 22:33:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EB646113B023D; Fri,  2 Jan 2026 23:33:09 +0100 (CET)
Date: Fri, 2 Jan 2026 23:33:08 +0100
To: Vladimir Oltean <olteanv@gmail.com>
Cc: buildroot@buildroot.org, Brandon Maier <Brandon.Maier@collins.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>, Romain Naour
 <romain.naour@smile.fr>, Vincent Jardin <vjardin@free.fr>, Julien Olivain
 <ju.o@free.fr>, Akhilesh Nema <nemaakhilesh@gmail.com>
Message-ID: <20260102233308.49adad9a@windsurf>
In-Reply-To: <20250830173313.164981-3-olteanv@gmail.com>
References: <20250830173313.164981-1-olteanv@gmail.com>
 <20250830173313.164981-3-olteanv@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767393193; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=yTBqPDG+O1v1NdTvBWhbxLI39xC23gKlz0BTdERxMNo=;
 b=Sgp8XKTBeWOeSdek60WTguWMRLuXIZk/WifKdwfo9PntYS+dRcE0NiMq1F9at43vC81Yzz
 sGsjjkXMfSy82K7UXBHZFDUkK2A32bRalvhWwVLtP6Ry9zFuZJr01iG6O1xRuyUc/epJd3
 41+eRRPjHYsjXEpJMNur1/Wo0AQQ2eq3x1Bjxl0/GS9s85tKHEs2cKq7+yygpIU37obq8p
 ghEvDFjLcpSct13W0HRexOx6CDjkkoBiWTG8nujt1w0tj+xe8udjxkmn6ft3nldDW/FMHE
 oxoqvJtDodob81m3Z8gMu7oGxHaAKOsxop1be2VfTIeH5Daw5Yh7vbN4RvQe6g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Sgp8XKTB
Subject: Re: [Buildroot] [PATCH v4 2/2] board/lx2160ardb: new platform
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

Hello Vladimir,

On Sat, 30 Aug 2025 20:33:13 +0300
Vladimir Oltean <olteanv@gmail.com> wrote:

> Add Buildroot support for the NXP LX2160A-RDB (reference design board).
> This is configured here to boot from the SD card. To my surprise, NXP
> RCWs for LX2160A rev2 silicon don't have a pre-existing example for SD
> boot, so until one is available, include the RCW through board files.
> 
> I would have been fine with the default U-Boot environment, except that
> I would like to ship the MC firmware deployed as a file in the
> filesystem, and that requires a custom 'mcinitcmd' environment variable
> to load it. Thus, the 'env default -a' output was customized and
> included here in its entirety.
> 
> Previous review feedback said that the U-Boot environment is too large:
> https://lore.kernel.org/buildroot/2hhshlixqffg7r3o33klqzyvbxnpwllhhkskbi5igtewh6htlg@5huoxuxspqlv/
> Short of me starting to strip away features, the best I can do is to
> amortize the cost by taking away some variables and placing them in
> other U-Boot environment variable files which can be reused.

I'm still not excited by these massive U-Boot environments. Imagine we
start to have something like this for all boards? It would be a real
mess.

Options that I see:

- Since anyway you're rewriting the entire environment, why does it
  matter to use extlinux? extlinux is great when the U-Boot environment
  is already set to use it. But here you anyway override the whole
  environment, so you could just as well use a trivial environment that
  just implements the bootcmd that works for the Buildroot use-case.

- You could use the new "U-Boot Standard Boot" mechanism, which
  replaces the madness of U-Boot scripts/environment variables by
  something much nicer implemented in C, and which needs only a handful
  of environment variables.

> diff --git a/configs/lx2160ardb_defconfig b/configs/lx2160ardb_defconfig
> new file mode 100644
> index 000000000000..02cab7754e28
> --- /dev/null
> +++ b/configs/lx2160ardb_defconfig
> @@ -0,0 +1,58 @@
> +BR2_aarch64=y
> +BR2_cortex_a72=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y

I think we now want to use external toolchains for new defconfigs.
However, I'll be happy to merge it without this change as it's kind of
a new requirement, and you've been trying to get this defconfig in for
quite some time already.

Honestly the rest looks good, it's really just the madness of the
U-Boot environment that I dislike.

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
