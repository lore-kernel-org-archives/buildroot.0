Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89DCC02183
	for <buildroot@archiver.kernel.org>; Thu, 16 Jan 2025 16:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D98C6113E;
	Thu, 16 Jan 2025 16:35:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r8TA41e6L3gX; Thu, 16 Jan 2025 16:35:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A41D060E44
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A41D060E44;
	Thu, 16 Jan 2025 16:35:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ACD8394B
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 16:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90E22408F2
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 16:35:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OQW5M2h84CoX for <buildroot@buildroot.org>;
 Thu, 16 Jan 2025 16:35:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::82d; helo=mail-qt1-x82d.google.com;
 envelope-from=pholden@nklabs.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A1D28402A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1D28402A7
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A1D28402A7
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 16:35:09 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-46b1d40abbdso10714591cf.2
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 08:35:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737045308; x=1737650108;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m8Y9khJUYd+2YfeaRh8Wdz/1eFdGR6JCxFGI8IGT7vo=;
 b=c0Yr46KLnoQsFAry2h5BHslc3P+D4DilxTjFNcYjmbeBpI6zIWO2WqQ2eCxD67bxKB
 p8lIjQpTL4ah2Rj9rW2KVMbYt1PeuhPavavoQcT+b4mtCnN5WCA7Gojv0khzXlidyh6e
 /U6K3pMQPp1gBGClprKRY87lp0uj8UyrkN0Ck9++3j0lWNin+/pcgMwwR1ka+nHfOUj/
 60u8/et68kBi5Bnni1iaIXep06+TnnB7dTMLuI6HO173l5W/6qdkoJ7f0JoZDu5zjSEL
 704DKY2EZ+OXt+0BRvyxyje47hm6V/WTYrDyyPkK973M7FKnFjfNIiA91UVCs0I7OcFm
 f0Kg==
X-Gm-Message-State: AOJu0YxofQteT8A5N3qefqOXpoFNoK+ZfcUfd9Txv85ebbgJsPThdndf
 BghGvCaUuTz1of/o/m+WnjqD69C7ayG1VSJYNLxO8nCb/Xd8afj67FVsImpFo9wG8TRL59HISXP
 zS5YX4vIaLupU1FFNuvH3w8JiHmxHF6mCf1Wolg==
X-Gm-Gg: ASbGncutKEdDeNoeJpF0knym75aibfp0KrAv/s/WbcqrIXAXtYNGae8IE/m/6nGSAmn
 KQ7IDQHZgeEuk04VCI0YRQ/3yUOuzml6eJRahPx0jiASHy7RvVWz17iCtk+5mnplC149B
X-Google-Smtp-Source: AGHT+IG5P2wM7EqfqSlRBXk1X4/5gV+tIfVjnHkSzPJbmTN7KrzeWNAul4y64iI0scJibeGwZsE4NZRGHAvpV9qUVuI=
X-Received: by 2002:ac8:7e91:0:b0:467:61da:1ce2 with SMTP id
 d75a77b69052e-46c7100584dmr534021111cf.16.1737045308112; Thu, 16 Jan 2025
 08:35:08 -0800 (PST)
MIME-Version: 1.0
References: <CAJ6EmCe5duhjeanDC8NPgR6CWdaUstRc5TcxWnVSBEkF2_dK3Q@mail.gmail.com>
 <CA+R_derbD_Ddd73fddoSaUri7Y+4_YWqZc-VyDjMF0dtd1_OBg@mail.gmail.com>
 <CA+R_deo_Cp-BtFUr2f7Wt0HCpzg8nNqnOzQspgRTZXgc3bCq_Q@mail.gmail.com>
 <CA+R_deow-0ETOu-RnsrNrB=HL573WKj8515yRqa5ngxo2LYr7g@mail.gmail.com>
 <CAJ6EmCcMh1HKi16b0gWeTYudz2Qqv0gDS83D_8x5FEw6Vkzvbw@mail.gmail.com>
In-Reply-To: <CAJ6EmCcMh1HKi16b0gWeTYudz2Qqv0gDS83D_8x5FEw6Vkzvbw@mail.gmail.com>
From: Patricia Holden <pholden@nklabs.com>
Date: Thu, 16 Jan 2025 11:34:56 -0500
X-Gm-Features: AbW1kvaK0DP28Ju71SpRGmfORVNvX_rcSC4l8s9YPbTwxZdQkiAzfzLentadUBg
Message-ID: <CAJ6EmCeAXV=d94-Da-PjO36X17YhWqHKeMWyzfo-u8zvpw3vWQ@mail.gmail.com>
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nklabs.com; s=google; t=1737045308; x=1737650108; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=m8Y9khJUYd+2YfeaRh8Wdz/1eFdGR6JCxFGI8IGT7vo=;
 b=WYqGIAoZNHbZdLXluxrvQr77cdWX0M2oLpzV8pzhrPKIYiX92yL0oNhV/iF7KLk9B3
 yLPrfhl2ru2zthBcQrfIHSHrEhn0OMNv7VHHFZ3QDx9tjChI5B+U90PDtkj/oCGQElIr
 Ew5rtIC6yvjDGsoxsUzrM7xTg20xrsBlbjQOeisZyjbuv7K3EP+obz2lqzqw9fBUQQr5
 v1/J0uqOLVaJeqy0le66lHCy1e6R5wtZ1BH4XMjzPpFt7F3gGUL01U4RJEAYRpaqKqrf
 DGPJUfeqww5LWurQljO3JaDCV230dg5rB77DEWSOQRb2strne/7NvbaBa0NlArknaGtw
 bmbA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=nklabs.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=nklabs.com header.i=@nklabs.com header.a=rsa-sha256
 header.s=google header.b=WYqGIAoZ
Subject: Re: [Buildroot] Host QT6 Tools Linguistics fails to build
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
Content-Type: multipart/mixed; boundary="===============7487586577307158111=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7487586577307158111==
Content-Type: multipart/alternative; boundary="0000000000008c922a062bd560dc"

--0000000000008c922a062bd560dc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I attempted to install Clang, version 17 but am unable to find it.  Is this
an experimental version of Clang?  Do you have instructions on how to
install it for Ubuntu?

On Thu, Jan 16, 2025 at 11:29=E2=80=AFAM Patricia Holden <pholden@nklabs.co=
m> wrote:

