Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BCAC25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 20:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1581606BB;
	Mon,  3 Jun 2024 20:47:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ecCzNnqHok-D; Mon,  3 Jun 2024 20:47:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D118D60B65
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D118D60B65;
	Mon,  3 Jun 2024 20:47:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E01D31BF2B6
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 20:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D73E840179
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 20:47:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5z7GKTHBr2Dc for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 20:46:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8F47A4011B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F47A4011B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F47A4011B
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 20:46:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 397CE13F88E;
 Mon,  3 Jun 2024 22:46:55 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 03 Jun 2024 22:46:54 +0200
Date: Mon, 3 Jun 2024 22:46:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <Zl4rvlgxhcew9r6_@landeda>
References: <20240602204139.2508623-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240602204139.2508623-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717447617;
 bh=bd3dw/IPxpEFZAgYKptFw+fckT6JcGHN+bhvis2R3k8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jZvTZHpHAn9oo91+SA8046VPJ5jfqxP7Y+2n26KQLgPr4aTr20UGqWlbzjHEaOh47
 RaJOieegi1JyhMJyDw9fgSCGinbT1Hd9IeB8SelmbivkKezz/MFWlU2dgBzvleOHWE
 Pw/mavk1ZGeSJt9P8v7xwwfKXrNzl9RRthHlMZ5iQua/gUqHyjdGRa0eCmNpAp/+Bj
 VTSydYeYj5BQtffGgQC5uxO4iGAjX/bUrhZsRj9PxjVGC6NVMH+8hVjFPXjH4nW1Qu
 pZ1I/cnmGHfrE4hkh4+2MleBHi9H//SAyQeovUtee5OUCvVBo1Q/JHpcsRVjDYj6lT
 b2RU2DyVilzJw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jZvTZHpH
Subject: Re: [Buildroot] [PATCH v2 1/1] package/vala: bump to version 0.56.17
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2024-06-02 14:41 -0600, James Hilliard spake thusly:
> Set GI_GIRDIR env variable which is now required for configure
> to function.
> 
> Details:
> https://gitlab.gnome.org/GNOME/vala/-/commit/a9d38070ce86d7994b949f7cb426fbf670a953d8
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2:
>   - set GI_GIRDIR in env instead of depending on host-GOI
> ---
>  package/vala/vala.hash |  4 ++--
>  package/vala/vala.mk   | 11 ++++++++---
>  2 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/package/vala/vala.hash b/package/vala/vala.hash
> index b3716f0854..a16875ac6a 100644
> --- a/package/vala/vala.hash
> +++ b/package/vala/vala.hash
> @@ -1,4 +1,4 @@
> -# From https://download.gnome.org/sources/vala/0.56/vala-0.56.14.sha256sum
> -sha256  9382c268ca9bdc02aaedc8152a9818bf3935273041f629c56de410e360a3f557  vala-0.56.14.tar.xz
> +# From https://download.gnome.org/sources/vala/0.56/vala-0.56.17.sha256sum
> +sha256  26100c4e4ef0049c619275f140d97cf565883d00c7543c82bcce5a426934ed6a  vala-0.56.17.tar.xz
>  # Locally computed
>  sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
> diff --git a/package/vala/vala.mk b/package/vala/vala.mk
> index 415d996faa..a1c27240ac 100644
> --- a/package/vala/vala.mk
> +++ b/package/vala/vala.mk
> @@ -5,17 +5,22 @@
>  ################################################################################
>  
>  VALA_VERSION_MAJOR = 0.56
> -VALA_VERSION = $(VALA_VERSION_MAJOR).14
> +VALA_VERSION = $(VALA_VERSION_MAJOR).17
>  VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
>  VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
>  VALA_LICENSE = LGPL-2.1+
>  VALA_LICENSE_FILES = COPYING
>  VALA_CPE_ID_VENDOR = gnome
>  
> -HOST_VALA_DEPENDENCIES = host-bison host-flex host-libglib2
> +HOST_VALA_DEPENDENCIES = \
> +	host-bison \
> +	host-flex \
> +	host-libglib2

Although I do prefer when multi-entries are multi-lines, this change is
gratuitous in this commit, so I dropped it (arguable, but that's pushed
now).

Applied to next, thanks.

Regards,
Yann E. MORIN.

>  # Yes, the autoconf script understands ':' as "xsltproc is not
>  # available".
> -HOST_VALA_CONF_ENV = ac_cv_path_XSLTPROC=:
> +HOST_VALA_CONF_ENV = \
> +	ac_cv_path_XSLTPROC=: \
> +	GI_GIRDIR="$(STAGING_DIR)/usr/share/gir-1.0"
>  HOST_VALA_CONF_OPTS += --disable-valadoc
>  
>  # We wrap vala, valac and vapigen to point to the proper gir and vapi data dirs
> -- 
> 2.34.1
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
