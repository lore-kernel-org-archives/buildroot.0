From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Apr 2015 12:22:32 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/swupdate: new package
In-Reply-To: <1429916563-20332-1-git-send-email-joerg.krause@embedded.rocks>
References: <1429916563-20332-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150425102232.GB4275@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg, All,

On 2015-04-25 01:02 +0200, J?rg Krause spake thusly:
> This patch is based on an WIP version submitted by Romain Naour, commented by
> Arnout Vandecappelle:
> https://patchwork.ozlabs.org/patch/401270/
> 
> We use the latest commit of swupdate instead of the last release 2014.07 to
> obtain several bug fixes and get support for the image downloading feature.
> 
> The package build file does not detect which dependencies are available. So we
> provide a default configuration which selects the external dependencies by
> default except for lua. Lua support can be added by the user by customizing
> the configuration file (swupdate.config) add select the Lua 5.2 interpreter
> manually.
> 
> Furthermore the U-Boot handler is not enabled by default, as it may cause
> runtime issues if the U-Boot environment configuration file (fw_env.config) is
> not present on the target system.
> 
> The package provides a default website which can be installed to the target to
> enable firmware update with a browser.
> 
> Note, swupdate does not implement a savedefconfig and nconfig target.
> Note, swupdate provides its own customized versions of mongoose and lsqlite3.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> Cc: Romain Naour <romain.naour@openwide.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Tested-by: Mike Williams <mike@mikebwilliams.com>
> ---
[--SNIP--]
> diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
> new file mode 100644
> index 0000000..a174866
> --- /dev/null
> +++ b/package/swupdate/Config.in
> @@ -0,0 +1,40 @@
> +config BR2_PACKAGE_SWUPDATE
> +	bool "swupdate"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # OpenSSL
> +	select BR2_PACKAGE_LIBCONFIG
> +	select BR2_PACKAGE_LIBCURL
> +	select BR2_PACKAGE_MTD
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  swupdate provides a reliable way to update the software on an
> +	  embedded system.
> +
> +	  https://github.com/sbabic/swupdate.git

We prefer to point to the homepage when it exists, rather than to the
git tree:
    https://sbabic.github.io/swupdate/

> +if BR2_PACKAGE_SWUPDATE
> +
> +config BR2_PACKAGE_SWUPDATE_CONFIG
> +	string "swupdate configuration file"
> +	default "package/swupdate/swupdate.config"
> +	help
> +	  The default swupdate configuration file will enable swupdate with
> +	  an image downloader and a webserver, as well as handlers for UBI
> +	  volumes, raw NAND or NOR flash, SD cards and shell scripts.
> +
> +	  Most people will just use the default swupdate configuration file.
> +	  However, some people may wish to use their own modified swupdate
> +	  configuration file, and will specify their config file location
> +	  with this option.
> +
> +	  Note that if you add lua support in the configuration file you need
> +	  the Lua 5.2 interpreter (BR_PACKAGE_LUA_5_2) manually.

Something's weird in this sentence. What about:

    Note that if you add lua support in the configuration file, you will
    have to enable the Lua 5.2 interpreter (BR_PACKAGE_LUA_5_2).

[--SNIP--]
> diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
> new file mode 100644
> index 0000000..71ae888
> --- /dev/null
> +++ b/package/swupdate/swupdate.mk
> @@ -0,0 +1,53 @@
> +################################################################################
> +#
> +# swupdate
> +#
> +################################################################################
> +
> +SWUPDATE_VERSION = c68f02320858f89f2d441ff2057d49489fb6f586
> +SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
> +SWUPDATE_LICENSE = GPLv2+

In fact, there are a few other licenses. For example, the copies of
Mongoose and lsqlite3 they bundle are MIT; the sqlite3 aggregated source
file is public domain ("The author disclaims copyright to this source
code.").

> +SWUPDATE_LICENSE_FILES = COPYING
> +
> +# swupdate bundles its own mongoose and lsqlite3 versions

Is it possible to make it use external versions, or does it only support
using its bundled ones?

If that's possible, we prefer that.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