> Our defconfig is as follows:
>
> BR2_aarch64=3Dy
> BR2_KERNEL_HEADERS_VERSION=3Dy
> BR2_DEFAULT_KERNEL_VERSION=3D"6.1.80"
> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=3Dy
> BR2_TOOLCHAIN_BUILDROOT_CXX=3Dy
> BR2_SHARED_STATIC_LIBS=3Dy
> BR2_PACKAGE_OVERRIDE_FILE=3D"$(BR2_EXTERNAL_edvo_PATH)/local.mk"
> BR2_TARGET_GENERIC_HOSTNAME=3D"edvocycler3"
> BR2_TARGET_GENERIC_ISSUE=3D"Welcome to Edvocycler3"
> BR2_INIT_SYSTEMD=3Dy
> BR2_TARGET_GENERIC_ROOT_PASSWD=3D"temp1234"
> BR2_SYSTEM_DHCP=3D"wlan0"
> BR2_SYSTEM_DEFAULT_PATH=3D"/bin:/sbin:/usr/bin:/usr/sbin"
> BR2_ROOTFS_OVERLAY=3D"$(BR2_EXTERNAL_edvo_PATH)/board/edvotek/rootfs-over=
lay"
> BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"$(BR2_EXTERNAL_edvo_PATH)/board/edvotek/p=
ost-build.sh
> "
> BR2_LINUX_KERNEL=3Dy
> BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.1.80"
> BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy
>
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D"$(BR2_EXTERNAL_edvo_PATH)/board/ed=
votek/edvo3_defconfig"
> BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
> BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT=3Dy
> BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"ti/k3-am623-edvocycler3.dtb"
> BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=3Dy
> BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=3Dy
>
> BR2_PACKAGE_BUSYBOX_CONFIG=3D"$(BR2_EXTERNAL_edvo_PATH)/board/edvotek/edv=
o3br_busybox_defconfig"
> BR2_PACKAGE_FFMPEG=3Dy
> BR2_PACKAGE_FFMPEG_SWSCALE=3Dy
> BR2_PACKAGE_BZIP2=3Dy
> BR2_PACKAGE_GZIP=3Dy
> BR2_PACKAGE_XZ=3Dy
> BR2_PACKAGE_SPIDEV_TEST=3Dy
> BR2_PACKAGE_VALGRIND=3Dy
> BR2_PACKAGE_BINUTILS=3Dy
> BR2_PACKAGE_BINUTILS_TARGET=3Dy
> BR2_PACKAGE_LIBTOOL=3Dy
> BR2_PACKAGE_E2FSPROGS=3Dy
> BR2_PACKAGE_E2FSPROGS_RESIZE2FS=3Dy
> BR2_PACKAGE_DEJAVU=3Dy
> BR2_PACKAGE_LIBERATION=3Dy
> BR2_PACKAGE_HICOLOR_ICON_THEME=3Dy
> BR2_PACKAGE_KMSCUBE=3Dy
> BR2_PACKAGE_MESA3D_DEMOS=3Dy
> BR2_PACKAGE_MESA3D=3Dy
> BR2_PACKAGE_MESA3D_OSMESA_GALLIUM=3Dy
> BR2_PACKAGE_MESA3D_OPENGL_EGL=3Dy
> BR2_PACKAGE_MESA3D_OPENGL_ES=3Dy
> BR2_PACKAGE_QT6BASE_DEFAULT_QPA=3D"linuxfb"
> BR2_PACKAGE_QT6BASE_FONTCONFIG=3Dy
> BR2_PACKAGE_QT6BASE_HARFBUZZ=3Dy
> BR2_PACKAGE_QT6BASE_JPEG=3Dy
> BR2_PACKAGE_QT6BASE_PNG=3Dy
> BR2_PACKAGE_QT6BASE_SYSLOG=3Dy
> BR2_PACKAGE_QT6CORE5COMPAT=3Dy
> BR2_PACKAGE_QT6DECLARATIVE_QUICK=3Dy
> BR2_PACKAGE_QT6LANGUAGESERVER=3Dy
> BR2_PACKAGE_QT6VIRTUALKEYBOARD=3Dy
> BR2_PACKAGE_LINUX_FIRMWARE=3Dy
> BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX=3Dy
> BR2_PACKAGE_18XX_TI_UTILS=3Dy
> BR2_PACKAGE_EVTEST=3Dy
> BR2_PACKAGE_I2C_TOOLS=3Dy
> BR2_PACKAGE_LIBMANETTE=3Dy
> BR2_PACKAGE_LSHW=3Dy
> BR2_PACKAGE_PARTED=3Dy
> BR2_PACKAGE_PICOCOM=3Dy
> BR2_PACKAGE_SPI_TOOLS=3Dy
> BR2_PACKAGE_STATSERIAL=3Dy
> BR2_PACKAGE_STM32FLASH=3Dy
> BR2_PACKAGE_SYSSTAT=3Dy
> BR2_PACKAGE_TI_UIM=3Dy
> BR2_PACKAGE_TI_UTILS=3Dy
> BR2_PACKAGE_ENSCRIPT=3Dy
> BR2_PACKAGE_LUA=3Dy
> BR2_PACKAGE_LSQLITE3=3Dy
> BR2_PACKAGE_LZLIB=3Dy
> BR2_PACKAGE_PYTHON3=3Dy
> BR2_PACKAGE_PYTHON3_SQLITE=3Dy
> BR2_PACKAGE_PYTHON_CFFI=3Dy
> BR2_PACKAGE_PYTHON_CYCLER=3Dy
> BR2_PACKAGE_PYTHON_FLASK_CORS=3Dy
> BR2_PACKAGE_PYTHON_JSONMODELS=3Dy
> BR2_PACKAGE_PYTHON_JSONSCHEMA=3Dy
> BR2_PACKAGE_PYTHON_KIWISOLVER=3Dy
> BR2_PACKAGE_PYTHON_LIBEVDEV=3Dy
> BR2_PACKAGE_PYTHON_MSGPACK=3Dy
> BR2_PACKAGE_PYTHON_NUMPY=3Dy
> BR2_PACKAGE_PYTHON_PACKAGING=3Dy
> BR2_PACKAGE_PYTHON_PILLOW=3Dy
> BR2_PACKAGE_PYTHON_PIP=3Dy
> BR2_PACKAGE_PYTHON_PYELFTOOLS=3Dy
> BR2_PACKAGE_PYTHON_PYPARSING=3Dy
> BR2_PACKAGE_PYTHON_REGEX=3Dy
> BR2_PACKAGE_PYTHON_SIMPLEJSON=3Dy
> BR2_PACKAGE_PYTHON_SPIDEV=3Dy
> BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS=3Dy
> BR2_PACKAGE_PYTHON_WRAPT=3Dy
> BR2_PACKAGE_PYTHON_ZOPE_INTERFACE=3Dy
> BR2_PACKAGE_CA_CERTIFICATES=3Dy
> BR2_PACKAGE_LIBGCRYPT=3Dy
> BR2_PACKAGE_LIBNSS=3Dy
> BR2_PACKAGE_LIBSECRET=3Dy
> BR2_PACKAGE_LEVELDB=3Dy
> BR2_PACKAGE_CAIRO_TEE=3Dy
> BR2_PACKAGE_CAIROMM=3Dy
> BR2_PACKAGE_CAIROMM1_14=3Dy
> BR2_PACKAGE_GD=3Dy
> BR2_PACKAGE_GIFLIB=3Dy
> BR2_PACKAGE_KMSXX=3Dy
> BR2_PACKAGE_KMSXX_INSTALL_TESTS=3Dy
> BR2_PACKAGE_LIBGTK3=3Dy
> BR2_PACKAGE_LIBJXL=3Dy
> BR2_PACKAGE_LIBSVG_CAIRO=3Dy
> BR2_PACKAGE_OPENJPEG=3Dy
> BR2_PACKAGE_POPPLER=3Dy
> BR2_PACKAGE_WOFF2=3Dy
> BR2_PACKAGE_LIBCEC=3Dy
> BR2_PACKAGE_LIBGPIOD=3Dy
> BR2_PACKAGE_LIBGPIOD_TOOLS=3Dy
> BR2_PACKAGE_LIBINPUT=3Dy
> BR2_PACKAGE_LIBPCIACCESS=3Dy
> BR2_PACKAGE_LIBSERIAL=3Dy
> BR2_PACKAGE_LIBSERIALPORT=3Dy
> BR2_PACKAGE_LIBUSB=3Dy
> BR2_PACKAGE_TSLIB=3Dy
> BR2_PACKAGE_BOOTSTRAP=3Dy
> BR2_PACKAGE_CHARTJS=3Dy
> BR2_PACKAGE_JSON_JAVASCRIPT=3Dy
> BR2_PACKAGE_VUEJS=3Dy
> BR2_PACKAGE_CJSON=3Dy
> BR2_PACKAGE_CJSON_UTILS=3Dy
> BR2_PACKAGE_JANSSON=3Dy
> BR2_PACKAGE_JSON_C=3Dy
> BR2_PACKAGE_JSON_FOR_MODERN_CPP=3Dy
> BR2_PACKAGE_JSON_GLIB=3Dy
> BR2_PACKAGE_JSONCPP=3Dy
> BR2_PACKAGE_LIBJSON=3Dy
> BR2_PACKAGE_LIBUCL=3Dy
> BR2_PACKAGE_LIBXMLPP=3Dy
> BR2_PACKAGE_LIBXSLT=3Dy
> BR2_PACKAGE_LIBYAML=3Dy
> BR2_PACKAGE_YAML_CPP=3Dy
> BR2_PACKAGE_LIBVPX=3Dy
> BR2_PACKAGE_GEOIP=3Dy
> BR2_PACKAGE_LIBCURL=3Dy
> BR2_PACKAGE_LIBIDN2=3Dy
> BR2_PACKAGE_LIBNDP=3Dy
> BR2_PACKAGE_LIBPCAP=3Dy
> BR2_PACKAGE_LIBSOUP3=3Dy
> BR2_PACKAGE_LIBSOUP3_SSL=3Dy
> BR2_PACKAGE_LIBVNCSERVER=3Dy
> BR2_PACKAGE_BOOST_JSON=3Dy
> BR2_PACKAGE_GLM=3Dy
> BR2_PACKAGE_GOBJECT_INTROSPECTION=3Dy
> BR2_PACKAGE_GTEST=3Dy
> BR2_PACKAGE_LIBATOMIC_OPS=3Dy
> BR2_PACKAGE_LIBSECCOMP=3Dy
> BR2_PACKAGE_LIBSOLV=3Dy
> BR2_PACKAGE_LIBUV=3Dy
> BR2_PACKAGE_LINUX_PAM=3Dy
> BR2_PACKAGE_ORC=3Dy
> BR2_PACKAGE_QHULL=3Dy
> BR2_PACKAGE_ENCHANT=3Dy
> BR2_PACKAGE_ICU=3Dy
> BR2_PACKAGE_NCURSES_WCHAR=3Dy
> BR2_PACKAGE_UTF8PROC=3Dy
> BR2_PACKAGE_SHARED_MIME_INFO=3Dy
> BR2_PACKAGE_APACHE=3Dy
> BR2_PACKAGE_AVAHI=3Dy
> BR2_PACKAGE_DHCP=3Dy
> BR2_PACKAGE_DHCP_CLIENT=3Dy
> BR2_PACKAGE_DHCPCD=3Dy
> BR2_PACKAGE_IFUPDOWN=3Dy
> BR2_PACKAGE_IPROUTE2=3Dy
> BR2_PACKAGE_IPUTILS=3Dy
> BR2_PACKAGE_IW=3Dy
> BR2_PACKAGE_IWD=3Dy
> BR2_PACKAGE_NET_TOOLS=3Dy
> BR2_PACKAGE_NTP=3Dy
> BR2_PACKAGE_NTP_NTPDATE=3Dy
> BR2_PACKAGE_NTP_NTPTIME=3Dy
> BR2_PACKAGE_OPENSSH=3Dy
> BR2_PACKAGE_PPPD=3Dy
> BR2_PACKAGE_RSYNC=3Dy
> BR2_PACKAGE_TFTPD=3Dy
> BR2_PACKAGE_WIRELESS_REGDB=3Dy
> BR2_PACKAGE_WIRELESS_TOOLS=3Dy
> BR2_PACKAGE_WPA_SUPPLICANT=3Dy
> BR2_PACKAGE_WPA_SUPPLICANT_WEXT=3Dy
> BR2_PACKAGE_WPA_SUPPLICANT_WIRED=3Dy
> BR2_PACKAGE_WPA_SUPPLICANT_IBSS_RSN=3Dy
> BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT=3Dy
> BR2_PACKAGE_WPA_SUPPLICANT_WIFI_DISPLAY=3Dy
> BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING=3Dy
> BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN=3Dy
> BR2_PACKAGE_WPA_SUPPLICANT_DEBUG_SYSLOG=3Dy
> BR2_PACKAGE_WPA_SUPPLICANT_WPS=3Dy
> BR2_PACKAGE_WPA_SUPPLICANT_WPA3=3Dy
> BR2_PACKAGE_WPA_SUPPLICANT_CLI=3Dy
> BR2_PACKAGE_WPA_SUPPLICANT_WPA_CLIENT_SO=3Dy
> BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=3Dy
> BR2_PACKAGE_WPA_SUPPLICANT_DBUS=3Dy
> BR2_PACKAGE_WPAN_TOOLS=3Dy
> BR2_PACKAGE_XINETD=3Dy
> BR2_PACKAGE_XTABLES_ADDONS=3Dy
> BR2_PACKAGE_BASH=3Dy
> BR2_PACKAGE_SUDO=3Dy
> BR2_PACKAGE_BUBBLEWRAP=3Dy
> BR2_PACKAGE_HTOP=3Dy
> BR2_PACKAGE_PROCPS_NG=3Dy
> BR2_PACKAGE_SEATD=3Dy
> BR2_PACKAGE_SEATD_DAEMON=3Dy
> BR2_PACKAGE_SYSTEMD_RFKILL=3Dy
> BR2_PACKAGE_UTIL_LINUX_BINARIES=3Dy
> BR2_PACKAGE_UTIL_LINUX_KILL=3Dy
> BR2_PACKAGE_UTIL_LINUX_RFKILL=3Dy
> BR2_PACKAGE_XDG_DBUS_PROXY=3Dy
> BR2_PACKAGE_NANO=3Dy
> BR2_TARGET_ROOTFS_TAR_GZIP=3Dy
> BR2_PACKAGE_HOST_CMAKE=3Dy
> BR2_PACKAGE_HOST_DOSFSTOOLS=3Dy
> BR2_PACKAGE_HOST_DTC=3Dy
> BR2_PACKAGE_HOST_E2FSPROGS=3Dy
> BR2_PACKAGE_HOST_GENIMAGE=3Dy
> BR2_PACKAGE_HOST_IMAGEMAGICK=3Dy
> BR2_PACKAGE_HOST_IMAGEMAGICK_XML=3Dy
> BR2_PACKAGE_HOST_KMOD_XZ=3Dy
> BR2_PACKAGE_HOST_MESON_TOOLS=3Dy
> BR2_PACKAGE_HOST_MTOOLS=3Dy
> BR2_PACKAGE_HOST_PYTHON_CYTHON=3Dy
> BR2_PACKAGE_HOST_PYTHON_GREENLET=3Dy
> BR2_PACKAGE_HOST_PYTHON_LXML=3Dy
> BR2_PACKAGE_HOST_PYTHON_PYYAML=3Dy
> BR2_PACKAGE_HOST_PYTHON_XLRD=3Dy
> BR2_PACKAGE_HOST_PYTHON3=3Dy
> BR2_PACKAGE_HOST_PYTHON3_BZIP2=3Dy
> BR2_PACKAGE_HOST_PYTHON3_XZ=3Dy
> BR2_PACKAGE_HOST_PYTHON3_SSL=3Dy
> BR2_PACKAGE_HOST_QT6TOOLS=3Dy
> BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS=3Dy
>
> I applied the patch to qt6tools.mk and still getting the same error.  I
> see in output that the compile flag is present to disable Clang.
>
> Output:
> >>> host-qt6tools 6.7.3 Extracting
> xzcat
> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024=
.11-rc1/dl/qt6tools/qttools-everywhere-src-6.7.3.tar.xz
> |
> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024=
.11-rc1/output/host/bin/tar
> --strip-components=3D1 -C
> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024=
.11-rc1/output/build/host-qt6tools-6.7.3
>   -xf -
> >>> host-qt6tools 6.7.3 Patching
> >>> host-qt6tools 6.7.3 Configuring
> (mkdir -p
> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024=
.11-rc1/output/build/host-qt6tools-6.7.3//buildroot-build
> && cd
> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024=
.11-rc1/output/build/host-qt6tools-6.7.3//buildroot-build
> && rm -f CMakeCache.txt &&
> PATH=3D"/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildr=
oot-2024.11-rc1/output/host/bin:/home/pholden/Projects/Edvotek01072025/edvo=
tek-edvocycler3/buildroot-2024.11-rc1/output/host/sbin:/home/pholden/.pyenv=
/shims:/home/pholden/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/u=
sr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin"
> PKG_CONFIG=3D"/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/=
buildroot-2024.11-rc1/output/host/bin/pkg-config"
> PKG_CONFIG_SYSROOT_DIR=3D"/"
> PKG_CONFIG_LIBDIR=3D"/home/pholden/Projects/Edvotek01072025/edvotek-edvoc=
ycler3/buildroot-2024.11-rc1/output/host/lib/pkgconfig:/home/pholden/Projec=
ts/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/sh=
are/pkgconfig"
> PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=3D1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1
>  /usr/bin/cmake
> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024=
.11-rc1/output/build/host-qt6tools-6.7.3/
> -G"Ninja"
> -DCMAKE_MAKE_PROGRAM=3D"/home/pholden/Projects/Edvotek01072025/edvotek-ed=
vocycler3/buildroot-2024.11-rc1/output/host/bin/ninja"
> -DCMAKE_INSTALL_SO_NO_EXE=3D0
> -DCMAKE_FIND_ROOT_PATH=3D"/home/pholden/Projects/Edvotek01072025/edvotek-=
edvocycler3/buildroot-2024.11-rc1/output/host"
> -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=3D"BOTH"
> -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=3D"BOTH"
> -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=3D"BOTH"
> -DCMAKE_INSTALL_PREFIX=3D"/home/pholden/Projects/Edvotek01072025/edvotek-=
edvocycler3/buildroot-2024.11-rc1/output/host"
> -DCMAKE_C_FLAGS=3D"-O2
> -I/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-20=
24.11-rc1/output/host/include"
> -DCMAKE_CXX_FLAGS=3D"-O2
> -I/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-20=
24.11-rc1/output/host/include"
> -DCMAKE_EXE_LINKER_FLAGS=3D"-L/home/pholden/Projects/Edvotek01072025/edvo=
tek-edvocycler3/buildroot-2024.11-rc1/output/host/lib
> -Wl,-rpath,/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/bui=
ldroot-2024.11-rc1/output/host/lib"
> -DCMAKE_SHARED_LINKER_FLAGS=3D"-L/home/pholden/Projects/Edvotek01072025/e=
dvotek-edvocycler3/buildroot-2024.11-rc1/output/host/lib
> -Wl,-rpath,/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/bui=
ldroot-2024.11-rc1/output/host/lib"
> -DCMAKE_C_COMPILER=3D"/usr/bin/gcc" -DCMAKE_CXX_COMPILER=3D"/usr/bin/g++"
>  -DCMAKE_C_COMPILER_LAUNCHER=3D"" -DCMAKE_CXX_COMPILER_LAUNCHER=3D""
>  -DCMAKE_COLOR_MAKEFILE=3DOFF -DBUILD_DOC=3DOFF -DBUILD_DOCS=3DOFF
> -DBUILD_EXAMPLE=3DOFF -DBUILD_EXAMPLES=3DOFF -DBUILD_TEST=3DOFF -DBUILD_T=
ESTS=3DOFF
> -DBUILD_TESTING=3DOFF -DBUILD_SHARED_LIBS=3DON  -DFEATURE_clang=3DOFF
> -DQT_BUILD_EXAMPLES=3DOFF -DQT_BUILD_TESTS=3DOFF -DFEATURE_linguist=3DOFF=
 )
