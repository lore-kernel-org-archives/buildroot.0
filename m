Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6192C02183
	for <buildroot@archiver.kernel.org>; Thu, 16 Jan 2025 16:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5ABAD418BE;
	Thu, 16 Jan 2025 16:30:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pgSqITVkuOVO; Thu, 16 Jan 2025 16:30:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3C33418D2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3C33418D2;
	Thu, 16 Jan 2025 16:30:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6436E94B
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 16:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47A486116E
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 16:30:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id svYanVrRatM8 for <buildroot@buildroot.org>;
 Thu, 16 Jan 2025 16:29:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::936; helo=mail-ua1-x936.google.com;
 envelope-from=pholden@nklabs.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4A0AE611DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A0AE611DC
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A0AE611DC
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 16:29:56 +0000 (UTC)
Received: by mail-ua1-x936.google.com with SMTP id
 a1e0cc1a2514c-85bb264993cso178003241.1
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 08:29:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737044996; x=1737649796;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YzoolUYxUDrJgif/HnEfQdvF7AUweNuwQo/hwyOZ43M=;
 b=r2CL3FFCy+451P4rV+cdITLnV0lH4AHDq2o0fspoWvNSX2RiLIkQs2kUGSgNE0P6Xq
 nZ5AKFqEIx5TuXyNy2K4pPUew6VAtqh1qN75t860sl3Wk550dvCToMGneEtL47m6+kKE
 mvO2cg5rUtMtyEEnV9QSn3FFfdEcuuYxBsNtlnxBB5gdX/WF5ZmVfln1eZCYUA6qiy76
 gVS1q95aI6mDB7hGOFz6n73C8/1c1jeQ48ULKb3MONOdHF8AUd4G/VDB4KPpK2QMLUub
 sj0eo+xQFrTupm9+xomD5AJWECW4lHmFaDW0DF1INNevRYrtF0pMXXkHPL9lYZtvW+c2
 bhlg==
X-Gm-Message-State: AOJu0YxtzlLf60VX7GF4f19koMWrl6oE/dYeB9gAh7MyvnVDWHdrOwN0
 Q/+EF4P33Qh4SAwFL95/h58rrNZB+yjG8MbMIcFHgueXpYKrn/TeUYDCN4dbRwu7+QfQXd/gc5a
 D/BVnzGL79pVmK9GoGCz5B9zkQ7+jWa7n1nc4qXFKEsJUqflAC4w=
X-Gm-Gg: ASbGncszxfStwJMVPSfyk3d6xllyyoKrzNQoLbwj2WQI1+ZzTBwoF41Vlg41E+kvPQV
 OwfDVtKWhYKnAQpJE2Bp1D+ZoY/anujE/Fid43Ik6kTKuT+DkBVkf+8I4CTBSp+kXvlXy
X-Google-Smtp-Source: AGHT+IHd8TyJWC9AORtZLroeou0SrsSkUxvCzQ3ohhIhhwlc0gcpNHvoD58M/6/tZup7xrxdF0X3kV5iaa/60nJlEiI=
X-Received: by 2002:a05:6122:2a53:b0:515:3bfb:d421 with SMTP id
 71dfb90a1353d-51c6c46c174mr28483653e0c.6.1737044995498; Thu, 16 Jan 2025
 08:29:55 -0800 (PST)
MIME-Version: 1.0
References: <CAJ6EmCe5duhjeanDC8NPgR6CWdaUstRc5TcxWnVSBEkF2_dK3Q@mail.gmail.com>
 <CA+R_derbD_Ddd73fddoSaUri7Y+4_YWqZc-VyDjMF0dtd1_OBg@mail.gmail.com>
 <CA+R_deo_Cp-BtFUr2f7Wt0HCpzg8nNqnOzQspgRTZXgc3bCq_Q@mail.gmail.com>
 <CA+R_deow-0ETOu-RnsrNrB=HL573WKj8515yRqa5ngxo2LYr7g@mail.gmail.com>
In-Reply-To: <CA+R_deow-0ETOu-RnsrNrB=HL573WKj8515yRqa5ngxo2LYr7g@mail.gmail.com>
From: Patricia Holden <pholden@nklabs.com>
Date: Thu, 16 Jan 2025 11:29:44 -0500
X-Gm-Features: AbW1kvYWY3G-4kXKbXdhhs1dhI1XjjbnjZ51moO_T7bHLFjj-S1rsbuRcWGWLdE
Message-ID: <CAJ6EmCcMh1HKi16b0gWeTYudz2Qqv0gDS83D_8x5FEw6Vkzvbw@mail.gmail.com>
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nklabs.com; s=google; t=1737044996; x=1737649796; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YzoolUYxUDrJgif/HnEfQdvF7AUweNuwQo/hwyOZ43M=;
 b=W2r8LSAqcRb7eHp69q1Iu1O3utraLSCiC8q2s0a08MWJ9TCcbbO/MJFdgAAs5kN2X+
 34QMoG1pfRQWh/Rh4tEn9Y53+NYCX5QdmVq2RGDZasee7kugwrUY/hrYQ4c+sbphjsR8
 /ZRQHQcCZq+a9y43PztJBsQUjuUIhYHOjF8gJVlpVSRaBsORfzF2QzuF87U63N6qmvrI
 2slTrv01msSgm+x4XQjylwKubmVj7RGsNKfESj4tMr3IqK19LUJQOOoN0zdmHsCjeBBb
 /rMvLxL5Kj0b1RW0EbQBASIpkqrPlInSIFCmbDO2LUCRiCSSYbv6pT6ZOaARPUDEmlFJ
 dUiQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=nklabs.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=nklabs.com header.i=@nklabs.com header.a=rsa-sha256
 header.s=google header.b=W2r8LSAq
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
Content-Type: multipart/mixed; boundary="===============7134421179552085144=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7134421179552085144==
Content-Type: multipart/alternative; boundary="000000000000ea800e062bd54d30"

--000000000000ea800e062bd54d30
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Our defconfig is as follows:

BR2_aarch64=3Dy
BR2_KERNEL_HEADERS_VERSION=3Dy
BR2_DEFAULT_KERNEL_VERSION=3D"6.1.80"
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=3Dy
BR2_TOOLCHAIN_BUILDROOT_CXX=3Dy
BR2_SHARED_STATIC_LIBS=3Dy
BR2_PACKAGE_OVERRIDE_FILE=3D"$(BR2_EXTERNAL_edvo_PATH)/local.mk"
BR2_TARGET_GENERIC_HOSTNAME=3D"edvocycler3"
BR2_TARGET_GENERIC_ISSUE=3D"Welcome to Edvocycler3"
BR2_INIT_SYSTEMD=3Dy
BR2_TARGET_GENERIC_ROOT_PASSWD=3D"temp1234"
BR2_SYSTEM_DHCP=3D"wlan0"
BR2_SYSTEM_DEFAULT_PATH=3D"/bin:/sbin:/usr/bin:/usr/sbin"
BR2_ROOTFS_OVERLAY=3D"$(BR2_EXTERNAL_edvo_PATH)/board/edvotek/rootfs-overla=
y"
BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"$(BR2_EXTERNAL_edvo_PATH)/board/edvotek/pos=
t-build.sh
"
BR2_LINUX_KERNEL=3Dy
BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.1.80"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D"$(BR2_EXTERNAL_edvo_PATH)/board/edvo=
tek/edvo3_defconfig"
BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT=3Dy
BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"ti/k3-am623-edvocycler3.dtb"
BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=3Dy
BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=3Dy
BR2_PACKAGE_BUSYBOX_CONFIG=3D"$(BR2_EXTERNAL_edvo_PATH)/board/edvotek/edvo3=
br_busybox_defconfig"
BR2_PACKAGE_FFMPEG=3Dy
BR2_PACKAGE_FFMPEG_SWSCALE=3Dy
BR2_PACKAGE_BZIP2=3Dy
BR2_PACKAGE_GZIP=3Dy
BR2_PACKAGE_XZ=3Dy
BR2_PACKAGE_SPIDEV_TEST=3Dy
BR2_PACKAGE_VALGRIND=3Dy
BR2_PACKAGE_BINUTILS=3Dy
BR2_PACKAGE_BINUTILS_TARGET=3Dy
BR2_PACKAGE_LIBTOOL=3Dy
BR2_PACKAGE_E2FSPROGS=3Dy
BR2_PACKAGE_E2FSPROGS_RESIZE2FS=3Dy
BR2_PACKAGE_DEJAVU=3Dy
BR2_PACKAGE_LIBERATION=3Dy
BR2_PACKAGE_HICOLOR_ICON_THEME=3Dy
BR2_PACKAGE_KMSCUBE=3Dy
BR2_PACKAGE_MESA3D_DEMOS=3Dy
BR2_PACKAGE_MESA3D=3Dy
BR2_PACKAGE_MESA3D_OSMESA_GALLIUM=3Dy
BR2_PACKAGE_MESA3D_OPENGL_EGL=3Dy
BR2_PACKAGE_MESA3D_OPENGL_ES=3Dy
BR2_PACKAGE_QT6BASE_DEFAULT_QPA=3D"linuxfb"
BR2_PACKAGE_QT6BASE_FONTCONFIG=3Dy
BR2_PACKAGE_QT6BASE_HARFBUZZ=3Dy
BR2_PACKAGE_QT6BASE_JPEG=3Dy
BR2_PACKAGE_QT6BASE_PNG=3Dy
BR2_PACKAGE_QT6BASE_SYSLOG=3Dy
BR2_PACKAGE_QT6CORE5COMPAT=3Dy
BR2_PACKAGE_QT6DECLARATIVE_QUICK=3Dy
BR2_PACKAGE_QT6LANGUAGESERVER=3Dy
BR2_PACKAGE_QT6VIRTUALKEYBOARD=3Dy
BR2_PACKAGE_LINUX_FIRMWARE=3Dy
BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX=3Dy
BR2_PACKAGE_18XX_TI_UTILS=3Dy
BR2_PACKAGE_EVTEST=3Dy
BR2_PACKAGE_I2C_TOOLS=3Dy
BR2_PACKAGE_LIBMANETTE=3Dy
BR2_PACKAGE_LSHW=3Dy
BR2_PACKAGE_PARTED=3Dy
BR2_PACKAGE_PICOCOM=3Dy
BR2_PACKAGE_SPI_TOOLS=3Dy
BR2_PACKAGE_STATSERIAL=3Dy
BR2_PACKAGE_STM32FLASH=3Dy
BR2_PACKAGE_SYSSTAT=3Dy
BR2_PACKAGE_TI_UIM=3Dy
BR2_PACKAGE_TI_UTILS=3Dy
BR2_PACKAGE_ENSCRIPT=3Dy
BR2_PACKAGE_LUA=3Dy
BR2_PACKAGE_LSQLITE3=3Dy
BR2_PACKAGE_LZLIB=3Dy
BR2_PACKAGE_PYTHON3=3Dy
BR2_PACKAGE_PYTHON3_SQLITE=3Dy
BR2_PACKAGE_PYTHON_CFFI=3Dy
BR2_PACKAGE_PYTHON_CYCLER=3Dy
BR2_PACKAGE_PYTHON_FLASK_CORS=3Dy
BR2_PACKAGE_PYTHON_JSONMODELS=3Dy
BR2_PACKAGE_PYTHON_JSONSCHEMA=3Dy
BR2_PACKAGE_PYTHON_KIWISOLVER=3Dy
BR2_PACKAGE_PYTHON_LIBEVDEV=3Dy
BR2_PACKAGE_PYTHON_MSGPACK=3Dy
BR2_PACKAGE_PYTHON_NUMPY=3Dy
BR2_PACKAGE_PYTHON_PACKAGING=3Dy
BR2_PACKAGE_PYTHON_PILLOW=3Dy
BR2_PACKAGE_PYTHON_PIP=3Dy
BR2_PACKAGE_PYTHON_PYELFTOOLS=3Dy
BR2_PACKAGE_PYTHON_PYPARSING=3Dy
BR2_PACKAGE_PYTHON_REGEX=3Dy
BR2_PACKAGE_PYTHON_SIMPLEJSON=3Dy
BR2_PACKAGE_PYTHON_SPIDEV=3Dy
BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS=3Dy
BR2_PACKAGE_PYTHON_WRAPT=3Dy
BR2_PACKAGE_PYTHON_ZOPE_INTERFACE=3Dy
BR2_PACKAGE_CA_CERTIFICATES=3Dy
BR2_PACKAGE_LIBGCRYPT=3Dy
BR2_PACKAGE_LIBNSS=3Dy
BR2_PACKAGE_LIBSECRET=3Dy
BR2_PACKAGE_LEVELDB=3Dy
BR2_PACKAGE_CAIRO_TEE=3Dy
BR2_PACKAGE_CAIROMM=3Dy
BR2_PACKAGE_CAIROMM1_14=3Dy
BR2_PACKAGE_GD=3Dy
BR2_PACKAGE_GIFLIB=3Dy
BR2_PACKAGE_KMSXX=3Dy
BR2_PACKAGE_KMSXX_INSTALL_TESTS=3Dy
BR2_PACKAGE_LIBGTK3=3Dy
BR2_PACKAGE_LIBJXL=3Dy
BR2_PACKAGE_LIBSVG_CAIRO=3Dy
BR2_PACKAGE_OPENJPEG=3Dy
BR2_PACKAGE_POPPLER=3Dy
BR2_PACKAGE_WOFF2=3Dy
BR2_PACKAGE_LIBCEC=3Dy
BR2_PACKAGE_LIBGPIOD=3Dy
BR2_PACKAGE_LIBGPIOD_TOOLS=3Dy
BR2_PACKAGE_LIBINPUT=3Dy
BR2_PACKAGE_LIBPCIACCESS=3Dy
BR2_PACKAGE_LIBSERIAL=3Dy
BR2_PACKAGE_LIBSERIALPORT=3Dy
BR2_PACKAGE_LIBUSB=3Dy
BR2_PACKAGE_TSLIB=3Dy
BR2_PACKAGE_BOOTSTRAP=3Dy
BR2_PACKAGE_CHARTJS=3Dy
BR2_PACKAGE_JSON_JAVASCRIPT=3Dy
BR2_PACKAGE_VUEJS=3Dy
BR2_PACKAGE_CJSON=3Dy
BR2_PACKAGE_CJSON_UTILS=3Dy
BR2_PACKAGE_JANSSON=3Dy
BR2_PACKAGE_JSON_C=3Dy
BR2_PACKAGE_JSON_FOR_MODERN_CPP=3Dy
BR2_PACKAGE_JSON_GLIB=3Dy
BR2_PACKAGE_JSONCPP=3Dy
BR2_PACKAGE_LIBJSON=3Dy
BR2_PACKAGE_LIBUCL=3Dy
BR2_PACKAGE_LIBXMLPP=3Dy
BR2_PACKAGE_LIBXSLT=3Dy
BR2_PACKAGE_LIBYAML=3Dy
BR2_PACKAGE_YAML_CPP=3Dy
BR2_PACKAGE_LIBVPX=3Dy
BR2_PACKAGE_GEOIP=3Dy
BR2_PACKAGE_LIBCURL=3Dy
BR2_PACKAGE_LIBIDN2=3Dy
BR2_PACKAGE_LIBNDP=3Dy
BR2_PACKAGE_LIBPCAP=3Dy
BR2_PACKAGE_LIBSOUP3=3Dy
BR2_PACKAGE_LIBSOUP3_SSL=3Dy
BR2_PACKAGE_LIBVNCSERVER=3Dy
BR2_PACKAGE_BOOST_JSON=3Dy
BR2_PACKAGE_GLM=3Dy
BR2_PACKAGE_GOBJECT_INTROSPECTION=3Dy
BR2_PACKAGE_GTEST=3Dy
BR2_PACKAGE_LIBATOMIC_OPS=3Dy
BR2_PACKAGE_LIBSECCOMP=3Dy
BR2_PACKAGE_LIBSOLV=3Dy
BR2_PACKAGE_LIBUV=3Dy
BR2_PACKAGE_LINUX_PAM=3Dy
BR2_PACKAGE_ORC=3Dy
BR2_PACKAGE_QHULL=3Dy
BR2_PACKAGE_ENCHANT=3Dy
BR2_PACKAGE_ICU=3Dy
BR2_PACKAGE_NCURSES_WCHAR=3Dy
BR2_PACKAGE_UTF8PROC=3Dy
BR2_PACKAGE_SHARED_MIME_INFO=3Dy
BR2_PACKAGE_APACHE=3Dy
BR2_PACKAGE_AVAHI=3Dy
BR2_PACKAGE_DHCP=3Dy
BR2_PACKAGE_DHCP_CLIENT=3Dy
BR2_PACKAGE_DHCPCD=3Dy
BR2_PACKAGE_IFUPDOWN=3Dy
BR2_PACKAGE_IPROUTE2=3Dy
BR2_PACKAGE_IPUTILS=3Dy
BR2_PACKAGE_IW=3Dy
BR2_PACKAGE_IWD=3Dy
BR2_PACKAGE_NET_TOOLS=3Dy
BR2_PACKAGE_NTP=3Dy
BR2_PACKAGE_NTP_NTPDATE=3Dy
BR2_PACKAGE_NTP_NTPTIME=3Dy
BR2_PACKAGE_OPENSSH=3Dy
BR2_PACKAGE_PPPD=3Dy
BR2_PACKAGE_RSYNC=3Dy
BR2_PACKAGE_TFTPD=3Dy
BR2_PACKAGE_WIRELESS_REGDB=3Dy
BR2_PACKAGE_WIRELESS_TOOLS=3Dy
BR2_PACKAGE_WPA_SUPPLICANT=3Dy
BR2_PACKAGE_WPA_SUPPLICANT_WEXT=3Dy
BR2_PACKAGE_WPA_SUPPLICANT_WIRED=3Dy
BR2_PACKAGE_WPA_SUPPLICANT_IBSS_RSN=3Dy
BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT=3Dy
BR2_PACKAGE_WPA_SUPPLICANT_WIFI_DISPLAY=3Dy
BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING=3Dy
BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN=3Dy
BR2_PACKAGE_WPA_SUPPLICANT_DEBUG_SYSLOG=3Dy
BR2_PACKAGE_WPA_SUPPLICANT_WPS=3Dy
BR2_PACKAGE_WPA_SUPPLICANT_WPA3=3Dy
BR2_PACKAGE_WPA_SUPPLICANT_CLI=3Dy
BR2_PACKAGE_WPA_SUPPLICANT_WPA_CLIENT_SO=3Dy
BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=3Dy
BR2_PACKAGE_WPA_SUPPLICANT_DBUS=3Dy
BR2_PACKAGE_WPAN_TOOLS=3Dy
BR2_PACKAGE_XINETD=3Dy
BR2_PACKAGE_XTABLES_ADDONS=3Dy
BR2_PACKAGE_BASH=3Dy
BR2_PACKAGE_SUDO=3Dy
BR2_PACKAGE_BUBBLEWRAP=3Dy
BR2_PACKAGE_HTOP=3Dy
BR2_PACKAGE_PROCPS_NG=3Dy
BR2_PACKAGE_SEATD=3Dy
BR2_PACKAGE_SEATD_DAEMON=3Dy
BR2_PACKAGE_SYSTEMD_RFKILL=3Dy
BR2_PACKAGE_UTIL_LINUX_BINARIES=3Dy
BR2_PACKAGE_UTIL_LINUX_KILL=3Dy
BR2_PACKAGE_UTIL_LINUX_RFKILL=3Dy
BR2_PACKAGE_XDG_DBUS_PROXY=3Dy
BR2_PACKAGE_NANO=3Dy
BR2_TARGET_ROOTFS_TAR_GZIP=3Dy
BR2_PACKAGE_HOST_CMAKE=3Dy
BR2_PACKAGE_HOST_DOSFSTOOLS=3Dy
BR2_PACKAGE_HOST_DTC=3Dy
BR2_PACKAGE_HOST_E2FSPROGS=3Dy
BR2_PACKAGE_HOST_GENIMAGE=3Dy
BR2_PACKAGE_HOST_IMAGEMAGICK=3Dy
BR2_PACKAGE_HOST_IMAGEMAGICK_XML=3Dy
BR2_PACKAGE_HOST_KMOD_XZ=3Dy
BR2_PACKAGE_HOST_MESON_TOOLS=3Dy
BR2_PACKAGE_HOST_MTOOLS=3Dy
BR2_PACKAGE_HOST_PYTHON_CYTHON=3Dy
BR2_PACKAGE_HOST_PYTHON_GREENLET=3Dy
BR2_PACKAGE_HOST_PYTHON_LXML=3Dy
BR2_PACKAGE_HOST_PYTHON_PYYAML=3Dy
BR2_PACKAGE_HOST_PYTHON_XLRD=3Dy
BR2_PACKAGE_HOST_PYTHON3=3Dy
BR2_PACKAGE_HOST_PYTHON3_BZIP2=3Dy
BR2_PACKAGE_HOST_PYTHON3_XZ=3Dy
BR2_PACKAGE_HOST_PYTHON3_SSL=3Dy
BR2_PACKAGE_HOST_QT6TOOLS=3Dy
BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS=3Dy

