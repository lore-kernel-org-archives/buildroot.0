From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Dec 2008 09:24:57 +0100
Subject: [Buildroot] [RFC] First hack for external toolchain support
 based on sysroot
In-Reply-To: <20081202232132.7c67e402@surf>
References: <20081202232132.7c67e402@surf>
Message-ID: <20081210092457.64d6ef9f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Any reaction to this patch ?

Thanks,

Thomas

Le Tue, 2 Dec 2008 23:21:32 +0100,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> Hi,
> 
> This evening, I had a quick look at implementing support for external
> toolchain based on --sysroot. It seems to work, see the included
> patch. It's very hacky at the moment, I'm waiting for your
> suggestions to improve the patch.
> 
> Sincerly,
> 
> Thomas
> 
> ---
> 
> Another external toolchain support solution
> 
>  * In toolchain/external-toolchain/ext-tool.mk, copy the contents of
>    the sysroot directory to the staging dir.
> 
>  * In package/Makefile.in, add a --sysroot CFLAGS pointing to the
>    staging dir
> 
>  * Remove the CFLAGS and LDFLAGS definition from
>    TARGET_CONFIGURE_OPTS. I haven't investigated exactly why, but with
>    these options, DirectFB fails to build because it cannot find
>    PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP, even if DirectFB's Makefile
>    properly sets -D_GNU_SOURCE.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/Makefile.in                      |    4 +---
>  toolchain/external-toolchain/ext-tool.mk |    6 ++++++
>  2 files changed, 7 insertions(+), 3 deletions(-)
> 
> Index: buildroot2/package/Makefile.in
> ===================================================================
> --- buildroot2.orig/package/Makefile.in
> +++ buildroot2/package/Makefile.in
> @@ -89,7 +89,7 @@
>  # else it's an external toolchain
>  #########################################################################
>  else
> -TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
> -I$(STAGING_DIR)/include -I$(STAGING_DIR)/usr/include
> -I$(TOOLCHAIN_EXTERNAL_PATH)/$(TOOLCHAIN_EXTERNAL_PREFIX)/include
> +TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
> -I$(STAGING_DIR)/include -I$(STAGING_DIR)/usr/include
> -I$(TOOLCHAIN_EXTERNAL_PATH)/$(TOOLCHAIN_EXTERNAL_PREFIX)/include
> --sysroot $(STAGING_DIR)/ TARGET_CXXFLAGS=$(TARGET_CFLAGS)
> TARGET_LDFLAGS=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib endif @@
> -210,8 +210,6 @@ AR="$(TARGET_AR)" \ AS="$(TARGET_AS)" \
> LD="$(TARGET_LD)" \
> -		CFLAGS="$(TARGET_CFLAGS)" \
> -		LDFLAGS="$(TARGET_LDFLAGS)" \
>  		NM="$(TARGET_NM)" \
>  		CC="$(TARGET_CC) $(TARGET_CFLAGS)" \
>  		GCC="$(TARGET_CC) $(TARGET_CFLAGS)" \
> Index: buildroot2/toolchain/external-toolchain/ext-tool.mk
> ===================================================================
> --- buildroot2.orig/toolchain/external-toolchain/ext-tool.mk
> +++ buildroot2/toolchain/external-toolchain/ext-tool.mk
> @@ -44,6 +44,11 @@
>   \
>  	echo -n
>  
> +copy_toolchain_sysroot = \
> +	SYSROOT_DIR=`$(TARGET_CC) -v 2>&1 | grep ^Configured | tr "
> " "\n" | grep -- "--with-sysroot" | cut -f2 -d=`; \
> +	cp -a $${SYSROOT_DIR}/* $(STAGING_DIR)/ ; \
> +	find $(STAGING_DIR) -type d | xargs chmod 755
> +
>  uclibc: dependencies $(TARGET_DIR)/lib/$(strip $(subst ",,
> $(BR2_TOOLCHAIN_EXTERNAL_LIB_C))) 
>  $(TARGET_DIR)/lib/$(strip $(subst ",,
> $(BR2_TOOLCHAIN_EXTERNAL_LIB_C))): @@ -54,3 +59,4 @@
>  	for libs in $(strip $(subst ",,
> $(BR2_TOOLCHAIN_EXTERNAL_LIBS))); do \ $(call
> copy_toolchain_lib_root, $$libs, /lib,
> $(BR2_TOOLCHAIN_EXTERNAL_STRIP)); \ done
> +	$(call copy_toolchain_sysroot)
> \ No newline at end of file
> 
> 


-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
