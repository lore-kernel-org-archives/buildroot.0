Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB39C27C44
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 20:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B98BB846E3;
	Sat,  1 Jun 2024 20:03:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iF8KuyppKF2r; Sat,  1 Jun 2024 20:03:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B832D847A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B832D847A7;
	Sat,  1 Jun 2024 20:03:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 009011BF2C2
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 20:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED16E41802
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 20:03:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aLk5kAz_srJO for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 20:03:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B4AC54179F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4AC54179F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B4AC54179F
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 20:03:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0D53813F8B9;
 Sat,  1 Jun 2024 22:03:18 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jun 2024 22:03:17 +0200
Date: Sat, 1 Jun 2024 22:03:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <Zlt-hVkDH0Aq3G-X@landeda>
References: <20240531202219.2486947-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240531202219.2486947-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717272200;
 bh=txCISRnUF3TDoeS5/FL0eOtnPQ6xygSDU2EYT3D2iQ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j5BbauzvWMEt5CtDryr8i6cFMBQUNfhbrSsXD2EBPud9veIi1Ln67Xl0AruclvSIf
 AYsaHDpWo8TftT/RAhODKRjOBWKqJkNKMDyDw7gNrmCrtbD0+QnF7DVvdev8xq0ZCf
 sDnbVo3zKmyW3mjLRrd4tAQZ0kCCG76FwDBVAe/f0XR/2Jz6BvNJEH8oZrB3KDkT7R
 ZHkjfZI3kHIJwLl7P2VObf9WdZNAllbTFmS3Agbi19iVneE2N0dZWRePm/8YSM4GMz
 bwEnNbCvY47SH5s36h6yB4zeHE84tBHRh4sVtJe/T4is1SzBZ79UiPBAH2r4luXhZf
 NYg0CzVvWC9Ww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=j5Bbauzv
Subject: Re: [Buildroot] [PATCH 1/1] package/vala: bump to version 0.56.17
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

On 2024-05-31 14:22 -0600, James Hilliard spake thusly:
> Add new host-gobject-introspection dependency.

I can easily see that new dependency in the diff; saying so in the
commit log is not so usefull but to explain why it is now needed:
explain, don't describe.

So, why is this minor version bump now requiring host-GOI?

Regards,
Yann E. MORIN.

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/vala/vala.hash | 4 ++--
>  package/vala/vala.mk   | 8 ++++++--
>  2 files changed, 8 insertions(+), 4 deletions(-)
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
> index 415d996faa..7aebd4f395 100644
> --- a/package/vala/vala.mk
> +++ b/package/vala/vala.mk
> @@ -5,14 +5,18 @@
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
> +	host-gobject-introspection \
> +	host-libglib2
>  # Yes, the autoconf script understands ':' as "xsltproc is not
>  # available".
>  HOST_VALA_CONF_ENV = ac_cv_path_XSLTPROC=:
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