I applied the patch to qt6tools.mk and still getting the same error.  I see
in output that the compile flag is present to disable Clang.

Output:
>>> host-qt6tools 6.7.3 Extracting
xzcat
/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.1=
1-rc1/dl/qt6tools/qttools-everywhere-src-6.7.3.tar.xz
|
/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.1=
1-rc1/output/host/bin/tar
--strip-components=3D1 -C
/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.1=
1-rc1/output/build/host-qt6tools-6.7.3
  -xf -
>>> host-qt6tools 6.7.3 Patching
>>> host-qt6tools 6.7.3 Configuring
(mkdir -p
/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.1=
1-rc1/output/build/host-qt6tools-6.7.3//buildroot-build
&& cd
/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.1=
1-rc1/output/build/host-qt6tools-6.7.3//buildroot-build
&& rm -f CMakeCache.txt &&
PATH=3D"/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroo=
t-2024.11-rc1/output/host/bin:/home/pholden/Projects/Edvotek01072025/edvote=
k-edvocycler3/buildroot-2024.11-rc1/output/host/sbin:/home/pholden/.pyenv/s=
hims:/home/pholden/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr=
/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin"
PKG_CONFIG=3D"/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/bu=
ildroot-2024.11-rc1/output/host/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR=3D"/"
PKG_CONFIG_LIBDIR=3D"/home/pholden/Projects/Edvotek01072025/edvotek-edvocyc=
ler3/buildroot-2024.11-rc1/output/host/lib/pkgconfig:/home/pholden/Projects=
/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/shar=
e/pkgconfig"
PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=3D1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1
 /usr/bin/cmake
/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.1=
1-rc1/output/build/host-qt6tools-6.7.3/
-G"Ninja"
-DCMAKE_MAKE_PROGRAM=3D"/home/pholden/Projects/Edvotek01072025/edvotek-edvo=
cycler3/buildroot-2024.11-rc1/output/host/bin/ninja"
-DCMAKE_INSTALL_SO_NO_EXE=3D0
-DCMAKE_FIND_ROOT_PATH=3D"/home/pholden/Projects/Edvotek01072025/edvotek-ed=
vocycler3/buildroot-2024.11-rc1/output/host"
-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=3D"BOTH"
-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=3D"BOTH"
-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=3D"BOTH"
-DCMAKE_INSTALL_PREFIX=3D"/home/pholden/Projects/Edvotek01072025/edvotek-ed=
vocycler3/buildroot-2024.11-rc1/output/host"
-DCMAKE_C_FLAGS=3D"-O2
-I/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024=
.11-rc1/output/host/include"
-DCMAKE_CXX_FLAGS=3D"-O2
-I/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024=
.11-rc1/output/host/include"
-DCMAKE_EXE_LINKER_FLAGS=3D"-L/home/pholden/Projects/Edvotek01072025/edvote=
k-edvocycler3/buildroot-2024.11-rc1/output/host/lib
-Wl,-rpath,/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/build=
root-2024.11-rc1/output/host/lib"
-DCMAKE_SHARED_LINKER_FLAGS=3D"-L/home/pholden/Projects/Edvotek01072025/edv=
otek-edvocycler3/buildroot-2024.11-rc1/output/host/lib
-Wl,-rpath,/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/build=
root-2024.11-rc1/output/host/lib"
-DCMAKE_C_COMPILER=3D"/usr/bin/gcc" -DCMAKE_CXX_COMPILER=3D"/usr/bin/g++"
 -DCMAKE_C_COMPILER_LAUNCHER=3D"" -DCMAKE_CXX_COMPILER_LAUNCHER=3D""
 -DCMAKE_COLOR_MAKEFILE=3DOFF -DBUILD_DOC=3DOFF -DBUILD_DOCS=3DOFF
-DBUILD_EXAMPLE=3DOFF -DBUILD_EXAMPLES=3DOFF -DBUILD_TEST=3DOFF -DBUILD_TES=
TS=3DOFF
-DBUILD_TESTING=3DOFF -DBUILD_SHARED_LIBS=3DON  -DFEATURE_clang=3DOFF
-DQT_BUILD_EXAMPLES=3DOFF -DQT_BUILD_TESTS=3DOFF -DFEATURE_linguist=3DOFF )
-- The CXX compiler identification is GNU 11.4.0
-- The C compiler identification is GNU 11.4.0
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /usr/bin/g++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /usr/bin/gcc - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Looking for pthread.h
-- Looking for pthread.h - found
-- Performing Test CMAKE_HAVE_LIBC_PTHREAD
-- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Success
-- Found Threads: TRUE
-- Performing Test HAVE_STDATOMIC
-- Performing Test HAVE_STDATOMIC - Success
-- Found WrapAtomic: TRUE
-- Force setting build type to 'Release'.
CMake Error at /usr/lib/llvm-14/lib/cmake/clang/ClangTargets.cmake:750
(message):
  The imported target "clangBasic" references the file

     "/usr/lib/llvm-14/lib/libclangBasic.a"

  but this file does not exist.  Possible reasons include:

  * The file was deleted, renamed, or moved to another location.

  * An install or uninstall procedure did not complete successfully.

  * The installation package was faulty and contained

     "/usr/lib/llvm-14/lib/cmake/clang/ClangTargets.cmake"

  but not all the files it references.

Call Stack (most recent call first):
  /usr/lib/cmake/clang-14/ClangConfig.cmake:19 (include)
  cmake/FindWrapLibClang.cmake:17 (find_package)

/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.1=
1-rc1/output/build/host-qt6base-6.7.3/cmake/QtFindPackageHelpers.cmake:156
(find_package)
  configure.cmake:20 (qt_find_package)

/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.1=
1-rc1/output/build/host-qt6base-6.7.3/cmake/QtFeature.cmake:678
(include)
  src/CMakeLists.txt:18 (qt_feature_evaluate_features)


-- Configuring incomplete, errors occurred!
See also
"/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.=
11-rc1/output/build/host-qt6tools-6.7.3/buildroot-build/CMakeFiles/CMakeOut=
put.log".
make[1]: *** [package/pkg-generic.mk:279:
/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.1=
1-rc1/output/build/host-qt6tools-6.7.3/.stamp_configured]
Error 1
make: *** [Makefile:83: _all] Error 2

