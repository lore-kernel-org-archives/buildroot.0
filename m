Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5A3CD3447
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 09:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1392D61565;
	Fri,  8 May 2026 09:57:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9E8BvE7WXMpo; Fri,  8 May 2026 09:57:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E84E61597
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778234243;
	bh=Xhds3vhQjpkL4LC1Ky55bSO/GDPOCXEwpXyarnuLBJk=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D7AA4sy6mhfDsoPAlz2eQMiM12LG6y84Qja8+qOXZUW2YVIQ2VyIkIWQPaBzXJKq9
	 f2FDkZx4WmVYHaKqV9iy/L82yDqQ453zNEBa/qORSkk9JSN1hpufBlArCxedE/M/Ad
	 zC3C3iGnEsdcJWCIFIoN2OCYglxvlbiBQOoXG8lqcDzZ153Bno288Pjslu4bN/eVsx
	 oRVkQtNjaxGF5p8NlFuigEDdL+fjSX5Soy9lPQQOx0fFDdzm2DfA+L2JL8Fus5J3F+
	 n93IsYjnNRQY+W8nDUSt43PGPjGEPHz6Trp2F2jErj+FDiGiNErx2JuaeO3tJysRzM
	 WF9VpGFdrEYmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E84E61597;
	Fri,  8 May 2026 09:57:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 768C9317
 for <buildroot@buildroot.org>; Fri,  8 May 2026 09:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CA4141775
 for <buildroot@buildroot.org>; Fri,  8 May 2026 09:57:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J48TuuCIFdUC for <buildroot@buildroot.org>;
 Fri,  8 May 2026 09:57:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=ferdinand.bachmann@go-e.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 233C341774
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 233C341774
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 233C341774
 for <buildroot@buildroot.org>; Fri,  8 May 2026 09:57:19 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-65c0891f4e9so2876169a12.1
 for <buildroot@buildroot.org>; Fri, 08 May 2026 02:57:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778234238; cv=none;
 d=google.com; s=arc-20240605;
 b=SQJbiOcO8EpN4JBvEsujQ5noFhNZbO7o1FU4rLeN/430SfzxkcplrKO5yd3noE5tQI
 jJilZWKoJfZit1LWwo+6AoDyjzg7Kok6miw5YfOyRpcEo5k56wIWXHszczumhEqh8B6z
 maV+2fo5p2LAp28Zm0AKdYjwjb+HmZ2CJSI+nugZpEQxPXja8lNqXwzk2he6EbeDGm4I
 EQ7HeFzqBWeB9eSaZlYMPpAaiZ3jOr6z409OpIHQDYIxAr74d7GUPqGPQdB+XLAo36IL
 Cu9h+0tGblEKUd+aKAgp9KI3wh45zt0w2Xv0DP6sxgo4z7eUUzzyjecO/oT+6k6w70IV
 Sk6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=oFHfJGAMyIf3VZpAG0yTiPatF58yFK7flQa/8MWd0O4=;
 fh=iwHzaFHfOoNmNQsWZ9+1DWR1a8cqupUYrdMuj5aYAKw=;
 b=Vrt2E1sb+L7nEjfpLTicuGUdHEcRIyeVsD9TbHPh6O6y1bOtSXH7kwWfI93Nq88rb5
 Q8ti5t0uLeSt0HhzePWbhv3RWPDE+lVvUZxLQjGZ5vkGFTEQ98jIlsrLNloF/YU+l4eg
 CCsiXf8RZsnJDZetEnJ60aiVE/5zPDIBjk8Jc6S+LWrzE8GUKSRsYcwoCwWtipDMGq/m
 vHlBMEwYbdVCJn7cx8m1K/fF77bWHLqwyta5NNR+bYt3t28oMLaVzKxXL++KJzCH//hy
 DFX6KMPa8OoNvFBVyDEWnaGxk8zyfia5VWTVndjcbP7WtJ5z77tRtRs+Qhu0f0pvzrz9
 ugjQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778234238; x=1778839038;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oFHfJGAMyIf3VZpAG0yTiPatF58yFK7flQa/8MWd0O4=;
 b=lx0KFs1JSPITvwOBgEhjC0IjPiXcAc62eT6sEUj2YPUTAkRSgQ3QX463l4RXS7J+aC
 hvzgHxSsi18fo0KCGrrk9HUXXccisuSl4f+524VQoUkblOMkaXg9mUA8iVVIH5FeEsBK
 O7d1JUhYqtW1R7LPSKx2iydSS82f81lXCH/nxsUJWZnDSokcIXFY3fqX7Vr66Xq0u3ea
 FH2UlY8G/iDRk7kBlGp097PQ2LZ+zfv9/nnyrq70zSGvgIVeBUaQzWOQvXsjdKBsdh7v
 oTcG9y59NYu6PraPD56AW1IEL00LPrTwFw/+2qQg0GWADzOC1AlfcE+DHm7tBqs6ZYLI
 HLeQ==
