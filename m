Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EFACD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 15:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3ED4685668;
	Tue,  9 Jun 2026 15:11:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XdE4u7KsTizK; Tue,  9 Jun 2026 15:11:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B90A8568B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781017891;
	bh=Q4BQ+I5NCM705NJ2ko6t4VFsL2rVAkkVmuRIsAe7EWE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=muKz4GytCsgqPXqIiKyk9OkkTon0hMhdvvBL/LhVox02d7xhvxNcmmYw6gRwsH2Lu
	 pGZi1WK+kzIrKnQQP6MuWGAjjkIN0IFqz1qtivZuYpqOlCo5AD2tzeHnb1ufDThGK9
	 IFEIMJfi18HrRMlHvPRAyNQCfWbkH5zkkvPb5HiG9giWKY1tp+SG4aDUGkWmgrInJU
	 6OBFrBXlzsDMJUrm09RzT5iaIMUHBmoGOhmukm5vvaXdnXFJjvAMlHYfMbLJ9zzpTz
	 7c7pBMM5koGbL/uXEeUpMbV7SpgJhlFqWDKWRieNclu/pMf0EqZyAnaS7jfjpMKzNI
	 91IQcK8h5AQRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B90A8568B;
	Tue,  9 Jun 2026 15:11:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EDA97196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 15:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 556D06F6EE
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 15:11:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lOCuBW1xpxK0 for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 15:11:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2F10A6F6D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F10A6F6D7
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2F10A6F6D7
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 15:11:25 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MG9g4-1wRRGp331A-008SSC; Tue, 09
 Jun 2026 17:11:23 +0200
Message-ID: <937bb77a-f1e1-4849-8d14-aae915f13eda@gmx.de>
Date: Tue, 9 Jun 2026 17:11:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
References: <20260527172653.547372-1-james.hilliard1@gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260527172653.547372-1-james.hilliard1@gmail.com>
X-Provags-ID: V03:K1:mpyMqiChSIxWVodNqbZLnQbAEBTg5YGOV85PBaVSnfT0vi6r0zJ
 t+YQfzHl1QhKgx9u9vlCb4E6SMKajGRxwoq8UpeJB25a4kTjlV0E7kPAxmyow7sh13LL1Wx
 lRnLCPbuDe2F2u7IzsRYX3aBykF+Po+rbrEwj1qV5iheZr2/VJ65lWFxMUhLRkrohP7J7VK
 h0tKQ1fxjLj65OkqlU18Q==
UI-OutboundReport: notjunk:1;M01:P0:MlkxSbJ9miw=;y/XwJmj2R1eg5+5c8riw0zuwvcg
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1781017884; x=1781622684; i=fiona.klute@gmx.de;
 bh=MEblXTHEiGL5tNU2wRK1m6LvRTZDLrxiQTfxnjkfgpA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=MMMikPKIsoiSgMRD0xCrDAueXzZmld6tWSXF2bX59MwW+801PqceZHn5IYuq9QJC
 0tq3byvSv8tn/4rkP8hg5KFIhgKzyyyXFY+inlZOtRqNH7HRhD8kZOwaHbIuhlWyt
 ghb4izG2Dyml1vse2o5Rx9FhJL3hz3hQEzBzB484aU7xqikWhkW5I7iIF9hEledWA
 gxgG6Zlcbg9x2c/GlayCRyEJmQ8xxbZhgF8Us2lJrKpAs9L+fkIArChqheg43Bppx
 cMmyLX0H8aCuD/8L9nPoGOk5oVWe3WYPQIKJvVykXSP9mB58tLKGBrrGTBfYUFjgO
 KjJg6HrUx7Kr+c26AA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=MMMikPKI
Subject: Re: [Buildroot] [PATCH 1/1] package/dbus: bump to version 1.16.2
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James,

thanks for the patch! Two comments/questions below.

