From: Romain Naour <romain.naour@smile.fr>
Date: Sat, 2 Jul 2016 11:54:04 +0200
Subject: [Buildroot] [PATCH 2/2] acpica: new package
In-Reply-To: <1459016777-27952-2-git-send-email-nunes.erico@gmail.com>
References: <1459016777-27952-1-git-send-email-nunes.erico@gmail.com>
 <1459016777-27952-2-git-send-email-nunes.erico@gmail.com>
Message-ID: <a3fe6cc6-15ac-b2e4-d995-9fbd25ce034c@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Erico,

Le 26/03/2016 ? 19:26, Erico Nunes a ?crit :
> The ACPI Component Architecture (ACPICA) project provides an operating
> system (OS)-independent reference implementation of the Advanced
> Configuration and Power Interface Specification (ACPI).
> 
> It contains tools such as acpidump, iasl, acpixtract, etc.
> 
> The only issue that has been found is that it used uname to determine
> the architecture for the target, and this has been worked around by
> putting the target architecture directly instead.
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> ---
>  package/Config.in          |  1 +
>  package/acpica/Config.in   |  9 +++++++++
>  package/acpica/acpica.hash |  2 ++
>  package/acpica/acpica.mk   | 26 ++++++++++++++++++++++++++
>  4 files changed, 38 insertions(+)
>  create mode 100644 package/acpica/Config.in
>  create mode 100644 package/acpica/acpica.hash
>  create mode 100644 package/acpica/acpica.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index cca553c..6a283eb 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -339,6 +339,7 @@ menu "Firmware"
>  	source "package/zd1211-firmware/Config.in"
>  endmenu
>  	source "package/a10disp/Config.in"
> +	source "package/acpica/Config.in"
>  	source "package/acpid/Config.in"
>  	source "package/acpitool/Config.in"
>  	source "package/am335x-pru-package/Config.in"
> diff --git a/package/acpica/Config.in b/package/acpica/Config.in
> new file mode 100644
> index 0000000..8c33d0f
> --- /dev/null
> +++ b/package/acpica/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_ACPICA
> +	bool "acpica"
> +	help
> +	  The ACPI Component Architecture (ACPICA) project provides an
> +	  operating system (OS)-independent reference implementation of
> +	  the Advanced Configuration and Power Interface Specification
> +	  (ACPI).
> +
> +	  https://www.acpica.org
> diff --git a/package/acpica/acpica.hash b/package/acpica/acpica.hash
> new file mode 100644
> index 0000000..2798792
> --- /dev/null
> +++ b/package/acpica/acpica.hash
> @@ -0,0 +1,2 @@
> +# locally computed hash
> +sha256 c0c68c7a8e9b1f4f66895b5950023042cb8e619fd92dab288010c8bd023d3270 acpica-unix2-20160212.tar.gz
> diff --git a/package/acpica/acpica.mk b/package/acpica/acpica.mk
> new file mode 100644
> index 0000000..40ba009
> --- /dev/null
> +++ b/package/acpica/acpica.mk
> @@ -0,0 +1,26 @@
> +################################################################################
> +#
> +# acpica
> +#
> +################################################################################
> +
> +ACPICA_VERSION = 20160212
> +ACPICA_SOURCE = acpica-unix2-$(ACPICA_VERSION).tar.gz
> +ACPICA_SITE = https://acpica.org/sites/acpica/files
> +ACPICA_LICENSE = GPLv2

The license seems to be a BSD like or GPLv2

> +ACPICA_LICENSE_FILES = source/include/acpi.h
> +ACPICA_DEPENDENCIES = host-bison host-flex
> +
> +define ACPICA_CONFIGURE_CMDS
> +	$(SED) 's/uname -m/echo $(TARGET_ARCH)/' $(@D)/generate/unix/Makefile.common
> +endef
> +
> +define ACPICA_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) HOST=_LINUX CC=$(TARGET_CC) all
> +endef
> +
> +define ACPICA_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
> +endef

Maybe you can use TARGET_CONFIGURE_OPTS like as Peter suggested in [1]

With that fixed:
  Reviewed-by: Romain Naour <romain.naour@gmail.com>

Build tested with musl, uclibc and static build.
Tested-by: Romain Naour <romain.naour@gmail.com>

[1]
https://git.busybox.net/buildroot/commit/?id=6d2cb12d5f544a5fd24b14326e85901dfeaf3d31

Best regards,
Romain Naour

> +
> +$(eval $(generic-package))
> 
