Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAFACC6FD18
	for <buildroot@archiver.kernel.org>; Wed, 19 Apr 2023 22:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2423A60FA7;
	Wed, 19 Apr 2023 22:27:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2423A60FA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aBGvRUkfByc0; Wed, 19 Apr 2023 22:27:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F362160FB1;
	Wed, 19 Apr 2023 22:27:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F362160FB1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 82B511C431D
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 22:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B62581EFC
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 22:27:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B62581EFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oPqzMY2OJ9c5 for <buildroot@lists.busybox.net>;
 Wed, 19 Apr 2023 22:27:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A732581EF4
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A732581EF4
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 22:27:03 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4eca0563b31so177230e87.1
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 15:27:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681943221; x=1684535221;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=syM1dIANxZbkjRDyFjYTlhm5hFqYblEjxajHPjuk+lM=;
 b=BbrSTLcwMpjqyDXXoLvIXRWkOghurLzuVZWv4pF4ESGUzIaR543IxN1vqvGFkhrNnB
 wCkowYM/zTSNffexjHdlvg/5tzfpB15cuStpWKuYkM5+0w7Vo2xMskyUTZE8srT/RxBv
 +iXYiJYNVSCIbels7LdPNaR189qYnjf5sNg3wujdD7C8FljsRrfkhiSmb9zIgPNg/C7J
 uJWbh71Pe2XbC/5bLl8Xi3XqodtGroqrPBo7Bdmb47dbgrgeKdPWCBjWrMXIfS99ebhG
 yJhpIz6F8x2E6rcV0koBAAd73pOLWNj2rivLmCfsPtaztDD75PsvfKbxyrbjl8Te10ev
 kp4g==
X-Gm-Message-State: AAQBX9dNWzqzUALZ/8bWJm8waHgzwbvaE1fnUTXG9DfTgFn9+CYWp7xg
 ysCMdTOAoxfjHws0nDbSuTaTlIKFLIe31vOvGzY=
X-Google-Smtp-Source: AKy350YjlrFpA0vtyp+8SDyMG+ToDwLeAIJb6RQTOAskUcZNso8gx2+K3XLEoBm8CIDSr2yenFNNTM4VxsiFV7Qp6bQ=
X-Received: by 2002:a19:5214:0:b0:4eb:1192:ce6f with SMTP id
 m20-20020a195214000000b004eb1192ce6fmr4786574lfb.13.1681943221166; Wed, 19
 Apr 2023 15:27:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230412222602.1975782-1-aduskett@gmail.com>
 <20230412222602.1975782-3-aduskett@gmail.com>
 <e9b44ae1-c8ea-3dd5-f11f-c5e041272a38@othermo.de>
In-Reply-To: <e9b44ae1-c8ea-3dd5-f11f-c5e041272a38@othermo.de>
From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 19 Apr 2023 15:26:49 -0700
Message-ID: <CAFSsvmp9fEOtD3+8z3ad+PVT46ccM5p9uprppP278s2sYA00ig@mail.gmail.com>
To: Marcus Hoffmann <marcus.hoffmann@othermo.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681943221; x=1684535221;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=syM1dIANxZbkjRDyFjYTlhm5hFqYblEjxajHPjuk+lM=;
 b=L/9iRVItKphw2Ii04lTm2yhLFCw6r3gK0HCUkEHlIQAAAGnyM3ARWvool0wPOg9lRH
 ZuiWcr8V0hWMOrvXltVQRAsYlhMovxuf1RiKzrn2CF7jxGJ+d8bEISgMVXntqcuawlUg
 jeVP7qmISZdB0UVzq9c3qw6bYduglrd+8rPcDGHGfF9tdpWRvFCJ4ukJTxn+2mzvAWCu
 ovCfqXSTZbG5ZSKSYZojnVn8h8AXYoP13+vtDO31klxIUPdvcCYmGJzP5J9FQ7SQB0O6
 6Uub8RDC+kyossIdSOn1kS9h5+8hxgkBRZL3SwGLAgdIeTDm/BRTSt69XmVuBOcu1k+W
 4u+Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=L/9iRVIt
Subject: Re: [Buildroot] [PATCH 3/3] package/firewalld: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5099963010289678417=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5099963010289678417==
Content-Type: multipart/alternative; boundary="0000000000003ae7ae05f9b7ec4c"

--0000000000003ae7ae05f9b7ec4c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hell Marcus! Thanks for testing!

On Thu, Apr 13, 2023 at 2:29=E2=80=AFAM Marcus Hoffmann <marcus.hoffmann@ot=
hermo.de>
wrote:

> Hi Adam,
>
> thanks for submitting this! I tried to package firewalld a while back
> but eventually gave up.
>
> I'll try to test this soon.
>
> Marcus
>
> On 13.04.23 00:26, Adam Duskett wrote:
> > Firewalld provides a dynamically managed firewall with
> > support for network or firewall zones to define the trust level of
> network
> > connections or interfaces.
> >
> > Items of note:
> >
> >   - Setting PYTHON=3D"/usr/bin/env python$(PYTHON3_VERSION_MAJOR)" prev=
ents
> >     Firewalld from setting the shebang in the installed python files to
> the
> >     full path to the python interpreter used when building.
> >
> >   - The bundled provided SYSV init file has several bashisms and requir=
es
> >     /etc/init.d/functions which buildroot doesn't provide. So instead, =
a
> more
> >     simple init.d file is provided in the package directory, which does
> not
> >     require bash.
> >
> >   - Firewalld >=3D 1.0.0 requires a linux kernel version of 5.3 or late=
r.
> >     Because Buildroot does not have a mechanism to detect what version =
a
> user
> >     is compiling if the kernel is external, there is no way to prevent =
a
> user
> >     with an external kernel older than 5.3 to select this package.
> >
> >   - To run, Firewalld requires enabling almost every single nftables
> option in
> >     the kernel menuconfig. Indeed for a regular user, this task is quit=
e
> a
> >     time-consuming operation, and missing even one required nftables
> option
> >     results in firewalld failing to start.
> >
> >     Through a mix of trial and error and talking to the upstream
> developers,
> >     the package selects the minimum amount of kernel options required f=
or
> >     runtime. Understandably the list is daunting. However, these option=
s
> >     have passed run-time tests with kernel 5.3 (the minimum kernel
> version
> >     required) and kernel 6.2.10 (the latest kernel version as of this
> commit
> >     log.)
> >
> > As such, it is safe to say these options will work for anybody wanting =
to
> > use firewalld with a supported kernel version of 4.18 or higher.
> >
> > Signed-off-by: Adam Duskett <aduskett@gmail.com>
> > ---
> >   package/Config.in                |   1 +
> >   package/firewalld/Config.in      |  43 ++++++
> >   package/firewalld/S46firewalld   |  66 ++++++++
> >   package/firewalld/firewalld.hash |   3 +
> >   package/firewalld/firewalld.mk   | 257 ++++++++++++++++++++++++++++++=
+
> >   5 files changed, 370 insertions(+)
> >   create mode 100644 package/firewalld/Config.in
> >   create mode 100644 package/firewalld/S46firewalld
> >   create mode 100644 package/firewalld/firewalld.hash
> >   create mode 100644 package/firewalld/firewalld.mk
> >
> > diff --git a/package/Config.in b/package/Config.in
> > index 760dda6ac1..78f3fca6ed 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -2311,6 +2311,7 @@ endif
> >       source "package/fail2ban/Config.in"
> >       source "package/fastd/Config.in"
> >       source "package/fcgiwrap/Config.in"
> > +     source "package/firewalld/Config.in"
> >       source "package/flannel/Config.in"
> >       source "package/fmc/Config.in"
> >       source "package/fping/Config.in"
> > diff --git a/package/firewalld/Config.in b/package/firewalld/Config.in
> > new file mode 100644
> > index 0000000000..2265fe9dd4
> > --- /dev/null
> > +++ b/package/firewalld/Config.in
> > @@ -0,0 +1,43 @@
> > +config BR2_PACKAGE_FIREWALLD
> > +     bool "firewalld"
> > +     depends on BR2_USE_MMU # gobject-introspection, python-gobject
> > +     depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
> > +     depends on BR2_USE_WCHAR # glib2, dbus-python, nftables
> > +     depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gobject-introspection
> > +     depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-python
> > +     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
> > +     depends on BR2_TOOLCHAIN_USES_GLIBC # gobject-introspection
> > +     depends on BR2_HOST_GCC_AT_LEAST_8 # gobject-introspection ->
> host-qemu
> > +     depends on BR2_PACKAGE_PYTHON3 # dbus-python, gobject-introspecti=
on
> > +     select BR2_PACKAGE_DBUS # dbus-python
> > +     select BR2_PACKAGE_DBUS_PYTHON
> > +     select BR2_PACKAGE_GOBJECT_INTROSPECTION
> > +     select BR2_PACKAGE_JANSSON # Uses the nftables json interface
> > +     select BR2_PACKAGE_NFTABLES
> > +     select BR2_PACKAGE_PYTHON_GOBJECT
> > +     help
> > +       Firewalld provides a dynamically managed firewall with
> > +       support for network or firewall zones to define the trust
> > +       level of network connections or interfaces. It has support
> > +       for IPv4, IPv6 firewall settings and for ethernet bridges and
> > +       a separation of runtime and permanent configuration options.
> > +       It also provides an interface for services or applications to
> > +       add ip*tables and ebtables rules directly.
> > +
> > +       Note: Firewalld uses nftables as the backend as requires
> > +       kernel version >=3D 4.18.
>
> The double *as* seems like a typo here somehow? Or at least I can't
> quite parse this sentence as it stands.
>

Yes, this was a mistake. Including the 4.18. It was taken from a previous
patch set of mine from over two years ago!
It should read:
 Note: Firewalld uses nftables as the backend and requires kernel version
>=3D 5.3

