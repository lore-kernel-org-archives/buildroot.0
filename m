Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A8DEE57C6
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 16:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8012A812B7;
	Wed, 11 Sep 2024 16:45:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sFP5ir3YuzAB; Wed, 11 Sep 2024 16:45:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4622A81277
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4622A81277;
	Wed, 11 Sep 2024 16:45:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 797F01BF228
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 16:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68DB2606D3
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 16:45:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v8Fli-mJJeUZ for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 16:45:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F036760596
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F036760596
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F036760596
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 16:45:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 8F6356013A;
 Wed, 11 Sep 2024 18:44:54 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 11 Sep 2024 18:44:54 +0200
Date: Wed, 11 Sep 2024 18:44:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <ZuHJBtCNOIRW68wi@landeda>
References: <20240910193641.1711056-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240910193641.1711056-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726073098;
 bh=mblvWxuGF+7Gtic4cGKhZOXclLwX3TA0krWwTDPsuRc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XkhNhphmkQecw2nnHT9Sxin4rW36UGdmLIt6q7kl2q3Tjcd/hOfEy63lPv8BbQpup
 O4x6IxBoXZ5hN8HX0C5MAyWuAW5Mm9OTF9S85su8koogoRy3gzlUhHT+62fRNlndgb
 bVXnfQazXpQ2WB1tJ8Vhus2mbvNugXzGVA4NPHNrlRFav23ygPCgTDR3AwSGOEyYqF
 BEXeI7MsU9Wi+p0pIhruRM7h+u3PcZrrlwGLe4mj/CNSCZ4A56Gk5fHYS+uuCoCWd4
 jl51jisCWuWb3V3nU1uFnDml021qQHZH1F/iva9VOG+ciJulKLcWobLqURZeGIdjoG
 yt7Pmrx57YScg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XkhNhphm
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: link host systemd
 utilities statically
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
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2024-09-10 13:36 -0600, James Hilliard spake thusly:
> This makes it less likely that we will run into missing library
> errors when running host systemd utilities

What error exactly are you trying to fix here?
Why does it happen only now?

Stating "less likekely" implies that it is not systematic, so there are
conditions that trigger it. What conditions would tht be, so we can try
and reproduce the issue?

While "missing libraries" is atually an issue, what library are missing?
Why are they missing?

These are critical information that must be present in the commit log.

Let me guess. You are hitting the same issue as reported there:
    https://gitlab.com/buildroot.org/buildroot/-/issues/39

If so, then I think your patch is just hidding the dust under the rug.

Indeed, it is possible that other packages suffer from the same issue,
and we certainly do not want to build all such packages statically.

Instead, we want to fix the rpath fixups (he! fix the fixups!).

Regards,
Yann E. MORIN.

> and lets us remove the
> HOST_SYSTEMD_FIX_RPATH hack.

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../fakeroot_tmpfiles.sh                      |  2 +-
>  .../skeleton-init-systemd.mk                  |  2 +-
>  package/systemd/systemd.mk                    | 30 +++++++------------
>  3 files changed, 13 insertions(+), 21 deletions(-)
> 
> diff --git a/package/skeleton-init-systemd/fakeroot_tmpfiles.sh b/package/skeleton-init-systemd/fakeroot_tmpfiles.sh
> index 9498638f0b..5381750500 100755
> --- a/package/skeleton-init-systemd/fakeroot_tmpfiles.sh
> +++ b/package/skeleton-init-systemd/fakeroot_tmpfiles.sh
> @@ -25,7 +25,7 @@
>  # [1] - https://github.com/systemd/systemd/pull/16187
>  
>  [ -n "${HOST_SYSTEMD_TMPFILES-}" ] ||
> -    HOST_SYSTEMD_TMPFILES=systemd-tmpfiles
> +    HOST_SYSTEMD_TMPFILES=systemd-tmpfiles.standalone
>  
>  [ -n "${1-}" -a -d "${1-}"/usr/lib/tmpfiles.d ] ||
>      { echo 1>&2 "$0: need ROOTFS argument"; exit 1; }
> diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk b/package/skeleton-init-systemd/skeleton-init-systemd.mk
> index b312fe33e4..cd51ce209a 100644
> --- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
> +++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
> @@ -80,7 +80,7 @@ endif  # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
>  
>  ifeq ($(BR2_INIT_SYSTEMD_POPULATE_TMPFILES),y)
>  define SKELETON_INIT_SYSTEMD_CREATE_TMPFILES_HOOK
> -	HOST_SYSTEMD_TMPFILES=$(HOST_DIR)/bin/systemd-tmpfiles \
> +	HOST_SYSTEMD_TMPFILES=$(HOST_DIR)/bin/systemd-tmpfiles.standalone \
>  		$(SKELETON_INIT_SYSTEMD_PKGDIR)/fakeroot_tmpfiles.sh $(TARGET_DIR)
>  endef
>  SKELETON_INIT_SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SKELETON_INIT_SYSTEMD_CREATE_TMPFILES_HOOK
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 5dca8681bc..9a18d91533 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -899,6 +899,17 @@ endef
>  # We need a very minimal host variant, so we disable as much as possible.
>  HOST_SYSTEMD_CONF_OPTS = \
>  	-Dsplit-bin=true \
> +	-Dlink-udev-shared=false \
> +	-Dlink-executor-shared=false \
> +	-Dlink-systemctl-shared=false \
> +	-Dlink-networkd-shared=false \
> +	-Dlink-timesyncd-shared=false \
> +	-Dlink-journalctl-shared=false \
> +	-Dlink-boot-shared=false \
> +	-Dlink-portabled-shared=false \
> +	-Dstatic-libsystemd=true \
> +	-Dstatic-libudev=true \
> +	-Dstandalone-binaries=true \
>  	--prefix=/usr \
>  	--libdir=lib \
>  	--sysconfdir=/etc \
> @@ -1022,24 +1033,5 @@ HOST_SYSTEMD_DEPENDENCIES = \
>  
>  HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)
>  
> -# Fix RPATH After installation
> -# * systemd provides a install_rpath instruction to meson because the binaries
> -#   need to link with libsystemd which is not in a standard path
> -# * meson can only replace the RPATH, not append to it
> -# * the original rpath is thus lost.
> -# * the original path had been tweaked by buildroot via LDFLAGS to add
> -#   $(HOST_DIR)/lib
> -# * thus re-tweak rpath after the installation for all binaries that need it
> -HOST_SYSTEMD_HOST_TOOLS = busctl journalctl systemctl systemd-* udevadm
> -
> -define HOST_SYSTEMD_FIX_RPATH
> -	for f in $(addprefix $(HOST_DIR)/bin/,$(HOST_SYSTEMD_HOST_TOOLS)); do \
> -		[ -e $$f ] || continue; \
> -		$(HOST_DIR)/bin/patchelf --set-rpath $(HOST_DIR)/lib:$(HOST_DIR)/lib/systemd $${f} \
> -		|| exit 1; \
> -	done
> -endef
> -HOST_SYSTEMD_POST_INSTALL_HOOKS += HOST_SYSTEMD_FIX_RPATH
> -
>  $(eval $(meson-package))
>  $(eval $(host-meson-package))
> -- 
> 2.34.1
> 

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
