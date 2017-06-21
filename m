From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Jun 2017 22:29:39 +0200
Subject: [Buildroot] [PATCH 1/1] paxtest: new package
In-Reply-To: <1497906876-27014-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1497906876-27014-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20170621222939.2f43e719@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this contribution. A few comments below. Could you address
them, and send an updated version? Thanks!

On Mon, 19 Jun 2017 16:14:36 -0500, Matt Weber wrote:

>  package/Config.in                                  |  1 +
>  .../0001-genpaxtest-move-log-location.patch        | 54 ++++++++++++++++++++++
>  package/paxtest/Config.in                          |  5 ++
>  package/paxtest/paxtest.hash                       |  2 +
>  package/paxtest/paxtest.mk                         | 30 ++++++++++++

Missing entry in DEVELOPERS file.


> diff --git a/package/paxtest/0001-genpaxtest-move-log-location.patch b/package/paxtest/0001-genpaxtest-move-log-location.patch
> new file mode 100644
> index 0000000..9fc898d
> --- /dev/null
> +++ b/package/paxtest/0001-genpaxtest-move-log-location.patch
> @@ -0,0 +1,54 @@
> +From 623d99e4f557ef9cd771006e4f916c12d22a07a8 Mon Sep 17 00:00:00 2001
> +From: David Graziano <david.graziano@rockwellcollins.com>
> +Date: Mon, 12 Jun 2017 10:41:45 -0500
> +Subject: [PATCH] genpaxtest: move log location
> +
> +Move log location to /tmp instead of local directory.
> +(For read-only filesystems)

Is /tmp really the right place? What about /var/log instead?


> diff --git a/package/paxtest/Config.in b/package/paxtest/Config.in
> new file mode 100644
> index 0000000..f5ed60d
> --- /dev/null
> +++ b/package/paxtest/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_PAXTEST
> +	bool "paxtest"
> +	depends on BR2_TOOLCHAIN_USES_GLIBC

Could you please add a comment about why we have this glibc dependency?

> +	help
> +	  PaX regression test suite

Please add a blank line, followed by the upstream URL of the project.

And also a Config.in comment about the glibc dependency.

> +PAXTEST_VERSION = 0.9.11
> +PAXTEST_SOURCE = paxtest_$(PAXTEST_VERSION).orig.tar.gz
> +PAXTEST_SITE = http://http.debian.net/debian/pool/main/p/paxtest

What about using the latest version, 0.9.15, available at
https://www.grsecurity.net/~spender/paxtest-0.9.15.tar.gz. It is the
one used by Gentoo, for example.

> +PAXTEST_LICENSE = GPL-2.0+
> +PAXTEST_LICENSE_FILES = README
> +
> +PAXTEST_MAKE_OPTS = \
> +	CC=$(TARGET_CC) \
> +	LD=$(TARGET_LD)

Is it possible to use $(TARGET_CONFIGURE_OPTS) instead?

> +
> +PAXTEST_INSTALL_TARGET_OPTS = \
> +	DESTDIR=$(TARGET_DIR) \
> +	BINDIR="usr/bin" \
> +	RUNDIR="usr/lib"

Both PAXTEST_MAKE_OPTS and PAXTEST_INSTALL_TARGET_OPTS are used only
once, so don't define variable: just use them directly where needed.

> +
> +define PAXTEST_BUILD_CMDS
> +	$(MAKE) -C $(@D) $(PAXTEST_MAKE_OPTS) linux

Please pass $(TARGET_MAKE_ENV) before $(MAKE).

> +endef
> +
> +define PAXTEST_INSTALL_TARGET_CMDS
> +	$(MAKE) -C $(@D) -f Makefile.psm install $(PAXTEST_INSTALL_TARGET_OPTS)

Ditto.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
