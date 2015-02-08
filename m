From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 8 Feb 2015 11:51:50 +0100
Subject: [Buildroot] Package for batctl
In-Reply-To: <CAFNoKatXt9=y4Y=+u8+d3CA_O115rU2JzLF1MyU+99b9vE=N5g@mail.gmail.com>
References: <CAFNoKatXt9=y4Y=+u8+d3CA_O115rU2JzLF1MyU+99b9vE=N5g@mail.gmail.com>
Message-ID: <20150208105150.GB4028@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jens, All,

On 2015-02-07 12:39 +0000, Jens Zettelmeyer spake thusly:
> i added this package to my local packages and wanted to get some comment on
> it.
> Are there any obvious problems/mistakes/things i should do differently?
> What would i need to do to get this commited?

Thanks for your contribution!

Please see the manual for how to contribute a patch:
    http://buildroot.net/downloads/manual/manual.html#submitting-patches

See below a few comments.

> From f5705034eeb6f2f95ac914837da615567b7c80da Mon Sep 17 00:00:00 2001
> From: Jens Zettelmeyer <zettelmeyerj@googlemail.com>
> Date: Thu, 5 Feb 2015 21:50:20 +0000
> Subject: [PATCH] Add build for B.A.T.M.A.N. Advanced control utility

The commit log should contain your Signed-off-by. Something like:

    batctl: new package

    Signed-off-by: Your REAL-NAME <you@example.net>

> diff --git a/package/Config.in b/package/Config.in
> index fe3d3d0..f9343c4 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1054,6 +1054,7 @@ menu "Networking applications"
>   source "package/autossh/Config.in"
>   source "package/avahi/Config.in"
>   source "package/axel/Config.in"
> + source "package/batctl/Config.in"
>   source "package/bandwidthd/Config.in"

Alphabetical order, please. batctl should be after bandwidthd.

>   source "package/bcusdk/Config.in"
>   source "package/bind/Config.in"
> diff --git a/package/batctl/Config.in b/package/batctl/Config.in
> new file mode 100644
> index 0000000..33275b1
> --- /dev/null
> +++ b/package/batctl/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_BATCTL
> + bool "batctl"
> + depends on BR2_USE_MMU # needs fork()

Why? fork() does not seem to be used anywhere in the source tree.

> + depends on BR2_INET_IPV6
> + select BR2_PACKAGE_LIBNL

libnl depends on threads, so you must propagate the dependency, like so:

    depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
    select BR2_PACKAGE_LIBNL

> + help
> +   batman-adv controll utility
> +
> +   http://www.open-mesh.org/projects/open-mesh/wiki

Indentation for options should be jsut one tab; indentation for the help
text should be one tab + two spaces.

As for the help text, we usually like to have the first few sentences
that upstream provides, and a direct link to the upstream homepage of
the project. Your pointer is about the whole B.A.T.M.A.N. project; I
found this to be better suited, no?

    Batctl is the configuration and debugging tool for batman-adv.

    http://www.open-mesh.org/projects/batman-adv/wiki/Using-batctl

> diff --git a/package/batctl/batctl.hash b/package/batctl/batctl.hash
> new file mode 100644
> index 0000000..663e602
> --- /dev/null
> +++ b/package/batctl/batctl.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256 77509ed70232ebc0b73e2fa9471ae13b12d6547d167dda0a82f7a7fad7252c36
>  batctl-2014.4.0.tar.gz

Your mail client wraps lines, so we can't apply the patch. Please use
git-send-email (or fix your mail client to not line-wrap).

> diff --git a/package/batctl/batctl.mk b/package/batctl/batctl.mk
> new file mode 100644
> index 0000000..087d7e6
> --- /dev/null
> +++ b/package/batctl/batctl.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# batman-adv control
> +#
> +################################################################################
> +
> +BATCTL_VERSION = 2014.4.0
> +BATCTL_SOURCE = batctl-$(BATCTL_VERSION).tar.gz
> +BATCTL_SITE =
> http://downloads.open-mesh.org/batman/releases/batman-adv-$(BATCTL_VERSION)

Ditto, line-wrapped.

> +BATCTL_LICENSE = GPLv2+

There is no 'or later' clause anywhere in the source tree, so this
should be just "GPLv2".

And there is indeed no license file. :-/

> +BATCTL_DEPENDENCIES += libnl
> +BATCTL_CFLAGS += "-I$(STAGING_DIR)/usr/include/libnl3

You're not using BATCTL_CFLAGS, so just remove that line.

> +define BATCTL_BUILD_CMDS
> + $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC="$(TARGET_CC)" \
> + CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3" \
> +        DBM_INCLUDE="$(STAGING_DIR)/usr/include" \

DBM_INCLUDES does not seem to be used in the source tree. Care to see if
it really is needed?

> + LDFLAGS="$(TARGET_LDFLAGS)"
> +endef

Indentation for _CMDS definitions is one tab.

> +define BATCTL_INSTALL_TARGET_CMDS
> + $(INSTALL) -m 755 -D $(@D)/batctl $(TARGET_DIR)/usr/sbin/batctl

Ditto, indent by one tab.

> +endef
> +
> +$(eval $(generic-package))

Well, all the above are pretty minor issues. :-)
Care to have a look at them and respin your patch?

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
