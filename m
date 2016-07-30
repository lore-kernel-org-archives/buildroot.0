From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jul 2016 18:09:37 +0200
Subject: [Buildroot] [PATCH 1/1] minissdpd: new package
In-Reply-To: <1469802517-17937-1-git-send-email-fabrice.fontaine@orange.com>
References: <1469802517-17937-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20160730180937.50a478ac@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Jul 2016 16:28:37 +0200, Fabrice Fontaine wrote:

> diff --git a/package/minissdpd/0001-Set-_GNU_SOURCE-in-asyncsendto.c.patch b/package/minissdpd/0001-Set-_GNU_SOURCE-in-asyncsendto.c.patch
> new file mode 100644
> index 0000000..35854c5
> --- /dev/null
> +++ b/package/minissdpd/0001-Set-_GNU_SOURCE-in-asyncsendto.c.patch
> @@ -0,0 +1,32 @@
> +From 8ea177d974259c91f7e520d4b5b2abf07a1bbce2 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fabrice.fontaine@orange.com>
> +Date: Fri, 29 Jul 2016 13:32:09 +0200
> +Subject: [PATCH 1/1] Set _GNU_SOURCE in asyncsendto.c
> +
> +Add #define on _GNU_SOURCE at the very beginning of asyncsendto.c file
> +as this file uses in6_pktinfo which is protected by __USE_GNU in
> +libc/inet/netinet/in.h. Currently, this flag is set by the Makefile in
> +CFLAGS however CFLAGS could be overwritten by the build system.
> +
> +Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>

Having a patch for this is a bit overkill IMO, so I've replaced that by
passing:

	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"

in the .mk file.

> +config BR2_PACKAGE_MINISSDPD
> +	bool "minissdpd"
> +	select BR2_PACKAGE_LIBNFNETLINK

Missing "depends on BR2_USE_MMU", since fork() is used.

> +NAME=minissdpd
> +PIDFILE=/var/run/$NAME.pid
> +DAEMON=/usr/sbin/$NAME
> +CFGFILE=/etc/default/$NAME
> +
> +IF=eth0

IF is not really a good variable name IMO, too close to the "if"
keyword. I renamed it to IFACE.

> +define MINISSDPD_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \

Passing TARGET_CONFIGURE_OPTS at install time wasn't needed.

> +Environment="IF=eth0"

I've also changed IF to IFACE here.

Applied with those changes.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
