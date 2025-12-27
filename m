Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65775E92712
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 15:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28D2D40612;
	Sat, 27 Dec 2025 15:05:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zOVLl2J6-RDd; Sat, 27 Dec 2025 15:05:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56FE640623
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766847914;
	bh=lDnycKeYqd/Fj/QmRUY7zD5WDw8ab42gsEopHMa4WOc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RXb4PrOloql66GqAEeAauEcVgOYc1mdLWPMFkluxO7sPgW30OSwAdatU7gxYEEj+n
	 pqeGgAfEBzvJ1iOUaGOxXyBM/g2PozUkdOS/aqeRrp9CIAIqJIOa3hb+NxSyelVB63
	 dM1zmsq/Pz6Q7mnikzwCDuXMefgNCreDMIiROkrmfPl3I0mmUzZpzXCocUMeWzb4am
	 +fNivfVW1i/cXDvaHXZPQdakLWvBZcvSSb8T2FfkZJLz5B/kTqE8ks/6DYh2tpXGBm
	 YFvNqHm6sg1nDP9ZI+bCEbuIIGcqZH9lA6Cc2EE0CCfMIHJJG96LLqGuSctA5+EzwM
	 b0rUdHygt3tlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56FE640623;
	Sat, 27 Dec 2025 15:05:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B0598119
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91EAE40623
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:05:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M0Ud7bMv-xgD for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 15:05:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 844D240612
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 844D240612
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 844D240612
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:05:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E9E144E41E01;
 Sat, 27 Dec 2025 15:05:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A2CC360725;
 Sat, 27 Dec 2025 15:05:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B5DB1119784E5; Sat, 27 Dec 2025 16:05:06 +0100 (CET)
Date: Sat, 27 Dec 2025 16:05:05 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>, Antoine Tenart
 <atenart@kernel.org>, Marcus Folkesson <marcus.folkesson@gmail.com>
Message-ID: <20251227160505.42602460@windsurf>
In-Reply-To: <20251221171550.2356174-1-bernd@kuhls.net>
References: <20251221171550.2356174-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766847907; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=AhGigHglOq8Vc6/9Sq1E0rF7yPXJYYTbSae5Frw4VrI=;
 b=zuEQQ0oGLjLbcMg2jXPW33nku88U7MRmdPEuGKanQoo+c4NCdPYDi9M7WwCWIT2UPl+CzY
 RYBFCjYCU1iMfp2hYUGeEPKJH9DRTowWgQxzh7Fjc4PfdRbaw28FEjaVvG68KZGlWam4P4
 Tr1AboGOzCv4jJLTw9CVOYTsJI3Y/6NuiZ4QHr2eU1ygy4GB6vHkyoDH8dS+6vjQi4Cbml
 jz+0rJJKKGPHuYWcYoMOdzAthdDKO3q8PedJFdbLvGhH0HyZgi94fgCQY7m32da1VQXTuV
 qLdF3qlQTuywVh734RZHfUgoElqVQ9gQvbdgbIpOtMKSEoWxZ2/kL7yJDu2B5Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=zuEQQ0oG
Subject: Re: [Buildroot] [PATCH 1/1] package/libselinux: fix Python build
 errors
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

Hello Bernd,

On Sun, 21 Dec 2025 18:15:50 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> diff --git a/package/libselinux/0003-Build-python-module-without-isolation.patch b/package/libselinux/0003-Build-python-module-without-isolation.patch
> new file mode 100644
> index 0000000000..9614efa6c8
> --- /dev/null
> +++ b/package/libselinux/0003-Build-python-module-without-isolation.patch
> @@ -0,0 +1,41 @@
> +From: =?utf-8?q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
> +Date: Mon, 27 Oct 2025 22:40:59 +0100
> +Subject: Build python module without isolation (Closes: #1119155)
> +
> +Let pip find the system installed setuptools.
> +
> +Downloaded from
> +https://sources.debian.org/src/libselinux/3.9-4/debian/patches/Build-python-module-without-isolation-Closes-1119155.patch
> +
> +Used by Debian to fix a build error:
> +https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1119155
> +
> +Building the Buildroot package breaks with a different error:
> +
> +      ModuleNotFoundError: No module named '_sysconfigdata__linux_aarch64-linux-gnu'
> +
> +which is also fixed by this patch, most likely both are caused by
> +incorrect usage of python-pip by libselinux:
> +https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1121121#29
> +
> +Upstream: buildroot-specific

This makes no sense. The patch comes from Debian, so surely it is NOT
Buildroot-specific. That's just an excuse not to upstream it :-)

So I did send it upstream:

  https://lore.kernel.org/selinux/20251227143911.1630813-1-thomas.petazzoni@bootlin.com/

I don't know if it will be accepted of course, but at least I've tried.

> + install-pywrap: pywrap
> +-	CFLAGS="$(CPPFLAGS) $(CFLAGS) $(SWIG_CFLAGS)" $(PYTHON) -m pip install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR) --ignore-installed --no-deps` $(PYTHON_SETUP_ARGS) .
> ++	CFLAGS="$(CPPFLAGS) $(CFLAGS) $(SWIG_CFLAGS)" $(PYTHON) -m pip install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR) --ignore-installed --no-deps --no-build-isolation` $(PYTHON_SETUP_ARGS) .

This patch was passing --no-build-isolation only when $(DESTDIR) was
not empty.

In the context of Buildroot, this means that --no-build-isolation was
passed for the target libselinux (which is installed with
DESTDIR=$(TARGET_DIR)), but --no-build-isolation was not passed for the
host libselinux (which is installed with prefix=$(HOST_DIR), but an
empty $(DESTDIR).

So, I've moved --no-build-isolation outside of this condition, which
solves the issue that your patch "package/libselinux: host-python3
needs SSL support" was trying to solve.

Also, as very often your patch was missing a very critical piece of
information: since when was this failing? Without this information, we
cannot merge your patches. We've asked you time and time again to
provide this important piece of information, but you continue to omit
this information, putting on the reviewers/maintainers the burden of
doing the necessary investigation. I would _really_ appreciate if you
could improve on this. Basically, *everytime* you send a patch fixing
something, it must *always* *always* *always* explain when the problem
was introduced.

Thanks a lot for your contributions!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
