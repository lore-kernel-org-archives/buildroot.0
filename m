Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D83C02183
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 05:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C8A141E64;
	Fri, 17 Jan 2025 05:40:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sqITPw5p5y2S; Fri, 17 Jan 2025 05:40:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00FA2417F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00FA2417F7;
	Fri, 17 Jan 2025 05:40:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F194431
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 05:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C019B40520
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 05:40:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QPTorJCG7Fw2 for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 05:40:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 79B4B40191
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79B4B40191
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 79B4B40191
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 05:40:01 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-e5372a2fbddso2902130276.3
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 21:40:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737092400; x=1737697200;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=COBRgbRx9OVSd4GDWd0T/MBHW4NgibnHjUGFillarhk=;
 b=veiYfEQ5/d/ZVJYYd5FZOOzKT3RTOkRYyWj72nznqK0mpQ/S4iotT5RAKuvVfYxRF2
 Pe19b/MIjOpweL9rijlUdkSBD2rE9bcyOVG0BRS+5JiRy6LH41vhhqpYW29AU/++9Tnl
 /R5J5P2zHtgwVBPazdI/uRX2Z39VlCfG1bdaXEG3MkrZmEuFinRVtXMnMQs3AACoJYzL
 ModKEmbq4HWJV1UV/nRZNKFffRPA0R5owfRJp12MytrU04Xk1vUwLxhxA8Hskf1DrOgn
 A0GmICUdxfB1a+A3NLyxjBDqgJpOvGAyGFFwNaoRjwR0ciDExzLxBQ/hqTrJutL/HM8t
 j3Uw==
X-Gm-Message-State: AOJu0Yyeh5xh2RwX3vasmkZ/7No9XxfkEZ587aOnfeRdPjo93h7vapAK
 ny7586ys9xVwPMP+qAH8kwK+9xPqzHeqLySDgr/Cy8UchVGPGfNoKpVrWX9mGd/6VmZYgKel3vR
 3UyCGCD3Lv0kdayJFFrNpRpmCqhvUGA==
X-Gm-Gg: ASbGncvIR2dPVgMACVZVQ+TrOZsEJx5uBTusNue4PrYyQlqH+mQQ6eZAuP/cACsocy6
 pZl83W9sWM3TAnDB9ud5ZsrUl5XZHctH7YxAeDLk=
X-Google-Smtp-Source: AGHT+IG1MOK4cYl5k06X2PXmiLAnr9vdnh8PstpXjAXUHGkgTYZF3eWCiRZfAaiJNdBwe7zPCxYLNMdFdmcfl7TAzIc=
X-Received: by 2002:a05:6902:200e:b0:e4d:89e9:6a96 with SMTP id
 3f1490d57ef6-e57b1052cd4mr872561276.18.1737092400036; Thu, 16 Jan 2025
 21:40:00 -0800 (PST)
MIME-Version: 1.0
References: <CAJ6EmCe5duhjeanDC8NPgR6CWdaUstRc5TcxWnVSBEkF2_dK3Q@mail.gmail.com>
 <CA+R_derbD_Ddd73fddoSaUri7Y+4_YWqZc-VyDjMF0dtd1_OBg@mail.gmail.com>
 <CA+R_deo_Cp-BtFUr2f7Wt0HCpzg8nNqnOzQspgRTZXgc3bCq_Q@mail.gmail.com>
 <CA+R_deow-0ETOu-RnsrNrB=HL573WKj8515yRqa5ngxo2LYr7g@mail.gmail.com>
 <CAJ6EmCcMh1HKi16b0gWeTYudz2Qqv0gDS83D_8x5FEw6Vkzvbw@mail.gmail.com>
 <CAJ6EmCeAXV=d94-Da-PjO36X17YhWqHKeMWyzfo-u8zvpw3vWQ@mail.gmail.com>
 <CAJ6EmCeQbJ9LSY7DPiMS8h9Sgti8qHzgKni63KSRDRTHqG34aA@mail.gmail.com>
In-Reply-To: <CAJ6EmCeQbJ9LSY7DPiMS8h9Sgti8qHzgKni63KSRDRTHqG34aA@mail.gmail.com>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Fri, 17 Jan 2025 06:39:48 +0100
X-Gm-Features: AbW1kvb9XE-6ANoWKXH8dfTk8WAGj6JRDhWdHLEs3RQRFU6jiOmaOFkkSUUj9Hg
Message-ID: <CA+R_deqY7orDSBq2ORTiapbjJjNs-ZLfb7ZtKyxUvjY7GZK1hw@mail.gmail.com>
To: Patricia Holden <pholden@nklabs.com>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737092400; x=1737697200; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=COBRgbRx9OVSd4GDWd0T/MBHW4NgibnHjUGFillarhk=;
 b=IGHKjVVEfWjoiS0iSZbGT2zc5HuwSIFJjRJ4SxSc+w32gCbCpZ0kVQFtSHy+vZaTwe
 lFa/sTHxRT8wGDwEWSILrcYltetd/tH8EDTq0lPrX+xmr37NLkM2lDBUfMvZfm8qTnQm
 nzen1EDcl7P61NOxZYX74AVW768uI8qgcA49yQBS7dE35M6HiRIKETsfX17Jps0hhGvO
 VP9HYZK+DfsNnNuDjaEuPn+d+ADg9emFpltj3ihwcO2pEHF9cVgNbRMPLwBy/GGfbds1
 jnkVe/sPsWXdrV9E5fOPVu/H115JdzdVZkrww3mTmzmG1rYVKGSqcopd0ccHneId/Fw1
 gJmw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IGHKjVVE
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
Content-Type: multipart/mixed; boundary="===============5210541162698451677=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5210541162698451677==
Content-Type: multipart/alternative; boundary="000000000000724748062be057b4"

--000000000000724748062be057b4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I don't understand why the build depends on what packages are installed on
your Ubuntu workstation.

Does this make sense to you?




tor. 16. jan. 2025 kl. 18:17 skrev Patricia Holden <pholden@nklabs.com>:

> I was able to resolve the problem by installing "clang-format".  We had
> one Ubuntu workstation that was building host-qt6tools just fine and did =
a
> comparison of packages installed.  Once I installed clang-format, build
> completed no errors and ran fine on our target system.
>
> Thanks for your assistance.
>
> On Thu, Jan 16, 2025 at 11:34=E2=80=AFAM Patricia Holden <pholden@nklabs.=
com>
> wrote:
>
>> I attempted to install Clang, version 17 but am unable to find it.  Is
>> this an experimental version of Clang?  Do you have instructions on how =
to
>> install it for Ubuntu?
>>
>> On Thu, Jan 16, 2025 at 11:29=E2=80=AFAM Patricia Holden <pholden@nklabs=
.com>
>> wrote:
>>
>>> Our defconfig is as follows:
>>>
>>> BR2_aarch64=3Dy
>>> BR2_KERNEL_HEADERS_VERSION=3Dy
>>> BR2_DEFAULT_KERNEL_VERSION=3D"6.1.80"
>>> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=3Dy
>>> BR2_TOOLCHAIN_BUILDROOT_CXX=3Dy
>>> BR2_SHARED_STATIC_LIBS=3Dy
>>> BR2_PACKAGE_OVERRIDE_FILE=3D"$(BR2_EXTERNAL_edvo_PATH)/local.mk"
>>> BR2_TARGET_GENERIC_HOSTNAME=3D"edvocycler3"
>>> BR2_TARGET_GENERIC_ISSUE=3D"Welcome to Edvocycler3"
>>> BR2_INIT_SYSTEMD=3Dy
>>> BR2_TARGET_GENERIC_ROOT_PASSWD=3D"temp1234"
>>> BR2_SYSTEM_DHCP=3D"wlan0"
>>> BR2_SYSTEM_DEFAULT_PATH=3D"/bin:/sbin:/usr/bin:/usr/sbin"
>>>
>>> BR2_ROOTFS_OVERLAY=3D"$(BR2_EXTERNAL_edvo_PATH)/board/edvotek/rootfs-ov=
erlay"
>>> BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"$(BR2_EXTERNAL_edvo_PATH)/board/edvotek=
/post-build.sh
>>> "
>>> BR2_LINUX_KERNEL=3Dy
>>> BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
>>> BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.1.80"
>>> BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy
>>>
>>> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D"$(BR2_EXTERNAL_edvo_PATH)/board/=
edvotek/edvo3_defconfig"
>>> BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
>>> BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT=3Dy
>>> BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"ti/k3-am623-edvocycler3.dtb"
>>> BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=3Dy
>>> BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=3Dy
>>>
>>> BR2_PACKAGE_BUSYBOX_CONFIG=3D"$(BR2_EXTERNAL_edvo_PATH)/board/edvotek/e=
dvo3br_busybox_defconfig"
>>> BR2_PACKAGE_FFMPEG=3Dy
>>> BR2_PACKAGE_FFMPEG_SWSCALE=3Dy
>>> BR2_PACKAGE_BZIP2=3Dy
>>> BR2_PACKAGE_GZIP=3Dy
>>> BR2_PACKAGE_XZ=3Dy
>>> BR2_PACKAGE_SPIDEV_TEST=3Dy
>>> BR2_PACKAGE_VALGRIND=3Dy
>>> BR2_PACKAGE_BINUTILS=3Dy
>>> BR2_PACKAGE_BINUTILS_TARGET=3Dy
>>> BR2_PACKAGE_LIBTOOL=3Dy
>>> BR2_PACKAGE_E2FSPROGS=3Dy
>>> BR2_PACKAGE_E2FSPROGS_RESIZE2FS=3Dy
>>> BR2_PACKAGE_DEJAVU=3Dy
>>> BR2_PACKAGE_LIBERATION=3Dy
>>> BR2_PACKAGE_HICOLOR_ICON_THEME=3Dy
>>> BR2_PACKAGE_KMSCUBE=3Dy
>>> BR2_PACKAGE_MESA3D_DEMOS=3Dy
>>> BR2_PACKAGE_MESA3D=3Dy
>>> BR2_PACKAGE_MESA3D_OSMESA_GALLIUM=3Dy
>>> BR2_PACKAGE_MESA3D_OPENGL_EGL=3Dy
>>> BR2_PACKAGE_MESA3D_OPENGL_ES=3Dy
>>> BR2_PACKAGE_QT6BASE_DEFAULT_QPA=3D"linuxfb"
>>> BR2_PACKAGE_QT6BASE_FONTCONFIG=3Dy
>>> BR2_PACKAGE_QT6BASE_HARFBUZZ=3Dy
>>> BR2_PACKAGE_QT6BASE_JPEG=3Dy
>>> BR2_PACKAGE_QT6BASE_PNG=3Dy
>>> BR2_PACKAGE_QT6BASE_SYSLOG=3Dy
>>> BR2_PACKAGE_QT6CORE5COMPAT=3Dy
>>> BR2_PACKAGE_QT6DECLARATIVE_QUICK=3Dy
>>> BR2_PACKAGE_QT6LANGUAGESERVER=3Dy
>>> BR2_PACKAGE_QT6VIRTUALKEYBOARD=3Dy
>>> BR2_PACKAGE_LINUX_FIRMWARE=3Dy
>>> BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX=3Dy
>>> BR2_PACKAGE_18XX_TI_UTILS=3Dy
>>> BR2_PACKAGE_EVTEST=3Dy
>>> BR2_PACKAGE_I2C_TOOLS=3Dy
>>> BR2_PACKAGE_LIBMANETTE=3Dy
>>> BR2_PACKAGE_LSHW=3Dy
>>> BR2_PACKAGE_PARTED=3Dy
>>> BR2_PACKAGE_PICOCOM=3Dy
>>> BR2_PACKAGE_SPI_TOOLS=3Dy
>>> BR2_PACKAGE_STATSERIAL=3Dy
>>> BR2_PACKAGE_STM32FLASH=3Dy
>>> BR2_PACKAGE_SYSSTAT=3Dy
>>> BR2_PACKAGE_TI_UIM=3Dy
>>> BR2_PACKAGE_TI_UTILS=3Dy
>>> BR2_PACKAGE_ENSCRIPT=3Dy
>>> BR2_PACKAGE_LUA=3Dy
>>> BR2_PACKAGE_LSQLITE3=3Dy
>>> BR2_PACKAGE_LZLIB=3Dy
>>> BR2_PACKAGE_PYTHON3=3Dy
>>> BR2_PACKAGE_PYTHON3_SQLITE=3Dy
>>> BR2_PACKAGE_PYTHON_CFFI=3Dy
>>> BR2_PACKAGE_PYTHON_CYCLER=3Dy
>>> BR2_PACKAGE_PYTHON_FLASK_CORS=3Dy
>>> BR2_PACKAGE_PYTHON_JSONMODELS=3Dy
>>> BR2_PACKAGE_PYTHON_JSONSCHEMA=3Dy
>>> BR2_PACKAGE_PYTHON_KIWISOLVER=3Dy
>>> BR2_PACKAGE_PYTHON_LIBEVDEV=3Dy
>>> BR2_PACKAGE_PYTHON_MSGPACK=3Dy
>>> BR2_PACKAGE_PYTHON_NUMPY=3Dy
>>> BR2_PACKAGE_PYTHON_PACKAGING=3Dy
>>> BR2_PACKAGE_PYTHON_PILLOW=3Dy
>>> BR2_PACKAGE_PYTHON_PIP=3Dy
>>> BR2_PACKAGE_PYTHON_PYELFTOOLS=3Dy
>>> BR2_PACKAGE_PYTHON_PYPARSING=3Dy
>>> BR2_PACKAGE_PYTHON_REGEX=3Dy
>>> BR2_PACKAGE_PYTHON_SIMPLEJSON=3Dy
>>> BR2_PACKAGE_PYTHON_SPIDEV=3Dy
>>> BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS=3Dy
>>> BR2_PACKAGE_PYTHON_WRAPT=3Dy
>>> BR2_PACKAGE_PYTHON_ZOPE_INTERFACE=3Dy
>>> BR2_PACKAGE_CA_CERTIFICATES=3Dy
>>> BR2_PACKAGE_LIBGCRYPT=3Dy
>>> BR2_PACKAGE_LIBNSS=3Dy
>>> BR2_PACKAGE_LIBSECRET=3Dy
>>> BR2_PACKAGE_LEVELDB=3Dy
>>> BR2_PACKAGE_CAIRO_TEE=3Dy
>>> BR2_PACKAGE_CAIROMM=3Dy
>>> BR2_PACKAGE_CAIROMM1_14=3Dy
>>> BR2_PACKAGE_GD=3Dy
>>> BR2_PACKAGE_GIFLIB=3Dy
>>> BR2_PACKAGE_KMSXX=3Dy
>>> BR2_PACKAGE_KMSXX_INSTALL_TESTS=3Dy
>>> BR2_PACKAGE_LIBGTK3=3Dy
>>> BR2_PACKAGE_LIBJXL=3Dy
>>> BR2_PACKAGE_LIBSVG_CAIRO=3Dy
>>> BR2_PACKAGE_OPENJPEG=3Dy
>>> BR2_PACKAGE_POPPLER=3Dy
>>> BR2_PACKAGE_WOFF2=3Dy
>>> BR2_PACKAGE_LIBCEC=3Dy
>>> BR2_PACKAGE_LIBGPIOD=3Dy
>>> BR2_PACKAGE_LIBGPIOD_TOOLS=3Dy
>>> BR2_PACKAGE_LIBINPUT=3Dy
>>> BR2_PACKAGE_LIBPCIACCESS=3Dy
>>> BR2_PACKAGE_LIBSERIAL=3Dy
>>> BR2_PACKAGE_LIBSERIALPORT=3Dy
>>> BR2_PACKAGE_LIBUSB=3Dy
>>> BR2_PACKAGE_TSLIB=3Dy
>>> BR2_PACKAGE_BOOTSTRAP=3Dy
>>> BR2_PACKAGE_CHARTJS=3Dy
>>> BR2_PACKAGE_JSON_JAVASCRIPT=3Dy
>>> BR2_PACKAGE_VUEJS=3Dy
>>> BR2_PACKAGE_CJSON=3Dy
>>> BR2_PACKAGE_CJSON_UTILS=3Dy
>>> BR2_PACKAGE_JANSSON=3Dy
>>> BR2_PACKAGE_JSON_C=3Dy
>>> BR2_PACKAGE_JSON_FOR_MODERN_CPP=3Dy
>>> BR2_PACKAGE_JSON_GLIB=3Dy
>>> BR2_PACKAGE_JSONCPP=3Dy
>>> BR2_PACKAGE_LIBJSON=3Dy
>>> BR2_PACKAGE_LIBUCL=3Dy
>>> BR2_PACKAGE_LIBXMLPP=3Dy
>>> BR2_PACKAGE_LIBXSLT=3Dy
>>> BR2_PACKAGE_LIBYAML=3Dy
>>> BR2_PACKAGE_YAML_CPP=3Dy
>>> BR2_PACKAGE_LIBVPX=3Dy
>>> BR2_PACKAGE_GEOIP=3Dy
>>> BR2_PACKAGE_LIBCURL=3Dy
>>> BR2_PACKAGE_LIBIDN2=3Dy
>>> BR2_PACKAGE_LIBNDP=3Dy
>>> BR2_PACKAGE_LIBPCAP=3Dy
>>> BR2_PACKAGE_LIBSOUP3=3Dy
>>> BR2_PACKAGE_LIBSOUP3_SSL=3Dy
>>> BR2_PACKAGE_LIBVNCSERVER=3Dy
>>> BR2_PACKAGE_BOOST_JSON=3Dy
>>> BR2_PACKAGE_GLM=3Dy
>>> BR2_PACKAGE_GOBJECT_INTROSPECTION=3Dy
>>> BR2_PACKAGE_GTEST=3Dy
>>> BR2_PACKAGE_LIBATOMIC_OPS=3Dy
>>> BR2_PACKAGE_LIBSECCOMP=3Dy
>>> BR2_PACKAGE_LIBSOLV=3Dy
>>> BR2_PACKAGE_LIBUV=3Dy
>>> BR2_PACKAGE_LINUX_PAM=3Dy
>>> BR2_PACKAGE_ORC=3Dy
>>> BR2_PACKAGE_QHULL=3Dy
>>> BR2_PACKAGE_ENCHANT=3Dy
>>> BR2_PACKAGE_ICU=3Dy
>>> BR2_PACKAGE_NCURSES_WCHAR=3Dy
>>> BR2_PACKAGE_UTF8PROC=3Dy
>>> BR2_PACKAGE_SHARED_MIME_INFO=3Dy
>>> BR2_PACKAGE_APACHE=3Dy
>>> BR2_PACKAGE_AVAHI=3Dy
>>> BR2_PACKAGE_DHCP=3Dy
>>> BR2_PACKAGE_DHCP_CLIENT=3Dy
>>> BR2_PACKAGE_DHCPCD=3Dy
>>> BR2_PACKAGE_IFUPDOWN=3Dy
>>> BR2_PACKAGE_IPROUTE2=3Dy
>>> BR2_PACKAGE_IPUTILS=3Dy
>>> BR2_PACKAGE_IW=3Dy
>>> BR2_PACKAGE_IWD=3Dy
>>> BR2_PACKAGE_NET_TOOLS=3Dy
>>> BR2_PACKAGE_NTP=3Dy
>>> BR2_PACKAGE_NTP_NTPDATE=3Dy
>>> BR2_PACKAGE_NTP_NTPTIME=3Dy
>>> BR2_PACKAGE_OPENSSH=3Dy
>>> BR2_PACKAGE_PPPD=3Dy
>>> BR2_PACKAGE_RSYNC=3Dy
>>> BR2_PACKAGE_TFTPD=3Dy
>>> BR2_PACKAGE_WIRELESS_REGDB=3Dy
>>> BR2_PACKAGE_WIRELESS_TOOLS=3Dy
>>> BR2_PACKAGE_WPA_SUPPLICANT=3Dy
>>> BR2_PACKAGE_WPA_SUPPLICANT_WEXT=3Dy
>>> BR2_PACKAGE_WPA_SUPPLICANT_WIRED=3Dy
>>> BR2_PACKAGE_WPA_SUPPLICANT_IBSS_RSN=3Dy
>>> BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT=3Dy
>>> BR2_PACKAGE_WPA_SUPPLICANT_WIFI_DISPLAY=3Dy
>>> BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING=3Dy
>>> BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN=3Dy
>>> BR2_PACKAGE_WPA_SUPPLICANT_DEBUG_SYSLOG=3Dy
>>> BR2_PACKAGE_WPA_SUPPLICANT_WPS=3Dy
>>> BR2_PACKAGE_WPA_SUPPLICANT_WPA3=3Dy
>>> BR2_PACKAGE_WPA_SUPPLICANT_CLI=3Dy
>>> BR2_PACKAGE_WPA_SUPPLICANT_WPA_CLIENT_SO=3Dy
>>> BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=3Dy
>>> BR2_PACKAGE_WPA_SUPPLICANT_DBUS=3Dy
>>> BR2_PACKAGE_WPAN_TOOLS=3Dy
>>> BR2_PACKAGE_XINETD=3Dy
>>> BR2_PACKAGE_XTABLES_ADDONS=3Dy
>>> BR2_PACKAGE_BASH=3Dy
>>> BR2_PACKAGE_SUDO=3Dy
>>> BR2_PACKAGE_BUBBLEWRAP=3Dy
>>> BR2_PACKAGE_HTOP=3Dy
>>> BR2_PACKAGE_PROCPS_NG=3Dy
>>> BR2_PACKAGE_SEATD=3Dy
>>> BR2_PACKAGE_SEATD_DAEMON=3Dy
>>> BR2_PACKAGE_SYSTEMD_RFKILL=3Dy
>>> BR2_PACKAGE_UTIL_LINUX_BINARIES=3Dy
>>> BR2_PACKAGE_UTIL_LINUX_KILL=3Dy
>>> BR2_PACKAGE_UTIL_LINUX_RFKILL=3Dy
>>> BR2_PACKAGE_XDG_DBUS_PROXY=3Dy
>>> BR2_PACKAGE_NANO=3Dy
>>> BR2_TARGET_ROOTFS_TAR_GZIP=3Dy
>>> BR2_PACKAGE_HOST_CMAKE=3Dy
>>> BR2_PACKAGE_HOST_DOSFSTOOLS=3Dy
>>> BR2_PACKAGE_HOST_DTC=3Dy
>>> BR2_PACKAGE_HOST_E2FSPROGS=3Dy
>>> BR2_PACKAGE_HOST_GENIMAGE=3Dy
>>> BR2_PACKAGE_HOST_IMAGEMAGICK=3Dy
>>> BR2_PACKAGE_HOST_IMAGEMAGICK_XML=3Dy
>>> BR2_PACKAGE_HOST_KMOD_XZ=3Dy
>>> BR2_PACKAGE_HOST_MESON_TOOLS=3Dy
>>> BR2_PACKAGE_HOST_MTOOLS=3Dy
>>> BR2_PACKAGE_HOST_PYTHON_CYTHON=3Dy
>>> BR2_PACKAGE_HOST_PYTHON_GREENLET=3Dy
>>> BR2_PACKAGE_HOST_PYTHON_LXML=3Dy
>>> BR2_PACKAGE_HOST_PYTHON_PYYAML=3Dy
>>> BR2_PACKAGE_HOST_PYTHON_XLRD=3Dy
>>> BR2_PACKAGE_HOST_PYTHON3=3Dy
>>> BR2_PACKAGE_HOST_PYTHON3_BZIP2=3Dy
>>> BR2_PACKAGE_HOST_PYTHON3_XZ=3Dy
>>> BR2_PACKAGE_HOST_PYTHON3_SSL=3Dy
>>> BR2_PACKAGE_HOST_QT6TOOLS=3Dy
>>> BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS=3Dy
>>>
>>> I applied the patch to qt6tools.mk and still getting the same error.  I
>>> see in output that the compile flag is present to disable Clang.
>>>
>>> Output:
>>> >>> host-qt6tools 6.7.3 Extracting
>>> xzcat
>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-20=
24.11-rc1/dl/qt6tools/qttools-everywhere-src-6.7.3.tar.xz
>>> |
>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-20=
24.11-rc1/output/host/bin/tar
>>> --strip-components=3D1 -C
>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-20=
24.11-rc1/output/build/host-qt6tools-6.7.3
>>>   -xf -
>>> >>> host-qt6tools 6.7.3 Patching
>>> >>> host-qt6tools 6.7.3 Configuring
>>> (mkdir -p
>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-20=
24.11-rc1/output/build/host-qt6tools-6.7.3//buildroot-build
>>> && cd
>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-20=
24.11-rc1/output/build/host-qt6tools-6.7.3//buildroot-build
>>> && rm -f CMakeCache.txt &&
>>> PATH=3D"/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buil=
droot-2024.11-rc1/output/host/bin:/home/pholden/Projects/Edvotek01072025/ed=
votek-edvocycler3/buildroot-2024.11-rc1/output/host/sbin:/home/pholden/.pye=
nv/shims:/home/pholden/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:=
/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin"
>>> PKG_CONFIG=3D"/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler=
3/buildroot-2024.11-rc1/output/host/bin/pkg-config"
>>> PKG_CONFIG_SYSROOT_DIR=3D"/"
>>> PKG_CONFIG_LIBDIR=3D"/home/pholden/Projects/Edvotek01072025/edvotek-edv=
ocycler3/buildroot-2024.11-rc1/output/host/lib/pkgconfig:/home/pholden/Proj=
ects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/=
share/pkgconfig"
>>> PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=3D1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1
>>>  /usr/bin/cmake
>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-20=
24.11-rc1/output/build/host-qt6tools-6.7.3/
>>> -G"Ninja"
>>> -DCMAKE_MAKE_PROGRAM=3D"/home/pholden/Projects/Edvotek01072025/edvotek-=
edvocycler3/buildroot-2024.11-rc1/output/host/bin/ninja"
>>> -DCMAKE_INSTALL_SO_NO_EXE=3D0
>>> -DCMAKE_FIND_ROOT_PATH=3D"/home/pholden/Projects/Edvotek01072025/edvote=
k-edvocycler3/buildroot-2024.11-rc1/output/host"
>>> -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=3D"BOTH"
>>> -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=3D"BOTH"
>>> -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=3D"BOTH"
>>> -DCMAKE_INSTALL_PREFIX=3D"/home/pholden/Projects/Edvotek01072025/edvote=
k-edvocycler3/buildroot-2024.11-rc1/output/host"
>>> -DCMAKE_C_FLAGS=3D"-O2
>>> -I/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-=
2024.11-rc1/output/host/include"
>>> -DCMAKE_CXX_FLAGS=3D"-O2
>>> -I/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-=
2024.11-rc1/output/host/include"
>>> -DCMAKE_EXE_LINKER_FLAGS=3D"-L/home/pholden/Projects/Edvotek01072025/ed=
votek-edvocycler3/buildroot-2024.11-rc1/output/host/lib
>>> -Wl,-rpath,/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/b=
uildroot-2024.11-rc1/output/host/lib"
>>> -DCMAKE_SHARED_LINKER_FLAGS=3D"-L/home/pholden/Projects/Edvotek01072025=
/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/lib
>>> -Wl,-rpath,/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/b=
uildroot-2024.11-rc1/output/host/lib"
>>> -DCMAKE_C_COMPILER=3D"/usr/bin/gcc" -DCMAKE_CXX_COMPILER=3D"/usr/bin/g+=
+"
>>>  -DCMAKE_C_COMPILER_LAUNCHER=3D"" -DCMAKE_CXX_COMPILER_LAUNCHER=3D""
>>>  -DCMAKE_COLOR_MAKEFILE=3DOFF -DBUILD_DOC=3DOFF -DBUILD_DOCS=3DOFF
>>> -DBUILD_EXAMPLE=3DOFF -DBUILD_EXAMPLES=3DOFF -DBUILD_TEST=3DOFF -DBUILD=
_TESTS=3DOFF
>>> -DBUILD_TESTING=3DOFF -DBUILD_SHARED_LIBS=3DON  -DFEATURE_clang=3DOFF
>>> -DQT_BUILD_EXAMPLES=3DOFF -DQT_BUILD_TESTS=3DOFF -DFEATURE_linguist=3DO=
FF )
>>> -- The CXX compiler identification is GNU 11.4.0
>>> -- The C compiler identification is GNU 11.4.0
>>> -- Detecting CXX compiler ABI info
>>> -- Detecting CXX compiler ABI info - done
>>> -- Check for working CXX compiler: /usr/bin/g++ - skipped
>>> -- Detecting CXX compile features
>>> -- Detecting CXX compile features - done
>>> -- Detecting C compiler ABI info
>>> -- Detecting C compiler ABI info - done
>>> -- Check for working C compiler: /usr/bin/gcc - skipped
>>> -- Detecting C compile features
>>> -- Detecting C compile features - done
>>> -- Looking for pthread.h
>>> -- Looking for pthread.h - found
>>> -- Performing Test CMAKE_HAVE_LIBC_PTHREAD
>>> -- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Success
>>> -- Found Threads: TRUE
>>> -- Performing Test HAVE_STDATOMIC
>>> -- Performing Test HAVE_STDATOMIC - Success
>>> -- Found WrapAtomic: TRUE
>>> -- Force setting build type to 'Release'.
>>> CMake Error at /usr/lib/llvm-14/lib/cmake/clang/ClangTargets.cmake:750
>>> (message):
>>>   The imported target "clangBasic" references the file
>>>
>>>      "/usr/lib/llvm-14/lib/libclangBasic.a"
>>>
>>>   but this file does not exist.  Possible reasons include:
>>>
>>>   * The file was deleted, renamed, or moved to another location.
>>>
>>>   * An install or uninstall procedure did not complete successfully.
>>>
>>>   * The installation package was faulty and contained
>>>
>>>      "/usr/lib/llvm-14/lib/cmake/clang/ClangTargets.cmake"
>>>
>>>   but not all the files it references.
>>>
>>> Call Stack (most recent call first):
>>>   /usr/lib/cmake/clang-14/ClangConfig.cmake:19 (include)
>>>   cmake/FindWrapLibClang.cmake:17 (find_package)
>>>
>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-20=
24.11-rc1/output/build/host-qt6base-6.7.3/cmake/QtFindPackageHelpers.cmake:=
156
>>> (find_package)
>>>   configure.cmake:20 (qt_find_package)
>>>
>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-20=
24.11-rc1/output/build/host-qt6base-6.7.3/cmake/QtFeature.cmake:678
>>> (include)
>>>   src/CMakeLists.txt:18 (qt_feature_evaluate_features)
>>>
>>>
>>> -- Configuring incomplete, errors occurred!
>>> See also
>>> "/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2=
024.11-rc1/output/build/host-qt6tools-6.7.3/buildroot-build/CMakeFiles/CMak=
eOutput.log".
>>> make[1]: *** [package/pkg-generic.mk:279:
>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-20=
24.11-rc1/output/build/host-qt6tools-6.7.3/.stamp_configured]
>>> Error 1
>>> make: *** [Makefile:83: _all] Error 2
>>>
>>> On Thu, Jan 16, 2025 at 8:00=E2=80=AFAM Roy Kollen Svendsen <
>>> roykollensvendsen@gmail.com> wrote:
>>>
>>>> Hi,
>>>>
>>>> Since I'm the root cause of the problem I sent you a patch here:
>>>>
>>>>
>>>> https://patchwork.ozlabs.org/project/buildroot/patch/20250116125537.53=
1666-1-roykollensvendsen@gmail.com/
>>>>
>>>> Please test if this fixes your problem add you Tested-By etc.
>>>>
>>>> Roy
>>>>
>>>> tor. 16. jan. 2025 kl. 13:17 skrev Roy Kollen Svendsen <
>>>> roykollensvendsen@gmail.com>:
>>>>
>>>>>
>>>>> qttools require at least clang 17. So we should not try to enable
>>>>> support unless suitable version is available.
>>>>>
>>>>> So we should set -DFEATURE_clang=3DOFF
>>>>>
>>>>> -Roy
>>>>>
>>>>>
>>>>> tor. 16. jan. 2025 kl. 11:23 skrev Roy Kollen Svendsen <
>>>>> roykollensvendsen@gmail.com>:
>>>>>
>>>>>> Hi Patricia,
>>>>>>
>>>>>> I'll take look at this as soon as I get a chance. Can you send me a
>>>>>> minimal config that recreate the problem?
>>>>>>
>>>>>> Thanks in advance,
>>>>>>
>>>>>> Roy
>>>>>>
>>>>>> tir. 14. jan. 2025 kl. 20:16 skrev Patricia Holden <
>>>>>> pholden@nklabs.com>:
>>>>>>
>>>>>>> We are using Buildroot version "2024.11-rc1.  We just turned on
>>>>>>> "Host Utilities->host qt6 tools->host linguistic tools".  I run mak=
e, get
>>>>>>> the error and output below.  Is there a fix for this?  Am I missing=
 a
