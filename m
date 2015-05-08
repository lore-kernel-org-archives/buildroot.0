From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 8 May 2015 07:52:05 +0300
Subject: [Buildroot] [PATCH 1/2] librtas: new package
In-Reply-To: <780e48cca88c90480b3b038c5965e52db284d403.1431059241.git.sam.bobroff@au1.ibm.com>
References: <cover.1431059241.git.sam.bobroff@au1.ibm.com>
 <780e48cca88c90480b3b038c5965e52db284d403.1431059241.git.sam.bobroff@au1.ibm.com>
Message-ID: <20150508045205.GG2183@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sam,

On Fri, May 08, 2015 at 02:27:48PM +1000, Sam Bobroff wrote:
> diff --git a/package/librtas/librtas.mk b/package/librtas/librtas.mk
> new file mode 100644
> index 0000000..d13c876
> --- /dev/null
> +++ b/package/librtas/librtas.mk
> @@ -0,0 +1,27 @@
> +################################################################################
> +#
> +# librtas
> +#
> +################################################################################
> +
> +LIBRTAS_VERSION = 1.3.13
> +LIBRTAS_SITE = http://downloads.sourceforge.net/project/librtas
> +LIBRTAS_LICENSE = Common Public License Version 1.0
> +LIBRTAS_LICENSE_FILES = COPYRIGHT
> +LIBRTAS_INSTALL_STAGING = YES
> +LIBRTAS_INSTALL_TARGET = YES

Not needed, this is the default.

> +
> +define LIBRTAS_BUILD_CMDS
> +	$(MAKE) -C $(@D) CC="$(TARGET_CC)" LD="$(TARGET_LD)"
> +endef
> +
> +define LIBRTAS_INSTALL_STAGING_CMDS
> +	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
> +endef
> +
> +define LIBRTAS_INSTALL_TARGET_CMDS
> +	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
> +endef
> +
> +
> +$(eval $(generic-package))
> diff --git a/package/librtas/missing-librtas.so.1.patch b/package/librtas/missing-librtas.so.1.patch
> new file mode 100644
> index 0000000..de21d66
> --- /dev/null
> +++ b/package/librtas/missing-librtas.so.1.patch
> @@ -0,0 +1,11 @@

Please add your Sign-off here.

> +diff -purN librtas-1.3.12.orig/librtas_src/Makefile librtas-1.3.12/librtas_src/Makefile
> +--- librtas-1.3.12.orig/librtas_src/Makefile	2015-04-09 10:45:19.772381633 +1000
> ++++ librtas-1.3.12/librtas_src/Makefile	2015-04-09 10:45:57.968604762 +1000
> +@@ -33,6 +33,7 @@ install:
> + 	@$(call install_lib,$(LIBRTAS),$(DESTDIR))
> + 	@$(call install_inc,$(HEADERS),$(DESTDIR))
> + 	@ln -sf $(LIBRTAS) $(DESTDIR)/$(LIB_DIR)$(call is_lib64,$(LIBRTAS))/$(LIBRTAS_SONAME)
> ++	@ln -sf $(LIBRTAS) $(DESTDIR)/$(LIB_DIR)$(call is_lib64,$(LIBRTAS))/$(LIBRTAS_SONAME).1
> + 
> + uninstall:
> + 	@$(call uninstall_lib,$(LIBRTAS),$(DESTDIR))

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