> -- The CXX compiler identification is GNU 11.4.0
> -- The C compiler identification is GNU 11.4.0
> -- Detecting CXX compiler ABI info
> -- Detecting CXX compiler ABI info - done
> -- Check for working CXX compiler: /usr/bin/g++ - skipped
> -- Detecting CXX compile features
> -- Detecting CXX compile features - done
> -- Detecting C compiler ABI info
> -- Detecting C compiler ABI info - done
> -- Check for working C compiler: /usr/bin/gcc - skipped
> -- Detecting C compile features
> -- Detecting C compile features - done
> -- Looking for pthread.h
> -- Looking for pthread.h - found
> -- Performing Test CMAKE_HAVE_LIBC_PTHREAD
> -- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Success
> -- Found Threads: TRUE
> -- Performing Test HAVE_STDATOMIC
> -- Performing Test HAVE_STDATOMIC - Success
> -- Found WrapAtomic: TRUE
> -- Force setting build type to 'Release'.
> CMake Error at /usr/lib/llvm-14/lib/cmake/clang/ClangTargets.cmake:750
> (message):
>   The imported target "clangBasic" references the file
>
>      "/usr/lib/llvm-14/lib/libclangBasic.a"
>
>   but this file does not exist.  Possible reasons include:
>
>   * The file was deleted, renamed, or moved to another location.
>
>   * An install or uninstall procedure did not complete successfully.
>
>   * The installation package was faulty and contained
>
>      "/usr/lib/llvm-14/lib/cmake/clang/ClangTargets.cmake"
>
>   but not all the files it references.
>
> Call Stack (most recent call first):
>   /usr/lib/cmake/clang-14/ClangConfig.cmake:19 (include)
>   cmake/FindWrapLibClang.cmake:17 (find_package)
>
> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024=
.11-rc1/output/build/host-qt6base-6.7.3/cmake/QtFindPackageHelpers.cmake:15=
6
> (find_package)
>   configure.cmake:20 (qt_find_package)
>
> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024=
.11-rc1/output/build/host-qt6base-6.7.3/cmake/QtFeature.cmake:678
> (include)
>   src/CMakeLists.txt:18 (qt_feature_evaluate_features)
>
>
> -- Configuring incomplete, errors occurred!
> See also
> "/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-202=
4.11-rc1/output/build/host-qt6tools-6.7.3/buildroot-build/CMakeFiles/CMakeO=
utput.log".
> make[1]: *** [package/pkg-generic.mk:279:
> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024=
.11-rc1/output/build/host-qt6tools-6.7.3/.stamp_configured]
> Error 1
> make: *** [Makefile:83: _all] Error 2
>
> On Thu, Jan 16, 2025 at 8:00=E2=80=AFAM Roy Kollen Svendsen <
> roykollensvendsen@gmail.com> wrote:
>
>> Hi,
>>
>> Since I'm the root cause of the problem I sent you a patch here:
>>
>>
>> https://patchwork.ozlabs.org/project/buildroot/patch/20250116125537.5316=
66-1-roykollensvendsen@gmail.com/
>>
>> Please test if this fixes your problem add you Tested-By etc.
>>
>> Roy
>>
>> tor. 16. jan. 2025 kl. 13:17 skrev Roy Kollen Svendsen <
>> roykollensvendsen@gmail.com>:
>>
>>>
>>> qttools require at least clang 17. So we should not try to enable
>>> support unless suitable version is available.
>>>
>>> So we should set -DFEATURE_clang=3DOFF
>>>
>>> -Roy
>>>
>>>
>>> tor. 16. jan. 2025 kl. 11:23 skrev Roy Kollen Svendsen <
>>> roykollensvendsen@gmail.com>:
>>>
>>>> Hi Patricia,
>>>>
>>>> I'll take look at this as soon as I get a chance. Can you send me a
>>>> minimal config that recreate the problem?
>>>>
>>>> Thanks in advance,
>>>>
>>>> Roy
>>>>
>>>> tir. 14. jan. 2025 kl. 20:16 skrev Patricia Holden <pholden@nklabs.com
>>>> >:
>>>>
>>>>> We are using Buildroot version "2024.11-rc1.  We just turned on "Host
>>>>> Utilities->host qt6 tools->host linguistic tools".  I run make, get t=
he
>>>>> error and output below.  Is there a fix for this?  Am I missing a
>>>>> dependency I need to install on my host PC?
>>>>>
>>>>> Thanks!
>>>>> Pat
>>>>>
>>>>> make BR2_EXTERNAL=3D../edvo_br host-qt6tools
>>>>> >>> host-qt6tools 6.7.3 Configuring
>>>>> (mkdir -p
>>>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-=
2024.11-rc1/output/build/host-qt6tools-6.7.3//buildroot-build
>>>>> && cd
>>>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-=
2024.11-rc1/output/build/host-qt6tools-6.7.3//buildroot-build
>>>>> && rm -f CMakeCache.txt &&
>>>>> PATH=3D"/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/bu=
ildroot-2024.11-rc1/output/host/bin:/home/pholden/Projects/Edvotek01072025/=
edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/sbin:/home/pholden/.p=
yenv/shims:/home/pholden/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbi=
n:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin"
>>>>> PKG_CONFIG=3D"/home/pholden/Projects/Edvotek01072025/edvotek-edvocycl=
er3/buildroot-2024.11-rc1/output/host/bin/pkg-config"
>>>>> PKG_CONFIG_SYSROOT_DIR=3D"/"
>>>>> PKG_CONFIG_LIBDIR=3D"/home/pholden/Projects/Edvotek01072025/edvotek-e=
dvocycler3/buildroot-2024.11-rc1/output/host/lib/pkgconfig:/home/pholden/Pr=
ojects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/hos=
t/share/pkgconfig"
>>>>> PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=3D1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1
>>>>>  /usr/bin/cmake
>>>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-=
2024.11-rc1/output/build/host-qt6tools-6.7.3/
>>>>> -G"Ninja"
>>>>> -DCMAKE_MAKE_PROGRAM=3D"/home/pholden/Projects/Edvotek01072025/edvote=
k-edvocycler3/buildroot-2024.11-rc1/output/host/bin/ninja"
>>>>> -DCMAKE_INSTALL_SO_NO_EXE=3D0
>>>>> -DCMAKE_FIND_ROOT_PATH=3D"/home/pholden/Projects/Edvotek01072025/edvo=
tek-edvocycler3/buildroot-2024.11-rc1/output/host"
>>>>> -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=3D"BOTH"
>>>>> -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=3D"BOTH"
>>>>> -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=3D"BOTH"
>>>>> -DCMAKE_INSTALL_PREFIX=3D"/home/pholden/Projects/Edvotek01072025/edvo=
tek-edvocycler3/buildroot-2024.11-rc1/output/host"
>>>>> -DCMAKE_C_FLAGS=3D"-O2
>>>>> -I/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroo=
t-2024.11-rc1/output/host/include"
>>>>> -DCMAKE_CXX_FLAGS=3D"-O2
>>>>> -I/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroo=
t-2024.11-rc1/output/host/include"
>>>>> -DCMAKE_EXE_LINKER_FLAGS=3D"-L/home/pholden/Projects/Edvotek01072025/=
edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/lib
>>>>> -Wl,-rpath,/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3=
/buildroot-2024.11-rc1/output/host/lib"
>>>>> -DCMAKE_SHARED_LINKER_FLAGS=3D"-L/home/pholden/Projects/Edvotek010720=
25/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/lib
>>>>> -Wl,-rpath,/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3=
/buildroot-2024.11-rc1/output/host/lib"
>>>>> -DCMAKE_C_COMPILER=3D"/usr/bin/gcc" -DCMAKE_CXX_COMPILER=3D"/usr/bin/=
g++"
>>>>>  -DCMAKE_C_COMPILER_LAUNCHER=3D"" -DCMAKE_CXX_COMPILER_LAUNCHER=3D""
>>>>>  -DCMAKE_COLOR_MAKEFILE=3DOFF -DBUILD_DOC=3DOFF -DBUILD_DOCS=3DOFF
>>>>> -DBUILD_EXAMPLE=3DOFF -DBUILD_EXAMPLES=3DOFF -DBUILD_TEST=3DOFF -DBUI=
LD_TESTS=3DOFF
>>>>> -DBUILD_TESTING=3DOFF -DBUILD_SHARED_LIBS=3DON  -DQT_BUILD_EXAMPLES=
=3DOFF
>>>>> -DQT_BUILD_TESTS=3DOFF -DFEATURE_linguist=3DON )
>>>>> -- The CXX compiler identification is GNU 11.4.0
>>>>> -- The C compiler identification is GNU 11.4.0
>>>>> -- Detecting CXX compiler ABI info
>>>>> -- Detecting CXX compiler ABI info - done
>>>>> -- Check for working CXX compiler: /usr/bin/g++ - skipped
>>>>> -- Detecting CXX compile features
>>>>> -- Detecting CXX compile features - done
>>>>> -- Detecting C compiler ABI info
>>>>> -- Detecting C compiler ABI info - done
>>>>> -- Check for working C compiler: /usr/bin/gcc - skipped
>>>>> -- Detecting C compile features
>>>>> -- Detecting C compile features - done
>>>>> -- Looking for pthread.h
>>>>> -- Looking for pthread.h - found
>>>>> -- Performing Test CMAKE_HAVE_LIBC_PTHREAD
>>>>> -- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Success
>>>>> -- Found Threads: TRUE
>>>>> -- Performing Test HAVE_STDATOMIC
>>>>> -- Performing Test HAVE_STDATOMIC - Success
>>>>> -- Found WrapAtomic: TRUE
>>>>> -- Force setting build type to 'Release'.
>>>>> CMake Error at /usr/lib/llvm-14/lib/cmake/clang/ClangTargets.cmake:75=
0
>>>>> (message):
>>>>>   The imported target "clangBasic" references the file
>>>>>
>>>>>      "/usr/lib/llvm-14/lib/libclangBasic.a"
>>>>>
>>>>>   but this file does not exist.  Possible reasons include:
>>>>>
>>>>>   * The file was deleted, renamed, or moved to another location.
>>>>>
>>>>>   * An install or uninstall procedure did not complete successfully.
>>>>>
>>>>>   * The installation package was faulty and contained
>>>>>
>>>>>      "/usr/lib/llvm-14/lib/cmake/clang/ClangTargets.cmake"
>>>>>
>>>>>   but not all the files it references.
>>>>>
>>>>> Call Stack (most recent call first):
>>>>>   /usr/lib/cmake/clang-14/ClangConfig.cmake:19 (include)
>>>>>   cmake/FindWrapLibClang.cmake:17 (find_package)
>>>>>
>>>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-=
2024.11-rc1/output/build/host-qt6base-6.7.3/cmake/QtFindPackageHelpers.cmak=
e:156
>>>>> (find_package)
>>>>>   configure.cmake:20 (qt_find_package)
>>>>>
>>>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-=
2024.11-rc1/output/build/host-qt6base-6.7.3/cmake/QtFeature.cmake:678
>>>>> (include)
>>>>>   src/CMakeLists.txt:18 (qt_feature_evaluate_features)
>>>>>
>>>>>
>>>>> -- Configuring incomplete, errors occurred!
>>>>> See also
>>>>> "/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot=
-2024.11-rc1/output/build/host-qt6tools-6.7.3/buildroot-build/CMakeFiles/CM=
akeOutput.log".
>>>>> make[1]: *** [package/pkg-generic.mk:279:
>>>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-=
2024.11-rc1/output/build/host-qt6tools-6.7.3/.stamp_configured]
>>>>> Error 1
>>>>> make: *** [Makefile:83: _all] Error 2
>>>>> _______________________________________________
>>>>> buildroot mailing list
>>>>> buildroot@buildroot.org
>>>>> https://lists.buildroot.org/mailman/listinfo/buildroot
>>>>>
>>>>