Am 27.05.26 um 19:26 schrieb James Hilliard:
> Migrate from autotools to meson.
> 
> The COPYING file now points to separate license texts under LICENSES/
> instead of embedding them, so update DBUS_LICENSE_FILES and hashes.
> Expand DBUS_LICENSE for the AFL-2.0 dbus-arch-deps.h header and the
> bundled TCL/pycrypto-origin code used by the library.
> 
> Drop the stale optional xlib_libSM dependency: the meson build only
> checks for x11 for X11 autolaunch support.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/dbus/dbus.hash | 12 ++++--
>   package/dbus/dbus.mk   | 97 +++++++++++++++++++++++++-----------------
>   2 files changed, 67 insertions(+), 42 deletions(-)
> 
> diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
> index a06ba50ccd..fae6b796e3 100644
> --- a/package/dbus/dbus.hash
> +++ b/package/dbus/dbus.hash
> @@ -1,7 +1,13 @@
>   # Locally calculated after checking pgp signature
> -# https://dbus.freedesktop.org/releases/dbus/dbus-1.14.10.tar.xz.asc
> +# https://dbus.freedesktop.org/releases/dbus/dbus-1.16.2.tar.xz.asc
>   # using key 36EC5A6448A4F5EF79BEFE98E05AE1478F814C4F
> -sha256  ba1f21d2bd9d339da2d4aa8780c09df32fea87998b73da24f49ab9df1e36a50f  dbus-1.14.10.tar.xz
> +sha256  0ba2a1a4b16afe7bceb2c07e9ce99a8c2c3508e5dec290dbb643384bd6beb7e2  dbus-1.16.2.tar.xz
>   
>   # Locally calculated
> -sha256  e61807cd1c32ff4e7bd5b4b61dd21997c6dc5642cf19316124fe38d50e1f9fa3  COPYING
> +sha256  150e5d08e1cb5e62b65967d7931acad2c42d98ec1bbb584bebb01921cbc853c2  COPYING
> +sha256  7ecc7db84298adb05d2cf10339c63a5315a1c5c270a68d97d7d40a53b508ccde  LICENSES/AFL-2.0.txt
> +sha256  93bb4f7417aa775bab9026cc3d0af28aeb64451fc5a8ec651876785edd8eaf9b  LICENSES/AFL-2.1.txt
> +sha256  aaf135472f81c5b4a0dca9367e5bb5e9750032b5bebe5442b36e4c0a47430df3  LICENSES/GPL-2.0-or-later.txt
> +sha256  2cb8f4f410f0ffc5dcfbadd188e20c859fdbb161e616cf2f3d34dfbf8c740547  LICENSES/LicenseRef-pycrypto-orig.txt
> +sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
> +sha256  36fc2d8a56a2a014ded51e298a7e63635eb4ec62e8bedb99c82b892542ac5e7d  LICENSES/TCL.txt
> diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
> index 7b97c7604d..d34cc3e53e 100644
> --- a/package/dbus/dbus.mk
> +++ b/package/dbus/dbus.mk
> @@ -6,11 +6,22 @@
>   
>   # When updating dbus, check if there are changes in session.conf and
>   # system.conf, and update the versions in the dbus-broker package accordingly.
> -DBUS_VERSION = 1.14.10
> +DBUS_VERSION = 1.16.2
>   DBUS_SOURCE = dbus-$(DBUS_VERSION).tar.xz
>   DBUS_SITE = https://dbus.freedesktop.org/releases/dbus
> -DBUS_LICENSE = AFL-2.1 or GPL-2.0+ (library, tools), GPL-2.0+ (tools)
> -DBUS_LICENSE_FILES = COPYING
> +DBUS_LICENSE = \
> +	AFL-2.0 or GPL-2.0+ (dbus-arch-deps.h), \

dbus-arch-deps.h doesn't exist in the source, I guess you mean 
dbus/dbus-arch-deps.h.in?

In some packages with different licenses per source file we have those 
sources included in $(PKG)_LICENSE, but I'm not sure if that's practical 
here with a lot of files with different licenses.

> +	AFL-2.1 or GPL-2.0+ (library, daemon, some tools), \
> +	GPL-2.0+ (some tools), MIT (some files), \
> +	Public Domain (dbus-sha), TCL (dbus-hash)
> +DBUS_LICENSE_FILES = \
> +	COPYING \
> +	LICENSES/AFL-2.0.txt \
> +	LICENSES/AFL-2.1.txt \
> +	LICENSES/GPL-2.0-or-later.txt \
> +	LICENSES/LicenseRef-pycrypto-orig.txt \
> +	LICENSES/MIT.txt \
> +	LICENSES/TCL.txt
>   DBUS_CPE_ID_VENDOR = freedesktop
>   DBUS_INSTALL_STAGING = YES
>   
> @@ -27,56 +38,56 @@ DBUS_DEPENDENCIES = host-pkgconf expat
>   DBUS_SELINUX_MODULES = dbus
>   
>   DBUS_CONF_OPTS = \
> -	--with-dbus-user=dbus \
> -	--disable-tests \
> -	--disable-asserts \
> -	--disable-xml-docs \
> -	--disable-doxygen-docs \
> -	--with-system-socket=/run/dbus/system_bus_socket \
> -	--with-system-pid-file=/run/dbus-daemon.pid \
> -	--with-session-socket-dir=/tmp \
> -	--runstatedir=/run
> -
> -ifeq ($(BR2_STATIC_LIBS),y)
> -DBUS_CONF_OPTS += LIBS='-pthread'
> -endif
> +	-Dapparmor=disabled \
> +	-Dasserts=false \
> +	-Ddbus_user=dbus \
> +	-Ddoxygen_docs=disabled \
> +	-Dducktype_docs=disabled \
> +	-Dinstalled_tests=false \
> +	-Dintrusive_tests=false \
> +	-Dlaunchd=disabled \
> +	-Dmodular_tests=disabled \
> +	-Dqt_help=disabled \
> +	-Druntime_dir=/run \
> +	-Dsession_socket_dir=/tmp \
> +	-Dsystem_pid_file=/run/dbus-daemon.pid \
> +	-Dsystem_socket=/run/dbus/system_bus_socket \
> +	-Duser_session=false \

 From what I can see in the code, this flag disables installing 
