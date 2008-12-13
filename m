From: danieljlaird at hotmail.com <danieljlaird@hotmail.com>
Date: Sat, 13 Dec 2008 19:24:43 -0000
Subject: [Buildroot] svn commit: trunk/buildroot:
	packagetoolchain/external-toolchain
In-Reply-To: <20081213161550.A9B5A3C2A6@busybox.net>
References: <20081213161550.A9B5A3C2A6@busybox.net>
Message-ID: <COL102-DS18796748B22FB7DBE5758EDCF60@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have not had a chance to try your patch but was trying similar patches so 
am hopeful that this is the right thing to do and will make external support 
a lot better.
Much appreciated
Dan

--------------------------------------------------
From: <tpetazzoni@uclibc.org>
Sent: Saturday, December 13, 2008 4:15 PM
To: <buildroot@uclibc.org>
Subject: [Buildroot] svn commit: trunk/buildroot: 
packagetoolchain/external-toolchain

> Author: tpetazzoni
> Date: 2008-12-13 08:15:50 -0800 (Sat, 13 Dec 2008)
> New Revision: 24408
>
> Log:
> Another external toolchain support solution
>
> * In toolchain/external-toolchain/ext-tool.mk, copy the contents of
>   the sysroot directory to the staging dir.
>
> * In package/Makefile.in, add a --sysroot CFLAGS pointing to the
>   staging dir
>
> * Remove the CFLAGS and LDFLAGS definition from
>   TARGET_CONFIGURE_OPTS. I haven't investigated exactly why, but with
>   these options, DirectFB fails to build because it cannot find
>   PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP, even if DirectFB's Makefile
>   properly sets -D_GNU_SOURCE.
>
> I have already sent this patch on December, 2nd to the mailing-list,
> but got no feedback. So let's commit and see what happens :-)
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
>
>
> Modified:
>   trunk/buildroot/package/Makefile.in
>   trunk/buildroot/toolchain/external-toolchain/ext-tool.mk
>
>
> Changeset:
> Modified: trunk/buildroot/package/Makefile.in
> ===================================================================
> --- trunk/buildroot/package/Makefile.in 2008-12-13 15:21:07 UTC (rev 
> 24407)
> +++ trunk/buildroot/package/Makefile.in 2008-12-13 16:15:50 UTC (rev 
> 24408)
> @@ -89,7 +89,7 @@
> # else it's an external toolchain
> #########################################################################
> else
> -TARGET_CFLAGS=$(TARGET_OPTIMIZATION) 
> $(TARGET_DEBUGGING) -I$(STAGING_DIR)/include -I$(STAGING_DIR)/usr/include  
> -I$(TOOLCHAIN_EXTERNAL_PATH)/$(TOOLCHAIN_EXTERNAL_PREFIX)/include
> +TARGET_CFLAGS=$(TARGET_OPTIMIZATION) 
> $(TARGET_DEBUGGING) -I$(STAGING_DIR)/include -I$(STAGING_DIR)/usr/include  
> -I$(TOOLCHAIN_EXTERNAL_PATH)/$(TOOLCHAIN_EXTERNAL_PREFIX)/include --sysroot 
> $(STAGING_DIR)/
> TARGET_CXXFLAGS=$(TARGET_CFLAGS)
> TARGET_LDFLAGS=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
> endif
> @@ -210,8 +210,6 @@
>  AR="$(TARGET_AR)" \
>  AS="$(TARGET_AS)" \
>  LD="$(TARGET_LD)" \
> - CFLAGS="$(TARGET_CFLAGS)" \
> - LDFLAGS="$(TARGET_LDFLAGS)" \
>  NM="$(TARGET_NM)" \
>  CC="$(TARGET_CC) $(TARGET_CFLAGS)" \
>  GCC="$(TARGET_CC) $(TARGET_CFLAGS)" \
>
> Modified: trunk/buildroot/toolchain/external-toolchain/ext-tool.mk
> ===================================================================
> --- trunk/buildroot/toolchain/external-toolchain/ext-tool.mk 2008-12-13 
> 15:21:07 UTC (rev 24407)
> +++ trunk/buildroot/toolchain/external-toolchain/ext-tool.mk 2008-12-13 
> 16:15:50 UTC (rev 24408)
> @@ -44,6 +44,11 @@
>  \
>  echo -n
>
> +copy_toolchain_sysroot = \
> + SYSROOT_DIR=`$(TARGET_CC) -v 2>&1 | grep ^Configured | tr " " "\n" | 
> grep -- "--with-sysroot" | cut -f2 -d=`; \
> + cp -a $${SYSROOT_DIR}/* $(STAGING_DIR)/ ; \
> + find $(STAGING_DIR) -type d | xargs chmod 755
> +
> uclibc: dependencies $(TARGET_DIR)/lib/$(strip $(subst ",, 
> $(BR2_TOOLCHAIN_EXTERNAL_LIB_C)))
>
> $(TARGET_DIR)/lib/$(strip $(subst ",, $(BR2_TOOLCHAIN_EXTERNAL_LIB_C))):
> @@ -54,3 +59,4 @@
>  for libs in $(strip $(subst ",, $(BR2_TOOLCHAIN_EXTERNAL_LIBS))); do \
>  $(call copy_toolchain_lib_root, $$libs, /lib, 
> $(BR2_TOOLCHAIN_EXTERNAL_STRIP)); \
>  done
> + $(call copy_toolchain_sysroot)
> \ No newline at end of file
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 