--0000000000008c922a062bd560dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I attempted to install Clang, version 17 but am unable to =
find it.=C2=A0 Is this an experimental version of Clang?=C2=A0 Do you have =
instructions on how to install it for Ubuntu?</div><br><div class=3D"gmail_=
quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, =
Jan 16, 2025 at 11:29=E2=80=AFAM Patricia Holden &lt;<a href=3D"mailto:phol=
den@nklabs.com">pholden@nklabs.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Our def=
config is as follows:<div><br></div><div>BR2_aarch64=3Dy<br>BR2_KERNEL_HEAD=
ERS_VERSION=3Dy<br>BR2_DEFAULT_KERNEL_VERSION=3D&quot;6.1.80&quot;<br>BR2_P=
ACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=3Dy<br>BR2_TOOLCHAIN_BUILDROOT_CXX=3Dy=
<br>BR2_SHARED_STATIC_LIBS=3Dy<br>BR2_PACKAGE_OVERRIDE_FILE=3D&quot;$(BR2_E=
XTERNAL_edvo_PATH)/<a href=3D"http://local.mk" target=3D"_blank">local.mk</=
a>&quot;<br>BR2_TARGET_GENERIC_HOSTNAME=3D&quot;edvocycler3&quot;<br>BR2_TA=
RGET_GENERIC_ISSUE=3D&quot;Welcome to Edvocycler3&quot;<br>BR2_INIT_SYSTEMD=
=3Dy<br>BR2_TARGET_GENERIC_ROOT_PASSWD=3D&quot;temp1234&quot;<br>BR2_SYSTEM=
_DHCP=3D&quot;wlan0&quot;<br>BR2_SYSTEM_DEFAULT_PATH=3D&quot;/bin:/sbin:/us=
r/bin:/usr/sbin&quot;<br>BR2_ROOTFS_OVERLAY=3D&quot;$(BR2_EXTERNAL_edvo_PAT=
H)/board/edvotek/rootfs-overlay&quot;<br>BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&qu=
ot;$(BR2_EXTERNAL_edvo_PATH)/board/edvotek/post-build.sh &quot;<br>BR2_LINU=
X_KERNEL=3Dy<br>BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>BR2_LINUX_KERNEL_CUS=
TOM_VERSION_VALUE=3D&quot;6.1.80&quot;<br>BR2_LINUX_KERNEL_USE_CUSTOM_CONFI=
G=3Dy<br>BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D&quot;$(BR2_EXTERNAL_edvo_PA=
TH)/board/edvotek/edvo3_defconfig&quot;<br>BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy=
<br>BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT=3Dy<br>BR2_LINUX_KERNEL_INTREE_DTS_N=
AME=3D&quot;ti/k3-am623-edvocycler3.dtb&quot;<br>BR2_LINUX_KERNEL_DTB_KEEP_=
DIRNAME=3Dy<br>BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=3Dy<br>BR2_PACKAGE_BUSY=
BOX_CONFIG=3D&quot;$(BR2_EXTERNAL_edvo_PATH)/board/edvotek/edvo3br_busybox_=
defconfig&quot;<br>BR2_PACKAGE_FFMPEG=3Dy<br>BR2_PACKAGE_FFMPEG_SWSCALE=3Dy=
<br>BR2_PACKAGE_BZIP2=3Dy<br>BR2_PACKAGE_GZIP=3Dy<br>BR2_PACKAGE_XZ=3Dy<br>=
BR2_PACKAGE_SPIDEV_TEST=3Dy<br>BR2_PACKAGE_VALGRIND=3Dy<br>BR2_PACKAGE_BINU=
TILS=3Dy<br>BR2_PACKAGE_BINUTILS_TARGET=3Dy<br>BR2_PACKAGE_LIBTOOL=3Dy<br>B=
R2_PACKAGE_E2FSPROGS=3Dy<br>BR2_PACKAGE_E2FSPROGS_RESIZE2FS=3Dy<br>BR2_PACK=
AGE_DEJAVU=3Dy<br>BR2_PACKAGE_LIBERATION=3Dy<br>BR2_PACKAGE_HICOLOR_ICON_TH=
EME=3Dy<br>BR2_PACKAGE_KMSCUBE=3Dy<br>BR2_PACKAGE_MESA3D_DEMOS=3Dy<br>BR2_P=
ACKAGE_MESA3D=3Dy<br>BR2_PACKAGE_MESA3D_OSMESA_GALLIUM=3Dy<br>BR2_PACKAGE_M=
ESA3D_OPENGL_EGL=3Dy<br>BR2_PACKAGE_MESA3D_OPENGL_ES=3Dy<br>BR2_PACKAGE_QT6=
BASE_DEFAULT_QPA=3D&quot;linuxfb&quot;<br>BR2_PACKAGE_QT6BASE_FONTCONFIG=3D=
y<br>BR2_PACKAGE_QT6BASE_HARFBUZZ=3Dy<br>BR2_PACKAGE_QT6BASE_JPEG=3Dy<br>BR=
2_PACKAGE_QT6BASE_PNG=3Dy<br>BR2_PACKAGE_QT6BASE_SYSLOG=3Dy<br>BR2_PACKAGE_=
QT6CORE5COMPAT=3Dy<br>BR2_PACKAGE_QT6DECLARATIVE_QUICK=3Dy<br>BR2_PACKAGE_Q=
T6LANGUAGESERVER=3Dy<br>BR2_PACKAGE_QT6VIRTUALKEYBOARD=3Dy<br>BR2_PACKAGE_L=
INUX_FIRMWARE=3Dy<br>BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX=3Dy<br>BR2_PACKAG=
E_18XX_TI_UTILS=3Dy<br>BR2_PACKAGE_EVTEST=3Dy<br>BR2_PACKAGE_I2C_TOOLS=3Dy<=
br>BR2_PACKAGE_LIBMANETTE=3Dy<br>BR2_PACKAGE_LSHW=3Dy<br>BR2_PACKAGE_PARTED=
=3Dy<br>BR2_PACKAGE_PICOCOM=3Dy<br>BR2_PACKAGE_SPI_TOOLS=3Dy<br>BR2_PACKAGE=
_STATSERIAL=3Dy<br>BR2_PACKAGE_STM32FLASH=3Dy<br>BR2_PACKAGE_SYSSTAT=3Dy<br=
>BR2_PACKAGE_TI_UIM=3Dy<br>BR2_PACKAGE_TI_UTILS=3Dy<br>BR2_PACKAGE_ENSCRIPT=
=3Dy<br>BR2_PACKAGE_LUA=3Dy<br>BR2_PACKAGE_LSQLITE3=3Dy<br>BR2_PACKAGE_LZLI=
B=3Dy<br>BR2_PACKAGE_PYTHON3=3Dy<br>BR2_PACKAGE_PYTHON3_SQLITE=3Dy<br>BR2_P=
ACKAGE_PYTHON_CFFI=3Dy<br>BR2_PACKAGE_PYTHON_CYCLER=3Dy<br>BR2_PACKAGE_PYTH=
ON_FLASK_CORS=3Dy<br>BR2_PACKAGE_PYTHON_JSONMODELS=3Dy<br>BR2_PACKAGE_PYTHO=
N_JSONSCHEMA=3Dy<br>BR2_PACKAGE_PYTHON_KIWISOLVER=3Dy<br>BR2_PACKAGE_PYTHON=
_LIBEVDEV=3Dy<br>BR2_PACKAGE_PYTHON_MSGPACK=3Dy<br>BR2_PACKAGE_PYTHON_NUMPY=
=3Dy<br>BR2_PACKAGE_PYTHON_PACKAGING=3Dy<br>BR2_PACKAGE_PYTHON_PILLOW=3Dy<b=
r>BR2_PACKAGE_PYTHON_PIP=3Dy<br>BR2_PACKAGE_PYTHON_PYELFTOOLS=3Dy<br>BR2_PA=
CKAGE_PYTHON_PYPARSING=3Dy<br>BR2_PACKAGE_PYTHON_REGEX=3Dy<br>BR2_PACKAGE_P=
YTHON_SIMPLEJSON=3Dy<br>BR2_PACKAGE_PYTHON_SPIDEV=3Dy<br>BR2_PACKAGE_PYTHON=
_TYPING_EXTENSIONS=3Dy<br>BR2_PACKAGE_PYTHON_WRAPT=3Dy<br>BR2_PACKAGE_PYTHO=
N_ZOPE_INTERFACE=3Dy<br>BR2_PACKAGE_CA_CERTIFICATES=3Dy<br>BR2_PACKAGE_LIBG=
CRYPT=3Dy<br>BR2_PACKAGE_LIBNSS=3Dy<br>BR2_PACKAGE_LIBSECRET=3Dy<br>BR2_PAC=
KAGE_LEVELDB=3Dy<br>BR2_PACKAGE_CAIRO_TEE=3Dy<br>BR2_PACKAGE_CAIROMM=3Dy<br=
>BR2_PACKAGE_CAIROMM1_14=3Dy<br>BR2_PACKAGE_GD=3Dy<br>BR2_PACKAGE_GIFLIB=3D=
y<br>BR2_PACKAGE_KMSXX=3Dy<br>BR2_PACKAGE_KMSXX_INSTALL_TESTS=3Dy<br>BR2_PA=
CKAGE_LIBGTK3=3Dy<br>BR2_PACKAGE_LIBJXL=3Dy<br>BR2_PACKAGE_LIBSVG_CAIRO=3Dy=
<br>BR2_PACKAGE_OPENJPEG=3Dy<br>BR2_PACKAGE_POPPLER=3Dy<br>BR2_PACKAGE_WOFF=
2=3Dy<br>BR2_PACKAGE_LIBCEC=3Dy<br>BR2_PACKAGE_LIBGPIOD=3Dy<br>BR2_PACKAGE_=
LIBGPIOD_TOOLS=3Dy<br>BR2_PACKAGE_LIBINPUT=3Dy<br>BR2_PACKAGE_LIBPCIACCESS=
=3Dy<br>BR2_PACKAGE_LIBSERIAL=3Dy<br>BR2_PACKAGE_LIBSERIALPORT=3Dy<br>BR2_P=
ACKAGE_LIBUSB=3Dy<br>BR2_PACKAGE_TSLIB=3Dy<br>BR2_PACKAGE_BOOTSTRAP=3Dy<br>=
BR2_PACKAGE_CHARTJS=3Dy<br>BR2_PACKAGE_JSON_JAVASCRIPT=3Dy<br>BR2_PACKAGE_V=
UEJS=3Dy<br>BR2_PACKAGE_CJSON=3Dy<br>BR2_PACKAGE_CJSON_UTILS=3Dy<br>BR2_PAC=
KAGE_JANSSON=3Dy<br>BR2_PACKAGE_JSON_C=3Dy<br>BR2_PACKAGE_JSON_FOR_MODERN_C=
PP=3Dy<br>BR2_PACKAGE_JSON_GLIB=3Dy<br>BR2_PACKAGE_JSONCPP=3Dy<br>BR2_PACKA=
GE_LIBJSON=3Dy<br>BR2_PACKAGE_LIBUCL=3Dy<br>BR2_PACKAGE_LIBXMLPP=3Dy<br>BR2=
_PACKAGE_LIBXSLT=3Dy<br>BR2_PACKAGE_LIBYAML=3Dy<br>BR2_PACKAGE_YAML_CPP=3Dy=
<br>BR2_PACKAGE_LIBVPX=3Dy<br>BR2_PACKAGE_GEOIP=3Dy<br>BR2_PACKAGE_LIBCURL=
=3Dy<br>BR2_PACKAGE_LIBIDN2=3Dy<br>BR2_PACKAGE_LIBNDP=3Dy<br>BR2_PACKAGE_LI=
BPCAP=3Dy<br>BR2_PACKAGE_LIBSOUP3=3Dy<br>BR2_PACKAGE_LIBSOUP3_SSL=3Dy<br>BR=
2_PACKAGE_LIBVNCSERVER=3Dy<br>BR2_PACKAGE_BOOST_JSON=3Dy<br>BR2_PACKAGE_GLM=
=3Dy<br>BR2_PACKAGE_GOBJECT_INTROSPECTION=3Dy<br>BR2_PACKAGE_GTEST=3Dy<br>B=
R2_PACKAGE_LIBATOMIC_OPS=3Dy<br>BR2_PACKAGE_LIBSECCOMP=3Dy<br>BR2_PACKAGE_L=
IBSOLV=3Dy<br>BR2_PACKAGE_LIBUV=3Dy<br>BR2_PACKAGE_LINUX_PAM=3Dy<br>BR2_PAC=
KAGE_ORC=3Dy<br>BR2_PACKAGE_QHULL=3Dy<br>BR2_PACKAGE_ENCHANT=3Dy<br>BR2_PAC=
KAGE_ICU=3Dy<br>BR2_PACKAGE_NCURSES_WCHAR=3Dy<br>BR2_PACKAGE_UTF8PROC=3Dy<b=
r>BR2_PACKAGE_SHARED_MIME_INFO=3Dy<br>BR2_PACKAGE_APACHE=3Dy<br>BR2_PACKAGE=
_AVAHI=3Dy<br>BR2_PACKAGE_DHCP=3Dy<br>BR2_PACKAGE_DHCP_CLIENT=3Dy<br>BR2_PA=
CKAGE_DHCPCD=3Dy<br>BR2_PACKAGE_IFUPDOWN=3Dy<br>BR2_PACKAGE_IPROUTE2=3Dy<br=
>BR2_PACKAGE_IPUTILS=3Dy<br>BR2_PACKAGE_IW=3Dy<br>BR2_PACKAGE_IWD=3Dy<br>BR=
2_PACKAGE_NET_TOOLS=3Dy<br>BR2_PACKAGE_NTP=3Dy<br>BR2_PACKAGE_NTP_NTPDATE=
=3Dy<br>BR2_PACKAGE_NTP_NTPTIME=3Dy<br>BR2_PACKAGE_OPENSSH=3Dy<br>BR2_PACKA=
GE_PPPD=3Dy<br>BR2_PACKAGE_RSYNC=3Dy<br>BR2_PACKAGE_TFTPD=3Dy<br>BR2_PACKAG=
E_WIRELESS_REGDB=3Dy<br>BR2_PACKAGE_WIRELESS_TOOLS=3Dy<br>BR2_PACKAGE_WPA_S=
UPPLICANT=3Dy<br>BR2_PACKAGE_WPA_SUPPLICANT_WEXT=3Dy<br>BR2_PACKAGE_WPA_SUP=
PLICANT_WIRED=3Dy<br>BR2_PACKAGE_WPA_SUPPLICANT_IBSS_RSN=3Dy<br>BR2_PACKAGE=
_WPA_SUPPLICANT_AP_SUPPORT=3Dy<br>BR2_PACKAGE_WPA_SUPPLICANT_WIFI_DISPLAY=
=3Dy<br>BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING=3Dy<br>BR2_PACKAGE_WPA_S=
UPPLICANT_AUTOSCAN=3Dy<br>BR2_PACKAGE_WPA_SUPPLICANT_DEBUG_SYSLOG=3Dy<br>BR=
2_PACKAGE_WPA_SUPPLICANT_WPS=3Dy<br>BR2_PACKAGE_WPA_SUPPLICANT_WPA3=3Dy<br>=
BR2_PACKAGE_WPA_SUPPLICANT_CLI=3Dy<br>BR2_PACKAGE_WPA_SUPPLICANT_WPA_CLIENT=
_SO=3Dy<br>BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=3Dy<br>BR2_PACKAGE_WPA_SUP=
PLICANT_DBUS=3Dy<br>BR2_PACKAGE_WPAN_TOOLS=3Dy<br>BR2_PACKAGE_XINETD=3Dy<br=
>BR2_PACKAGE_XTABLES_ADDONS=3Dy<br>BR2_PACKAGE_BASH=3Dy<br>BR2_PACKAGE_SUDO=
=3Dy<br>BR2_PACKAGE_BUBBLEWRAP=3Dy<br>BR2_PACKAGE_HTOP=3Dy<br>BR2_PACKAGE_P=
ROCPS_NG=3Dy<br>BR2_PACKAGE_SEATD=3Dy<br>BR2_PACKAGE_SEATD_DAEMON=3Dy<br>BR=
2_PACKAGE_SYSTEMD_RFKILL=3Dy<br>BR2_PACKAGE_UTIL_LINUX_BINARIES=3Dy<br>BR2_=
PACKAGE_UTIL_LINUX_KILL=3Dy<br>BR2_PACKAGE_UTIL_LINUX_RFKILL=3Dy<br>BR2_PAC=
KAGE_XDG_DBUS_PROXY=3Dy<br>BR2_PACKAGE_NANO=3Dy<br>BR2_TARGET_ROOTFS_TAR_GZ=
IP=3Dy<br>BR2_PACKAGE_HOST_CMAKE=3Dy<br>BR2_PACKAGE_HOST_DOSFSTOOLS=3Dy<br>=
BR2_PACKAGE_HOST_DTC=3Dy<br>BR2_PACKAGE_HOST_E2FSPROGS=3Dy<br>BR2_PACKAGE_H=
OST_GENIMAGE=3Dy<br>BR2_PACKAGE_HOST_IMAGEMAGICK=3Dy<br>BR2_PACKAGE_HOST_IM=
AGEMAGICK_XML=3Dy<br>BR2_PACKAGE_HOST_KMOD_XZ=3Dy<br>BR2_PACKAGE_HOST_MESON=
_TOOLS=3Dy<br>BR2_PACKAGE_HOST_MTOOLS=3Dy<br>BR2_PACKAGE_HOST_PYTHON_CYTHON=
=3Dy<br>BR2_PACKAGE_HOST_PYTHON_GREENLET=3Dy<br>BR2_PACKAGE_HOST_PYTHON_LXM=
L=3Dy<br>BR2_PACKAGE_HOST_PYTHON_PYYAML=3Dy<br>BR2_PACKAGE_HOST_PYTHON_XLRD=
=3Dy<br>BR2_PACKAGE_HOST_PYTHON3=3Dy<br>BR2_PACKAGE_HOST_PYTHON3_BZIP2=3Dy<=
br>BR2_PACKAGE_HOST_PYTHON3_XZ=3Dy<br>BR2_PACKAGE_HOST_PYTHON3_SSL=3Dy<br>B=
R2_PACKAGE_HOST_QT6TOOLS=3Dy<br>BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS=3D=
y<br><br></div><div>I applied the patch to <a href=3D"http://qt6tools.mk" t=
arget=3D"_blank">qt6tools.mk</a> and still getting the same error.=C2=A0 I =
see in output that the compile flag is present to disable Clang.<div><br></=
div><div>Output:</div><div>&gt;&gt;&gt; host-qt6tools 6.7.3 Extracting<br>x=
zcat /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2=
024.11-rc1/dl/qt6tools/qttools-everywhere-src-6.7.3.tar.xz | /home/pholden/=
Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/h=
ost/bin/tar --strip-components=3D1 -C /home/pholden/Projects/Edvotek0107202=
5/edvotek-edvocycler3/buildroot-2024.11-rc1/output/build/host-qt6tools-6.7.=
3 =C2=A0 -xf -<br>&gt;&gt;&gt; host-qt6tools 6.7.3 Patching<br>&gt;&gt;&gt;=
 host-qt6tools 6.7.3 Configuring<br>(mkdir -p /home/pholden/Projects/Edvote=
k01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/build/host-qt6to=
ols-6.7.3//buildroot-build &amp;&amp; cd /home/pholden/Projects/Edvotek0107=
2025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/build/host-qt6tools-6=
.7.3//buildroot-build &amp;&amp; rm -f CMakeCache.txt &amp;&amp; PATH=3D&qu=
ot;/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-202=
4.11-rc1/output/host/bin:/home/pholden/Projects/Edvotek01072025/edvotek-edv=
ocycler3/buildroot-2024.11-rc1/output/host/sbin:/home/pholden/.pyenv/shims:=
/home/pholden/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:=
/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin&quot; PKG_CONFIG=
=3D&quot;/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildro=
ot-2024.11-rc1/output/host/bin/pkg-config&quot; PKG_CONFIG_SYSROOT_DIR=3D&q=
uot;/&quot; PKG_CONFIG_LIBDIR=3D&quot;/home/pholden/Projects/Edvotek0107202=
5/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/lib/pkgconfig:/home=
/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1=
/output/host/share/pkgconfig&quot; PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=3D1 PKG_C=
ONFIG_ALLOW_SYSTEM_LIBS=3D1 =C2=A0/usr/bin/cmake /home/pholden/Projects/Edv=
otek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/build/host-qt=
6tools-6.7.3/ -G&quot;Ninja&quot; -DCMAKE_MAKE_PROGRAM=3D&quot;/home/pholde=
n/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output=
/host/bin/ninja&quot; -DCMAKE_INSTALL_SO_NO_EXE=3D0 -DCMAKE_FIND_ROOT_PATH=
=3D&quot;/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildro=
ot-2024.11-rc1/output/host&quot; -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=3D&quo=
t;BOTH&quot; -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=3D&quot;BOTH&quot; -DCMAKE=
_FIND_ROOT_PATH_MODE_INCLUDE=3D&quot;BOTH&quot; -DCMAKE_INSTALL_PREFIX=3D&q=
uot;/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-20=
24.11-rc1/output/host&quot; -DCMAKE_C_FLAGS=3D&quot;-O2 -I/home/pholden/Pro=
jects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host=
/include&quot; -DCMAKE_CXX_FLAGS=3D&quot;-O2 -I/home/pholden/Projects/Edvot=
ek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/include&qu=
ot; -DCMAKE_EXE_LINKER_FLAGS=3D&quot;-L/home/pholden/Projects/Edvotek010720=
25/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/lib -Wl,-rpath,/ho=
me/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-r=
c1/output/host/lib&quot; -DCMAKE_SHARED_LINKER_FLAGS=3D&quot;-L/home/pholde=
n/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output=
/host/lib -Wl,-rpath,/home/pholden/Projects/Edvotek01072025/edvotek-edvocyc=
ler3/buildroot-2024.11-rc1/output/host/lib&quot; -DCMAKE_C_COMPILER=3D&quot=
;/usr/bin/gcc&quot; -DCMAKE_CXX_COMPILER=3D&quot;/usr/bin/g++&quot; =C2=A0-=
DCMAKE_C_COMPILER_LAUNCHER=3D&quot;&quot; -DCMAKE_CXX_COMPILER_LAUNCHER=3D&=
quot;&quot; =C2=A0-DCMAKE_COLOR_MAKEFILE=3DOFF -DBUILD_DOC=3DOFF -DBUILD_DO=
CS=3DOFF -DBUILD_EXAMPLE=3DOFF -DBUILD_EXAMPLES=3DOFF -DBUILD_TEST=3DOFF -D=
BUILD_TESTS=3DOFF -DBUILD_TESTING=3DOFF -DBUILD_SHARED_LIBS=3DON =C2=A0<fon=
t color=3D"#ff0000">-DFEATURE_clang=3DOFF</font> -DQT_BUILD_EXAMPLES=3DOFF =
-DQT_BUILD_TESTS=3DOFF -DFEATURE_linguist=3DOFF )<br>-- The CXX compiler id=
entification is GNU 11.4.0<br>-- The C compiler identification is GNU 11.4.=
0<br>-- Detecting CXX compiler ABI info<br>-- Detecting CXX compiler ABI in=
fo - done<br>-- Check for working CXX compiler: /usr/bin/g++ - skipped<br>-=
- Detecting CXX compile features<br>-- Detecting CXX compile features - don=
e<br>-- Detecting C compiler ABI info<br>-- Detecting C compiler ABI info -=
 done<br>-- Check for working C compiler: /usr/bin/gcc - skipped<br>-- Dete=
