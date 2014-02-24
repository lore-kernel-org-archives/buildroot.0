From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Feb 2014 20:01:04 +0100
Subject: [Buildroot] [PATCH 2/2] manual: add virtual package tutorial.
In-Reply-To: <1393235404-2693-3-git-send-email-eric.le.bihan.dev@free.fr>
References: <1393235404-2693-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1393235404-2693-3-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20140224190104.GC11048@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric, All,

I think you should base this on master, since we think it would be very
interesting to have it in this release.

On 2014-02-24 10:50 +0100, Eric Le Bihan spake thusly:
> The manual now features a new section with instructions about how to add a
> virtual package.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  docs/manual/adding-packages-virtual.txt |  102 +++++++++++++++++++++++++++++++
>  docs/manual/adding-packages.txt         |    2 +
>  2 files changed, 104 insertions(+)
>  create mode 100644 docs/manual/adding-packages-virtual.txt
> 
> diff --git a/docs/manual/adding-packages-virtual.txt b/docs/manual/adding-packages-virtual.txt
> new file mode 100644
> index 0000000..6cccc4e
> --- /dev/null
> +++ b/docs/manual/adding-packages-virtual.txt
> @@ -0,0 +1,102 @@
> +// -*- mode:doc; -*-
> +// vim: set syntax=asciidoc:
> +
> +Infrastructure for virtual packages
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +[[virtual-package-tutorial]]
> +
> ++virtual-package+ tutorial
> +^^^^^^^^^^^^^^^^^^^^^^^^^^

'virtual-package' is not an infrastructure [ie. you can't use:
$(eval $(virtual-package)) ], so I would suggest to just use:

    Virtual package tutorial
    ^^^^^^^^^^^^^^^^^^^^^^^^

[--SNIP--]
> +First, let's create the virtual package.
> +
> +.Virtual package +Config.in+ file
> +=================================

The formatting of the title is weird. Here's what I've changed:

    Virtual package +Config.in+ file
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


(notice: no leading dot, and an empty line after the ^^^ line)

> +The +Config.in+ file of virtual package 'something-virtual' should contain:
> +
> +---------------------------
> +01: config BR2_PACKAGE_HAS_SOMETHING_VIRTUAL
> +02:	bool
> +03:
> +04: config BR2_PACKAGE_PROVIDES_SOMETHING_VIRTUAL
> +05:	depends on BR2_PACKAGE_HAS_SOMETHING_VIRTUAL
> +06:	string
> +---------------------------
> +=================================

Remove this === line.

> +In this file, we declare two options, +BR2_PACKAGE_HAS_SOMETHING_VIRTUAL+ and
> ++BR2_PACKAGE_PROVIDES_SOMETHING_VIRTUAL+, whose values will be used by the
> +providers.
> +
> +.Virtual package +*.mk+ file
> +============================

Ditto title.

> +The Makefile +package/something-virtual/something-virtual.mk+ should contain:
> +
> +---------------------------
> +01: ################################################################################
> +02: #
> +03: # something-virtual
> +04: #
> +05: ################################################################################
> +06:
> +07: SOMETHING_VIRTUAL_SOURCE =
> +08: SOMETHING_VIRTUAL_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_SOMETHING_VIRTUAL))
> +09:
> +10: ifeq ($(BR2_PACKAGE_HAS_SOMETHING_VIRTUAL),y)
> +11: ifeq ($(SOMETHING_VIRTUAL_DEPENDENCIES),)
> +12: $(error No something-virtual implementation selected. Configuration error.)
> +13: endif
> +14: endif
> +15:
> +16: $(eval $(generic-package))
> +---------------------------
> +============================

Ditto ===.

> +The Makefile is quite small as it will only check if a provider for the
> +virtual package has been selected.
> +
> +When adding a package as a provider, only the +Config.in+ file requires some
> +modifications. The +*.mk+ file should follow the Buildroot infrastructure with
> +no change at all.
> +
> +.Provider +Config.in+ file
> +==========================

Ditto title.

> +The +Config.in+ file of the package 'some-provider', which provides the
> +functionalities of 'something-virtual', should contain:
> +
> +---------------------------
> +01: config BR2_PACKAGE_SOME_PROVIDER
> +02:	bool "some-provider"
> +03:	select BR2_PACKAGE_HAS_SOMETHING_VIRTUAL
> +04:	help
> +05:	  This is a comment that explains what some-provider is.
> +06:
> +07:	  http://foosoftware.org/some-provider/
> +08:
> +09: if BR2_PACKAGE_SOME_PROVIDER
> +10: config BR2_PACKAGE_PROVIDES_SOMETHING_VIRTUAL
> +11:	default "some-provider"
> +12: endif
> +---------------------------
> +==========================

Ditto ===.

With those changes, the manual looks better, IMHO.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