>
> > +
> > +       https://github.com/firewalld/firewalld
> > +
> > +comment "firewalld needs python3"
> > +     depends on !BR2_PACKAGE_PYTHON3
> > +     depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
> > +
> > +comment "firewalld needs a glibc toolchain w/ wchar, dynamic library,
> headers >=3D 3.12, gcc >=3D 4.9, host gcc >=3D 8"
> > +     depends on BR2_USE_MMU
> > +     depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
> > +     depends on !BR2_TOOLCHAIN_USES_GLIBC || \
> > +             !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
> > +             !BR2_USE_WCHAR || BR2_STATIC_LIBS || \
> > +             !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> > +             !BR2_HOST_GCC_AT_LEAST_8
> > diff --git a/package/firewalld/S46firewalld
> b/package/firewalld/S46firewalld
> > new file mode 100644
> > index 0000000000..40f43e1f57
> > --- /dev/null
> > +++ b/package/firewalld/S46firewalld
> > @@ -0,0 +1,66 @@
> > +#!/bin/sh
> > +
> > +DAEMON=3Dfirewalld
> > +PIDFILE=3D/var/run/$DAEMON.pid
> > +
> > +start() {
> > +     printf "Starting firewalld: "
> > +     start-stop-daemon -S -q --exec $DAEMON
> > +     status=3D$?
> > +     if [ "$status" -eq 0 ]; then
> > +             echo "OK"
> > +     else
> > +             echo "FAIL"
> > +     fi
> > +}
> > +stop() {
> > +     printf "Stopping firewalld: "
> > +     start-stop-daemon --stop --quiet --pidfile $PIDFILE
> > +     status=3D$?
> > +     if [ "$status" -eq 0 ]; then
> > +             echo "OK"
> > +     else
> > +             echo "FAIL"
> > +     fi
> > +}
> > +
> > +reload(){
> > +     printf "Reloading firewalld: "
> > +     firewall-cmd --reload
> > +     status=3D$?
> > +     if [ "$status" -eq 0 ]; then
> > +             echo "OK"
> > +     else
> > +             echo "FAIL"
> > +     fi
> > +}
> > +
> > +restart() {
> > +     stop
> > +     start
> > +}
> > +
> > +status(){
> > +     firewall-cmd --state
> > +}
> > +
> > +case "$1" in
> > +             start)
> > +                     start
> > +                     ;;
> > +             stop)
> > +                     stop
> > +                     ;;
> > +             restart)
> > +                     restart
> > +                     ;;
> > +             reload)
> > +                     reload
> > +                     ;;
> > +             status)
> > +                     status
> > +                     ;;
> > +             *)
> > +                     echo "Usage: $0 {start|stop|restart|reload|status=
}"
> > +                     exit 1
> > +esac
> > diff --git a/package/firewalld/firewalld.hash
> b/package/firewalld/firewalld.hash
> > new file mode 100644
> > index 0000000000..462bff5b42
> > --- /dev/null
> > +++ b/package/firewalld/firewalld.hash
> > @@ -0,0 +1,3 @@
> > +# Locally computed
> > +sha256
> bf26db8937305f1641798f9bf71545fec9c0241c4b2a512a6a93225e0b2cd310
> firewalld-1.3.0.tar.gz
> > +sha256
> 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> > diff --git a/package/firewalld/firewalld.mk b/package/firewalld/
> firewalld.mk
> > new file mode 100644
> > index 0000000000..efb0686720
> > --- /dev/null
> > +++ b/package/firewalld/firewalld.mk
> > @@ -0,0 +1,257 @@
> >
> +########################################################################=
########
> > +#
> > +# firewalld
> > +#
> >
> +########################################################################=
########
> > +
> > +FIREWALLD_VERSION =3D 1.3.0
> > +FIREWALLD_SITE =3D $(call
> github,firewalld,firewalld,v$(FIREWALLD_VERSION))
> > +FIREWALLD_LICENSE =3D GPL-2.0
> > +FIREWALLD_LICENSE_FILES =3D COPYING
> > +FIREWALLD_AUTORECONF =3D YES
> > +
> > +FIREWALLD_DEPENDENCIES =3D \
> > +     host-intltool \
> > +     host-libglib2 \
> > +     host-libxml2 \
> > +     host-libxslt \
> > +     dbus-python \
> > +     gobject-introspection \
> > +     jansson \
> > +     nftables \
> > +     python3 \
> > +     python-gobject
> > +
> > +# Firewalld hard codes the python shebangs to the full path of the
> > +# python-interpreter. IE: #!/home/buildroot/output/host/bin/python.
> > +# Force the proper python path.
> > +FIREWALLD_CONF_ENV +=3D PYTHON=3D"/usr/bin/env python3"
> > +
> > +# /etc/sysconfig/firewalld is a Red Hat-ism, only referenced by
> > +# the Red Hat-specific init script which isn't used, so we set
> > +# --disable-sysconfig.
> > +FIREWALLD_CONF_OPTS +=3D \
> > +     --disable-rpmmacros \
> > +     --disable-sysconfig \
> > +     --with-nft=3D/usr/sbin/nft \
> > +     --without-ebtables \
> > +     --without-ebtables-restore \
> > +     --without-ipset \
> > +     --without-xml-catalog
> > +
> > +ifeq ($(BR2_PACKAGE_IPTABLES),y)
> > +FIREWALLD_DEPENDENCIES +=3D iptables
> > +FIREWALLD_CONF_OPTS +=3D \
> > +     --with-ip6tables-restore=3D/usr/sbin/ip6tables-restore \
> > +     --with-ip6tables=3D/usr/sbin/ip6tables \
> > +     --with-iptables-restore=3D/usr/sbin/iptables-restore \
> > +     --with-iptables=3D/usr/sbin/iptables
> > +else
> > +FIREWALLD_CONF_OPTS +=3D -without-iptables
> > +endif
> > +
> > +ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
> > +FIREWALLD_CONF_OPTS +=3D --enable-nls
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> > +FIREWALLD_DEPENDENCIES +=3D systemd
> > +FIREWALLD_CONF_OPTS +=3D --with-systemd-unitdir=3D/usr/lib/systemd/sys=
tem
> > +else
> > +FIREWALLD_CONF_OPTS +=3D --disable-systemd
> > +endif
> > +
> > +define FIREWALLD_INSTALL_INIT_SYSTEMD
> > +     $(INSTALL) -D -m 0644 $(@D)/config/firewalld.service \
> > +             $(TARGET_DIR)/usr/lib/systemd/system/firewalld.service
> > +endef
> > +
> > +# The bundled sysvinit file requires /etc/init.d/functions which is no=
t
> > +# provided by buildroot. As such, we provide our own firewalld init
> file.
> > +define FIREWALLD_INSTALL_INIT_SYSV
> > +     $(INSTALL) -D -m 0755 $(FIREWALLD_PKGDIR)/S46firewalld \
> > +             $(TARGET_DIR)/etc/init.d/S46firewalld
> > +endef
> > +
> > +# Firewalld requires almost every single nftable option selected.
> > +define FIREWALLD_LINUX_CONFIG_FIXUPS
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_BRIDGE)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_FILTER)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_IPTABLES)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_MANGLE)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_MATCH_AH)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_MATCH_EUI64)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_MATCH_FRAG)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_MATCH_HL)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_MATCH_IPV6HEADER)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_MATCH_MH)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_MATCH_OPTS)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_MATCH_RPFILTER)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_MATCH_RT)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_MATCH_SRH)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_NAT)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_RAW)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_TARGET_HL)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_TARGET_MASQUERADE)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_TARGET_NPT)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_TARGET_REJECT)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_TARGET_SYNPROXY)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_ARP_MANGLE)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_ARPFILTER)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_ARPTABLES)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_FILTER)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_IPTABLES)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_MANGLE)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_MATCH_AH)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_MATCH_ECN)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_MATCH_RPFILTER)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_MATCH_TTL)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_NAT)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_RAW)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_CLUSTERIP)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_ECN)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_MASQUERADE)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_NETMAP)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_REDIRECT)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_REJECT)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_SYNPROXY)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_TTL)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_BITMAP_IP)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_BITMAP_IPMAC)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_BITMAP_PORT)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_HASH_IP)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_HASH_IPMAC)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_HASH_IPMARK)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_HASH_IPPORT)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_HASH_IPPORTIP)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_HASH_IPPORTNET)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_HASH_MAC)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_HASH_NET)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_HASH_NETIFACE)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_HASH_NETNET)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_HASH_NETPORT)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_HASH_NETPORTNET)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_LIST_SET)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_CONNCOUNT)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_NETLINK_GLUE_CT)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_SYNPROXY)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XTABLES)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_AMANDA)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_BROADCAST)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_EVENTS)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_FTP)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_H323)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_IRC)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_LABELS)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_MARK)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_NETBIOS_NS)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_PPTP)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_PROCFS)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_SANE)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_SIP)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_SNMP)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_TFTP)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_TIMEOUT)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_TIMESTAMP)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_ZONES)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_CT_NETLINK)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_CT_NETLINK_HELPER)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_CT_NETLINK_TIMEOUT)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_CT_PROTO_DCCP)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_CT_PROTO_GRE)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_CT_PROTO_SCTP)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_CT_PROTO_UDPLITE)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_DEFRAG_IPV4)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_DEFRAG_IPV6)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_DUP_IPV4)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_DUP_IPV6)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_DUP_NETDEV)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_FLOW_TABLE)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_FLOW_TABLE_INET)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_FLOW_TABLE_IPV4)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_FLOW_TABLE_IPV6)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_LOG_ARP)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_LOG_BRIDGE)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_LOG_COMMON)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_LOG_IPV4)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_LOG_IPV6)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_LOG_NETDEV)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_AMANDA)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_FTP)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_H323)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_IPV4)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_IPV6)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_IRC)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_MASQUERADE_IPV4)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_MASQUERADE_IPV6)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_NEEDED)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_PPTP)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_PROTO_DCCP)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_PROTO_GRE)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_PROTO_SCTP)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_PROTO_UDPLITE)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_REDIRECT)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_SIP)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_SNMP_BASIC)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_TFTP)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_REJECT_IPV4)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_REJECT_IPV6)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_SOCKET_IPV4)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_SOCKET_IPV6)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_ARP)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_BRIDGE)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_IPV4)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_IPV6)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_NETDEV)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_SET)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_TPROXY_IPV4)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NF_TPROXY_IPV6)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_BRIDGE_REJECT)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_CHAIN_NAT_IPV4)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_CHAIN_NAT_IPV6)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_CHAIN_ROUTE_IPV4)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_CHAIN_ROUTE_IPV6)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_COMPAT)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_CONNLIMIT)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_COUNTER)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_CT)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_DUP_IPV4)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_DUP_IPV6)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_DUP_NETDEV)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_FIB)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_FIB_INET)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_FIB_IPV4)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_FIB_IPV6)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_FIB_NETDEV)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_FLOW_OFFLOAD)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_FWD_NETDEV)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_HASH)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_LIMIT)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_LOG)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_MASQ)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_MASQ_IPV4)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_MASQ_IPV6)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_NAT)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_NUMGEN)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_OBJREF)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_OSF)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_QUEUE)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_QUOTA)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_REDIR)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_REDIR_IPV4)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_REDIR_IPV6)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_REJECT)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_REJECT_INET)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_REJECT_IPV4)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_REJECT_IPV6)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_REJECT_NETDEV)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_SOCKET)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_SYNPROXY)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_TPROXY)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NFT_TUNNEL)
> > +endef
> > +
> > +$(eval $(autotools-package))
> ________________________________
>
> othermo GmbH | Sitz der Gesellschaft: Alzenau | Amtsgericht Aschaffenburg=
:
> HRB 14783 | USt-IdNr.: DE319977978 | Gesch=C3=A4ftsf=C3=BChrung: Dr. Denn=
is Metz.
>

