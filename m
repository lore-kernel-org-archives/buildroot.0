From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Dec 2015 16:58:56 +0100
Subject: [Buildroot] [PATCH 1/1] new packages: yp-tools, ypbind-mt
In-Reply-To: <1450707537-30154-3-git-send-email-yba@tkos.co.il>
References: <1450707537-30154-1-git-send-email-yba@tkos.co.il>
 <1450707537-30154-3-git-send-email-yba@tkos.co.il>
Message-ID: <20151221165856.41945d9e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jonathan Ben-Avraham,

On Mon, 21 Dec 2015 16:18:57 +0200, Jonathan Ben-Avraham wrote:
> From: Jonathan Ben Avraham <yba@tkos.co.il>
> 
> Adds the yp-tools and ypbind-mt packages required to use NIS and to
> use NFS autofs-mounted partitions.

Two packages: should be two patches, one per package.

> Note that to rebuild ypbind-mt you must rebuild nfs-utils, libtirpc,
> yp-tools and ypbind-mt together.

What do you mean here ?

> diff --git a/package/Config.in b/package/Config.in
> index db62c82..1395170 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -185,6 +185,8 @@ menu "Filesystem and flash utilities"
>  	source "package/sunxi-tools/Config.in"
>  	source "package/unionfs/Config.in"
>  	source "package/xfsprogs/Config.in"
> +	source "package/yp-tools/Config.in"
> +	source "package/ypbind-mt/Config.in"

I am wondering if "Networking applications" is not a better location
for those packages.

> diff --git a/package/yp-tools/0001-Change-do_ypcall_tr-param-resp-to-ypresp_val.patch b/package/yp-tools/0001-Change-do_ypcall_tr-param-resp-to-ypresp_val.patch
> new file mode 100644
> index 0000000..8f71900
> --- /dev/null
> +++ b/package/yp-tools/0001-Change-do_ypcall_tr-param-resp-to-ypresp_val.patch
> @@ -0,0 +1,130 @@
> +From 5041c0f037a2bc9ae593f943894652ac9e3b567f Mon Sep 17 00:00:00 2001
> +From: Jonathan Ben Avraham <yba@tkos.co.il>
> +Date: Wed, 16 Dec 2015 13:03:05 +0200
> +Subject: [PATCH 1/1] Change do_ypcall_tr param resp to ypresp_val *
> +
> +The do_ypcall_tr "resp" parameter is type caddr_t. This necessitates a cast to
> +ypresp_val * to reference resp->status for use as an argument to ypprot_err
> +which provides the return value for do_ypcall_tr.
> +
> +Since caddr_t and ypresp_val * can have different alignments on some archs such
> +as arm, GCC -Wcast-align will issue a warning which yp-tools is configured to
> +treat as an error.
> +
> +This commit changes the type of the resp parameter of do_ypcall_tr from caddr_t
> +to ypresp_val * in order to avoid the posibility of an unaligned cast.
> +
> +Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>

Please disable -Werror in yp-tools so that we don't have to add patches
for this problem (and of course report this problem upstream).

> diff --git a/package/yp-tools/Config.in b/package/yp-tools/Config.in
> new file mode 100644
> index 0000000..437aebe
> --- /dev/null
> +++ b/package/yp-tools/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_YP_TOOLS
> +	bool "yp-tools"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libtirpc, rpcbind

If you need native RPC support, then why do you reference libtirpc
here ?

