Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB20D35171
	for <buildroot@archiver.kernel.org>; Wed,  1 Apr 2026 11:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72C368038C;
	Wed,  1 Apr 2026 11:29:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ohjkQQDOJIX; Wed,  1 Apr 2026 11:29:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C37481E22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775042985;
	bh=GLeVp5vtS1w9RBMwxRT9lcEEXUawqSE0ZYdlufea/f0=;
	h=References:In-Reply-To:From:Date:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MwQuuOlaWiMtrxAJb9k3IitGF/B7ES2oR7lWlNP0+7Btd7oKaQcaiAJjZzKk6KOpj
	 ZdFIDHvat3DBQJYIwraFb3xPRO0mLJ5zcXB/XlDEsbY5HVDGbzo4E0UiMJRLVcy8e/
	 YmKY6tviqQLBldUbhsY6ogXaXxBY1zLGbbKhkXqox7Y8kBfcKCxj00JwgzgTJvjdNw
	 nGVf0eKl90jOQd9JAEsWVxqy8khhVnb1jl9Bn45I35PhwVGq1FkzmXOAwSafWXbde+
	 UzxJcpJi+HA3vm0ynMJ6ECLN8WcfVtqWDv6PNpg2FnX4W5whferzBrPFR+xY6rjmXk
	 76Z8Vt/oOwYlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C37481E22;
	Wed,  1 Apr 2026 11:29:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B84425F
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 11:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D53B81E1F
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 11:29:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mz_FDVRKIn8U for <buildroot@buildroot.org>;
 Wed,  1 Apr 2026 11:29:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=ferdinand.bachmann@go-e.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3520681E1A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3520681E1A
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3520681E1A
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 11:29:43 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-66b2f6e983bso8643214a12.0
 for <buildroot@buildroot.org>; Wed, 01 Apr 2026 04:29:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775042981; cv=none;
 d=google.com; s=arc-20240605;
 b=UMVRL9lY40ge24xPojNyuuBKqFknC/Ur4g43TMSXGXSSU1MmdwipNpj/vpFcvILmn2
 2a+6v+SscjPpLHVVopmFsntPdA5h5Tk0SgqKxu6AI74hNeYOLcQf0cWBoN6ym8UbIzOn
 BE4t/dIRXDCJo+wk2TucvZltjwyx3nZhfBoDZTN09n7aGM0Lnsskt9XoVflh29/EcoPL
 2Wus/2sku/k8SzpIrBwCmWMu0cFicRHa6GxfqJqOt13ovF6TSJ//ABM8dUV5vHDPYmAp
 5D0tuvyRhhiRKAYhFH/uukWhp44noznUySFGzAWpLt+vQvIndygsNy2snW4hrBw5obpn
 Pxdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :dkim-signature;
 bh=CmPpTMMb9IDPxcMve54R5bsDD1Y5lPywkaUkO+c0BLo=;
 fh=3pWBXGdSiVldOzJ6ypfJcTUIWlbrikH1EIZUHFIjzuo=;
 b=Hisbj2MrXWLQktx1GBoazU8nODMVn+yBmSSCIH+L43JtmX9Tf3dxja1ia66yA690jS
 BVmLPl+qXMbqQMQiHXXTMKmKtbt97HjcomBLWPa31DaDh2a/g1V1R3Y8WLbueKtALyVy
 Q0dRPrSOt/+iJua4iUOXoqDXougaKh6flmDdAjfsVIXgdmuU4gorYBHEA+nz/W1td3iK
 qKvprmNiQiPsCfPzCfYNgGN7qJZIsumSdb5BzGuow9civ32QzFoQHteNiJxdn3AzBpk0
 Tzpdv+IolMGhTVpQAWZp6F7GWtzinuJMmqW6TUs1Xhs5Jxomstj5HqR/7fo1y3f8fpw7
 5FDg==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775042981; x=1775647781;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CmPpTMMb9IDPxcMve54R5bsDD1Y5lPywkaUkO+c0BLo=;
 b=XUWtlFg9n+1cKAtNgiObA8nJKK5oR4YEeqlS7DCuTgzsI7QldRzmak30Wka0okrbVj
 Fyszqs8dxw5DKsqyce+uIfv1pG/h7o4lPwTfEioYZV3U6XuVn5EENlet/MsAGlMJBRSn
 WF3ueJqNABNaXiGx6C+bgGIaLZ/vNEaYiwAF3QiNI1hWyKCn+sBoplTJnMgzzguPwnSZ
 NGPwkthH6kicwITxSM0gfovvfLNcwzaPTKpff1/cxaPL2poIGrzffTO/JySFLkv8tvls
 CuFIWwb6kQZd/2u5chBnpEvBJUdIe/5o5as+itiD/Xw6YRFcIdQaJ/9UOYaANidRSODy
 otug==
