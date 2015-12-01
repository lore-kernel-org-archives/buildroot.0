From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Dec 2015 11:29:16 +0100
Subject: [Buildroot] [PATCH] musl: add a sys/queue.h implementation
In-Reply-To: <1448924535-8093-1-git-send-email-sergio.prado@e-labworks.com>
References: <1448924535-8093-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20151201112916.57ef96b3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sergio,

On Mon, 30 Nov 2015 21:02:15 -0200, Sergio Prado wrote:

>  package/musl/musl.mk                               |   5 +
>  package/sys-queue/Config.in                        |   8 +
>  package/sys-queue/queue.h                          | 846 +++++++++++++++++++++

Rather than bundling the queue.h file, can we download it from some
location ? For example, you could use
http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/sys/queue.h?rev=1.30.

> diff --git a/package/sys-queue/Config.in b/package/sys-queue/Config.in
> new file mode 100644
> index 000000000000..edc6610f6e65
> --- /dev/null
> +++ b/package/sys-queue/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_SYS_QUEUE
> +	bool "sys/queue.h support"
> +	help
> +	  Musl does not provide a 'sys/queue.h' implementation, and this would
> +	  be a problem for packages that depend on it.
> +
> +	  This package provides an implementation of 'sys/queue.h', based on 
> +	  the NetBSD implementation.

Do we really need this package to have a prompt? I think it could
remain a hidden package, no?

> diff --git a/package/sys-queue/sys-queue.mk b/package/sys-queue/sys-queue.mk
> new file mode 100644
> index 000000000000..053ef8fd9e0d
> --- /dev/null
> +++ b/package/sys-queue/sys-queue.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# sys-queue
> +#
> +################################################################################
> +
> +# source included in buildroot
> +SYS_QUEUE_SOURCE =
> +SYS_QUEUE_VERSION = 1.70

Where is this version coming from ?

> +
> +SYS_QUEUE_LICENSE = BSD

BSD-3c

> +SYS_QUEUE_LICENSE_FILES = queue.h
> +
> +SYS_QUEUE_INSTALL_STAGING = YES
> +
> +define SYS_QUEUE_INSTALL_STAGING_CMDS
> +	if [ ! -f $(STAGING_DIR)/usr/include/sys/queue.h ]; then \
> +		$(INSTALL) -D -m 0644 package/sys-queue/queue.h \
> +			$(STAGING_DIR)/usr/include/sys/queue.h; \
> +	fi
> +endef

As Baruch said, please install unconditionally.

Otherwise, looks good to me.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