On Thu, Jan 16, 2025 at 8:00=E2=80=AFAM Roy Kollen Svendsen <
roykollensvendsen@gmail.com> wrote:

> Hi,
>
> Since I'm the root cause of the problem I sent you a patch here:
>
>
> https://patchwork.ozlabs.org/project/buildroot/patch/20250116125537.53166=
6-1-roykollensvendsen@gmail.com/
>
> Please test if this fixes your problem add you Tested-By etc.
>
> Roy
>
> tor. 16. jan. 2025 kl. 13:17 skrev Roy Kollen Svendsen <
> roykollensvendsen@gmail.com>:
>
>>
>> qttools require at least clang 17. So we should not try to enable suppor=
t
>> unless suitable version is available.
>>
>> So we should set -DFEATURE_clang=3DOFF
>>
>> -Roy
>>
>>
>> tor. 16. jan. 2025 kl. 11:23 skrev Roy Kollen Svendsen <
>> roykollensvendsen@gmail.com>:
>>
>>> Hi Patricia,
>>>
>>> I'll take look at this as soon as I get a chance. Can you send me a
>>> minimal config that recreate the problem?
>>>
>>> Thanks in advance,
>>>
>>> Roy
>>>
>>> tir. 14. jan. 2025 kl. 20:16 skrev Patricia Holden <pholden@nklabs.com>=
:
>>>
>>>> We are using Buildroot version "2024.11-rc1.  We just turned on "Host
>>>> Utilities->host qt6 tools->host linguistic tools".  I run make, get th=
e
>>>> error and output below.  Is there a fix for this?  Am I missing a
>>>> dependency I need to install on my host PC?
>>>>
>>>> Thanks!
>>>> Pat
>>>>
>>>> make BR2_EXTERNAL=3D../edvo_br host-qt6tools
>>>> >>> host-qt6tools 6.7.3 Configuring
>>>> (mkdir -p
>>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2=
024.11-rc1/output/build/host-qt6tools-6.7.3//buildroot-build
>>>> && cd
>>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2=
024.11-rc1/output/build/host-qt6tools-6.7.3//buildroot-build
>>>> && rm -f CMakeCache.txt &&
>>>> PATH=3D"/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/bui=
ldroot-2024.11-rc1/output/host/bin:/home/pholden/Projects/Edvotek01072025/e=
dvotek-edvocycler3/buildroot-2024.11-rc1/output/host/sbin:/home/pholden/.py=
env/shims:/home/pholden/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin=
:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin"
>>>> PKG_CONFIG=3D"/home/pholden/Projects/Edvotek01072025/edvotek-edvocycle=
r3/buildroot-2024.11-rc1/output/host/bin/pkg-config"
>>>> PKG_CONFIG_SYSROOT_DIR=3D"/"
>>>> PKG_CONFIG_LIBDIR=3D"/home/pholden/Projects/Edvotek01072025/edvotek-ed=
vocycler3/buildroot-2024.11-rc1/output/host/lib/pkgconfig:/home/pholden/Pro=
jects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host=
/share/pkgconfig"
>>>> PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=3D1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1
>>>>  /usr/bin/cmake
>>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2=
024.11-rc1/output/build/host-qt6tools-6.7.3/
>>>> -G"Ninja"
>>>> -DCMAKE_MAKE_PROGRAM=3D"/home/pholden/Projects/Edvotek01072025/edvotek=
-edvocycler3/buildroot-2024.11-rc1/output/host/bin/ninja"
>>>> -DCMAKE_INSTALL_SO_NO_EXE=3D0
>>>> -DCMAKE_FIND_ROOT_PATH=3D"/home/pholden/Projects/Edvotek01072025/edvot=
ek-edvocycler3/buildroot-2024.11-rc1/output/host"
>>>> -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=3D"BOTH"
>>>> -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=3D"BOTH"
>>>> -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=3D"BOTH"
>>>> -DCMAKE_INSTALL_PREFIX=3D"/home/pholden/Projects/Edvotek01072025/edvot=
ek-edvocycler3/buildroot-2024.11-rc1/output/host"
>>>> -DCMAKE_C_FLAGS=3D"-O2
>>>> -I/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot=
-2024.11-rc1/output/host/include"
>>>> -DCMAKE_CXX_FLAGS=3D"-O2
>>>> -I/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot=
-2024.11-rc1/output/host/include"
>>>> -DCMAKE_EXE_LINKER_FLAGS=3D"-L/home/pholden/Projects/Edvotek01072025/e=
dvotek-edvocycler3/buildroot-2024.11-rc1/output/host/lib
>>>> -Wl,-rpath,/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/=
buildroot-2024.11-rc1/output/host/lib"
>>>> -DCMAKE_SHARED_LINKER_FLAGS=3D"-L/home/pholden/Projects/Edvotek0107202=
5/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/lib
>>>> -Wl,-rpath,/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/=
buildroot-2024.11-rc1/output/host/lib"
>>>> -DCMAKE_C_COMPILER=3D"/usr/bin/gcc" -DCMAKE_CXX_COMPILER=3D"/usr/bin/g=
++"
>>>>  -DCMAKE_C_COMPILER_LAUNCHER=3D"" -DCMAKE_CXX_COMPILER_LAUNCHER=3D""
>>>>  -DCMAKE_COLOR_MAKEFILE=3DOFF -DBUILD_DOC=3DOFF -DBUILD_DOCS=3DOFF
>>>> -DBUILD_EXAMPLE=3DOFF -DBUILD_EXAMPLES=3DOFF -DBUILD_TEST=3DOFF -DBUIL=
D_TESTS=3DOFF
>>>> -DBUILD_TESTING=3DOFF -DBUILD_SHARED_LIBS=3DON  -DQT_BUILD_EXAMPLES=3D=
OFF
>>>> -DQT_BUILD_TESTS=3DOFF -DFEATURE_linguist=3DON )
>>>> -- The CXX compiler identification is GNU 11.4.0
>>>> -- The C compiler identification is GNU 11.4.0
>>>> -- Detecting CXX compiler ABI info
>>>> -- Detecting CXX compiler ABI info - done
>>>> -- Check for working CXX compiler: /usr/bin/g++ - skipped
>>>> -- Detecting CXX compile features
>>>> -- Detecting CXX compile features - done
>>>> -- Detecting C compiler ABI info
>>>> -- Detecting C compiler ABI info - done
>>>> -- Check for working C compiler: /usr/bin/gcc - skipped
>>>> -- Detecting C compile features
>>>> -- Detecting C compile features - done
>>>> -- Looking for pthread.h
>>>> -- Looking for pthread.h - found
>>>> -- Performing Test CMAKE_HAVE_LIBC_PTHREAD
>>>> -- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Success
>>>> -- Found Threads: TRUE
>>>> -- Performing Test HAVE_STDATOMIC
>>>> -- Performing Test HAVE_STDATOMIC - Success
>>>> -- Found WrapAtomic: TRUE
>>>> -- Force setting build type to 'Release'.
>>>> CMake Error at /usr/lib/llvm-14/lib/cmake/clang/ClangTargets.cmake:750
>>>> (message):
>>>>   The imported target "clangBasic" references the file
>>>>
>>>>      "/usr/lib/llvm-14/lib/libclangBasic.a"
>>>>
>>>>   but this file does not exist.  Possible reasons include:
>>>>
>>>>   * The file was deleted, renamed, or moved to another location.
>>>>
>>>>   * An install or uninstall procedure did not complete successfully.
>>>>
>>>>   * The installation package was faulty and contained
>>>>
>>>>      "/usr/lib/llvm-14/lib/cmake/clang/ClangTargets.cmake"
>>>>
>>>>   but not all the files it references.
>>>>
>>>> Call Stack (most recent call first):
>>>>   /usr/lib/cmake/clang-14/ClangConfig.cmake:19 (include)
>>>>   cmake/FindWrapLibClang.cmake:17 (find_package)
>>>>
>>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2=
024.11-rc1/output/build/host-qt6base-6.7.3/cmake/QtFindPackageHelpers.cmake=
:156
>>>> (find_package)
>>>>   configure.cmake:20 (qt_find_package)
>>>>
>>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2=
024.11-rc1/output/build/host-qt6base-6.7.3/cmake/QtFeature.cmake:678
>>>> (include)
>>>>   src/CMakeLists.txt:18 (qt_feature_evaluate_features)
>>>>
>>>>
>>>> -- Configuring incomplete, errors occurred!
>>>> See also
>>>> "/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-=
2024.11-rc1/output/build/host-qt6tools-6.7.3/buildroot-build/CMakeFiles/CMa=
keOutput.log".
>>>> make[1]: *** [package/pkg-generic.mk:279:
>>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2=
024.11-rc1/output/build/host-qt6tools-6.7.3/.stamp_configured]
>>>> Error 1
>>>> make: *** [Makefile:83: _all] Error 2
>>>> _______________________________________________
>>>> buildroot mailing list
>>>> buildroot@buildroot.org
>>>> https://lists.buildroot.org/mailman/listinfo/buildroot
>>>>
>>>