X-Gm-Message-State: AOJu0YwhYkMFZ8kDFt3OQA6a6Ar5CXJkgpbgrNLNOVpQPGg8vomViD2n
 ppv7m9iK06DqClkeF31A3kdhFUPHVTFp5gAQc7LKXdlZQuCHH1L00iTzdLAFXg531epBCWjCWYo
 sxhnKx8oeacrp2Z6Or9LhjBY+a7KHy8V6RT14hp/ERaEjvXctc54nlfw=
X-Gm-Gg: ATEYQzyBkDVraoe2M6+OcGWHvZX2wgC2KRu3t75WecIEEJLsbqfUObsra787t/BcbEw
 opGpzby4yG8JWhSOUt/3pJluqAs5x9fB1ZVqd18pgnb6O6Bd5nmzekXmfGIOOhWeaSBKTfmlvpy
 FURXZJeDlUrmIpVU4ZUhKvgtDnS+QBljhW0ivNsFgd6pyenCP7ircCuwniMvCY5Ps9m0u0/CMqX
 PS0/pMaZhND92hM04S17UGubHvOmcY+eW2Zh9FmqUpHdDAiXAka/CTOieeSNwiourJZJOUwyvl4
 pgdkhyZadJsoztd7
X-Received: by 2002:a05:6402:2688:b0:66d:d2f9:51f9 with SMTP id
 4fb4d7f45d1cf-66dd2f952e2mr1051896a12.11.1775042980608; Wed, 01 Apr 2026
 04:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260330115702.1451432-1-ferdinand.bachmann@go-e.com>
 <20260330115702.1451432-2-ferdinand.bachmann@go-e.com>
In-Reply-To: <20260330115702.1451432-2-ferdinand.bachmann@go-e.com>
From: Ferdinand Bachmann <ferdinand.bachmann@go-e.com>
Date: Wed, 1 Apr 2026 13:29:29 +0200
X-Gm-Features: AQROBzDR-QPycR4okXeTVMS4a5bnB0qAAD1wAWAqJiihtJDxSkQ61JBiawg1y8s
Message-ID: <CAMwDAPjog9=-mMaqXyaHqieYs1FDvGdLXCZCSy-=Bo7WraieYA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=go-e.com; s=google; t=1775042981; x=1775647781; darn=buildroot.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CmPpTMMb9IDPxcMve54R5bsDD1Y5lPywkaUkO+c0BLo=;
 b=WAd1PEs1hBTLb1MLAQyLVfayH8Xp5TXDkt96KUPIiwHj4z+FpFdLg4FwdRPRS5DtMP
 iZUzr3Enm01svBCgPUxKWKjaiMAvs6Y8VZKrZXwMiKkNH3h/mW0GL9OdwbdLfiq1bmVB
 0nGvXIiLQMTiruSHRahW2DIuR09X1WmRcMGowSkD4VZKUc4P6Tul0RHZtN4lYrbvL+mL
 AY0SeiOXKLiy9oMqx7Zhg0qD6gfoSnSRkYjh0/ENMx8Onq6JY8qRDe+n1jaw8fni2L+0
 Il+briX/0ZjRJycEdBz8Y2jMZCbaIrfBeW43jigwwa8PvEGsQes/7rOb665U9A/84+Jw
 GeSA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=go-e.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=go-e.com header.i=@go-e.com header.a=rsa-sha256
 header.s=google header.b=WAd1PEs1
Subject: Re: [Buildroot] [PATCH 1/1] package/uboot-tools: fix FIT signature
 support
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
Content-Type: multipart/mixed; boundary="===============6294940750670349561=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6294940750670349561==
Content-Type: multipart/alternative; boundary="000000000000520d86064e6466bf"

--000000000000520d86064e6466bf
Content-Type: text/plain; charset="UTF-8"

I double-checked this and it seems like this also needs
`BR2_PACKAGE_OPENSSL_ENGINES=y` to build correctly, since part of
uboot-tools seems to depend on the openssl `ENGINE_*` family of functions
now when FIT_SIGNATURE support is enabled.

See also the related GitLab work item:
https://gitlab.com/buildroot.org/buildroot/-/work_items/173