--0000000000003ae7ae05f9b7ec4c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hell Marcus! Thanks for testing!</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 13, 2023=
 at 2:29=E2=80=AFAM Marcus Hoffmann &lt;<a href=3D"mailto:marcus.hoffmann@o=
thermo.de">marcus.hoffmann@othermo.de</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">Hi Adam,<br>
<br>
thanks for submitting this! I tried to package firewalld a while back<br>
but eventually gave up.<br>
<br>
I&#39;ll try to test this soon.<br>
<br>
Marcus<br>
<br>
On 13.04.23 00:26, Adam Duskett wrote:<br>
&gt; Firewalld provides a dynamically managed firewall with<br>
&gt; support for network or firewall zones to define the trust level of net=
work<br>
&gt; connections or interfaces.<br>
&gt;<br>
&gt; Items of note:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0- Setting PYTHON=3D&quot;/usr/bin/env python$(PYTHON3_VERS=
ION_MAJOR)&quot; prevents<br>
&gt;=C2=A0 =C2=A0 =C2=A0Firewalld from setting the shebang in the installed=
 python files to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0full path to the python interpreter used when build=
ing.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0- The bundled provided SYSV init file has several bashisms=
 and requires<br>
&gt;=C2=A0 =C2=A0 =C2=A0/etc/init.d/functions which buildroot doesn&#39;t p=
rovide. So instead, a more<br>
&gt;=C2=A0 =C2=A0 =C2=A0simple init.d file is provided in the package direc=
tory, which does not<br>
&gt;=C2=A0 =C2=A0 =C2=A0require bash.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0- Firewalld &gt;=3D 1.0.0 requires a linux kernel version =
of 5.3 or later.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Because Buildroot does not have a mechanism to dete=
ct what version a user<br>
&gt;=C2=A0 =C2=A0 =C2=A0is compiling if the kernel is external, there is no=
 way to prevent a user<br>