--000000000000ea800e062bd54d30
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Our defconfig is as follows:<div><br></di=
v><div>BR2_aarch64=3Dy<br>BR2_KERNEL_HEADERS_VERSION=3Dy<br>BR2_DEFAULT_KER=
NEL_VERSION=3D&quot;6.1.80&quot;<br>BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6=
_1=3Dy<br>BR2_TOOLCHAIN_BUILDROOT_CXX=3Dy<br>BR2_SHARED_STATIC_LIBS=3Dy<br>=
BR2_PACKAGE_OVERRIDE_FILE=3D&quot;$(BR2_EXTERNAL_edvo_PATH)/<a href=3D"http=
://local.mk">local.mk</a>&quot;<br>BR2_TARGET_GENERIC_HOSTNAME=3D&quot;edvo=
cycler3&quot;<br>BR2_TARGET_GENERIC_ISSUE=3D&quot;Welcome to Edvocycler3&qu=
ot;<br>BR2_INIT_SYSTEMD=3Dy<br>BR2_TARGET_GENERIC_ROOT_PASSWD=3D&quot;temp1=
234&quot;<br>BR2_SYSTEM_DHCP=3D&quot;wlan0&quot;<br>BR2_SYSTEM_DEFAULT_PATH=
=3D&quot;/bin:/sbin:/usr/bin:/usr/sbin&quot;<br>BR2_ROOTFS_OVERLAY=3D&quot;=
$(BR2_EXTERNAL_edvo_PATH)/board/edvotek/rootfs-overlay&quot;<br>BR2_ROOTFS_=
POST_IMAGE_SCRIPT=3D&quot;$(BR2_EXTERNAL_edvo_PATH)/board/edvotek/post-buil=
d.sh &quot;<br>BR2_LINUX_KERNEL=3Dy<br>BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<=
br>BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.1.80&quot;<br>BR2_LINUX_=
KERNEL_USE_CUSTOM_CONFIG=3Dy<br>BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D&quot=
;$(BR2_EXTERNAL_edvo_PATH)/board/edvotek/edvo3_defconfig&quot;<br>BR2_LINUX=
_KERNEL_DTS_SUPPORT=3Dy<br>BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT=3Dy<br>BR2_LI=
NUX_KERNEL_INTREE_DTS_NAME=3D&quot;ti/k3-am623-edvocycler3.dtb&quot;<br>BR2=
_LINUX_KERNEL_DTB_KEEP_DIRNAME=3Dy<br>BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=
=3Dy<br>BR2_PACKAGE_BUSYBOX_CONFIG=3D&quot;$(BR2_EXTERNAL_edvo_PATH)/board/=
edvotek/edvo3br_busybox_defconfig&quot;<br>BR2_PACKAGE_FFMPEG=3Dy<br>BR2_PA=
CKAGE_FFMPEG_SWSCALE=3Dy<br>BR2_PACKAGE_BZIP2=3Dy<br>BR2_PACKAGE_GZIP=3Dy<b=
r>BR2_PACKAGE_XZ=3Dy<br>BR2_PACKAGE_SPIDEV_TEST=3Dy<br>BR2_PACKAGE_VALGRIND=
=3Dy<br>BR2_PACKAGE_BINUTILS=3Dy<br>BR2_PACKAGE_BINUTILS_TARGET=3Dy<br>BR2_=
PACKAGE_LIBTOOL=3Dy<br>BR2_PACKAGE_E2FSPROGS=3Dy<br>BR2_PACKAGE_E2FSPROGS_R=
ESIZE2FS=3Dy<br>BR2_PACKAGE_DEJAVU=3Dy<br>BR2_PACKAGE_LIBERATION=3Dy<br>BR2=
_PACKAGE_HICOLOR_ICON_THEME=3Dy<br>BR2_PACKAGE_KMSCUBE=3Dy<br>BR2_PACKAGE_M=
ESA3D_DEMOS=3Dy<br>BR2_PACKAGE_MESA3D=3Dy<br>BR2_PACKAGE_MESA3D_OSMESA_GALL=
IUM=3Dy<br>BR2_PACKAGE_MESA3D_OPENGL_EGL=3Dy<br>BR2_PACKAGE_MESA3D_OPENGL_E=
S=3Dy<br>BR2_PACKAGE_QT6BASE_DEFAULT_QPA=3D&quot;linuxfb&quot;<br>BR2_PACKA=
GE_QT6BASE_FONTCONFIG=3Dy<br>BR2_PACKAGE_QT6BASE_HARFBUZZ=3Dy<br>BR2_PACKAG=
E_QT6BASE_JPEG=3Dy<br>BR2_PACKAGE_QT6BASE_PNG=3Dy<br>BR2_PACKAGE_QT6BASE_SY=
SLOG=3Dy<br>BR2_PACKAGE_QT6CORE5COMPAT=3Dy<br>BR2_PACKAGE_QT6DECLARATIVE_QU=
ICK=3Dy<br>BR2_PACKAGE_QT6LANGUAGESERVER=3Dy<br>BR2_PACKAGE_QT6VIRTUALKEYBO=
ARD=3Dy<br>BR2_PACKAGE_LINUX_FIRMWARE=3Dy<br>BR2_PACKAGE_LINUX_FIRMWARE_TI_=
WL18XX=3Dy<br>BR2_PACKAGE_18XX_TI_UTILS=3Dy<br>BR2_PACKAGE_EVTEST=3Dy<br>BR=
2_PACKAGE_I2C_TOOLS=3Dy<br>BR2_PACKAGE_LIBMANETTE=3Dy<br>BR2_PACKAGE_LSHW=
=3Dy<br>BR2_PACKAGE_PARTED=3Dy<br>BR2_PACKAGE_PICOCOM=3Dy<br>BR2_PACKAGE_SP=
I_TOOLS=3Dy<br>BR2_PACKAGE_STATSERIAL=3Dy<br>BR2_PACKAGE_STM32FLASH=3Dy<br>=
BR2_PACKAGE_SYSSTAT=3Dy<br>BR2_PACKAGE_TI_UIM=3Dy<br>BR2_PACKAGE_TI_UTILS=
=3Dy<br>BR2_PACKAGE_ENSCRIPT=3Dy<br>BR2_PACKAGE_LUA=3Dy<br>BR2_PACKAGE_LSQL=
ITE3=3Dy<br>BR2_PACKAGE_LZLIB=3Dy<br>BR2_PACKAGE_PYTHON3=3Dy<br>BR2_PACKAGE=
_PYTHON3_SQLITE=3Dy<br>BR2_PACKAGE_PYTHON_CFFI=3Dy<br>BR2_PACKAGE_PYTHON_CY=
CLER=3Dy<br>BR2_PACKAGE_PYTHON_FLASK_CORS=3Dy<br>BR2_PACKAGE_PYTHON_JSONMOD=
ELS=3Dy<br>BR2_PACKAGE_PYTHON_JSONSCHEMA=3Dy<br>BR2_PACKAGE_PYTHON_KIWISOLV=
ER=3Dy<br>BR2_PACKAGE_PYTHON_LIBEVDEV=3Dy<br>BR2_PACKAGE_PYTHON_MSGPACK=3Dy=
<br>BR2_PACKAGE_PYTHON_NUMPY=3Dy<br>BR2_PACKAGE_PYTHON_PACKAGING=3Dy<br>BR2=
_PACKAGE_PYTHON_PILLOW=3Dy<br>BR2_PACKAGE_PYTHON_PIP=3Dy<br>BR2_PACKAGE_PYT=
HON_PYELFTOOLS=3Dy<br>BR2_PACKAGE_PYTHON_PYPARSING=3Dy<br>BR2_PACKAGE_PYTHO=
N_REGEX=3Dy<br>BR2_PACKAGE_PYTHON_SIMPLEJSON=3Dy<br>BR2_PACKAGE_PYTHON_SPID=
EV=3Dy<br>BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS=3Dy<br>BR2_PACKAGE_PYTHON_WR=
APT=3Dy<br>BR2_PACKAGE_PYTHON_ZOPE_INTERFACE=3Dy<br>BR2_PACKAGE_CA_CERTIFIC=
ATES=3Dy<br>BR2_PACKAGE_LIBGCRYPT=3Dy<br>BR2_PACKAGE_LIBNSS=3Dy<br>BR2_PACK=
AGE_LIBSECRET=3Dy<br>BR2_PACKAGE_LEVELDB=3Dy<br>BR2_PACKAGE_CAIRO_TEE=3Dy<b=
r>BR2_PACKAGE_CAIROMM=3Dy<br>BR2_PACKAGE_CAIROMM1_14=3Dy<br>BR2_PACKAGE_GD=
=3Dy<br>BR2_PACKAGE_GIFLIB=3Dy<br>BR2_PACKAGE_KMSXX=3Dy<br>BR2_PACKAGE_KMSX=
X_INSTALL_TESTS=3Dy<br>BR2_PACKAGE_LIBGTK3=3Dy<br>BR2_PACKAGE_LIBJXL=3Dy<br=
>BR2_PACKAGE_LIBSVG_CAIRO=3Dy<br>BR2_PACKAGE_OPENJPEG=3Dy<br>BR2_PACKAGE_PO=
PPLER=3Dy<br>BR2_PACKAGE_WOFF2=3Dy<br>BR2_PACKAGE_LIBCEC=3Dy<br>BR2_PACKAGE=
_LIBGPIOD=3Dy<br>BR2_PACKAGE_LIBGPIOD_TOOLS=3Dy<br>BR2_PACKAGE_LIBINPUT=3Dy=
<br>BR2_PACKAGE_LIBPCIACCESS=3Dy<br>BR2_PACKAGE_LIBSERIAL=3Dy<br>BR2_PACKAG=
E_LIBSERIALPORT=3Dy<br>BR2_PACKAGE_LIBUSB=3Dy<br>BR2_PACKAGE_TSLIB=3Dy<br>B=
R2_PACKAGE_BOOTSTRAP=3Dy<br>BR2_PACKAGE_CHARTJS=3Dy<br>BR2_PACKAGE_JSON_JAV=
ASCRIPT=3Dy<br>BR2_PACKAGE_VUEJS=3Dy<br>BR2_PACKAGE_CJSON=3Dy<br>BR2_PACKAG=
E_CJSON_UTILS=3Dy<br>BR2_PACKAGE_JANSSON=3Dy<br>BR2_PACKAGE_JSON_C=3Dy<br>B=
R2_PACKAGE_JSON_FOR_MODERN_CPP=3Dy<br>BR2_PACKAGE_JSON_GLIB=3Dy<br>BR2_PACK=
AGE_JSONCPP=3Dy<br>BR2_PACKAGE_LIBJSON=3Dy<br>BR2_PACKAGE_LIBUCL=3Dy<br>BR2=
_PACKAGE_LIBXMLPP=3Dy<br>BR2_PACKAGE_LIBXSLT=3Dy<br>BR2_PACKAGE_LIBYAML=3Dy=
<br>BR2_PACKAGE_YAML_CPP=3Dy<br>BR2_PACKAGE_LIBVPX=3Dy<br>BR2_PACKAGE_GEOIP=
=3Dy<br>BR2_PACKAGE_LIBCURL=3Dy<br>BR2_PACKAGE_LIBIDN2=3Dy<br>BR2_PACKAGE_L=
IBNDP=3Dy<br>BR2_PACKAGE_LIBPCAP=3Dy<br>BR2_PACKAGE_LIBSOUP3=3Dy<br>BR2_PAC=
KAGE_LIBSOUP3_SSL=3Dy<br>BR2_PACKAGE_LIBVNCSERVER=3Dy<br>BR2_PACKAGE_BOOST_=
JSON=3Dy<br>BR2_PACKAGE_GLM=3Dy<br>BR2_PACKAGE_GOBJECT_INTROSPECTION=3Dy<br=
>BR2_PACKAGE_GTEST=3Dy<br>BR2_PACKAGE_LIBATOMIC_OPS=3Dy<br>BR2_PACKAGE_LIBS=
ECCOMP=3Dy<br>BR2_PACKAGE_LIBSOLV=3Dy<br>BR2_PACKAGE_LIBUV=3Dy<br>BR2_PACKA=
GE_LINUX_PAM=3Dy<br>BR2_PACKAGE_ORC=3Dy<br>BR2_PACKAGE_QHULL=3Dy<br>BR2_PAC=
KAGE_ENCHANT=3Dy<br>BR2_PACKAGE_ICU=3Dy<br>BR2_PACKAGE_NCURSES_WCHAR=3Dy<br=
>BR2_PACKAGE_UTF8PROC=3Dy<br>BR2_PACKAGE_SHARED_MIME_INFO=3Dy<br>BR2_PACKAG=
E_APACHE=3Dy<br>BR2_PACKAGE_AVAHI=3Dy<br>BR2_PACKAGE_DHCP=3Dy<br>BR2_PACKAG=
E_DHCP_CLIENT=3Dy<br>BR2_PACKAGE_DHCPCD=3Dy<br>BR2_PACKAGE_IFUPDOWN=3Dy<br>=
BR2_PACKAGE_IPROUTE2=3Dy<br>BR2_PACKAGE_IPUTILS=3Dy<br>BR2_PACKAGE_IW=3Dy<b=
r>BR2_PACKAGE_IWD=3Dy<br>BR2_PACKAGE_NET_TOOLS=3Dy<br>BR2_PACKAGE_NTP=3Dy<b=
r>BR2_PACKAGE_NTP_NTPDATE=3Dy<br>BR2_PACKAGE_NTP_NTPTIME=3Dy<br>BR2_PACKAGE=
_OPENSSH=3Dy<br>BR2_PACKAGE_PPPD=3Dy<br>BR2_PACKAGE_RSYNC=3Dy<br>BR2_PACKAG=
E_TFTPD=3Dy<br>BR2_PACKAGE_WIRELESS_REGDB=3Dy<br>BR2_PACKAGE_WIRELESS_TOOLS=
=3Dy<br>BR2_PACKAGE_WPA_SUPPLICANT=3Dy<br>BR2_PACKAGE_WPA_SUPPLICANT_WEXT=
=3Dy<br>BR2_PACKAGE_WPA_SUPPLICANT_WIRED=3Dy<br>BR2_PACKAGE_WPA_SUPPLICANT_=
IBSS_RSN=3Dy<br>BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT=3Dy<br>BR2_PACKAGE_WP=
A_SUPPLICANT_WIFI_DISPLAY=3Dy<br>BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING=
=3Dy<br>BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN=3Dy<br>BR2_PACKAGE_WPA_SUPPLICA=
NT_DEBUG_SYSLOG=3Dy<br>BR2_PACKAGE_WPA_SUPPLICANT_WPS=3Dy<br>BR2_PACKAGE_WP=
A_SUPPLICANT_WPA3=3Dy<br>BR2_PACKAGE_WPA_SUPPLICANT_CLI=3Dy<br>BR2_PACKAGE_=
WPA_SUPPLICANT_WPA_CLIENT_SO=3Dy<br>BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=
=3Dy<br>BR2_PACKAGE_WPA_SUPPLICANT_DBUS=3Dy<br>BR2_PACKAGE_WPAN_TOOLS=3Dy<b=
r>BR2_PACKAGE_XINETD=3Dy<br>BR2_PACKAGE_XTABLES_ADDONS=3Dy<br>BR2_PACKAGE_B=
ASH=3Dy<br>BR2_PACKAGE_SUDO=3Dy<br>BR2_PACKAGE_BUBBLEWRAP=3Dy<br>BR2_PACKAG=
E_HTOP=3Dy<br>BR2_PACKAGE_PROCPS_NG=3Dy<br>BR2_PACKAGE_SEATD=3Dy<br>BR2_PAC=
KAGE_SEATD_DAEMON=3Dy<br>BR2_PACKAGE_SYSTEMD_RFKILL=3Dy<br>BR2_PACKAGE_UTIL=
_LINUX_BINARIES=3Dy<br>BR2_PACKAGE_UTIL_LINUX_KILL=3Dy<br>BR2_PACKAGE_UTIL_=
LINUX_RFKILL=3Dy<br>BR2_PACKAGE_XDG_DBUS_PROXY=3Dy<br>BR2_PACKAGE_NANO=3Dy<=
br>BR2_TARGET_ROOTFS_TAR_GZIP=3Dy<br>BR2_PACKAGE_HOST_CMAKE=3Dy<br>BR2_PACK=
AGE_HOST_DOSFSTOOLS=3Dy<br>BR2_PACKAGE_HOST_DTC=3Dy<br>BR2_PACKAGE_HOST_E2F=
SPROGS=3Dy<br>BR2_PACKAGE_HOST_GENIMAGE=3Dy<br>BR2_PACKAGE_HOST_IMAGEMAGICK=
=3Dy<br>BR2_PACKAGE_HOST_IMAGEMAGICK_XML=3Dy<br>BR2_PACKAGE_HOST_KMOD_XZ=3D=
y<br>BR2_PACKAGE_HOST_MESON_TOOLS=3Dy<br>BR2_PACKAGE_HOST_MTOOLS=3Dy<br>BR2=
_PACKAGE_HOST_PYTHON_CYTHON=3Dy<br>BR2_PACKAGE_HOST_PYTHON_GREENLET=3Dy<br>=
BR2_PACKAGE_HOST_PYTHON_LXML=3Dy<br>BR2_PACKAGE_HOST_PYTHON_PYYAML=3Dy<br>B=
R2_PACKAGE_HOST_PYTHON_XLRD=3Dy<br>BR2_PACKAGE_HOST_PYTHON3=3Dy<br>BR2_PACK=
AGE_HOST_PYTHON3_BZIP2=3Dy<br>BR2_PACKAGE_HOST_PYTHON3_XZ=3Dy<br>BR2_PACKAG=
E_HOST_PYTHON3_SSL=3Dy<br>BR2_PACKAGE_HOST_QT6TOOLS=3Dy<br>BR2_PACKAGE_HOST=
_QT6TOOLS_LINGUIST_TOOLS=3Dy<br><br></div><div>I applied the patch to <a hr=
ef=3D"http://qt6tools.mk">qt6tools.mk</a> and still getting the same error.=
=C2=A0 I see in output that the compile flag is present to disable Clang.<d=
iv><br></div><div>Output:</div><div>&gt;&gt;&gt; host-qt6tools 6.7.3 Extrac=
ting<br>xzcat /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/bu=
ildroot-2024.11-rc1/dl/qt6tools/qttools-everywhere-src-6.7.3.tar.xz | /home=
/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1=
/output/host/bin/tar --strip-components=3D1 -C /home/pholden/Projects/Edvot=
ek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/build/host-qt6t=
ools-6.7.3 =C2=A0 -xf -<br>&gt;&gt;&gt; host-qt6tools 6.7.3 Patching<br>&gt=
;&gt;&gt; host-qt6tools 6.7.3 Configuring<br>(mkdir -p /home/pholden/Projec=
ts/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/build/h=
ost-qt6tools-6.7.3//buildroot-build &amp;&amp; cd /home/pholden/Projects/Ed=
votek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/build/host-q=
t6tools-6.7.3//buildroot-build &amp;&amp; rm -f CMakeCache.txt &amp;&amp; P=
ATH=3D&quot;/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buil=
droot-2024.11-rc1/output/host/bin:/home/pholden/Projects/Edvotek01072025/ed=
votek-edvocycler3/buildroot-2024.11-rc1/output/host/sbin:/home/pholden/.pye=
nv/shims:/home/pholden/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:=
/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin&quot; P=
KG_CONFIG=3D&quot;/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler=
3/buildroot-2024.11-rc1/output/host/bin/pkg-config&quot; PKG_CONFIG_SYSROOT=
_DIR=3D&quot;/&quot; PKG_CONFIG_LIBDIR=3D&quot;/home/pholden/Projects/Edvot=
ek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/lib/pkgcon=
fig:/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-20=
24.11-rc1/output/host/share/pkgconfig&quot; PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=
=3D1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1 =C2=A0/usr/bin/cmake /home/pholden/Pr=
ojects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/bui=
ld/host-qt6tools-6.7.3/ -G&quot;Ninja&quot; -DCMAKE_MAKE_PROGRAM=3D&quot;/h=
ome/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-=
rc1/output/host/bin/ninja&quot; -DCMAKE_INSTALL_SO_NO_EXE=3D0 -DCMAKE_FIND_=
ROOT_PATH=3D&quot;/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler=
3/buildroot-2024.11-rc1/output/host&quot; -DCMAKE_FIND_ROOT_PATH_MODE_PROGR=
AM=3D&quot;BOTH&quot; -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=3D&quot;BOTH&quot=
; -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=3D&quot;BOTH&quot; -DCMAKE_INSTALL_PR=
EFIX=3D&quot;/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/bui=
ldroot-2024.11-rc1/output/host&quot; -DCMAKE_C_FLAGS=3D&quot;-O2 -I/home/ph=
olden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/ou=
tput/host/include&quot; -DCMAKE_CXX_FLAGS=3D&quot;-O2 -I/home/pholden/Proje=
cts/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/i=
nclude&quot; -DCMAKE_EXE_LINKER_FLAGS=3D&quot;-L/home/pholden/Projects/Edvo=
tek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/lib -Wl,-=
rpath,/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-=
2024.11-rc1/output/host/lib&quot; -DCMAKE_SHARED_LINKER_FLAGS=3D&quot;-L/ho=
me/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-r=
c1/output/host/lib -Wl,-rpath,/home/pholden/Projects/Edvotek01072025/edvote=
k-edvocycler3/buildroot-2024.11-rc1/output/host/lib&quot; -DCMAKE_C_COMPILE=
R=3D&quot;/usr/bin/gcc&quot; -DCMAKE_CXX_COMPILER=3D&quot;/usr/bin/g++&quot=
; =C2=A0-DCMAKE_C_COMPILER_LAUNCHER=3D&quot;&quot; -DCMAKE_CXX_COMPILER_LAU=
NCHER=3D&quot;&quot; =C2=A0-DCMAKE_COLOR_MAKEFILE=3DOFF -DBUILD_DOC=3DOFF -=
DBUILD_DOCS=3DOFF -DBUILD_EXAMPLE=3DOFF -DBUILD_EXAMPLES=3DOFF -DBUILD_TEST=
=3DOFF -DBUILD_TESTS=3DOFF -DBUILD_TESTING=3DOFF -DBUILD_SHARED_LIBS=3DON =
=C2=A0<font color=3D"#ff0000">-DFEATURE_clang=3DOFF</font> -DQT_BUILD_EXAMP=
LES=3DOFF -DQT_BUILD_TESTS=3DOFF -DFEATURE_linguist=3DOFF )<br>-- The CXX c=
ompiler identification is GNU 11.4.0<br>-- The C compiler identification is=
 GNU 11.4.0<br>-- Detecting CXX compiler ABI info<br>-- Detecting CXX compi=
