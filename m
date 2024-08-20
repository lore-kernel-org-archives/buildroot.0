Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55ABFC3DA4A
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 21:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FAD940474;
	Tue, 20 Aug 2024 21:36:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B14kKeqULImj; Tue, 20 Aug 2024 21:36:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3D7540B5E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3D7540B5E;
	Tue, 20 Aug 2024 21:36:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF6FE1BF3B8
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 21:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C931E6071E
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 21:36:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7vB4D2B_ULpe for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 21:36:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6DBE7606EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DBE7606EA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6DBE7606EA
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 21:36:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5CB8713F88E;
 Tue, 20 Aug 2024 23:36:47 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 20 Aug 2024 23:36:47 +0200
Date: Tue, 20 Aug 2024 23:36:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <ZsUMb1U7cYJvrODe@landeda>
References: <20240820172343.2124306-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240820172343.2124306-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724189811;
 bh=xpuyCi/Pg8shk9iOaQXTWNZz6WOb8I7GgPxeFO1ZD9M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gJFSh6Onu86g+PcteTfRSX7eOec3IlivoD8kvO4Fm2eBNTPaEgnIaS93ABbQmS6j+
 xp4mK4iNmrl8qcDYu/dxyDfZAdl1gYPZFc62iZF9uiaXMa2e/8LhNyjEcaI8Ah19Cy
 pVWWfFN5dIEEEemIp2KvxHfGTOt9/poz5Nz9LReqaKsWsTfCxdrm/3f3DCUvST4QJL
 EHNBKQtGk52NydI1V540Z3SWmVLf/xjLdljUviaQkR2NWWeOJqghWFsMFZe3L6ShgC
 mH07srqquG6qH4+lNJ3786p/SxuTonkVggltZM+ShrZEOGpTvSDbld7sS4xC+/NHZt
 qqCTYYuEa+Zkg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gJFSh6On
Subject: Re: [Buildroot] [PATCH v2] package/ntpsec: fix host building
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
Cc: linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2024-08-20 19:23 +0200, Dario Binacchi spake thusly:
> The following build failure on xtensa:
> 
> Waf: Entering directory `/home/buildroot/instance-0/output-1/build/ntpsec-1.2.3/build/host'
> [1/2] Processing ntpd/ntp_parser.y
> [2/2] Compiling build/host/ntpd/ntp_parser.tab.c
> gcc: error: unrecognized command-line option '-mlongcalls'
> gcc: error: unrecognized command-line option '-mauto-litpools'
> 
> reveals that the target's CFLAGS are being used for host compilation.
> The patch fixes the host compilation by correctly setting the CFLAGS to
> be used.
> 
> It should be noted that the build script used by ntpsec applies CFLAGS
> for host compilation and --cross-cflags for target compilation.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/9321a637f2c340ce8dcb24249676bb6c44d0dfc6

I've added a little blurb that explains how long it has been happening,
so what branches it should be backported to.

> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>   - Rework the patch following the suggestion of Thomas Petazzoni.
>   - Update the commit message
> 
>  package/ntpsec/ntpsec.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/ntpsec/ntpsec.mk b/package/ntpsec/ntpsec.mk
> index 661af788423c..3acf7745cf07 100644
> --- a/package/ntpsec/ntpsec.mk
> +++ b/package/ntpsec/ntpsec.mk
> @@ -42,6 +42,7 @@ NTPSEC_DEPENDENCIES = \
>  # --cross-compiler
>  NTPSEC_CONF_OPTS = \
>  	CC="$(HOSTCC)" \
> +	CFLAGS="$(HOST_CFLAGS)" \
>  	PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python3-config" \
>  	--libdir=/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/ntp \
>  	--cross-compiler="$(TARGET_CC)" \
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
