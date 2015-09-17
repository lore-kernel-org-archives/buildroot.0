From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 17 Sep 2015 09:56:20 +0100
Subject: [Buildroot] [PATCH v4 2/2] micropython-lib: new packages
In-Reply-To: <1442446199-15963-3-git-send-email-judge.packham@gmail.com>
References: <CAFOYHZB-oynjvUKa9CkHvBpvw+kuSuPLgWrZZwEOr7YSQOvW0g@mail.gmail.com>
 <1442446199-15963-1-git-send-email-judge.packham@gmail.com>
 <1442446199-15963-3-git-send-email-judge.packham@gmail.com>
Message-ID: <55FA8034.6050403@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Chris Packham,

On 09/17/2015 12:29 AM, Chris Packham wrote:
> Core Python libraries ported to MicroPython.
> 
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture:

$ find output/target/usr/lib/micropython/ | wc -l
191

There are no binary files to check if it was build for the right
architecture.

Regards,

Vincent.

> ---
>  package/Config.in                          |  1 +
>  package/micropython-lib/Config.in          |  7 +++++++
>  package/micropython-lib/micropython-lib.mk | 18 ++++++++++++++++++
>  3 files changed, 26 insertions(+)
>  create mode 100644 package/micropython-lib/Config.in
>  create mode 100644 package/micropython-lib/micropython-lib.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 94ac406..986fe16 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -510,6 +510,7 @@ endmenu
>  endif
>  	source "package/lutok/Config.in"
>  	source "package/micropython/Config.in"
> +	source "package/micropython-lib/Config.in"
>  	source "package/moarvm/Config.in"
>  	source "package/mono/Config.in"
>  if BR2_PACKAGE_MONO
> diff --git a/package/micropython-lib/Config.in b/package/micropython-lib/Config.in
> new file mode 100644
> index 0000000..a7e017b
> --- /dev/null
> +++ b/package/micropython-lib/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_MICROPYTHON_LIB
> +	bool "micropython-lib"
> +	depends on BR2_PACKAGE_MICROPYTHON
> +	help
> +	  Core Python libraries ported to MicroPython.
> +
> +	  http://micropython.org
> diff --git a/package/micropython-lib/micropython-lib.mk b/package/micropython-lib/micropython-lib.mk
> new file mode 100644
> index 0000000..a4a6cf6
> --- /dev/null
> +++ b/package/micropython-lib/micropython-lib.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# micropython-lib
> +#
> +################################################################################
> +
> +MICROPYTHON_LIB_VERSION = v0.5
> +MICROPYTHON_LIB_SITE = $(call github,micropython,micropython-lib,$(MICROPYTHON_LIB_VERSION))
> +MICROPYTHON_LIB_LICENSE = Python software foundation license v2 (some modules), MIT (everything else)
> +MICROPYTHON_LIB_LICENSE_FILES = LICENSE
> +
> +define MICROPYTHON_LIB_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> +		PREFIX=$(TARGET_DIR)/usr/lib/micropython \
> +		install
> +endef
> +
> +$(eval $(generic-package))
> 