ler ABI info - done<br>-- Check for working CXX compiler: /usr/bin/g++ - sk=
ipped<br>-- Detecting CXX compile features<br>-- Detecting CXX compile feat=
ures - done<br>-- Detecting C compiler ABI info<br>-- Detecting C compiler =
ABI info - done<br>-- Check for working C compiler: /usr/bin/gcc - skipped<=
br>-- Detecting C compile features<br>-- Detecting C compile features - don=
e<br>-- Looking for pthread.h<br>-- Looking for pthread.h - found<br>-- Per=
forming Test CMAKE_HAVE_LIBC_PTHREAD<br>-- Performing Test CMAKE_HAVE_LIBC_=
PTHREAD - Success<br>-- Found Threads: TRUE =C2=A0<br>-- Performing Test HA=
VE_STDATOMIC<br>-- Performing Test HAVE_STDATOMIC - Success<br>-- Found Wra=
pAtomic: TRUE =C2=A0<br>-- Force setting build type to &#39;Release&#39;.<b=
r>CMake Error at /usr/lib/llvm-14/lib/cmake/clang/ClangTargets.cmake:750 (m=
essage):<br>=C2=A0 The imported target &quot;clangBasic&quot; references th=
e file<br><br>=C2=A0 =C2=A0 =C2=A0&quot;/usr/lib/llvm-14/lib/libclangBasic.=
a&quot;<br><br>=C2=A0 but this file does not exist.=C2=A0 Possible reasons =
include:<br><br>=C2=A0 * The file was deleted, renamed, or moved to another=
 location.<br><br>=C2=A0 * An install or uninstall procedure did not comple=
