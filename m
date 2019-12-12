From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Dec 2019 21:52:01 +0100
Subject: [Buildroot] [PATCH 2/4] package/xenomai: Pull from git
In-Reply-To: <5404679c83c28260c53e2fc54cdbeafda2929914.1576176280.git.jan.kiszka@siemens.com>
References: <cover.1576176280.git.jan.kiszka@siemens.com>
 <5404679c83c28260c53e2fc54cdbeafda2929914.1576176280.git.jan.kiszka@siemens.com>
Message-ID: <20191212215201.7761bccd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jan,

On Thu, 12 Dec 2019 19:44:38 +0100
Jan Kiszka <jan.kiszka@siemens.com> wrote:

> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> This allows to pick also git revisions via XENOMAI_VERSION.

You don't have tarballs for new releases? We generally prefer to use
tarballs when available.

>  XENOMAI_VERSION = $(call qstrip,$(BR2_PACKAGE_XENOMAI_VERSION))
>  ifeq ($(XENOMAI_VERSION),)
> -XENOMAI_VERSION = 3.0.9
> +XENOMAI_VERSION = v3.0.9

The version needs to stay 3.0.9, i.e without the "v" prefix.

>  else
>  BR_NO_CHECK_HASH_FOR += $(XENOMAI_SOURCE)
>  endif
>  
> -XENOMAI_SITE = http://xenomai.org/downloads/xenomai/stable
> +XENOMAI_SITE = https://gitlab.denx.de/Xenomai/xenomai/-/archive/$(XENOMAI_VERSION)

.. which can be done by changing this to:

XENOMAI_SITE = https://gitlab.denx.de/Xenomai/xenomai/-/archive/v$(XENOMAI_VERSION)

We want this so that our XENOMAI_VERSION value matches the
release-monitoring.org entry for Xenomai:
https://release-monitoring.org/project/18451/. BTW, it seems like they
don't know about version 3.0.10, as they are checking
https://xenomai.org/downloads/xenomai/stable/ and there is no tarball
for 3.0.10. I guess we need to change the Xenomai entry in
release-monitoring.org to make it use the Git repository.

> +define XENOMAI_BOOTSTRAP
> +	(cd $(@D); ./scripts/bootstrap)
> +endef
> +
> +XENOMAI_PRE_CONFIGURE_HOOKS += XENOMAI_BOOTSTRAP

This is not good, because nothing guarantees you autoconf/automake are
available. Our preferred way of handling this is to use:

XENOMAI_AUTORECONF = YES

which simply calls autoreconf on the project. However, I can imagine
that Xenomai is a bit special, so if AUTORECONF = YES doesn't work, you
can keep your PRE_CONFIGURE_HOOKS, but you need to add host-autoconf
and host-automake to XENOMAI_DEPENDENCIES, and possibly host-libtool if
libtool is used to build the libraries.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
