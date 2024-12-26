Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CE3E77188
	for <buildroot@archiver.kernel.org>; Thu, 26 Dec 2024 23:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7BE780DBE;
	Thu, 26 Dec 2024 23:00:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fzLLxMOf9vau; Thu, 26 Dec 2024 23:00:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2A1780DB4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2A1780DB4;
	Thu, 26 Dec 2024 23:00:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 05CC1F1B
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 23:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB0DD80DB4
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 23:00:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pVHaV8InZnKV for <buildroot@buildroot.org>;
 Thu, 26 Dec 2024 23:00:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E9F6B80DB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9F6B80DB2
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E9F6B80DB2
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 23:00:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id D0DF8B0055A;
 Fri, 27 Dec 2024 00:00:00 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:41214])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Dec 2024 00:00:00 +0100
MIME-Version: 1.0
Date: Fri, 27 Dec 2024 00:00:00 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241226221446.2644580-1-thomas.petazzoni@bootlin.com>
References: <20241226221446.2644580-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <084557691e0cc0369efd57876b79df71@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735254001;
 bh=Qr8P4YtaHabBosXt25dwXyFwPZ8IZQ+E01W0zt9J+oQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bZ9hiErEWQoW8Q9F7gRG5g4Dbqh4n+4sqkNzRCJYlAqxzUetqvgxPm1+F3fTfth+r
 jgrJA0UPA5JxgJk/w9OQJqr09Pdn8f88VuB5AUfwq8QRuEfFflGUe7Twd0FFFy4LH3
 jIcMcdA/mb+PJcpAlnPbgUK4LXO+mcqL+hzlfB01dtz6luH1s/LB+HfeIB0vgm/W2G
 WXPZs4qsi9eIBchrAtYxzOQ2S1bmzyv87S+H/d52A4Sm/Yho3zrxEcOlf8ryt7cGz6
 PWnFu2j+o3I4ehs6N0hkc7XvcLAYgr63u5fxwfHy64krrIZcIL+bgHyBPMz1ljCxkt
 HVpzZ7x9W78Xg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bZ9hiErE
Subject: Re: [Buildroot] [PATCH] package/flashrom: bump to version 1.5.1
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

On 26/12/2024 23:14, Thomas Petazzoni via buildroot wrote:
> Changes in 1.5.0 and 1.5.1 are described at:
> https://www.flashrom.org/release_notes/v_1_5.html
> 
> The option classic_cli_print_wiki has been removed in upstream commit
> 87134f538dd9b69fa1331514f7b492e92f8bd66d ("tree: Remove
> print_wiki.c"). It was used to generate some parts of the Wiki, and
> was anyway not used by Buildroot as it was disabled.
> 
> The build was tested including with fwupd, which is the one reverse
> dependency of flashrom in Buildroot.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

> ---
>  package/flashrom/flashrom.hash | 2 +-
>  package/flashrom/flashrom.mk   | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/package/flashrom/flashrom.hash 
> b/package/flashrom/flashrom.hash
> index 17ebdee3af..0e1faf34e7 100644
> --- a/package/flashrom/flashrom.hash
> +++ b/package/flashrom/flashrom.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  
> b77ce458b3b874387270a71805e899ac63f057d7553dc320da7e4c58e750577c  
> flashrom-1.4.0.tar.gz
> +sha256  
> 3f4dc7878e962e165b7eba73104d4e61231f9d4e838eb47df6ca3d87060a2aa5  
> flashrom-1.5.1.tar.gz
>  sha256  
> ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  
> COPYING
> diff --git a/package/flashrom/flashrom.mk 
> b/package/flashrom/flashrom.mk
> index 4eede48e03..f253c5f9d8 100644
> --- a/package/flashrom/flashrom.mk
> +++ b/package/flashrom/flashrom.mk
> @@ -4,14 +4,13 @@
>  #
>  
> ################################################################################
> 
> -FLASHROM_VERSION = 1.4.0
> +FLASHROM_VERSION = 1.5.1
>  FLASHROM_SITE = $(call github,flashrom,flashrom,v$(FLASHROM_VERSION))
>  FLASHROM_LICENSE = GPL-2.0+
>  FLASHROM_LICENSE_FILES = COPYING
>  FLASHROM_INSTALL_STAGING = YES
>  FLASHROM_CONF_OPTS = \
>  	-Dclassic_cli=enabled \
> -	-Dclassic_cli_print_wiki=disabled \
>  	-Dich_descriptors_tool=enabled \
>  	-Dtests=disabled \
>  	-Duse_internal_dmi=true \
> --
> 2.47.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
