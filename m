Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C377C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 07:47:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0F9260FC1
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 07:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C0F9260FC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80AD6401CB;
	Sun,  8 Aug 2021 07:47:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GFuY98AfI21H; Sun,  8 Aug 2021 07:47:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69B9A401EC;
	Sun,  8 Aug 2021 07:47:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A70B1BF5A9
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 07:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58969835CF
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 07:47:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JMPJakegDiEV for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 07:47:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 81646829BB
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 07:47:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6435:5a60:3dd3:9849])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id BB8087802BE;
 Sun,  8 Aug 2021 09:47:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1628408869;
 bh=4M84fAE6fPgCje2rNAy/BdU1kSzMO09r7BWBOeR9yRs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KrVjMBEDwn1YWGa8PXz1wnhMlUpgIk35KErMsr1OeelmTT5qKoEFjvzSnERF1uofS
 dXZd8GOVfLI5ptwjR0qEYMeTrJlGwbAar2lY/rUJHmQ2AvdMA3YFqMFGcGXaPIsD9M
 Be0TYYTsnJJR3+F0w6sGB0hOId35vPFMPd6pCavxbVMxD0c2UYIeUTdJ5r5YVEzcNA
 UBfioa9DtcAfONaXt8SyR8JxT5WvmO4HBQn9jcKoi497/YI/ysMoHpXRamXotEhQsL
 Az2FKdk9wtQIWntClavkqERnTCdVnGAZDbQOI+FjzwgdCVGzkMPyHVSNt1Je5Igcih
 HsKcuy6N/M2+A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 08 Aug 2021 09:47:42 +0200
Date: Sun, 8 Aug 2021 09:47:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210808074742.GI27036@scaer>
References: <20210807203255.1963543-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210807203255.1963543-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2,1/1] package/libvirt: needs xsltproc
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Jared Bents <jared.bents@rockwellcollins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-08-07 22:32 +0200, Fabrice Fontaine spake thusly:
> libvirt needs xsltproc since its addition in commit
> ccfc90e1010e42e6529afae3a5ea8bf7226dabc1:
> 
> ../output-1/build/libvirt-7.4.0/meson.build:807:2: ERROR: Program 'xsltproc' not found
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/0341be10c4c36f37b5b6486428e55170a42b7692
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>  - Add autobuilder link and split dependencies lines
> 
>  package/libvirt/libvirt.mk | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
> index feb2d6aa84..2e9b7db0a5 100644
> --- a/package/libvirt/libvirt.mk
> +++ b/package/libvirt/libvirt.mk
> @@ -10,8 +10,18 @@ LIBVIRT_SOURCE = libvirt-$(LIBVIRT_VERSION).tar.xz
>  LIBVIRT_LICENSE = LGPL-2.1+
>  LIBVIRT_LICENSE_FILES = COPYING
>  LIBVIRT_CPE_ID_VENDOR = redhat
> -LIBVIRT_DEPENDENCIES = host-nfs-utils host-pkgconf host-python-docutils \
> -	gnutls libglib2 libpciaccess libtirpc libxml2 udev zlib
> +LIBVIRT_DEPENDENCIES = \
> +	host-libxslt \
> +	host-nfs-utils \
> +	host-pkgconf \
> +	host-python-docutils \
> +	gnutls \
> +	libglib2 \
> +	libpciaccess \
> +	libtirpc \
> +	libxml2 \
> +	udev \
> +	zlib
>  
>  LIBVIRT_CONF_ENV += \
>  	CFLAGS="$(TARGET_CFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`" \
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