service/socket units for user sessions. Isn't that something people 
using systemd might want (or at least some of them, depending on what 
they do in user sessions)?

Best regards,
Fiona

> +	-Dxml_docs=disabled
>   
>   ifeq ($(BR2_microblaze),y)
>   # microblaze toolchain doesn't provide inotify_rm_* but does have sys/inotify.h
> -DBUS_CONF_OPTS += --disable-inotify
> +DBUS_CONF_OPTS += -Dinotify=disabled
>   endif
>   
>   ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
> -DBUS_CONF_OPTS += --enable-selinux
> +DBUS_CONF_OPTS += -Dselinux=enabled
>   DBUS_DEPENDENCIES += libselinux
>   else
> -DBUS_CONF_OPTS += --disable-selinux
> +DBUS_CONF_OPTS += -Dselinux=disabled
>   endif
>   
>   ifeq ($(BR2_PACKAGE_AUDIT)$(BR2_PACKAGE_LIBCAP_NG),yy)
> -DBUS_CONF_OPTS += --enable-libaudit
> +DBUS_CONF_OPTS += -Dlibaudit=enabled
>   DBUS_DEPENDENCIES += audit libcap-ng
>   else
> -DBUS_CONF_OPTS += --disable-libaudit
> +DBUS_CONF_OPTS += -Dlibaudit=disabled
>   endif
>   
>   ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
> -DBUS_CONF_OPTS += --with-x
> +DBUS_CONF_OPTS += -Dx11_autolaunch=enabled
>   DBUS_DEPENDENCIES += xlib_libX11
> -ifeq ($(BR2_PACKAGE_XLIB_LIBSM),y)
> -DBUS_DEPENDENCIES += xlib_libSM
> -endif
>   else
> -DBUS_CONF_OPTS += --without-x
> +DBUS_CONF_OPTS += -Dx11_autolaunch=disabled
>   endif
>   
>   ifeq ($(BR2_INIT_SYSTEMD),y)
>   DBUS_CONF_OPTS += \
> -	--enable-systemd \
> -	--with-systemdsystemunitdir=/usr/lib/systemd/system
> +	-Dsystemd=enabled \
> +	-Dsystemd_system_unitdir=/usr/lib/systemd/system
>   DBUS_DEPENDENCIES += systemd
>   else
> -DBUS_CONF_OPTS += --disable-systemd
> +DBUS_CONF_OPTS += -Dsystemd=disabled
>   endif
>   
>   # fix rebuild (dbus makefile errors out if /var/lib/dbus is a symlink)
> @@ -122,14 +133,22 @@ endef
>   
>   HOST_DBUS_DEPENDENCIES = host-pkgconf host-expat
>   HOST_DBUS_CONF_OPTS = \
> -	--with-dbus-user=dbus \
> -	--disable-tests \
> -	--disable-asserts \
> -	--disable-selinux \
> -	--disable-xml-docs \
> -	--disable-doxygen-docs \
> -	--disable-systemd \
> -	--without-x
> +	-Dapparmor=disabled \
> +	-Dasserts=false \
> +	-Ddbus_user=dbus \
> +	-Ddoxygen_docs=disabled \
> +	-Dducktype_docs=disabled \
> +	-Dinstalled_tests=false \
> +	-Dintrusive_tests=false \
> +	-Dlaunchd=disabled \
> +	-Dlibaudit=disabled \
> +	-Dmodular_tests=disabled \
> +	-Dqt_help=disabled \
> +	-Dselinux=disabled \
> +	-Dsystemd=disabled \
> +	-Duser_session=false \
> +	-Dx11_autolaunch=disabled \
> +	-Dxml_docs=disabled
>   
>   # dbus for the host
>   DBUS_HOST_INTROSPECT = $(HOST_DBUS_DIR)/introspect.xml
> @@ -139,5 +158,5 @@ HOST_DBUS_GEN_INTROSPECT = \
>   
>   HOST_DBUS_POST_INSTALL_HOOKS += HOST_DBUS_GEN_INTROSPECT
>   
> -$(eval $(autotools-package))
> -$(eval $(host-autotools-package))
> +$(eval $(meson-package))
> +$(eval $(host-meson-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