> +	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC # needs rpcsvc/nis.h
> +	depends on BR2_USE_MMU # fork()
> +	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
> +	select BR2_PACKAGE_RPCBIND # runtime
> +	help
> +	  The yp-tools package contains the programs domainname,
> +	  nisdomainname, ypcat, ypchfn, ypchsh, ypdomainname, ypmatch,
> +	  yppoll, ypset, ypwhich and yppasswd. yp-tools 3.x is a port of
> +	  yp-tools 2.x to support IPv6. For this reason, it is now
> +	  linked against TI-RPC. Additional, it contians a nss_nis6
> +	  plugin for glibc to enable NIS lookups on clients for passwd,
> +	  group, etc.
> +
> +	  https://github.com/thkukuk/yp-tools
> diff --git a/package/yp-tools/mapv4v6addr.h b/package/yp-tools/mapv4v6addr.h
> new file mode 100644
> index 0000000..7f85f7d
> --- /dev/null
> +++ b/package/yp-tools/mapv4v6addr.h
> @@ -0,0 +1,69 @@
> +/*
> + * ++Copyright++ 1985, 1988, 1993
> + * -
> + * Copyright (c) 1985, 1988, 1993
> + *    The Regents of the University of California.  All rights reserved.
> + *
> + * Redistribution and use in source and binary forms, with or without
> + * modification, are permitted provided that the following conditions
> + * are met:
> + * 1. Redistributions of source code must retain the above copyright
> + *    notice, this list of conditions and the following disclaimer.
> + * 2. Redistributions in binary form must reproduce the above copyright
> + *    notice, this list of conditions and the following disclaimer in the
> + *    documentation and/or other materials provided with the distribution.
> + * 4. Neither the name of the University nor the names of its contributors
> + *    may be used to endorse or promote products derived from this software
> + *    without specific prior written permission.
> + *
> + * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
> + * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> + * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
> + * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
> + * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
> + * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
> + * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
> + * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
> + * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
> + * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
> + * SUCH DAMAGE.
> + * -
> + * Portions Copyright (c) 1993 by Digital Equipment Corporation.
> + *
> + * Permission to use, copy, modify, and distribute this software for any
> + * purpose with or without fee is hereby granted, provided that the above
> + * copyright notice and this permission notice appear in all copies, and that
> + * the name of Digital Equipment Corporation not be used in advertising or
> + * publicity pertaining to distribution of the document or software without
> + * specific, written prior permission.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS" AND DIGITAL EQUIPMENT CORP. DISCLAIMS ALL
> + * WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES
> + * OF MERCHANTABILITY AND FITNESS.   IN NO EVENT SHALL DIGITAL EQUIPMENT
> + * CORPORATION BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL
> + * DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR
> + * PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS
> + * ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
> + * SOFTWARE.
> + * -
> + * --Copyright--
> + */
> +
> +#include <string.h>
> +#include <arpa/nameser.h>
> +
> +static void
> +map_v4v6_address (const char *src, char *dst)
> +{
> +  u_char *p = (u_char *) dst;
> +  int i;
> +
> +  /* Move the IPv4 part to the right position.  */
> +  memcpy (dst + 12, src, INADDRSZ);
> +
> +  /* Mark this ipv6 addr as a mapped ipv4. */
> +  for (i = 0; i < 10; i++)
> +    *p++ = 0x00;
> +  *p++ = 0xff;
> +  *p = 0xff;
> +}
> diff --git a/package/yp-tools/yp-tools.mk b/package/yp-tools/yp-tools.mk
> new file mode 100644
> index 0000000..707da49
> --- /dev/null
> +++ b/package/yp-tools/yp-tools.mk
> @@ -0,0 +1,32 @@
> +################################################################################
> +#
> +# yp-tools
> +#
> +################################################################################
> +
> +YP_TOOLS_VERSION = yp-tools-3_4
> +YP_TOOLS_SITE = $(call github,thkukuk,yp-tools,$(YP_TOOLS_VERSION))
> +YP_TOOLS_LICENSE = GPLv2+
> +YP_TOOLS_LICENSE_FILES = COPYING
> +YP_TOOLS_AUTORECONF = YES
> +YP_TOOLS_DEPENDENCIES = host-pkgconf
> +YP_TOOLS_PRE_CONFIGURE_HOOKS += YP_TOOLS_LOCAL_MAPV4V6ADDR_H
> +
> +# From: Joe MacDonald <joe_macdonald@mentor.com>
> +# +Date: Fri, 27 Feb 2015 12:04:10 -0500
> +# +Subject: [PATCH] ipv4/ipv6: Provide an in-place version of mapv4v6addr.h
> +# +
> +# +mapv4v6addr.h isn't always available, depending on your build, but
> +# +nis-hosts.c only needs it for a single, inline function.  So drop a copy
> +# +here rather than playing games with the include path that would
> +# +potentially lead to cross-compilation issues.
> +# +
> +# +Upstream-status: Inappropriate [embedded specific]
> +# +
> +# +Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>

It's good to have some comments here, but not in the form of a patch
with the "+", From: field and so on.