On Mon, 30 Mar 2026 at 13:57, Ferdinand Bachmann <
ferdinand.bachmann@go-e.com> wrote:

> uboot-tools changed how the config system works for tool builds, which
> leads to buildroot's configure cmds being wrong / incomplete.
>
> Specifically, the CONFIG_FIT_* macros are now called CONFIG_TOOLS_FIT_*,
> while the make options needed to compile FIT signature support are still
> CONFIG_FIT_*. Additionally, CONFIG_TOOLS_LIBCRYPTO is needed to link
> uboot-tools with FIT signature support correctly.
>
> This patch fixes the issue by adding the new CONFIG_TOOLS_FIT_* defines
> to the generated autoconf.h and adding CONFIG_TOOLS_LIBCRYPTO to the
> make options.
>
> Signed-off-by: Ferdinand Bachmann <ferdinand.bachmann@go-e.com>
> ---
>  package/uboot-tools/uboot-tools.mk | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/
> uboot-tools.mk
> index fa0b6aba78..99752a9b47 100644
> --- a/package/uboot-tools/uboot-tools.mk
> +++ b/package/uboot-tools/uboot-tools.mk
> @@ -31,9 +31,12 @@ define UBOOT_TOOLS_CONFIGURE_CMDS
>         echo "#include <linux/kconfig.h>" > $(@D)/include/config.h
>         touch $(@D)/include/config/auto.conf
>         mkdir -p $(@D)/include/generated
> +       touch $(@D)/include/generated/autoconf.h
>         $(if
> $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),$(UBOOT_TOOLS_ENABLE_HASH_ALGOS))
>         $(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),echo '#define
> CONFIG_TOOLS_FIT_PRINT 1' >> $(@D)/include/generated/autoconf.h)
> -       echo $(if
> $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),'#define
> CONFIG_FIT_SIGNATURE 1') >> $(@D)/include/generated/autoconf.h
> +       $(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo
> '#define CONFIG_TOOLS_FIT_SIGNATURE 1' >>
> $(@D)/include/generated/autoconf.h)
> +       $(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo
> '#define CONFIG_TOOLS_FIT_SIGNATURE_MAX_SIZE 0x10000000' >>
> $(@D)/include/generated/autoconf.h)
> +       $(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo
> '#define CONFIG_TOOLS_FIT_RSASSA_PSS 1' >>
> $(@D)/include/generated/autoconf.h)
>         mkdir -p $(@D)/include/asm
>         touch $(@D)/include/asm/linkage.h
>  endef
> @@ -50,7 +53,7 @@ UBOOT_TOOLS_DEPENDENCIES += dtc
>  endif
>
>  ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),y)
> -UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT_SIGNATURE=y
> CONFIG_FIT_SIGNATURE_MAX_SIZE=0x10000000
> +UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT_SIGNATURE=y
> CONFIG_FIT_SIGNATURE_MAX_SIZE=0x10000000 CONFIG_TOOLS_LIBCRYPTO=y
>  UBOOT_TOOLS_DEPENDENCIES += openssl host-pkgconf
>  endif
>
> @@ -124,9 +127,12 @@ define HOST_UBOOT_TOOLS_CONFIGURE_CMDS
>         echo "#include <linux/kconfig.h>" > $(@D)/include/config.h
>         touch $(@D)/include/config/auto.conf
>         mkdir -p $(@D)/include/generated
> +       touch $(@D)/include/generated/autoconf.h
>         $(if
> $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),$(UBOOT_TOOLS_ENABLE_HASH_ALGOS))
>         $(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),echo '#define
> CONFIG_TOOLS_FIT_PRINT 1' >> $(@D)/include/generated/autoconf.h)
> -       echo $(if
> $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),'#define
> CONFIG_FIT_SIGNATURE 1') >> $(@D)/include/generated/autoconf.h
> +       $(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo
> '#define CONFIG_TOOLS_FIT_SIGNATURE 1' >>
> $(@D)/include/generated/autoconf.h)
> +       $(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo
> '#define CONFIG_TOOLS_FIT_SIGNATURE_MAX_SIZE 0x10000000' >>
> $(@D)/include/generated/autoconf.h)
> +       $(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo
> '#define CONFIG_TOOLS_FIT_RSASSA_PSS 1' >>
> $(@D)/include/generated/autoconf.h)
>         mkdir -p $(@D)/include/asm
>         touch $(@D)/include/asm/linkage.h
>  endef
> @@ -142,7 +148,7 @@ HOST_UBOOT_TOOLS_DEPENDENCIES += host-dtc
>  endif
>
>  ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),y)
> -HOST_UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT_SIGNATURE=y
> CONFIG_FIT_SIGNATURE_MAX_SIZE=0x10000000
> +HOST_UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT_SIGNATURE=y
> CONFIG_FIT_SIGNATURE_MAX_SIZE=0x10000000 CONFIG_TOOLS_LIBCRYPTO=y
>  HOST_UBOOT_TOOLS_DEPENDENCIES += host-openssl
>  define HOST_UBOOT_TOOLS_INSTALL_FIT_CHECK_SIGN
>         $(INSTALL) -m 0755 -D $(@D)/tools/fit_check_sign
> $(HOST_DIR)/bin/fit_check_sign
> --
> 2.53.0
>
>

