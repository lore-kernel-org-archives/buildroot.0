Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7868CA9ED1
	for <buildroot@archiver.kernel.org>; Mon, 12 Oct 2026 10:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76F22605E9;
	Mon, 12 Oct 2026 10:30:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ruyDN0u4y6T1; Mon, 12 Oct 2026 10:30:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8F8C5605EF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791801012;
	b=jKjLmZ2DLwGEN/2VeuBpbGRsyxQZ2Ptd1gTo3J2xjths8utwAUOtR3qAzxcPOhRDP4gL
	 FJG7NOQ/7gBvx+Wy+tGPQ4jcFD4gvdxzdEK7qpiE2Grq2bmlwPMLxaun5p3TSS1Pymdrk
	 X8rxiKWQP1UMfQFYcAGKjXXz9aWXXzPGkS+0v4zlfcm1ODCql8tyBRsQAu0oU+yW3ACXQ
	 iL1qUwXvAVrgSov2qBla+K1DO86+zTa/vfdjIAbn9t4fJETQfjfByr4pbng4nNp8JWbDT
	 xytmDrCRPsL6c2115jynrNm9R3s7t/J/oKDr99B/TmXhNxwdQOHU0vVyKpCKZ3+kqVQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791801012;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=Aw+TCBgrCVRT7Gd08hl7DmH091unAlbXM+G6EUUuNok=;
	b=FTGwBHEjHzYMV6h0mUzDzTS1HMqLUtlFz+3qmS54sahJR4IP2Atko0D+f8GrIiW5Gkvm
	 NR4Jkhz1YmUhSBfQXcd8/Y6VOCkzymGbsyKzKZewCFKdwN/MyLRrZJbBBr3O9C9HCpOVG
	 1LHEPwdvlW0D9hU0MN3Euqnu556wv4TwmuOgamr1yOX39fQ8gOI+247lPmAMIrWuUY7oQ
	 +r9xhbU2+txrHvuqeJL9cQHVZ1khfIfmVSxLPWvhaGmcXSPEqjDMBLf1AbSNBFWoUECaC
	 Nbe5I95bfmxuEuP7+WZ8/zT6rt+j5ZzXCZD+n9D+lizCAufhc5H2RkrH4cpb9PFGXeQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791801012;
	bh=Aw+TCBgrCVRT7Gd08hl7DmH091unAlbXM+G6EUUuNok=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=p/iYlhZ9lydx7MpHABDeHZIRY9IgvHR2KhLwpIQZgxFNpsENUQXWHHdfWErIbOVWN
	 I4vlX8IrweUdTbyM/E4OLef2SaCupdER75srZ6hIs4HlcXHe8ZmIMFmE6Fmdgf6sPN
	 y4Po4XOK7/6xLu3xRFK+M2Okalr9GSt3u85Dl+qCRpa/q/Unq3vdkoIil2t6aAIRQp
	 AAjNygm0nsx+fJZvVyz325s1wi1PaL87ulJUZ3aOLM3zJSGeC5gTQTKkA0VcRtjN0+
	 WIAgFTgoNuea6h/xkPgO2+51qzZukUgaTy25ZOW2LvIj+F9fnoIfZGAYGh5ToL7sCP
	 e5084uQd65t8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F8C5605EF;
	Mon, 12 Oct 2026 10:30:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E716C9DF
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 10:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D918180C76
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 10:30:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rEBj0ZG1PYK8 for <buildroot@buildroot.org>;
 Mon, 12 Oct 2026 10:30:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1C6E680D1D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791801010;
 b=mBF/WwNFNAJGQeqMs8VsIEfBznfZ0J5mFSWUCQzwbGU0rKgbU1thhrJF6nJQ/A3RTqE7
 rOdLu7oWThEEMpNYVBQ48ToK/8/7K+m17rtoVukSjb3PyBabBTDsL7u0otntWFUeEc5Xg
 Hbdgn8DP9povMVGaxUhNdkZI7mYjuoe/3aFe2Qna9NlHe9JcWdCJeNRm4HfJTMQqXcoIU
 M/2Bbvv+4AkmHD7SzgyUkbLu/HxcNCusXpSTcge/H47pf33dBJDgLvFJAgQHtBry3c6vs
 FPD8mBHKz3VnrF07pMBn4v0hf2OuuHSMacYQdhZt6aGltqQRoi0+7kdEmQnS3DXzfOg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791801010;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=hiOee+fLZZN6o1XrtHDXxyAdUdPL/qCKpK1ZwqRuuJE=;
 b=J0CmdpfUK+YDsQ1aEq78CwlUmK1pry3ncOJP+iTg0V1wJVo9lNk23JIVAo/9lD9XR8fh
 GQHuS8GJ2VzYej4zsWY+sdaOSWaArIVIAF1BadvBUGoD/Kyj/6QYGAfPmKbeOQLkLlqj6
 6cqUA5ergr9jvYFgJVb6Lh2VXjMBYZp9D51pDtfwhwFVPDuMsDm64vd7AiCKXte/IusUn
 hhb7vlNrtNsFL7ctQWTgE+ZJQTOfu5mj4qT371dWVmlg+UarVpl/e+6I+oyy8MzYdmUy+
 09fQiFJR0485UjIhwxv9cT8516ByS0kDdP0r4UtUR5MoRoQpgfFIBz89UulXx+KMeLQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b="lCEent/P"; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C6E680D1D
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 10:30:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 11AFFB97A160; Mon, 12 Oct 2026 12:30:01 +0200 (CEST)
To: buildroot@buildroot.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
 Andrea Ricchi <andrea.ricchi@amarulasolutions.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, linux-amarula@amarulasolutions.com,
 Richard GENOUD <richard.genoud@bootlin.com>