&gt;=C2=A0 =C2=A0 =C2=A0with an external kernel older than 5.3 to select th=
is package.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0- To run, Firewalld requires enabling almost every single =
nftables option in<br>
&gt;=C2=A0 =C2=A0 =C2=A0the kernel menuconfig. Indeed for a regular user, t=
his task is quite a<br>
&gt;=C2=A0 =C2=A0 =C2=A0time-consuming operation, and missing even one requ=
ired nftables option<br>
&gt;=C2=A0 =C2=A0 =C2=A0results in firewalld failing to start.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Through a mix of trial and error and talking to the=
 upstream developers,<br>
&gt;=C2=A0 =C2=A0 =C2=A0the package selects the minimum amount of kernel op=
tions required for<br>
&gt;=C2=A0 =C2=A0 =C2=A0runtime. Understandably the list is daunting. Howev=
er, these options<br>
&gt;=C2=A0 =C2=A0 =C2=A0have passed run-time tests with kernel 5.3 (the min=
imum kernel version<br>
&gt;=C2=A0 =C2=A0 =C2=A0required) and kernel 6.2.10 (the latest kernel vers=
ion as of this commit<br>
&gt;=C2=A0 =C2=A0 =C2=A0log.)<br>
&gt;<br>
&gt; As such, it is safe to say these options will work for anybody wanting=
 to<br>
&gt; use firewalld with a supported kernel version of 4.18 or higher.<br>
&gt;<br>
&gt; Signed-off-by: Adam Duskett &lt;<a href=3D"mailto:aduskett@gmail.com" =
target=3D"_blank">aduskett@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 =C2=A0package/firewalld/Config.in=C2=A0 =C2=A0 =C2=A0 |=C2=A0 43=
 ++++++<br>
