Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66393C55167
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 09:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 227A940EA0;
	Fri, 31 Jul 2026 09:11:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bSpe752Ac5vl; Fri, 31 Jul 2026 09:11:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02B6740F1F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785489088;
	bh=EjGJ/45KX8tMaX4JtZuA7Q2nwI5QL/bOANGHJMxhb40=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g7TPFPAxaC5J0CGr7iL+ZVdcb8/xmvSsAFRnbPyxMXio39Vuf0w8zTINRsnO9UWng
	 0orvjbobdwLbvbLmgfuMfgoIjcY3US1qzPrntYV/Y+bk4TaVbcQaGdpI5Bl9NlnhKX
	 Xq3HfQphEjc1PPlHhvwb1VS56ELir70oOHl3PSZ1rzFISioJl2AfJ+2mRDIdTpc50Q
	 acSTHkFjlRgkcExclT+2UKD6bqdcyfcUOpzz2loOYSVM7fJRvXUJWkFxiLShVCaDO4
	 lSGDr30nuEm5C+3NORkXm+r6pqUe8WhpI0OD0BsDa2zOLoRy9fb5CrZ0Pd34Y3uo9v
	 E695mCSv6WGbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02B6740F1F;
	Fri, 31 Jul 2026 09:11:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6943026E
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 09:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F88B6071E
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 09:11:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 218W9urBdOIV for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 09:11:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.168.172.159;
 helo=fhigh-a8-smtp.messagingengine.com; envelope-from=mcdev@playlinux.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A2A796081B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2A796081B