>>>>>>> dependency I need to install on my host PC?
>>>>>>>
>>>>>>> Thanks!
>>>>>>> Pat
>>>>>>>
>>>>>>> make BR2_EXTERNAL=3D../edvo_br host-qt6tools
>>>>>>> >>> host-qt6tools 6.7.3 Configuring
>>>>>>> (mkdir -p
>>>>>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroo=
t-2024.11-rc1/output/build/host-qt6tools-6.7.3//buildroot-build
>>>>>>> && cd
>>>>>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroo=
t-2024.11-rc1/output/build/host-qt6tools-6.7.3//buildroot-build
>>>>>>> && rm -f CMakeCache.txt &&
>>>>>>> PATH=3D"/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/=
buildroot-2024.11-rc1/output/host/bin:/home/pholden/Projects/Edvotek0107202=
5/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/sbin:/home/pholden/=
.pyenv/shims:/home/pholden/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/usr/s=
bin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin"
>>>>>>> PKG_CONFIG=3D"/home/pholden/Projects/Edvotek01072025/edvotek-edvocy=
cler3/buildroot-2024.11-rc1/output/host/bin/pkg-config"
>>>>>>> PKG_CONFIG_SYSROOT_DIR=3D"/"
>>>>>>> PKG_CONFIG_LIBDIR=3D"/home/pholden/Projects/Edvotek01072025/edvotek=
-edvocycler3/buildroot-2024.11-rc1/output/host/lib/pkgconfig:/home/pholden/=
Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/h=
ost/share/pkgconfig"
>>>>>>> PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=3D1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1
>>>>>>>  /usr/bin/cmake
>>>>>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroo=
t-2024.11-rc1/output/build/host-qt6tools-6.7.3/
>>>>>>> -G"Ninja"
>>>>>>> -DCMAKE_MAKE_PROGRAM=3D"/home/pholden/Projects/Edvotek01072025/edvo=
tek-edvocycler3/buildroot-2024.11-rc1/output/host/bin/ninja"
>>>>>>> -DCMAKE_INSTALL_SO_NO_EXE=3D0
>>>>>>> -DCMAKE_FIND_ROOT_PATH=3D"/home/pholden/Projects/Edvotek01072025/ed=
votek-edvocycler3/buildroot-2024.11-rc1/output/host"
>>>>>>> -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=3D"BOTH"
>>>>>>> -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=3D"BOTH"
>>>>>>> -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=3D"BOTH"
>>>>>>> -DCMAKE_INSTALL_PREFIX=3D"/home/pholden/Projects/Edvotek01072025/ed=
votek-edvocycler3/buildroot-2024.11-rc1/output/host"
>>>>>>> -DCMAKE_C_FLAGS=3D"-O2
>>>>>>> -I/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildr=
oot-2024.11-rc1/output/host/include"
>>>>>>> -DCMAKE_CXX_FLAGS=3D"-O2
>>>>>>> -I/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildr=
oot-2024.11-rc1/output/host/include"
>>>>>>> -DCMAKE_EXE_LINKER_FLAGS=3D"-L/home/pholden/Projects/Edvotek0107202=
5/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/lib
>>>>>>> -Wl,-rpath,/home/pholden/Projects/Edvotek01072025/edvotek-edvocycle=
r3/buildroot-2024.11-rc1/output/host/lib"
>>>>>>> -DCMAKE_SHARED_LINKER_FLAGS=3D"-L/home/pholden/Projects/Edvotek0107=
2025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/lib
>>>>>>> -Wl,-rpath,/home/pholden/Projects/Edvotek01072025/edvotek-edvocycle=
r3/buildroot-2024.11-rc1/output/host/lib"
>>>>>>> -DCMAKE_C_COMPILER=3D"/usr/bin/gcc" -DCMAKE_CXX_COMPILER=3D"/usr/bi=
n/g++"
>>>>>>>  -DCMAKE_C_COMPILER_LAUNCHER=3D"" -DCMAKE_CXX_COMPILER_LAUNCHER=3D"=
"
>>>>>>>  -DCMAKE_COLOR_MAKEFILE=3DOFF -DBUILD_DOC=3DOFF -DBUILD_DOCS=3DOFF
>>>>>>> -DBUILD_EXAMPLE=3DOFF -DBUILD_EXAMPLES=3DOFF -DBUILD_TEST=3DOFF -DB=
UILD_TESTS=3DOFF
>>>>>>> -DBUILD_TESTING=3DOFF -DBUILD_SHARED_LIBS=3DON  -DQT_BUILD_EXAMPLES=
=3DOFF
>>>>>>> -DQT_BUILD_TESTS=3DOFF -DFEATURE_linguist=3DON )
>>>>>>> -- The CXX compiler identification is GNU 11.4.0
>>>>>>> -- The C compiler identification is GNU 11.4.0
>>>>>>> -- Detecting CXX compiler ABI info
>>>>>>> -- Detecting CXX compiler ABI info - done
>>>>>>> -- Check for working CXX compiler: /usr/bin/g++ - skipped
>>>>>>> -- Detecting CXX compile features
>>>>>>> -- Detecting CXX compile features - done
>>>>>>> -- Detecting C compiler ABI info
>>>>>>> -- Detecting C compiler ABI info - done
>>>>>>> -- Check for working C compiler: /usr/bin/gcc - skipped
>>>>>>> -- Detecting C compile features
>>>>>>> -- Detecting C compile features - done
>>>>>>> -- Looking for pthread.h
>>>>>>> -- Looking for pthread.h - found
>>>>>>> -- Performing Test CMAKE_HAVE_LIBC_PTHREAD
>>>>>>> -- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Success
>>>>>>> -- Found Threads: TRUE
>>>>>>> -- Performing Test HAVE_STDATOMIC
>>>>>>> -- Performing Test HAVE_STDATOMIC - Success
>>>>>>> -- Found WrapAtomic: TRUE
>>>>>>> -- Force setting build type to 'Release'.
>>>>>>> CMake Error at
>>>>>>> /usr/lib/llvm-14/lib/cmake/clang/ClangTargets.cmake:750 (message):
>>>>>>>   The imported target "clangBasic" references the file
>>>>>>>
>>>>>>>      "/usr/lib/llvm-14/lib/libclangBasic.a"
>>>>>>>
>>>>>>>   but this file does not exist.  Possible reasons include:
>>>>>>>
>>>>>>>   * The file was deleted, renamed, or moved to another location.
>>>>>>>
>>>>>>>   * An install or uninstall procedure did not complete successfully=
.
>>>>>>>
>>>>>>>   * The installation package was faulty and contained
>>>>>>>
>>>>>>>      "/usr/lib/llvm-14/lib/cmake/clang/ClangTargets.cmake"
>>>>>>>
>>>>>>>   but not all the files it references.
>>>>>>>
>>>>>>> Call Stack (most recent call first):
>>>>>>>   /usr/lib/cmake/clang-14/ClangConfig.cmake:19 (include)
>>>>>>>   cmake/FindWrapLibClang.cmake:17 (find_package)
>>>>>>>
>>>>>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroo=
t-2024.11-rc1/output/build/host-qt6base-6.7.3/cmake/QtFindPackageHelpers.cm=
ake:156
>>>>>>> (find_package)
>>>>>>>   configure.cmake:20 (qt_find_package)
>>>>>>>
>>>>>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroo=
t-2024.11-rc1/output/build/host-qt6base-6.7.3/cmake/QtFeature.cmake:678
>>>>>>> (include)
>>>>>>>   src/CMakeLists.txt:18 (qt_feature_evaluate_features)
>>>>>>>
>>>>>>>
>>>>>>> -- Configuring incomplete, errors occurred!
>>>>>>> See also
>>>>>>> "/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildro=
ot-2024.11-rc1/output/build/host-qt6tools-6.7.3/buildroot-build/CMakeFiles/=
CMakeOutput.log".
>>>>>>> make[1]: *** [package/pkg-generic.mk:279:
>>>>>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroo=
t-2024.11-rc1/output/build/host-qt6tools-6.7.3/.stamp_configured]
>>>>>>> Error 1
>>>>>>> make: *** [Makefile:83: _all] Error 2
>>>>>>> _______________________________________________
>>>>>>> buildroot mailing list
>>>>>>> buildroot@buildroot.org
>>>>>>> https://lists.buildroot.org/mailman/listinfo/buildroot
>>>>>>>
>>>>>>

