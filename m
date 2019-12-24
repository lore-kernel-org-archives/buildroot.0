From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 24 Dec 2019 19:08:03 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/xorcurses: new package
In-Reply-To: <20190912184013.17316-3-huth@tuxfamily.org>
References: <20190912184013.17316-1-huth@tuxfamily.org>
 <20190912184013.17316-3-huth@tuxfamily.org>
Message-ID: <fd136206-dd61-54e1-291f-a3dc20ce2578@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 9/12/19 8:40 PM, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> XorCurses is a remake of the 8-bit game 'Xor' by Astral Software.
> Your task is to roam around a series of mazes where you have to collect
> all blue masks before finding the exit. You have two 'shields' (players)
> and you can use either one at any time and switch between them. While
> the first level is simply a matter of navigation, the following levels
> introduce further objects like bombs and teleports, which have to be
> used right to solve the puzzles.
> 
> Signed-off-by: Thomas Huth <huth@tuxfamily.org>
> ---
>   package/Config.in                |  1 +
>   package/xorcurses/Config.in      | 11 +++++++++++
>   package/xorcurses/xorcurses.hash |  5 +++++
>   package/xorcurses/xorcurses.mk   | 25 +++++++++++++++++++++++++
>   4 files changed, 42 insertions(+)
>   create mode 100644 package/xorcurses/Config.in
>   create mode 100644 package/xorcurses/xorcurses.hash
>   create mode 100644 package/xorcurses/xorcurses.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 92ec3ca66e..629376f7c1 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -268,6 +268,7 @@ menu "Games"
>   	source "package/stella/Config.in"
>   	source "package/supertux/Config.in"
>   	source "package/supertuxkart/Config.in"
> +	source "package/xorcurses/Config.in"
>   endmenu
>   
>   menu "Graphic libraries and applications (graphic/text)"
> diff --git a/package/xorcurses/Config.in b/package/xorcurses/Config.in
> new file mode 100644
> index 0000000000..f0b1a7898c
> --- /dev/null
> +++ b/package/xorcurses/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_XORCURSES
> +	bool "xorcurses"
> +	select BR2_PACKAGE_NCURSES
> +	help
> +	  XorCurses is a game remake of the 8-bit game 'Xor'. Your task
> +	  is to roam around a series of mazes where you have to collect
> +	  all blue masks before finding the exit. Note that the game
> +	  needs a terminal with colors, i.e. make sure that the TERM
> +	  environment variable is set to "linux" ("vt100" won't work).
> +
> +	  http://jwm-art.net/?p=XorCurses
> diff --git a/package/xorcurses/xorcurses.hash b/package/xorcurses/xorcurses.hash
> new file mode 100644
> index 0000000000..38c1c001c1
> --- /dev/null
> +++ b/package/xorcurses/xorcurses.hash
> @@ -0,0 +1,5 @@
> +# Locally calculated
> +sha512 1782ebf6ae8798b32e0a8e5e20e6d0b44eb619f6e7f015735c6e86205bd545da108c36bff1c9cfc9e9b44dee8f90bacb9df70436991f57f51c2c87e94b3a4725  XorCurses-0.2.2.tar.bz2
> +
> +# License information is only mentioned in the README file
> +sha512 1878313f74d10e97aea8560ca9b28981b7ccf83ade81275eb982684cea006bc55776b6d029d1eca7a7ae20756aed0cfb4f63424634e0b5ad15d052dca3d2eee9  README
> diff --git a/package/xorcurses/xorcurses.mk b/package/xorcurses/xorcurses.mk
> new file mode 100644
> index 0000000000..aa70b73c08
> --- /dev/null
> +++ b/package/xorcurses/xorcurses.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# XorCurses
> +#
> +################################################################################
> +
> +XORCURSES_VERSION = 0.2.2
> +XORCURSES_SOURCE = XorCurses-$(XORCURSES_VERSION).tar.bz2
> +XORCURSES_SITE = http://www.jwm-art.net/art/archive
> +XORCURSES_DEPENDENCIES = ncurses
> +XORCURSES_LICENSE = GPL-3.0
> +XORCURSES_LICENSE_FILES = README
> +
> +define XORCURSES_BUILD_CMDS
> +	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
> +		CFLAGS="$(TARGET_CFLAGS) -std=gnu99 -DDATADIR='\"/usr/share/xorcurses\"' -DVERSION='\"$(XORCURSES_VERSION)\"'"

Here ^^^ the line is too long.

> +endef
> +
> +define XORCURSES_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/xorcurses $(TARGET_DIR)/usr/bin/xorcurses
> +	mkdir -p $(TARGET_DIR)/usr/share/xorcurses/maps
> +	$(INSTALL) -D -m 0644 $(@D)/maps/*.xcm $(TARGET_DIR)/usr/share/xorcurses/maps/

Here ^^^ the line is too long.

> +endef
> +
> +$(eval $(generic-package))
> 

And please add your DEVELOPERS entry for this package.

Thank you
Best regards
-- 
Giulio Benetti
Benetti Engineering sas
