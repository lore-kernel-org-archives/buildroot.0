From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 20 Oct 2018 23:07:17 +0200
Subject: [Buildroot] [PATCH] glibc: Install iconvconfig on target with
 gconv libs
In-Reply-To: <20180802063830.19364-1-abrodkin@synopsys.com>
References: <20180802063830.19364-1-abrodkin@synopsys.com>
Message-ID: <297457d6-d63a-cb93-30e0-fefb599f1cf3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexey,

Le 02/08/2018 ? 08:38, Alexey Brodkin a ?crit?:
> In some cases we need to have gconv-modules.cache on target,
> for example see [1] or glibc's test-suite (iconv/test-iconvconfig).
> 
> We do have iconvconfig installed in Buildroot's staging folder but
> it gets never installed on targe because instead of calling glibc's
> "install" target we simply copy a list of libs.
> 
> So then let's copy oven iconvconfig there as well in a similar manner.
> Still we do it only if gconv libs are being copied otherwise it makes no
> sense I guess.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2013-July/075097.html
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Romain Naour <romain.naour@gmail.com>
> Cc: Baruch Siach <baruch@tkos.co.il>
> ---
> 
> I do realize my implementation might look not super correct as
> appending *binary* to the list of *libs* is not good. But:
> 
> 1. It's very tiny yet working fix or even better "improvement"
> 2. That might at least be a good starting pont for a discussion on
>    what would be a better way :)

Well, we don't require copy_toolchain_lib_root to install iconvconfig binary on
the target. Libraries needs a complicated logic to be deployed on the target
hence copy_toolchain_lib_root.

Maybe just add GLIBC_INSTALL_ICONVCONFIG:

define GLIBC_INSTALL_ICONVCONFIG
	$(INSTALL) -m 0755 -D $(@D)/build/iconv/iconvconfig \
		$(TARGET_DIR)/usr/sbin/iconvconfig
endef

define GLIBC_INSTALL_TARGET_CMDS
	for libpattern in $(GLIBC_LIBS_LIB); do \
		$(call copy_toolchain_lib_root,$$libpattern) ; \
	done
	$(GLIBC_INSTALL_ICONVCONFIG)
endef

Best regards,
Romain


> 
>  package/glibc/glibc.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 6d21ae7ac07d..9366b3ec4199 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -119,6 +119,10 @@ ifeq ($(BR2_PACKAGE_GDB),y)
>  GLIBC_LIBS_LIB += libthread_db.so.*
>  endif
>  
> +ifeq ($(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY),y)
> +GLIBC_LIBS_LIB += iconvconfig
> +endif
> +
>  define GLIBC_INSTALL_TARGET_CMDS
>  	for libpattern in $(GLIBC_LIBS_LIB); do \
>  		$(call copy_toolchain_lib_root,$$libpattern) ; \
> 