Received: from fhigh-a8-smtp.messagingengine.com
 (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A2A796081B
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 09:11:24 +0000 (UTC)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 74B551400082;
 Fri, 31 Jul 2026 05:11:23 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
 by phl-compute-02.internal (MEProxy); Fri, 31 Jul 2026 05:11:23 -0400
X-ME-Sender: <xms:u2ZsaiYihs3lKa8Yr1jZCD-HKGJB7oqDjlZ8EeQOCYLkendERI6ATA>
 <xme:u2ZsagOCYU_Jq8YDeVlu1LDgCgBBubENbKraOgyQ61SJeVyCbPJPyz-YegEqrHqzP
 ckmyVGpeNCyB4L5Fl0Lt1Xojwy9al30Irqa40UK1zc2oBBQTvJuafg>
X-ME-Proxy-Cause: dmFkZTGokf55H8HCUL6phN0s4dRDu71AkSgqQoCT1O9JMVjtCw9z/WFLapCI0cDOBfCGLm
 /KrRfL+kc42vrW39V/tTJQa+xMcz0PbK4ZxaSHtz/ZqX1UgY1myWM15djaGr0KOOUorqeg
 LR9rDP8vV2gze3AiMhsna4/Jd4mOGi8hytQcYr94KPfKmv+D6qeOZWmllzx3c3Vq33qB9Q
 RpQ8z+B/m7/Cg7tkHw2IWjCEPF9GlyrRrMdEfDqvMgngzsekWo/fB9+FYrBprlYo5Jmgug
 78lxiKGSsbVuN3ohqUTIPel6GSNx0wLCamG3DxLJVkHFWyg/a9GncOYjYUqQeLbczSpDuB
 c5R8W+bZvMmoWPu9ZKs/TKDDcPCbvIZ5SMtCyCPsvP8XkxcngygOMA2wxGsmWHwsVjAVTs
 39pwmhNzXUmRbXJd/DdbG2IlnlEQHzsz+42HflJ/A8aGw+e045LyvDtQ0LYgBSgiJQN4px
 AZGveSNqVTInzCtgHQZzyi8KFPUC5tKBOxF7hhl1bzwhzuHxreBP8oKyRxPAMJ1vPe8gF5
 WlGXs3V0+O0JQhJXJisJ5h8sWSSvOxM21Ek3RTgrPrHhjpO1aoB19guoqmGA2UBUBkmxkA
 wnJSf14+f8mSGGecWN50e1mDgVfqCsqB+xk5iOhJCCHJJzACcsO/5rQywc1w
X-ME-Proxy: <xmx:u2ZsaruREkpoKlSNmgAq1pVS2YJmNF57vrNbqrLAaTLi4ilQE4Fmww>
 <xmx:u2ZsanAcJCnZJ4hgUnlMqg3zyRO_CjQChGOvX0mdbU-8GgHipzAh-A>
 <xmx:u2ZsarXJTCYoHkbxtfVi3KhuwsfoLsgK6qFH8Yc-zvrsCnjdZXU1nQ>
 <xmx:u2ZsatC1B-IL3fDy3lMjeTAQTXeyJnkDlPftgKJ51JnseCtU3DgVlg>
 <xmx:u2ZsakwqoPfhByxAUS3gjLuMPRm7qWXBz9ySeQHLJ1K8Mtf4FnGVad2a>
Feedback-ID: i0df9467b:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 3BE4B2CE03C1; Fri, 31 Jul 2026 05:11:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A4liEqwmGRok
Date: Fri, 31 Jul 2026 11:10:48 +0200
From: "Michele Comignano" <mcdev@playlinux.net>
To: "Michael Nosthoff" <buildroot@heine.tech>, buildroot@buildroot.org
Cc: "Eric Le Bihan" <eric.le.bihan.dev@free.fr>,
 "Boerge Struempfel" <boerge.struempfel@gmail.com>
Message-Id: <c6bdaabd-7cb6-4a63-b679-68884f3314f3@app.fastmail.com>
In-Reply-To: <20260722094344.153516-1-buildroot@heine.tech>
References: <20260722094344.153516-1-buildroot@heine.tech>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=playlinux.net; 
 h=cc:cc:content-type:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1785489083; x=
 1785575483; bh=hWG0IwNLjsL4H76DwSAmFzRp638xjoJnGtoibjRunKE=; b=P
 G2Zo3lI698zZBZwQRF2o0rM0LqxgSny+2NJrZak0Rh6KM/Ej68SElu1sWe3LlrpS
 Qnx7+j+6xURCYg8iHy9sznYAyKF6O+0VWxrXtYv4al4SBzT+wv/OFsRkP3FGoWti
 REzPzmJEQktd1k6OE2kTeuV9x4UhH4Nn2v5aaCLcZVozruFgk17d5luo5GsdXvgY
 6YkwhtR4mxHYff09gmwr4YF3qVygBvW40f7dpmMx5/UeDBcCWTD+B04MTFBsS5/J
 uEBDjDBXB0nzT09nBXf6tiVutLZUPFDa0jSJofGgfvsaIh5tBh0s3gSmWRaLjfF/
 10BZC7Q6ehRRLhcivSa4w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1785489083; x=1785575483; bh=hWG0IwNLjsL4H76DwSAmFzRp638xjoJnGto
 ibjRunKE=; b=oozg7njJdZlg2p3aw8KUXZP16hQjvNBb/mZcdrQInpDI/PPnkFC
 QMOHLq57K4K7oZZB5UeTKZs4VUNMjuoxm6Ulv1hddFpc+sZwxkF+JPklPp+Hy/95
 XG8kfwViqD6Z4tLuxXQBp3LjJF/dW2byBmnvFgVQJz2xZh0V/0xN5ZWfRTi+2Tm9
 NsXNTRpXinMspSFkx53BOJC4oJWlF5JpY92KdFDNDhRtYfKlvd4YQfKYvFQtzH2k
 A1ZwWqQXEO5Cif4agy+0yQEO5bDC7BY9PcQlACjpYlxNKoKqNnovMOO1DleoBXSb
 W9l7r2Pr97P+1FzCdroDd7MerVfo7equLUA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=playlinux.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=playlinux.net
 header.i=@playlinux.net header.a=rsa-sha256 header.s=fm2 header.b=PG2Zo3lI; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=oozg7njJ
Subject: Re: [Buildroot] [PATCH] package/libgpiod2: bump to version 2.3.1
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
Content-Type: multipart/mixed; boundary="===============3925339182244684620=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3925339182244684620==
Content-Type: multipart/alternative;
 boundary=1b041f5761749cd102acc2b246524c93b632855d

--1b041f5761749cd102acc2b246524c93b632855d
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Michael,

looks good and builds for me, though I couldn't test the new dbus options.

Regards,
Michele

Il Merc, 22 Lug 2026, alle ore 11:43, Michael Nosthoff via buildroot ha scritto:
> - buildsystem changed from autotools to meson
> - add option to install dbus-server and client
> 
> changelog:
> https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/NEWS?h=v2.3.1
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
> package/libgpiod2/Config.in      | 10 ++++++++++
> package/libgpiod2/libgpiod2.hash |  2 +-
> package/libgpiod2/libgpiod2.mk   | 29 ++++++++++++++++++-----------
> 3 files changed, 29 insertions(+), 12 deletions(-)
> 
> diff --git a/package/libgpiod2/Config.in b/package/libgpiod2/Config.in
> index 5a13bfc344..80b84160fd 100644
> --- a/package/libgpiod2/Config.in
> +++ b/package/libgpiod2/Config.in
> @@ -16,6 +16,16 @@ config BR2_PACKAGE_LIBGPIOD2
>  
> if BR2_PACKAGE_LIBGPIOD2
>  
> +if BR2_PACKAGE_HAS_UDEV
> +
> +config BR2_PACKAGE_LIBGPIOD2_DBUS
> + bool "install dbus-server and client"
> + select BR2_PACKAGE_LIBGUDEV
> + help
> +   Include dbus-server and client for managing GPIOs.
> +
> +endif
> +
> config BR2_PACKAGE_LIBGPIOD2_TOOLS
> bool "install tools"
> help
> diff --git a/package/libgpiod2/libgpiod2.hash b/package/libgpiod2/libgpiod2.hash
> index a12752261a..48f7c77855 100644
> --- a/package/libgpiod2/libgpiod2.hash
> +++ b/package/libgpiod2/libgpiod2.hash
> @@ -1,4 +1,4 @@
> # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
> -sha256  13207176b0eb9b3e0f02552d5f49f5a6a449343ce47416158bb484d9d3019592  libgpiod-2.2.4.tar.xz
> +sha256  e3a358a90a9204ff16f92b6f4028ed91460b1926f10589eb54b3566484650a30  libgpiod-2.3.1.tar.xz
> # Hash for license file
> sha256  f646ad5159efb51c1130a4b43c31f0759750b1e254d2acf510f368ee2e2085c3  COPYING
> diff --git a/package/libgpiod2/libgpiod2.mk b/package/libgpiod2/libgpiod2.mk
> index d83fdbd94a..d74c98684c 100644
> --- a/package/libgpiod2/libgpiod2.mk
> +++ b/package/libgpiod2/libgpiod2.mk
> @@ -6,7 +6,7 @@
>  
> # Be careful when bumping versions.
> # Dependency on kernel header versions may change.
> -LIBGPIOD2_VERSION = 2.2.4
> +LIBGPIOD2_VERSION = 2.3.1
> LIBGPIOD2_SOURCE = libgpiod-$(LIBGPIOD2_VERSION).tar.xz
> LIBGPIOD2_SITE = https://www.kernel.org/pub/software/libs/libgpiod
> LIBGPIOD2_LICENSE = LGPL-2.1+
> @@ -14,27 +14,34 @@ LIBGPIOD2_LICENSE_FILES = COPYING
> LIBGPIOD2_INSTALL_STAGING = YES
> LIBGPIOD2_DEPENDENCIES = host-pkgconf
> LIBGPIOD2_CONF_OPTS = \
> - --disable-bindings-python \
> - --disable-examples \
> - --disable-tests
> + -Dbindings-python=disabled \
> + -Dexamples=disabled \
> + -Dtests=disabled
> +
> +ifeq ($(BR2_PACKAGE_LIBGPIOD2_DBUS),y)
> +LIBGPIOD2_CONF_OPTS += -Ddbus=enabled
> +LIBGPIOD2_DEPENDENCIES += libgudev
> +else
> +LIBGPIOD2_CONF_OPTS += -Ddbus=disabled
> +endif
>  
> ifeq ($(BR2_PACKAGE_LIBGPIOD2_TOOLS),y)
> -LIBGPIOD2_CONF_OPTS += --enable-tools
> +LIBGPIOD2_CONF_OPTS += -Dtools=enabled
> else
> -LIBGPIOD2_CONF_OPTS += --disable-tools
> +LIBGPIOD2_CONF_OPTS += -Dtools=disabled
> endif
>  
> ifeq ($(BR2_PACKAGE_LIBEDIT),y)
> LIBGPIOD2_DEPENDENCIES += libedit
> -LIBGPIOD2_CONF_OPTS += --enable-gpioset-interactive
> +LIBGPIOD2_CONF_OPTS += -Dgpioset-interactive=enabled
> else
> -LIBGPIOD2_CONF_OPTS += --disable-gpioset-interactive
> +LIBGPIOD2_CONF_OPTS += -Dgpioset-interactive=disabled
> endif
>  
> ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
> -LIBGPIOD2_CONF_OPTS += --enable-bindings-cxx
> +LIBGPIOD2_CONF_OPTS += -Dbindings-cxx=enabled
> else
> -LIBGPIOD2_CONF_OPTS += --disable-bindings-cxx
> +LIBGPIOD2_CONF_OPTS += -Dbindings-cxx=disabled
> endif
>  
> -$(eval $(autotools-package))
> +$(eval $(meson-package))
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 

--1b041f5761749cd102acc2b246524c93b632855d
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title></head><body><div>Hi Michael,<=
/div><div><br></div><div>looks good and builds for me, though I couldn't=
 test the new dbus options.</div><div><br></div><div>Regards,</div><div>=
Michele</div><div><br></div><div>Il Merc, 22 Lug 2026, alle ore 11:43, M=
ichael Nosthoff via buildroot ha scritto:</div><blockquote type=3D"cite"=
 id=3D"qt" style=3D""><div>- buildsystem changed from autotools to meson=
</div><div>- add option to install dbus-server and client</div><div><br>=
</div><div>changelog:</div><div><a href=3D"https://git.kernel.org/pub/sc=
m/libs/libgpiod/libgpiod.git/tree/NEWS?h=3Dv2.3.1">https://git.kernel.or=
g/pub/scm/libs/libgpiod/libgpiod.git/tree/NEWS?h=3Dv2.3.1</a></div><div>=
<br></div><div>Signed-off-by: Michael Nosthoff &lt;<a href=3D"mailto:bui=
ldroot@heine.tech">buildroot@heine.tech</a>&gt;</div><div>---</div><div>=
package/libgpiod2/Config.in&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 10 +++++++++=
+</div><div>package/libgpiod2/libgpiod2.hash |&nbsp; 2 +-</div><div>pack=
age/libgpiod2/libgpiod2.mk&nbsp;&nbsp; | 29 ++++++++++++++++++----------=
-</div><div>3 files changed, 29 insertions(+), 12 deletions(-)</div><div=
><br></div><div>diff --git a/package/libgpiod2/Config.in b/package/libgp=
iod2/Config.in</div><div>index 5a13bfc344..80b84160fd 100644</div><div>-=
-- a/package/libgpiod2/Config.in</div><div>+++ b/package/libgpiod2/Confi=
g.in</div><div>@@ -16,6 +16,16 @@ config BR2_PACKAGE_LIBGPIOD2</div><div=
>&nbsp;</div><div>if BR2_PACKAGE_LIBGPIOD2</div><div>&nbsp;</div><div>+i=
f BR2_PACKAGE_HAS_UDEV</div><div>+</div><div>+config BR2_PACKAGE_LIBGPIO=
D2_DBUS</div><div>+	bool "install dbus-server and client"</div><div>+	se=
lect BR2_PACKAGE_LIBGUDEV</div><div>+	help</div><div>+	&nbsp; Include db=
us-server and client for managing GPIOs.</div><div>+</div><div>+endif</d=
iv><div>+</div><div>config BR2_PACKAGE_LIBGPIOD2_TOOLS</div><div>bool "i=
nstall tools"</div><div>help</div><div>diff --git a/package/libgpiod2/li=
bgpiod2.hash b/package/libgpiod2/libgpiod2.hash</div><div>index a1275226=
1a..48f7c77855 100644</div><div>--- a/package/libgpiod2/libgpiod2.hash</=
div><div>+++ b/package/libgpiod2/libgpiod2.hash</div><div>@@ -1,4 +1,4 @=
@</div><div># From&nbsp;<a href=3D"https://www.kernel.org/pub/software/l=
ibs/libgpiod/sha256sums.asc">https://www.kernel.org/pub/software/libs/li=
bgpiod/sha256sums.asc</a></div><div>-sha256&nbsp; 13207176b0eb9b3e0f0255=
2d5f49f5a6a449343ce47416158bb484d9d3019592&nbsp; libgpiod-2.2.4.tar.xz</=
div><div>+sha256&nbsp; e3a358a90a9204ff16f92b6f4028ed91460b1926f10589eb5=
4b3566484650a30&nbsp; libgpiod-2.3.1.tar.xz</div><div># Hash for license=
 file</div><div>sha256&nbsp; f646ad5159efb51c1130a4b43c31f0759750b1e254d=
2acf510f368ee2e2085c3&nbsp; COPYING</div><div>diff --git a/package/libgp=
iod2/libgpiod2.mk b/package/libgpiod2/libgpiod2.mk</div><div>index d83fd=
bd94a..d74c98684c 100644</div><div>--- a/package/libgpiod2/libgpiod2.mk<=
/div><div>+++ b/package/libgpiod2/libgpiod2.mk</div><div>@@ -6,7 +6,7 @@=
</div><div>&nbsp;</div><div># Be careful when bumping versions.</div><di=
v># Dependency on kernel header versions may change.</div><div>-LIBGPIOD=
2_VERSION =3D 2.2.4</div><div>+LIBGPIOD2_VERSION =3D 2.3.1</div><div>LIB=
GPIOD2_SOURCE =3D libgpiod-$(LIBGPIOD2_VERSION).tar.xz</div><div>LIBGPIO=
D2_SITE =3D&nbsp;<a href=3D"https://www.kernel.org/pub/software/libs/lib=
gpiod">https://www.kernel.org/pub/software/libs/libgpiod</a></div><div>L=
IBGPIOD2_LICENSE =3D LGPL-2.1+</div><div>@@ -14,27 +14,34 @@ LIBGPIOD2_L=
ICENSE_FILES =3D COPYING</div><div>LIBGPIOD2_INSTALL_STAGING =3D YES</di=
v><div>LIBGPIOD2_DEPENDENCIES =3D host-pkgconf</div><div>LIBGPIOD2_CONF_=
OPTS =3D \</div><div>-	--disable-bindings-python \</div><div>-	--disable=
-examples \</div><div>-	--disable-tests</div><div>+	-Dbindings-python=3D=
disabled \</div><div>+	-Dexamples=3Ddisabled \</div><div>+	-Dtests=3Ddis=
abled</div><div>+</div><div>+ifeq ($(BR2_PACKAGE_LIBGPIOD2_DBUS),y)</div=
><div>+LIBGPIOD2_CONF_OPTS +=3D -Ddbus=3Denabled</div><div>+LIBGPIOD2_DE=
PENDENCIES +=3D libgudev</div><div>+else</div><div>+LIBGPIOD2_CONF_OPTS =
+=3D -Ddbus=3Ddisabled</div><div>+endif</div><div>&nbsp;</div><div>ifeq =
($(BR2_PACKAGE_LIBGPIOD2_TOOLS),y)</div><div>-LIBGPIOD2_CONF_OPTS +=3D -=
-enable-tools</div><div>+LIBGPIOD2_CONF_OPTS +=3D -Dtools=3Denabled</div=
><div>else</div><div>-LIBGPIOD2_CONF_OPTS +=3D --disable-tools</div><div=
>+LIBGPIOD2_CONF_OPTS +=3D -Dtools=3Ddisabled</div><div>endif</div><div>=
&nbsp;</div><div>ifeq ($(BR2_PACKAGE_LIBEDIT),y)</div><div>LIBGPIOD2_DEP=
ENDENCIES +=3D libedit</div><div>-LIBGPIOD2_CONF_OPTS +=3D --enable-gpio=
set-interactive</div><div>+LIBGPIOD2_CONF_OPTS +=3D -Dgpioset-interactiv=
e=3Denabled</div><div>else</div><div>-LIBGPIOD2_CONF_OPTS +=3D --disable=
-gpioset-interactive</div><div>+LIBGPIOD2_CONF_OPTS +=3D -Dgpioset-inter=
active=3Ddisabled</div><div>endif</div><div>&nbsp;</div><div>ifeq ($(BR2=
_INSTALL_LIBSTDCPP),y)</div><div>-LIBGPIOD2_CONF_OPTS +=3D --enable-bind=
ings-cxx</div><div>+LIBGPIOD2_CONF_OPTS +=3D -Dbindings-cxx=3Denabled</d=
iv><div>else</div><div>-LIBGPIOD2_CONF_OPTS +=3D --disable-bindings-cxx<=
/div><div>+LIBGPIOD2_CONF_OPTS +=3D -Dbindings-cxx=3Ddisabled</div><div>=
endif</div><div>&nbsp;</div><div>-$(eval $(autotools-package))</div><div=
>+$(eval $(meson-package))</div><div>--&nbsp;</div><div>2.43.0</div><div=
><br></div><div>_______________________________________________</div><di=
v>buildroot mailing list</div><div><a href=3D"mailto:buildroot@buildroot=
.org">buildroot@buildroot.org</a></div><div><a href=3D"https://lists.bui=
ldroot.org/mailman/listinfo/buildroot">https://lists.buildroot.org/mailm=
an/listinfo/buildroot</a></div><div><br></div></blockquote><div><br></di=
v></body></html>
--1b041f5761749cd102acc2b246524c93b632855d--

--===============3925339182244684620==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3925339182244684620==--