&gt;=C2=A0 =C2=A0package/firewalld/S46firewalld=C2=A0 =C2=A0|=C2=A0 66 ++++=
++++<br>
&gt;=C2=A0 =C2=A0package/firewalld/firewalld.hash |=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 =C2=A0package/firewalld/<a href=3D"http://firewalld.mk" rel=3D"n=
oreferrer" target=3D"_blank">firewalld.mk</a>=C2=A0 =C2=A0| 257 +++++++++++=
++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A05 files changed, 370 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 package/firewalld/Config.in<br>
&gt;=C2=A0 =C2=A0create mode 100644 package/firewalld/S46firewalld<br>
&gt;=C2=A0 =C2=A0create mode 100644 package/firewalld/firewalld.hash<br>
&gt;=C2=A0 =C2=A0create mode 100644 package/firewalld/<a href=3D"http://fir=
ewalld.mk" rel=3D"noreferrer" target=3D"_blank">firewalld.mk</a><br>
&gt;<br>
&gt; diff --git a/package/Config.in b/package/Config.in<br>
&gt; index 760dda6ac1..78f3fca6ed 100644<br>
&gt; --- a/package/Config.in<br>
&gt; +++ b/package/Config.in<br>
&gt; @@ -2311,6 +2311,7 @@ endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/fail2ban/Config.in&quot=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/fastd/Config.in&quot;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/fcgiwrap/Config.in&quot=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0source &quot;package/firewalld/Config.in&quot;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/flannel/Config.in&quot;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/fmc/Config.in&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/fping/Config.in&quot;<b=
r>
&gt; diff --git a/package/firewalld/Config.in b/package/firewalld/Config.in=
<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..2265fe9dd4<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/firewalld/Config.in<br>
&gt; @@ -0,0 +1,43 @@<br>
&gt; +config BR2_PACKAGE_FIREWALLD<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;firewalld&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_USE_MMU # gobject-introspection, p=
ython-gobject<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH=
_SUPPORTS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_USE_WCHAR # glib2, dbus-python, nf=
tables<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gobje=
ct-introspection<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-pytho=
n<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_USES_GLIBC # gobject-int=
rospection<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_HOST_GCC_AT_LEAST_8 # gobject-intr=
ospection -&gt; host-qemu<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_PYTHON3 # dbus-python, gob=
ject-introspection<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_DBUS # dbus-python<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_DBUS_PYTHON<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_GOBJECT_INTROSPECTION<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_JANSSON # Uses the nftables js=
on interface<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_NFTABLES<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_PYTHON_GOBJECT<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Firewalld provides a dynamically managed f=
irewall with<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0support for network or firewall zones to d=
efine the trust<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0level of network connections or interfaces=
. It has support<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for IPv4, IPv6 firewall settings and for e=
thernet bridges and<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0a separation of runtime and permanent conf=
iguration options.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0It also provides an interface for services=
 or applications to<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0add ip*tables and ebtables rules directly.=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Note: Firewalld uses nftables as the backe=
nd as requires<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0kernel version &gt;=3D 4.18.<br>
<br>
The double *as* seems like a typo here somehow? Or at least I can&#39;t<br>
quite parse this sentence as it stands.<br></blockquote><div><br></div><div=
>Yes, this was a mistake. Including the 4.18. It was taken from a previous =
patch set of mine from over two years ago!</div><div>It should read:<br>=C2=
=A0Note: Firewalld uses nftables as the backend and requires kernel version=
 &gt;=3D 5.3</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/firewalld/fi=