--000000000000724748062be057b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div></div><div>I don&#39;t understand why the build depen=
ds on what packages are installed on your Ubuntu workstation.</div><div><br=
></div><div>Does this make sense to you?<br></div><div><br></div><div><br><=
/div></div><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">tor. 16. jan. 2025 kl. 18:17 skrev Patricia=
 Holden &lt;<a href=3D"mailto:pholden@nklabs.com" target=3D"_blank">pholden=
@nklabs.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div dir=3D"ltr">I was able to resolve the problem by installing &quot=
;clang-format&quot;.=C2=A0 We had one Ubuntu workstation that was building =
host-qt6tools just fine and did a comparison of packages installed.=C2=A0 O=
nce I installed clang-format, build completed no errors and ran fine on our=
 target system.<div><br></div><div>Thanks for your assistance.</div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu,=
 Jan 16, 2025 at 11:34=E2=80=AFAM Patricia Holden &lt;<a href=3D"mailto:pho=
lden@nklabs.com" target=3D"_blank">pholden@nklabs.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">I att=
empted to install Clang, version 17 but am unable to find it.=C2=A0 Is this=
 an experimental version of Clang?=C2=A0 Do you have instructions on how to=
 install it for Ubuntu?</div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Thu, Jan 16, 2025 at 11:29=E2=80=AFAM Patricia Ho=
