Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C631D5E39D
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 14:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05930827D2;
	Tue, 16 Dec 2025 14:54:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q2wr-7N-41FP; Tue, 16 Dec 2025 14:54:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C94F82897
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765896854;
	bh=rdQ0dCJgFe0t3ljD4RuDVgjZo55yNMmR5yCEtU9i//8=;
	h=To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RlLAaXjVrUhYsEdYPbEJ/ficnFfp+s+ux5plDQz+3Fo0rB4vtHfU0RGKHul6h+3D/
	 VeWEhHPqx6okG6VXzHVMJ36LP9I7EcRglwSWKWmPWshXfcT4X54Rc8QcTyN3GaWOdk
	 BQxrcRLBFTCN5a06Fby1XN6FBstTXzFQ9bkoErEEau23LUNw4Qsz5WmD54PDZfoRoX
	 as9y6MKLl1hJyk4nLqZRUzc6cb/PWxc65WXPbXVFCtV91Dm///gtwo3jWzbx85Njku
	 CwczIG1Mi7Zbbao8Z/r8B0eACh8SkSGhuYK98bO2OE19iZ+m+n1EH24sidXTCfKnS0
	 4r5aADNso2bqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C94F82897;
	Tue, 16 Dec 2025 14:54:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 00EA1372
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 14:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB5D78294A
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 14:54:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HEvOvHpN8ZPv for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 14:54:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A9E0882865
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9E0882865
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A9E0882865
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 14:54:09 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id C13CC44081E;
 Tue, 16 Dec 2025 16:51:38 +0200 (IST)
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20251216135633.1413876-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Tue, 16 Dec 2025 14:56:32
 +0100")
References: <20251216135633.1413876-1-thomas.petazzoni@bootlin.com>
User-Agent: mu4e 1.12.13; emacs 30.2
Date: Tue, 16 Dec 2025 16:54:05 +0200
Message-ID: <87zf7i5vg2.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1765896698;
 bh=gwJbIW9pYoTZ5BULBdpzAgSJfWiI0/dCcponteflJkQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=zIdGRGkVr2gZQmExo631PVvytZCxYMoLeA2rJxejox2Ty9ymfAPc3/JmNob6qor7v
 YX8zrk6GqHLfioevu0yp3SehWweixwVtZDhJyaug5hG/qswZnKS7lBssQ65MCbwkti
 fBL6+ki5o6EdDUvGSCo2q/X0ac6NTB2PV0DMDUJD0hNe8X/4H1Y42n8aVccv3FCSVb
 kXBxw6s7jn8+gF8nBUcKRlY1z1MBmTicvfapd4dPkUN9Ec9W0zDeevFxGKe7KqO91Z
 awC0hgYlnyWBu6Dxwyd2ukVtyQJAuf958qQqTM07Iqfv5fBl3JUHbqL7lkX3Y1o7XF
 J6chnMwYJl+8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=zIdGRGkV
Subject: Re: [Buildroot] [PATCH] package/connman-gtk: remove package
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Tue, Dec 16 2025, Thomas Petazzoni via buildroot wrote:
> - Last upstream release: December 2015
> - Last upstream commit: June 2018
> - Github repo marked as archived/read-only
> - No maintainer in DEVELOPERS file
> - Doesn't build with recent Gtk versions

Bernd posted a similar patch a few days ago as part of a larger removals
series:

  https://patchwork.ozlabs.org/project/buildroot/patch/20251213202503.1348845-4-bernd@kuhls.net/

baruch