cting C compile features<br>-- Detecting C compile features - done<br>-- Lo=
oking for pthread.h<br>-- Looking for pthread.h - found<br>-- Performing Te=
st CMAKE_HAVE_LIBC_PTHREAD<br>-- Performing Test CMAKE_HAVE_LIBC_PTHREAD - =
Success<br>-- Found Threads: TRUE =C2=A0<br>-- Performing Test HAVE_STDATOM=
IC<br>-- Performing Test HAVE_STDATOMIC - Success<br>-- Found WrapAtomic: T=
RUE =C2=A0<br>-- Force setting build type to &#39;Release&#39;.<br>CMake Er=
ror at /usr/lib/llvm-14/lib/cmake/clang/ClangTargets.cmake:750 (message):<b=
r>=C2=A0 The imported target &quot;clangBasic&quot; references the file<br>=
<br>=C2=A0 =C2=A0 =C2=A0&quot;/usr/lib/llvm-14/lib/libclangBasic.a&quot;<br=
><br>=C2=A0 but this file does not exist.=C2=A0 Possible reasons include:<b=
r><br>=C2=A0 * The file was deleted, renamed, or moved to another location.=
<br><br>=C2=A0 * An install or uninstall procedure did not complete success=
fully.<br><br>=C2=A0 * The installation package was faulty and contained<br=
><br>=C2=A0 =C2=A0 =C2=A0&quot;/usr/lib/llvm-14/lib/cmake/clang/ClangTarget=
s.cmake&quot;<br><br>=C2=A0 but not all the files it references.<br><br>Cal=
l Stack (most recent call first):<br>=C2=A0 /usr/lib/cmake/clang-14/ClangCo=
nfig.cmake:19 (include)<br>=C2=A0 cmake/FindWrapLibClang.cmake:17 (find_pac=
kage)<br>=C2=A0 /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/=
buildroot-2024.11-rc1/output/build/host-qt6base-6.7.3/cmake/QtFindPackageHe=
lpers.cmake:156 (find_package)<br>=C2=A0 configure.cmake:20 (qt_find_packag=
e)<br>=C2=A0 /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/bui=
ldroot-2024.11-rc1/output/build/host-qt6base-6.7.3/cmake/QtFeature.cmake:67=
8 (include)<br>=C2=A0 src/CMakeLists.txt:18 (qt_feature_evaluate_features)<=
br><br><br>-- Configuring incomplete, errors occurred!<br>See also &quot;/h=
ome/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-=
rc1/output/build/host-qt6tools-6.7.3/buildroot-build/CMakeFiles/CMakeOutput=
.log&quot;.<br>make[1]: *** [package/<a href=3D"http://pkg-generic.mk:279" =
target=3D"_blank">pkg-generic.mk:279</a>: /home/pholden/Projects/Edvotek010=
72025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/build/host-qt6tools-=
6.7.3/.stamp_configured] Error 1<br>make: *** [Makefile:83: _all] Error 2<b=
r></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Jan 16, 2025 at 8:00=E2=80=AFAM Roy Kollen Svendsen=
 &lt;<a href=3D"mailto:roykollensvendsen@gmail.com" target=3D"_blank">royko=
