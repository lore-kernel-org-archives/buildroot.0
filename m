From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Jul 2021 10:05:55 +0200
Subject: [Buildroot] [PATCH 1/2] boot/, linux/,
 package/: improve help text of kconfig packages
In-Reply-To: <20210703194001.693553-1-thomas.petazzoni@bootlin.com>
References: <20210703194001.693553-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210704080555.GA2521@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-07-03 21:39 +0200, Thomas Petazzoni spake thusly:
> The <pkg>_HELP_CMDS variable allows packages using the kconfig-package
> infrastructure to display their specific targets related to the
> handling of their configuration.
> 
> However, it was not consistently used and handled by the different
> packages. This commit makes sure all packages using kconfig-package
> have that help text, and that is does reflect which targets are
> available/usable.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

I wonder wy we can't have that generated automatically by the
kconfig-package infra, rather than repeast it in all packages.

The only exception is busybox, which does not have support for defconfig
files, otherwise all packages behave similarly.

What about the following patch (lightly tested):

    diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
    index dd727b7200..18d11e845a 100644
    --- a/package/pkg-kconfig.mk
    +++ b/package/pkg-kconfig.mk
    @@ -82,6 +82,31 @@ define inner-kconfig-package
     # they are also accounted for in the generated graphs.
     $(2)_DEPENDENCIES += $$($(2)_KCONFIG_DEPENDENCIES)
     
    +$(2)_KCONFIG_SUPPORTS_DEFCONFIG ?= YES
    +
    +# Generate the kconfig-related help: one entry for each editor.
    +# Additionally, if the package is *not* using an in-tree defconfig
    +# name, an entry for updating the package configuration file.
    +ifndef $(2)_HELP_CMDS
    +define $(2)_HELP_CMDS
    +	$$(foreach editor, $$($(2)_KCONFIG_EDITORS), \
    +		@printf '  %-22s - Run %s %s\n' $(1)-$$(editor) $(1) $$(editor)
    +	)
    +	$$(if $$($(2)_KCONFIG_DEFCONFIG),,\
    +		$$(if $$(filter YES,$$($(2)_KCONFIG_SUPPORTS_DEFCONFIG)),\
    +			@printf '  %-22s - Save the %s configuration as a defconfig file\n' \
    +				$(1)-update-defconfig $(1)
    +			@printf '  %-22s     to %s\n' '' $$($(2)_KCONFIG_FILE)
    +			@printf '  %-22s     (or override with %s_KCONFIG_FILE)\n' '' $(2)
    +		)
    +		@printf '  %-22s - Save the %s configuration as a full .config file\n' \
    +			$(1)-update-config $(1)
    +		@printf '  %-22s     to %s\n' '' $$($(2)_KCONFIG_FILE)
    +		@printf '  %-22s     (or override with %s_KCONFIG_FILE)\n' '' $(2)
    +)
    +endef
    +endif
    +
     # Call the generic package infrastructure to generate the necessary
     # make targets.
     # Note: this must be done _before_ attempting to use $$($(2)_DIR) in a

Note: I am not 100% sure we want the coditional definition, but it is
more in-line with the other _CMDS that packages can define.

Then we can simply drop all the per-package _HELP_CMDS.

$(2)_KCONFIG_SUPPORTS_DEFCONFIG is there just for busybox, which AFAICS
is the only package without support for defconfig files. We could
alternatively drop this new variable and let busybox define its own
_HELP_CMDS; that would slightly simplify the code above.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