> Fixes:
>
>   https://autobuild.buildroot.net/results/54d8cc10e4d017deabf8664898a2d09e3a115f66/
>
> (This has been broken for a long time, this build falure is from
> January 2025, so our LTS branch is similarly affected)
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  Config.in.legacy                     |  7 +++++++
>  package/Config.in                    |  1 -
>  package/connman-gtk/Config.in        | 22 ----------------------
>  package/connman-gtk/connman-gtk.hash |  3 ---
>  package/connman-gtk/connman-gtk.mk   | 17 -----------------
>  5 files changed, 7 insertions(+), 43 deletions(-)
>  delete mode 100644 package/connman-gtk/Config.in
>  delete mode 100644 package/connman-gtk/connman-gtk.hash
>  delete mode 100644 package/connman-gtk/connman-gtk.mk
>
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 07d5034860..3473dbf010 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
>  
>  comment "Legacy options removed in 2026.02"
>  
> +config BR2_PACKAGE_CONNMAN_GTK
> +	bool "connman-gtk"
> +	select BR2_LEGACY
> +	help
> +	  connman-gtk has been removed as it was no longer maintained
> +	  upstream.
> +
>  config BR2_PACKAGE_RPI_USERLAND
>  	bool "rpi-userland has been removed"
>  	select BR2_LEGACY
> diff --git a/package/Config.in b/package/Config.in
> index 0ffdf5f4d6..f72b935d5a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2458,7 +2458,6 @@ endif
>  	source "package/civetweb/Config.in"
>  	source "package/cloudflared/Config.in"
>  	source "package/connman/Config.in"
> -	source "package/connman-gtk/Config.in"
>  	source "package/conntrack-tools/Config.in"
>  	source "package/corkscrew/Config.in"
>  	source "package/crda/Config.in"
> diff --git a/package/connman-gtk/Config.in b/package/connman-gtk/Config.in
> deleted file mode 100644
> index 467bf7ec88..0000000000
> --- a/package/connman-gtk/Config.in
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -comment "connman-gtk needs libgtk3 and a glibc or uClibc toolchain w/ wchar, threads, resolver, dynamic library"
> -	depends on BR2_USE_MMU
> -	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> -	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> -		BR2_STATIC_LIBS || !BR2_PACKAGE_LIBGTK3 || \
> -		BR2_TOOLCHAIN_USES_MUSL
> -
> -config BR2_PACKAGE_CONNMAN_GTK
> -	bool "connman-gtk"
> -	depends on BR2_USE_WCHAR # libglib2, connman
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, connman
> -	depends on BR2_USE_MMU # libglib2
> -	depends on !BR2_STATIC_LIBS # connman
> -	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # connman
> -	depends on !BR2_TOOLCHAIN_USES_MUSL # connman
> -	depends on BR2_PACKAGE_LIBGTK3
> -	select BR2_PACKAGE_CONNMAN
> -	select BR2_PACKAGE_LIBGLIB2
> -	help
> -	  GTK GUI for ConnMan.
> -
> -	  https://github.com/jgke/connman-gtk
> diff --git a/package/connman-gtk/connman-gtk.hash b/package/connman-gtk/connman-gtk.hash
> deleted file mode 100644
> index 72e2fcaaa5..0000000000
> --- a/package/connman-gtk/connman-gtk.hash
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -# Locally calculated
> -sha256  49bdc4769a7c508b0130e4705eef21aec9df1ea4f5c29fee48a0cae8db828fca  connman-gtk-1.1.1.tar.bz2
> -sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/connman-gtk/connman-gtk.mk b/package/connman-gtk/connman-gtk.mk
> deleted file mode 100644
> index 0ea49198e6..0000000000
> --- a/package/connman-gtk/connman-gtk.mk
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -################################################################################
> -#
> -# connman-gtk
> -#
> -################################################################################
> -
> -CONNMAN_GTK_VERSION = 1.1.1
> -CONNMAN_GTK_SITE = https://github.com/jgke/connman-gtk/releases/download/v$(CONNMAN_GTK_VERSION)
> -CONNMAN_GTK_SOURCE = connman-gtk-$(CONNMAN_GTK_VERSION).tar.bz2
> -CONNMAN_GTK_INSTALL_STAGING = YES
> -CONNMAN_GTK_DEPENDENCIES = host-intltool connman libglib2 libgtk3 \
> -	$(TARGET_NLS_DEPENDENCIES)
> -CONNMAN_GTK_LICENSE = GPL-2.0+
> -CONNMAN_GTK_LICENSE_FILES = COPYING
> -CONNMAN_GTK_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
> -
> -$(eval $(autotools-package))

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