> +define YP_TOOLS_LOCAL_MAPV4V6ADDR_H
> +	$(INSTALL) -D -m 0644 $(TOPDIR)/package/yp-tools/mapv4v6addr.h \

Use $(YP_TOOLS_PKGDIR) instead of $(TOPDIR)/package/yp-tools/.

But it seems like a lot of complexity for just one function. Why don't
you simply copy/paste this code into a patch for the nis-hosts program ?

> +$(eval $(autotools-package))
> diff --git a/package/ypbind-mt/0001-Remove_man_dir_from_build.patch b/package/ypbind-mt/0001-Remove_man_dir_from_build.patch
> new file mode 100644
> index 0000000..3bd9b9f
> --- /dev/null
> +++ b/package/ypbind-mt/0001-Remove_man_dir_from_build.patch
> @@ -0,0 +1,14 @@
> +Remove the man directory from the build in order to avoid trying to build the
> +commented targets ypbind.8 and ypconf.5
> +

Missing Signed-off-by line.

> +--- a/Makefile.am	2014-12-04 16:27:18.000000000 +0200
> ++++ b/Makefile.am	2015-12-16 15:00:21.950050679 +0200
> +@@ -5,7 +5,7 @@
> + #
> + AUTOMAKE_OPTIONS = 1.6 gnits dist-bzip2
> + #
> +-SUBDIRS = lib src man po
> ++SUBDIRS = lib src po
> + 
> + CLEANFILES = *~
> + 

Ideally this should be done in an upstreamable way, which makes
building the man pages optional (using a configure.ac option). Though
that it not a strict requirement.

> diff --git a/package/ypbind-mt/Config.in b/package/ypbind-mt/Config.in
> new file mode 100644
> index 0000000..46d2b23
> --- /dev/null
> +++ b/package/ypbind-mt/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_YPBIND_MT
> +	bool "ypbind-mt"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libtirpc, rpcbind

Why do you talk about libtirpc here ?

> +	depends on BR2_USE_MMU # fork()
> +	depends on BR2_PACKAGE_YP_TOOLS

This should be a "select".

> +	select BR2_PACKAGE_RPCBIND # runtime
> +	help
> +	  The ypbind-mt package contains a multithreaded ypbind daemon
> +	  for Linux. It uses threads for better response and supports
> +	  the ypbind protocols version 1, 2 and 3.
> +
> +	  Note: You need to add package "pam" for NIS authentication.

We don't have any package called "pam", it's called "linux-pam".

> +
> +	  https://github.com/thkukuk/ypbind-mt
> diff --git a/package/ypbind-mt/ypbind-mt.mk b/package/ypbind-mt/ypbind-mt.mk
> new file mode 100644
> index 0000000..4d809e5
> --- /dev/null
> +++ b/package/ypbind-mt/ypbind-mt.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# ypbind-mt
> +#
> +################################################################################
> +
> +YPBIND_MT_VERSION = ypbind-mt-2_2
> +YPBIND_MT_SITE = $(call github,thkukuk,ypbind-mt,$(YPBIND_MT_VERSION))
> +YPBIND_MT_LICENSE = GPLv2+

I think the license is really GPLv2. Only a file in lib/ has a GPLv2+
marker. All the files in src/ are GPLv2 only.

> +YPBIND_MT_LICENSE_FILES = COPYING
> +YPBIND_MT_AUTORECONF = YES
> +YPBIND_MT_DEPENDENCIES = host-pkgconf
> +YPBIND_MT_CONF_ENV = \
> +	PKG_CONFIG_SYSROOT_DIR="$(TARGET_DIR)" \
> +	PKG_CONFIG_PATH="$(TARGET_DIR)/usr/lib/pkgconfig"

Clearly no. The pkg-config handling is already passed correctly by the
autotools-package infrastructure, and the values you are passing are
wrong. Which problem are you trying to solve here ?

> +
> +define YPBIND_MT_INSTALL_INIT_SYSV
> +        $(INSTALL) -D -m 755 package/ypbind-mt/ypbind.rc $(TARGET_DIR)/etc/init.d/S70ypbind

The file should be named S70ypbind in package/ypbind-mt/. Also, please
use $(YPBIND_MT_PKGDIR) (yes, I know not all packages are doing this
yet, because it's a fairly new variable).

The init script looks a bit complicated to me, but I haven't reviewed
it in detail for now.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
