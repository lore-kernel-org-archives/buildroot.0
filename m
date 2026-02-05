Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A01AECD992
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 18:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 205958420D;
	Thu,  5 Feb 2026 18:27:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PRtY2xb_NG5Z; Thu,  5 Feb 2026 18:27:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C4C4841FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770316021;
	bh=0ZbD1DLMhh6C3TZgmpbENaNBCnjXgS+CCumPeyQJywE=;
	h=In-Reply-To:References:From:Cc:To:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b/d3Oh99uuK+srC0Goh4OAma3We4XlkbjVxyx6r/+JGrWuGgU3uSr0AoOARrtXPOK
	 45YegMH3dO+nf64A/fGXuYCoJ+glVTEXsmlX9UD+YMtP2SMadv2eGF0wcEDjXwJBwL
	 i4xovT2mFT8oaoDcBlsk0BjF8+rT6gQT4gQIpsXlQkfgQ7UGIgehf1OBQ1h/n7fAPB
	 8cLHPO7OL7fID9GUxZCKcjQKSmAZt5K3PRKq7H9S1y6xFagxXEXClxEZxlSljcBLUZ
	 YH73oDsvznJWtVDoLmz+BUVWoTV1aN8LQxKPN3FGKGTI601XlHZ01wckO0QJfH7T+r
	 A98weY9BmqA2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C4C4841FE;
	Thu,  5 Feb 2026 18:27:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7ACA817A
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 18:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CA1640CB5
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 18:27:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Cp1IsGrM-wq for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 18:26:59 +0000 (UTC)
X-Greylist: delayed 570 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 05 Feb 2026 18:26:59 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4D4E640CA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D4E640CA0
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.167.242.64;
 helo=perceval.ideasonboard.com; envelope-from=kieran.bingham@ideasonboard.com;
 receiver=<UNKNOWN> 
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D4E640CA0
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 18:26:59 +0000 (UTC)
Received: from monstersaurus.ideasonboard.com
 (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A15FD0;
 Thu,  5 Feb 2026 19:16:43 +0100 (CET)
MIME-Version: 1.0
In-Reply-To: <20260205173532.3968214-1-pyk@foss.peewhy.fr>
References: <20260205173532.3968214-1-pyk@foss.peewhy.fr>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Pierre-Yves Kerbrat <pyk@foss.peewhy.fr>
To: Pierre-Yves Kerbrat <pyk@foss.peewhy.fr>, buildroot@buildroot.org
Date: Thu, 05 Feb 2026 18:17:23 +0000
Message-ID: <177031544343.1808100.14900639584677652013@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1770315403;
 bh=9wqhYQw0pu+Gvey1Vzub/s53hGcmdUSB45USWvSPqdc=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=ACXyZSwFQIfhrR9io+GfaAeSXr9ZWePnqgY+SyqWTdVYN8Pv2dSPL8gJIh/a0Obrn
 Ji7S7BzgBjV0ehMe//v/oJ5R7BzuOSxTzdsq424MGd2GyLoxm+Z+fJ7m/oh4HCQcPN
 hVT6Z37yHD4Umwq0QtZVga/arWbPkJr+wX/4VOcg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=ideasonboard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=ACXyZSwF
Subject: Re: [Buildroot] [PATCH] package/libcamera: bump to v0.7.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quoting Pierre-Yves Kerbrat (2026-02-05 17:35:32)
> Changelog:
> https://git.linuxtv.org/libcamera.git/tag/?h=v0.7.0
> 
> Add missing licenses hash:
> - LICENSES/Apache-2.0.txt
> Added with: https://git.linuxtv.org/libcamera.git/commit/LICENSES/Apache-2.0.txt?id=ce02faa088dd3128a097b0f7ac6ce4e507e89f98
> - LICENSES/CC-BY-4.0.txt
> Added with: https://git.linuxtv.org/libcamera.git/commit/LICENSES/CC-BY-4.0.txt?id=b4e31a88d304e09e200af9d1e00760074cc854c2


Looks like they've been missing for a while!

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> 
> Signed-off-by: Pierre-Yves Kerbrat <pyk@foss.peewhy.fr>
> ---
>  package/libcamera/libcamera.hash | 4 +++-
>  package/libcamera/libcamera.mk   | 2 +-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
> index 4e79be844e60..bddff77cda21 100644
> --- a/package/libcamera/libcamera.hash
> +++ b/package/libcamera/libcamera.hash
> @@ -1,10 +1,12 @@
>  # Locally computed
> -sha256  85d85409d6e04bcf2e1ed57d9b59ebcc9fb770e5d39690d7ac233e9784835b89  libcamera-v0.6.0-git4.tar.gz
> +sha256  9e684bfcb8679e5e7ec7fb0da9dec68e71f0b75a6b0c8edcd892b26a92726a92  libcamera-v0.7.0-git4.tar.gz
>  
>  # license files
> +sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSES/Apache-2.0.txt
>  sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
>  sha256  e11af671c491efac2f94c1d752bea92f4308ca2450c7d11e582e4b48c40e4de1  LICENSES/BSD-3-Clause.txt
>  sha256  6a573fb2f9082662978cf21fb153096df0a1981deaea7dbc10a11046fe005d9f  LICENSES/CC0-1.0.txt
> +sha256  d557539df68e771cc1eedcc91d13f70fca930e508d11eedcafa4b15db49e3744  LICENSES/CC-BY-4.0.txt
>  sha256  ec3732087acf8c52429a020d6bba362ff578705bdb53365a21744485ec15b0e6  LICENSES/CC-BY-SA-4.0.txt
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
>  sha256  606aa26338f69ce178f1cbc648b7574aec4b5bbaeb20f4df36ff49010cb8fbbd  LICENSES/GPL-2.0-or-later.txt
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index e86e05328c1c..17908e3c1c6f 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
> -LIBCAMERA_VERSION = v0.6.0
> +LIBCAMERA_VERSION = v0.7.0
>  LIBCAMERA_SITE_METHOD = git
>  LIBCAMERA_DEPENDENCIES = \
>         host-openssl \
> -- 
> 2.51.0
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
