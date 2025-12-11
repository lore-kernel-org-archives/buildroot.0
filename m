Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CE8D43342
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C851940789;
	Thu, 11 Dec 2025 19:30:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cxwsj-4aPBql; Thu, 11 Dec 2025 19:30:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D771140532
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481451;
	bh=JaxyohUoY/kaqxek+tLE8Vmp0S7iwtjcpxAwed1X78g=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CcsYy8WM9oL/Bk0MgJqkClij1HPcx6ZxEDdK+epOlr/BbTd10MkhT3/AIyjeaPzoW
	 CrgsVsEAxhbiJwNW9m/k2uzMJSYhGOEhpROS95qEgm8fpW6tawG6b/TetK7wAQ0e7I
	 sgxUVxoN3YfNGNvrcYAwgsdL6emYODSp/7aMAxkRILWC9uhHwY/Ysf4qjwz4Kc1TUy
	 RzWoKJkkVV2jwaQgtkOuz3/e4fghs9xwQMISA9WiF0DQVoXS62HaDp0cZmQ78B3qQT
	 pd5R/fg1j4eFpaaujKKYnvBIsYb1g3VxPCag+NVJ9FEUFlt/KgF8JnEoXRRYkR06V8
	 Wox4zJXYLt3OA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D771140532;
	Thu, 11 Dec 2025 19:30:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CC4FBE7
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BDBFF4113E
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:30:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eoF9aXiJRhkL for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:30:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A470840789
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A470840789
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A470840789
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:30:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9F894B97A098; Thu, 11 Dec 2025 20:30:46 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:30:45 +0100
Message-ID: <20251211193045.1099200-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251205183502.1740567-1-bernd@kuhls.net>
References: <20251205183502.1740567-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1765481446; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=eZd6Tme4UtWsPeNoLFi0eRrGro8pZcjgipdP9yL2rD8=;
 b=Sy4Xik3VqlZDlu66XlbmWe6u9p/q4ah3u1uC9BGA4aE/mT0QcgGoOvO08x7V9fCanZslA3
 0qY0bqDYXX1O7T3pqK/WQ65jgQUlfaXd+FkgcFcBTJL+UUbC1b3N4LJ/dzcf1A0eEsS5jW
 METHpSv3IHSIc1Fz0VAG3H3gxw/NAT1b17czVYYevEBRC/jgYjGLq7pQFxGmk/Wlsj2ANl
 neQK/jIyiRbE1N3Oj95bpW9PKas4hlTkn0P+yVBoomn2QthgfgKKdhp4Zrb77xz2pSZB11
 1qNVOmitW+gdCm6EOEBgMcCgfO2Yq5ff6YhHc5dfSRZqamBM6gXaXIoXTLqM/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=Sy4Xik3V
Subject: Re: [Buildroot] [PATCH 1/1] package/lugaru: switch to github
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
> Old site returns 404 for the tarball and does not contain any repos:
> https://bitbucket.org/osslugaru/workspace/repositories/
> 
> Switch _SITE to URL shown at https://osslugaru.gitlab.io/
> 
> The hash value of the tarball is unchanged.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.08.x. Thanks

> ---
>  package/lugaru/lugaru.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/lugaru/lugaru.mk b/package/lugaru/lugaru.mk
> index 53797f405e..57ec9fef3a 100644
> --- a/package/lugaru/lugaru.mk
> +++ b/package/lugaru/lugaru.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  LUGARU_VERSION = 1.2
> -LUGARU_SITE = https://bitbucket.org/osslugaru/lugaru/downloads
> +LUGARU_SITE = https://github.com/osslugaru/lugaru/releases/download/$(LUGARU_VERSION)
>  LUGARU_SOURCE = lugaru-$(LUGARU_VERSION).tar.xz
>  
>  LUGARU_LICENSE = GPL-2.0+, CC-BY-SA-3.0 (Wolfire and Slib assets), \
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