te successfully.<br><br>=C2=A0 * The installation package was faulty and co=
ntained<br><br>=C2=A0 =C2=A0 =C2=A0&quot;/usr/lib/llvm-14/lib/cmake/clang/C=
langTargets.cmake&quot;<br><br>=C2=A0 but not all the files it references.<=
br><br>Call Stack (most recent call first):<br>=C2=A0 /usr/lib/cmake/clang-=
14/ClangConfig.cmake:19 (include)<br>=C2=A0 cmake/FindWrapLibClang.cmake:17=
 (find_package)<br>=C2=A0 /home/pholden/Projects/Edvotek01072025/edvotek-ed=
vocycler3/buildroot-2024.11-rc1/output/build/host-qt6base-6.7.3/cmake/QtFin=
dPackageHelpers.cmake:156 (find_package)<br>=C2=A0 configure.cmake:20 (qt_f=
ind_package)<br>=C2=A0 /home/pholden/Projects/Edvotek01072025/edvotek-edvoc=
ycler3/buildroot-2024.11-rc1/output/build/host-qt6base-6.7.3/cmake/QtFeatur=
e.cmake:678 (include)<br>=C2=A0 src/CMakeLists.txt:18 (qt_feature_evaluate_=
features)<br><br><br>-- Configuring incomplete, errors occurred!<br>See als=
o &quot;/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroo=
t-2024.11-rc1/output/build/host-qt6tools-6.7.3/buildroot-build/CMakeFiles/C=
MakeOutput.log&quot;.<br>make[1]: *** [package/<a href=3D"http://pkg-generi=
c.mk:279">pkg-generic.mk:279</a>: /home/pholden/Projects/Edvotek01072025/ed=
votek-edvocycler3/buildroot-2024.11-rc1/output/build/host-qt6tools-6.7.3/.s=
tamp_configured] Error 1<br>make: *** [Makefile:83: _all] Error 2<br></div>=
</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Jan 16, 2025 at 8:00=E2=80=AFAM Roy K=
ollen Svendsen &lt;<a href=3D"mailto:roykollensvendsen@gmail.com">roykollen=
svendsen@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div dir=3D"ltr"><div>Hi,</div><div><br></div><div>Since =
I&#39;m the root cause of the problem I sent you a patch here:<br></div><di=
v><br></div><div><a href=3D"https://patchwork.ozlabs.org/project/buildroot/=
patch/20250116125537.531666-1-roykollensvendsen@gmail.com/" target=3D"_blan=
k">https://patchwork.ozlabs.org/project/buildroot/patch/20250116125537.5316=
66-1-roykollensvendsen@gmail.com/</a></div><div><br></div><div>Please test =
if this fixes your problem add you Tested-By etc.</div><div><br></div><div>=
Roy<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">tor. 16. jan. 2025 kl. 13:17 skrev Roy Kollen Svendsen &lt;<a =
href=3D"mailto:roykollensvendsen@gmail.com" target=3D"_blank">roykollensven=
dsen@gmail.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div dir=3D"ltr"><div><br></div><div>qttools require at least clang=
 17. So we should not try to enable support unless suitable version is avai=
