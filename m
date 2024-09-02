Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57FCCA0ED3
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 16:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6363640187;
	Mon,  2 Sep 2024 16:23:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ESD3_gRiZY20; Mon,  2 Sep 2024 16:23:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C93E940253
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C93E940253;
	Mon,  2 Sep 2024 16:23:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B177F1BF3FD
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 16:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB1C3402B7
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 16:23:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H-ZataKw7Wq2 for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 16:23:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 28D28402A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28D28402A1
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 28D28402A1
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 16:23:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 422A113F879;
 Mon,  2 Sep 2024 18:23:49 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 02 Sep 2024 18:23:49 +0200
Date: Mon, 2 Sep 2024 18:23:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <ZtXmlczpG3mqy3im@landeda>
References: <20240901063634.3504315-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240901063634.3504315-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725294232;
 bh=ICGe9LHppEJDQ3o2kHac8yOX8pk7UNf2cOoUaczE5hs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RxvU1sjWcvc58nL9Eif3fvTo2ISnD5BWG1r0hwqxlCe5FHZZFVl5WSmnJN++pApeM
 n142pK9EOSzMoUM1ZDt/0BG88s1TLjgiORNWhHQTg7q+qFgf2si/oclthUgunOxayy
 BzCeDczWmEkym+JKEySgW4mD+weDwIAyZmfMlb4R80M09uzS945VejZcDZQmq1K4F2
 FwwpMv9BgvjJhq9EJVOnjz2IbFmjF8GINKqDJxTQnMDfPWrQno7UTxf0NHsTuTo3hp
 6I/ARro2VUD66l6DXHCiU+PHmn1bZJKYRbG7tg7zpDNnEygkiPqx1v3B2Er/UmuWCB
 gSjmYJA0jhiFw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RxvU1sjW
Subject: Re: [Buildroot] [PATCH v3 1/2] package/babeld: update URL site
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
Cc: linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2024-09-01 08:36 +0200, Dario Binacchi spake thusly:
> As reported in [1], version 1.9.2 has been moved to another archive, and
> it is recommended to use https://github.com/jech/babeld as the official
> repository.
> 
> It was also necessary to change the sha of the downloaded tar.gz.

That is not going to be possible.

Indeed, we already have a tarball cached for babeld-1.9.2, and of course
it is the old one, so it has the old hash. Also, people will already
have a local archive of babeld, also with the old hash.

If we were to update the hash, then newer version of Buildroot could not
use the file cached on s.b.o, and people with a local cache will also
have an issue, especially those that do maintenance between various
branches, some with older Buildroots, other with newer ones.

In that situation, we need to find a way so that the new archive has a
different name. There are a few options:

  - use a git hash rather than a version
  - use a trick in the version string
  - change the download mechanism

The first option is not nice, because then we lose the possibility to
have follow releases from release-monitoring.org

The second option is also not very nice, because that also breaks
release-monitoring.org, but would otherwise look like:

    # When bumping the version, move the babeld- prefix into the github macro call
    BABELD_VERSION = babeld-1.9.2
    BABELD_SITE = $(call github,jech,babeld,$(BABELD_VERSION))

But since we are trying to move away from the github macro (long term
goal), I'd even suggest we directly switch to using the git download
method:

    BABELD_VERSION = 1.9.2
    BABELD_SITE = https://github.com/jech/babeld
    BABELD_SITE_METHOD = git

which would mean the archive filename would change:

    sha256 XX...XX babeld-1.9.2-git4.tar.gz

(yes, I know I suggested having the babeld- prefix in the github nacro
call, but I just forgot about the implications with the hash, sorry.)

Regards,
Yann E. MORIN.

> Fixes:
> - http://autobuild.buildroot.org/results/2447060c86acf1bd8d6ee0bcf8f9b6adcdfc50c9
> 
> [1] https://alioth-lists.debian.net/pipermail/babel-users/2024-August/004187.html
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> Changes v2 -> v3:
>   - Fix the way the github macro is called.
> 
> Changes v1 -> v2:
>   - Don't bump to 1.10.0 but update the URL site.
> 
>  package/babeld/babeld.hash | 2 +-
>  package/babeld/babeld.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/babeld/babeld.hash b/package/babeld/babeld.hash
> index 2e0513efa010..e725b1fe310c 100644
> --- a/package/babeld/babeld.hash
> +++ b/package/babeld/babeld.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  154f00e0a8bf35d6ea9028886c3dc5c3c342dd1a367df55ef29a547b75867f07  babeld-1.9.2.tar.gz
> +sha256  c8c8c3698afb00caa5a5c9bbbb0a22b56d79ad3f9775382915ba979ac88c4e8f  babeld-1.9.2.tar.gz
>  sha256  b415c41292cedef6c97b243609e50552887c29343566c639f23282d31efd2afd  LICENCE
> diff --git a/package/babeld/babeld.mk b/package/babeld/babeld.mk
> index 785fa2bce9f1..3f9a944ed063 100644
> --- a/package/babeld/babeld.mk
> +++ b/package/babeld/babeld.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  BABELD_VERSION = 1.9.2
> -BABELD_SITE = http://www.pps.univ-paris-diderot.fr/~jch/software/files
> +BABELD_SITE = $(call github,jech,babeld,babeld-$(BABELD_VERSION))
>  BABELD_LICENSE = MIT
>  BABELD_LICENSE_FILES = LICENCE
>  
> -- 
> 2.43.0
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
