From: Jean-Christian de Rivaz <jc@eclis.ch>
Date: Tue, 01 Apr 2008 13:09:41 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <20080331054204.ECD433C3A5@busybox.net>
References: <20080331054204.ECD433C3A5@busybox.net>
Message-ID: <47F217F5.5030908@eclis.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ulf at uclibc.org a ?crit :
> --- trunk/buildroot/target/linux/Makefile.in.advanced	2008-03-30 22:23:39 UTC (rev 21590)
> +++ trunk/buildroot/target/linux/Makefile.in.advanced	2008-03-31 05:42:03 UTC (rev 21591)
> @@ -103,7 +103,7 @@
>  endif
>  endif
>  
> -KERNEL_CONFIG_METHOD:=($(strip $(subst ",,$(BR2_KERNEL_CONFIG_METHOD))),)
> +KERNEL_CONFIG_METHOD:=$(strip $(subst ",,$(BR2_KERNEL_CONFIG_METHOD)))
>  #"))
>  ifeq ($(KERNEL_CONFIG_METHOD),)
>  KERNEL_CONFIG_METHOD:=xconfig
> @@ -335,7 +335,11 @@
>  		$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) $(KERNEL_CONFIG_METHOD) ; \
>  	fi
>  endif
> +ifneq ($(strip $(subst ",,$(BR2_EXTRA_VERSION))),)
> +	$(SED) 's,^EXTRA_VERSION=.*,EXTRA_VERSION=="$(BR2_EXTRA_VERSION)",g'
> +endif

This patch break the default compilation for AT91SAM9261 (make 
at91sam9261ek_defconfig && make) with the following error:

[...]
if [ ! -f 
"/home/jcdr/try/buildroot/project_build_arm/at91sam9261ek/linux-2.6.24.3/.config" 
] ; then \
                 /usr/bin/make -j2 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" 
ARCH=arm CFLAGS_KERNEL="-Os 
-I/home/jcdr/try/buildroot/build_arm/staging_dir/usr/include 
-I/home/jcdr/try/buildroot/build_arm/staging_dir/include 
--sysroot=/home/jcdr/try/buildroot/build_arm/staging_dir/ -is
ysroot /home/jcdr/try/buildroot/build_arm/staging_dir" 
INSTALL_MOD_PATH=/home/jcdr/try/buildroot/project_build_arm/at91sam9261ek/root 
CROSS_COMPILE=/home/jcdr/try/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc- 
LDFLAGS="-L/home/jcdr/try/buildroot/build_arm/staging_di
r/lib -L/home/jcdr/try/buildroot/build_arm/staging_dir/usr/lib 
--sysroot=/home/jcdr/try/buildroot/build_arm/staging_dir/" 
LZMA="/home/jcdr/try/buildroot/toolchain_build_arm/bin/lzma"  -C 
/home/jcdr/try/buildroot/project_build_arm/at91sam9261ek/linux-2.6.24.3 
xconfig ; \
         fi
/home/jcdr/try/buildroot/toolchain_build_arm/bin/sed -i -e 
's,^EXTRA_VERSION=.*,EXTRA_VERSION=="".""3"""",g'
/home/jcdr/try/buildroot/toolchain_build_arm/bin/sed: no input files
make: *** 
[/home/jcdr/try/buildroot/project_build_arm/at91sam9261ek/linux-2.6.24.3/.config] 
Erreur 4