rewalld" rel=3D"noreferrer" target=3D"_blank">https://github.com/firewalld/=
firewalld</a><br>
&gt; +<br>
&gt; +comment &quot;firewalld needs python3&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on !BR2_PACKAGE_PYTHON3<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH=
_SUPPORTS<br>
&gt; +<br>
&gt; +comment &quot;firewalld needs a glibc toolchain w/ wchar, dynamic lib=
rary, headers &gt;=3D 3.12, gcc &gt;=3D 4.9, host gcc &gt;=3D 8&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_USE_MMU<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH=
_SUPPORTS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on !BR2_TOOLCHAIN_USES_GLIBC || \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!BR2_TOOLCHAIN_HEADER=
S_AT_LEAST_3_12 || \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!BR2_USE_WCHAR || BR2=
_STATIC_LIBS || \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!BR2_TOOLCHAIN_GCC_AT=
_LEAST_4_9 || \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!BR2_HOST_GCC_AT_LEAS=
T_8<br>
&gt; diff --git a/package/firewalld/S46firewalld b/package/firewalld/S46fir=
ewalld<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..40f43e1f57<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/firewalld/S46firewalld<br>
&gt; @@ -0,0 +1,66 @@<br>
&gt; +#!/bin/sh<br>
&gt; +<br>
&gt; +DAEMON=3Dfirewalld<br>
&gt; +PIDFILE=3D/var/run/$DAEMON.pid<br>
&gt; +<br>
&gt; +start() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0printf &quot;Starting firewalld: &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0start-stop-daemon -S -q --exec $DAEMON<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status=3D$?<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if [ &quot;$status&quot; -eq 0 ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;OK&quot;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;FAIL&quot;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +}<br>
&gt; +stop() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0printf &quot;Stopping firewalld: &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0start-stop-daemon --stop --quiet --pidfile $PIDFI=
LE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status=3D$?<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if [ &quot;$status&quot; -eq 0 ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;OK&quot;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;FAIL&quot;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +}<br>
&gt; +<br>
&gt; +reload(){<br>
&gt; +=C2=A0 =C2=A0 =C2=A0printf &quot;Reloading firewalld: &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0firewall-cmd --reload<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status=3D$?<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if [ &quot;$status&quot; -eq 0 ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;OK&quot;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;FAIL&quot;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +}<br>
&gt; +<br>
&gt; +restart() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0stop<br>
&gt; +=C2=A0 =C2=A0 =C2=A0start<br>
&gt; +}<br>
&gt; +<br>
&gt; +status(){<br>
&gt; +=C2=A0 =C2=A0 =C2=A0firewall-cmd --state<br>
&gt; +}<br>
&gt; +<br>
&gt; +case &quot;$1&quot; in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0start)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0start<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stop)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0stop<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0restart)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0restart<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reload)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0reload<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0status<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0echo &quot;Usage: $0 {start|stop|restart|reload|status}&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0exit 1<br>
&gt; +esac<br>
&gt; diff --git a/package/firewalld/firewalld.hash b/package/firewalld/fire=
walld.hash<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..462bff5b42<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/firewalld/firewalld.hash<br>
&gt; @@ -0,0 +1,3 @@<br>
&gt; +# Locally computed<br>
&gt; +sha256=C2=A0 bf26db8937305f1641798f9bf71545fec9c0241c4b2a512a6a93225e=
0b2cd310=C2=A0 firewalld-1.3.0.tar.gz<br>
&gt; +sha256=C2=A0 8177f97513213526df2cf6184d8ff986c675afb514d4e68a40401052=
1b880643=C2=A0 COPYING<br>
&gt; diff --git a/package/firewalld/<a href=3D"http://firewalld.mk" rel=3D"=
noreferrer" target=3D"_blank">firewalld.mk</a> b/package/firewalld/<a href=
=3D"http://firewalld.mk" rel=3D"noreferrer" target=3D"_blank">firewalld.mk<=
/a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..efb0686720<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/firewalld/<a href=3D"http://firewalld.mk" rel=3D"norefer=
rer" target=3D"_blank">firewalld.mk</a><br>
&gt; @@ -0,0 +1,257 @@<br>
&gt; +#####################################################################=
###########<br>
&gt; +#<br>
&gt; +# firewalld<br>
&gt; +#<br>
&gt; +#####################################################################=
###########<br>
&gt; +<br>
&gt; +FIREWALLD_VERSION =3D 1.3.0<br>
&gt; +FIREWALLD_SITE =3D $(call github,firewalld,firewalld,v$(FIREWALLD_VER=
SION))<br>
&gt; +FIREWALLD_LICENSE =3D GPL-2.0<br>
&gt; +FIREWALLD_LICENSE_FILES =3D COPYING<br>
&gt; +FIREWALLD_AUTORECONF =3D YES<br>
&gt; +<br>
&gt; +FIREWALLD_DEPENDENCIES =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0host-intltool \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0host-libglib2 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0host-libxml2 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0host-libxslt \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dbus-python \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gobject-introspection \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0jansson \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0nftables \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0python3 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0python-gobject<br>
&gt; +<br>
&gt; +# Firewalld hard codes the python shebangs to the full path of the<br=
>
&gt; +# python-interpreter. IE: #!/home/buildroot/output/host/bin/python.<b=
r>
&gt; +# Force the proper python path.<br>
&gt; +FIREWALLD_CONF_ENV +=3D PYTHON=3D&quot;/usr/bin/env python3&quot;<br>
&gt; +<br>
&gt; +# /etc/sysconfig/firewalld is a Red Hat-ism, only referenced by<br>
&gt; +# the Red Hat-specific init script which isn&#39;t used, so we set<br=
>
&gt; +# --disable-sysconfig.<br>
&gt; +FIREWALLD_CONF_OPTS +=3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--disable-rpmmacros \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--disable-sysconfig \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--with-nft=3D/usr/sbin/nft \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--without-ebtables \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--without-ebtables-restore \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--without-ipset \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--without-xml-catalog<br>
&gt; +<br>
&gt; +ifeq ($(BR2_PACKAGE_IPTABLES),y)<br>
&gt; +FIREWALLD_DEPENDENCIES +=3D iptables<br>
&gt; +FIREWALLD_CONF_OPTS +=3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--with-ip6tables-restore=3D/usr/sbin/ip6tables-re=
store \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--with-ip6tables=3D/usr/sbin/ip6tables \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--with-iptables-restore=3D/usr/sbin/iptables-rest=
ore \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--with-iptables=3D/usr/sbin/iptables<br>
&gt; +else<br>
&gt; +FIREWALLD_CONF_OPTS +=3D -without-iptables<br>
&gt; +endif<br>
&gt; +<br>
&gt; +ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)<br>
&gt; +FIREWALLD_CONF_OPTS +=3D --enable-nls<br>
&gt; +endif<br>
&gt; +<br>
&gt; +ifeq ($(BR2_PACKAGE_SYSTEMD),y)<br>
&gt; +FIREWALLD_DEPENDENCIES +=3D systemd<br>
&gt; +FIREWALLD_CONF_OPTS +=3D --with-systemd-unitdir=3D/usr/lib/systemd/sy=
stem<br>
&gt; +else<br>
&gt; +FIREWALLD_CONF_OPTS +=3D --disable-systemd<br>
&gt; +endif<br>
&gt; +<br>
&gt; +define FIREWALLD_INSTALL_INIT_SYSTEMD<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 0644 $(@D)/config/firewalld.serv=
ice \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/usr/lib=
/systemd/system/firewalld.service<br>
&gt; +endef<br>
&gt; +<br>
&gt; +# The bundled sysvinit file requires /etc/init.d/functions which is n=
ot<br>
&gt; +# provided by buildroot. As such, we provide our own firewalld init f=
ile.<br>
&gt; +define FIREWALLD_INSTALL_INIT_SYSV<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 0755 $(FIREWALLD_PKGDIR)/S46fire=
walld \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/etc/ini=
t.d/S46firewalld<br>
&gt; +endef<br>
&gt; +<br>
&gt; +# Firewalld requires almost every single nftable option selected.<br>
&gt; +define FIREWALLD_LINUX_CONFIG_FIXUPS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_BRIDGE)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_FILTER)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_IPTABLES)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_MANGLE)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_MATCH_AH)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_MATCH_EUI=
64)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_MATCH_FRA=
G)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_MATCH_HL)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_MATCH_IPV=
6HEADER)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_MATCH_MH)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_MATCH_OPT=
S)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_MATCH_RPF=
ILTER)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_MATCH_RT)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_MATCH_SRH=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_NAT)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_RAW)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_TARGET_HL=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_TARGET_MA=
SQUERADE)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_TARGET_NP=
T)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_TARGET_RE=
JECT)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_TARGET_SY=
NPROXY)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_ARP_MANGLE=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_ARPFILTER)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_ARPTABLES)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_FILTER)<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_IPTABLES)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_MANGLE)<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_MATCH_AH)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_MATCH_ECN)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_MATCH_RPFI=
LTER)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_MATCH_TTL)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_NAT)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_RAW)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_CLU=
STERIP)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_ECN=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_MAS=
QUERADE)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_NET=
MAP)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_RED=
IRECT)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_REJ=
ECT)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_SYN=
PROXY)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_TTL=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_BITMAP_IP=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_BITMAP_IP=
MAC)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_BITMAP_PO=
RT)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_HASH_IP)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_HASH_IPMA=
C)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_HASH_IPMA=
RK)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_HASH_IPPO=
RT)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_HASH_IPPO=
RTIP)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_HASH_IPPO=
RTNET)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_HASH_MAC)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_HASH_NET)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_HASH_NETI=
FACE)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_HASH_NETN=
ET)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_HASH_NETP=
ORT)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_HASH_NETP=
ORTNET)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_LIST_SET)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_CONNCO=
UNT)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_NETLIN=
K_GLUE_CT)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_SYNPRO=
XY)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XTABLE=
S)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK)<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_AMA=
NDA)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_BRO=
ADCAST)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_EVE=
NTS)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_FTP=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_H32=
3)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_IRC=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_LAB=
ELS)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_MAR=
K)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_NET=
BIOS_NS)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_PPT=
P)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_PRO=
CFS)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_SAN=
E)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_SIP=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_SNM=
P)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_TFT=
P)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_TIM=
EOUT)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_TIM=
ESTAMP)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_ZON=
ES)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CT_NETLINK)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CT_NETLINK_HE=
LPER)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CT_NETLINK_TI=
MEOUT)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CT_PROTO_DCCP=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CT_PROTO_GRE)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CT_PROTO_SCTP=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CT_PROTO_UDPL=
ITE)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_DEFRAG_IPV4)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_DEFRAG_IPV6)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_DUP_IPV4)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_DUP_IPV6)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_DUP_NETDEV)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_FLOW_TABLE)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_FLOW_TABLE_IN=
ET)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_FLOW_TABLE_IP=
V4)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_FLOW_TABLE_IP=
V6)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_LOG_ARP)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_LOG_BRIDGE)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_LOG_COMMON)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_LOG_IPV4)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_LOG_IPV6)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_LOG_NETDEV)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_AMANDA)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_FTP)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_H323)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_IPV4)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_IPV6)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_IRC)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_MASQUERAD=
E_IPV4)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_MASQUERAD=
E_IPV6)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_NEEDED)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_PPTP)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_PROTO_DCC=
P)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_PROTO_GRE=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_PROTO_SCT=
P)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_PROTO_UDP=
LITE)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_REDIRECT)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_SIP)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_SNMP_BASI=
C)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_TFTP)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_REJECT_IPV4)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_REJECT_IPV6)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_SOCKET_IPV4)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_SOCKET_IPV6)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_ARP)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_BRIDGE=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_IPV4)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_IPV6)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_NETDEV=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_SET)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TPROXY_IPV4)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TPROXY_IPV6)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_BRIDGE_REJEC=
T)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_CHAIN_NAT_IP=
V4)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_CHAIN_NAT_IP=
V6)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_CHAIN_ROUTE_=
IPV4)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_CHAIN_ROUTE_=
IPV6)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_COMPAT)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_CONNLIMIT)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_COUNTER)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_CT)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_DUP_IPV4)<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_DUP_IPV6)<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_DUP_NETDEV)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_FIB)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_FIB_INET)<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_FIB_IPV4)<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_FIB_IPV6)<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_FIB_NETDEV)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_FLOW_OFFLOAD=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_FWD_NETDEV)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_HASH)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_LIMIT)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_LOG)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_MASQ)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_MASQ_IPV4)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_MASQ_IPV6)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_NAT)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_NUMGEN)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_OBJREF)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_OSF)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_QUEUE)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_QUOTA)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_REDIR)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_REDIR_IPV4)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_REDIR_IPV6)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_REJECT)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_REJECT_INET)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_REJECT_IPV4)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_REJECT_IPV6)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_REJECT_NETDE=
V)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_SOCKET)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_SYNPROXY)<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_TPROXY)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_TUNNEL)<br>
&gt; +endef<br>
&gt; +<br>
&gt; +$(eval $(autotools-package))<br>
________________________________<br>
<br>
othermo GmbH | Sitz der Gesellschaft: Alzenau | Amtsgericht Aschaffenburg: =
HRB 14783 | USt-IdNr.: DE319977978 | Gesch=C3=A4ftsf=C3=BChrung: Dr. Dennis=
 Metz.<br>
</blockquote></div></div>

--0000000000003ae7ae05f9b7ec4c--

--===============5099963010289678417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5099963010289678417==--
