Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1571D7360E
	for <buildroot@archiver.kernel.org>; Sat, 30 Nov 2024 22:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8509600CC;
	Sat, 30 Nov 2024 22:26:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DinLqFEEjze0; Sat, 30 Nov 2024 22:26:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9F866148A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9F866148A;
	Sat, 30 Nov 2024 22:26:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2003860
 for <buildroot@buildroot.org>; Sat, 30 Nov 2024 22:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E17D408D6
 for <buildroot@buildroot.org>; Sat, 30 Nov 2024 22:26:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3CSrXw3jEGpj for <buildroot@buildroot.org>;
 Sat, 30 Nov 2024 22:26:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9F6FC408BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F6FC408BB
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F6FC408BB
 for <buildroot@buildroot.org>; Sat, 30 Nov 2024 22:26:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id AE68A13F88D;
 Sat, 30 Nov 2024 23:26:39 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:50274])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 30 Nov 2024 23:26:39 +0100
MIME-Version: 1.0
Date: Sat, 30 Nov 2024 23:26:39 +0100
From: Julien Olivain <ju.o@free.fr>
To: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20241129165656.184507-1-zgyarmati@zgyarmati.de>
References: <20241129165656.184507-1-zgyarmati@zgyarmati.de>
User-Agent: Webmail Free/1.6.9
Message-ID: <e33675510bbca48e984897f47fefc268@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733005600;
 bh=hCRjcWshVTyiMIDdwtDTJUcOCdmR4S43ciK9IsnZyNI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WuAD1sCBvg3RbFXHyNs5rkGUCapNnVWwtKlxs33PIycFEd9xW1KJvsIduWAp67+0f
 qp5kIYAf1gIfcDka5dbqPOO1LNvnsMK0j/4lAPS+uo+uTWHTwUQK+LT5eMSd5Pe0w7
 H8lQVcEhKMqohU876OqwIsZNkIevBvN2yzLG4tCHNZHdUpEwD9NoElaRN2M6vhovcX
 x03ur5hojOSLq0+dqoRlSs6pvEeuBFeFAh8kzXyW48Pwhoc6yypwNamlFSjQE9jA/i
 kR6SId4ewBdHFWvr5v+heibFAH801U21zk+kpNrv3fxf9hRwbnINo8t8JVDZLlWe3j
 7FWXTgCXK86EQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=WuAD1sCB
Subject: Re: [Buildroot] [PATCH 1/1] package/simple-mail: version bump 3.1.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 29/11/2024 17:56, Zoltan Gyarmati wrote:
> Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>

Applied to next, thanks.

> ---
>  package/simple-mail/simple-mail.hash | 2 +-
>  package/simple-mail/simple-mail.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/simple-mail/simple-mail.hash 
> b/package/simple-mail/simple-mail.hash
> index 4de1525b53..ba4d36c2b3 100644
> --- a/package/simple-mail/simple-mail.hash
> +++ b/package/simple-mail/simple-mail.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256  
> f93e93843d11da5c4ec44225eba46ccb3e9710fd594a27b966901745429ed4f4  
> simple-mail-3.0.0.tar.gz
> +sha256  
> d4a46b5c3f706669ffb3c9e4d2ff5e2bd892eda639f80784d862fa94a2082eb2  
> simple-mail-3.1.0.tar.gz
> 
>  # Hash for license file
>  sha256  
> 592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  
> LICENSE
> diff --git a/package/simple-mail/simple-mail.mk 
> b/package/simple-mail/simple-mail.mk
> index 82bea45f21..7063e9dd0f 100644
> --- a/package/simple-mail/simple-mail.mk
> +++ b/package/simple-mail/simple-mail.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -SIMPLE_MAIL_VERSION = 3.0.0
> +SIMPLE_MAIL_VERSION = 3.1.0
>  SIMPLE_MAIL_SITE = $(call 
> github,cutelyst,simple-mail,v$(SIMPLE_MAIL_VERSION))
>  SIMPLE_MAIL_INSTALL_STAGING = YES
>  SIMPLE_MAIL_LICENSE = LGPL-2.1+
> --
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