--000000000000520d86064e6466bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I double-checked this and it seems like this also nee=
ds `BR2_PACKAGE_OPENSSL_ENGINES=3Dy` to build correctly, since part of uboo=
t-tools seems to depend on the openssl `ENGINE_*` family of functions now w=
hen FIT_SIGNATURE support is enabled.</div><div><br></div><div>See also the=
 related GitLab work item:=C2=A0<a href=3D"https://gitlab.com/buildroot.org=
/buildroot/-/work_items/173">https://gitlab.com/buildroot.org/buildroot/-/w=
ork_items/173</a></div></div><br><div class=3D"gmail_quote gmail_quote_cont=
ainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 30 Mar 2026 at 13:57, =
Ferdinand Bachmann &lt;<a href=3D"mailto:ferdinand.bachmann@go-e.com">ferdi=
nand.bachmann@go-e.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">uboot-tools changed how the config system works for t=
ool builds, which<br>
leads to buildroot&#39;s configure cmds being wrong / incomplete.<br>
<br>
Specifically, the CONFIG_FIT_* macros are now called CONFIG_TOOLS_FIT_*,<br=
>
while the make options needed to compile FIT signature support are still<br=
>
CONFIG_FIT_*. Additionally, CONFIG_TOOLS_LIBCRYPTO is needed to link<br>
uboot-tools with FIT signature support correctly.<br>
<br>
This patch fixes the issue by adding the new CONFIG_TOOLS_FIT_* defines<br>
to the generated autoconf.h and adding CONFIG_TOOLS_LIBCRYPTO to the<br>
make options.<br>
<br>
Signed-off-by: Ferdinand Bachmann &lt;<a href=3D"mailto:ferdinand.bachmann@=
go-e.com" target=3D"_blank">ferdinand.bachmann@go-e.com</a>&gt;<br>
---<br>
=C2=A0package/uboot-tools/<a href=3D"http://uboot-tools.mk" rel=3D"noreferr=
er" target=3D"_blank">uboot-tools.mk</a> | 14 ++++++++++----<br>
=C2=A01 file changed, 10 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/package/uboot-tools/<a href=3D"http://uboot-tools.mk" rel=3D"n=
oreferrer" target=3D"_blank">uboot-tools.mk</a> b/package/uboot-tools/<a hr=
ef=3D"http://uboot-tools.mk" rel=3D"noreferrer" target=3D"_blank">uboot-too=
ls.mk</a><br>
index fa0b6aba78..99752a9b47 100644<br>
--- a/package/uboot-tools/<a href=3D"http://uboot-tools.mk" rel=3D"noreferr=
er" target=3D"_blank">uboot-tools.mk</a><br>
+++ b/package/uboot-tools/<a href=3D"http://uboot-tools.mk" rel=3D"noreferr=
er" target=3D"_blank">uboot-tools.mk</a><br>
@@ -31,9 +31,12 @@ define UBOOT_TOOLS_CONFIGURE_CMDS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;#include &lt;linux/kconfig.h&gt;&quo=
t; &gt; $(@D)/include/config.h<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 touch $(@D)/include/config/auto.conf<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p $(@D)/include/generated<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0touch $(@D)/include/generated/autoconf.h<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),$(U=
BOOT_TOOLS_ENABLE_HASH_ALGOS))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),ech=
o &#39;#define CONFIG_TOOLS_FIT_PRINT 1&#39; &gt;&gt; $(@D)/include/generat=
ed/autoconf.h)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo $(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATU=
RE_SUPPORT),&#39;#define CONFIG_FIT_SIGNATURE 1&#39;) &gt;&gt; $(@D)/includ=
e/generated/autoconf.h<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SU=
PPORT),echo &#39;#define CONFIG_TOOLS_FIT_SIGNATURE 1&#39; &gt;&gt; $(@D)/i=
nclude/generated/autoconf.h)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SU=
PPORT),echo &#39;#define CONFIG_TOOLS_FIT_SIGNATURE_MAX_SIZE 0x10000000&#39=
; &gt;&gt; $(@D)/include/generated/autoconf.h)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SU=
PPORT),echo &#39;#define CONFIG_TOOLS_FIT_RSASSA_PSS 1&#39; &gt;&gt; $(@D)/=
include/generated/autoconf.h)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p $(@D)/include/asm<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 touch $(@D)/include/asm/linkage.h<br>
=C2=A0endef<br>
@@ -50,7 +53,7 @@ UBOOT_TOOLS_DEPENDENCIES +=3D dtc<br>
=C2=A0endif<br>
<br>
=C2=A0ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),y)<br>
-UBOOT_TOOLS_MAKE_OPTS +=3D CONFIG_FIT_SIGNATURE=3Dy CONFIG_FIT_SIGNATURE_M=
AX_SIZE=3D0x10000000<br>
+UBOOT_TOOLS_MAKE_OPTS +=3D CONFIG_FIT_SIGNATURE=3Dy CONFIG_FIT_SIGNATURE_M=
AX_SIZE=3D0x10000000 CONFIG_TOOLS_LIBCRYPTO=3Dy<br>
=C2=A0UBOOT_TOOLS_DEPENDENCIES +=3D openssl host-pkgconf<br>
=C2=A0endif<br>
<br>
@@ -124,9 +127,12 @@ define HOST_UBOOT_TOOLS_CONFIGURE_CMDS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;#include &lt;linux/kconfig.h&gt;&quo=
t; &gt; $(@D)/include/config.h<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 touch $(@D)/include/config/auto.conf<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p $(@D)/include/generated<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0touch $(@D)/include/generated/autoconf.h<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=
),$(UBOOT_TOOLS_ENABLE_HASH_ALGOS))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=
),echo &#39;#define CONFIG_TOOLS_FIT_PRINT 1&#39; &gt;&gt; $(@D)/include/ge=
nerated/autoconf.h)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo $(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SI=
GNATURE_SUPPORT),&#39;#define CONFIG_FIT_SIGNATURE 1&#39;) &gt;&gt; $(@D)/i=
nclude/generated/autoconf.h<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATU=
RE_SUPPORT),echo &#39;#define CONFIG_TOOLS_FIT_SIGNATURE 1&#39; &gt;&gt; $(=
@D)/include/generated/autoconf.h)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATU=
RE_SUPPORT),echo &#39;#define CONFIG_TOOLS_FIT_SIGNATURE_MAX_SIZE 0x1000000=
0&#39; &gt;&gt; $(@D)/include/generated/autoconf.h)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATU=
RE_SUPPORT),echo &#39;#define CONFIG_TOOLS_FIT_RSASSA_PSS 1&#39; &gt;&gt; $=
(@D)/include/generated/autoconf.h)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p $(@D)/include/asm<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 touch $(@D)/include/asm/linkage.h<br>
=C2=A0endef<br>
@@ -142,7 +148,7 @@ HOST_UBOOT_TOOLS_DEPENDENCIES +=3D host-dtc<br>
=C2=A0endif<br>
<br>
=C2=A0ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),y)<br>
-HOST_UBOOT_TOOLS_MAKE_OPTS +=3D CONFIG_FIT_SIGNATURE=3Dy CONFIG_FIT_SIGNAT=
URE_MAX_SIZE=3D0x10000000<br>
+HOST_UBOOT_TOOLS_MAKE_OPTS +=3D CONFIG_FIT_SIGNATURE=3Dy CONFIG_FIT_SIGNAT=
URE_MAX_SIZE=3D0x10000000 CONFIG_TOOLS_LIBCRYPTO=3Dy<br>
=C2=A0HOST_UBOOT_TOOLS_DEPENDENCIES +=3D host-openssl<br>
=C2=A0define HOST_UBOOT_TOOLS_INSTALL_FIT_CHECK_SIGN<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INSTALL) -m 0755 -D $(@D)/tools/fit_check_sig=
n $(HOST_DIR)/bin/fit_check_sign<br>
-- <br>
2.53.0<br>
<br>
</blockquote></div>

--000000000000520d86064e6466bf--

--===============6294940750670349561==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6294940750670349561==--