lden &lt;<a href=3D"mailto:pholden@nklabs.com" target=3D"_blank">pholden@nk=
labs.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Our defconfig is as follows:<div>=
<br></div><div>BR2_aarch64=3Dy<br>BR2_KERNEL_HEADERS_VERSION=3Dy<br>BR2_DEF=
AULT_KERNEL_VERSION=3D&quot;6.1.80&quot;<br>BR2_PACKAGE_HOST_LINUX_HEADERS_=
CUSTOM_6_1=3Dy<br>BR2_TOOLCHAIN_BUILDROOT_CXX=3Dy<br>BR2_SHARED_STATIC_LIBS=
=3Dy<br>BR2_PACKAGE_OVERRIDE_FILE=3D&quot;$(BR2_EXTERNAL_edvo_PATH)/<a href=
=3D"http://local.mk" target=3D"_blank">local.mk</a>&quot;<br>BR2_TARGET_GEN=
ERIC_HOSTNAME=3D&quot;edvocycler3&quot;<br>BR2_TARGET_GENERIC_ISSUE=3D&quot=
;Welcome to Edvocycler3&quot;<br>BR2_INIT_SYSTEMD=3Dy<br>BR2_TARGET_GENERIC=
_ROOT_PASSWD=3D&quot;temp1234&quot;<br>BR2_SYSTEM_DHCP=3D&quot;wlan0&quot;<=
br>BR2_SYSTEM_DEFAULT_PATH=3D&quot;/bin:/sbin:/usr/bin:/usr/sbin&quot;<br>B=
R2_ROOTFS_OVERLAY=3D&quot;$(BR2_EXTERNAL_edvo_PATH)/board/edvotek/rootfs-ov=
erlay&quot;<br>BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;$(BR2_EXTERNAL_edvo_PAT=
H)/board/edvotek/post-build.sh &quot;<br>BR2_LINUX_KERNEL=3Dy<br>BR2_LINUX_=
KERNEL_CUSTOM_VERSION=3Dy<br>BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;=
6.1.80&quot;<br>BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy<br>BR2_LINUX_KERNEL_=
CUSTOM_CONFIG_FILE=3D&quot;$(BR2_EXTERNAL_edvo_PATH)/board/edvotek/edvo3_de=
fconfig&quot;<br>BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy<br>BR2_LINUX_KERNEL_DTB_I=
S_SELF_BUILT=3Dy<br>BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D&quot;ti/k3-am623-ed=
vocycler3.dtb&quot;<br>BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=3Dy<br>BR2_LINUX_K=
ERNEL_DTB_OVERLAY_SUPPORT=3Dy<br>BR2_PACKAGE_BUSYBOX_CONFIG=3D&quot;$(BR2_E=
XTERNAL_edvo_PATH)/board/edvotek/edvo3br_busybox_defconfig&quot;<br>BR2_PAC=
KAGE_FFMPEG=3Dy<br>BR2_PACKAGE_FFMPEG_SWSCALE=3Dy<br>BR2_PACKAGE_BZIP2=3Dy<=
br>BR2_PACKAGE_GZIP=3Dy<br>BR2_PACKAGE_XZ=3Dy<br>BR2_PACKAGE_SPIDEV_TEST=3D=
y<br>BR2_PACKAGE_VALGRIND=3Dy<br>BR2_PACKAGE_BINUTILS=3Dy<br>BR2_PACKAGE_BI=
NUTILS_TARGET=3Dy<br>BR2_PACKAGE_LIBTOOL=3Dy<br>BR2_PACKAGE_E2FSPROGS=3Dy<b=
r>BR2_PACKAGE_E2FSPROGS_RESIZE2FS=3Dy<br>BR2_PACKAGE_DEJAVU=3Dy<br>BR2_PACK=
AGE_LIBERATION=3Dy<br>BR2_PACKAGE_HICOLOR_ICON_THEME=3Dy<br>BR2_PACKAGE_KMS=
CUBE=3Dy<br>BR2_PACKAGE_MESA3D_DEMOS=3Dy<br>BR2_PACKAGE_MESA3D=3Dy<br>BR2_P=
ACKAGE_MESA3D_OSMESA_GALLIUM=3Dy<br>BR2_PACKAGE_MESA3D_OPENGL_EGL=3Dy<br>BR=
2_PACKAGE_MESA3D_OPENGL_ES=3Dy<br>BR2_PACKAGE_QT6BASE_DEFAULT_QPA=3D&quot;l=
inuxfb&quot;<br>BR2_PACKAGE_QT6BASE_FONTCONFIG=3Dy<br>BR2_PACKAGE_QT6BASE_H=
ARFBUZZ=3Dy<br>BR2_PACKAGE_QT6BASE_JPEG=3Dy<br>BR2_PACKAGE_QT6BASE_PNG=3Dy<=
br>BR2_PACKAGE_QT6BASE_SYSLOG=3Dy<br>BR2_PACKAGE_QT6CORE5COMPAT=3Dy<br>BR2_=
PACKAGE_QT6DECLARATIVE_QUICK=3Dy<br>BR2_PACKAGE_QT6LANGUAGESERVER=3Dy<br>BR=
2_PACKAGE_QT6VIRTUALKEYBOARD=3Dy<br>BR2_PACKAGE_LINUX_FIRMWARE=3Dy<br>BR2_P=
ACKAGE_LINUX_FIRMWARE_TI_WL18XX=3Dy<br>BR2_PACKAGE_18XX_TI_UTILS=3Dy<br>BR2=
_PACKAGE_EVTEST=3Dy<br>BR2_PACKAGE_I2C_TOOLS=3Dy<br>BR2_PACKAGE_LIBMANETTE=
=3Dy<br>BR2_PACKAGE_LSHW=3Dy<br>BR2_PACKAGE_PARTED=3Dy<br>BR2_PACKAGE_PICOC=
OM=3Dy<br>BR2_PACKAGE_SPI_TOOLS=3Dy<br>BR2_PACKAGE_STATSERIAL=3Dy<br>BR2_PA=
CKAGE_STM32FLASH=3Dy<br>BR2_PACKAGE_SYSSTAT=3Dy<br>BR2_PACKAGE_TI_UIM=3Dy<b=
r>BR2_PACKAGE_TI_UTILS=3Dy<br>BR2_PACKAGE_ENSCRIPT=3Dy<br>BR2_PACKAGE_LUA=
=3Dy<br>BR2_PACKAGE_LSQLITE3=3Dy<br>BR2_PACKAGE_LZLIB=3Dy<br>BR2_PACKAGE_PY=
THON3=3Dy<br>BR2_PACKAGE_PYTHON3_SQLITE=3Dy<br>BR2_PACKAGE_PYTHON_CFFI=3Dy<=
br>BR2_PACKAGE_PYTHON_CYCLER=3Dy<br>BR2_PACKAGE_PYTHON_FLASK_CORS=3Dy<br>BR=
2_PACKAGE_PYTHON_JSONMODELS=3Dy<br>BR2_PACKAGE_PYTHON_JSONSCHEMA=3Dy<br>BR2=
_PACKAGE_PYTHON_KIWISOLVER=3Dy<br>BR2_PACKAGE_PYTHON_LIBEVDEV=3Dy<br>BR2_PA=
CKAGE_PYTHON_MSGPACK=3Dy<br>BR2_PACKAGE_PYTHON_NUMPY=3Dy<br>BR2_PACKAGE_PYT=
HON_PACKAGING=3Dy<br>BR2_PACKAGE_PYTHON_PILLOW=3Dy<br>BR2_PACKAGE_PYTHON_PI=
P=3Dy<br>BR2_PACKAGE_PYTHON_PYELFTOOLS=3Dy<br>BR2_PACKAGE_PYTHON_PYPARSING=
=3Dy<br>BR2_PACKAGE_PYTHON_REGEX=3Dy<br>BR2_PACKAGE_PYTHON_SIMPLEJSON=3Dy<b=
r>BR2_PACKAGE_PYTHON_SPIDEV=3Dy<br>BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS=3Dy=
<br>BR2_PACKAGE_PYTHON_WRAPT=3Dy<br>BR2_PACKAGE_PYTHON_ZOPE_INTERFACE=3Dy<b=
r>BR2_PACKAGE_CA_CERTIFICATES=3Dy<br>BR2_PACKAGE_LIBGCRYPT=3Dy<br>BR2_PACKA=
GE_LIBNSS=3Dy<br>BR2_PACKAGE_LIBSECRET=3Dy<br>BR2_PACKAGE_LEVELDB=3Dy<br>BR=
2_PACKAGE_CAIRO_TEE=3Dy<br>BR2_PACKAGE_CAIROMM=3Dy<br>BR2_PACKAGE_CAIROMM1_=
14=3Dy<br>BR2_PACKAGE_GD=3Dy<br>BR2_PACKAGE_GIFLIB=3Dy<br>BR2_PACKAGE_KMSXX=
=3Dy<br>BR2_PACKAGE_KMSXX_INSTALL_TESTS=3Dy<br>BR2_PACKAGE_LIBGTK3=3Dy<br>B=
R2_PACKAGE_LIBJXL=3Dy<br>BR2_PACKAGE_LIBSVG_CAIRO=3Dy<br>BR2_PACKAGE_OPENJP=
EG=3Dy<br>BR2_PACKAGE_POPPLER=3Dy<br>BR2_PACKAGE_WOFF2=3Dy<br>BR2_PACKAGE_L=
IBCEC=3Dy<br>BR2_PACKAGE_LIBGPIOD=3Dy<br>BR2_PACKAGE_LIBGPIOD_TOOLS=3Dy<br>=
BR2_PACKAGE_LIBINPUT=3Dy<br>BR2_PACKAGE_LIBPCIACCESS=3Dy<br>BR2_PACKAGE_LIB=
SERIAL=3Dy<br>BR2_PACKAGE_LIBSERIALPORT=3Dy<br>BR2_PACKAGE_LIBUSB=3Dy<br>BR=
2_PACKAGE_TSLIB=3Dy<br>BR2_PACKAGE_BOOTSTRAP=3Dy<br>BR2_PACKAGE_CHARTJS=3Dy=
<br>BR2_PACKAGE_JSON_JAVASCRIPT=3Dy<br>BR2_PACKAGE_VUEJS=3Dy<br>BR2_PACKAGE=
_CJSON=3Dy<br>BR2_PACKAGE_CJSON_UTILS=3Dy<br>BR2_PACKAGE_JANSSON=3Dy<br>BR2=
_PACKAGE_JSON_C=3Dy<br>BR2_PACKAGE_JSON_FOR_MODERN_CPP=3Dy<br>BR2_PACKAGE_J=
SON_GLIB=3Dy<br>BR2_PACKAGE_JSONCPP=3Dy<br>BR2_PACKAGE_LIBJSON=3Dy<br>BR2_P=
ACKAGE_LIBUCL=3Dy<br>BR2_PACKAGE_LIBXMLPP=3Dy<br>BR2_PACKAGE_LIBXSLT=3Dy<br=
>BR2_PACKAGE_LIBYAML=3Dy<br>BR2_PACKAGE_YAML_CPP=3Dy<br>BR2_PACKAGE_LIBVPX=
=3Dy<br>BR2_PACKAGE_GEOIP=3Dy<br>BR2_PACKAGE_LIBCURL=3Dy<br>BR2_PACKAGE_LIB=
IDN2=3Dy<br>BR2_PACKAGE_LIBNDP=3Dy<br>BR2_PACKAGE_LIBPCAP=3Dy<br>BR2_PACKAG=
E_LIBSOUP3=3Dy<br>BR2_PACKAGE_LIBSOUP3_SSL=3Dy<br>BR2_PACKAGE_LIBVNCSERVER=
=3Dy<br>BR2_PACKAGE_BOOST_JSON=3Dy<br>BR2_PACKAGE_GLM=3Dy<br>BR2_PACKAGE_GO=
BJECT_INTROSPECTION=3Dy<br>BR2_PACKAGE_GTEST=3Dy<br>BR2_PACKAGE_LIBATOMIC_O=
PS=3Dy<br>BR2_PACKAGE_LIBSECCOMP=3Dy<br>BR2_PACKAGE_LIBSOLV=3Dy<br>BR2_PACK=
AGE_LIBUV=3Dy<br>BR2_PACKAGE_LINUX_PAM=3Dy<br>BR2_PACKAGE_ORC=3Dy<br>BR2_PA=
CKAGE_QHULL=3Dy<br>BR2_PACKAGE_ENCHANT=3Dy<br>BR2_PACKAGE_ICU=3Dy<br>BR2_PA=
CKAGE_NCURSES_WCHAR=3Dy<br>BR2_PACKAGE_UTF8PROC=3Dy<br>BR2_PACKAGE_SHARED_M=
IME_INFO=3Dy<br>BR2_PACKAGE_APACHE=3Dy<br>BR2_PACKAGE_AVAHI=3Dy<br>BR2_PACK=
AGE_DHCP=3Dy<br>BR2_PACKAGE_DHCP_CLIENT=3Dy<br>BR2_PACKAGE_DHCPCD=3Dy<br>BR=
2_PACKAGE_IFUPDOWN=3Dy<br>BR2_PACKAGE_IPROUTE2=3Dy<br>BR2_PACKAGE_IPUTILS=
=3Dy<br>BR2_PACKAGE_IW=3Dy<br>BR2_PACKAGE_IWD=3Dy<br>BR2_PACKAGE_NET_TOOLS=
=3Dy<br>BR2_PACKAGE_NTP=3Dy<br>BR2_PACKAGE_NTP_NTPDATE=3Dy<br>BR2_PACKAGE_N=
TP_NTPTIME=3Dy<br>BR2_PACKAGE_OPENSSH=3Dy<br>BR2_PACKAGE_PPPD=3Dy<br>BR2_PA=
CKAGE_RSYNC=3Dy<br>BR2_PACKAGE_TFTPD=3Dy<br>BR2_PACKAGE_WIRELESS_REGDB=3Dy<=
br>BR2_PACKAGE_WIRELESS_TOOLS=3Dy<br>BR2_PACKAGE_WPA_SUPPLICANT=3Dy<br>BR2_=
PACKAGE_WPA_SUPPLICANT_WEXT=3Dy<br>BR2_PACKAGE_WPA_SUPPLICANT_WIRED=3Dy<br>=
BR2_PACKAGE_WPA_SUPPLICANT_IBSS_RSN=3Dy<br>BR2_PACKAGE_WPA_SUPPLICANT_AP_SU=
PPORT=3Dy<br>BR2_PACKAGE_WPA_SUPPLICANT_WIFI_DISPLAY=3Dy<br>BR2_PACKAGE_WPA=
_SUPPLICANT_MESH_NETWORKING=3Dy<br>BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN=3Dy<=
br>BR2_PACKAGE_WPA_SUPPLICANT_DEBUG_SYSLOG=3Dy<br>BR2_PACKAGE_WPA_SUPPLICAN=
T_WPS=3Dy<br>BR2_PACKAGE_WPA_SUPPLICANT_WPA3=3Dy<br>BR2_PACKAGE_WPA_SUPPLIC=
ANT_CLI=3Dy<br>BR2_PACKAGE_WPA_SUPPLICANT_WPA_CLIENT_SO=3Dy<br>BR2_PACKAGE_=
WPA_SUPPLICANT_PASSPHRASE=3Dy<br>BR2_PACKAGE_WPA_SUPPLICANT_DBUS=3Dy<br>BR2=
_PACKAGE_WPAN_TOOLS=3Dy<br>BR2_PACKAGE_XINETD=3Dy<br>BR2_PACKAGE_XTABLES_AD=
DONS=3Dy<br>BR2_PACKAGE_BASH=3Dy<br>BR2_PACKAGE_SUDO=3Dy<br>BR2_PACKAGE_BUB=
BLEWRAP=3Dy<br>BR2_PACKAGE_HTOP=3Dy<br>BR2_PACKAGE_PROCPS_NG=3Dy<br>BR2_PAC=
KAGE_SEATD=3Dy<br>BR2_PACKAGE_SEATD_DAEMON=3Dy<br>BR2_PACKAGE_SYSTEMD_RFKIL=
L=3Dy<br>BR2_PACKAGE_UTIL_LINUX_BINARIES=3Dy<br>BR2_PACKAGE_UTIL_LINUX_KILL=
=3Dy<br>BR2_PACKAGE_UTIL_LINUX_RFKILL=3Dy<br>BR2_PACKAGE_XDG_DBUS_PROXY=3Dy=
<br>BR2_PACKAGE_NANO=3Dy<br>BR2_TARGET_ROOTFS_TAR_GZIP=3Dy<br>BR2_PACKAGE_H=
OST_CMAKE=3Dy<br>BR2_PACKAGE_HOST_DOSFSTOOLS=3Dy<br>BR2_PACKAGE_HOST_DTC=3D=
y<br>BR2_PACKAGE_HOST_E2FSPROGS=3Dy<br>BR2_PACKAGE_HOST_GENIMAGE=3Dy<br>BR2=
_PACKAGE_HOST_IMAGEMAGICK=3Dy<br>BR2_PACKAGE_HOST_IMAGEMAGICK_XML=3Dy<br>BR=
2_PACKAGE_HOST_KMOD_XZ=3Dy<br>BR2_PACKAGE_HOST_MESON_TOOLS=3Dy<br>BR2_PACKA=
GE_HOST_MTOOLS=3Dy<br>BR2_PACKAGE_HOST_PYTHON_CYTHON=3Dy<br>BR2_PACKAGE_HOS=
T_PYTHON_GREENLET=3Dy<br>BR2_PACKAGE_HOST_PYTHON_LXML=3Dy<br>BR2_PACKAGE_HO=
ST_PYTHON_PYYAML=3Dy<br>BR2_PACKAGE_HOST_PYTHON_XLRD=3Dy<br>BR2_PACKAGE_HOS=
T_PYTHON3=3Dy<br>BR2_PACKAGE_HOST_PYTHON3_BZIP2=3Dy<br>BR2_PACKAGE_HOST_PYT=
HON3_XZ=3Dy<br>BR2_PACKAGE_HOST_PYTHON3_SSL=3Dy<br>BR2_PACKAGE_HOST_QT6TOOL=
S=3Dy<br>BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS=3Dy<br><br></div><div>I a=
pplied the patch to <a href=3D"http://qt6tools.mk" target=3D"_blank">qt6too=
ls.mk</a> and still getting the same error.=C2=A0 I see in output that the =
compile flag is present to disable Clang.<div><br></div><div>Output:</div><=
div>&gt;&gt;&gt; host-qt6tools 6.7.3 Extracting<br>xzcat /home/pholden/Proj=
ects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/dl/qt6tools/=
qttools-everywhere-src-6.7.3.tar.xz | /home/pholden/Projects/Edvotek0107202=
5/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/bin/tar --strip-com=
ponents=3D1 -C /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/b=
uildroot-2024.11-rc1/output/build/host-qt6tools-6.7.3 =C2=A0 -xf -<br>&gt;&=
gt;&gt; host-qt6tools 6.7.3 Patching<br>&gt;&gt;&gt; host-qt6tools 6.7.3 Co=
nfiguring<br>(mkdir -p /home/pholden/Projects/Edvotek01072025/edvotek-edvoc=
ycler3/buildroot-2024.11-rc1/output/build/host-qt6tools-6.7.3//buildroot-bu=
ild &amp;&amp; cd /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler=
3/buildroot-2024.11-rc1/output/build/host-qt6tools-6.7.3//buildroot-build &=
amp;&amp; rm -f CMakeCache.txt &amp;&amp; PATH=3D&quot;/home/pholden/Projec=
ts/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/bi=
n:/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024=
.11-rc1/output/host/sbin:/home/pholden/.pyenv/shims:/home/pholden/.pyenv/bi=
n:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/=
usr/local/games:/snap/bin:/snap/bin&quot; PKG_CONFIG=3D&quot;/home/pholden/=
Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/h=
ost/bin/pkg-config&quot; PKG_CONFIG_SYSROOT_DIR=3D&quot;/&quot; PKG_CONFIG_=
LIBDIR=3D&quot;/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/b=
uildroot-2024.11-rc1/output/host/lib/pkgconfig:/home/pholden/Projects/Edvot=
ek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/share/pkgc=
onfig&quot; PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=3D1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=
=3D1 =C2=A0/usr/bin/cmake /home/pholden/Projects/Edvotek01072025/edvotek-ed=
vocycler3/buildroot-2024.11-rc1/output/build/host-qt6tools-6.7.3/ -G&quot;N=
inja&quot; -DCMAKE_MAKE_PROGRAM=3D&quot;/home/pholden/Projects/Edvotek01072=
025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/bin/ninja&quot; -=
DCMAKE_INSTALL_SO_NO_EXE=3D0 -DCMAKE_FIND_ROOT_PATH=3D&quot;/home/pholden/P=
rojects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/ho=
st&quot; -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=3D&quot;BOTH&quot; -DCMAKE_FIN=
D_ROOT_PATH_MODE_LIBRARY=3D&quot;BOTH&quot; -DCMAKE_FIND_ROOT_PATH_MODE_INC=
LUDE=3D&quot;BOTH&quot; -DCMAKE_INSTALL_PREFIX=3D&quot;/home/pholden/Projec=
ts/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host&qu=
ot; -DCMAKE_C_FLAGS=3D&quot;-O2 -I/home/pholden/Projects/Edvotek01072025/ed=
votek-edvocycler3/buildroot-2024.11-rc1/output/host/include&quot; -DCMAKE_C=
XX_FLAGS=3D&quot;-O2 -I/home/pholden/Projects/Edvotek01072025/edvotek-edvoc=
ycler3/buildroot-2024.11-rc1/output/host/include&quot; -DCMAKE_EXE_LINKER_F=
LAGS=3D&quot;-L/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/b=
uildroot-2024.11-rc1/output/host/lib -Wl,-rpath,/home/pholden/Projects/Edvo=
tek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/lib&quot;=
 -DCMAKE_SHARED_LINKER_FLAGS=3D&quot;-L/home/pholden/Projects/Edvotek010720=
25/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/lib -Wl,-rpath,/ho=
me/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-r=
c1/output/host/lib&quot; -DCMAKE_C_COMPILER=3D&quot;/usr/bin/gcc&quot; -DCM=
AKE_CXX_COMPILER=3D&quot;/usr/bin/g++&quot; =C2=A0-DCMAKE_C_COMPILER_LAUNCH=
ER=3D&quot;&quot; -DCMAKE_CXX_COMPILER_LAUNCHER=3D&quot;&quot; =C2=A0-DCMAK=
E_COLOR_MAKEFILE=3DOFF -DBUILD_DOC=3DOFF -DBUILD_DOCS=3DOFF -DBUILD_EXAMPLE=
=3DOFF -DBUILD_EXAMPLES=3DOFF -DBUILD_TEST=3DOFF -DBUILD_TESTS=3DOFF -DBUIL=
D_TESTING=3DOFF -DBUILD_SHARED_LIBS=3DON =C2=A0<font color=3D"#ff0000">-DFE=
ATURE_clang=3DOFF</font> -DQT_BUILD_EXAMPLES=3DOFF -DQT_BUILD_TESTS=3DOFF -=
DFEATURE_linguist=3DOFF )<br>-- The CXX compiler identification is GNU 11.4=
.0<br>-- The C compiler identification is GNU 11.4.0<br>-- Detecting CXX co=
mpiler ABI info<br>-- Detecting CXX compiler ABI info - done<br>-- Check fo=
r working CXX compiler: /usr/bin/g++ - skipped<br>-- Detecting CXX compile =
features<br>-- Detecting CXX compile features - done<br>-- Detecting C comp=
iler ABI info<br>-- Detecting C compiler ABI info - done<br>-- Check for wo=
rking C compiler: /usr/bin/gcc - skipped<br>-- Detecting C compile features=
<br>-- Detecting C compile features - done<br>-- Looking for pthread.h<br>-=
- Looking for pthread.h - found<br>-- Performing Test CMAKE_HAVE_LIBC_PTHRE=
AD<br>-- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Success<br>-- Found Thre=
ads: TRUE =C2=A0<br>-- Performing Test HAVE_STDATOMIC<br>-- Performing Test=
 HAVE_STDATOMIC - Success<br>-- Found WrapAtomic: TRUE =C2=A0<br>-- Force s=