X-Gm-Message-State: AOJu0YxLRiWsR/u3vzGPvX04vyvEO4biG8r8l/7C6tUQ6koAiDIDp6WN
 2GKexETNfA8EyY7Didic76dfRg8+f3JTCJ1wKH+afdtwJRJjLeD3G8LsYi5A+kaxjx2J7lweShD
 jpLYaGagtBsyF51BcPHfTOBN4XNnvjCDraPNrumZU3A==
X-Gm-Gg: Acq92OHFJq6b7FcWezYBWgVs3xAjyEIJqrG65OzILKDNQI44+ulBFk4bxbvEMnKm82e
 Z4caJf8cJHVvwT6IaEL/iJ4fgJRlRRKxwIBLhuuGl5wbdEu2wpVX793AqrS2TquAtXqKK1z/fQc
 3uqxzbfnqt5qwdlt4jdaX4598KMZvi7kqQcQkccXrc/w4kBClli2aR3Ba587HGPHNbJZ/Gf6gy9
 9gDdWCv1f/DvHHIysvAVeYl6qgMXDj/HqLrIkPWXrq+MD5PoL2dA/nV1kPafuTFjEPlAYm8uuny
 yNkAUVOzjjDjeUEv
X-Received: by 2002:a05:6402:4549:b0:670:6ff3:6d23 with SMTP id
 4fb4d7f45d1cf-67d63d8e03fmr4604380a12.7.1778234237935; Fri, 08 May 2026
 02:57:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
 <20260506223341.1759760-35-james.hilliard1@gmail.com>
In-Reply-To: <20260506223341.1759760-35-james.hilliard1@gmail.com>
From: Ferdinand Bachmann <ferdinand.bachmann@go-e.com>
Date: Fri, 8 May 2026 11:57:06 +0200
X-Gm-Features: AVHnY4Jgm51Dw079J09OtQwghBx-Hbt3YCzHZ9li4w33Z2iI2KWotqHusD439as
Message-ID: <CAMwDAPiSOPm2OCNJXe1ko3YDUodcmnMBURPKB2b_nbJU+AQK=g@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Gary Bisson <bisson.gary@gmail.com>,
 Alexander Clouter <alex+buildroot@digriz.org.uk>, 
 Sergio Prado <sergio.prado@e-labworks.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, 
 Bernd Kuhls <bernd@kuhls.net>, Brandon Maier <brandon.maier@collins.com>, 
 "Alvaro G . M" <alvaro.gamez@hazent.com>, Paul Cercueil <paul@crapouillou.net>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, Doug Kehn <rdkehn@gmail.com>, 
 Spenser Gilliland <spenser@gillilanding.com>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marcus Hoffmann <bubu@bubu1.eu>, Pascal de Bruijn <p.debruijn@unilogic.nl>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=go-e.com; s=google; t=1778234238; x=1778839038; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oFHfJGAMyIf3VZpAG0yTiPatF58yFK7flQa/8MWd0O4=;
 b=LD7GGL1iQMnNpQA8PfaKWqEcwuB6RUa/Dm7R66O5kgbFgva+TbULFfG5rtNAJfF8+s
 f4VJKuDyuGbB38mcKu0CUycfMb0BZHQAqPB3xGwPzmUW2IFwGFUeCo7OsfM0CMgtibZR
 a3TFL/uttyJt1FFXe4wTFxWhK7Va8Dx8JIZigyEJ+JSpI0bkRipkUseXY1HS4GbLhbAm
 Lg+U5aB+lg/JtqvQjZuiVRTCuWDc+gYO+TmZJFfH9k7I+rzRbQ2TGfb+FhzmLF8FGl78
 btUHQlu1Q85TARS1J1FS23zY4exE+SSKHxYh+Iwk9VY5WTQg8CRr3+TGSZaY4IADhtl3
 xvQQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=go-e.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=go-e.com header.i=@go-e.com header.a=rsa-sha256
 header.s=google header.b=LD7GGL1i