llensvendsen@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div dir=3D"ltr"><div>Hi,</div><div><br></div><div>Si=
nce I&#39;m the root cause of the problem I sent you a patch here:<br></div=
><div><br></div><div><a href=3D"https://patchwork.ozlabs.org/project/buildr=
oot/patch/20250116125537.531666-1-roykollensvendsen@gmail.com/" target=3D"_=
blank">https://patchwork.ozlabs.org/project/buildroot/patch/20250116125537.=
531666-1-roykollensvendsen@gmail.com/</a></div><div><br></div><div>Please t=
est if this fixes your problem add you Tested-By etc.</div><div><br></div><=
div>Roy<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">tor. 16. jan. 2025 kl. 13:17 skrev Roy Kollen Svendsen &lt=
;<a href=3D"mailto:roykollensvendsen@gmail.com" target=3D"_blank">roykollen=
svendsen@gmail.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr"><div><br></div><div>qttools require at least c=
lang 17. So we should not try to enable support unless suitable version is =
available.</div><div><br></div><div>So we should set -DFEATURE_clang=3DOFF<=
/div><div><br></div><div>-Roy<br></div><br></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">tor. 16. jan. 2025 kl. 11:23 skr=
ev Roy Kollen Svendsen &lt;<a href=3D"mailto:roykollensvendsen@gmail.com" t=
arget=3D"_blank">roykollensvendsen@gmail.com</a>&gt;:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hi Patricia,</d=
iv><div><br></div><div>I&#39;ll take look at this as soon as I get a chance=
. Can you send me a minimal config that recreate the problem?</div><div><br=
></div><div>Thanks in advance,</div><div><br></div><div>Roy</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">tir. 14. j=
an. 2025 kl. 20:16 skrev Patricia Holden &lt;<a href=3D"mailto:pholden@nkla=
bs.com" target=3D"_blank">pholden@nklabs.com</a>&gt;:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">We are using Buildro=
ot version &quot;2024.11-rc1.=C2=A0 We just turned on &quot;Host Utilities-=
&gt;host qt6 tools-&gt;host linguistic tools&quot;.=C2=A0 I run make, get t=
he error and output below.=C2=A0 Is there a fix for this?=C2=A0 Am I missin=
g a dependency I need to install on my host PC?<div><br></div><div>Thanks!<=
/div><div>Pat<br><div><br></div><div>make BR2_EXTERNAL=3D../edvo_br host-qt=
6tools<br>&gt;&gt;&gt; host-qt6tools 6.7.3 Configuring<br>(mkdir -p /home/p=
holden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/o=
utput/build/host-qt6tools-6.7.3//buildroot-build &amp;&amp; cd /home/pholde=
n/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output=
/build/host-qt6tools-6.7.3//buildroot-build &amp;&amp; rm -f CMakeCache.txt=
 &amp;&amp; PATH=3D&quot;/home/pholden/Projects/Edvotek01072025/edvotek-edv=
ocycler3/buildroot-2024.11-rc1/output/host/bin:/home/pholden/Projects/Edvot=
ek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/sbin:/home=
/pholden/.pyenv/shims:/home/pholden/.pyenv/bin:/usr/local/sbin:/usr/local/b=
in:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/sna=
p/bin&quot; PKG_CONFIG=3D&quot;/home/pholden/Projects/Edvotek01072025/edvot=
ek-edvocycler3/buildroot-2024.11-rc1/output/host/bin/pkg-config&quot; PKG_C=
ONFIG_SYSROOT_DIR=3D&quot;/&quot; PKG_CONFIG_LIBDIR=3D&quot;/home/pholden/P=
rojects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/ho=
st/lib/pkgconfig:/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3=
/buildroot-2024.11-rc1/output/host/share/pkgconfig&quot; PKG_CONFIG_ALLOW_S=
YSTEM_CFLAGS=3D1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1 =C2=A0/usr/bin/cmake /hom=
e/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc=
1/output/build/host-qt6tools-6.7.3/ -G&quot;Ninja&quot; -DCMAKE_MAKE_PROGRA=
M=3D&quot;/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildr=
oot-2024.11-rc1/output/host/bin/ninja&quot; -DCMAKE_INSTALL_SO_NO_EXE=3D0 -=
DCMAKE_FIND_ROOT_PATH=3D&quot;/home/pholden/Projects/Edvotek01072025/edvote=
k-edvocycler3/buildroot-2024.11-rc1/output/host&quot; -DCMAKE_FIND_ROOT_PAT=
H_MODE_PROGRAM=3D&quot;BOTH&quot; -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=3D&qu=
ot;BOTH&quot; -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=3D&quot;BOTH&quot; -DCMAK=
E_INSTALL_PREFIX=3D&quot;/home/pholden/Projects/Edvotek01072025/edvotek-edv=
ocycler3/buildroot-2024.11-rc1/output/host&quot; -DCMAKE_C_FLAGS=3D&quot;-O=
2 -I/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-20=
24.11-rc1/output/host/include&quot; -DCMAKE_CXX_FLAGS=3D&quot;-O2 -I/home/p=
holden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/o=
utput/host/include&quot; -DCMAKE_EXE_LINKER_FLAGS=3D&quot;-L/home/pholden/P=
rojects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/ho=
st/lib -Wl,-rpath,/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler=
3/buildroot-2024.11-rc1/output/host/lib&quot; -DCMAKE_SHARED_LINKER_FLAGS=
=3D&quot;-L/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/build=
root-2024.11-rc1/output/host/lib -Wl,-rpath,/home/pholden/Projects/Edvotek0=
1072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/lib&quot; -DC=
MAKE_C_COMPILER=3D&quot;/usr/bin/gcc&quot; -DCMAKE_CXX_COMPILER=3D&quot;/us=
r/bin/g++&quot; =C2=A0-DCMAKE_C_COMPILER_LAUNCHER=3D&quot;&quot; -DCMAKE_CX=
X_COMPILER_LAUNCHER=3D&quot;&quot; =C2=A0-DCMAKE_COLOR_MAKEFILE=3DOFF -DBUI=
LD_DOC=3DOFF -DBUILD_DOCS=3DOFF -DBUILD_EXAMPLE=3DOFF -DBUILD_EXAMPLES=3DOF=
F -DBUILD_TEST=3DOFF -DBUILD_TESTS=3DOFF -DBUILD_TESTING=3DOFF -DBUILD_SHAR=
ED_LIBS=3DON =C2=A0-DQT_BUILD_EXAMPLES=3DOFF -DQT_BUILD_TESTS=3DOFF -DFEATU=
RE_linguist=3DON )<br>-- The CXX compiler identification is GNU 11.4.0<br>-=
- The C compiler identification is GNU 11.4.0<br>-- Detecting CXX compiler =
ABI info<br>-- Detecting CXX compiler ABI info - done<br>-- Check for worki=
ng CXX compiler: /usr/bin/g++ - skipped<br>-- Detecting CXX compile feature=
s<br>-- Detecting CXX compile features - done<br>-- Detecting C compiler AB=
I info<br>-- Detecting C compiler ABI info - done<br>-- Check for working C=
 compiler: /usr/bin/gcc - skipped<br>-- Detecting C compile features<br>-- =