etting build type to &#39;Release&#39;.<br>CMake Error at /usr/lib/llvm-14/=
lib/cmake/clang/ClangTargets.cmake:750 (message):<br>=C2=A0 The imported ta=
rget &quot;clangBasic&quot; references the file<br><br>=C2=A0 =C2=A0 =C2=A0=
&quot;/usr/lib/llvm-14/lib/libclangBasic.a&quot;<br><br>=C2=A0 but this fil=
e does not exist.=C2=A0 Possible reasons include:<br><br>=C2=A0 * The file =
was deleted, renamed, or moved to another location.<br><br>=C2=A0 * An inst=
all or uninstall procedure did not complete successfully.<br><br>=C2=A0 * T=
he installation package was faulty and contained<br><br>=C2=A0 =C2=A0 =C2=
=A0&quot;/usr/lib/llvm-14/lib/cmake/clang/ClangTargets.cmake&quot;<br><br>=
=C2=A0 but not all the files it references.<br><br>Call Stack (most recent =
call first):<br>=C2=A0 /usr/lib/cmake/clang-14/ClangConfig.cmake:19 (includ=
e)<br>=C2=A0 cmake/FindWrapLibClang.cmake:17 (find_package)<br>=C2=A0 /home=
/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1=
/output/build/host-qt6base-6.7.3/cmake/QtFindPackageHelpers.cmake:156 (find=
_package)<br>=C2=A0 configure.cmake:20 (qt_find_package)<br>=C2=A0 /home/ph=
olden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/ou=
tput/build/host-qt6base-6.7.3/cmake/QtFeature.cmake:678 (include)<br>=C2=A0=
 src/CMakeLists.txt:18 (qt_feature_evaluate_features)<br><br><br>-- Configu=
