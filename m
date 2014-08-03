From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Aug 2014 10:14:40 +0200
Subject: [Buildroot] [PATCH 2 of 5 v3] infra: introduce a
 kconfig-package infrastructure
In-Reply-To: <e56a7788b2d0501d2503.1406922824@localhost>
References: <patchbomb.1406922822@localhost>
 <e56a7788b2d0501d2503.1406922824@localhost>
Message-ID: <20140803081440.GD4052@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-08-01 21:53 +0200, Thomas De Schampheleire spake thusly:
> There are several packages that have a configuration file managed by
> kconfig: uclibc, busybox, linux and barebox. All these packages need some
> make targets to handle the kconfig specificities: creating a configuration
> (menuconfig, ...) and saving it back (update-config, ...)
> 
> These targets should be the same for each of these packages, but
> unfortunately they are not. Especially with respect to saving back the
> configuration to the original config file, there are many differences.
> 
> A previous set of patches fixed these targets for the uclibc package.
> This patch extracts these targets into a common kconfig-package
> infrastructure, with the goals of:
> - aligning the behavior of all kconfig-based packages
> - removing code duplication
> 
> In order to use this infrastructure, a package should at a minimum specify
> FOO_KCONFIG_FILE and eval the kconfig-package macro. The supported
> configuration editors can be set with FOO_KCONFIG_EDITORS and defaults to
> menuconfig only.
> Additionally, a package can specify FOO_KCONFIG_OPT for extra options to
> pass to the invocation of the kconfig editors, and FOO_KCONFIG_FIXUP_CMDS
> for a list of shell commands used to fixup the .config file after a
> configuration has been created/edited.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

See below a comment we already shared on IRC...

> +include package/pkg-kconfig.mk
> diff -r 8fc7b26a4914 -r e56a7788b2d0 package/pkg-kconfig.mk
> --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
> +++ b/package/pkg-kconfig.mk	Mon Jun 30 21:08:13 2014 +0200
> @@ -0,0 +1,82 @@
[--SNIP--]
> +define inner-kconfig-package
> +
> +# Call the generic package infrastructure to generate the necessary
> +# make targets.
> +# Note: this must be done _before_ attempting to use $$($(2)_DIR) in a
> +# dependency expression
> +$(call inner-generic-package,$(1),$(2),$(3),$(4))

I found that comment to be slightly confusing. Here's a proposed
rewrite:

    # Call the generic package infrastructure to generate the necessary
    # make targets.
    # Note: we need to call inner-generic-package before we add the
    # configuration rules, because we need the $$($(2)_DIR) variable
    # defined there, as we use it in dependency expressions
    $(call inner-generic-package,$(1),$(2),$(3),$(4))

Otherwise, I'm good with it. With the above fixed, you can add my:
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
