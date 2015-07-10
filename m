From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 11 Jul 2015 00:08:09 +0200
Subject: [Buildroot] [PATCH v2] package/schedtool: new package
In-Reply-To: <1432889192-22169-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1432889192-22169-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <55A04249.2020601@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Angelo,

Le 29/05/2015 10:46, Angelo Compagnucci a ?crit :
> Schedtool is the definitive interface to Linux's scheduler.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Thanks for your patch.

The two syscall "__NR_sched_setattr" and "__NR_sched_getattr" has been defined
for most architectures since kernel 3.14 but schedtool redefine them for x86_64,
i386 and arm even if they are already available in linux/unistd.h...
(see syscall_magic.h)

So schedtool should depend on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14 except for
microblaze (BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15), aarch64
(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17) and blackfin
(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_1) otherwise it will break.

Obviously, it needs a kernel that implement these syscall.

Can you check if schedtool can really be used on these architectures.

Best regards,
Romain Naour

> ---
> Changes v1 -> v2:
>  - switched to TARGET_CONFIGURE_OPTS
>  - fixed license
> 
>  package/Config.in              |  1 +
>  package/schedtool/Config.in    | 10 ++++++++++
>  package/schedtool/schedtool.mk | 20 ++++++++++++++++++++
>  3 files changed, 31 insertions(+)
>  create mode 100644 package/schedtool/Config.in
>  create mode 100644 package/schedtool/schedtool.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 6661240..35f02e5 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1414,6 +1414,7 @@ endif
>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  	source "package/rsyslog/Config.in"
>  endif
> +	source "package/schedtool/Config.in"
>  	source "package/smack/Config.in"
>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  	source "package/start-stop-daemon/Config.in"
> diff --git a/package/schedtool/Config.in b/package/schedtool/Config.in
> new file mode 100644
> index 0000000..928a02e
> --- /dev/null
> +++ b/package/schedtool/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_SCHEDTOOL
> +	bool "schedtool"
> +	help
> +	  schedtool was born, because there was no tool to change or query
> +	  all CPU-scheduling policies under Linux, in one handy command.
> +	  Support for CPU-affinity has also been added and most recently
> +	  (re-)nicing of processes.
> +	  Thus, schedtool is the definitive interface to Linux's scheduler.
> +
> +	  https://github.com/jlelli/schedtool-dl
> diff --git a/package/schedtool/schedtool.mk b/package/schedtool/schedtool.mk
> new file mode 100644
> index 0000000..481ecc0
> --- /dev/null
> +++ b/package/schedtool/schedtool.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# schedtool
> +#
> +################################################################################
> +
> +SCHEDTOOL_VERSION = 3ffb479929c31cbae09de08f94f58b8f0f061d91
> +SCHEDTOOL_SITE = $(call github,jlelli,schedtool-dl,$(SCHEDTOOL_VERSION))
> +SCHEDTOOL_LICENSE = GPLv2
> +SCHEDTOOL_LICENSE_FILES = LICENSE
> +
> +define SCHEDTOOL_BUILD_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
> +endef
> +
> +define SCHEDTOOL_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/schedtool $(TARGET_DIR)/usr/bin
> +endef
> +
> +$(eval $(generic-package))
> 