ring incomplete, errors occurred!<br>See also &quot;/home/pholden/Projects/=
Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/build/host=
-qt6tools-6.7.3/buildroot-build/CMakeFiles/CMakeOutput.log&quot;.<br>make[1=
]: *** [package/<a href=3D"http://pkg-generic.mk:279" target=3D"_blank">pkg=
-generic.mk:279</a>: /home/pholden/Projects/Edvotek01072025/edvotek-edvocyc=
ler3/buildroot-2024.11-rc1/output/build/host-qt6tools-6.7.3/.stamp_configur=
ed] Error 1<br>make: *** [Makefile:83: _all] Error 2<br></div></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu,=
 Jan 16, 2025 at 8:00=E2=80=AFAM Roy Kollen Svendsen &lt;<a href=3D"mailto:=
roykollensvendsen@gmail.com" target=3D"_blank">roykollensvendsen@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div dir=3D"ltr"><div>Hi,</div><div><br></div><div>Since I&#39;m the root ca=
use of the problem I sent you a patch here:<br></div><div><br></div><div><a=
 href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/2025011612553=
7.531666-1-roykollensvendsen@gmail.com/" target=3D"_blank">https://patchwor=
k.ozlabs.org/project/buildroot/patch/20250116125537.531666-1-roykollensvend=
sen@gmail.com/</a></div><div><br></div><div>Please test if this fixes your =
problem add you Tested-By etc.</div><div><br></div><div>Roy<br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">tor. 1=
6. jan. 2025 kl. 13:17 skrev Roy Kollen Svendsen &lt;<a href=3D"mailto:royk=
ollensvendsen@gmail.com" target=3D"_blank">roykollensvendsen@gmail.com</a>&=
gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D=
"ltr"><div><br></div><div>qttools require at least clang 17. So we should n=
ot try to enable support unless suitable version is available.</div><div><b=
r></div><div>So we should set -DFEATURE_clang=3DOFF</div><div><br></div><di=
v>-Roy<br></div><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">tor. 16. jan. 2025 kl. 11:23 skrev Roy Kollen Svendsen =
&lt;<a href=3D"mailto:roykollensvendsen@gmail.com" target=3D"_blank">roykol=
lensvendsen@gmail.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div dir=3D"ltr"><div>Hi Patricia,</div><div><br></div><div>=
I&#39;ll take look at this as soon as I get a chance. Can you send me a min=
imal config that recreate the problem?</div><div><br></div><div>Thanks in a=
dvance,</div><div><br></div><div>Roy</div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">tir. 14. jan. 2025 kl. 20:16 skre=
v Patricia Holden &lt;<a href=3D"mailto:pholden@nklabs.com" target=3D"_blan=
k">pholden@nklabs.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div dir=3D"ltr">We are using Buildroot version &quot;2024.1=
1-rc1.=C2=A0 We just turned on &quot;Host Utilities-&gt;host qt6 tools-&gt;=
host linguistic tools&quot;.=C2=A0 I run make, get the error and output bel=
ow.=C2=A0 Is there a fix for this?=C2=A0 Am I missing a dependency I need t=
o install on my host PC?<div><br></div><div>Thanks!</div><div>Pat<br><div><=
br></div><div>make BR2_EXTERNAL=3D../edvo_br host-qt6tools<br>&gt;&gt;&gt; =
host-qt6tools 6.7.3 Configuring<br>(mkdir -p /home/pholden/Projects/Edvotek=
01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/build/host-qt6too=
ls-6.7.3//buildroot-build &amp;&amp; cd /home/pholden/Projects/Edvotek01072=
025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/build/host-qt6tools-6.=
7.3//buildroot-build &amp;&amp; rm -f CMakeCache.txt &amp;&amp; PATH=3D&quo=
t;/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024=
.11-rc1/output/host/bin:/home/pholden/Projects/Edvotek01072025/edvotek-edvo=
cycler3/buildroot-2024.11-rc1/output/host/sbin:/home/pholden/.pyenv/shims:/=
home/pholden/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/=
sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin&quot; PKG_CONFIG=
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
BUILD_TESTS=3DOFF -DBUILD_TESTING=3DOFF -DBUILD_SHARED_LIBS=3DON =C2=A0-DQT=
_BUILD_EXAMPLES=3DOFF -DQT_BUILD_TESTS=3DOFF -DFEATURE_linguist=3DON )<br>-=
- The CXX compiler identification is GNU 11.4.0<br>-- The C compiler identi=
fication is GNU 11.4.0<br>-- Detecting CXX compiler ABI info<br>-- Detectin=
g CXX compiler ABI info - done<br>-- Check for working CXX compiler: /usr/b=
in/g++ - skipped<br>-- Detecting CXX compile features<br>-- Detecting CXX c=
ompile features - done<br>-- Detecting C compiler ABI info<br>-- Detecting =
C compiler ABI info - done<br>-- Check for working C compiler: /usr/bin/gcc=
 - skipped<br>-- Detecting C compile features<br>-- Detecting C compile fea=