lable.</div><div><br></div><div>So we should set -DFEATURE_clang=3DOFF</div=
><div><br></div><div>-Roy<br></div><br></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">tor. 16. jan. 2025 kl. 11:23 skrev R=
oy Kollen Svendsen &lt;<a href=3D"mailto:roykollensvendsen@gmail.com" targe=
t=3D"_blank">roykollensvendsen@gmail.com</a>&gt;:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hi Patricia,</div><=
div><br></div><div>I&#39;ll take look at this as soon as I get a chance. Ca=
n you send me a minimal config that recreate the problem?</div><div><br></d=
iv><div>Thanks in advance,</div><div><br></div><div>Roy</div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">tir. 14. jan. =
2025 kl. 20:16 skrev Patricia Holden &lt;<a href=3D"mailto:pholden@nklabs.c=
om" target=3D"_blank">pholden@nklabs.com</a>&gt;:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr">We are using Buildroot v=
ersion &quot;2024.11-rc1.=C2=A0 We just turned on &quot;Host Utilities-&gt;=
host qt6 tools-&gt;host linguistic tools&quot;.=C2=A0 I run make, get the e=
rror and output below.=C2=A0 Is there a fix for this?=C2=A0 Am I missing a =
dependency I need to install on my host PC?<div><br></div><div>Thanks!</div=
><div>Pat<br><div><br></div><div>make BR2_EXTERNAL=3D../edvo_br host-qt6too=
ls<br>&gt;&gt;&gt; host-qt6tools 6.7.3 Configuring<br>(mkdir -p /home/phold=
en/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/outpu=
t/build/host-qt6tools-6.7.3//buildroot-build &amp;&amp; cd /home/pholden/Pr=
ojects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/bui=
ld/host-qt6tools-6.7.3//buildroot-build &amp;&amp; rm -f CMakeCache.txt &am=
p;&amp; PATH=3D&quot;/home/pholden/Projects/Edvotek01072025/edvotek-edvocyc=
ler3/buildroot-2024.11-rc1/output/host/bin:/home/pholden/Projects/Edvotek01=
072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/sbin:/home/pho=
lden/.pyenv/shims:/home/pholden/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/=
usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bi=
n&quot; PKG_CONFIG=3D&quot;/home/pholden/Projects/Edvotek01072025/edvotek-e=
dvocycler3/buildroot-2024.11-rc1/output/host/bin/pkg-config&quot; PKG_CONFI=
G_SYSROOT_DIR=3D&quot;/&quot; PKG_CONFIG_LIBDIR=3D&quot;/home/pholden/Proje=
cts/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/l=
ib/pkgconfig:/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/bui=
ldroot-2024.11-rc1/output/host/share/pkgconfig&quot; PKG_CONFIG_ALLOW_SYSTE=
M_CFLAGS=3D1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1 =C2=A0/usr/bin/cmake /home/ph=
olden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/ou=
tput/build/host-qt6tools-6.7.3/ -G&quot;Ninja&quot; -DCMAKE_MAKE_PROGRAM=3D=
&quot;/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-=
2024.11-rc1/output/host/bin/ninja&quot; -DCMAKE_INSTALL_SO_NO_EXE=3D0 -DCMA=
KE_FIND_ROOT_PATH=3D&quot;/home/pholden/Projects/Edvotek01072025/edvotek-ed=
vocycler3/buildroot-2024.11-rc1/output/host&quot; -DCMAKE_FIND_ROOT_PATH_MO=
DE_PROGRAM=3D&quot;BOTH&quot; -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=3D&quot;B=
OTH&quot; -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=3D&quot;BOTH&quot; -DCMAKE_IN=
STALL_PREFIX=3D&quot;/home/pholden/Projects/Edvotek01072025/edvotek-edvocyc=
ler3/buildroot-2024.11-rc1/output/host&quot; -DCMAKE_C_FLAGS=3D&quot;-O2 -I=
/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.1=
1-rc1/output/host/include&quot; -DCMAKE_CXX_FLAGS=3D&quot;-O2 -I/home/phold=
en/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/outpu=
t/host/include&quot; -DCMAKE_EXE_LINKER_FLAGS=3D&quot;-L/home/pholden/Proje=
cts/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/l=
ib -Wl,-rpath,/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/bu=
ildroot-2024.11-rc1/output/host/lib&quot; -DCMAKE_SHARED_LINKER_FLAGS=3D&qu=
ot;-L/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2=
024.11-rc1/output/host/lib -Wl,-rpath,/home/pholden/Projects/Edvotek0107202=
5/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/lib&quot; -DCMAKE_C=
_COMPILER=3D&quot;/usr/bin/gcc&quot; -DCMAKE_CXX_COMPILER=3D&quot;/usr/bin/=
g++&quot; =C2=A0-DCMAKE_C_COMPILER_LAUNCHER=3D&quot;&quot; -DCMAKE_CXX_COMP=
ILER_LAUNCHER=3D&quot;&quot; =C2=A0-DCMAKE_COLOR_MAKEFILE=3DOFF -DBUILD_DOC=
=3DOFF -DBUILD_DOCS=3DOFF -DBUILD_EXAMPLE=3DOFF -DBUILD_EXAMPLES=3DOFF -DBU=
ILD_TEST=3DOFF -DBUILD_TESTS=3DOFF -DBUILD_TESTING=3DOFF -DBUILD_SHARED_LIB=
S=3DON =C2=A0-DQT_BUILD_EXAMPLES=3DOFF -DQT_BUILD_TESTS=3DOFF -DFEATURE_lin=
guist=3DON )<br>-- The CXX compiler identification is GNU 11.4.0<br>-- The =
C compiler identification is GNU 11.4.0<br>-- Detecting CXX compiler ABI in=
fo<br>-- Detecting CXX compiler ABI info - done<br>-- Check for working CXX=
 compiler: /usr/bin/g++ - skipped<br>-- Detecting CXX compile features<br>-=
- Detecting CXX compile features - done<br>-- Detecting C compiler ABI info=
<br>-- Detecting C compiler ABI info - done<br>-- Check for working C compi=
ler: /usr/bin/gcc - skipped<br>-- Detecting C compile features<br>-- Detect=
ing C compile features - done<br>-- Looking for pthread.h<br>-- Looking for=
 pthread.h - found<br>-- Performing Test CMAKE_HAVE_LIBC_PTHREAD<br>-- Perf=
orming Test CMAKE_HAVE_LIBC_PTHREAD - Success<br>-- Found Threads: TRUE =C2=
=A0<br>-- Performing Test HAVE_STDATOMIC<br>-- Performing Test HAVE_STDATOM=
IC - Success<br>-- Found WrapAtomic: TRUE =C2=A0<br>-- Force setting build =
type to &#39;Release&#39;.<br>CMake Error at /usr/lib/llvm-14/lib/cmake/cla=
ng/ClangTargets.cmake:750 (message):<br>=C2=A0 The imported target &quot;cl=
angBasic&quot; references the file<br><br>=C2=A0 =C2=A0 =C2=A0&quot;/usr/li=
b/llvm-14/lib/libclangBasic.a&quot;<br><br>=C2=A0 but this file does not ex=
ist.=C2=A0 Possible reasons include:<br><br>=C2=A0 * The file was deleted, =
renamed, or moved to another location.<br><br>=C2=A0 * An install or uninst=
all procedure did not complete successfully.<br><br>=C2=A0 * The installati=
on package was faulty and contained<br><br>=C2=A0 =C2=A0 =C2=A0&quot;/usr/l=
ib/llvm-14/lib/cmake/clang/ClangTargets.cmake&quot;<br><br>=C2=A0 but not a=
ll the files it references.<br><br>Call Stack (most recent call first):<br>=
=C2=A0 /usr/lib/cmake/clang-14/ClangConfig.cmake:19 (include)<br>=C2=A0 cma=
ke/FindWrapLibClang.cmake:17 (find_package)<br>=C2=A0 /home/pholden/Project=
s/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/build/ho=
st-qt6base-6.7.3/cmake/QtFindPackageHelpers.cmake:156 (find_package)<br>=C2=
=A0 configure.cmake:20 (qt_find_package)<br>=C2=A0 /home/pholden/Projects/E=
dvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/build/host-=
qt6base-6.7.3/cmake/QtFeature.cmake:678 (include)<br>=C2=A0 src/CMakeLists.=
txt:18 (qt_feature_evaluate_features)<br><br><br>-- Configuring incomplete,=
 errors occurred!<br>See also &quot;/home/pholden/Projects/Edvotek01072025/=
edvotek-edvocycler3/buildroot-2024.11-rc1/output/build/host-qt6tools-6.7.3/=
buildroot-build/CMakeFiles/CMakeOutput.log&quot;.<br>make[1]: *** [package/=
<a href=3D"http://pkg-generic.mk:279" target=3D"_blank">pkg-generic.mk:279<=
/a>: /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2=
024.11-rc1/output/build/host-qt6tools-6.7.3/.stamp_configured] Error 1<br>m=
ake: *** [Makefile:83: _all] Error 2<br></div></div></div>
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

--000000000000ea800e062bd54d30--

--===============7134421179552085144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7134421179552085144==--
