Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 326A4E7AD77
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 17:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC82E812C4;
	Fri, 26 Dec 2025 17:32:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U0iSn1wHpQmG; Fri, 26 Dec 2025 17:32:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 015E7812FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766770354;
	bh=LZmCWn54YZsNWVZeX5uwoXOBTxmwd/ZSiLG9Y6LczDY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hbhPbckOowNV8xhRbYVX6F+xF0PgrVRYMPyI0SwazlPgmT1qFoLxnFh4Uo6+3do15
	 B+3x4G2IusBUMOxQY6JV9p2enhTTRjfW1012AAMYBREkXtvAMO10TO6Q5ao1dp/Umb
	 w9zsuaTLUAV6nvP0bCzpbMiwQXRSYzIZ0SoPsenqqahaVnhytRIgyM6TxczTKdB82G
	 yGlZZD2AHaZJDgzt/WT7iL0HWQXszQ/e0KLDtc16tYp0YRhanm8OgKZ980HYkMK5xl
	 wAQ3Nx7heonC0UBKb47WA93CefrPJ4fzVsa3C5Hi9jpBBCNXVOYCxzFXmArQ8WYVDP
	 wfL4EpvkMgkcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 015E7812FE;
	Fri, 26 Dec 2025 17:32:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E2064EC
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 17:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2C9D812FE
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 17:32:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QHenvhH1diiz for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 17:32:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CBBA1812C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBBA1812C4
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CBBA1812C4
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 17:32:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 336621A2461
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 17:32:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E9085606E4;
 Fri, 26 Dec 2025 17:32:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 22EE911978029; Fri, 26 Dec 2025 18:32:26 +0100 (CET)
Date: Fri, 26 Dec 2025 18:32:20 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Antoine Tenart <atenart@kernel.org>, Marcus
 Folkesson <marcus.folkesson@gmail.com>, Julien Olivain <ju.o@free.fr>
Message-ID: <20251226183220.5ae9e99c@windsurf>
In-Reply-To: <20251217184822.3765937-1-bernd@kuhls.net>
References: <20251217184822.3765937-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766770348; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=dVgXJxqPdUKcELqtH7cd6OtitjKLpKvrWHgdXYXMhyc=;
 b=1OEob55A/TuTaTBXFhj7lGXk22goy1Rq4c2PGxzHuSDHsR/s6qv0y37qGodHEqW0osQw1g
 MoFB9U69QaTEo8zzSeX1VtzyTLQLDtzYcQaIbP+legAzIAuPrgNgATHxCM8weFXqq2T5Fb
 rm21epN1AOiSz6eOJSz21cKjAZv0ufKyUFJEq77o0g2pQe1FTDW4M0hTqlOZPOJkVdBD7B
 OwtF6Qdp5HgS4I8l/G6HKKEvZHDEsDqitmERqZQSjDThJfUMhNsKZG8EfTMjqHl2v4pb1p
 ODgOUSLGJoclkQ0DkdEovG8XmkBDGSLxhEulVBck8u33hEGDCDgcrg6p16p4QQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=1OEob55A
Subject: Re: [Buildroot] [PATCH 1/1] package/libselinux: host-python3 needs
 SSL support
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

On Wed, 17 Dec 2025 19:48:22 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

>   WARNING: pip is configured with locations that require TLS/SSL,
>    however the ssl module in Python is not available.
> [...]
>   Could not fetch URL https://pypi.org/simple/setuptools/:
>    There was a problem confirming the ssl certificate:
>    HTTPSConnectionPool(host='pypi.org', port=443): Max retries exceeded
>    with url: /simple/setuptools/ (Caused by SSLError("Can't connect to
>    HTTPS URL because the SSL module is not available.")) - skipping
>   ERROR: Could not find a version that satisfies the requirement setuptools>=40.8.0 (from versions: none)

This should be a very strong red flag. Why is the build process of
libselinux even trying to connect to the network to download stuff? It
definitely should not, as everything should be downloaded by Buildroot.
Packages are not allowed to download random stuff.

> +	select BR2_PACKAGE_HOST_PYTHON3_SSL if BR2_PACKAGE_PYTHON3

This doesn't work as it doesn't make sense: it is perfectly possible
for host-libselinux to be built, which will build host-python-pip,
without BR2_PACKAGE_PYTHON3=y.

See the build failures that continue to pop up:

  https://autobuild.buildroot.net/?reason=host-libselinux%

For example:

  https://autobuild.buildroot.net/results/0e9/0e9de0c0d8b6ec57eea9f8834f02076b296ba4f1/config

has:

  # BR2_PACKAGE_PYTHON3 is not set

So your patch has no effect to fix the issue.

The solution is clearly not to add SSL support in Python. The solution
is to make sure libselinux doesn't use pip to connect over the network.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
