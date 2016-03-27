From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 27 Mar 2016 18:20:43 +0200
Subject: [Buildroot] [PATCH 1/5] toolchain-external: blackfin: install
 FDPIC libraries also to staging
In-Reply-To: <1455304826-10557-2-git-send-email-patrickdepinguin@gmail.com>
References: <1455304826-10557-1-git-send-email-patrickdepinguin@gmail.com>
 <1455304826-10557-2-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <56F8085B.6020304@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/12/16 20:20, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> For external Blackfin toolchains with BR2_BFIN_INSTALL_FDPIC_SHARED set,
> the FDPIC shared libraries are currently only copied to the target
> directory, not to staging.
>
> For debugging purposes, an unstripped copy in staging is necessary.
> Moreover, this change will simplify a subsequent change that lines up the
> location of shared libraries between target and staging directories.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Quick build-test done.

  Regards,
  Arnout

> ---
>   toolchain/toolchain-external/toolchain-external.mk | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index 6c3022a..ffdee49 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -656,6 +656,20 @@ endef
>   # nonetheless requested the installation of the FDPIC libraries to the
>   # target filesystem.
>   ifeq ($(BR2_BFIN_INSTALL_FDPIC_SHARED),y)
> +define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS_BFIN_FDPIC
> +	$(Q)$(call MESSAGE,"Install external toolchain FDPIC libraries to staging...") ; \
> +	FDPIC_EXTERNAL_CC=$(dir $(TOOLCHAIN_EXTERNAL_CC))/../../bfin-linux-uclibc/bin/bfin-linux-uclibc-gcc ; \
> +	FDPIC_SYSROOT_DIR="$(call toolchain_find_sysroot,$${FDPIC_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
> +	FDPIC_LIB_DIR="$(call toolchain_find_libdir,$${FDPIC_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
> +	FDPIC_SUPPORT_LIB_DIR="" ; \
> +	if test `find $${FDPIC_SYSROOT_DIR} -name 'libstdc++.a' | wc -l` -eq 0 ; then \
> +	        FDPIC_LIBSTDCPP_A_LOCATION=$$(LANG=C $${FDPIC_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS) -print-file-name=libstdc++.a) ; \
> +	        if [ -e "$${FDPIC_LIBSTDCPP_A_LOCATION}" ]; then \
> +	                FDPIC_SUPPORT_LIB_DIR=`readlink -f $${FDPIC_LIBSTDCPP_A_LOCATION} | sed -r -e 's:libstdc\+\+\.a::'` ; \
> +	        fi ; \
> +	fi ; \
> +	$(call copy_toolchain_sysroot,$${FDPIC_SYSROOT_DIR},$${FDPIC_SYSROOT_DIR},,$${FDPIC_LIB_DIR},$${FDPIC_SUPPORT_LIB_DIR})
> +endef
>   define TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FDPIC
>   	$(Q)$(call MESSAGE,"Install external toolchain FDPIC libraries to target...") ; \
>   	FDPIC_EXTERNAL_CC=$(dir $(TOOLCHAIN_EXTERNAL_CC))/../../bfin-linux-uclibc/bin/bfin-linux-uclibc-gcc ; \
> @@ -755,6 +769,7 @@ TOOLCHAIN_EXTERNAL_BUILD_CMDS = $(TOOLCHAIN_BUILD_WRAPPER)
>   define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
>   	$(TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK)
>   	$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS)
> +	$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS_BFIN_FDPIC)
>   	$(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
>   	$(TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
>   endef
> @@ -771,3 +786,4 @@ define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_CMDS
>   endef
>
>   $(eval $(generic-package))
> +
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