tures - done<br>-- Looking for pthread.h<br>-- Looking for pthread.h - foun=
d<br>-- Performing Test CMAKE_HAVE_LIBC_PTHREAD<br>-- Performing Test CMAKE=
_HAVE_LIBC_PTHREAD - Success<br>-- Found Threads: TRUE =C2=A0<br>-- Perform=
ing Test HAVE_STDATOMIC<br>-- Performing Test HAVE_STDATOMIC - Success<br>-=
- Found WrapAtomic: TRUE =C2=A0<br>-- Force setting build type to &#39;Rele=
ase&#39;.<br>CMake Error at /usr/lib/llvm-14/lib/cmake/clang/ClangTargets.c=
make:750 (message):<br>=C2=A0 The imported target &quot;clangBasic&quot; re=
ferences the file<br><br>=C2=A0 =C2=A0 =C2=A0&quot;/usr/lib/llvm-14/lib/lib=
clangBasic.a&quot;<br><br>=C2=A0 but this file does not exist.=C2=A0 Possib=
le reasons include:<br><br>=C2=A0 * The file was deleted, renamed, or moved=
 to another location.<br><br>=C2=A0 * An install or uninstall procedure did=
 not complete successfully.<br><br>=C2=A0 * The installation package was fa=
ulty and contained<br><br>=C2=A0 =C2=A0 =C2=A0&quot;/usr/lib/llvm-14/lib/cm=
ake/clang/ClangTargets.cmake&quot;<br><br>=C2=A0 but not all the files it r=
eferences.<br><br>Call Stack (most recent call first):<br>=C2=A0 /usr/lib/c=
make/clang-14/ClangConfig.cmake:19 (include)<br>=C2=A0 cmake/FindWrapLibCla=
ng.cmake:17 (find_package)<br>=C2=A0 /home/pholden/Projects/Edvotek01072025=
/edvotek-edvocycler3/buildroot-2024.11-rc1/output/build/host-qt6base-6.7.3/=
cmake/QtFindPackageHelpers.cmake:156 (find_package)<br>=C2=A0 configure.cma=
ke:20 (qt_find_package)<br>=C2=A0 /home/pholden/Projects/Edvotek01072025/ed=
votek-edvocycler3/buildroot-2024.11-rc1/output/build/host-qt6base-6.7.3/cma=
ke/QtFeature.cmake:678 (include)<br>=C2=A0 src/CMakeLists.txt:18 (qt_featur=
e_evaluate_features)<br><br><br>-- Configuring incomplete, errors occurred!=
<br>See also &quot;/home/pholden/Projects/Edvotek01072025/edvotek-edvocycle=
r3/buildroot-2024.11-rc1/output/build/host-qt6tools-6.7.3/buildroot-build/C=
MakeFiles/CMakeOutput.log&quot;.<br>make[1]: *** [package/<a href=3D"http:/=
/pkg-generic.mk:279" target=3D"_blank">pkg-generic.mk:279</a>: /home/pholde=
n/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output=
/build/host-qt6tools-6.7.3/.stamp_configured] Error 1<br>make: *** [Makefil=
e:83: _all] Error 2<br></div></div></div>
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
</blockquote></div>
</blockquote></div>

--000000000000724748062be057b4--

--===============5210541162698451677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5210541162698451677==--
