Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3145C7EE23
	for <buildroot@archiver.kernel.org>; Tue, 23 May 2023 20:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 692C841D99;
	Tue, 23 May 2023 20:43:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 692C841D99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z2jh7Dyt7yYm; Tue, 23 May 2023 20:43:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B14441D8E;
	Tue, 23 May 2023 20:43:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B14441D8E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0DC3D1BF36E
 for <buildroot@lists.busybox.net>; Tue, 23 May 2023 20:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA93581D3D
 for <buildroot@lists.busybox.net>; Tue, 23 May 2023 20:43:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA93581D3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0HIt8uuty0gx for <buildroot@lists.busybox.net>;
 Tue, 23 May 2023 20:43:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 446AC81C6F
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 446AC81C6F
 for <buildroot@buildroot.org>; Tue, 23 May 2023 20:43:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:1b02:4e3:83be:ab2e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 100E819F4B5;
 Tue, 23 May 2023 22:43:36 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 23 May 2023 22:43:35 +0200
Date: Tue, 23 May 2023 22:43:35 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Colin Foster <colin.foster@in-advantage.com>
Message-ID: <20230523204335.GK621937@scaer>
References: <20230523172120.1948573-1-colin.foster@in-advantage.com>
 <20230523172120.1948573-2-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230523172120.1948573-2-colin.foster@in-advantage.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684874619;
 bh=xgvqrWp77XQtRjNzUgHiNhBS8o1xO8K5fq2yRdpf3N0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KaPh5PegFKPG34qhYUO6k66JVvknpF7/EiIGGwDqmhfdg+8+gp3LfIxFi/m+xAt6L
 XKQYZV/CULrQeJs+PBSybrjkI6RJ3Tgn8LloOdbP4ujNlgVcxB8qFZ3o2OPzEC/NsB
 6EH4RADxlTecLAMKeaFFCvIR9wUA03JF6sFSxWEuFME+c3PFyI2doJ5eYNMgWnM94F
 5r97WGotb/geUEnH7X4J0gC+qGRFzd0LdGxjxDg84P6rBDEAsQhMxfDXnFJUQIceo/
 vIFcw+yqXFUlTIK0S6bRJqqW/USZEQktZO3ZEBEyOie+zjkEf9nEJlieo9YzV27ygp
 3L7iW0QHt2rKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KaPh5Peg
Subject: Re: [Buildroot] [v1 1/2] package/bootpc: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Colin, All,

On 2023-05-23 10:21 -0700, Colin Foster spake thusly:
> Add the ability to select, build, and run bootpc - a client program for
> BOOTP requests.

Thanks for this new package.

Here is a purely mechanical review:

    $ ./utils/docker-run make check-package
    package/bootpc/0001-main-fix-build.patch:4: generate your patches with 'git format-patch -N'
    package/bootpc/0001-main-fix-build.patch:0: missing Signed-off-by in the header (http://nightly.buildroot.org/#_format_and_licensing_of_the_package_patches)
    package/bootpc/0001-main-fix-build.patch:0: missing Upstream in the header (http://nightly.buildroot.org/#_additional_patch_documentation)
    package/bootpc/0002-Makefile-remove-strip-from-the-build.patch:4: generate your patches with 'git format-patch -N'
    package/bootpc/0002-Makefile-remove-strip-from-the-build.patch:0: missing Signed-off-by in the header (http://nightly.buildroot.org/#_format_and_licensing_of_the_package_patches)
    package/bootpc/0002-Makefile-remove-strip-from-the-build.patch:0: missing Upstream in the header (http://nightly.buildroot.org/#_additional_patch_documentation)
    package/bootpc/Config.in:4: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
    package/bootpc/Config.in:5: empty line at end of file

Also, see below for a few additional comments...

> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> ---
>  package/Config.in                             |  1 +
>  package/bootpc/0001-main-fix-build.patch      | 37 +++++++++++++++++++
>  ...Makefile-remove-strip-from-the-build.patch | 28 ++++++++++++++
>  package/bootpc/Config.in                      |  5 +++
>  package/bootpc/bootpc.mk                      | 19 ++++++++++
>  5 files changed, 90 insertions(+)
>  create mode 100644 package/bootpc/0001-main-fix-build.patch
>  create mode 100644 package/bootpc/0002-Makefile-remove-strip-from-the-build.patch
>  create mode 100644 package/bootpc/Config.in
>  create mode 100644 package/bootpc/bootpc.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 420ebaa370..07de6500bf 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2273,6 +2273,7 @@ endif
>  	source "package/bmon/Config.in"
>  	source "package/bmx7/Config.in"
>  	source "package/boinc/Config.in"
> +    source "package/bootpc/Config.in"

Indentation with TAB, not spaces.

(not sure why this one did not get caught by check-package...)

[--SNIP--]
> diff --git a/package/bootpc/bootpc.mk b/package/bootpc/bootpc.mk
> new file mode 100644
> index 0000000000..d3c5ce5198
> --- /dev/null
> +++ b/package/bootpc/bootpc.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# bootpc package
> +#
> +################################################################################
> +
> +BOOTPC_VERSION = 80c0811dc69f9f3923661be4f9f9c09a44313f62
> +BOOTPC_SITE_METHOD = git
> +BOOTPC_SITE = https://salsa.debian.org/debian/bootpc.git

Nit-picking, but we usually put _SITE and _SITE_METHOD in that order:

    BOOTPC_SITE = https://salsa.debian.org/debian/bootpc.git
    BOOTPC_SITE_METHOD = git

You need to also provide the licening terms. It looks like:

    BOOTPC_LICENSE = GPL-2.0-or-later
    BOOTPC_LICENSE_FILES = LICENSE NOTICE

Also, please provide a hash file with hashes for the source tarball [0]
and for each license files; see:
    https://buildroot.org/downloads/manual/manual.html#adding-packages-hash

[0] source tarballs generated from a git checkout have been reproducible
for quite some time now, so we can, and have to, check their hashes.

Also, the upstream README states:

    I'll repeat that.  set up /etc/host.conf or this bit won't work.

We do not provide such a file in Buildroot, so:
 1. is the comment above still valide nowadays?
 2. should the bootpc package install an /etc/host.conf file?

Regards,
Yann E. MORIN.

> +define BOOTPC_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) all
> +endef
> +
> +define BOOTPC_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/bootpc $(TARGET_DIR)/sbin
> +endef
> +
> +$(eval $(generic-package))
> -- 
> 2.25.1
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
