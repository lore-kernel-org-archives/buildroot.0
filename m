Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0250FD0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D152841071;
	Wed,  7 Jan 2026 17:55:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rvS-TvRJrUe1; Wed,  7 Jan 2026 17:55:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E85CC41073
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808541;
	bh=FB329a9x/mLSs+B3NR+lfuYa0zDca8I9T7YEkt0B1gk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WzbJoYAejxExtvqeV6O2+PdSA9sXVWz5DOC+RfKgFNp3jkQk+l545/2PvccGlw31B
	 EIi0mhDfZGfeImL3Qfr8XtlaczqJ5tHvn/qDaPYoi87SrzgYqloFE7xJiJ4XANZsEu
	 iU478AtStdfvNlrQob9Vj8P6jnSmzs0FMJ2w4EZbJHLt9J7E2S6+/QCwmRtv4MvxnR
	 WI+12b/5mtkGUkAckhKLl85464zC9T6dkGDimMl3g+SgoJCtw3xulCrfSFtAE9TDB+
	 csArJBf1WziK8cocPIwZJaEyeTQnAGy78JJ1Fx5TD8s3/dP5dJsNxDyu5ujNVZcRF+
	 VBtZL9h2LKCgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E85CC41073;
	Wed,  7 Jan 2026 17:55:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F298A25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E42DC60667
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cfnyhc3DH-je for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:55:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DD71060661
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD71060661
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD71060661
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 026AFB97A704; Wed,  7 Jan 2026 18:55:36 +0100 (CET)
To: yegorslists@googlemail.com
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:55:35 +0100
Message-ID: <20260107175535.230136-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215104452.480722-1-yegorslists@googlemail.com>
References: <20251215104452.480722-1-yegorslists@googlemail.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808537; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=v264fR6GOyeE/GFyaA7lyeo9NU1rm3vvxDG89FmbWBU=;
 b=VlMrLbcrn/EZ7re2AN6sGPFjzNXiGHgCRwRGYBm0q6HXAdi7qzrCY5Apyirw8nvOPaL3su
 HM0NIayJE/n3WlKXdqOL+/EDc6Brr/9qaK2uV7IqNQrYOsZrAWGaIxjn4M4GPy+i6jsA/B
 iuzL+uXd/YWv7QQzi63ReiE/uiIwpj/llMVROPp8AIhmETB/3eoADcAF9l0uKgO5zb4bnR
 kmulrEfE0PHt1D7LXEitsPypFhev6B+bLWwKiPy3siz9uYlpPGgAH9SUGjIxbcJK9Mh3LK
 /E43QXE6KW753mJYobek4aICfv/CNYclOaxiH4qZ0kBMeoobLGmOYRpgRUdtqw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=VlMrLbcr
Subject: Re: [Buildroot] [PATCH] package/libconfig: bump to version 1.8.2
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> For change log, see:
> 
> https://github.com/hyperrealm/libconfig/releases/tag/v1.8.2
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2025.11.x. Thanks

> ---
>  package/libconfig/libconfig.hash | 2 +-
>  package/libconfig/libconfig.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libconfig/libconfig.hash b/package/libconfig/libconfig.hash
> index 2b10dfc125..22f8473fc4 100644
> --- a/package/libconfig/libconfig.hash
> +++ b/package/libconfig/libconfig.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  87c6f382994b245f9213be34a2bf19c8ee7d033d7abaa51e88fbb7bad79e2dc6  libconfig-1.8.1.tar.gz
> +sha256  e59ffb902dd5731d5d4e4fb81d3b989697615feab72dfd7c30618167b91a42ee  libconfig-1.8.2.tar.gz
>  sha256  cbbad55f94feadb16061c4f782910bac254460a44f1c8abd2b91452eff085f55  COPYING.LIB
> diff --git a/package/libconfig/libconfig.mk b/package/libconfig/libconfig.mk
> index 3fa2be3563..8bd494081c 100644
> --- a/package/libconfig/libconfig.mk
> +++ b/package/libconfig/libconfig.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBCONFIG_VERSION = 1.8.1
> +LIBCONFIG_VERSION = 1.8.2
>  LIBCONFIG_SITE = https://hyperrealm.github.io/libconfig/dist
>  LIBCONFIG_LICENSE = LGPL-2.1+
>  LIBCONFIG_LICENSE_FILES = COPYING.LIB
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
