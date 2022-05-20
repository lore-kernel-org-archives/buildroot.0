Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE006C433F5
	for <buildroot@archiver.kernel.org>; Fri, 20 May 2022 06:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22CD861310;
	Fri, 20 May 2022 06:25:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t6oCsmGi9S51; Fri, 20 May 2022 06:25:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F06D860EE5;
	Fri, 20 May 2022 06:25:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A272D1BF339
 for <buildroot@lists.busybox.net>; Fri, 20 May 2022 06:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9570684668
 for <buildroot@lists.busybox.net>; Fri, 20 May 2022 06:25:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id URu8ppaqXsT1 for <buildroot@lists.busybox.net>;
 Fri, 20 May 2022 06:24:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B94284661
 for <buildroot@buildroot.org>; Fri, 20 May 2022 06:24:59 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id y15so2053185qtx.4
 for <buildroot@buildroot.org>; Thu, 19 May 2022 23:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lGqd5jf1i6qPe4dj0Z+n4+kZh4yDvBG4hL61WXPa46w=;
 b=GwTSwZIlZp6JkePSiVaQ9+4fpITHIxFnfUiEA2YdKatf8BMm2rY9SAYl09b6yVpaF3
 raMZL9BciyufdtPv/WLev4Kt/gXFLc/bhPnw/GT9FL/MX4AAbPE5UJnrjp4IspRWMD04
 XBZC1L0odGpnVbddvP5FIZf/Wx8gn7vQPNdjI+G/smQIOtKXj2qzTMNiTaK/0OSQ+oT6
 4Mbe+scgP28ek236BuP5JH/dJed09xZ5c1zTtUAprNVgXUwsiUIY+5/JTF9iZ2ERkgJB
 KYZgwZ6QNUPSb4scDUno71UotCFq1ORVBbffh4JwMUST0vAVnxhUx0J5E+NSpdtF/QMJ
 eUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lGqd5jf1i6qPe4dj0Z+n4+kZh4yDvBG4hL61WXPa46w=;
 b=rnbZ63v1m97POgED1wsrgJ+XwTn5LzVyIHjGGg2XsuG+sHf+crzlzMpFD4GK7t8yhZ
 YP/s/iwansRzM7W1tEepOscbWIKUlefv+qJq24Q6ZOhbzXcJb+L0L9ofSp/MQDXsl648
 ffQ0G7vvP/e2vRdUYThl8vcki7onEo43wUMgvhI6X91o/85NyfhsSnIrW88f1iJmaUiH
 WI9lQtjIFYlBKq2TskzDoyljcOHxtovnO/jx/3/3kUX1012ByHqjKbRr1cTL63m1LbgA
 ZMkjzq9505zpeiU4szGfR0MEs1J3tn/wwqDa3HQwH3e+L3hGycFY0MRrZwk7/e87wAD+
 9zHw==
X-Gm-Message-State: AOAM533AuAGiXR+UWvnYoe7ZmKOQ+CzsYVWal2TKWynZ3rtLZtXySM0M
 6BvlQrlwSf9bzr/bdNRSFOfMMPKi6qEuWFqfo6ZWeMkJNyFckA==
X-Google-Smtp-Source: ABdhPJwaTCqXmWoUVSUQUbXWkArOFZtWxrVZcldERK8FbVRlReLku3iqYI8BlT1jowOd/3YAXmxgZX5tKrjdBAE+hnw=
X-Received: by 2002:a05:622a:186:b0:2f3:b5e1:8f2c with SMTP id
 s6-20020a05622a018600b002f3b5e18f2cmr6653507qtw.99.1653027898204; Thu, 19 May
 2022 23:24:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220519074438.462-1-xuminready@gmail.com>
 <CADvTj4oPXWFNWyQr7s01ZD_j4dwf=H7GMknJkS_KO55S06to+w@mail.gmail.com>
In-Reply-To: <CADvTj4oPXWFNWyQr7s01ZD_j4dwf=H7GMknJkS_KO55S06to+w@mail.gmail.com>
From: xu min <xuminready@gmail.com>
Date: Thu, 19 May 2022 23:24:47 -0700
Message-ID: <CAMpS7mTTRyKO+4055_GVzjErXc6Tg2qLjjPrJONEZd958=NuAQ@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/shadowsocks-libev: remove this
 package. No longer maintained.
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============6787091129009330041=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6787091129009330041==
Content-Type: multipart/alternative; boundary="000000000000ad252605df6b8c48"

--000000000000ad252605df6b8c48
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

shadowsocks-libev is bug-fix-only now. It hasn't had a new release for more
than one and a half years. Buildroot keeps sending me emails about the
building errors of this package. I don't know how to fix them and I don't
have time. I doubt there are many people using this package on Buildroot.
If someone can fix the building errors, maybe we can keep it for a while.

On Thu, May 19, 2022 at 2:30 AM James Hilliard <james.hilliard1@gmail.com>
wrote:

> Seems to be still getting bug fixes from what I can tell and is useful
> for systems
> that don't have rust support.
>
> On Thu, May 19, 2022 at 1:45 AM Min Xu <xuminready@gmail.com> wrote:
> >
> > Signed-off-by: Min Xu <xuminready@gmail.com>
> > ---
> >  DEVELOPERS                                    |  3 -
> >  package/Config.in                             |  1 -
> >  ...-pkg-config-to-find-netfilter_conntr.patch | 62 -------------
> >  .../0002-fix-maybe-uninitialized-errors.patch | 93 -------------------
> >  package/shadowsocks-libev/Config.in           | 34 -------
> >  .../shadowsocks-libev/shadowsocks-libev.hash  |  7 --
> >  .../shadowsocks-libev/shadowsocks-libev.mk    | 27 ------
> >  7 files changed, 227 deletions(-)
> >  delete mode 100644
> package/shadowsocks-libev/0001-configure.ac-use-pkg-config-to-find-netfil=
ter_conntr.patch
> >  delete mode 100644
> package/shadowsocks-libev/0002-fix-maybe-uninitialized-errors.patch
> >  delete mode 100644 package/shadowsocks-libev/Config.in
> >  delete mode 100644 package/shadowsocks-libev/shadowsocks-libev.hash
> >  delete mode 100644 package/shadowsocks-libev/shadowsocks-libev.mk
> >
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index c33959fa..e09ae0eb 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -2075,9 +2075,6 @@ F:        configs/bananapi_m2_plus_defconfig
> >  N:     Mikhail Boiko <mikhailboiko85@gmail.com>
> >  F:     package/libfribidi/
> >
> > -N:     Min Xu <xuminready@gmail.com>
> > -F:     package/shadowsocks-libev/
> > -
> >  N:     Miqu=C3=A8l Raynal <miquel.raynal@bootlin.com>
> >  F:     package/mali-driver/
> >  F:     package/rockchip-mali/
> > diff --git a/package/Config.in b/package/Config.in
> > index 88921341..25d391d4 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -2356,7 +2356,6 @@ endif
> >         source "package/samba4/Config.in"
> >         source "package/sconeserver/Config.in"
> >         source "package/ser2net/Config.in"
> > -       source "package/shadowsocks-libev/Config.in"
> >         source "package/shairport-sync/Config.in"
> >         source "package/shellinabox/Config.in"
> >         source "package/smcroute/Config.in"
> > diff --git
> a/package/shadowsocks-libev/0001-configure.ac-use-pkg-config-to-find-netf=
ilter_conntr.patch
> b/package/shadowsocks-libev/0001-configure.ac-use-pkg-config-to-find-netf=
ilter_conntr.patch
> > deleted file mode 100644
> > index 781d3c0e..00000000
> > ---
> a/package/shadowsocks-libev/0001-configure.ac-use-pkg-config-to-find-netf=
ilter_conntr.patch
> > +++ /dev/null
> > @@ -1,62 +0,0 @@
> > -From b3c61360a93b7f08fc9c33526056211408301ea9 Mon Sep 17 00:00:00 2001
> > -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > -Date: Mon, 23 Nov 2020 21:16:38 +0100
> > -Subject: [PATCH] configure.ac: use pkg-config to find
> netfilter_conntrack
> > -
> > -Use pkg-config to retrieve the dependencies of netfilter_conntrack
> > -and avoid the following build failure when building statically:
> > -
> > -configure:13096:
> /data/buildroot-test/instance-1/output-1/host/bin/x86_64-linux-gcc -o
> conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D=
64
> -Os   -static
> -I/data/buildroot-test/instance-1/output-1/host/x86_64-buildroot-linux-uc=
libc/sysroot/usr/include
> -DPCRE_STATIC -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=3D64  -static
> -L/data/buildroot-test/instance-1/output-1/host/x86_64-buildroot-linux-uc=
libc/sysroot/usr/lib
> conftest.c -lnetfilter_conntrack -lnfnetlink -lev  -lcares -lsodium
> -lmbedcrypto -lpcre  >&5
> >
> -/data/buildroot-test/instance-1/output-1/host/opt/ext-toolchain/bin/../l=
ib/gcc/x86_64-buildroot-linux-uclibc/8.3.0/../../../../x86_64-buildroot-lin=
ux-uclibc/bin/ld:
> /data/buildroot-test/instance-1/output-1/host/x86_64-buildroot-linux-ucli=
bc/sysroot/usr/lib/libnetfilter_conntrack.a(api.o):
> in function `nfct_fill_hdr.constprop.4':
> > -api.c:(.text+0x3f): undefined reference to `mnl_nlmsg_put_header'
> > -
> > -Fixes:
> > - -
> http://autobuild.buildroot.org/results/6cad497a7ab941a0ee3fd7007defc81e30=
cdcbe0
> > -
> > -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > -[Upstream status:
> > -https://github.com/shadowsocks/shadowsocks-libev/pull/2773]
> > ----
> > - configure.ac    | 5 +++--
> > - src/Makefile.am | 2 +-
> > - 2 files changed, 4 insertions(+), 3 deletions(-)
> > -
> > -diff --git a/configure.ac b/configure.ac
> > -index 9787bc2..207c041 100755
> > ---- a/configure.ac
> > -+++ b/configure.ac
> > -@@ -252,7 +252,8 @@ AC_ARG_ENABLE(connmarktos,
> > - if test x"$enable_connmarktos" =3D "xyes" ; then
> > -       AC_MSG_NOTICE([Linux Netfilter Conntrack support requested by
> --enable-connmarktos: ${enable_connmarktos}])
> > -       if test "x$enable_connmarktos" !=3D "xno"; then
> > --          AC_SEARCH_LIBS([nfct_query], [netfilter_conntrack],,[
> > -+          PKG_CHECK_MODULES([NETFILTER_CONNTRACK],
> [libnetfilter_conntrack],,
> > -+          [AC_SEARCH_LIBS([nfct_query], [netfilter_conntrack],,[
> > -               if test x"$enable_connmarktos" =3D "xyes"; then
> > -                   AC_MSG_ERROR([--enable-connmarktos specified but
> libnetfilter-conntrack library not found])
> > -               fi
> > -@@ -262,7 +263,7 @@ if test x"$enable_connmarktos" =3D "xyes" ; then
> > -               if test x"$enable_connmarktos" =3D "xyes"; then
> > -                   AC_MSG_ERROR([--enable-connmarktos specified but
> libnetfilter-conntrack headers not found])
> > -               fi
> > --              with_netfilter_conntrack=3Dno])
> > -+              with_netfilter_conntrack=3Dno])])
> > -         # If nothing is broken; enable the libraries usage.
> > -         if test "x$with_netfilter_conntrack" !=3D "xno"; then
> > -               with_netfilter_conntrack=3Dyes
> > -diff --git a/src/Makefile.am b/src/Makefile.am
> > -index c261ed0..b81ced7 100644
> > ---- a/src/Makefile.am
> > -+++ b/src/Makefile.am
> > -@@ -9,7 +9,7 @@ AM_CFLAGS +=3D -I$(top_srcdir)/libcork/include
> > - endif
> > - AM_CFLAGS +=3D $(LIBPCRE_CFLAGS)
> > -
> > --SS_COMMON_LIBS =3D $(INET_NTOP_LIB) $(LIBPCRE_LIBS)
> > -+SS_COMMON_LIBS =3D $(INET_NTOP_LIB) $(LIBPCRE_LIBS)
> $(NETFILTER_CONNTRACK_LIBS)
> > - if !USE_SYSTEM_SHARED_LIB
> > - SS_COMMON_LIBS +=3D $(top_builddir)/libbloom/libbloom.la \
> > -                   $(top_builddir)/libipset/libipset.la \
> > ---
> > -2.29.2
> > -
> > diff --git
> a/package/shadowsocks-libev/0002-fix-maybe-uninitialized-errors.patch
> b/package/shadowsocks-libev/0002-fix-maybe-uninitialized-errors.patch
> > deleted file mode 100644
> > index 5275323e..00000000
> > --- a/package/shadowsocks-libev/0002-fix-maybe-uninitialized-errors.pat=
ch
> > +++ /dev/null
> > @@ -1,93 +0,0 @@
> > -From 0c23224e926463b1097414979367655a27fa6d60 Mon Sep 17 00:00:00 2001
> > -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > -Date: Thu, 7 Apr 2022 18:27:58 +0200
> > -Subject: [PATCH] fix maybe-uninitialized errors
> > -
> > -Set {listen,server}_sock to -1 when needed as already done in
> > -src/manager.c by commit ecf1fcc84594b09ed2d61e3677cd8e62bd897ccb to
> > -avoid the following build failure:
> > -
> > -local.c: In function 'create_and_bind':
> > -local.c:218:12: error: 'listen_sock' may be used uninitialized in this
> function [-Werror=3Dmaybe-uninitialized]
> > -  218 |     return listen_sock;
> > -      |            ^~~~~~~~~~~
> > -
> > -Fixes:
> > - -
> http://autobuild.buildroot.org/results/27471a878ff52a972ac087d534e44fb0c5=
0808f6
> > -
> > -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > -[Retrieved from:
> > -
> https://github.com/shadowsocks/shadowsocks-libev/commit/0c23224e926463b10=
97414979367655a27fa6d60
> ]
> > ----
> > - src/local.c    | 2 +-
> > - src/redir.c    | 2 +-
> > - src/server.c   | 2 +-
> > - src/tunnel.c   | 2 +-
> > - src/udprelay.c | 2 +-
> > - 5 files changed, 5 insertions(+), 5 deletions(-)
> > -
> > -diff --git a/src/local.c b/src/local.c
> > -index b1ab040bb..47d634ce5 100644
> > ---- a/src/local.c
> > -+++ b/src/local.c
> > -@@ -168,7 +168,7 @@ create_and_bind(const char *addr, const char *port=
)
> > - {
> > -     struct addrinfo hints;
> > -     struct addrinfo *result, *rp;
> > --    int s, listen_sock;
> > -+    int s, listen_sock =3D -1;
> > -
> > -     memset(&hints, 0, sizeof(struct addrinfo));
> > -     hints.ai_family   =3D AF_UNSPEC;   /* Return IPv4 and IPv6 choice=
s */
> > -diff --git a/src/redir.c b/src/redir.c
> > -index 4a5a489f0..e60bd4870 100644
> > ---- a/src/redir.c
> > -+++ b/src/redir.c
> > -@@ -147,7 +147,7 @@ create_and_bind(const char *addr, const char *port=
)
> > - {
> > -     struct addrinfo hints;
> > -     struct addrinfo *result, *rp;
> > --    int s, listen_sock;
> > -+    int s, listen_sock =3D -1;
> > -
> > -     memset(&hints, 0, sizeof(struct addrinfo));
> > -     hints.ai_family   =3D AF_UNSPEC;   /* Return IPv4 and IPv6 choice=
s */
> > -diff --git a/src/server.c b/src/server.c
> > -index e9cdc2619..073e38b22 100644
> > ---- a/src/server.c
> > -+++ b/src/server.c
> > -@@ -550,7 +550,7 @@ create_and_bind(const char *host, const char *port=
,
> int mptcp)
> > - {
> > -     struct addrinfo hints;
> > -     struct addrinfo *result, *rp, *ipv4v6bindall;
> > --    int s, listen_sock;
> > -+    int s, listen_sock =3D -1;
> > -
> > -     memset(&hints, 0, sizeof(struct addrinfo));
> > -     hints.ai_family   =3D AF_UNSPEC;               /* Return IPv4 and
> IPv6 choices */
> > -diff --git a/src/tunnel.c b/src/tunnel.c
> > -index e0886bdb9..6641fe62a 100644
> > ---- a/src/tunnel.c
> > -+++ b/src/tunnel.c
> > -@@ -129,7 +129,7 @@ create_and_bind(const char *addr, const char *port=
)
> > - {
> > -     struct addrinfo hints;
> > -     struct addrinfo *result, *rp;
> > --    int s, listen_sock;
> > -+    int s, listen_sock =3D -1;
> > -
> > -     memset(&hints, 0, sizeof(struct addrinfo));
> > -     hints.ai_family   =3D AF_UNSPEC;   /* Return IPv4 and IPv6 choice=
s */
> > -diff --git a/src/udprelay.c b/src/udprelay.c
> > -index 23a042497..580ad4bd8 100644
> > ---- a/src/udprelay.c
> > -+++ b/src/udprelay.c
> > -@@ -446,7 +446,7 @@ create_server_socket(const char *host, const char
> *port)
> > - {
> > -     struct addrinfo hints;
> > -     struct addrinfo *result, *rp, *ipv4v6bindall;
> > --    int s, server_sock;
> > -+    int s, server_sock =3D -1;
> > -
> > -     memset(&hints, 0, sizeof(struct addrinfo));
> > -     hints.ai_family   =3D AF_UNSPEC;               /* Return IPv4 and
> IPv6 choices */
> > diff --git a/package/shadowsocks-libev/Config.in
> b/package/shadowsocks-libev/Config.in
> > deleted file mode 100644
> > index fefb27bc..00000000
> > --- a/package/shadowsocks-libev/Config.in
> > +++ /dev/null
> > @@ -1,34 +0,0 @@
> > -config BR2_PACKAGE_SHADOWSOCKS_LIBEV
> > -       bool "shadowsocks-libev"
> > -       depends on BR2_TOOLCHAIN_HAS_SYNC_4 # for libcork
> > -       depends on BR2_TOOLCHAIN_HAS_SYNC_8 || !BR2_ARCH_IS_64 # for
> libcork
> > -       depends on BR2_TOOLCHAIN_HAS_THREADS
> > -       depends on BR2_USE_MMU # fork()
> > -       select BR2_PACKAGE_C_ARES
> > -       select BR2_PACKAGE_LIBEV
> > -       select BR2_PACKAGE_LIBSODIUM
> > -       select BR2_PACKAGE_MBEDTLS
> > -       select BR2_PACKAGE_PCRE
> > -       help
> > -         Shadowsocks-libev is a lightweight secured SOCKS5 proxy for
> > -         embedded devices and low-end boxes.
> > -
> > -         https://github.com/shadowsocks/shadowsocks-libev
> > -
> > -config BR2_PACKAGE_SHADOWSOCKS_LIBEV_CONNMARKTOS
> > -       bool "connmarktos support in ss-server"
> > -       depends on BR2_PACKAGE_SHADOWSOCKS_LIBEV
> > -       select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
> > -       help
> > -         Build ss-server with the connmark to TOS feature.
> > -
> > -         This feature requires advanced tc, iptables and conntrack
> > -         rules to perform QoS on the server side.
> > -
> > -         If unsure, don't enable this option
> > -
> > -comment "shadowsocks-libev needs a toolchain w/ threads"
> > -       depends on BR2_TOOLCHAIN_HAS_SYNC_4
> > -       depends on BR2_TOOLCHAIN_HAS_SYNC_8 || !BR2_ARCH_IS_64
> > -       depends on BR2_USE_MMU
> > -       depends on !BR2_TOOLCHAIN_HAS_THREADS
> > diff --git a/package/shadowsocks-libev/shadowsocks-libev.hash
> b/package/shadowsocks-libev/shadowsocks-libev.hash
> > deleted file mode 100644
> > index 4f1d6d2f..00000000
> > --- a/package/shadowsocks-libev/shadowsocks-libev.hash
> > +++ /dev/null
> > @@ -1,7 +0,0 @@
> > -# Locally computed
> > -sha256
> cfc8eded35360f4b67e18dc447b0c00cddb29cc57a3cec48b135e5fb87433488
> shadowsocks-libev-3.3.5.tar.gz
> > -
> > -# License files, locally calculated
> > -sha256
> 736883f97d44dbec288bb82819f18f4f86d02ae3192f6a9abefa00db76bace41  COPYING
> > -sha256
> c41a4bc2c4c43e4daa3051e77e31b2d5c8500498afaeac6d831d55a4bb8de3fb
> libbloom/LICENSE
> > -sha256
> 4fa2ada54f8c0410ec243265378242ffe862386d5ac517f8dd30a1911d25ae93
> libcork/COPYING
> > diff --git a/package/shadowsocks-libev/shadowsocks-libev.mk
> b/package/shadowsocks-libev/shadowsocks-libev.mk
> > deleted file mode 100644
> > index c76983ce..00000000
> > --- a/package/shadowsocks-libev/shadowsocks-libev.mk
> > +++ /dev/null
> > @@ -1,27 +0,0 @@
> >
> -########################################################################=
########
> > -#
> > -# shadowsocks-libev
> > -#
> >
> -########################################################################=
########
> > -
> > -SHADOWSOCKS_LIBEV_VERSION =3D 3.3.5
> > -SHADOWSOCKS_LIBEV_SITE =3D
> https://github.com/shadowsocks/shadowsocks-libev/releases/download/v$(SHA=
DOWSOCKS_LIBEV_VERSION)
> > -SHADOWSOCKS_LIBEV_LICENSE =3D GPL-3.0+, BSD-2-Clause (libbloom),
> BSD-3-Clause (libcork, libipset)
> > -SHADOWSOCKS_LIBEV_LICENSE_FILES =3D COPYING libbloom/LICENSE
> libcork/COPYING
> > -SHADOWSOCKS_LIBEV_CPE_ID_VENDOR =3D shadowsocks
> > -SHADOWSOCKS_LIBEV_DEPENDENCIES =3D host-pkgconf c-ares libev libsodium
> mbedtls pcre
> > -SHADOWSOCKS_LIBEV_INSTALL_STAGING =3D YES
> > -# We're patching configure.ac
> > -SHADOWSOCKS_LIBEV_AUTORECONF =3D YES
> > -SHADOWSOCKS_LIBEV_CONF_OPTS =3D \
> > -       --with-pcre=3D$(STAGING_DIR)/usr \
> > -       --disable-ssp
> > -
> > -ifeq ($(BR2_PACKAGE_SHADOWSOCKS_LIBEV_CONNMARKTOS),y)
> > -SHADOWSOCKS_LIBEV_DEPENDENCIES +=3D libnetfilter_conntrack
> > -SHADOWSOCKS_LIBEV_CONF_OPTS +=3D --enable-connmarktos
> > -else
> > -SHADOWSOCKS_LIBEV_CONF_OPTS +=3D --disable-connmarktos
> > -endif
> > -
> > -$(eval $(autotools-package))
> > --
> > 2.30.2
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>


--=20

*Best Regards*

*XuMin's Ready=EF=BC=81*

--000000000000ad252605df6b8c48
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">shadowsocks-libev is bug-fix-only now. It hasn&#39;t had=
=C2=A0a new release for more than one and a half years. Buildroot keeps sen=
ding me emails about the building errors of this package. I don&#39;t know =
how to fix them and I don&#39;t have time. I doubt there are many people us=
ing this package on Buildroot. If someone can fix the building errors, mayb=
e we can keep it for a while.<br></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Thu, May 19, 2022 at 2:30 AM James Hill=
iard &lt;<a href=3D"mailto:james.hilliard1@gmail.com" target=3D"_blank">jam=
es.hilliard1@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Seems to be still getting bug fixes from what I can t=
ell and is useful<br>
for systems<br>
that don&#39;t have rust support.<br>
<br>
On Thu, May 19, 2022 at 1:45 AM Min Xu &lt;<a href=3D"mailto:xuminready@gma=
il.com" target=3D"_blank">xuminready@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Min Xu &lt;<a href=3D"mailto:xuminready@gmail.com" targ=
et=3D"_blank">xuminready@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 3 -<br>
&gt;=C2=A0 package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 -<br>
&gt;=C2=A0 ...-pkg-config-to-find-netfilter_conntr.patch | 62 -------------=
<br>
&gt;=C2=A0 .../0002-fix-maybe-uninitialized-errors.patch | 93 -------------=
------<br>
&gt;=C2=A0 package/shadowsocks-libev/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 34 -------<br>
&gt;=C2=A0 .../shadowsocks-libev/shadowsocks-libev.hash=C2=A0 |=C2=A0 7 --<=
br>
&gt;=C2=A0 .../shadowsocks-libev/<a href=3D"http://shadowsocks-libev.mk" re=
l=3D"noreferrer" target=3D"_blank">shadowsocks-libev.mk</a>=C2=A0 =C2=A0 | =
27 ------<br>
&gt;=C2=A0 7 files changed, 227 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 package/shadowsocks-libev/0001-configure.ac-u=
se-pkg-config-to-find-netfilter_conntr.patch<br>
&gt;=C2=A0 delete mode 100644 package/shadowsocks-libev/0002-fix-maybe-unin=
itialized-errors.patch<br>
&gt;=C2=A0 delete mode 100644 package/shadowsocks-libev/Config.in<br>
&gt;=C2=A0 delete mode 100644 package/shadowsocks-libev/shadowsocks-libev.h=
ash<br>
&gt;=C2=A0 delete mode 100644 package/shadowsocks-libev/<a href=3D"http://s=
hadowsocks-libev.mk" rel=3D"noreferrer" target=3D"_blank">shadowsocks-libev=
.mk</a><br>
&gt;<br>
&gt; diff --git a/DEVELOPERS b/DEVELOPERS<br>
&gt; index c33959fa..e09ae0eb 100644<br>
&gt; --- a/DEVELOPERS<br>
&gt; +++ b/DEVELOPERS<br>
&gt; @@ -2075,9 +2075,6 @@ F:=C2=A0 =C2=A0 =C2=A0 =C2=A0 configs/bananapi_m=
2_plus_defconfig<br>
&gt;=C2=A0 N:=C2=A0 =C2=A0 =C2=A0Mikhail Boiko &lt;<a href=3D"mailto:mikhai=
lboiko85@gmail.com" target=3D"_blank">mikhailboiko85@gmail.com</a>&gt;<br>
&gt;=C2=A0 F:=C2=A0 =C2=A0 =C2=A0package/libfribidi/<br>
&gt;<br>
&gt; -N:=C2=A0 =C2=A0 =C2=A0Min Xu &lt;<a href=3D"mailto:xuminready@gmail.c=
om" target=3D"_blank">xuminready@gmail.com</a>&gt;<br>
&gt; -F:=C2=A0 =C2=A0 =C2=A0package/shadowsocks-libev/<br>
&gt; -<br>
&gt;=C2=A0 N:=C2=A0 =C2=A0 =C2=A0Miqu=C3=A8l Raynal &lt;<a href=3D"mailto:m=
iquel.raynal@bootlin.com" target=3D"_blank">miquel.raynal@bootlin.com</a>&g=
t;<br>
&gt;=C2=A0 F:=C2=A0 =C2=A0 =C2=A0package/mali-driver/<br>
&gt;=C2=A0 F:=C2=A0 =C2=A0 =C2=A0package/rockchip-mali/<br>
&gt; diff --git a/package/Config.in b/package/Config.in<br>
&gt; index 88921341..25d391d4 100644<br>
&gt; --- a/package/Config.in<br>
&gt; +++ b/package/Config.in<br>
&gt; @@ -2356,7 +2356,6 @@ endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/samba4/Config.in=
&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/sconeserver/Conf=
ig.in&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/ser2net/Config.i=
n&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/shadowsocks-libev/Con=
fig.in&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/shairport-sync/C=
onfig.in&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/shellinabox/Conf=
ig.in&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/smcroute/Config.=
in&quot;<br>
&gt; diff --git a/package/shadowsocks-libev/0001-configure.ac-use-pkg-confi=
g-to-find-netfilter_conntr.patch b/package/shadowsocks-libev/0001-configure=
.ac-use-pkg-config-to-find-netfilter_conntr.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 781d3c0e..00000000<br>
&gt; --- a/package/shadowsocks-libev/0001-configure.ac-use-pkg-config-to-fi=
nd-netfilter_conntr.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,62 +0,0 @@<br>
&gt; -From b3c61360a93b7f08fc9c33526056211408301ea9 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmail.c=
om" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
&gt; -Date: Mon, 23 Nov 2020 21:16:38 +0100<br>
&gt; -Subject: [PATCH] <a href=3D"http://configure.ac" rel=3D"noreferrer" t=
arget=3D"_blank">configure.ac</a>: use pkg-config to find netfilter_conntra=
ck<br>
&gt; -<br>
&gt; -Use pkg-config to retrieve the dependencies of netfilter_conntrack<br=
>
&gt; -and avoid the following build failure when building statically:<br>
&gt; -<br>
&gt; -configure:13096: /data/buildroot-test/instance-1/output-1/host/bin/x8=
6_64-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FIL=
E_OFFSET_BITS=3D64=C2=A0 -Os=C2=A0 =C2=A0-static -I/data/buildroot-test/ins=
tance-1/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include -DP=
CRE_STATIC -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSE=
T_BITS=3D64=C2=A0 -static -L/data/buildroot-test/instance-1/output-1/host/x=
86_64-buildroot-linux-uclibc/sysroot/usr/lib conftest.c -lnetfilter_conntra=
ck -lnfnetlink -lev=C2=A0 -lcares -lsodium -lmbedcrypto -lpcre=C2=A0 &gt;&a=
mp;5<br>
&gt; -/data/buildroot-test/instance-1/output-1/host/opt/ext-toolchain/bin/.=
./lib/gcc/x86_64-buildroot-linux-uclibc/8.3.0/../../../../x86_64-buildroot-=
linux-uclibc/bin/ld: /data/buildroot-test/instance-1/output-1/host/x86_64-b=
uildroot-linux-uclibc/sysroot/usr/lib/libnetfilter_conntrack.a(api.o): in f=
unction `nfct_fill_hdr.constprop.4&#39;:<br>
&gt; -api.c:(.text+0x3f): undefined reference to `mnl_nlmsg_put_header&#39;=
<br>
&gt; -<br>
&gt; -Fixes:<br>
&gt; - - <a href=3D"http://autobuild.buildroot.org/results/6cad497a7ab941a0=
ee3fd7007defc81e30cdcbe0" rel=3D"noreferrer" target=3D"_blank">http://autob=
uild.buildroot.org/results/6cad497a7ab941a0ee3fd7007defc81e30cdcbe0</a><br>
&gt; -<br>
&gt; -Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabric=
e@gmail.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
&gt; -[Upstream status:<br>
&gt; -<a href=3D"https://github.com/shadowsocks/shadowsocks-libev/pull/2773=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/shadowsocks/shado=
wsocks-libev/pull/2773</a>]<br>
&gt; ----<br>
&gt; - <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a>=C2=A0 =C2=A0 | 5 +++--<br>
&gt; - src/Makefile.am | 2 +-<br>
&gt; - 2 files changed, 4 insertions(+), 3 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
&gt; -index 9787bc2..207c041 100755<br>
&gt; ---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; -+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; -@@ -252,7 +252,8 @@ AC_ARG_ENABLE(connmarktos,<br>
&gt; - if test x&quot;$enable_connmarktos&quot; =3D &quot;xyes&quot; ; then=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0AC_MSG_NOTICE([Linux Netfilter Conntrack s=
upport requested by --enable-connmarktos: ${enable_connmarktos}])<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;x$enable_connmarktos&quot; !=
=3D &quot;xno&quot;; then<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_SEARCH_LIBS([nfct_query], [net=
filter_conntrack],,[<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PKG_CHECK_MODULES([NETFILTER_CONN=
TRACK], [libnetfilter_conntrack],,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [AC_SEARCH_LIBS([nfct_query], [ne=
tfilter_conntrack],,[<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test x&quot=
;$enable_connmarktos&quot; =3D &quot;xyes&quot;; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
AC_MSG_ERROR([--enable-connmarktos specified but libnetfilter-conntrack lib=
rary not found])<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -@@ -262,7 +263,7 @@ if test x&quot;$enable_connmarktos&quot; =3D &quo=
t;xyes&quot; ; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test x&quot=
;$enable_connmarktos&quot; =3D &quot;xyes&quot;; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
AC_MSG_ERROR([--enable-connmarktos specified but libnetfilter-conntrack hea=
ders not found])<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with_netfilter_conn=
track=3Dno])<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with_netfilter_conn=
track=3Dno])])<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# If nothing is broken; enable the =
libraries usage.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;x$with_netfilter_conn=
track&quot; !=3D &quot;xno&quot;; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with_netfilter=
_conntrack=3Dyes<br>
&gt; -diff --git a/src/Makefile.am b/src/Makefile.am<br>
&gt; -index c261ed0..b81ced7 100644<br>
&gt; ---- a/src/Makefile.am<br>
&gt; -+++ b/src/Makefile.am<br>
&gt; -@@ -9,7 +9,7 @@ AM_CFLAGS +=3D -I$(top_srcdir)/libcork/include<br>
&gt; - endif<br>
&gt; - AM_CFLAGS +=3D $(LIBPCRE_CFLAGS)<br>
&gt; -<br>
&gt; --SS_COMMON_LIBS =3D $(INET_NTOP_LIB) $(LIBPCRE_LIBS)<br>
&gt; -+SS_COMMON_LIBS =3D $(INET_NTOP_LIB) $(LIBPCRE_LIBS) $(NETFILTER_CONN=
TRACK_LIBS)<br>
&gt; - if !USE_SYSTEM_SHARED_LIB<br>
&gt; - SS_COMMON_LIBS +=3D $(top_builddir)/libbloom/<a href=3D"http://libbl=
oom.la" rel=3D"noreferrer" target=3D"_blank">libbloom.la</a> \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
$(top_builddir)/libipset/<a href=3D"http://libipset.la" rel=3D"noreferrer" =
target=3D"_blank">libipset.la</a> \<br>
&gt; ---<br>
&gt; -2.29.2<br>
&gt; -<br>
&gt; diff --git a/package/shadowsocks-libev/0002-fix-maybe-uninitialized-er=
rors.patch b/package/shadowsocks-libev/0002-fix-maybe-uninitialized-errors.=
patch<br>
&gt; deleted file mode 100644<br>
&gt; index 5275323e..00000000<br>
&gt; --- a/package/shadowsocks-libev/0002-fix-maybe-uninitialized-errors.pa=
tch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,93 +0,0 @@<br>
&gt; -From 0c23224e926463b1097414979367655a27fa6d60 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmail.c=
om" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
&gt; -Date: Thu, 7 Apr 2022 18:27:58 +0200<br>
&gt; -Subject: [PATCH] fix maybe-uninitialized errors<br>
&gt; -<br>
&gt; -Set {listen,server}_sock to -1 when needed as already done in<br>
&gt; -src/manager.c by commit ecf1fcc84594b09ed2d61e3677cd8e62bd897ccb to<b=
r>
&gt; -avoid the following build failure:<br>
&gt; -<br>
&gt; -local.c: In function &#39;create_and_bind&#39;:<br>
&gt; -local.c:218:12: error: &#39;listen_sock&#39; may be used uninitialize=
d in this function [-Werror=3Dmaybe-uninitialized]<br>
&gt; -=C2=A0 218 |=C2=A0 =C2=A0 =C2=A0return listen_sock;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~=
~~~~~~<br>
&gt; -<br>
&gt; -Fixes:<br>
&gt; - - <a href=3D"http://autobuild.buildroot.org/results/27471a878ff52a97=
2ac087d534e44fb0c50808f6" rel=3D"noreferrer" target=3D"_blank">http://autob=
uild.buildroot.org/results/27471a878ff52a972ac087d534e44fb0c50808f6</a><br>
&gt; -<br>
&gt; -Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabric=
e@gmail.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
&gt; -[Retrieved from:<br>
&gt; -<a href=3D"https://github.com/shadowsocks/shadowsocks-libev/commit/0c=
23224e926463b1097414979367655a27fa6d60" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/shadowsocks/shadowsocks-libev/commit/0c23224e926463b10=
97414979367655a27fa6d60</a>]<br>
&gt; ----<br>
&gt; - src/local.c=C2=A0 =C2=A0 | 2 +-<br>
&gt; - src/redir.c=C2=A0 =C2=A0 | 2 +-<br>
&gt; - src/server.c=C2=A0 =C2=A0| 2 +-<br>
&gt; - src/tunnel.c=C2=A0 =C2=A0| 2 +-<br>
&gt; - src/udprelay.c | 2 +-<br>
&gt; - 5 files changed, 5 insertions(+), 5 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/src/local.c b/src/local.c<br>
&gt; -index b1ab040bb..47d634ce5 100644<br>
&gt; ---- a/src/local.c<br>
&gt; -+++ b/src/local.c<br>
&gt; -@@ -168,7 +168,7 @@ create_and_bind(const char *addr, const char *por=
t)<br>
&gt; - {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct addrinfo hints;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct addrinfo *result, *rp;<br>
&gt; --=C2=A0 =C2=A0 int s, listen_sock;<br>
&gt; -+=C2=A0 =C2=A0 int s, listen_sock =3D -1;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0memset(&amp;hints, 0, sizeof(struct addrinfo));<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0hints.ai_family=C2=A0 =C2=A0=3D AF_UNSPEC;=C2=A0 =
=C2=A0/* Return IPv4 and IPv6 choices */<br>
&gt; -diff --git a/src/redir.c b/src/redir.c<br>
&gt; -index 4a5a489f0..e60bd4870 100644<br>
&gt; ---- a/src/redir.c<br>
&gt; -+++ b/src/redir.c<br>
&gt; -@@ -147,7 +147,7 @@ create_and_bind(const char *addr, const char *por=
t)<br>
&gt; - {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct addrinfo hints;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct addrinfo *result, *rp;<br>
&gt; --=C2=A0 =C2=A0 int s, listen_sock;<br>
&gt; -+=C2=A0 =C2=A0 int s, listen_sock =3D -1;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0memset(&amp;hints, 0, sizeof(struct addrinfo));<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0hints.ai_family=C2=A0 =C2=A0=3D AF_UNSPEC;=C2=A0 =
=C2=A0/* Return IPv4 and IPv6 choices */<br>
&gt; -diff --git a/src/server.c b/src/server.c<br>
&gt; -index e9cdc2619..073e38b22 100644<br>
&gt; ---- a/src/server.c<br>
&gt; -+++ b/src/server.c<br>
&gt; -@@ -550,7 +550,7 @@ create_and_bind(const char *host, const char *por=
t, int mptcp)<br>
&gt; - {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct addrinfo hints;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct addrinfo *result, *rp, *ipv4v6bindall;<br>
&gt; --=C2=A0 =C2=A0 int s, listen_sock;<br>
&gt; -+=C2=A0 =C2=A0 int s, listen_sock =3D -1;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0memset(&amp;hints, 0, sizeof(struct addrinfo));<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0hints.ai_family=C2=A0 =C2=A0=3D AF_UNSPEC;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Return IPv4 and IPv6 cho=
ices */<br>
&gt; -diff --git a/src/tunnel.c b/src/tunnel.c<br>
&gt; -index e0886bdb9..6641fe62a 100644<br>
&gt; ---- a/src/tunnel.c<br>
&gt; -+++ b/src/tunnel.c<br>
&gt; -@@ -129,7 +129,7 @@ create_and_bind(const char *addr, const char *por=
t)<br>
&gt; - {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct addrinfo hints;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct addrinfo *result, *rp;<br>
&gt; --=C2=A0 =C2=A0 int s, listen_sock;<br>
&gt; -+=C2=A0 =C2=A0 int s, listen_sock =3D -1;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0memset(&amp;hints, 0, sizeof(struct addrinfo));<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0hints.ai_family=C2=A0 =C2=A0=3D AF_UNSPEC;=C2=A0 =
=C2=A0/* Return IPv4 and IPv6 choices */<br>
&gt; -diff --git a/src/udprelay.c b/src/udprelay.c<br>
&gt; -index 23a042497..580ad4bd8 100644<br>
&gt; ---- a/src/udprelay.c<br>
&gt; -+++ b/src/udprelay.c<br>
&gt; -@@ -446,7 +446,7 @@ create_server_socket(const char *host, const char=
 *port)<br>
&gt; - {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct addrinfo hints;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct addrinfo *result, *rp, *ipv4v6bindall;<br>
&gt; --=C2=A0 =C2=A0 int s, server_sock;<br>
&gt; -+=C2=A0 =C2=A0 int s, server_sock =3D -1;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0memset(&amp;hints, 0, sizeof(struct addrinfo));<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0hints.ai_family=C2=A0 =C2=A0=3D AF_UNSPEC;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Return IPv4 and IPv6 cho=
ices */<br>
&gt; diff --git a/package/shadowsocks-libev/Config.in b/package/shadowsocks=
-libev/Config.in<br>
&gt; deleted file mode 100644<br>
&gt; index fefb27bc..00000000<br>
&gt; --- a/package/shadowsocks-libev/Config.in<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,34 +0,0 @@<br>
&gt; -config BR2_PACKAGE_SHADOWSOCKS_LIBEV<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;shadowsocks-libev&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_SYNC_4 # for =
libcork<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_SYNC_8 || !BR=
2_ARCH_IS_64 # for libcork<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_THREADS<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_MMU # fork()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_C_ARES<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBEV<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBSODIUM<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_MBEDTLS<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_PCRE<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Shadowsocks-libev is a lightweight =
secured SOCKS5 proxy for<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0embedded devices and low-end boxes.=
<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/shado=
wsocks/shadowsocks-libev" rel=3D"noreferrer" target=3D"_blank">https://gith=
ub.com/shadowsocks/shadowsocks-libev</a><br>
&gt; -<br>
&gt; -config BR2_PACKAGE_SHADOWSOCKS_LIBEV_CONNMARKTOS<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;connmarktos support in ss-serve=
r&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_SHADOWSOCKS_LIBEV<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBNETFILTER_CONNTRACK<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Build ss-server with the connmark t=
o TOS feature.<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This feature requires advanced tc, =
iptables and conntrack<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rules to perform QoS on the server =
side.<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If unsure, don&#39;t enable this op=
tion<br>
&gt; -<br>
&gt; -comment &quot;shadowsocks-libev needs a toolchain w/ threads&quot;<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_SYNC_4<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_SYNC_8 || !BR=
2_ARCH_IS_64<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_MMU<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_TOOLCHAIN_HAS_THREADS<br>
&gt; diff --git a/package/shadowsocks-libev/shadowsocks-libev.hash b/packag=
e/shadowsocks-libev/shadowsocks-libev.hash<br>
&gt; deleted file mode 100644<br>
&gt; index 4f1d6d2f..00000000<br>
&gt; --- a/package/shadowsocks-libev/shadowsocks-libev.hash<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,7 +0,0 @@<br>
&gt; -# Locally computed<br>
&gt; -sha256=C2=A0 cfc8eded35360f4b67e18dc447b0c00cddb29cc57a3cec48b135e5fb=
87433488=C2=A0 shadowsocks-libev-3.3.5.tar.gz<br>
&gt; -<br>
&gt; -# License files, locally calculated<br>
&gt; -sha256=C2=A0 736883f97d44dbec288bb82819f18f4f86d02ae3192f6a9abefa00db=
76bace41=C2=A0 COPYING<br>
&gt; -sha256=C2=A0 c41a4bc2c4c43e4daa3051e77e31b2d5c8500498afaeac6d831d55a4=
bb8de3fb=C2=A0 libbloom/LICENSE<br>
&gt; -sha256=C2=A0 4fa2ada54f8c0410ec243265378242ffe862386d5ac517f8dd30a191=
1d25ae93=C2=A0 libcork/COPYING<br>
&gt; diff --git a/package/shadowsocks-libev/<a href=3D"http://shadowsocks-l=
ibev.mk" rel=3D"noreferrer" target=3D"_blank">shadowsocks-libev.mk</a> b/pa=
ckage/shadowsocks-libev/<a href=3D"http://shadowsocks-libev.mk" rel=3D"nore=
ferrer" target=3D"_blank">shadowsocks-libev.mk</a><br>
&gt; deleted file mode 100644<br>
&gt; index c76983ce..00000000<br>
&gt; --- a/package/shadowsocks-libev/<a href=3D"http://shadowsocks-libev.mk=
" rel=3D"noreferrer" target=3D"_blank">shadowsocks-libev.mk</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,27 +0,0 @@<br>
&gt; -#####################################################################=
###########<br>
&gt; -#<br>
&gt; -# shadowsocks-libev<br>
&gt; -#<br>
&gt; -#####################################################################=
###########<br>
&gt; -<br>
&gt; -SHADOWSOCKS_LIBEV_VERSION =3D 3.3.5<br>
&gt; -SHADOWSOCKS_LIBEV_SITE =3D <a href=3D"https://github.com/shadowsocks/=
shadowsocks-libev/releases/download/v$(SHADOWSOCKS_LIBEV_VERSION)" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/shadowsocks/shadowsocks-lib=
ev/releases/download/v$(SHADOWSOCKS_LIBEV_VERSION)</a><br>
&gt; -SHADOWSOCKS_LIBEV_LICENSE =3D GPL-3.0+, BSD-2-Clause (libbloom), BSD-=
3-Clause (libcork, libipset)<br>
&gt; -SHADOWSOCKS_LIBEV_LICENSE_FILES =3D COPYING libbloom/LICENSE libcork/=
COPYING<br>
&gt; -SHADOWSOCKS_LIBEV_CPE_ID_VENDOR =3D shadowsocks<br>
&gt; -SHADOWSOCKS_LIBEV_DEPENDENCIES =3D host-pkgconf c-ares libev libsodiu=
m mbedtls pcre<br>
&gt; -SHADOWSOCKS_LIBEV_INSTALL_STAGING =3D YES<br>
&gt; -# We&#39;re patching <a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
&gt; -SHADOWSOCKS_LIBEV_AUTORECONF =3D YES<br>
&gt; -SHADOWSOCKS_LIBEV_CONF_OPTS =3D \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0--with-pcre=3D$(STAGING_DIR)/usr \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-ssp<br>
&gt; -<br>
&gt; -ifeq ($(BR2_PACKAGE_SHADOWSOCKS_LIBEV_CONNMARKTOS),y)<br>
&gt; -SHADOWSOCKS_LIBEV_DEPENDENCIES +=3D libnetfilter_conntrack<br>
&gt; -SHADOWSOCKS_LIBEV_CONF_OPTS +=3D --enable-connmarktos<br>
&gt; -else<br>
&gt; -SHADOWSOCKS_LIBEV_CONF_OPTS +=3D --disable-connmarktos<br>
&gt; -endif<br>
&gt; -<br>
&gt; -$(eval $(autotools-package))<br>
&gt; --<br>
&gt; 2.30.2<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div><b><font face=3D"arial, helvetica, sans-serif"><br></font></b></div><=
div><b><font face=3D"arial, helvetica, sans-serif">Best Regards</font></b><=
/div><div><b><font face=3D"arial, helvetica, sans-serif"><br></font></b></d=
iv><b><font face=3D"arial, helvetica, sans-serif">XuMin&#39;s Ready=EF=BC=
=81</font></b></div>

--000000000000ad252605df6b8c48--


--===============6787091129009330041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6787091129009330041==--