Date: Mon, 12 Oct 2026 12:29:36 +0200
Message-ID: <179180053890.385429.8428917900918058568.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260925064257.1162394-5-dario.binacchi@amarulasolutions.com>
References: <20260925064257.1162394-5-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v6 4/6] package/pkg-qmake: support Qt6
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 25 Sep 2026 08:42:55 +0200, Dario Binacchi wrote:
> The qmake infrastructure hardcodes qt5base as the Qt provider. Select
> the Qt major version from BR2_PACKAGE_QT5, which is mutually exclusive
> with BR2_PACKAGE_QT6, and use it to pick the qt<N>base dependency, the
> QT<N>_QMAKE command and the QT<N>_QT_CONF_FIXUP hook.
>
> The header sync hook now takes the version from QT<N>_VERSION_MAJOR and
> QT<N>_VERSION instead of hardcoding 5.15.
>
> Document in the manual which Qt base package is added to the dependencies.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

 Applied to master, thanks!

 [snip]
> +# Qt5 and Qt6 are mutually exclusive
> +ifeq ($(BR2_PACKAGE_QT5),y)
> +QT_VERSION_MAJOR = 5
> +else
> +QT_VERSION_MAJOR = 6
> +endif
> +QT_BASE = qt$(QT_VERSION_MAJOR)base
> +
>  #
>  # Hook to sync Qt headers
>  #
>  define QT_HEADERS_SYNC_HOOK
> -	sed -e '/^MODULE_VERSION/s/5\.15\.[3456789]/$(QT5_VERSION)/' -i \
> +	sed -e '/^MODULE_VERSION/s/$(subst .,\.,$(QT$(QT_VERSION_MAJOR)_VERSION_MAJOR))\.[0-9]*/$(QT$(QT_VERSION_MAJOR)_VERSION)/' -i \

 This was getting way too complicated for my poor brain. So I changed it to
remove all the indirections and instead explicitly define:

ifeq ($(BR2_PACKAGE_QT5),y)
QT_VERSION_MAJOR = $(QT5_VERSION_MAJOR)
QT_VERSION = $(QT5_VERSION)
QT_BASE = qt5base
QT_QMAKE = $(QT5_QMAKE)
QT_CONF_FIXUP = QT5_QT_CONF_FIXUP
else
QT_VERSION_MAJOR = $(QT6_VERSION_MAJOR)
QT_VERSION = $(QT6_VERSION)
QT_BASE = qt6base
QT_QMAKE = $(QT6_QMAKE)
QT_CONF_FIXUP = QT6_QT_CONF_FIXUP
endif

 Regards,
 Arnout


>  		$($(PKG)_BUILDDIR)/.qmake.conf
>  	touch $($(PKG)_BUILDDIR)/.git
>  endef
> @@ -45,15 +53,15 @@ define inner-qmake-package
>  $(2)_INSTALL_STAGING_OPTS	?= install
>  $(2)_INSTALL_TARGET_OPTS	?= $$($(2)_INSTALL_STAGING_OPTS)
>  
> -ifneq ($(1),qt5base)
> -$(2)_DEPENDENCIES 		+= qt5base
> +ifneq ($(1),$(QT_BASE))
> +$(2)_DEPENDENCIES 		+= $(QT_BASE)
>  endif
>  
>  ifeq ($$($(2)_SYNC_QT_HEADERS),YES)
>  $(2)_PRE_CONFIGURE_HOOKS        += QT_HEADERS_SYNC_HOOK
>  endif
>  
> -$(2)_POST_PREPARE_HOOKS += QT5_QT_CONF_FIXUP
> +$(2)_POST_PREPARE_HOOKS += QT$(QT_VERSION_MAJOR)_QT_CONF_FIXUP
>  
>  #
>  # Configure step. Only define it if not already defined by the package
> @@ -62,7 +70,7 @@ $(2)_POST_PREPARE_HOOKS += QT5_QT_CONF_FIXUP
>  ifndef $(2)_CONFIGURE_CMDS
>  define $(2)_CONFIGURE_CMDS
>  	cd $$($(2)_BUILDDIR) && \
> -	$$(TARGET_MAKE_ENV) $$($(2)_CONF_ENV) $$(QT5_QMAKE) $$($(2)_CONF_OPTS)
> +	$$(TARGET_MAKE_ENV) $$($(2)_CONF_ENV) $$(QT$(QT_VERSION_MAJOR)_QMAKE) $$($(2)_CONF_OPTS)
>  endef
>  endif
>  
> -- 
> 2.43.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