Detecting C compile features - done<br>-- Looking for pthread.h<br>-- Looki=
ng for pthread.h - found<br>-- Performing Test CMAKE_HAVE_LIBC_PTHREAD<br>-=
- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Success<br>-- Found Threads: TR=
UE =C2=A0<br>-- Performing Test HAVE_STDATOMIC<br>-- Performing Test HAVE_S=
TDATOMIC - Success<br>-- Found WrapAtomic: TRUE =C2=A0<br>-- Force setting =
build type to &#39;Release&#39;.<br>CMake Error at /usr/lib/llvm-14/lib/cma=
ke/clang/ClangTargets.cmake:750 (message):<br>=C2=A0 The imported target &q=
uot;clangBasic&quot; references the file<br><br>=C2=A0 =C2=A0 =C2=A0&quot;/=
usr/lib/llvm-14/lib/libclangBasic.a&quot;<br><br>=C2=A0 but this file does =
not exist.=C2=A0 Possible reasons include:<br><br>=C2=A0 * The file was del=
eted, renamed, or moved to another location.<br><br>=C2=A0 * An install or =
uninstall procedure did not complete successfully.<br><br>=C2=A0 * The inst=
allation package was faulty and contained<br><br>=C2=A0 =C2=A0 =C2=A0&quot;=
/usr/lib/llvm-14/lib/cmake/clang/ClangTargets.cmake&quot;<br><br>=C2=A0 but=
 not all the files it references.<br><br>Call Stack (most recent call first=
):<br>=C2=A0 /usr/lib/cmake/clang-14/ClangConfig.cmake:19 (include)<br>=C2=
=A0 cmake/FindWrapLibClang.cmake:17 (find_package)<br>=C2=A0 /home/pholden/=
Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/b=
uild/host-qt6base-6.7.3/cmake/QtFindPackageHelpers.cmake:156 (find_package)=
<br>=C2=A0 configure.cmake:20 (qt_find_package)<br>=C2=A0 /home/pholden/Pro=
jects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/buil=
d/host-qt6base-6.7.3/cmake/QtFeature.cmake:678 (include)<br>=C2=A0 src/CMak=
eLists.txt:18 (qt_feature_evaluate_features)<br><br><br>-- Configuring inco=
mplete, errors occurred!<br>See also &quot;/home/pholden/Projects/Edvotek01=
072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/build/host-qt6tools=
-6.7.3/buildroot-build/CMakeFiles/CMakeOutput.log&quot;.<br>make[1]: *** [p=
ackage/<a href=3D"http://pkg-generic.mk:279" target=3D"_blank">pkg-generic.=
mk:279</a>: /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buil=
droot-2024.11-rc1/output/build/host-qt6tools-6.7.3/.stamp_configured] Error=
 1<br>make: *** [Makefile:83: _all] Error 2<br></div></div></div>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div>
</blockquote></div>
</blockquote></div>
</blockquote></div></div>
</blockquote></div>

--0000000000008c922a062bd560dc--

--===============7487586577307158111==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7487586577307158111==--
