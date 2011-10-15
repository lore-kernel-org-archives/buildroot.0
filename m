From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 15 Oct 2011 12:13:37 +0200
Subject: [Buildroot] [PATCH 2/9] Copy gdbserver from external toolchain
In-Reply-To: <1318603921-22899-3-git-send-email-will_wagner@carallon.com>
References: <1318603921-22899-1-git-send-email-will_wagner@carallon.com>
 <1318603921-22899-3-git-send-email-will_wagner@carallon.com>
Message-ID: <201110151213.38523.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Friday 14 October 2011 16:51:54, Will Wagner wrote:
> If you are using an external toolchain that includes gdb for host and gdbserver for target, this option will copy gdbserver onto the target.
> 
> Currently has support for ct-ng and codesourcery toolchains
> 
> Original idea by Anders Darander taken from http://comments.gmane.org/gmane.comp.lib.uclibc.buildroot/17747
> 
> Signed-off-by: Will Wagner <will_wagner@carallon.com>
> ---
>  toolchain/helpers.mk                     |   30 ++++++++++++++++++++++++++++++
>  toolchain/toolchain-external/Config.in   |    6 ++++++
>  toolchain/toolchain-external/ext-tool.mk |    8 ++++++++
>  3 files changed, 44 insertions(+), 0 deletions(-)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 4d90d15..3dfbcf0 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -101,6 +101,36 @@ copy_toolchain_sysroot = \
>  	find $(STAGING_DIR) -type d | xargs chmod 755
>  
>  #
> +# Copy selected files from the toolchain debug-root to the target dir.
> +#
> +# $1: The sysroot-feature (this is used for the base of the debug-root)
> +# $2: The file to be installed
> +# $3: Destination folder on the rootfs.
> +# $4: cross-gcc path
> +#
> +copy_toolchain_debugroot = \

 This macro is only called from one place and I don't see a reason why
it should ever be called from anywhere else.  So why not put it directly
in the ext-toolchain-installed target?

> +	SYSROOT_DIR="$(strip $1)" \
> +	DEBUGROOT_DIR="$(strip $1)"/../debug-root; \
> +	FILE="$(strip $2)"; \
> +	DESTDIR="$(strip $3)"; \
> +	__CROSS_CC="$(strip $4)" ; \
> +\
> +       if $$($${__CROSS_CC} -v 2>&1 | grep crosstool-NG 2>&1 1>/dev/null) ; then \
> +               echo "A Crosstool-NG generated toolchain is detected."; \
> +               if test -f $${DEBUGROOT_DIR}/usr/bin/$${FILE}; then \
> +                       $(INSTALL) -m0755 $${DEBUGROOT_DIR}/usr/bin/$${FILE} $(TARGET_DIR)/$${DESTDIR}/$${FILE}; \
> +               fi \
> +       elif $$($(TARGET_CROSS)gcc -v 2>&1 | grep 'Sourcery G++' 2>&1 1>/dev/null) ; then \
> +               echo "A Sourcery G++ generated toolchain is detected."; \
> +               if test -f $${SYSROOT_DIR}/usr/bin/$${FILE}; then \
> +                       $(INSTALL) -m0755 $${SYSROOT_DIR}/usr/bin/$${FILE} $(TARGET_DIR)/$${DESTDIR}/$${FILE}; \
> +               fi \
> +       else \
> +               echo "Error: Not a known toolchain!"; \
> +               exit 1; \
> +       fi

 Isn't it simpler to just try the possible locations?  I think we can
safely assume that if there is a file called 'gdbserver' in a bin directory,
it will be the gdbserver we want.

 So something like

	found=false; \
	for dir in $${DEBUGROOT_DIR} $${SYSROOT_DIR}; do \
		if test -f $${dir}/usr/bin/$${FILE}; then
			$(INSTALL) -m0755 $${SYSROOT_DIR}/usr/bin/$${FILE} $(TARGET_DIR)/$${DESTDIR}/$${FILE}; \
			found=true; \
			break; \
		fi; \
	done; \
	if [ -z "$${found}" ]; then \
		echo "gdbserver executable not found!"; \
		exit 1; \
	fi

> +
> +#
>  # Create lib64 -> lib and usr/lib64 -> usr/lib symbolic links in the
>  # target and staging directories. This is needed for some 64 bits
>  # toolchains such as the Crosstool-NG toolchains, for which the path
> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index ff7e8db..aa6829c 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -322,6 +322,12 @@ config BR2_TOOLCHAIN_EXTERNAL_CXX
>  	  support. If you don't know, leave the default value,
>  	  Buildroot will tell you if it's correct or not.
>  
> +config BR2_TOOLCHAIN_EXTERNAL_GDBSERVER
> +	bool "Toolchain has GDB Server binary?"
> +	help
> +	  Select this option if your external toolchain has
> +	  a GDB server binary to be copied to the target.
> +

 Either this one should depend on BR2_PACKAGE_GDB_SERVER or vice versa.

>  endif # BR2_TOOLCHAIN_EXTERNAL_CUSTOM
>  
>  endif # BR2_TOOLCHAIN_EXTERNAL
> diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
> index b9d932f..38c0cc5 100644
> --- a/toolchain/toolchain-external/ext-tool.mk
> +++ b/toolchain/toolchain-external/ext-tool.mk
> @@ -64,6 +64,10 @@ LIB_EXTERNAL_LIBS+=libpthread.so
>  ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
>  LIB_EXTERNAL_LIBS+=libthread_db.so
>  endif # gdbserver
> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GDBSERVER),y)
> +LIB_EXTERNAL_LIBS+=libthread_db.so
> +LIB_EXTERNAL_GDBSERVER+=gdbserver
> +endif # external gdbserver
>  endif # ! no threads
>  
>  # Details about sysroot directory selection.
> @@ -300,6 +304,10 @@ $(STAMP_DIR)/ext-toolchain-installed: $(TOOLCHAIN_EXTERNAL_DEPENDENCIES)
>  	if [ -L $${ARCH_SYSROOT_DIR}/lib64 ] ; then \
>  		$(call create_lib64_symlinks) ; \
>  	fi ; \
> +	if test -n $(LIB_EXTERNAL_GDBSERVER) ; then \
> +		echo "Copy gdbserver from the external toolchain to target..." ; \
> +		$(call copy_toolchain_debugroot,$${SYSROOT_DIR},$(LIB_EXTERNAL_GDBSERVER),/usr/bin,$(TOOLCHAIN_EXTERNAL_CC)) ; \
> +	fi ; \
>  	touch $@
>  
>  # Build toolchain wrapper for preprocessor, C and C++ compiler, and setup
> 


 Regards,
 Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111015/57daba3a/attachment-0001.html>