Subject: Re: [Buildroot] [PATCH 35/40] package/uboot-tools: preserve
 /usr/sbin symlink
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
Content-Type: multipart/mixed; boundary="===============2892736954818600621=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2892736954818600621==
Content-Type: multipart/alternative; boundary="0000000000001472b206514b6cf1"

--0000000000001472b206514b6cf1
Content-Type: text/plain; charset="UTF-8"

Hi James!

-D normally doesn't replace symlinks with directories, but Ubuntu 26.04
ships with Rust uutils instead of GNU coreutils, which has a bug in
`install` that causes this:

https://github.com/uutils/coreutils/issues/12166

This also affects lots of other packages (e.g. lvm2) and patching every
single one of them to not use `install -D` is probably out of the question.

Also, can you look at my patch for issue 173 (
https://gitlab.com/buildroot.org/buildroot/-/work_items/173)? uboot-tools
currently silently builds without FIT_SIGNATURE support even if enabled.
This should be fixed.

Best regards,
Ferdinand Bachmann

On Thu, 7 May 2026 at 00:34, James Hilliard <james.hilliard1@gmail.com>
wrote:

> With BR2_ROOTFS_MERGED_BIN=y, /usr/sbin is a symlink to bin.
> Using install -D for files below $(TARGET_DIR)/usr/sbin can create
> the parent directory path and replace that symlink with a real
> directory.
>
> With per-package directories, this can later make rsync fail when a
> package target directory contains a non-empty usr/sbin directory and
> the skeleton provides usr/sbin -> bin.
>
> The skeleton dependency has already created /usr/sbin, either as a
> directory or as the merged-bin symlink, so use plain install and let it
> follow the existing path.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/uboot-tools/uboot-tools.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/
> uboot-tools.mk
> index fa0b6aba78..89d2ec38ea 100644
> --- a/package/uboot-tools/uboot-tools.mk
> +++ b/package/uboot-tools/uboot-tools.mk
> @@ -92,14 +92,14 @@ endif
>
>  ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV),y)
>  define UBOOT_TOOLS_INSTALL_FWPRINTENV
> -       $(INSTALL) -m 0755 -D $(@D)/tools/env/fw_printenv
> $(TARGET_DIR)/usr/sbin/fw_printenv
> +       $(INSTALL) -m 0755 $(@D)/tools/env/fw_printenv
> $(TARGET_DIR)/usr/sbin/fw_printenv
>         ln -sf fw_printenv $(TARGET_DIR)/usr/sbin/fw_setenv
>  endef
>  endif
>
>  ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_DUMPIMAGE),y)
>  define UBOOT_TOOLS_INSTALL_DUMPIMAGE
> -       $(INSTALL) -m 0755 -D $(@D)/tools/dumpimage
> $(TARGET_DIR)/usr/sbin/dumpimage
> +       $(INSTALL) -m 0755 $(@D)/tools/dumpimage
> $(TARGET_DIR)/usr/sbin/dumpimage
>  endef
>  endif
>
> --
> 2.53.0
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--0000000000001472b206514b6cf1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi James!</div><div><br></div><div>-D normally doesn&=
#39;t replace symlinks with directories, but Ubuntu 26.04 ships with Rust u=
utils instead of GNU coreutils, which has a bug in `install` that causes th=
is:</div><div><br></div><div><a href=3D"https://github.com/uutils/coreutils=
/issues/12166">https://github.com/uutils/coreutils/issues/12166</a></div><d=
iv><br></div><div>This also affects lots of other packages (e.g. lvm2) and =
patching every single one of them to not use `install -D` is probably out o=
f the question.</div><div><br></div><div>Also, can you look at my patch for=
 issue 173 (<a href=3D"https://gitlab.com/buildroot.org/buildroot/-/work_it=
ems/173">https://gitlab.com/buildroot.org/buildroot/-/work_items/173</a>)? =
uboot-tools currently silently builds without FIT_SIGNATURE support even if=
 enabled. This should be fixed.</div><div><br></div><div>Best regards,</div=
><div>Ferdinand Bachmann</div></div><br><div class=3D"gmail_quote gmail_quo=
te_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 7 May 2026 at 0=
0:34, James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.com">james=
.hilliard1@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">With BR2_ROOTFS_MERGED_BIN=3Dy, /usr/sbin is a symlink =
to bin.<br>
Using install -D for files below $(TARGET_DIR)/usr/sbin can create<br>
the parent directory path and replace that symlink with a real<br>
directory.<br>
<br>
With per-package directories, this can later make rsync fail when a<br>
package target directory contains a non-empty usr/sbin directory and<br>
the skeleton provides usr/sbin -&gt; bin.<br>
<br>
The skeleton dependency has already created /usr/sbin, either as a<br>
directory or as the merged-bin symlink, so use plain install and let it<br>
follow the existing path.<br>
<br>
Signed-off-by: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.c=
om" target=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
---<br>
=C2=A0package/uboot-tools/<a href=3D"http://uboot-tools.mk" rel=3D"noreferr=
er" target=3D"_blank">uboot-tools.mk</a> | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/package/uboot-tools/<a href=3D"http://uboot-tools.mk" rel=3D"n=
oreferrer" target=3D"_blank">uboot-tools.mk</a> b/package/uboot-tools/<a hr=
ef=3D"http://uboot-tools.mk" rel=3D"noreferrer" target=3D"_blank">uboot-too=
ls.mk</a><br>
index fa0b6aba78..89d2ec38ea 100644<br>
--- a/package/uboot-tools/<a href=3D"http://uboot-tools.mk" rel=3D"noreferr=
er" target=3D"_blank">uboot-tools.mk</a><br>
+++ b/package/uboot-tools/<a href=3D"http://uboot-tools.mk" rel=3D"noreferr=
er" target=3D"_blank">uboot-tools.mk</a><br>
@@ -92,14 +92,14 @@ endif<br>
<br>
=C2=A0ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV),y)<br>
=C2=A0define UBOOT_TOOLS_INSTALL_FWPRINTENV<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 0755 -D $(@D)/tools/env/fw_printe=
nv $(TARGET_DIR)/usr/sbin/fw_printenv<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 0755 $(@D)/tools/env/fw_printenv =
$(TARGET_DIR)/usr/sbin/fw_printenv<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf fw_printenv $(TARGET_DIR)/usr/sbin/fw_se=
tenv<br>
=C2=A0endef<br>
=C2=A0endif<br>
<br>
=C2=A0ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_DUMPIMAGE),y)<br>
=C2=A0define UBOOT_TOOLS_INSTALL_DUMPIMAGE<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 0755 -D $(@D)/tools/dumpimage $(T=
ARGET_DIR)/usr/sbin/dumpimage<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 0755 $(@D)/tools/dumpimage $(TARG=
ET_DIR)/usr/sbin/dumpimage<br>
=C2=A0endef<br>
=C2=A0endif<br>
<br>
-- <br>
2.53.0<br>
<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div>

--0000000000001472b206514b6cf1--

--===============2892736954818600621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2892736954818600621==--
