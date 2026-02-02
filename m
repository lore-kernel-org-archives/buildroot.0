Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC85AE7DF11
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 18:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CAEC82387;
	Mon,  2 Feb 2026 18:11:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ktjSXP7KUVDC; Mon,  2 Feb 2026 18:11:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F1298297F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770055883;
	bh=N8a5m0OO1aCeEMaEOdE7LbekwPmuXUFt2hvvJGTmJ+4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ehkajg+5mbH/hQW2dcehVNErdOO8boAvoXt99AjXDrI0hi+uZ4iYDvHyEf+Jp9BzB
	 zBwHTtVwLzBER8iRwEkUyvN+sU6En9xHiyEprhQp7HEYCy6A8mA8b0AvYNLqV9hSly
	 A2BLp8eJV61in+39rp8VgE+gGdl1H8xCCSe2NwwOT6SIvmeepSpY/uNVcjySmKFoaY
	 kjHmdBV7iuiTpPjo9XHSWpIA59PuFhyJYDh+BgDAYr2gW/kVmbPU7x3+WqDFWF8kO7
	 krUB3NgsnTMtDVL4kQ9pev0StOkUITmhwZ0N2RtoSPnrYM33w/hXHiLLN9c3a9b7oF
	 97GxTNpEWimVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F1298297F;
	Mon,  2 Feb 2026 18:11:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D7B61E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6AA0C607AA
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:11:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pM1g3A4FUIMr for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 18:11:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5D0CF60782
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D0CF60782
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D0CF60782
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:11:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 85B9B4E423C1;
 Mon,  2 Feb 2026 18:11:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5084160767;
 Mon,  2 Feb 2026 18:11:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 67D18119A88F8; Mon,  2 Feb 2026 19:11:16 +0100 (CET)
Date: Mon, 2 Feb 2026 19:11:15 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Semyon Kolganov <semenak94@mail.ru>
Message-ID: <aYDn4S9dsgkDqWjb@windsurf>
References: <20251026090221.699214-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251026090221.699214-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770055877; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=3VwNz1SqmN8J4HKwn61HKUkp9Ct+Xi2Lz9CSaflUHMU=;
 b=D6OVbMWto1XbqeXT4wuwiBXAJWHlSA9s/6vOwOPcK4C3SCx/p2yxmYt12cH41k+YVHiyRa
 PfAb6UaXiUDIeUqgUXCH67fmReNIAzd4FqBFAg4g2paZPcqmemCoWIwIAslF2OgTSdzc+U
 py2ST6Up8mXYeCwmPp3XuhMzBZnZcm5GuESIjeUpla0b7T5R3UTtbaBgBbJ+kADFB2QtrW
 7rC5Rv71gUEi3LbuYcwXhYAqXUzuCKnyijaaOOAlrqRYT5WCHDcBk4K9GlOo70tejks3b8
 WrhcPjTHff0x9LayQM0wpehstauwsAP7a2jZMeWmifMJniOc/M++/bf2AV5T9w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=D6OVbMWt
Subject: Re: [Buildroot] [PATCH 1/1] package/mpir: fix build errors
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

Hello,

On Sun, Oct 26, 2025 at 10:02:21AM +0100, Bernd Kuhls wrote:
> Added upstream patch to fix configure with gcc-14.

This should have been one commit.

> Updated project URL and _SITE due to previous site not being available
> anymore: https://github.com/wbhart/mpir/pull/298

And this should have been another commit, as it's unrelated.

So I've split into two commits.

> The github helper could not be used, for details see
> https://patchwork.ozlabs.org/project/buildroot/patch/20250203-repair_mpir-v1-1-db848d68b586@bootlin.com/
> In contrast this commit does not bump the package version.

This is not what the comment was saying, and in fact using the github
helper works just fine, so I've used that. The trick is that the old
tarball was .tar.bz2 while the new one from github is .tar.gz, so
there is no conflict.

> +# mpir tries to build/install .info doc even if makeinfo isn't installed
> +# on the host, so we have to disable global doc installation to prevent
> +# autobuild errors.
> +define MPIR_DISABLE_DOC_INSTALL
> +	$(SED) 's/SUBDIRS += mpn fft mpz mpq mpf printf scanf cxx tune doc/SUBDIRS += mpn fft mpz mpq mpf printf scanf cxx tune/' \
> +		$(@D)/Makefile.am
> +endef
> +MPIR_POST_PATCH_HOOKS += MPIR_DISABLE_DOC_INSTALL

This was quite complicated, so I simplified to:

+# We don't care about the documentation
+MPIR_CONF_ENV = MAKEINFO=true

which is the approach we use in a number of packages already when
makeinfo gets annoying.

So, applied your change after splitting into two commits, and doing
various improvements along the way.

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
